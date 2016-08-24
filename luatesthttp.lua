vcHttp =  require("socket.http")

local remoteUrl = "http://open.matchvs.com/wc4/getItemRank.do?&gameID=200495&item=extend_1&top=10"
  local response_body = {}

  vcHttp.TIMEOUT=1
  local status, code, response_headers,status2 = vcHttp.request
  {
    url = remoteUrl;
    method = "GET";
    sink = ltn12.sink.table(response_body);
  }
print ("status:"..status)
print ("code:"..code)
print ("status2:"..status2)
for k,v in pairs(response_headers) do						   --遍历table
	print (k.."--"..v)
end
for k,v in pairs(response_body) do                          --遍历table
    print (k.."--"..v)
end


if type(response_body) == "table" then
print(table.concat(response_body))
else
print("Not a table:", type(response_body))
end



print ("\n")
local host = "http://open.matchvs.com/wc4/getItemRank.do"
local body = "gameID=200495&item=extend_1&top=10"
local res, code, response_headers,status2 = vcHttp.request(host,body)


print ("code---:"..code)
for k,v in pairs(response_headers) do						   --遍历table
	print (k.."--"..v)
end
print ("status2--:"..status2)
print (res)



co = coroutine.create(function (a, b)
		print(1)
end)
print(coroutine.resume(co, 3, 8))


print("------------------------")



  local request_body = "gameID=200495&item=extend_1&top=10"
  local response_body = {}

  local res, code, response_headers = vcHttp.request{
      url = "http://open.matchvs.com/wc4/getItemRank.do?",
      method = "POST",
	  source = ltn12.source.string(request_body),
	  sink = ltn12.sink.table(response_body),
  }

  print(res)
  print(code)

  if type(response_headers) == "table" then
    for k, v in pairs(response_headers) do
      print(k, v)
    end
  end

  print("Response body:")
  if type(response_body) == "table" then
    print(table.concat(response_body))
  else
    print("Not a table:", type(response_body))
  end



