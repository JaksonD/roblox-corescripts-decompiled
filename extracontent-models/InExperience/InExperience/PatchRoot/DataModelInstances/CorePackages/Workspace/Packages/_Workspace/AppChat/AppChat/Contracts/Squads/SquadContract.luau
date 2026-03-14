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
local v28 = require(l_script_FirstAncestor_0.Utils.shouldShowOSAForConversation);
local l_CreateExperienceInvite_0 = require(l_Parent_0.Squads).Thunks.CreateExperienceInvite;
return {
    fetchParentChannelDetails = function(v30, v31) --[[ Line: 39 ]]
        -- upvalues: v13 (copy)
        return v30(v13(v31));
    end, 
    inviteToParentChannel = function(v32, v33, v34) --[[ Line: 43 ]]
        -- upvalues: v7 (copy), v2 (copy), v12 (copy)
        if v33.conversationType == v7.Type.MULTI_USER_CONVERSATION then
            return v32(v2.rodux.AddUserToConversation.API(v33.id, v34)):andThen(function() --[[ Line: 47 ]]
                -- upvalues: v33 (copy)
                return v33.id;
            end);
        else
            return v32(v12(v33.id, v34)):andThen(function(v35) --[[ Line: 53 ]]
                return v35.id;
            end);
        end;
    end, 
    navigateIntoSquadLobby = v16, 
    removeUserFromParentChannel = function(v36, v37, v38) --[[ Line: 59 ]]
        -- upvalues: v2 (copy)
        return v36(v2.rodux.RemoveUserFromConversation.API(v37, v38));
    end, 
    createConversation = v9, 
    createFriendConversation = v10, 
    createExperienceInvite = l_FFlagEnableSquadRegroupExperimentation_0 and function(v39, v40, v41) --[[ Line: 137 ]]
        -- upvalues: l_CreateExperienceInvite_0 (copy)
        return l_CreateExperienceInvite_0(v39, v40, v41);
    end or nil, 
    useGetConversationFromId = v17, 
    useParentChannelHasGroupUp = function(v42) --[[ Line: 63 ]]
        -- upvalues: v18 (copy)
        return v18(v42);
    end, 
    useParentChannelHasSquadAccess = function(v43) --[[ Line: 67 ]]
        -- upvalues: v17 (copy), v8 (copy), v19 (copy)
        assert(v43 ~= nil, "Missing parent channel ID");
        local v44 = v17(v43) or {};
        if v44.source == "friends" then
            return true;
        else
            local v45 = v44.participantPendingStatus == v8.UserPendingStatus.Pending;
            return not v19(v44) and not v45;
        end;
    end, 
    useParentChannelIsPartyVoiceEligible = function(v46) --[[ Line: 85 ]]
        -- upvalues: v17 (copy), l_ModerationType_0 (copy)
        local v47 = v17(v46);
        if v47 and v47.moderationType ~= nil then
            return v47.moderationType == l_ModerationType_0.TrustedComms;
        else
            return nil;
        end;
    end, 
    useParentChannelTitleSelector = function(v48) --[[ Line: 93 ]]
        -- upvalues: v17 (copy), v23 (copy), v14 (copy), l_useLocalUserId_0 (copy), v4 (copy), v15 (copy)
        local v49 = v17(v48);
        if v23 then
            return v14(v49);
        else
            local v50 = tonumber(l_useLocalUserId_0()) or 0;
            local v51 = v4.Hooks.useUserProfilesFetch({
                userIds = v15(v49, v50), 
                query = v4.Queries.userProfilesCombinedNameAndUsernameByUserIds
            });
            local v52 = v4.Hooks.useUserProfilesFetch({
                userIds = if v50 > 0 then {
                    (tostring(v50))
                } else {}, 
                query = v4.Queries.userProfilesCombinedNameAndUsernameByUserIds
            });
            return v14(v49, v51.data and v51.data.userProfiles, if v52.data then v4.Selectors.getCombinedNameFromId(v52.data, (tostring(v50))) else "");
        end;
    end, 
    useIsChatEnabled = v20, 
    useIsLoadingChatSettings = function() --[[ Line: 119 ]]
        -- upvalues: l_useSelector_0 (copy), l_FFlagReadAppChatFetchingVariable_0 (copy), v22 (copy), l_RetrievalStatus_0 (copy)
        return l_useSelector_0(function(v53) --[[ Line: 120 ]]
            -- upvalues: l_FFlagReadAppChatFetchingVariable_0 (ref), v22 (ref), l_RetrievalStatus_0 (ref)
            if l_FFlagReadAppChatFetchingVariable_0 then
                return v22(v53, "ChatAppReducer.ChatSettings.retrievalStatus") ~= l_RetrievalStatus_0.Done;
            else
                return nil;
            end;
        end);
    end, 
    useIsChatUserMessagesEnabled = if l_FFlagEnableScheduledSquads_0 then v21 else nil, 
    shouldShowOSAForConversation = if l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 then v28 else nil
};