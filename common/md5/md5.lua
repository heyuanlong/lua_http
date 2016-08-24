
local core = require"md5.core"
local string = require"string"

_M={}

function _M:sumhexa (k)
  k = core.sum(k)
  return (string.gsub(k, ".", function (c)
           return string.format("%02x", string.byte(c))
         end))
end

return _M