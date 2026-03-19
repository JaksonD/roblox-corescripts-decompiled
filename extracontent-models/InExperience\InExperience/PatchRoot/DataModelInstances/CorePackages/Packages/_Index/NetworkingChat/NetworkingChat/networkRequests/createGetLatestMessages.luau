local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.networkingChatTypes);
local v2 = require(l_Parent_0.CHAT_URL);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    return v3.roduxNetworking.GET({
        Name = "GetLatestMessages"
    }, function(v4, v5, v6) --[[ Line: 9 ]]
        -- upvalues: v2 (ref)
        return v4(v2):path("v2"):path("multi-get-latest-messages"):queryArgs({
            pageSize = v6
        }):expandedQueryArgsWithIds("conversationIds", v5);
    end);
end;