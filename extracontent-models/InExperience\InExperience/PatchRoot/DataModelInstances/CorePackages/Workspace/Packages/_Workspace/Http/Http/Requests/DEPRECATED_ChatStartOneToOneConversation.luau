local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Url);
return function(v2, v3, _) --[[ Line: 6 ]]
    -- upvalues: l_HttpService_0 (copy), v1 (copy)
    local v5 = l_HttpService_0:JSONEncode({
        participantuserId = v3
    });
    return v2(string.format("%s/start-one-to-one-conversation", v1.CHAT_URL), "POST", {
        postBody = v5
    });
end;