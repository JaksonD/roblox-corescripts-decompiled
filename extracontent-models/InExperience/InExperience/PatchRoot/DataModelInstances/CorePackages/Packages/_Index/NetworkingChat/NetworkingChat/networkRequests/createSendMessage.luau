local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.networkingChatTypes);
local v2 = require(l_Parent_0.CHAT_URL);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    return v3.roduxNetworking.POST({
        Name = "SendMessage"
    }, function(v4, v5, v6, v7) --[[ Line: 9 ]]
        -- upvalues: v2 (ref)
        return v4(v2):path("v2"):path("send-message"):body({
            message = v5, 
            conversationId = v6, 
            decorators = v7
        }):setStatusIds({
            v6
        });
    end);
end;