local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v4 = require(l_Parent_0.UserProfiles);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_script_FirstAncestor_0.Models.Conversation);
local v8 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v9 = require(l_script_FirstAncestor_0.Conversations.Thunks.createConversation);
local v10 = require(l_script_FirstAncestor_0.Conversations.Thunks.createFriendConversation);
local l_ModerationType_0 = require(l_script_FirstAncestor_0.Models.ConversationChannels).ModerationType;
local v12 = require(l_script_FirstAncestor_0.Conversations.Thunks.expandToGroupConversation);
local v13 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchLatestConversationDetails);
local v14 = require(l_script_FirstAncestor_0.Conversations.getConversationTitle);
local v15 = require(l_script_FirstAncestor_0.Conversations.getOtherParticipants);
local v16 = require(l_script_FirstAncestor_0.Conversations.Thunks.NavigateIntoSquadLobby);
local v17 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v18 = require(l_script_FirstAncestor_0.Hooks.useGetConversationHasGroupUpFromId);
local v19 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local v20 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabled);
local v21 = require(l_script_FirstAncestor_0.Hooks.useIsChatUserMessagesEnabled);
local v22 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatRemoveUserProfileTitles);
local l_FFlagReadAppChatFetchingVariable_0 = require(l_Parent_0.SharedFlags).FFlagReadAppChatFetchingVariable;
local l_FFlagEnableScheduledSquads_0 = require(l_Parent_0.SharedFlags).FFlagEnableScheduledSquads;
local l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 = require(l_Parent_0.SharedFlags).FFlagAppChatNavigateBackIfOSAUnacknowledged;
local l_FFlagEnableSquadRegroupExperimentation_0 = require(l_Parent_0.SharedFlags).FFlagEnableSquadRegroupExperimentation;
local l_FFlagEnableDialogAfterSquadJoin_0 = require(l_Parent_0.SharedFlags).FFlagEnableDialogAfterSquadJoin;
local v29 = require(l_script_FirstAncestor_0.Utils.shouldShowOSAForConversation);
local v30 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore);
local v31 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore.OverlayTypes);
local l_HttpService_0 = game:GetService("HttpService");
local l_CreateExperienceInvite_0 = require(l_Parent_0.Squads).Thunks.CreateExperienceInvite;
local function v36(v34, v35) --[[ Line: 44 ]]
    -- upvalues: v13 (copy)
    return v34(v13(v35));
end;
local function v41(v37, v38, v39) --[[ Line: 48 ]]
    -- upvalues: v7 (copy), v2 (copy), v12 (copy)
    if v38.conversationType == v7.Type.MULTI_USER_CONVERSATION then
        return v37(v2.rodux.AddUserToConversation.API(v38.id, v39)):andThen(function() --[[ Line: 52 ]]
            -- upvalues: v38 (copy)
            return v38.id;
        end);
    else
        return v37(v12(v38.id, v39)):andThen(function(v40) --[[ Line: 58 ]]
            return v40.id;
        end);
    end;
end;
local function v45(v42, v43, v44) --[[ Line: 64 ]]
    -- upvalues: v2 (copy)
    return v42(v2.rodux.RemoveUserFromConversation.API(v43, v44));
end;
local function v47(v46) --[[ Line: 68 ]]
    -- upvalues: v18 (copy)
    return v18(v46);
end;
local function v51(v48) --[[ Line: 72 ]]
    -- upvalues: v17 (copy), v8 (copy), v19 (copy)
    assert(v48 ~= nil, "Missing parent channel ID");
    local v49 = v17(v48) or {};
    if v49.source == "friends" then
        return true;
    else
        local v50 = v49.participantPendingStatus == v8.UserPendingStatus.Pending;
        return not v19(v49) and not v50;
    end;
end;
local function v54(v52) --[[ Line: 90 ]]
    -- upvalues: v17 (copy), l_ModerationType_0 (copy)
    local v53 = v17(v52);
    if v53 and v53.moderationType ~= nil then
        return v53.moderationType == l_ModerationType_0.TrustedComms;
    else
        return nil;
    end;
end;
local function v60(v55) --[[ Line: 98 ]]
    -- upvalues: v17 (copy), v23 (copy), v14 (copy), l_useLocalUserId_0 (copy), v4 (copy), v15 (copy)
    local v56 = v17(v55);
    if v23 then
        return v14(v56);
    else
        local v57 = tonumber(l_useLocalUserId_0()) or 0;
        local v58 = v4.Hooks.useUserProfilesFetch({
            userIds = v15(v56, v57), 
            query = v4.Queries.userProfilesCombinedNameAndUsernameByUserIds
        });
        local v59 = v4.Hooks.useUserProfilesFetch({
            userIds = if v57 > 0 then {
                (tostring(v57))
            } else {}, 
            query = v4.Queries.userProfilesCombinedNameAndUsernameByUserIds
        });
        return v14(v56, v58.data and v58.data.userProfiles, if v59.data then v4.Selectors.getCombinedNameFromId(v59.data, (tostring(v57))) else "");
    end;
end;
local function v62() --[[ Line: 124 ]]
    -- upvalues: l_useSelector_0 (copy), l_FFlagReadAppChatFetchingVariable_0 (copy), v22 (copy), l_RetrievalStatus_0 (copy)
    return l_useSelector_0(function(v61) --[[ Line: 125 ]]
        -- upvalues: l_FFlagReadAppChatFetchingVariable_0 (ref), v22 (ref), l_RetrievalStatus_0 (ref)
        if l_FFlagReadAppChatFetchingVariable_0 then
            return v22(v61, "ChatAppReducer.ChatSettings.retrievalStatus") ~= l_RetrievalStatus_0.Done;
        else
            return nil;
        end;
    end);
end;
local v67 = l_FFlagEnableDialogAfterSquadJoin_0 and function(v63, v64, v65) --[[ Line: 136 ]]
    -- upvalues: v30 (copy), v31 (copy), l_HttpService_0 (copy)
    local v66 = v30(false);
    v66.showOverlay(v31.GroupOSADialog, {
        conversationId = v63, 
        impressionId = l_HttpService_0:GenerateGUID(false), 
        onJoin = function() --[[ Line: 141 ]] --[[ Name: onJoin ]]
            -- upvalues: v66 (copy), v64 (copy)
            v66.dismissOverlay();
            v64();
        end, 
        onDecline = function() --[[ Line: 145 ]] --[[ Name: onDecline ]]
            -- upvalues: v66 (copy), v65 (copy)
            v66.dismissOverlay();
            v65();
        end
    });
end or nil;
return {
    fetchParentChannelDetails = v36, 
    inviteToParentChannel = v41, 
    navigateIntoSquadLobby = v16, 
    removeUserFromParentChannel = v45, 
    createConversation = v9, 
    createFriendConversation = v10, 
    createExperienceInvite = l_FFlagEnableSquadRegroupExperimentation_0 and function(v68, v69, v70) --[[ Line: 161 ]]
        -- upvalues: l_CreateExperienceInvite_0 (copy)
        return l_CreateExperienceInvite_0(v68, v69, v70);
    end or nil, 
    useGetConversationFromId = v17, 
    useParentChannelHasGroupUp = v47, 
    useParentChannelHasSquadAccess = v51, 
    useParentChannelIsPartyVoiceEligible = v54, 
    useParentChannelTitleSelector = v60, 
    useIsChatEnabled = v20, 
    useIsLoadingChatSettings = v62, 
    useIsChatUserMessagesEnabled = if l_FFlagEnableScheduledSquads_0 then v21 else nil, 
    shouldShowOSAForConversation = if l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 then v29 else nil, 
    showGroupOSADialog = v67
};