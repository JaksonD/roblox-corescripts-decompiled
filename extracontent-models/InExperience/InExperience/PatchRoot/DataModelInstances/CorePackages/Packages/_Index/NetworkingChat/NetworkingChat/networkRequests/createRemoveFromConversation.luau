local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.networkingChatTypes);
local v2 = require(l_Parent_0.CHAT_URL);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    return v3.roduxNetworking.POST({
        Name = "RemoveFromConversation"
    }, function(v4, v5, v6) --[[ Line: 9 ]]
        -- upvalues: v2 (ref)
        return v4(v2):path("v2"):path("remove-from-conversation"):body({
            participantUserId = v5, 
            conversationId = v6
        }):setStatusIds({
            v6
        });
    end);
end;