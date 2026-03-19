local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Network.Url);
return function(v3, v4, v5, v6) --[[ Line: 7 ]]
    -- upvalues: l_HttpService_0 (copy), v2 (copy)
    assert(v3, "requestImpl is required");
    assert(v4, "conversationId is required");
    assert(v5, "universeId is required");
    local v7 = l_HttpService_0:JSONEncode({
        conversationId = v4, 
        universeId = v5, 
        decorators = v6
    });
    return v3(string.format("%s/send-game-link-message", v2.CHAT_URL), "POST", {
        postBody = v7
    });
end;