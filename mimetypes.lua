-- mimetypes.lua

--[[
Copyright (c) 2011 Matthew "LeafStorm" Frazier

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

======

In addition, the MIME types contained in the Software were
originally obtained from the Python 2.7.1 ``mimetypes.py`` module,
though they have been considerably modified and augmented.
Said file was made available under the Python Software Foundation
license (http://python.org/psf/license/).
]]

-- This table is the one that actually contains the exported functions.

local mimetypes = {}


-- Extracts the extension from a filename and returns it.
-- The extension must be at the end of the string, and preceded by a dot and
-- at least one other character. Only the last part will be returned (so
-- "package-1.2.tar.gz" will return "gz").
-- If there is no extension, this function will return nil.

local function extension (filename)
    return filename:match(".+%.([%a%d]+)$")
end


-- Creates a deep copy of the given table.

local function copy (tbl)
    local ntbl = {}
    for key, value in pairs(tbl) do
        if type(value) == 'table' then
            ntbl[key] = copy(value)
        else
            ntbl[key] = value
        end
    end
    return ntbl
end


-- This is the default MIME type database.
-- It is a table with two members - "extensions" and "filenames".
-- The filenames table maps complete file names (like README) to MIME types.
-- The extensions just maps the files' extensions (like jpg) to types.

local defaultdb = {extensions = {}, filenames = {}}

local extensions = defaultdb.extensions
local filenames = defaultdb.filenames

-- The MIME types are sorted first by major type ("application/"), then by
-- extension. Remember to not include the dot on the extension.

-- application/
extensions['a'] = 'application/octet-stream'
extensions['ai'] = 'application/postscript'
extensions['atom'] = 'application/atom+xml'
extensions['bcpio'] = 'application/x-bcpio'
extensions['bin'] = 'application/octet-stream'
extensions['cdf'] = 'application/x-netcdf'
extensions['cpio'] = 'application/x-cpio'
extensions['csh'] = 'application/x-csh'
extensions['dll'] = 'application/octet-stream'
extensions['dmg'] = 'application/x-apple-diskimage'
extensions['doc'] = 'application/msword'
extensions['docx'] = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
extensions['dot'] = 'application/msword'
extensions['dvi'] = 'application/x-dvi'
extensions['eps'] = 'application/postscript'
extensions['exe'] = 'application/octet-stream'
extensions['gtar'] = 'application/x-gtar'
extensions['gz'] = 'application/x-gzip'
extensions['hdf'] = 'application/x-hdf'
extensions['hqx'] = 'application/mac-binhex40'
extensions['js'] = 'application/javascript'
extensions['json'] = 'application/json'
extensions['latex'] = 'application/x-latex'
extensions['man'] = 'application/x-troff-man'
extensions['me'] = 'application/x-troff-me'
extensions['mif'] = 'application/x-mif'
extensions['ms'] = 'application/x-troff-ms'
extensions['nc'] = 'application/x-netcdf'
extensions['o'] = 'application/octet-stream'
extensions['obj'] = 'application/octet-stream'
extensions['oda'] = 'application/oda'
extensions['odt'] = 'application/vnd.oasis.opendocument.text'
extensions['odp'] = 'application/vnd.oasis.opendocument.presentation'
extensions['ods'] = 'application/vnd.oasis.opendocument.spreadsheet'
extensions['odg'] = 'application/vnd.oasis.opendocument.graphics'
extensions['p12'] = 'application/x-pkcs12'
extensions['p7c'] = 'application/pkcs7-mime'
extensions['pdf'] = 'application/pdf'
extensions['pfx'] = 'application/x-pkcs12'
extensions['pot'] = 'application/vnd.ms-powerpoint'
extensions['ppa'] = 'application/vnd.ms-powerpoint'
extensions['pps'] = 'application/vnd.ms-powerpoint'
extensions['ppt'] = 'application/vnd.ms-powerpoint'
extensions['pptx'] = 'application/vnd.openxmlformats-officedocument.presentationml.presentation'
extensions['ps'] = 'application/postscript'
extensions['pwz'] = 'application/vnd.ms-powerpoint'
extensions['pyc'] = 'application/x-python-code'
extensions['pyo'] = 'application/x-python-code'
extensions['ram'] = 'application/x-pn-realaudio'
extensions['rar'] = 'application/x-rar-compressed'
extensions['rdf'] = 'application/rdf+xml'
extensions['rss'] = 'application/rss+xml'
extensions['rtf'] = 'application/rtf'
extensions['roff'] = 'application/x-troff'
extensions['sh'] = 'application/x-sh'
extensions['shar'] = 'application/x-shar'
extensions['sit'] = 'application/x-stuffit'
extensions['smil'] = 'application/smil+xml'
extensions['so'] = 'application/octet-stream'
extensions['src'] = 'application/x-wais-source'
extensions['sv4cpio'] = 'application/x-sv4cpio'
extensions['sv4crc'] = 'application/x-sv4crc'
extensions['swf'] = 'application/x-shockwave-flash'
extensions['t'] = 'application/x-troff'
extensions['tar'] = 'application/x-tar'
extensions['tcl'] = 'application/x-tcl'
extensions['tex'] = 'application/x-tex'
extensions['texi'] = 'application/x-texinfo'
extensions['texinfo'] = 'application/x-texinfo'
extensions['tr'] = 'application/x-troff'
extensions['ustar'] = 'application/x-ustar'
extensions['wiz'] = 'application/msword'
extensions['wsdl'] = 'application/wsdl+xml'
extensions['xht'] = 'application/xhtml+xml'
extensions['xhtml'] = 'application/xhtml+xml'
extensions['xlb'] = 'application/vnd.ms-excel'
extensions['xls'] = 'application/vnd.ms-excel'
extensions['xlsx'] = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
extensions['xpdl'] = 'application/xml'
extensions['xsl'] = 'application/xml'
extensions['xul'] = 'application/vnd.mozilla.xul+xml'
extensions['zip'] = 'application/zip'

-- audio/
extensions['aif'] = 'audio/x-aiff'
extensions['aifc'] = 'audio/x-aiff'
extensions['aiff'] = 'audio/x-aiff'
extensions['au'] = 'audio/basic'
extensions['flac'] = 'audio/x-flac'
extensions['mid'] = 'audio/midi'
extensions['midi'] = 'audio/midi'
extensions['mp2'] = 'audio/mpeg'
extensions['mp3'] = 'audio/mpeg'
extensions['oga'] = 'audio/ogg'
extensions['ogg'] = 'audio/ogg'
extensions['ra'] = 'audio/x-pn-realaudio'
extensions['snd'] = 'audio/basic'
extensions['wav'] = 'audio/x-wav'

-- image/
extensions['bmp'] = 'image/x-ms-bmp'
extensions['djv'] = 'image/vnd.djvu'
extensions['djvu'] = 'image/vnd.djvu'
extensions['gif'] = 'image/gif'
extensions['ico'] = 'image/vnd.microsoft.icon'
extensions['ief'] = 'image/ief'
extensions['jpe'] = 'image/jpeg'
extensions['jpeg'] = 'image/jpeg'
extensions['jpg'] = 'image/jpeg'
extensions['pbm'] = 'image/x-portable-bitmap'
extensions['pgm'] = 'image/x-portable-graymap'
extensions['png'] = 'image/png'
extensions['pnm'] = 'image/x-portable-anymap'
extensions['ppm'] = 'image/x-portable-pixmap'
extensions['ras'] = 'image/x-cmu-raster'
extensions['rgb'] = 'image/x-rgb'
extensions['svg'] = 'image/svg+xml'
extensions['svgz'] = 'image/svg+xml'
extensions['tif'] = 'image/tiff'
extensions['tiff'] = 'image/tiff'
extensions['xbm'] = 'image/x-xbitmap'
extensions['xpm'] = 'image/x-xpixmap'
extensions['xwd'] = 'image/x-xwindowdump'

-- message/
extensions['eml'] = 'message/rfc822'
extensions['mht'] = 'message/rfc822'
extensions['mhtml'] = 'message/rfc822'
extensions['nws'] = 'message/rfc822'

-- text/
extensions['bat'] = 'text/plain'
extensions['c'] = 'text/plain'
extensions['css'] = 'text/css'
extensions['csv'] = 'text/csv'
extensions['etx'] = 'text/x-setext'
extensions['h'] = 'text/plain'
extensions['htm'] = 'text/html'
extensions['html'] = 'text/html'
extensions['ics'] = 'text/calendar'
extensions['ksh'] = 'text/plain'
extensions['lua'] = 'text/x-lua'
extensions['md'] = 'text/x-markdown'
extensions['pl'] = 'text/plain'
extensions['py'] = 'text/x-python'
extensions['rb'] = 'text/x-ruby'
extensions['rtx'] = 'text/richtext'
extensions['sgm'] = 'text/x-sgml'
extensions['sgml'] = 'text/x-sgml'
extensions['tsv'] = 'text/tab-separated-values'
extensions['txt'] = 'text/plain'
extensions['vcf'] = 'text/x-vcard'
extensions['xml'] = 'text/xml'

-- video/
extensions['avi'] = 'video/x-msvideo'
extensions['m1v'] = 'video/mpeg'
extensions['mov'] = 'video/quicktime'
extensions['movie'] = 'video/x-sgi-movie'
extensions['mp4'] = 'video/mp4'
extensions['mpa'] = 'video/mpeg'
extensions['mpe'] = 'video/mpeg'
extensions['mpeg'] = 'video/mpeg'
extensions['mpg'] = 'video/mpeg'
extensions['ogv'] = 'video/ogg'
extensions['qt'] = 'video/quicktime'

-- This contains filename overrides for certain files, like README files.
-- Sort them in the same order as extensions.

filenames['COPYING'] = 'text/plain'
filenames['LICENSE'] = 'text/plain'
filenames['Makefile'] = 'text/x-makefile'
filenames['README'] = 'text/plain'


-- Creates a copy of the MIME types database for customization.

function mimetypes.copy (db)
    db = db or defaultdb
    return copy(db)
end


-- Guesses the MIME type of the file with the given name.
-- It is returned as a string. If the type cannot be guessed, then nil is
-- returned.

function mimetypes.guess (filename, db)
    db = db or defaultdb
    if db.filenames[filename] then
        return db.filenames[filename]
    end
    local ext = extension(filename)
    if ext then
        return db.extensions[ext]
    end
    return nil
end

return mimetypes
