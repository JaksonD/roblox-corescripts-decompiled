local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Network.Url);
return function(v3, v4, _) --[[ Line: 7 ]]
    -- upvalues: l_HttpService_0 (copy), v2 (copy)
    local v6 = l_HttpService_0:JSONEncode({
        participantuserId = v4
    });
    return v3(string.format("%s/start-one-to-one-conversation", v2.CHAT_URL), "POST", {
        postBody = v6
    });
end;