local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local _ = require(l_Parent_0.AppChatNetworking);
local v2 = require(script.Parent.MessageModel);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
return {
    responseUser = function(v4) --[[ Line: 13 ]] --[[ Name: responseUser ]]
        -- upvalues: v2 (copy), l_DateTime_0 (copy)
        return {
            id = if v4.id then v4.id else "message-id", 
            type = v2.SenderTypes.User, 
            sender_user_id = if v4.sender_user_id then v4.sender_user_id else 1, 
            sent = if v4.sent then v4.sent else l_DateTime_0.fromIsoDate("2021-01-01T00:00:00Z"), 
            content = if v4.content then v4.content else "message-content", 
            created_at = if v4.created_at then v4.created_at else l_DateTime_0.fromIsoDate("2021-01-01T00:00:00Z"), 
            moderation_type = if v4.moderation_type then v4.moderation_type else "trusted_comms", 
            is_previewable = v4.is_previewable ~= nil and v4.is_previewable, 
            is_badgeable = v4.is_badgeable ~= nil and v4.is_badgeable
        };
    end, 
    responseSystem = function(v5) --[[ Line: 40 ]] --[[ Name: responseSystem ]]
        return {
            id = if v5.id then v5.id else "message-id", 
            type = "system", 
            sent = if v5.sent then v5.sent else "2021-01-01T00:00:00Z", 
            content = if v5.content then v5.content else "message-content", 
            created_at = if v5.created_at then v5.created_at else "2021-01-01T00:00:00Z"
        };
    end
};