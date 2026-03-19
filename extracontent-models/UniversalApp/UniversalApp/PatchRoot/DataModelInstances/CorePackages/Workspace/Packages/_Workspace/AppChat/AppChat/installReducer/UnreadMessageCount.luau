local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(l_Parent_0.AppChatNetworking);
return v1.createReducer(0, {
    [v2.rodux.GetConversationMetadata.Succeeded.name] = function(v3, v4) --[[ Line: 10 ]]
        local l_responseBody_0 = v4.responseBody;
        if l_responseBody_0 and l_responseBody_0.global_unread_message_count then
            return l_responseBody_0.global_unread_message_count;
        else
            return v3;
        end;
    end
});