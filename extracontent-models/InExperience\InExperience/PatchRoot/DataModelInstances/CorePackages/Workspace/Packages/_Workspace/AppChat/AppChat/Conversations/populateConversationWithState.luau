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
return function(v15, v16) --[[ Line: 41 ]]
    -- upvalues: v2 (copy), l_getOtherParticipant_0 (copy), v11 (copy), v12 (copy), v14 (copy), v5 (copy), l_getConversationDisplayTitle_0 (copy), v8 (copy), v10 (copy), v9 (copy), l_getConversationGameId_0 (copy), v13 (copy)
    local v17 = v16.participants or {};
    local v19 = v2.List.filter(v17, function(v18) --[[ Line: 43 ]]
        -- upvalues: v15 (copy)
        return v18 ~= v15.LocalUserId;
    end);
    local v20 = nil;
    if v16.conversationType == "OneToOneConversation" then
        local v21 = l_getOtherParticipant_0(v15, v16.participants);
        local v22 = v11.Selectors.getUserPresenceByUserId(v15, v21);
        v20 = v12.getUserDisplayPresence(v22);
    end;
    local v23 = {};
    local l_Users_0 = v15.Users;
    for _, v26 in pairs(v17) do
        v23[v26] = l_Users_0[v26];
    end;
    local v27 = {
        shortRelativeTime = v16.lastUpdated and v16.lastUpdated:GetShortRelativeTime(), 
        longRelativeTime = v16.lastUpdated and v16.lastUpdated:GetLongRelativeTime(), 
        unixTime = v16.lastUpdated and v16.lastUpdated:GetUnixTimestamp()
    };
    return v2.Dictionary.join({
        id = v16.id, 
        title = if v14 then v5(v16) else l_getConversationDisplayTitle_0(v16), 
        participants = v8(v15, v17), 
        otherParticipants = v19, 
        isDefaultTitle = v16.isDefaultTitle, 
        hasGroupUp = v16.hasGroupUp, 
        lastMessageContent = v10(v16) or "", 
        hasUnreadMessages = v16.hasUnreadMessages or false, 
        thumbnails = v9(v19), 
        presenceText = v20 and v20.text, 
        presenceImage = v20 and v20.image, 
        gameId = l_getConversationGameId_0(v16, v15.LocalUserId, v23), 
        serverState = v16.serverState, 
        moderationType = v16.moderationType, 
        userPendingStatus = v16.userPendingStatus, 
        conversationType = v16.conversationType, 
        osaAcknowledgementStatus = if v13 then v16.osaAcknowledgementStatus else nil, 
        userOptedIntoChatMessages = v16.userOptedIntoChatMessages
    }, v27);
end;