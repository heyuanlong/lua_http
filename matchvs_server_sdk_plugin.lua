MatchvsHttp =  require("matchvs_server_sdk_http")

_M = {}
_M.appkey				=		""
_M.appSecret			=		""

--����appkey��appSecret
function _M:matchvsInit(appkey,appSecret)
	self.appkey = appkey
	self.appSecret = appSecret
end
function _M:setEnv(env)
	MatchvsHttp:http_setEnv(env)
end


--����
function _M:cpAuth(gameID,authTime)
	return MatchvsHttp:http_cpAuth(gameID,authTime,self.appkey,self.appSecret)
end

--����
function _M:spend(gameID,userID,goodsID,payload)
	return MatchvsHttp:http_spend(gameID,userID,goodsID,payload,self.appkey,self.appSecret)
end

--�һ�
function _M:exchange(gameID,userID,goodsID,payload)
	return MatchvsHttp:http_exchange(gameID,userID,goodsID,payload,self.appkey,self.appSecret)
end


--��̨������Ʒ
function _M:sendGoods(gameID,userID,goodsID,payload)
		return MatchvsHttp:http_sendGoods(gameID,userID,goodsID,payload,self.appkey,self.appSecret)
end


--֧���ص�Э��
function _M:payBack(gameID,userID,goodsID,payload,state)
	return MatchvsHttp:http_payBack(gameID,userID,goodsID,payload,state,self.appkey,self.appSecret)
end

--�û���Ϣ��ȡ
function _M:getUsersInfo(gameID,userIDList)
	return MatchvsHttp:http_getUsersInfo(gameID,userIDList,self.appkey,self.appSecret)
end

--�û�ս���ϱ�
function _M:battleRecord(gameID,roomID,roundID,scores)
	return MatchvsHttp:http_battleRecord(gameID,roomID,roundID,scores,self.appkey,self.appSecret)
end

--��ȡ�û���Ʒ��Ϣ
function _M:getProductsInfo(gameID,userID)
	return MatchvsHttp:http_getProductsInfo(gameID,userID,self.appkey,self.appSecret)
end


--09������޴˳���[������1.4]
function _M:checkField(gameID,versionGame,fieldID)
	return MatchvsHttp:http_checkField(gameID,versionGame,fieldID,self.appkey,self.appSecret)
end

--10��ⳡ���Ƿ���Խ���[������1.4]
function _M:checkUserField(gameID,userID,fieldID)
	return MatchvsHttp:http_checkUserField(gameID,userID,fieldID,self.appkey,self.appSecret)
end

--11��ס�û���Ʒ[������1.4]
function _M:lockUserField(gameID,userID,fieldID)
	return MatchvsHttp:http_lockUserField(gameID,userID,fieldID,self.appkey,self.appSecret)
end

--12�����û���Ʒ[������1.4]
function _M:unLockUserField(gameID,userID,fieldID,lockID)
	return MatchvsHttp:http_unLockUserField(gameID,userID,fieldID,lockID,self.appkey,self.appSecret)
end

--13��������[������1.4]
function _M:spendUserField(gameID,userID,fieldID,lockID)
	return MatchvsHttp:http_spendUserField(gameID,userID,fieldID,lockID,self.appkey,self.appSecret)
end

--14�ٲô���ֻ�����ٲã�[������1.4]
function _M:dealUserField(gameID,userID,fieldID,userCount,state)
	return MatchvsHttp:http_dealUserField(gameID,userID,fieldID,userCount,state,self.appkey,self.appSecret)
end

return _M

