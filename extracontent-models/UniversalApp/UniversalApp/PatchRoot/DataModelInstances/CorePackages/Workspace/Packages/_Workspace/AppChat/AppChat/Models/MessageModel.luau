local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local l_GenerateStringId_0 = require(l_Parent_0.AppCommonLib).GenerateStringId;
local v5 = require(l_Parent_0.SharedFlags);
local v6 = require(script.Parent.Logger);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local l_GetFFlagEnableSocialCards_0 = v5.GetFFlagEnableSocialCards;
local l_FFlagEnableAppChatMessageVisibility_0 = v5.FFlagEnableAppChatMessageVisibility;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAutotranslation);
local v12 = {
    new = function(v11) --[[ Line: 21 ]] --[[ Name: new ]]
        return {
            universeId = tostring(v11)
        };
    end
};
local v13 = {
    SenderTypes = {
        User = "user", 
        System = "system", 
        UnknownType = "unknown_type"
    }, 
    MessageTypes = {
        PlainText = "PlainText", 
        Link = "Link", 
        System = "System"
    }, 
    LinkTypes = {
        Game = "Game"
    }, 
    ModerationTypes = {
        TrustedComms = "trusted_comms", 
        Moderated = "moderated", 
        Invalid = "invalid", 
        UnknownType = "unknown_type"
    }, 
    VisibilityTypes = {
        Visible = "visible", 
        Hidden = "hidden", 
        Invalid = "invalid"
    }
};
v13.new = function(v14) --[[ Line: 54 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy)
    v13.__index = v13;
    local v15 = v14 or {};
    setmetatable(v15, v13);
    return v15;
end;
v13.fromWeb = function(v16, v17, v18) --[[ Line: 64 ]] --[[ Name: fromWeb ]]
    -- upvalues: v13 (copy), l_DateTime_0 (copy)
    if not v13.DoRequiredFieldsPresent(v16) then
        return nil;
    else
        local v19 = v13.new();
        v19.id = v16.id;
        v19.senderTargetId = tostring(v16.senderTargetId);
        v19.senderType = v16.senderType;
        v19.read = v16.read;
        v19.sent = l_DateTime_0.fromIsoDate(v16.sent);
        v19.conversationId = tostring(v17);
        v19.previousMessageId = v18;
        v19.filteredForReceivers = false;
        v19:parseContentWeb(v16);
        return v19;
    end;
end;
v13.fromSentWeb = function(v20, v21) --[[ Line: 84 ]] --[[ Name: fromSentWeb ]]
    -- upvalues: v13 (copy), l_Players_0 (copy), l_DateTime_0 (copy)
    if not v13.DoRequiredFieldsPresentForSent(v20) then
        return nil;
    else
        local v22 = v13.new();
        v22.id = v20.messageId;
        v22.senderTargetId = tostring(l_Players_0.LocalPlayer.UserId);
        v22.senderType = "User";
        v22.read = true;
        v22.sent = l_DateTime_0.fromIsoDate(v20.sent);
        v22.conversationId = tostring(v21);
        v22.previousMessageId = "";
        v22.filteredForReceivers = v20.filteredForReceivers;
        v22:parseContentSentWeb(v20);
        return v22;
    end;
end;
v13.newSendingId = function() --[[ Line: 105 ]] --[[ Name: newSendingId ]]
    -- upvalues: l_GenerateStringId_0 (copy)
    return "sending-message-" .. l_GenerateStringId_0();
end;
v13.newSending = function(v23) --[[ Line: 109 ]] --[[ Name: newSending ]]
    -- upvalues: v13 (copy), l_Players_0 (copy)
    assert(v23, "props argument is missing");
    assert(v23.id, "props.id argument is missing");
    assert(v23.messageType, "props.messageType argument is missing");
    assert(v23.order, "props.order argument is missing");
    assert(v23.conversationId, "props.conversationId argument is missing");
    assert(v23.sent, "props.sent argument is missing");
    local v24 = v13.new(v23);
    v24.senderTargetId = tostring(l_Players_0.LocalPlayer.UserId);
    v24.senderType = v13.SenderTypes.User;
    v24.moderated = false;
    v24.failed = false;
    v24.stableKey = v24.id;
    return v24;
end;
v13.DoRequiredFieldsPresent = function(v25) --[[ Line: 129 ]] --[[ Name: DoRequiredFieldsPresent ]]
    return v25 and v25.id and v25.messageType and v25.senderTargetId and v25.sent;
end;
v13.DoRequiredFieldsPresentForSent = function(v26) --[[ Line: 132 ]] --[[ Name: DoRequiredFieldsPresentForSent ]]
    return v26 and v26.messageId and v26.messageType and v26.sent;
end;
v13.parseContentWeb = function(v27, v28) --[[ Line: 136 ]] --[[ Name: parseContentWeb ]]
    -- upvalues: v13 (copy), v12 (copy)
    v27:parseContent(v28);
    if v28.messageType == v13.MessageTypes.Link and v28.link and v28.link.type == v13.LinkTypes.Game and v28.link.game then
        v27.gameLink = v12.new(v28.link.game.universeId);
    end;
end;
v13.parseContentSentWeb = function(v29, v30) --[[ Line: 145 ]] --[[ Name: parseContentSentWeb ]]
    -- upvalues: v13 (copy), v12 (copy)
    v29:parseContent(v30);
    if v30.messageType == v13.MessageTypes.Link and v30.chatMessageLinkType == v13.LinkTypes.Game then
        v29.gameLink = v12.new(v30.universeId);
    end;
end;
v13.parseContent = function(v31, v32) --[[ Line: 154 ]] --[[ Name: parseContent ]]
    -- upvalues: v13 (copy)
    v31.messageType = v32.messageType;
    if v32.messageType == v13.MessageTypes.PlainText then
        v31.content = v32.content;
        return;
    else
        v31.content = nil;
        return;
    end;
end;
v13.fromChannelsApi = function(v33, v34, v35, _) --[[ Line: 167 ]] --[[ Name: fromChannelsApi ]]
    -- upvalues: v13 (copy), l_DateTime_0 (copy), l_GetFFlagEnableSocialCards_0 (copy), v10 (copy)
    if not v13.DoRequiredFieldsPresentFromChannelsApi(v33) then
        return nil;
    else
        local v37 = v13.new();
        v37.id = v33.id;
        v37.read = true;
        v37.sent = l_DateTime_0.fromIsoDate(v33.created_at);
        v37.conversationId = tostring(v34);
        v37.previousMessageId = v35;
        v37.filteredForReceivers = false;
        v37.content = v33.content;
        v37.previewContent = v33.preview_content;
        if v33.type == v13.SenderTypes.User then
            v37:serializeForUserMessage(v33);
        elseif v33.type == v13.SenderTypes.System then
            v37:serializeForSystemMessage(v33);
        end;
        v37.cards = if l_GetFFlagEnableSocialCards_0() then v33.cards else nil;
        if l_GetFFlagEnableSocialCards_0() then
            v37.senderTargetId = tostring(v33.sender_user_id);
        end;
        v37.stableKey = v37.id;
        v37.isBadgeable = v33.is_badgeable;
        v37.isPreviewable = v33.is_previewable;
        if v10 then
            v37.contentToDisplay = v33.content_to_display;
        end;
        return v37;
    end;
end;
v13.serializeForUserMessage = function(v38, v39) --[[ Line: 204 ]] --[[ Name: serializeForUserMessage ]]
    -- upvalues: v13 (copy), v7 (copy), l_FFlagEnableAppChatMessageVisibility_0 (copy), v6 (copy)
    v38.senderTargetId = tostring(v39.sender_user_id);
    v38.senderType = v13.SenderTypes.User;
    v38.moderationType = v39.moderation_type;
    if v7() then
        v38.repliesTo = v13.fromChannelsApi(v39.replies_to, nil, nil, true);
    end;
    if l_FFlagEnableAppChatMessageVisibility_0 then
        if v39.visibility and (v39.visibility == v13.VisibilityTypes.Visible or v39.visibility == v13.VisibilityTypes.Hidden) then
            v38.visibility = v39.visibility;
        else
            v38.visibility = v13.VisibilityTypes.Invalid;
            v6:debug("Message visibility type is invalid for message id: " .. v38.id);
        end;
    end;
    v38.messageType = v13.MessageTypes.PlainText;
end;
v13.serializeForSystemMessage = function(v40, _) --[[ Line: 229 ]] --[[ Name: serializeForSystemMessage ]]
    -- upvalues: v13 (copy)
    v40.senderType = v13.SenderTypes.System;
    v40.messageType = v13.MessageTypes.System;
end;
v13.DoRequiredFieldsPresentFromChannelsApi = function(v42) --[[ Line: 235 ]] --[[ Name: DoRequiredFieldsPresentFromChannelsApi ]]
    -- upvalues: v13 (copy)
    if not v42 then
        return false;
    elseif v42.type == v13.SenderTypes.User then
        return v42.id and v42.sender_user_id and v42.created_at;
    elseif v42.type == v13.SenderTypes.System then
        return v42.id and v42.created_at;
    else
        return false;
    end;
end;
v13.parseContentFromChannelsApi = function(v43, v44) --[[ Line: 249 ]] --[[ Name: parseContentFromChannelsApi ]]
    -- upvalues: v13 (copy)
    v43.messageType = v13.MessageTypes.PlainText;
    v43.content = v44.content;
end;
v13.fromSentChannelsApi = function(v45, v46, v47) --[[ Line: 255 ]] --[[ Name: fromSentChannelsApi ]]
    -- upvalues: v13 (copy), l_DateTime_0 (copy), v7 (copy), l_FFlagEnableAppChatMessageVisibility_0 (copy), v6 (copy)
    if not v13.DoRequiredFieldsPresentForSentFromChannelsApi(v45) then
        return nil;
    else
        local v48 = v13.new();
        v48.id = v45.messages[1].id;
        v48.senderTargetId = tostring(v45.messages[1].sender_user_id);
        v48.senderType = v13.SenderTypes.User;
        v48.read = true;
        v48.sent = l_DateTime_0.fromIsoDate(v45.messages[1].created_at);
        v48.conversationId = tostring(v46);
        v48.previousMessageId = "";
        v48.moderationType = v45.messages[1].moderation_type;
        v48.stableKey = v47 or v48.id;
        v48.isBadgeable = v45.messages[1].is_badgeable;
        v48.isPreviewable = v45.messages[1].is_previewable;
        v48.filteredForReceivers = false;
        v48.messageType = v13.MessageTypes.PlainText;
        v48.content = v45.messages[1].content;
        if v7() then
            v48.repliesTo = v13.fromChannelsApi(v45.messages[1].replies_to, nil, nil, true);
        end;
        if l_FFlagEnableAppChatMessageVisibility_0 then
            if v45.visibility and (v45.visibility == v13.VisibilityTypes.Visible or v45.visibility == v13.VisibilityTypes.Hidden) then
                v48.visibility = v45.visibility;
                return v48;
            else
                v48.visibility = v13.VisibilityTypes.Visible;
                v6:debug("Message visibility type is invalid for message id: " .. v48.id);
            end;
        end;
        return v48;
    end;
end;
v13.DoRequiredFieldsPresentForSentFromChannelsApi = function(v49) --[[ Line: 302 ]] --[[ Name: DoRequiredFieldsPresentForSentFromChannelsApi ]]
    return v49 and v49.messages and #v49.messages > 0 and v49.messages[1].id and v49.messages[1].created_at;
end;
return v13;