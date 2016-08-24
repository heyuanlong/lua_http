matchvs =  require("matchvs_server_sdk_plugin")


matchvs:matchvsInit("IDLDIldi3dsdsaf","1111c06fc81d4d15b748233cedc61111")

matchvs:setEnv(1)


--1.检验
local res ,url,body = matchvs:cpAuth(102000,1470968389)
print (url.."?"..body)
print (res)

--2消耗
local res ,url,body = matchvs:spend(102000,32,1,"hi")
print (url.."?"..body)
print (res)

--3.兑换
local res ,url,body = matchvs:exchange(102000,32,1,"hi")
print (url.."?"..body)
print (res)

--4.后台发放商品
local res ,url,body = matchvs:sendGoods(102000,32,1,"hi")
print (url.."?"..body)
print (res)

--5.支付回调协议（待议）
--local res ,url,body = (matchvs:payBack(102000,32,1,"hi")
--print (url.."?"..body)
--print(res)

--6.用户信息获取
local res ,url,body = matchvs:getUsersInfo(102000, {23,32})
print (url.."?"..body)
print (res)


--7.用户战况上报·
local scores = {}
scores[1]={}
scores[1].userID = 23
scores[1].a = 2
scores[1].b = 2
scores[1].c = 200
scores[1].extend = {}
scores[2]={}
scores[2].userID = 32
scores[2].a = 0
scores[2].b = 0
scores[2].c = 100
scores[2].extend = {}
local res ,url,body = matchvs:battleRecord(102000,1111,111,scores)
print (url.."?"..body)
print (res)

--8.获取用户商品信息
local res ,url,body = matchvs:getProductsInfo(102000,32)
print (url.."?"..body)
print (res)

--09检查有无此场次[新增于1.4]
local res ,url,body = matchvs:checkField(102000,1,1130)
print (url.."?"..body)
print (res)

--10检测场次是否可以进入[新增于1.4]
local res ,url,body = matchvs:checkUserField(102000,23,1130)
print (url.."?"..body)
print (res)

--11锁住用户商品[新增于1.4]
local res ,url,body = matchvs:lockUserField(102000,38304,1130)
print (url.."?"..body)
print (res)

--12解锁用户商品[新增于1.4]
local res ,url,body = matchvs:unLockUserField(102000,38304,1130,24763)
print (url.."?"..body)
print (res)

--13进场消费[新增于1.4]
local res ,url,body = matchvs:spendUserField(102000,38304,1130,24763)
print (url.."?"..body)
print (res)

--14仲裁处理（只处理不仲裁）[新增于1.4]
local res ,url,body = matchvs:dealUserField(102000,23,1130,2,1)
print (url.."?"..body)
print (res)
