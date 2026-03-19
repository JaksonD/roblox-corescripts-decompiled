local l_HttpService_0 = game:GetService("HttpService");
return {
    enc = function(v1) --[[ Line: 5 ]] --[[ Name: enc ]]
        -- upvalues: l_HttpService_0 (copy)
        return l_HttpService_0:JSONEncode(v1);
    end, 
    dec = function(v2) --[[ Line: 9 ]] --[[ Name: dec ]]
        -- upvalues: l_HttpService_0 (copy)
        return l_HttpService_0:JSONDecode(v2);
    end
};