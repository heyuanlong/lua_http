md5=require("common.md5.md5")


_M = {}


function _M:geturlbody(t)
	if type(t) ~= "table" then
        return nil, "param must be a table"
    end
	local str = ""
    for k, v in pairs(t) do
        str = str..k.."="..v.."&"
    end
	return str,""
end
function _M:tableadditem(t,key,value)
	if type(t) ~= "table" then
        return nil, "param must be a table"
    end

	local new_table ={}
    for k, v in pairs(t) do
        new_table[k] = v
    end
	new_table[key] = value


	return new_table,""
end



function _M:makeSignCommon(params, separator, headKey, tailKey)
    if type(params) ~= "table" then
        return nil, "first param must be a table"
    end

    separator       = separator or ""
    headKey         = headKey or ""
    tailKey         = tailKey or ""

    local sorted    = {}

    for k,v in pairs(params) do
        table.insert(sorted, k)
    end

    table.sort(sorted)
    local str = headKey..separator

    for i, key in ipairs(sorted) do
        str = str..key.."="..params[key]..separator
    end

    str = str..tailKey
    local value = md5:sumhexa(str)
    return value, str
end

return _M
