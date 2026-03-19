local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.AppChatNetworking);
local v2 = require(script.Parent.Parent.parseNewConversationResponse);
return function(v3, v4, v5) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v6) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), v3 (copy), v4 (copy), v2 (ref), v5 (copy)
        return v6:dispatch(v1.rodux.ExpandToGroupConversation.API(v3, v4)):andThen(function(v7) --[[ Line: 11 ]]
            -- upvalues: v2 (ref), v5 (ref)
            return v2(v7.responseBody.new_conversation, v5, "userExpandedToGroupConversation");
        end);
    end;
end;