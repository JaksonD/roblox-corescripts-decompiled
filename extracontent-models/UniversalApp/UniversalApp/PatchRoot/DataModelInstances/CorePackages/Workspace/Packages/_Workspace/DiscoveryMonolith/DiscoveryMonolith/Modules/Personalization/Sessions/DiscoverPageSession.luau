local l_HttpService_0 = game:GetService("HttpService");
return {
    _sessionId = "", 
    Get = function(v1) --[[ Line: 9 ]] --[[ Name: Get ]]
        -- upvalues: l_HttpService_0 (copy)
        if v1._sessionId == "" then
            v1._sessionId = l_HttpService_0:GenerateGUID(false);
        end;
        return v1._sessionId;
    end, 
    Refresh = function(v2) --[[ Line: 16 ]] --[[ Name: Refresh ]]
        -- upvalues: l_HttpService_0 (copy)
        v2._sessionId = l_HttpService_0:GenerateGUID(false);
        return v2._sessionId;
    end
};