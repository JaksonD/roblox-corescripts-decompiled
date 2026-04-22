local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(script.Parent.Logger);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.RoactNavigation);
local l_UniversalAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).UniversalAppPolicy;
local v8 = require(script.Parent.ChatConversation);
local v9 = require(script.Parent.PendingState.PendingStateConversationPage);
local v10 = require(l_script_FirstAncestor_0.LegacyAnalytics.RoactChatAnalytics);
local v11 = require(l_script_FirstAncestor_0.LegacyAnalytics.useAnalytics);
local v12 = require(l_script_FirstAncestor_0.Components.ChatConversation.Messages.Selectors.selectMessagesPure);
local v13 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v14 = require(l_script_FirstAncestor_0.Models.Conversation);
local v15 = require(l_script_FirstAncestor_0.Components.ChatDetails.Dialogs.GenericDialogType);
local v16 = require(l_Parent_0.AppChatNetworking);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v18 = require(script.Parent.mapDispatchToProps);
local v19 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useEffect_0 = v4.useEffect;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v24 = require(l_script_FirstAncestor_0.Hooks.useMapDispatch);
local v25 = require(l_script_FirstAncestor_0.Hooks.useGetUsers);
local v26 = require(l_script_FirstAncestor_0.Hooks.useGetUsersTyping);
local v27 = require(script.Parent.MessageInteraction.ReplyingContext.useReplyingToMessage);
local v28 = require(script.Parent.MessageInteraction.ReplyingContext.useReplyingToMessageDispatch);
local v29 = require(l_Parent_0.UserProfiles);
local v30 = require(l_script_FirstAncestor_0.Conversations.getConversationTitle);
local v31 = require(l_script_FirstAncestor_0.Conversations.getOtherParticipants);
local v32 = require(l_script_FirstAncestor_0.Hooks.useRecipientIds);
local v33 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local v34 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v36 = require(l_script_FirstAncestor_0.Hooks.useIsExternalNavigationAvailable);
local v37 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v38 = require(l_script_FirstAncestor_0.Hooks.useIsChatUserMessagesEnabled);
local l_chatInputBoxDisabledPressedSignal_0 = require(l_Parent_0.InterventionShared).Signals.chatInputBoxDisabledPressedSignal;
local v40 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local v41 = require(l_script_FirstAncestor_0.Hooks.useChatTimeoutDetails);
local v42 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local v43 = require(l_script_FirstAncestor_0.Contexts.TelemetryState.ChatConversationTelemetryState);
local v44 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v45 = require(script.Parent.ChatConversationTelemetryEvents);
local v46 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabled);
local l_interventionTreatmentShownSignal_0 = require(l_Parent_0.InterventionShared).Signals.interventionTreatmentShownSignal;
local l_useSignal_0 = require(l_Parent_0.RoactUtils).Hooks.useSignal;
local l_Constants_0 = require(l_Parent_0.InterventionShared).Utils.Constants;
local v50 = require(script.Parent.Messages.Thunks.getAllRemainingOlderMessages);
local v51 = require(script.Parent.Messages.NetworkRequests.getOlderMessages);
local v52 = require(l_script_FirstAncestor_0.Hooks.useCallbackWithDynamicConversationId);
local v53 = require(l_script_FirstAncestor_0.Hooks.useShouldShowConversationOverlay);
local v54 = require(l_script_FirstAncestor_0.App.Hooks.useKeybind);
local v55 = require(l_script_FirstAncestor_0.EnumScreens);
local v56 = require(script.Parent.EnumMessageTypes);
local v57 = require(script.Parent.EnumCustomEntryTypes);
local v58 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatPerfTracking);
local v59 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local v60 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local l_GetFFlagEnableAppChatInExperience_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAppChatInExperience;
local v62 = require(l_script_FirstAncestor_0.Flags.FFlagRenderChatConversationOnlyWhenVisible);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
local l_FFlagAppChatInterventionFocusFix_0 = require(l_Parent_0.InterventionShared).Flags.FFlagAppChatInterventionFocusFix;
local l_FFlagTCUpsellModalEnabled_DEV_0 = require(l_Parent_0.SharedFlags).FFlagTCUpsellModalEnabled_DEV;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagDebugEnableTCDoubleOptIn_DEV_0 = require(l_Parent_0.SharedFlags).FFlagDebugEnableTCDoubleOptIn_DEV;
local l_FFlagAppChatEnableDoubleOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableDoubleOptIn;
local l_FFlagEnableAEGIS2AppChatConversationBanner_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner;
local l_FFlagAppChatShowOSAOnPageEntry_0 = require(l_Parent_0.SharedFlags).FFlagAppChatShowOSAOnPageEntry;
local v72 = game:DefineFastInt("AppChatGetAllMessagesDepth", 100);
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local v74 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatSuppressGroupOSAContextCard);
local l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 = require(l_Parent_0.SharedFlags).FFlagAppChatNavigateBackIfOSAUnacknowledged;
local v76 = require(l_script_FirstAncestor_0.Utils.shouldShowOSAForConversation);
local v77 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatSignalsMessageStore);
local l_useMessageItemList_0 = require(l_script_FirstAncestor_0.Hooks.useMessageItemList).useMessageItemList;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v80 = require(l_script_FirstAncestor_0.Utils.shouldShowU13ChatOptInForConversation);
local l_navigateWithOsaGate_0 = require(l_script_FirstAncestor_0.Utils).navigateWithOsaGate;
local v82 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatReactToFaeForOsa);
local v83 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatNudgeToChatUpsell_DEV);
local v84 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatNudgeToChatUpsellEnabled);
local function _(v85) --[[ Line: 98 ]] --[[ Name: isOverlayNavigation ]]
    return v85 and v85.action and v85.action.params and v85.action.params.isOverlay or false;
end;
local v88 = {
    topBarHeight = 0, 
    wideMode = false, 
    chatInputPlaceholderKey = "Feature.Chat.Label.ChatInputPlaceholder", 
    replyChatInputPlaceholderKey = "Feature.Chat.Label.ReplyChatInputPlaceholder", 
    replyToYourselfChatInputPlaceholderKey = "Feature.Chat.Label.ReplyToYourselfChatInputPlaceholder", 
    messageDefaultNoticeKey = "Feature.Chat.Message.Default", 
    messageModeratedNoticeKey = "Feature.Chat.Message.MessageContentModerated", 
    newTextKey = "Feature.Chat.Label.New", 
    schedulePartyTextKey = "Feature.Squads.Action.ScheduleParty", 
    messageHiddenNoticeKey = "Feature.Chat.Label.MessageNotAvailable", 
    networkErrorTextKey = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    notImplementedMessageTypeKey = "Feature.Chat.Label.NotImplementedMessageType", 
    viewProfileOnAvatarPressed = true, 
    unknownUserTextKey = "Feature.Chat.Label.UnknownUser", 
    oneUserTyping = {
        "Feature.Chat.Message.OneUserTyping"; 
        DISPLAY_NAME = ""
    }, 
    twoUsersTyping = {
        "Feature.Chat.Message.TwoUsersTyping"; 
        DISPLAY_NAME_1 = "", 
        DISPLAY_NAME_2 = ""
    }, 
    severalUsersTyping = "Feature.Chat.Message.SeveralUsersTyping", 
    pendingStateBodyKey = "Feature.Chat.Message.ChatIsUnfiltered", 
    connectUnavailableWithUserKey = "Feature.Chat.RobloxConnectUnavailableWithUser", 
    chatUnavailableWithUserKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.PartyUnavailableWithUser" or "Feature.Chat.Message.ChatUnavailableWithUser", 
    getReadingMessagesIsEnabled = function() --[[ Line: 125 ]] --[[ Name: getReadingMessagesIsEnabled ]]

    end, 
    updateConversationTitle = function(_) --[[ Line: 126 ]] --[[ Name: updateConversationTitle ]]

    end, 
    navigateToScreen = function() --[[ Line: 127 ]] --[[ Name: navigateToScreen ]]

    end, 
    inputBarDisabledKey = "Feature.Chat.Label.ChatDisabled", 
    navigateToChatLanding = function() --[[ Line: 129 ]] --[[ Name: navigateToChatLanding ]]

    end, 
    releaseInputBarFocus = function() --[[ Line: 130 ]] --[[ Name: releaseInputBarFocus ]]

    end, 
    navigateToSquadLobby = function() --[[ Line: 131 ]] --[[ Name: navigateToSquadLobby ]]

    end, 
    navigateToConversationOverlay = function() --[[ Line: 132 ]] --[[ Name: navigateToConversationOverlay ]]

    end, 
    getCanAccessParty = true
};
local function v95(v89) --[[ Line: 137 ]] --[[ Name: getOsaState ]]
    -- upvalues: v74 (copy), v14 (copy)
    local v90 = v89 and v89.fetchedOldestMessage;
    local v91 = not v74 or not v89 or v89.conversationType ~= v14.Type.MULTI_USER_CONVERSATION;
    local v92 = v89 and v91 and (v89.source == "friends" or v89.osaAcknowledgementStatus == v14.OsaAcknowledgementStatus.Unacknowledged or v89.osaAcknowledgementStatus == v14.OsaAcknowledgementStatus.Acknowledged);
    local v93 = v89 and v89.osaAcknowledgementStatus == v14.OsaAcknowledgementStatus.Unacknowledged;
    local v94 = v89 and v89.source == "friends";
    return {
        shouldShowOsaCardInConversation = v92, 
        fetchedOldestMessage = v90, 
        shouldShowOsaCardOnInitialLoad = v92 and v93 and not v94, 
        shouldShowOsaCardNow = v92 and (v90 or v94)
    };
end;
ChatConversationContainer = function(v96) --[[ Line: 165 ]] --[[ Name: ChatConversationContainer ]]
    -- upvalues: v5 (copy), v88 (copy), v11 (copy), v4 (copy), v10 (copy), v24 (copy), v18 (copy), v19 (copy), v32 (copy), l_HttpService_0 (copy), l_useLocalUserId_0 (copy), v34 (copy), v38 (copy), v46 (copy), l_useDispatch_0 (copy), l_useEffect_0 (copy), l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (copy), v6 (copy), l_navigateWithOsaGate_0 (copy), v76 (copy), v82 (copy), v80 (copy), l_FFlagAppChatInterventionFocusFix_0 (copy), l_useSignal_0 (copy), l_interventionTreatmentShownSignal_0 (copy), l_Constants_0 (copy), v29 (copy), v31 (copy), v30 (copy), v25 (copy), v26 (copy), v77 (copy), l_useMessageItemList_0 (copy), v12 (copy), v95 (copy), v56 (copy), v57 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), v37 (copy), v60 (copy), v27 (copy), v28 (copy), l_useLocalization_0 (copy), v44 (copy), v42 (copy), v43 (copy), v33 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), v52 (copy), v16 (copy), v3 (copy), l_FFlagDebugEnableTCDoubleOptIn_DEV_0 (copy), v54 (copy), l_FFlagTCUpsellModalEnabled_DEV_0 (copy), v83 (copy), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), v84 (copy), v53 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), l_useSelector_0 (copy), v40 (copy), v41 (copy), v45 (copy), v13 (copy), v36 (copy), v55 (copy), v14 (copy), v15 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_chatInputBoxDisabledPressedSignal_0 (copy), v58 (copy), v62 (copy), v59 (copy), v50 (copy), v51 (copy), v72 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), v9 (copy), v8 (copy)
    local v97 = v5.Dictionary.join(v88, v96);
    local v98 = v11();
    local v100 = v4.useCallback(function(v99) --[[ Line: 168 ]]
        -- upvalues: v98 (copy), v10 (ref), v97 (copy)
        v98:navigate(v10.NavigationEvents.ChatConversationProfile);
        v97.openViewProfile(v99);
    end, {
        v97.openViewProfile, 
        v98
    });
    local v101 = v24(v18);
    local v102 = v19(v97.conversationId);
    local v103 = nil;
    local v104 = v32(v102);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 176 ]]
        -- upvalues: l_HttpService_0 (ref), v104 (copy)
        return l_HttpService_0:JSONEncode(v104);
    end);
    v103 = if l_status_0 then l_result_0 else "[]";
    local v107 = nil;
    local v108 = nil;
    local v109 = l_useLocalUserId_0();
    local v110 = v34();
    local v111 = v38();
    local v112 = v46();
    local v113 = l_useDispatch_0();
    l_useEffect_0(function() --[[ Line: 190 ]]
        -- upvalues: v112 (copy), v97 (copy)
        if not v112 then
            v97.navigateToChatLanding();
        end;
    end, {
        v112, 
        v97.navigateToChatLanding
    });
    if l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 then
        local v114 = if v97.navigation and v97.navigation.getParam then v97.navigation.getParam("isNavigatedFromGroupOSAJoin", false) else false;
        if l_FFlagAppChatShowOSAOnPageEntry_0 then
            l_useEffect_0(function() --[[ Line: 203 ]]
                -- upvalues: v97 (copy), v6 (ref), l_navigateWithOsaGate_0 (ref), v113 (copy)
                if not v97.navigation or not v97.navigation.addListener then
                    return;
                else
                    local v115 = v97.navigation.addListener(v6.Events.WillFocus, function() --[[ Line: 207 ]]
                        -- upvalues: l_navigateWithOsaGate_0 (ref), v97 (ref), v113 (ref)
                        l_navigateWithOsaGate_0({
                            conversationId = v97.conversationId, 
                            dispatch = v113, 
                            onAccepted = function() --[[ Line: 211 ]] --[[ Name: onAccepted ]]

                            end, 
                            onDeclined = function() --[[ Line: 212 ]] --[[ Name: onDeclined ]]
                                -- upvalues: v97 (ref)
                                v97.navigateToChatLanding();
                            end
                        });
                    end);
                    return function() --[[ Line: 217 ]]
                        -- upvalues: v115 (copy)
                        if v115 then
                            v115:remove();
                        end;
                    end;
                end;
            end, {
                v97.navigation, 
                v97.conversationId, 
                v113
            });
        else
            local l_v114_0 = v114 --[[ copy: 17 -> 70 ]];
            l_useEffect_0(function() --[[ Line: 224 ]]
                -- upvalues: l_v114_0 (copy), v76 (ref), v102 (ref), v97 (copy)
                if not l_v114_0 and v76(v102) then
                    v97.navigateToChatLanding();
                end;
            end, {
                v102, 
                v97.navigateToChatLanding, 
                v114
            });
        end;
    end;
    if v82 then
        l_useEffect_0(function() --[[ Line: 234 ]]
            -- upvalues: v102 (ref), v76 (ref), v80 (ref), l_navigateWithOsaGate_0 (ref), v97 (copy), v113 (copy)
            if not v102 then
                return;
            else
                local v117 = v76(v102);
                local v118 = v80(v102);
                if v117 or v118 then
                    l_navigateWithOsaGate_0({
                        conversationId = v97.conversationId, 
                        dispatch = v113, 
                        onAccepted = function() --[[ Line: 244 ]] --[[ Name: onAccepted ]]

                        end, 
                        onDeclined = function() --[[ Line: 245 ]] --[[ Name: onDeclined ]]
                            -- upvalues: v97 (ref)
                            v97.navigateToChatLanding();
                        end
                    });
                end;
                return;
            end;
        end, {
            v102, 
            v97.conversationId, 
            v113
        });
    end;
    if l_FFlagAppChatInterventionFocusFix_0 then
        l_useSignal_0(l_interventionTreatmentShownSignal_0, v4.useCallback(function(v119) --[[ Line: 262 ]]
            -- upvalues: l_Constants_0 (ref), v97 (copy)
            if v119 == l_Constants_0.TreatmentType.PartyChatNudgeDialog or v119 == l_Constants_0.TreatmentType.PartyChatTimeoutDialog then
                v97.releaseInputBarFocus();
            end;
        end, {
            v97.releaseInputBarFocus
        }));
    end;
    v108 = v29.Hooks.useUserProfilesFetch({
        userIds = v31(v102, v109), 
        query = v29.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v120 = v29.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v109))
        }, 
        query = v29.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    v107 = v30(v102, v108.data and v108.data.userProfiles, if v120.data then v29.Selectors.getCombinedNameFromId(v120.data, (tostring(v109))) else "");
    local v121 = v25();
    local v122 = v26(v97.conversationId);
    local v123 = v4.useRef({
        itemList = {}, 
        previousMessagesState = {}, 
        previousSendingMessagesState = {}, 
        previousMessagesResult = {}
    });
    local v124 = nil;
    if v77 then
        v124 = l_useMessageItemList_0(v97.conversationId, v121, v109, v102);
    end;
    local v125 = v4.useMemo(function() --[[ Line: 305 ]]
        -- upvalues: v77 (ref), v124 (ref), v123 (copy), v12 (ref), v102 (ref), v97 (copy), v121 (copy), v109 (copy)
        if v77 then
            return v124;
        else
            v123.current = v12({
                conversation = v102, 
                conversationId = v97.conversationId, 
                Users = v121, 
                localUserId = v109
            }, v123.current);
            return v123.current.itemList;
        end;
    end, {
        v102, 
        v97.conversationId, 
        v121, 
        v109, 
        v124
    });
    local v126 = v95(v102);
    local v128 = v4.useMemo(function() --[[ Line: 322 ]]
        -- upvalues: v126 (copy), v125 (copy), v56 (ref), v57 (ref)
        local v127 = {};
        if v126.shouldShowOsaCardOnInitialLoad and not v126.fetchedOldestMessage then
            return v127;
        else
            v127 = table.clone(v125);
            if v126.shouldShowOsaCardNow then
                table.insert(v127, {
                    messageType = v56.Custom, 
                    customEntryType = v57.OsaContextCardOneToOne, 
                    stable_key = v57.OsaContextCardOneToOne
                });
            end;
            return v127;
        end;
    end, {
        v125, 
        v102, 
        v126.shouldShowOsaCardOnInitialLoad, 
        v126.shouldShowOsaCardInConversation, 
        v126.shouldShowOsaCardNow, 
        v126.fetchedOldestMessage
    });
    local v129 = if v122[1] and v108.data then v29.Selectors.getCombinedNameFromId(v108.data, v122[1].id) else nil;
    local v130 = if v122[2] and v108.data then v29.Selectors.getCombinedNameFromId(v108.data, v122[2].id) else nil;
    local v131 = true;
    if #v122 == 1 and not v129 then
        v131 = false;
    elseif #v122 == 2 and (not v129 or not v130) then
        v131 = false;
    end;
    local v132 = l_GetFFlagEnableAppChatInExperience_0() and v37();
    local v133 = nil;
    local v134 = nil;
    local v135 = nil;
    local v136 = nil;
    if v60() then
        v133 = v27();
        v134 = v28();
        if v133 then
            v136 = v133.senderTargetId == v109;
            v135 = if not v136 and v108.data then v29.Selectors.getCombinedNameFromId(v108.data, v133.senderTargetId) else nil;
        end;
    end;
    local v137 = l_useLocalization_0({
        chatInputPlaceholder = v97.chatInputPlaceholderKey, 
        replyChatInputPlaceholder = {
            v97.replyChatInputPlaceholderKey; 
            DISPLAY_NAME = v135
        }, 
        replyToYourselfChatInputPlaceholder = v97.replyToYourselfChatInputPlaceholderKey, 
        invalidMessageTypeText = v97.notImplementedMessageTypeKey, 
        messageDefaultNoticeText = v97.messageDefaultNoticeKey, 
        messageModeratedNoticeText = v97.messageModeratedNoticeKey, 
        messageHiddenNoticeText = v97.messageHiddenNoticeKey, 
        networkErrorText = v97.networkErrorTextKey, 
        newText = v97.newTextKey, 
        schedulePartyText = v97.schedulePartyTextKey, 
        unknownUserText = v97.unknownUserTextKey, 
        oneUserTyping = {
            "Feature.Chat.Message.OneUserTyping"; 
            DISPLAY_NAME = v129
        }, 
        twoUsersTyping = {
            "Feature.Chat.Message.TwoUsersTyping"; 
            DISPLAY_NAME_1 = v129, 
            DISPLAY_NAME_2 = v130
        }, 
        severalUsersTyping = v97.severalUsersTyping, 
        bottomModalText = v97.chatUnavailableWithUserKey, 
        inputBarDisabledText = v97.inputBarDisabledKey
    });
    local v138 = v44(v42.Context);
    local v139 = v43.useMergeState();
    local v140 = v43.useClearState();
    local v141 = v102 and v102.moderationType or v5.None;
    local v142 = v102 and v102.userPendingStatus or v5.None;
    l_useEffect_0(function() --[[ Line: 416 ]]
        -- upvalues: v139 (copy), v97 (copy), v141 (copy), v142 (copy)
        v139({
            conversationId = v97.conversationId, 
            moderationType = v141, 
            userPendingStatus = v142
        });
    end, {
        v139, 
        v97.conversationId, 
        v141, 
        v142
    });
    local v143 = v33(v102 or {});
    local v144 = v102 and v102.source;
    if l_FFlagAppChatEnableDoubleOptIn_0 then
        local v145, v146 = v52(v16.rodux.GetModalSequence.API, v97.conversationId);
        local l_v146_0 = v146 --[[ copy: 42 -> 68 ]];
        local l_v145_0 = v145 --[[ copy: 41 -> 69 ]];
        l_useEffect_0(function() --[[ Line: 432 ]]
            -- upvalues: l_v146_0 (copy), v143 (copy), v144 (copy), v113 (copy), v16 (ref), v97 (copy), v132 (copy), v3 (ref), l_v145_0 (copy)
            if not l_v146_0 then
                return;
            else
                if v143 and v144 == "channels" then
                    v113(v16.rodux.GetPendingStateModal.API(v97.conversationId, v132)):catch(function(v149) --[[ Line: 438 ]]
                        -- upvalues: v3 (ref)
                        v3:warning((("GetPendingStateModal error in ChatConversationContainer %*"):format((tostring(v149)))));
                    end);
                end;
                if not v143 then
                    v113(l_v145_0({
                        modalSequence = v16.Constants.ModalSequence.ConversationTopModal, 
                        isInExperience = v132
                    })):catch(function(v150) --[[ Line: 447 ]]
                        -- upvalues: v3 (ref)
                        v3:warning((("GetModalSequence for ConversationTopModal error in ChatConversationContainer %*"):format((tostring(v150)))));
                    end);
                end;
                return;
            end;
        end, {
            v97.conversationId, 
            v146, 
            v132, 
            v143, 
            v144
        });
    else
        l_useEffect_0(function() --[[ Line: 455 ]]
            -- upvalues: v144 (copy), v143 (copy), v113 (copy), v16 (ref), v97 (copy), v132 (copy)
            if v144 ~= "channels" then
                return;
            elseif v143 then
                v113(v16.rodux.GetPendingStateModal.API(v97.conversationId, v132)):catch(function(v151) --[[ Line: 461 ]]
                    warn("GetPendingStateModal error in ChatConversationContainer " .. tostring(v151));
                end);
                return;
            else
                v113(v16.rodux.GetConversationTopModal.API(v97.conversationId, v132)):catch(function(v152) --[[ Line: 467 ]]
                    warn("GetConversationTopModal error in ChatConversationContainer " .. tostring(v152));
                end);
                return;
            end;
        end, {
            v97.conversationId, 
            v113, 
            v144
        });
    end;
    local v153, v154 = v52(v16.rodux.GetModalSequence.API, v97.conversationId);
    l_useEffect_0(function() --[[ Line: 478 ]]
        -- upvalues: v143 (copy), v154 (ref), v113 (copy), v153 (copy), v16 (ref), v132 (copy), v3 (ref)
        if not v143 and v154 then
            v113(v153({
                modalSequence = v16.Constants.ModalSequence.ConversationOverlay, 
                isInExperience = v132
            })):catch(function(v155) --[[ Line: 483 ]]
                -- upvalues: v3 (ref)
                v3:warning((("GetModalSequence error in ChatConversationContainer %*"):format((tostring(v155)))));
            end);
        end;
    end, {
        v154, 
        v97.conversationId, 
        v143, 
        v132, 
        v141
    });
    if l_FFlagDebugEnableTCDoubleOptIn_DEV_0 then
        v54({
            keyCode = Enum.KeyCode.O, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 490 ]]
            -- upvalues: v3 (ref), v113 (copy), v97 (copy), v16 (ref)
            v3:debug("Ctrl + O pressed, showing new TC double opt in banner");
            v113({
                type = "DEBUG_ShowNewTopModal", 
                conversationId = v97.conversationId, 
                modalVariant = v16.Constants.ConversationTopModal.AddTrustedConnection
            });
        end, {
            v113, 
            v97.conversationId
        });
        v54({
            keyCode = Enum.KeyCode.P, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 499 ]]
            -- upvalues: v3 (ref), v113 (copy), v97 (copy), v16 (ref)
            v3:debug("Ctrl + P pressed, showing new TC double opt in request banner");
            v113({
                type = "DEBUG_ShowNewTopModal", 
                conversationId = v97.conversationId, 
                modalVariant = v16.Constants.ConversationTopModal.TrustedConnectionRequest
            });
        end, {
            v113, 
            v97.conversationId
        });
    end;
    if l_FFlagTCUpsellModalEnabled_DEV_0 then
        v54({
            keyCode = Enum.KeyCode.L, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 510 ]]
            -- upvalues: v3 (ref), v113 (copy), v97 (copy), v16 (ref)
            v3:debug("Ctrl + L pressed, showing new TC created overlay");
            v113({
                type = "DEBUG_ShowNewTCOverlay", 
                conversationId = v97.conversationId, 
                modalVariant = v16.Constants.ConversationOverlay.TrustedConnectionCreated
            });
        end, {
            v113, 
            v97.conversationId
        });
    end;
    if v83 then
        v54({
            keyCode = Enum.KeyCode.N, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 521 ]]
            -- upvalues: v3 (ref), v113 (copy), v97 (copy), v16 (ref)
            v3:debug("Ctrl + N pressed, showing nudge to chat upsell bottom modal");
            v113({
                type = "DEBUG_ShowNudgeToChatUpsellOverlay", 
                conversationId = v97.conversationId, 
                modalVariant = v16.Constants.ConversationBottomModal.NudgeToBottomChatUpsell
            });
        end, {
            v113, 
            v97.conversationId
        });
    end;
    if l_FFlagEnableAEGIS2AppChatConversationBanner_0 or v84 then
        local v156 = nil;
        local v157, v158 = v52(v16.rodux.GetModalSequence.API, v97.conversationId);
        v156 = v157;
        v154 = v158;
        do
            local l_v156_0 = v156;
            l_useEffect_0(function() --[[ Line: 537 ]]
                -- upvalues: v154 (ref), v113 (copy), l_v156_0 (ref), v16 (ref), v132 (copy), v3 (ref)
                if not v154 then
                    return;
                else
                    v113(l_v156_0({
                        modalSequence = v16.Constants.ModalSequence.ConversationBottomModal, 
                        isInExperience = v132
                    })):catch(function(v160) --[[ Line: 545 ]]
                        -- upvalues: v3 (ref)
                        v3:warning((("GetModalSequence for ConversationBottomModal error in ChatConversationContainer %*"):format((tostring(v160)))));
                    end);
                    return;
                end;
            end, {
                v97.conversationId, 
                v154, 
                v132
            });
        end;
    end;
    local v161 = v53(v97.conversationId);
    l_useEffect_0(function() --[[ Line: 553 ]]
        -- upvalues: v161 (copy), v97 (copy)
        if v161 then
            v97.navigateToConversationOverlay();
        end;
    end, {
        v161, 
        v97.conversationId
    });
    local v162 = nil;
    local v163 = nil;
    local v164 = nil;
    local v165 = nil;
    if l_getFFlagAppChatEnableIntervention_0() then
        local v166 = v144 ~= "channels";
        local l_v166_0 = v166 --[[ copy: 48 -> 66 ]];
        local v169 = l_useSelector_0(function(v168) --[[ Line: 565 ]]
            -- upvalues: l_v166_0 (copy), v16 (ref), v97 (copy), v40 (ref)
            return (if l_v166_0 then v16.rodux.GetChatModerationStatuses.getStatus(v168) else v16.rodux.GetChatModerationStatuses.getStatus(v168, v97.conversationId)) == v40.Enum.NetworkStatus.NotStarted;
        end);
        local l_v169_0 = v169 --[[ copy: 49 -> 67 ]];
        l_useEffect_0(function() --[[ Line: 572 ]]
            -- upvalues: l_v169_0 (copy), v113 (copy), v16 (ref), l_v166_0 (copy), v97 (copy)
            if l_v169_0 then
                v113(v16.rodux.GetChatModerationStatuses.API(if l_v166_0 then nil else {
                    v97.conversationId
                })):catch(function(v171) --[[ Line: 578 ]]
                    warn("GetChatModerationStatuses error in ChatConversationContainer " .. tostring(v171));
                end);
            end;
        end, {
            v97.conversationId, 
            v166, 
            v113, 
            v169
        });
        local v172 = v41({
            conversationId = v97.conversationId, 
            conversationModerationType = v141
        });
        v162 = v172.isTimedOut;
        v163 = v172.timeoutEndTimestamp;
        v164 = v172.decisionEventId;
        v165 = v172.duration;
    end;
    local v173 = nil;
    l_useEffect_0(function() --[[ Line: 595 ]]
        -- upvalues: v138 (copy), v45 (ref), v125 (copy)
        v138.emit(v45.ScreenRendered, {
            loadedMessageCount = #v125
        });
    end, {
        v97.conversationId
    });
    v173 = v4.useCallback(function(v174) --[[ Line: 603 ]]
        -- upvalues: v138 (copy), v45 (ref), v140 (copy)
        v138.emit(v45.ScreenExit, {
            conversationExitType = v174
        });
        v140();
    end, {
        v138, 
        v140
    });
    v102 = v102 or {};
    local v175 = false;
    if v102.participantPendingStatus ~= v13.UserPendingStatus.Pending then
        v175 = v111;
    end;
    local v176 = not v175 and v111;
    local v177 = v36({
        v55.ViewUserProfile
    });
    local v178 = v102.conversationType == v14.Type.MULTI_USER_CONVERSATION;
    local v180 = l_useSelector_0(function(v179) --[[ Line: 623 ]]
        -- upvalues: v178 (copy), v102 (ref)
        return v178 and v102.initiator == v179.LocalUserId;
    end);
    local function v182(v181) --[[ Line: 628 ]]
        -- upvalues: v177 (copy), v55 (ref), v100 (copy), v97 (copy), v15 (ref), v143 (copy), v178 (copy), v180 (copy)
        if v177[v55.ViewUserProfile] then
            v100(v181);
            return;
        else
            v97.navigateToScreen(v15.ParticipantDialog, {
                conversationId = v97.conversationId, 
                participantId = v181, 
                showRemoveUserButton = not v143 and v178 and v180
            }, true);
            return;
        end;
    end;
    local v183 = if v133 then if v136 then v137.replyToYourselfChatInputPlaceholder else v137.replyChatInputPlaceholder else v137.chatInputPlaceholder;
    l_useEffect_0(function() --[[ Line: 646 ]]
        -- upvalues: v97 (copy), v107 (ref)
        v97.updateConversationTitle(v107);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v107, 
        v97.updateConversationTitle
    } else l_dependencyArray_0(v107, v97.updateConversationTitle));
    local v184 = if l_getFFlagAppChatEnableIntervention_0() then v4.useCallback(function() --[[ Line: 655 ]]
        -- upvalues: l_chatInputBoxDisabledPressedSignal_0 (ref), v163 (ref), v164 (ref), v165 (ref)
        l_chatInputBoxDisabledPressedSignal_0:fire({
            endTimestamp = v163, 
            decisionEventId = v164, 
            duration = v165
        });
    end, {
        v163, 
        v164, 
        v165
    }) else nil;
    local v185, v186 = v4.useState(v97.navigation and v97.navigation.isFocused and v97.navigation.isFocused());
    local v187 = nil;
    local v188 = nil;
    if v58 then
        v187 = v185;
        if v62 and v97.isFocused and not v97.isFocused() then
            v187 = false;
        end;
        v188 = v187 and not v143;
    end;
    local v189 = nil;
    if v58 then
        local v190 = v4.useRef(false);
        local l_v190_0 = v190 --[[ copy: 62 -> 65 ]];
        v4.useEffect(function() --[[ Line: 685 ]]
            -- upvalues: l_v190_0 (copy), v175 (copy)
            l_v190_0.current = not v175;
        end, {
            v97.conversationId, 
            v175
        });
        local v193 = v4.useCallback(function(v192) --[[ Line: 689 ]]
            -- upvalues: v59 (ref), v97 (copy), v188 (ref), l_v190_0 (copy), v3 (ref), v125 (copy)
            if not v59.isActive(v59.Events.ChatConversationTTI, {
                conversationId = v97.conversationId
            }) or not v188 then
                return;
            elseif not l_v190_0.current then
                v3:debug("TTI: Messages ready but waiting for input bar (chatInputBarReady={}, reason={})", l_v190_0.current, v192);
                return;
            else
                v59.finish(v59.Events.ChatConversationTTI, {
                    conversationId = v97.conversationId, 
                    numElementsRendered = #v125
                });
                return;
            end;
        end, {
            v97.conversationId, 
            v185, 
            v143, 
            #v125
        });
        v4.useEffect(function() --[[ Line: 713 ]]
            -- upvalues: v193 (copy)
            v193("messages_ready");
        end, {
            v193, 
            #v125, 
            v97.conversationId
        });
        v189 = v4.useCallback(function() --[[ Line: 717 ]]
            -- upvalues: l_v190_0 (copy), v193 (copy)
            l_v190_0.current = true;
            v193("input_bar_ready");
        end, {
            v193
        });
    end;
    if v58 then
        local v194 = v4.useRef(nil);
        local l_v194_0 = v194 --[[ copy: 62 -> 64 ]];
        v4.useEffect(function() --[[ Line: 731 ]]
            -- upvalues: v3 (ref), v97 (copy), l_v194_0 (copy), v59 (ref)
            v3:debug("Perf: Resetting message perf tracking for conversation {}", v97.conversationId);
            l_v194_0.current = nil;
            local v196 = {
                conversationId = v97.conversationId
            };
            v59.cancel(v59.Events.MessageSendToPendingRender, v196);
            v59.cancel(v59.Events.MessageSendResponseToFinalRender, v196);
            v59.cancel(v59.Events.MessageSendToFinalRender, v196);
            v59.cancel(v59.Events.MessageReceiveToRender, v196);
        end, {
            v97.conversationId
        });
        v4.useEffect(function() --[[ Line: 744 ]]
            -- upvalues: v125 (copy), v97 (copy), v109 (copy), l_v194_0 (copy), v59 (ref)
            local v197 = v125[1];
            if not v197 or not v197.id then
                return;
            else
                local v198 = {
                    conversationId = v97.conversationId
                };
                local v199 = v197.senderTargetId == v109;
                if not v197.isSending and (v197.senderType == "system" or not v199) then
                    if v197.id ~= l_v194_0.current then
                        l_v194_0.current = v197.id;
                        v59.finish(v59.Events.MessageReceiveToRender, v198);
                    end;
                elseif v59.isActive(v59.Events.MessageReceiveToRender, v198) then
                    v59.cancel(v59.Events.MessageReceiveToRender, v198);
                end;
                if not v199 then
                    return;
                elseif v197.isSending then
                    v59.finish(v59.Events.MessageSendToPendingRender, v198);
                    return;
                else
                    v59.finish(v59.Events.MessageSendResponseToFinalRender, v198);
                    v59.finish(v59.Events.MessageSendToFinalRender, v198);
                    return;
                end;
            end;
        end, {
            v125, 
            v109, 
            v97.conversationId
        });
    end;
    l_useEffect_0(function() --[[ Line: 789 ]]
        -- upvalues: v97 (copy), v6 (ref), v58 (ref), v186 (copy), v59 (ref)
        local v202 = v97.navigation and v97.navigation.addListener and v97.navigation.addListener(v6.Events.WillBlur, function(v200) --[[ Line: 792 ]]
            -- upvalues: v58 (ref), v186 (ref), v59 (ref), v97 (ref)
            if v58 then
                local v201 = v200 and v200.action and v200.action.params and v200.action.params.isOverlay or false;
                v186(v201);
                if v201 then
                    return;
                elseif v59.isActive(v59.Events.ChatConversationTTI, {
                    conversationId = v97.conversationId
                }) then
                    v59.cancel(v59.Events.ChatConversationTTI, {
                        conversationId = v97.conversationId
                    });
                    return;
                end;
            elseif v200 and v200.action and v200.action.params and v200.action.params.isOverlay then
                v186(true);
                return;
            else
                v186(false);
            end;
        end);
        local v204 = v97.navigation and v97.navigation.addListener and v97.navigation.addListener(v6.Events.WillFocus, function(_) --[[ Line: 823 ]]
            -- upvalues: v186 (ref)
            v186(true);
        end);
        return function() --[[ Line: 827 ]]
            -- upvalues: v202 (copy), v204 (copy)
            if v202 then
                v202.remove();
            end;
            if v204 then
                v204.remove();
            end;
        end;
    end, {
        v97.navigation, 
        v97.conversationId
    });
    l_useEffect_0(function() --[[ Line: 838 ]]
        -- upvalues: v126 (copy), v113 (copy), v50 (ref), v51 (ref), v97 (copy), v72 (ref), v137 (copy)
        if v126.shouldShowOsaCardOnInitialLoad then
            v113(v50(v51, v97.conversationId, v72)):catch(function() --[[ Line: 842 ]]
                -- upvalues: v97 (ref), v137 (ref)
                v97.navigateToToast({
                    toastProps = {
                        toastContent = {
                            toastTitle = v137.networkErrorText
                        }
                    }
                });
            end);
        end;
    end, {
        v126.shouldShowOsaCardOnInitialLoad
    });
    local v205 = not l_FFlagIsSquadEnabledAMP_0 or v97.getCanAccessParty;
    if v58 then
        if not v187 then
            return nil;
        elseif v143 then
            return v4.createElement(v9, {
                conversationId = v97.conversationId, 
                topBarHeight = v97.topBarHeight, 
                networkErrorText = v137.networkErrorText, 
                navigateToToast = v97.navigateToToast, 
                wideMode = v97.wideMode, 
                onConversationUnmount = v173, 
                navigateBack = v97.navigateBack
            });
        else
            return v4.createElement(v8, v5.Dictionary.join(v97, v101, v137, {
                moreMenuEnabled = if l_FFlagIsSquadEnabledAMP_0 then v205 else nil, 
                conversation = v102, 
                conversationTitle = v107, 
                itemList = v128, 
                localUserId = v109, 
                openGameDetailsPage = v97.openGameDetailsPage, 
                openViewProfile = v182, 
                readingMessagesIsEnabled = v97.getReadingMessagesIsEnabled(), 
                Users = v121, 
                usersTyping = v122, 
                displayNamesAvailable = v131, 
                onConversationUnmount = v173, 
                recipientIdsSerialized = v103, 
                chatIsVisible = v110, 
                chatInputPlaceholder = v183, 
                replyingToMessage = v133, 
                replyingToMessageDispatch = v134, 
                shouldShowChatInputBar = v175, 
                shouldShowLegacyBottomModal = v176, 
                shouldDisableChatInputBar = v162, 
                onChatInputBarReady = if v58 then v189 else nil, 
                inputBarDisabledEndTimestampDisplay = v163, 
                onDisabledInputBarActivated = v184, 
                scrollToTopOnInitialOsaLoad = v126.shouldShowOsaCardOnInitialLoad and v126.fetchedOldestMessage, 
                navigateToSquadLobby = if v205 then v97.navigateToSquadLobby else nil, 
                shouldHideMoreMenuButton = if v205 then not v175 else nil
            }));
        end;
    elseif not v185 then
        return nil;
    elseif v62 and v97.isFocused and not v97.isFocused() then
        return nil;
    elseif v143 then
        return v4.createElement(v9, {
            conversationId = v97.conversationId, 
            topBarHeight = v97.topBarHeight, 
            networkErrorText = v137.networkErrorText, 
            navigateToToast = v97.navigateToToast, 
            wideMode = v97.wideMode, 
            onConversationUnmount = v173, 
            navigateBack = v97.navigateBack, 
            style = v97.style
        });
    else
        return v4.createElement(v8, v5.Dictionary.join(v97, v101, v137, {
            moreMenuEnabled = if l_FFlagIsSquadEnabledAMP_0 then v205 else nil, 
            conversation = v102, 
            conversationTitle = v107, 
            itemList = v128, 
            localUserId = v109, 
            openGameDetailsPage = v97.openGameDetailsPage, 
            openViewProfile = v182, 
            readingMessagesIsEnabled = v97.getReadingMessagesIsEnabled(), 
            Users = v121, 
            usersTyping = v122, 
            displayNamesAvailable = v131, 
            onConversationUnmount = v173, 
            recipientIdsSerialized = v103, 
            chatIsVisible = v110, 
            chatInputPlaceholder = v183, 
            replyingToMessage = v133, 
            replyingToMessageDispatch = v134, 
            shouldShowChatInputBar = v175, 
            shouldShowLegacyBottomModal = v176, 
            shouldDisableChatInputBar = v162, 
            onChatInputBarReady = if v58 then v189 else nil, 
            inputBarDisabledEndTimestampDisplay = v163, 
            onDisabledInputBarActivated = v184, 
            scrollToTopOnInitialOsaLoad = v126.shouldShowOsaCardOnInitialLoad and v126.fetchedOldestMessage, 
            navigateToSquadLobby = if v205 then v97.navigateToSquadLobby else nil, 
            shouldHideMoreMenuButton = if v205 then not v175 else nil
        }));
    end;
end;
return l_UniversalAppPolicy_0.connect(function(v206) --[[ Line: 956 ]]
    return {
        viewProfileOnAvatarPressed = v206.getChatTapConversationThumbnail(), 
        getCanAccessParty = v206.getCanAccessParty()
    };
end)(ChatConversationContainer);