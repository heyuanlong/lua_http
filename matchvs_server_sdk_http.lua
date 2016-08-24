socketHttp =  require("socket.http")
MatchvsCommon =  require("common.matchvs_server_sdk_common")


--md5=require("md5")

_M={}

_M.UrlOpenHostTest      =       "http://testopen.matchvs.com"
_M.UrlOpenHost          =       "http://open.matchvs.com"

--测试环境 为1 正式环境为0,默认测试环境
_M.environment          =       1


function _M:http_setEnv(env)
	self.environment = env
end
function _M:http_getEnv()
	return self.environment
end


function _M:http_getHost()
	if self.environment == 0 then
		return self.UrlOpenHost
	else
		return self.UrlOpenHostTest
	end
end


--检验
function _M:http_cpAuth(gameID,authTime,appkey,appSecret)
	local url = self:http_getHost().."/wc6/cpAuth"
	local signtable = {
	gameID = gameID,
	authTime = authTime,
	}
	local sign, msg = MatchvsCommon:makeSignCommon(signtable,"&",appkey,appSecret)

	local bodytable = {
		gameID = gameID,
		authTime = authTime,
		sign = sign,
	}

	local body = MatchvsCommon:geturlbody(bodytable)
	return socketHttp.request(url,body),url,body
end

--消耗
function _M:http_spend(gameID,userID,goodsID,payload,appkey,appSecret)
	local url = self:http_getHost().."/wc6/spend"
	local signtable = {
	gameID = gameID,
	userID = userID,
	goodsID = goodsID,
	payload = payload,
	}
	local sign, msg = MatchvsCommon:makeSignCommon(signtable,"&",appkey,appSecret)

	local bodytable = MatchvsCommon:tableadditem(signtable,"sign",sign)
	local body = MatchvsCommon:geturlbody(bodytable)

	return socketHttp.request(url,body),url,body
end

--兑换
function _M:http_exchange(gameID,userID,goodsID,payload,appkey,appSecret)

	local url = self:http_getHost().."/wc6/exchange"
	local signtable = {
	gameID = gameID,
	userID = userID,
	goodsID = goodsID,
	payload = payload,
	}
	local sign, msg = MatchvsCommon:makeSignCommon(signtable,"&",appkey,appSecret)

	local bodytable = MatchvsCommon:tableadditem(signtable,"sign",sign)
	local body = MatchvsCommon:geturlbody(bodytable)

	return socketHttp.request(url,body)	,url,body

end


--后台发放商品
function _M:http_sendGoods(gameID,userID,goodsID,payload,appkey,appSecret)

	local url = self:http_getHost().."/wc6/sendGoods"
	local signtable = {
	gameID = gameID,
	userID = userID,
	goodsID = goodsID,
	payload = payload,
	}
	local sign, msg = MatchvsCommon:makeSignCommon(signtable,"&",appkey,appSecret)

	local bodytable = MatchvsCommon:tableadditem(signtable,"sign",sign)
	local body = MatchvsCommon:geturlbody(bodytable)

	return socketHttp.request(url,body),url,body

end


--支付回调协议
function _M:http_payBack(gameID,userID,goodsID,payload,state,appkey,appSecret)

	local url = self:http_getHost().."/wc6/payBack"
	local signtable = {
	gameID = gameID,
	userID = userID,
	goodsID = goodsID,
	payload = payload,
	state = state,
	}
	local sign, msg = MatchvsCommon:makeSignCommon(signtable,"&",appkey,appSecret)

	local bodytable = MatchvsCommon:tableadditem(signtable,"sign",sign)
	local body = MatchvsCommon:geturlbody(bodytable)

	return socketHttp.request(url,body)	,url,body

end

--用户信息获取
function _M:http_getUsersInfo(gameID,userIDList,appkey,appSecret)

	local url = self:http_getHost().."/wc6/getUsersInfo"

	local useridliststr = ""
	for i, key in ipairs(userIDList) do
        useridliststr = useridliststr..key..","
    end
    useridliststr = string.sub(useridliststr,1,#useridliststr-1)
	
	local signtable = {
	gameID = gameID,
	userIDList = useridliststr,
	}
	local sign, msg = MatchvsCommon:makeSignCommon(signtable,"&",appkey,appSecret)

	local bodytable = MatchvsCommon:tableadditem(signtable,"sign",sign)
	local body = MatchvsCommon:geturlbody(bodytable)

	return socketHttp.request(url,body)	,url,body

end

--用户战况上报
function _M:http_battleRecord(gameID,roomID,roundID,scores,appkey,appSecret)


	local url = self:http_getHost().."/wc6/battleRecord"

	local signS ="["
	local bodyS ="["
	local sn = 0
	for k,v in pairs(scores) do
	    local userID = v.userID
	    local a = v.a
	    local b = v.b
	    local c = v.c
	    local extend = v.extend
	    if sn ~= 0 then
	        signS = signS .. ","
	        bodyS = bodyS .. ","
	    end
	    signS = signS .. "{userID="..userID.."&a="..a.."&b="..b.."&c="..c.."&extend=["
	    bodyS = bodyS .. "{\"userID\":"..userID..",\"a\":"..a..",\"b\":"..b..",\"c\":"..c..",\"extend\":["
	    local en = 0
	    for ek,ev  in pairs(extend) do
	        if en ~= 0 then
	            signS = signS .. ","
	            bodyS = bodyS .. ","
	        end
	        en = en + 1
	        signS =  signS..ev
	        bodyS =  bodyS..ev
	    end
	    signS = signS .. "]}"
	    bodyS = bodyS .. "]}"
	    sn = sn + 1
	end
	signS = signS .."]"
	bodyS = bodyS .."]"

	local signtable = {
	gameID = gameID,
	roomID = roomID,
	roundID = roundID,
	scores = signS,
	}
	local sign, msg = MatchvsCommon:makeSignCommon(signtable,"&",appkey,appSecret)
	signtable.scores = nil
	local bodytable = MatchvsCommon:tableadditem(signtable,"sign",sign)
	local body = MatchvsCommon:geturlbody(bodytable)
	body = body..'data={"scores":'..bodyS..'}'

	return socketHttp.request(url,body)	,url,body

end

--获取用户商品信息
function _M:http_getProductsInfo(gameID,userID,appkey,appSecret)

	local url = self:http_getHost().."/wc6/getProductsInfo"
	local signtable = {
	gameID = gameID,
	userID = userID,
	}
	local sign, msg = MatchvsCommon:makeSignCommon(signtable,"&",appkey,appSecret)

	local bodytable = MatchvsCommon:tableadditem(signtable,"sign",sign)
	local body = MatchvsCommon:geturlbody(bodytable)

	return socketHttp.request(url,body)	,url,body

end

--09检查有无此场次[新增于1.4]
function _M:http_checkField(gameID,versionGame,fieldID,appkey,appSecret)
	local url = self:http_getHost().."/wc6/checkField"
	local signtable = {
	gameID = gameID,
	versionGame = versionGame,
	fieldID = fieldID,
	}
	local sign, msg = MatchvsCommon:makeSignCommon(signtable,"&",appkey,appSecret)

	local bodytable = MatchvsCommon:tableadditem(signtable,"sign",sign)
	local body = MatchvsCommon:geturlbody(bodytable)

	return socketHttp.request(url,body)	,url,body
end
--10检测场次是否可以进入[新增于1.4]
function _M:http_checkUserField(gameID,userID,fieldID,appkey,appSecret)
	local url = self:http_getHost().."/wc6/checkUserField"
	local signtable = {
	gameID = gameID,
	userID = userID,
	fieldID = fieldID,
	}
	local sign, msg = MatchvsCommon:makeSignCommon(signtable,"&",appkey,appSecret)

	local bodytable = MatchvsCommon:tableadditem(signtable,"sign",sign)
	local body = MatchvsCommon:geturlbody(bodytable)

	return socketHttp.request(url,body)	,url,body
end
--11锁住用户商品[新增于1.4]
function _M:http_lockUserField(gameID,userID,fieldID,appkey,appSecret)
	local url = self:http_getHost().."/wc6/lockUserField"
	local signtable = {
	gameID = gameID,
	userID = userID,
	fieldID = fieldID,
	}
	local sign, msg = MatchvsCommon:makeSignCommon(signtable,"&",appkey,appSecret)

	local bodytable = MatchvsCommon:tableadditem(signtable,"sign",sign)
	local body = MatchvsCommon:geturlbody(bodytable)

	return socketHttp.request(url,body)	,url,body
end
--12解锁用户商品[新增于1.4]
function _M:http_unLockUserField(gameID,userID,fieldID,lockID,appkey,appSecret)
	local url = self:http_getHost().."/wc6/unLockUserField"
	local signtable = {
	gameID = gameID,
	userID = userID,
	fieldID = fieldID,
	lockID = lockID,
	}
	local sign, msg = MatchvsCommon:makeSignCommon(signtable,"&",appkey,appSecret)

	local bodytable = MatchvsCommon:tableadditem(signtable,"sign",sign)
	local body = MatchvsCommon:geturlbody(bodytable)

	return socketHttp.request(url,body)	,url,body
end
--13进场消费[新增于1.4]
function _M:http_spendUserField(gameID,userID,fieldID,lockID,appkey,appSecret)
	local url = self:http_getHost().."/wc6/spendUserField"
	local signtable = {
	gameID = gameID,
	userID = userID,
	fieldID = fieldID,
	lockID = lockID,
	}
	local sign, msg = MatchvsCommon:makeSignCommon(signtable,"&",appkey,appSecret)

	local bodytable = MatchvsCommon:tableadditem(signtable,"sign",sign)
	local body = MatchvsCommon:geturlbody(bodytable)

	return socketHttp.request(url,body)	,url,body
end
--14仲裁处理（只处理不仲裁）[新增于1.4]
function _M:http_dealUserField(gameID,userID,fieldID,userCount,state,appkey,appSecret)
	local url = self:http_getHost().."/wc6/dealUserField"
	local signtable = {
	gameID = gameID,
	userID = userID,
	fieldID = fieldID,
	userCount = userCount,
	state = state,
	}
	local sign, msg = MatchvsCommon:makeSignCommon(signtable,"&",appkey,appSecret)

	local bodytable = MatchvsCommon:tableadditem(signtable,"sign",sign)
	local body = MatchvsCommon:geturlbody(bodytable)

	return socketHttp.request(url,body)	,url,body
end



return _M

