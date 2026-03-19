local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.networkingChatTypes);
local v2 = require(l_Parent_0.CHAT_URL);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    return v3.roduxNetworking.GET({
        Name = "GetMessages"
    }, function(v4, v5, v6, v7) --[[ Line: 9 ]]
        -- upvalues: v2 (ref)
        return v4(v2):path("v2"):path("get-messages"):queryArgs({
            conversationId = v5, 
            pageSize = v6, 
            exclusiveStartMessageId = v7
        }):setStatusIds({
            v5
        });
    end);
end;