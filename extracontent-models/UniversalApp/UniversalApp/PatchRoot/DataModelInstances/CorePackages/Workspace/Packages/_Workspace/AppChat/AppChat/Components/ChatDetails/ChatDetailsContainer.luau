local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v7 = require(l_Parent_0.UserProfiles);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useCallback_0 = v3.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v3.useEffect;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v13 = require(l_script_FirstAncestor_0.Hooks.useIsGroupChatEnabled);
local l_useState_0 = v3.useState;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v18 = require(l_script_FirstAncestor_0.Models.Conversation);
local v19 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local l_useUserProfilesFetch_0 = v7.Hooks.useUserProfilesFetch;
local l_userProfilesCombinedNameAndUsernameByUserIds_0 = v7.Queries.userProfilesCombinedNameAndUsernameByUserIds;
local v22 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local l_getConversationDisplayTitle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Conversation.getConversationDisplayTitle;
local v24 = require(l_script_FirstAncestor_0.LuaAppNavigationContext);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v26 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabled);
local v27 = require(l_script_FirstAncestor_0.Conversations.getConversationTitle);
local v28 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatRemoveUserProfileTitles);
local v29 = require(script.Parent.Selectors.selectChatUserEntryModelList);
local v30 = require(script.Parent.ChatDetailsPage);
local v31 = require(script.Parent.Dialogs.GenericDialogType);
local v32 = require(l_Parent_0.AppChatNetworking);
local v33 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v34 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatDetailsTelemetryLayer);
local v35 = require(l_script_FirstAncestor_0.Components.ChatDetails.ChatDetailsTelemetryEvents);
local v36 = require(l_script_FirstAncestor_0.Contexts.TelemetryState.ChatConversationTelemetryState);
local v37 = require(l_script_FirstAncestor_0.Contexts.TelemetryState.ChatDetailsTelemetryState);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local v39 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAlwaysDisplayUserCardsInChatDetails);
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v42 = {
    topBarHeight = 0, 
    wideMode = false, 
    participants = nil, 
    isGroupConversation = nil, 
    isGroupOwner = nil, 
    conversationId = nil, 
    conversation = nil, 
    navigateBack = function() --[[ Line: 64 ]] --[[ Name: navigateBack ]]

    end, 
    navigateToEditChatMembers = function() --[[ Line: 65 ]] --[[ Name: navigateToEditChatMembers ]]

    end, 
    navigateToDialog = function() --[[ Line: 66 ]] --[[ Name: navigateToDialog ]]

    end, 
    navigateToToast = function() --[[ Line: 67 ]] --[[ Name: navigateToToast ]]

    end, 
    navigateToConversation = function() --[[ Line: 68 ]] --[[ Name: navigateToConversation ]]

    end, 
    navigateToChatLanding = function() --[[ Line: 69 ]] --[[ Name: navigateToChatLanding ]]

    end
};
return function(v43) --[[ Line: 72 ]]
    -- upvalues: v2 (copy), v42 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v3 (copy), v24 (copy), l_useDispatch_0 (copy), l_useState_0 (copy), l_useNavigation_0 (copy), v13 (copy), v26 (copy), l_useEffect_0 (copy), l_useSelector_0 (copy), v6 (copy), v18 (copy), v32 (copy), l_useUserProfilesFetch_0 (copy), l_userProfilesCombinedNameAndUsernameByUserIds_0 (copy), v33 (copy), v34 (copy), v39 (copy), v29 (copy), v28 (copy), v27 (copy), l_getConversationDisplayTitle_0 (copy), v22 (copy), v19 (copy), v5 (copy), v31 (copy), v35 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), v36 (copy), v37 (copy), l_useEffectOnMount_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v30 (copy)
    local v44 = v2.Dictionary.join(v42, v43 or {});
    local v45 = l_useStyle_0();
    local v46 = l_useLocalization_0({
        pageHeaderText = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Label.Details" or "Feature.Chat.Label.ChatDetails", 
        generalText = "Feature.Chat.Label.General", 
        titleNotSetText = "Feature.Chat.Label.NotSet", 
        membersText = "Feature.Chat.Label.Members", 
        addFriendsText = "Feature.Chat.Label.AddConnections", 
        leaveGroupText = "Feature.Chat.Heading.LeaveGroup", 
        chatGroupText = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Label.GroupName" or "Feature.Chat.Label.ChatGroupName", 
        onlinePresenceText = "Common.Presence.Label.Online", 
        offlinePresenceText = "Common.Presence.Label.Offline", 
        tooManyPeopleText = {
            l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.AddConnectionsPartyLimit" or "Feature.Chat.Message.AddConnectionsLimit"; 
            friendNum = 5, 
            connectionsNum = 5
        }, 
        networkErrorToastText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        conversationTypeHeaderText = "Feature.Chat.Label.ExpandedChatFeatures", 
        enabledText = "Feature.Chat.Label.Available", 
        disabledText = "Feature.Chat.Label.Unavailable", 
        createUnfilteredChatText = "Feature.Chat.Label.CreateUnfilteredChat", 
        createUnfilteredChatSubtitleText = "Feature.Chat.Description.CreateUnfilteredChatCell"
    });
    local v47 = v3.useContext(v24);
    local v48 = l_useDispatch_0();
    local v49, v50 = l_useState_0(false);
    local v51 = l_useNavigation_0();
    local v52 = v13();
    local v53 = v26();
    l_useEffect_0(function() --[[ Line: 110 ]]
        -- upvalues: v53 (copy), v44 (copy)
        if not v53 then
            v44.navigateToChatLanding();
        end;
    end, {
        v53, 
        v44.navigateToChatLanding
    });
    local v55 = l_useSelector_0(function(v54) --[[ Line: 116 ]]
        -- upvalues: v6 (ref), v44 (copy), v18 (ref)
        return v6(v54, (("ChatAppReducer.Conversations.%*"):format(v44.conversationId or ""))) or v18.empty();
    end);
    local v57 = l_useSelector_0(function(v56) --[[ Line: 120 ]]
        -- upvalues: v6 (ref), v44 (copy)
        return v6(v56, (("ChatAppReducer.ParticipantMetadata.%*"):format(v44.conversationId or "")));
    end);
    local v58 = v55 and v55.source;
    l_useEffect_0(function() --[[ Line: 125 ]]
        -- upvalues: v58 (copy), v48 (copy), v32 (ref), v44 (copy)
        if v58 ~= "channels" then
            return;
        else
            v48(v32.rodux.GetConversationsParticipantsMetadata.API({
                v44.conversationId
            })):catch(function() --[[ Line: 131 ]]
                warn("Error in ChatDetailsContainer -> GetConversationsParticipantsMetadata");
            end);
            return;
        end;
    end, {
        v44.conversationId, 
        v44.participants, 
        v58
    });
    local v59 = l_useUserProfilesFetch_0({
        userIds = v55.participants, 
        query = l_userProfilesCombinedNameAndUsernameByUserIds_0
    });
    local v60 = v33(v34.Context);
    local v61 = nil;
    local v62 = nil;
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    if v55 then
        v61 = l_useSelector_0(function(v68) --[[ Line: 150 ]]
            -- upvalues: v39 (ref), v29 (ref), v55 (copy), v59 (copy)
            if v39 then
                return v29(v68, v55.participants, if v59 and v59.data then v59.data.userProfiles else nil);
            elseif v59.data then
                return v29(v68, v55.participants, v59.data.userProfiles);
            else
                return {};
            end;
        end);
        v63 = v55.conversationType == v18.Type.MULTI_USER_CONVERSATION;
        v62 = l_useSelector_0(function(v69) --[[ Line: 170 ]]
            -- upvalues: v63 (ref), v55 (copy)
            return v63 and v55.initiator == v69.LocalUserId;
        end);
        v64 = if v28 then v27(v55) else l_getConversationDisplayTitle_0(v55);
        if v57 then
            for v70, v71 in v61 do
                v61[v70] = v2.Dictionary.join(v71, {
                    metadata = v57[v70]
                });
            end;
        end;
        v66 = v22(v55);
        v65 = v63 and v66;
        if v65 then
            v52 = false;
        end;
        v67 = v55.moderationType == v19.ModerationType.TrustedComms;
    end;
    local v72 = v61 and #v61 or 0;
    local v73 = if v67 then v46.enabledText else v46.disabledText;
    if v55.isDefaultTitle then
        v64 = v46.titleNotSetText;
    end;
    local function _(v74) --[[ Line: 199 ]]
        -- upvalues: v5 (ref)
        return v5.new(function(v75, v76) --[[ Line: 200 ]]
            -- upvalues: v74 (copy)
            if #v74.participants > 5 then
                v76();
                return;
            else
                v75();
                return;
            end;
        end);
    end;
    local function v78() --[[ Line: 210 ]]
        -- upvalues: v44 (copy), v31 (ref)
        v44.navigateToDialog(v31.EditChatGroupNameDialog, {
            conversationId = v44.conversationId
        });
    end;
    local function v79() --[[ Line: 215 ]]
        -- upvalues: v44 (copy), v31 (ref), v60 (copy), v35 (ref)
        v44.navigateToDialog(v31.LeaveGroupDialog, {
            conversationId = v44.conversationId
        });
        v60.emit(v35.ChatDetailsLeaveGroupBtnClicked, {});
    end;
    local v80 = l_useCallback_0(function() --[[ Line: 221 ]]
        -- upvalues: v51 (copy), v47 (copy)
        if v51 then
            v47.navigateToUnfilteredThreadsLearnMore(v51.navigate);
            return;
        else
            v47.navigateToUnfilteredThreadsLearnMore();
            return;
        end;
    end, l_dependencyArray_0(v47, v51));
    local v84 = l_useCallback_0(function() --[[ Line: 229 ]]
        -- upvalues: v60 (copy), v35 (ref), v50 (copy), v48 (copy), v32 (ref), v44 (copy), v46 (copy)
        v60.emit(v35.ChatDetailsCreateUnfilteredChatCellClicked, {});
        v50(true);
        v48(v32.rodux.DuplicateConversation.API(v44.conversationId, "trusted_comms")):andThen(function(v81) --[[ Line: 233 ]]
            -- upvalues: v44 (ref), v46 (ref)
            local l_responseBody_0 = v81.responseBody;
            local v83 = l_responseBody_0 and l_responseBody_0.conversations and l_responseBody_0.conversations[1] and l_responseBody_0.conversations[1].id;
            if v83 then
                v44.navigateToConversation(v83);
                return;
            else
                v44.navigateToToast({
                    toastProps = {
                        toastContent = {
                            toastTitle = v46.networkErrorToastText
                        }
                    }
                });
                return;
            end;
        end):catch(function() --[[ Line: 251 ]]
            -- upvalues: v44 (ref), v46 (ref)
            v44.navigateToToast({
                toastProps = {
                    toastContent = {
                        toastTitle = v46.networkErrorToastText
                    }
                }
            });
        end):finally(function() --[[ Line: 260 ]]
            -- upvalues: v50 (ref)
            v50(false);
        end);
    end, {
        v48, 
        v50, 
        v44.navigateToToast, 
        v44.navigateToConversation, 
        v44.conversationId, 
        v72, 
        v62, 
        v60
    });
    local function v86(v85) --[[ Line: 276 ]]
        -- upvalues: v44 (copy), v31 (ref), v66 (ref), v63 (ref), v62 (ref)
        v44.navigateToDialog(v31.ParticipantDialog, {
            conversationId = v44.conversationId, 
            participantId = v85, 
            showRemoveUserButton = not v66 and v63 and v62
        });
    end;
    local function v88(v87) --[[ Line: 284 ]]
        -- upvalues: v44 (copy)
        v44.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v87
                }
            }
        });
    end;
    local function v93(v89) --[[ Line: 294 ]]
        -- upvalues: v55 (copy), v5 (ref), v44 (copy), v88 (copy), v60 (copy), v35 (ref)
        local l_v55_0 = v55;
        v5.new(function(v91, v92) --[[ Line: 200 ]]
            -- upvalues: l_v55_0 (copy)
            if #l_v55_0.participants > 5 then
                v92();
                return;
            else
                v91();
                return;
            end;
        end):andThen(function() --[[ Line: 295 ]]
            -- upvalues: v44 (ref), v55 (ref)
            v44.navigateToEditChatMembers(v55);
        end, function() --[[ Line: 298 ]]
            -- upvalues: v88 (ref), v89 (copy)
            v88(v89);
        end);
        v60.emit(v35.ChatDetailsAddFriendsBtnClicked, {});
    end;
    local v94 = v55 and v55.moderationType or v2.None;
    local v95 = v55 and v55.userPendingStatus or v2.None;
    local v96 = v36.useMergeState();
    l_useEffect_0(function() --[[ Line: 308 ]]
        -- upvalues: v96 (copy), v44 (copy), v94 (copy), v95 (copy)
        v96({
            conversationId = v44.conversationId, 
            moderationType = v94, 
            userPendingStatus = v95
        });
    end, {
        v44.conversationId, 
        v94, 
        v95
    });
    local v97 = v37.useMergeState();
    l_useEffect_0(function() --[[ Line: 316 ]]
        -- upvalues: v97 (copy), v55 (copy), v62 (ref)
        v97({
            participantsCount = #v55.participants, 
            isGroupOwner = v62
        });
    end, {
        #v55.participants, 
        v62
    });
    l_useEffectOnMount_0(function() --[[ Line: 323 ]]
        -- upvalues: v60 (copy), v35 (ref), v63 (ref)
        v60.emit(v35.ScreenRendered, {
            isGroupConversation = v63
        });
    end);
    return v3.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        AutoButtonColor = false, 
        Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil
    }, {
        ChatDetailsPage = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Content = v3.createElement(v30, v2.Dictionary.join({
                navigateBack = v44.navigateBack, 
                onGroupNameEntryCellActivated = v78, 
                onLeaveGroupCellActivated = v79, 
                onParticipantCellActivated = v86, 
                onAddFriendsCellActivated = function() --[[ Line: 351 ]] --[[ Name: onAddFriendsCellActivated ]]
                    -- upvalues: v93 (copy), v46 (copy)
                    return v93(v46.tooManyPeopleText);
                end, 
                onConversationTypeIconActivated = v80, 
                onCreateUnfilteredChatCellActivated = v84, 
                conversationTitle = v64, 
                conversation = v55, 
                conversationId = v44.conversationId, 
                participants = v61, 
                isGroupConversation = v63, 
                wideMode = v44.wideMode, 
                shouldHideGroupChatFunctionality = v65, 
                shouldShowAddFriends = v52, 
                shouldShowCreateUnfilteredChat = false, 
                conversationTypeText = v73, 
                isCreateUnfilteredChatLoading = v49, 
                topBarHeight = v44.topBarHeight, 
                LayoutOrder = 2, 
                style = v45
            }, v46))
        })
    });
end;