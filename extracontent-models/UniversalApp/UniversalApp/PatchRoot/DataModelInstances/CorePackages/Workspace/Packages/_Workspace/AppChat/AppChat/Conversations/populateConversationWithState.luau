local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_Conversation_0 = require(l_script_FirstAncestor_0.SocialLibraries).Conversation;
local l_getConversationDisplayTitle_0 = l_Conversation_0.getConversationDisplayTitle;
local v5 = require(l_script_FirstAncestor_0.Conversations.getConversationTitle);
local l_getOtherParticipant_0 = l_Conversation_0.getOtherParticipant;
local l_getConversationGameId_0 = l_Conversation_0.getConversationGameId;
local v8 = require(script.Parent.populateUserIdsWithState);
local v9 = require(l_script_FirstAncestor_0.Users.getThumbnailsForUserIds);
local v10 = require(script.Parent.getLastMessageContent);
local v11 = require(l_script_FirstAncestor_0.Http.RoduxPresence);
local v12 = require(l_script_FirstAncestor_0.Users.userPresenceUtils);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatRemoveUserProfileTitles);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationListRelativeTimestamps);
local v16 = require(l_script_FirstAncestor_0.Utils.getConversationTimestamp);
return function(v17, v18) --[[ Line: 45 ]]
    -- upvalues: v2 (copy), l_getOtherParticipant_0 (copy), v11 (copy), v12 (copy), v15 (copy), v16 (copy), v14 (copy), v5 (copy), l_getConversationDisplayTitle_0 (copy), v8 (copy), v10 (copy), v9 (copy), l_getConversationGameId_0 (copy), v13 (copy)
    local v19 = v18.participants or {};
    local v21 = v2.List.filter(v19, function(v20) --[[ Line: 47 ]]
        -- upvalues: v17 (copy)
        return v20 ~= v17.LocalUserId;
    end);
    local v22 = nil;
    if v18.conversationType == "OneToOneConversation" then
        local v23 = l_getOtherParticipant_0(v17, v18.participants);
        local v24 = v11.Selectors.getUserPresenceByUserId(v17, v23);
        v22 = v12.getUserDisplayPresence(v24);
    end;
    local v25 = {};
    local l_Users_0 = v17.Users;
    for _, v28 in pairs(v19) do
        v25[v28] = l_Users_0[v28];
    end;
    local v29 = {
        shortRelativeTime = if v15 then v18.lastUpdated and v16(v18.lastUpdated) else v18.lastUpdated and v18.lastUpdated:GetShortRelativeTime(), 
        longRelativeTime = v18.lastUpdated and v18.lastUpdated:GetLongRelativeTime(), 
        unixTime = v18.lastUpdated and v18.lastUpdated:GetUnixTimestamp()
    };
    return v2.Dictionary.join({
        id = v18.id, 
        title = if v14 then v5(v18) else l_getConversationDisplayTitle_0(v18), 
        participants = v8(v17, v19), 
        otherParticipants = v21, 
        isDefaultTitle = v18.isDefaultTitle, 
        hasGroupUp = v18.hasGroupUp, 
        lastMessageContent = v10(v18) or "", 
        hasUnreadMessages = v18.hasUnreadMessages or false, 
        thumbnails = v9(v21), 
        presenceText = v22 and v22.text, 
        presenceImage = v22 and v22.image, 
        gameId = l_getConversationGameId_0(v18, v17.LocalUserId, v25), 
        serverState = v18.serverState, 
        moderationType = v18.moderationType, 
        userPendingStatus = v18.userPendingStatus, 
        conversationType = v18.conversationType, 
        osaAcknowledgementStatus = if v13 then v18.osaAcknowledgementStatus else nil, 
        userOptedIntoChatMessages = v18.userOptedIntoChatMessages
    }, v29);
end;