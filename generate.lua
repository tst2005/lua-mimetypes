-- add support to media types described in RFC 4288.
-- ... apache seems to be precise with that

local io = require('io')
local string = require('string')

local len, format, match, gmatch, rep, popen, lines, open =
  string.len, string.format, string.match, string.gmatch, string.rep, io.popen, io.lines, io.open

local apache_mimetypes_url = "http://svn.apache.org/repos/asf/httpd/httpd/trunk/docs/conf/mime.types"

local function exec(command)
  local cmd = popen(command, 'r')
  cmd:read '*all'
  return cmd:close()
end

if not exec(format("curl %s --silent -o _tmp_ && sed '/^#/d' <_tmp_ >> mimetypes && rm _tmp_", apache_mimetypes_url)) then
  error 'fail to get mimetypes'
end

print 'processing mimetypes file'

local mime_types, longest = {}, 0

for line in lines('./mimetypes') do
  local _type, extensions = match(line, '([^%s]+)%s*([^$]+)')
  for extension in gmatch(extensions, '%s*([^%s]+)%s*') do
    mime_types[extension] = _type
    longest = longest < len(extension) and len(extension) or longest
  end
  longest = longest + 1
end

if not exec('rm mimetypes') then
  error 'fail to remove mimetypes'
end

local mime = open('mimes', 'w')

mime:write 'extensions = {\n'
for extension, _type in pairs(mime_types) do
  mime:write(format("  ['%s']%s= '%s',\n", extension, rep(' ', longest - len(extension)), _type))
end
mime:write '}'

if not mime:close() then
  error 'fail to compile mimetypes'
end
--[[
if not exec('rm mime') then
  error 'fail to remove mimetypes'
end
]]

print 'done'