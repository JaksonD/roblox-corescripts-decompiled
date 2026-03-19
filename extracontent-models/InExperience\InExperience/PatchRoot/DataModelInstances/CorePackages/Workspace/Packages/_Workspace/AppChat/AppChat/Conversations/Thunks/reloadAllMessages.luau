local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(script.Parent.reloadMessagesForConversations);
return function() --[[ Line: 7 ]] --[[ Name: reloadAllMessages ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v3) --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v1 (ref)
        local l_Conversations_0 = v3:getState().ChatAppReducer.Conversations;
        return v3:dispatch(v2(v1.Dictionary.keys(l_Conversations_0)));
    end;
end;