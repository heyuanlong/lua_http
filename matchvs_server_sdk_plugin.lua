MatchvsHttp =  require("matchvs_server_sdk_http")

_M = {}
_M.appkey				=		""
_M.appSecret			=		""

--设置appkey和appSecret
function _M:matchvsInit(appkey,appSecret)
	self.appkey = appkey
	self.appSecret = appSecret
end
function _M:setEnv(env)
	MatchvsHttp:http_setEnv(env)
end


--检验
function _M:cpAuth(gameID,authTime)
	return MatchvsHttp:http_cpAuth(gameID,authTime,self.appkey,self.appSecret)
end

--消耗
function _M:spend(gameID,userID,goodsID,payload)
	return MatchvsHttp:http_spend(gameID,userID,goodsID,payload,self.appkey,self.appSecret)
end

--兑换
function _M:exchange(gameID,userID,goodsID,payload)
	return MatchvsHttp:http_exchange(gameID,userID,goodsID,payload,self.appkey,self.appSecret)
end


--后台发放商品
function _M:sendGoods(gameID,userID,goodsID,payload)
		return MatchvsHttp:http_sendGoods(gameID,userID,goodsID,payload,self.appkey,self.appSecret)
end


--支付回调协议
function _M:payBack(gameID,userID,goodsID,payload,state)
	return MatchvsHttp:http_payBack(gameID,userID,goodsID,payload,state,self.appkey,self.appSecret)
end

--用户信息获取
function _M:getUsersInfo(gameID,userIDList)
	return MatchvsHttp:http_getUsersInfo(gameID,userIDList,self.appkey,self.appSecret)
end

--用户战况上报
function _M:battleRecord(gameID,roomID,roundID,scores)
	return MatchvsHttp:http_battleRecord(gameID,roomID,roundID,scores,self.appkey,self.appSecret)
end

--获取用户商品信息
function _M:getProductsInfo(gameID,userID)
	return MatchvsHttp:http_getProductsInfo(gameID,userID,self.appkey,self.appSecret)
end


--09检查有无此场次[新增于1.4]
function _M:checkField(gameID,versionGame,fieldID)
	return MatchvsHttp:http_checkField(gameID,versionGame,fieldID,self.appkey,self.appSecret)
end

--10检测场次是否可以进入[新增于1.4]
function _M:checkUserField(gameID,userID,fieldID)
	return MatchvsHttp:http_checkUserField(gameID,userID,fieldID,self.appkey,self.appSecret)
end

--11锁住用户商品[新增于1.4]
function _M:lockUserField(gameID,userID,fieldID)
	return MatchvsHttp:http_lockUserField(gameID,userID,fieldID,self.appkey,self.appSecret)
end

--12解锁用户商品[新增于1.4]
function _M:unLockUserField(gameID,userID,fieldID,lockID)
	return MatchvsHttp:http_unLockUserField(gameID,userID,fieldID,lockID,self.appkey,self.appSecret)
end

--13进场消费[新增于1.4]
function _M:spendUserField(gameID,userID,fieldID,lockID)
	return MatchvsHttp:http_spendUserField(gameID,userID,fieldID,lockID,self.appkey,self.appSecret)
end

--14仲裁处理（只处理不仲裁）[新增于1.4]
function _M:dealUserField(gameID,userID,fieldID,userCount,state)
	return MatchvsHttp:http_dealUserField(gameID,userID,fieldID,userCount,state,self.appkey,self.appSecret)
end

return _M

