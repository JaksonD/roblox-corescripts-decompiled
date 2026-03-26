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
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v40 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAlwaysDisplayUserCardsInChatDetails);
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v44 = {
    topBarHeight = 0, 
    wideMode = false, 
    participants = nil, 
    isGroupConversation = nil, 
    isGroupOwner = nil, 
    conversationId = nil, 
    conversation = nil, 
    navigateBack = function() --[[ Line: 67 ]] --[[ Name: navigateBack ]]

    end, 
    navigateToEditChatMembers = function() --[[ Line: 68 ]] --[[ Name: navigateToEditChatMembers ]]

    end, 
    navigateToDialog = function() --[[ Line: 69 ]] --[[ Name: navigateToDialog ]]

    end, 
    navigateToToast = function() --[[ Line: 70 ]] --[[ Name: navigateToToast ]]

    end, 
    navigateToConversation = function() --[[ Line: 71 ]] --[[ Name: navigateToConversation ]]

    end, 
    navigateToChatLanding = function() --[[ Line: 72 ]] --[[ Name: navigateToChatLanding ]]

    end
};
return function(v45) --[[ Line: 75 ]]
    -- upvalues: v2 (copy), v44 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v3 (copy), v24 (copy), l_useDispatch_0 (copy), l_useState_0 (copy), l_useNavigation_0 (copy), v13 (copy), v26 (copy), l_useEffect_0 (copy), l_useSelector_0 (copy), v6 (copy), v18 (copy), v32 (copy), l_useUserProfilesFetch_0 (copy), l_userProfilesCombinedNameAndUsernameByUserIds_0 (copy), v33 (copy), v34 (copy), v40 (copy), v29 (copy), v28 (copy), v27 (copy), l_getConversationDisplayTitle_0 (copy), v22 (copy), v19 (copy), v5 (copy), v31 (copy), v35 (copy), l_useCallback_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v36 (copy), v37 (copy), l_useEffectOnMount_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v30 (copy)
    local v46 = v2.Dictionary.join(v44, v45 or {});
    local v47 = l_useStyle_0();
    local v48 = l_useLocalization_0({
        pageHeaderText = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Label.Details" or "Feature.Chat.Label.ChatDetails", 
        generalText = "Feature.Chat.Label.General", 
        titleNotSetText = "Feature.Chat.Label.NotSet", 
        membersText = "Feature.Chat.Label.Members", 
        addFriendsText = l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Label.AddFriends" or "Feature.Chat.Label.AddConnections", 
        leaveGroupText = "Feature.Chat.Heading.LeaveGroup", 
        chatGroupText = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Label.GroupName" or "Feature.Chat.Label.ChatGroupName", 
        onlinePresenceText = "Common.Presence.Label.Online", 
        offlinePresenceText = "Common.Presence.Label.Offline", 
        tooManyPeopleText = {
            if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.AddFriendsPartyLimit" or "Feature.Chat.Message.AddConnectionsPartyLimit" else l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.AddFriendsLimit" or "Feature.Chat.Message.AddConnectionsLimit"; 
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
    local v49 = v3.useContext(v24);
    local v50 = l_useDispatch_0();
    local v51, v52 = l_useState_0(false);
    local v53 = l_useNavigation_0();
    local v54 = v13();
    local v55 = v26();
    l_useEffect_0(function() --[[ Line: 119 ]]
        -- upvalues: v55 (copy), v46 (copy)
        if not v55 then
            v46.navigateToChatLanding();
        end;
    end, {
        v55, 
        v46.navigateToChatLanding
    });
    local v57 = l_useSelector_0(function(v56) --[[ Line: 125 ]]
        -- upvalues: v6 (ref), v46 (copy), v18 (ref)
        return v6(v56, (("ChatAppReducer.Conversations.%*"):format(v46.conversationId or ""))) or v18.empty();
    end);
    local v59 = l_useSelector_0(function(v58) --[[ Line: 129 ]]
        -- upvalues: v6 (ref), v46 (copy)
        return v6(v58, (("ChatAppReducer.ParticipantMetadata.%*"):format(v46.conversationId or "")));
    end);
    local v60 = v57 and v57.source;
    l_useEffect_0(function() --[[ Line: 134 ]]
        -- upvalues: v60 (copy), v50 (copy), v32 (ref), v46 (copy)
        if v60 ~= "channels" then
            return;
        else
            v50(v32.rodux.GetConversationsParticipantsMetadata.API({
                v46.conversationId
            })):catch(function() --[[ Line: 140 ]]
                warn("Error in ChatDetailsContainer -> GetConversationsParticipantsMetadata");
            end);
            return;
        end;
    end, {
        v46.conversationId, 
        v46.participants, 
        v60
    });
    local v61 = l_useUserProfilesFetch_0({
        userIds = v57.participants, 
        query = l_userProfilesCombinedNameAndUsernameByUserIds_0
    });
    local v62 = v33(v34.Context);
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    if v57 then
        v63 = l_useSelector_0(function(v70) --[[ Line: 159 ]]
            -- upvalues: v40 (ref), v29 (ref), v57 (copy), v61 (copy)
            if v40 then
                return v29(v70, v57.participants, if v61 and v61.data then v61.data.userProfiles else nil);
            elseif v61.data then
                return v29(v70, v57.participants, v61.data.userProfiles);
            else
                return {};
            end;
        end);
        v65 = v57.conversationType == v18.Type.MULTI_USER_CONVERSATION;
        v64 = l_useSelector_0(function(v71) --[[ Line: 179 ]]
            -- upvalues: v65 (ref), v57 (copy)
            return v65 and v57.initiator == v71.LocalUserId;
        end);
        v66 = if v28 then v27(v57) else l_getConversationDisplayTitle_0(v57);
        if v59 then
            for v72, v73 in v63 do
                v63[v72] = v2.Dictionary.join(v73, {
                    metadata = v59[v72]
                });
            end;
        end;
        v68 = v22(v57);
        v67 = v65 and v68;
        if v67 then
            v54 = false;
        end;
        v69 = v57.moderationType == v19.ModerationType.TrustedComms;
    end;
    local v74 = v63 and #v63 or 0;
    local v75 = if v69 then v48.enabledText else v48.disabledText;
    if v57.isDefaultTitle then
        v66 = v48.titleNotSetText;
    end;
    local function _(v76) --[[ Line: 208 ]]
        -- upvalues: v5 (ref)
        return v5.new(function(v77, v78) --[[ Line: 209 ]]
            -- upvalues: v76 (copy)
            if #v76.participants > 5 then
                v78();
                return;
            else
                v77();
                return;
            end;
        end);
    end;
    local function v80() --[[ Line: 219 ]]
        -- upvalues: v46 (copy), v31 (ref)
        v46.navigateToDialog(v31.EditChatGroupNameDialog, {
            conversationId = v46.conversationId
        });
    end;
    local function v81() --[[ Line: 224 ]]
        -- upvalues: v46 (copy), v31 (ref), v62 (copy), v35 (ref)
        v46.navigateToDialog(v31.LeaveGroupDialog, {
            conversationId = v46.conversationId
        });
        v62.emit(v35.ChatDetailsLeaveGroupBtnClicked, {});
    end;
    local v82 = l_useCallback_0(function() --[[ Line: 231 ]]
        -- upvalues: v53 (copy), v49 (copy)
        if v53 then
            v49.navigateToUnfilteredThreadsLearnMore(v53.navigate);
            return;
        else
            v49.navigateToUnfilteredThreadsLearnMore();
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v49, 
        v53
    } else l_dependencyArray_0(v49, v53));
    local v86 = l_useCallback_0(function() --[[ Line: 243 ]]
        -- upvalues: v62 (copy), v35 (ref), v52 (copy), v50 (copy), v32 (ref), v46 (copy), v48 (copy)
        v62.emit(v35.ChatDetailsCreateUnfilteredChatCellClicked, {});
        v52(true);
        v50(v32.rodux.DuplicateConversation.API(v46.conversationId, "trusted_comms")):andThen(function(v83) --[[ Line: 247 ]]
            -- upvalues: v46 (ref), v48 (ref)
            local l_responseBody_0 = v83.responseBody;
            local v85 = l_responseBody_0 and l_responseBody_0.conversations and l_responseBody_0.conversations[1] and l_responseBody_0.conversations[1].id;
            if v85 then
                v46.navigateToConversation(v85);
                return;
            else
                v46.navigateToToast({
                    toastProps = {
                        toastContent = {
                            toastTitle = v48.networkErrorToastText
                        }
                    }
                });
                return;
            end;
        end):catch(function() --[[ Line: 265 ]]
            -- upvalues: v46 (ref), v48 (ref)
            v46.navigateToToast({
                toastProps = {
                    toastContent = {
                        toastTitle = v48.networkErrorToastText
                    }
                }
            });
        end):finally(function() --[[ Line: 274 ]]
            -- upvalues: v52 (ref)
            v52(false);
        end);
    end, {
        v50, 
        v52, 
        v46.navigateToToast, 
        v46.navigateToConversation, 
        v46.conversationId, 
        v74, 
        v64, 
        v62
    });
    local function v88(v87) --[[ Line: 290 ]]
        -- upvalues: v46 (copy), v31 (ref), v68 (ref), v65 (ref), v64 (ref)
        v46.navigateToDialog(v31.ParticipantDialog, {
            conversationId = v46.conversationId, 
            participantId = v87, 
            showRemoveUserButton = not v68 and v65 and v64
        });
    end;
    local function v90(v89) --[[ Line: 298 ]]
        -- upvalues: v46 (copy)
        v46.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v89
                }
            }
        });
    end;
    local function v95(v91) --[[ Line: 308 ]]
        -- upvalues: v57 (copy), v5 (ref), v46 (copy), v90 (copy), v62 (copy), v35 (ref)
        local l_v57_0 = v57;
        v5.new(function(v93, v94) --[[ Line: 209 ]]
            -- upvalues: l_v57_0 (copy)
            if #l_v57_0.participants > 5 then
                v94();
                return;
            else
                v93();
                return;
            end;
        end):andThen(function() --[[ Line: 309 ]]
            -- upvalues: v46 (ref), v57 (ref)
            v46.navigateToEditChatMembers(v57);
        end, function() --[[ Line: 312 ]]
            -- upvalues: v90 (ref), v91 (copy)
            v90(v91);
        end);
        v62.emit(v35.ChatDetailsAddFriendsBtnClicked, {});
    end;
    local v96 = v57 and v57.moderationType or v2.None;
    local v97 = v57 and v57.userPendingStatus or v2.None;
    local v98 = v36.useMergeState();
    l_useEffect_0(function() --[[ Line: 322 ]]
        -- upvalues: v98 (copy), v46 (copy), v96 (copy), v97 (copy)
        v98({
            conversationId = v46.conversationId, 
            moderationType = v96, 
            userPendingStatus = v97
        });
    end, {
        v46.conversationId, 
        v96, 
        v97
    });
    local v99 = v37.useMergeState();
    l_useEffect_0(function() --[[ Line: 330 ]]
        -- upvalues: v99 (copy), v57 (copy), v64 (ref)
        v99({
            participantsCount = #v57.participants, 
            isGroupOwner = v64
        });
    end, {
        #v57.participants, 
        v64
    });
    l_useEffectOnMount_0(function() --[[ Line: 337 ]]
        -- upvalues: v62 (copy), v35 (ref), v65 (ref)
        v62.emit(v35.ScreenRendered, {
            isGroupConversation = v65
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
                navigateBack = v46.navigateBack, 
                onGroupNameEntryCellActivated = v80, 
                onLeaveGroupCellActivated = v81, 
                onParticipantCellActivated = v88, 
                onAddFriendsCellActivated = function() --[[ Line: 365 ]] --[[ Name: onAddFriendsCellActivated ]]
                    -- upvalues: v95 (copy), v48 (copy)
                    return v95(v48.tooManyPeopleText);
                end, 
                onConversationTypeIconActivated = v82, 
                onCreateUnfilteredChatCellActivated = v86, 
                conversationTitle = v66, 
                conversation = v57, 
                conversationId = v46.conversationId, 
                participants = v63, 
                isGroupConversation = v65, 
                wideMode = v46.wideMode, 
                shouldHideGroupChatFunctionality = v67, 
                shouldShowAddFriends = v54, 
                shouldShowCreateUnfilteredChat = false, 
                conversationTypeText = v75, 
                isCreateUnfilteredChatLoading = v51, 
                topBarHeight = v46.topBarHeight, 
                LayoutOrder = 2, 
                style = v47
            }, v48))
        })
    });
end;