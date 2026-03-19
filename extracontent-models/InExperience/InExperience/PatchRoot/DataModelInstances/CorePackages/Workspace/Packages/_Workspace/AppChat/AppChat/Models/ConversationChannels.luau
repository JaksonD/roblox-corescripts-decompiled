local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.AppChatNetworking);
local v4 = require(l_Parent_0.Cryo);
local l_OrderedMap_0 = require(l_Parent_0.AppCommonLib).OrderedMap;
local v6 = require(l_script_FirstAncestor_0.Constants);
local v7 = require(script.Parent.Conversation);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local l_FFlagAppChatExcludeSyntheticPreviewFromMessages_0 = require(l_script_FirstAncestor_0.Flags).FFlagAppChatExcludeSyntheticPreviewFromMessages;
local function v11(v10) --[[ Line: 16 ]] --[[ Name: getMessageId ]]
    return v10.id;
end;
local function v16(v12, v13) --[[ Line: 20 ]] --[[ Name: messageSortPredicate ]]
    local l_UnixTimestamp_0 = v12.sent:GetUnixTimestamp();
    local l_UnixTimestamp_1 = v13.sent:GetUnixTimestamp();
    if l_UnixTimestamp_0 == l_UnixTimestamp_1 then
        return v12.id > v13.id;
    else
        return l_UnixTimestamp_0 < l_UnixTimestamp_1;
    end;
end;
local function v19(v17, v18) --[[ Line: 30 ]] --[[ Name: sendingMessageSortPredicate ]]
    return v17.order < v18.order;
end;
local function _(v20, v21) --[[ Line: 36 ]] --[[ Name: convertToLegacyConversationType ]]
    -- upvalues: v7 (copy)
    if v21 == "friends" then
        return v7.Type.ONE_TO_ONE_CONVERSATION;
    elseif v20 == "group" then
        return v7.Type.MULTI_USER_CONVERSATION;
    elseif v20 == "one_to_one" then
        return v7.Type.ONE_TO_ONE_CONVERSATION;
    else
        return v7.Type.ONE_TO_ONE_CONVERSATION;
    end;
end;
local function v27(v23) --[[ Line: 49 ]] --[[ Name: getFriendId ]]
    -- upvalues: l_Players_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        for _, v26 in v23.participant_user_ids do
            if tostring(v26) ~= tostring(l_LocalPlayer_0.UserId) then
                return "friends:" .. tostring(v26);
            end;
        end;
    end;
    return "friends:unknown-id";
end;
local v28 = {
    ModerationType = {
        TrustedComms = "trusted_comms", 
        Moderated = "moderated", 
        Invalid = "invalid", 
        UnknownType = "unknown_type"
    }, 
    UserPendingStatus = {
        Invalid = "invalid", 
        Pending = "pending", 
        NotPending = "not_pending"
    }, 
    OsaAcknowledgementStatus = v3.Constants.OsaAcknowledgementStatusResponse, 
    Source = {
        Friends = "friends", 
        Channels = "channels", 
        Chat = "chat"
    }, 
    Type = {
        Group = "group", 
        OneToOne = "one_to_one"
    }, 
    getEmptyMessages = function() --[[ Line: 91 ]] --[[ Name: getEmptyMessages ]]
        -- upvalues: l_OrderedMap_0 (copy), v11 (copy), v16 (copy)
        return l_OrderedMap_0.new(v11, v16);
    end, 
    getEmptySendingMessages = function() --[[ Line: 94 ]] --[[ Name: getEmptySendingMessages ]]
        -- upvalues: l_OrderedMap_0 (copy), v11 (copy), v19 (copy)
        return l_OrderedMap_0.new(v11, v19);
    end
};
v28.mockBase = function() --[[ Line: 98 ]] --[[ Name: mockBase ]]
    -- upvalues: v28 (copy), v7 (copy), v6 (copy), l_DateTime_0 (copy)
    return {
        source = "channels", 
        type = "one_to_one", 
        createdAt = nil, 
        messages = v28.getEmptyMessages(), 
        sendingMessages = v28.getEmptySendingMessages(), 
        id = "1-2-3", 
        clientId = "1-2-3", 
        initiator = "1", 
        hasUnreadMessages = false, 
        conversationType = v7.Type.ONE_TO_ONE_CONVERSATION, 
        hasGroupUp = false, 
        usersTyping = {}, 
        isUserLeaving = false, 
        fetchingOlderMessages = false, 
        serverState = v6.ServerState.CREATED, 
        pinnedGame = {}, 
        moderationType = v28.ModerationType.TrustedComms, 
        userPendingStatus = v28.UserPendingStatus.NotPending, 
        participantPendingStatus = v28.UserPendingStatus.NotPending, 
        previewMessageId = nil, 
        previewContent = nil, 
        lastUpdated = l_DateTime_0.now(), 
        title = "test", 
        titleForViewer = "test", 
        isDefaultTitle = false, 
        participants = {
            "1"
        }, 
        osaAcknowledgementStatus = v28.OsaAcknowledgementStatus.NotApplicable, 
        previousCursor = nil, 
        nextCursor = nil, 
        fetchedOldestMessage = nil
    };
end;
v28.mock = function(v29) --[[ Line: 144 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy), v28 (copy)
    return v4.Dictionary.join(v28.mockBase(), v29 or {});
end;
v28.response = function(v30) --[[ Line: 148 ]] --[[ Name: response ]]
    return {
        source = if v30.source then v30.source else "channels", 
        type = if v30.type then v30.type else "one_to_one", 
        created_at = if v30.created_at then v30.created_at else "2021-01-01T00:00:00Z", 
        created_by = if v30.created_by then v30.created_by else 1, 
        id = if v30.id then v30.id else "1-2-3", 
        name = if v30.name then v30.name else "test", 
        participant_user_ids = if v30.participant_user_ids then v30.participant_user_ids else {
            1
        }, 
        unread_message_count = if v30.unread_message_count then v30.unread_message_count else 0, 
        updated_at = if v30.updated_at then v30.updated_at else "2021-01-01T00:00:00Z", 
        messages = if v30.messages then v30.messages else {}, 
        moderation_type = if v30.moderation_type then v30.moderation_type else "trusted_comms", 
        user_pending_status = if v30.user_pending_status then v30.user_pending_status else "not_pending", 
        participant_pending_status = if v30.participant_pending_status then v30.participant_pending_status else "not_pending", 
        success = if v30.success then v30.success else nil, 
        preview_message = if v30.preview_message then v30.preview_message else nil, 
        hasGroupUp = if v30.hasGroupUp then v30.hasGroupUp else false, 
        osa_acknowledgement_status = if v30.osa_acknowledgement_status then v30.osa_acknowledgement_status else nil
    };
end;
v28.fromChannelsApi = function(v31) --[[ Line: 193 ]] --[[ Name: fromChannelsApi ]]
    -- upvalues: v28 (copy), v27 (copy), v7 (copy), v6 (copy), l_FFlagAppChatExcludeSyntheticPreviewFromMessages_0 (copy), l_DateTime_0 (copy)
    local v32 = {
        source = v31.source, 
        type = v31.type, 
        createdAt = v31.created_at, 
        messages = v28.getEmptyMessages(), 
        sendingMessages = v28.getEmptySendingMessages(), 
        id = if v31.source == "friends" then v27(v31) else tostring(v31.id), 
        clientId = "", 
        initiator = tostring(v31.created_by), 
        hasUnreadMessages = v31.unread_message_count > 0
    };
    local l_type_0 = v31.type;
    v32.conversationType = if v31.source == "friends" then v7.Type.ONE_TO_ONE_CONVERSATION else if l_type_0 == "group" then v7.Type.MULTI_USER_CONVERSATION else if l_type_0 == "one_to_one" then v7.Type.ONE_TO_ONE_CONVERSATION else v7.Type.ONE_TO_ONE_CONVERSATION;
    v32.usersTyping = {};
    v32.isUserLeaving = false;
    v32.fetchingOlderMessages = false;
    v32.serverState = if v31.source == "friends" then v6.ServerState.NONE else v6.ServerState.CREATED;
    v32.pinnedGame = {};
    v32.moderationType = v31.moderation_type;
    v32.userPendingStatus = v31.user_pending_status;
    v32.participantPendingStatus = v31.participant_pending_status;
    local l_preview_message_0 = v31.preview_message;
    if l_preview_message_0 then
        if l_preview_message_0.is_previewable then
            v32.previewMessageId = l_preview_message_0.id;
        end;
        if l_FFlagAppChatExcludeSyntheticPreviewFromMessages_0 then
            v32.previewContent = l_preview_message_0.content or l_preview_message_0.preview_content;
        end;
    end;
    v32.hasGroupUp = if v31.has_group_up then v31.has_group_up else false;
    v32.lastUpdated = l_DateTime_0.fromIsoDate(v31.updated_at);
    v32.title = v31.name;
    v32.titleForViewer = "";
    v32.isDefaultTitle = v31.name == nil;
    v32.participants = {};
    if v31.participant_user_ids then
        for _, v36 in v31.participant_user_ids do
            table.insert(v32.participants, (tostring(v36)));
        end;
    end;
    if v31.osa_acknowledgement_status then
        v32.osaAcknowledgementStatus = v31.osa_acknowledgement_status;
    end;
    return v32;
end;
v28.getFriendConversationId = function(v37) --[[ Line: 249 ]] --[[ Name: getFriendConversationId ]]
    -- upvalues: v27 (copy)
    return (v27({
        participant_user_ids = v37
    }));
end;
return v28;