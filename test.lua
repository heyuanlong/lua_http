matchvs =  require("matchvs_server_sdk_plugin")


matchvs:matchvsInit("IDLDIldi3dsdsaf","1111c06fc81d4d15b748233cedc61111")
matchvs:setEnv(1)
print (matchvs:cpAuth(102000,1470968389))
print (matchvs:spend(102000,32,1,"hi"))
print (matchvs:exchange(102000,32,1,"hi"))
print (matchvs:sendGoods(102000,32,1,"hi"))
--print (matchvs:payBack(102000,32,1,"hi"))
print (matchvs:getUsersInfo(102000, {23,32}))
--print (matchvs:battleRecord(102000,32,1,"hi"))
print (matchvs:getProductsInfo(102000,32))

