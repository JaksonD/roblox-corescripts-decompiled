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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v78 = require(l_script_FirstAncestor_0.Utils.shouldShowU13ChatOptInForConversation);
local l_navigateWithOsaGate_0 = require(l_script_FirstAncestor_0.Utils).navigateWithOsaGate;
local v80 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatReactToFaeForOsa);
local v81 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatNudgeToChatUpsell_DEV);
local function _(v82) --[[ Line: 95 ]] --[[ Name: isOverlayNavigation ]]
    return v82 and v82.action and v82.action.params and v82.action.params.isOverlay or false;
end;
local v85 = {
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
    getReadingMessagesIsEnabled = function() --[[ Line: 122 ]] --[[ Name: getReadingMessagesIsEnabled ]]

    end, 
    updateConversationTitle = function(_) --[[ Line: 123 ]] --[[ Name: updateConversationTitle ]]

    end, 
    navigateToScreen = function() --[[ Line: 124 ]] --[[ Name: navigateToScreen ]]

    end, 
    inputBarDisabledKey = "Feature.Chat.Label.ChatDisabled", 
    navigateToChatLanding = function() --[[ Line: 126 ]] --[[ Name: navigateToChatLanding ]]

    end, 
    releaseInputBarFocus = function() --[[ Line: 127 ]] --[[ Name: releaseInputBarFocus ]]

    end, 
    navigateToSquadLobby = function() --[[ Line: 128 ]] --[[ Name: navigateToSquadLobby ]]

    end, 
    navigateToConversationOverlay = function() --[[ Line: 129 ]] --[[ Name: navigateToConversationOverlay ]]

    end, 
    getCanAccessParty = true
};
local function v92(v86) --[[ Line: 134 ]] --[[ Name: getOsaState ]]
    -- upvalues: v74 (copy), v14 (copy)
    local v87 = v86 and v86.fetchedOldestMessage;
    local v88 = not v74 or not v86 or v86.conversationType ~= v14.Type.MULTI_USER_CONVERSATION;
    local v89 = v86 and v88 and (v86.source == "friends" or v86.osaAcknowledgementStatus == v14.OsaAcknowledgementStatus.Unacknowledged or v86.osaAcknowledgementStatus == v14.OsaAcknowledgementStatus.Acknowledged);
    local v90 = v86 and v86.osaAcknowledgementStatus == v14.OsaAcknowledgementStatus.Unacknowledged;
    local v91 = v86 and v86.source == "friends";
    return {
        shouldShowOsaCardInConversation = v89, 
        fetchedOldestMessage = v87, 
        shouldShowOsaCardOnInitialLoad = v89 and v90 and not v91, 
        shouldShowOsaCardNow = v89 and (v87 or v91)
    };
end;
ChatConversationContainer = function(v93) --[[ Line: 162 ]] --[[ Name: ChatConversationContainer ]]
    -- upvalues: v5 (copy), v85 (copy), v11 (copy), v4 (copy), v10 (copy), v24 (copy), v18 (copy), v19 (copy), v32 (copy), l_HttpService_0 (copy), l_useLocalUserId_0 (copy), v34 (copy), v38 (copy), v46 (copy), l_useDispatch_0 (copy), l_useEffect_0 (copy), l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (copy), v6 (copy), l_navigateWithOsaGate_0 (copy), v76 (copy), v80 (copy), v78 (copy), l_FFlagAppChatInterventionFocusFix_0 (copy), l_useSignal_0 (copy), l_interventionTreatmentShownSignal_0 (copy), l_Constants_0 (copy), v29 (copy), v31 (copy), v30 (copy), v25 (copy), v26 (copy), v12 (copy), v92 (copy), v56 (copy), v57 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), v37 (copy), v60 (copy), v27 (copy), v28 (copy), l_useLocalization_0 (copy), v44 (copy), v42 (copy), v43 (copy), v33 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), v52 (copy), v16 (copy), v3 (copy), l_FFlagDebugEnableTCDoubleOptIn_DEV_0 (copy), v54 (copy), l_FFlagTCUpsellModalEnabled_DEV_0 (copy), v81 (copy), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), v53 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), l_useSelector_0 (copy), v40 (copy), v41 (copy), v45 (copy), v13 (copy), v36 (copy), v55 (copy), v14 (copy), v15 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_chatInputBoxDisabledPressedSignal_0 (copy), v58 (copy), v62 (copy), v59 (copy), v50 (copy), v51 (copy), v72 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), v9 (copy), v8 (copy)
    local v94 = v5.Dictionary.join(v85, v93);
    local v95 = v11();
    local v97 = v4.useCallback(function(v96) --[[ Line: 165 ]]
        -- upvalues: v95 (copy), v10 (ref), v94 (copy)
        v95:navigate(v10.NavigationEvents.ChatConversationProfile);
        v94.openViewProfile(v96);
    end, {
        v94.openViewProfile, 
        v95
    });
    local v98 = v24(v18);
    local v99 = v19(v94.conversationId);
    local v100 = nil;
    local v101 = v32(v99);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 173 ]]
        -- upvalues: l_HttpService_0 (ref), v101 (copy)
        return l_HttpService_0:JSONEncode(v101);
    end);
    v100 = if l_status_0 then l_result_0 else "[]";
    local v104 = nil;
    local v105 = nil;
    local v106 = l_useLocalUserId_0();
    local v107 = v34();
    local v108 = v38();
    local v109 = v46();
    local v110 = l_useDispatch_0();
    l_useEffect_0(function() --[[ Line: 187 ]]
        -- upvalues: v109 (copy), v94 (copy)
        if not v109 then
            v94.navigateToChatLanding();
        end;
    end, {
        v109, 
        v94.navigateToChatLanding
    });
    if l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 then
        local v111 = if v94.navigation and v94.navigation.getParam then v94.navigation.getParam("isNavigatedFromGroupOSAJoin", false) else false;
        if l_FFlagAppChatShowOSAOnPageEntry_0 then
            l_useEffect_0(function() --[[ Line: 200 ]]
                -- upvalues: v94 (copy), v6 (ref), l_navigateWithOsaGate_0 (ref), v110 (copy)
                if not v94.navigation or not v94.navigation.addListener then
                    return;
                else
                    local v112 = v94.navigation.addListener(v6.Events.WillFocus, function() --[[ Line: 204 ]]
                        -- upvalues: l_navigateWithOsaGate_0 (ref), v94 (ref), v110 (ref)
                        l_navigateWithOsaGate_0({
                            conversationId = v94.conversationId, 
                            dispatch = v110, 
                            onAccepted = function() --[[ Line: 208 ]] --[[ Name: onAccepted ]]

                            end, 
                            onDeclined = function() --[[ Line: 209 ]] --[[ Name: onDeclined ]]
                                -- upvalues: v94 (ref)
                                v94.navigateToChatLanding();
                            end
                        });
                    end);
                    return function() --[[ Line: 214 ]]
                        -- upvalues: v112 (copy)
                        if v112 then
                            v112:remove();
                        end;
                    end;
                end;
            end, {
                v94.navigation, 
                v94.conversationId, 
                v110
            });
        else
            local l_v111_0 = v111 --[[ copy: 17 -> 69 ]];
            l_useEffect_0(function() --[[ Line: 221 ]]
                -- upvalues: l_v111_0 (copy), v76 (ref), v99 (ref), v94 (copy)
                if not l_v111_0 and v76(v99) then
                    v94.navigateToChatLanding();
                end;
            end, {
                v99, 
                v94.navigateToChatLanding, 
                v111
            });
        end;
    end;
    if v80 then
        l_useEffect_0(function() --[[ Line: 231 ]]
            -- upvalues: v99 (ref), v76 (ref), v78 (ref), l_navigateWithOsaGate_0 (ref), v94 (copy), v110 (copy)
            if not v99 then
                return;
            else
                local v114 = v76(v99);
                local v115 = v78(v99);
                if v114 or v115 then
                    l_navigateWithOsaGate_0({
                        conversationId = v94.conversationId, 
                        dispatch = v110, 
                        onAccepted = function() --[[ Line: 241 ]] --[[ Name: onAccepted ]]

                        end, 
                        onDeclined = function() --[[ Line: 242 ]] --[[ Name: onDeclined ]]
                            -- upvalues: v94 (ref)
                            v94.navigateToChatLanding();
                        end
                    });
                end;
                return;
            end;
        end, {
            v99, 
            v94.conversationId, 
            v110
        });
    end;
    if l_FFlagAppChatInterventionFocusFix_0 then
        l_useSignal_0(l_interventionTreatmentShownSignal_0, v4.useCallback(function(v116) --[[ Line: 259 ]]
            -- upvalues: l_Constants_0 (ref), v94 (copy)
            if v116 == l_Constants_0.TreatmentType.PartyChatNudgeDialog or v116 == l_Constants_0.TreatmentType.PartyChatTimeoutDialog then
                v94.releaseInputBarFocus();
            end;
        end, {
            v94.releaseInputBarFocus
        }));
    end;
    v105 = v29.Hooks.useUserProfilesFetch({
        userIds = v31(v99, v106), 
        query = v29.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v117 = v29.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v106))
        }, 
        query = v29.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    v104 = v30(v99, v105.data and v105.data.userProfiles, if v117.data then v29.Selectors.getCombinedNameFromId(v117.data, (tostring(v106))) else "");
    local v118 = v25();
    local v119 = v26(v94.conversationId);
    local v120 = v4.useRef({
        itemList = {}, 
        previousMessagesState = {}, 
        previousSendingMessagesState = {}, 
        previousMessagesResult = {}
    });
    local v121 = v4.useMemo(function() --[[ Line: 298 ]]
        -- upvalues: v120 (copy), v12 (ref), v99 (ref), v94 (copy), v118 (copy), v106 (copy)
        v120.current = v12({
            conversation = v99, 
            conversationId = v94.conversationId, 
            Users = v118, 
            localUserId = v106
        }, v120.current);
        return v120.current.itemList;
    end, {
        v99, 
        v94.conversationId, 
        v118, 
        v106
    });
    local v122 = v92(v99);
    local v124 = v4.useMemo(function() --[[ Line: 311 ]]
        -- upvalues: v122 (copy), v121 (copy), v56 (ref), v57 (ref)
        local v123 = {};
        if v122.shouldShowOsaCardOnInitialLoad and not v122.fetchedOldestMessage then
            return v123;
        else
            v123 = table.clone(v121);
            if v122.shouldShowOsaCardNow then
                table.insert(v123, {
                    messageType = v56.Custom, 
                    customEntryType = v57.OsaContextCardOneToOne, 
                    stable_key = v57.OsaContextCardOneToOne
                });
            end;
            return v123;
        end;
    end, {
        v121, 
        v99, 
        v122.shouldShowOsaCardOnInitialLoad, 
        v122.shouldShowOsaCardInConversation, 
        v122.shouldShowOsaCardNow, 
        v122.fetchedOldestMessage
    });
    local v125 = if v119[1] and v105.data then v29.Selectors.getCombinedNameFromId(v105.data, v119[1].id) else nil;
    local v126 = if v119[2] and v105.data then v29.Selectors.getCombinedNameFromId(v105.data, v119[2].id) else nil;
    local v127 = true;
    if #v119 == 1 and not v125 then
        v127 = false;
    elseif #v119 == 2 and (not v125 or not v126) then
        v127 = false;
    end;
    local v128 = l_GetFFlagEnableAppChatInExperience_0() and v37();
    local v129 = nil;
    local v130 = nil;
    local v131 = nil;
    local v132 = nil;
    if v60() then
        v129 = v27();
        v130 = v28();
        if v129 then
            v132 = v129.senderTargetId == v106;
            v131 = if not v132 and v105.data then v29.Selectors.getCombinedNameFromId(v105.data, v129.senderTargetId) else nil;
        end;
    end;
    local v133 = l_useLocalization_0({
        chatInputPlaceholder = v94.chatInputPlaceholderKey, 
        replyChatInputPlaceholder = {
            v94.replyChatInputPlaceholderKey; 
            DISPLAY_NAME = v131
        }, 
        replyToYourselfChatInputPlaceholder = v94.replyToYourselfChatInputPlaceholderKey, 
        invalidMessageTypeText = v94.notImplementedMessageTypeKey, 
        messageDefaultNoticeText = v94.messageDefaultNoticeKey, 
        messageModeratedNoticeText = v94.messageModeratedNoticeKey, 
        messageHiddenNoticeText = v94.messageHiddenNoticeKey, 
        networkErrorText = v94.networkErrorTextKey, 
        newText = v94.newTextKey, 
        schedulePartyText = v94.schedulePartyTextKey, 
        unknownUserText = v94.unknownUserTextKey, 
        oneUserTyping = {
            "Feature.Chat.Message.OneUserTyping"; 
            DISPLAY_NAME = v125
        }, 
        twoUsersTyping = {
            "Feature.Chat.Message.TwoUsersTyping"; 
            DISPLAY_NAME_1 = v125, 
            DISPLAY_NAME_2 = v126
        }, 
        severalUsersTyping = v94.severalUsersTyping, 
        bottomModalText = v94.chatUnavailableWithUserKey, 
        inputBarDisabledText = v94.inputBarDisabledKey
    });
    local v134 = v44(v42.Context);
    local v135 = v43.useMergeState();
    local v136 = v43.useClearState();
    local v137 = v99 and v99.moderationType or v5.None;
    local v138 = v99 and v99.userPendingStatus or v5.None;
    l_useEffect_0(function() --[[ Line: 405 ]]
        -- upvalues: v135 (copy), v94 (copy), v137 (copy), v138 (copy)
        v135({
            conversationId = v94.conversationId, 
            moderationType = v137, 
            userPendingStatus = v138
        });
    end, {
        v135, 
        v94.conversationId, 
        v137, 
        v138
    });
    local v139 = v33(v99 or {});
    local v140 = v99 and v99.source;
    if l_FFlagAppChatEnableDoubleOptIn_0 then
        local v141, v142 = v52(v16.rodux.GetModalSequence.API, v94.conversationId);
        local l_v142_0 = v142 --[[ copy: 41 -> 67 ]];
        local l_v141_0 = v141 --[[ copy: 40 -> 68 ]];
        l_useEffect_0(function() --[[ Line: 421 ]]
            -- upvalues: l_v142_0 (copy), v139 (copy), v140 (copy), v110 (copy), v16 (ref), v94 (copy), v128 (copy), v3 (ref), l_v141_0 (copy)
            if not l_v142_0 then
                return;
            else
                if v139 and v140 == "channels" then
                    v110(v16.rodux.GetPendingStateModal.API(v94.conversationId, v128)):catch(function(v145) --[[ Line: 427 ]]
                        -- upvalues: v3 (ref)
                        v3:warning((("GetPendingStateModal error in ChatConversationContainer %*"):format((tostring(v145)))));
                    end);
                end;
                if not v139 then
                    v110(l_v141_0({
                        modalSequence = v16.Constants.ModalSequence.ConversationTopModal, 
                        isInExperience = v128
                    })):catch(function(v146) --[[ Line: 436 ]]
                        -- upvalues: v3 (ref)
                        v3:warning((("GetModalSequence for ConversationTopModal error in ChatConversationContainer %*"):format((tostring(v146)))));
                    end);
                end;
                return;
            end;
        end, {
            v94.conversationId, 
            v142, 
            v128, 
            v139, 
            v140
        });
    else
        l_useEffect_0(function() --[[ Line: 444 ]]
            -- upvalues: v140 (copy), v139 (copy), v110 (copy), v16 (ref), v94 (copy), v128 (copy)
            if v140 ~= "channels" then
                return;
            elseif v139 then
                v110(v16.rodux.GetPendingStateModal.API(v94.conversationId, v128)):catch(function(v147) --[[ Line: 450 ]]
                    warn("GetPendingStateModal error in ChatConversationContainer " .. tostring(v147));
                end);
                return;
            else
                v110(v16.rodux.GetConversationTopModal.API(v94.conversationId, v128)):catch(function(v148) --[[ Line: 456 ]]
                    warn("GetConversationTopModal error in ChatConversationContainer " .. tostring(v148));
                end);
                return;
            end;
        end, {
            v94.conversationId, 
            v110, 
            v140
        });
    end;
    local v149, v150 = v52(v16.rodux.GetModalSequence.API, v94.conversationId);
    l_useEffect_0(function() --[[ Line: 467 ]]
        -- upvalues: v139 (copy), v150 (ref), v110 (copy), v149 (copy), v16 (ref), v128 (copy), v3 (ref)
        if not v139 and v150 then
            v110(v149({
                modalSequence = v16.Constants.ModalSequence.ConversationOverlay, 
                isInExperience = v128
            })):catch(function(v151) --[[ Line: 472 ]]
                -- upvalues: v3 (ref)
                v3:warning((("GetModalSequence error in ChatConversationContainer %*"):format((tostring(v151)))));
            end);
        end;
    end, {
        v150, 
        v94.conversationId, 
        v139, 
        v128, 
        v137
    });
    if l_FFlagDebugEnableTCDoubleOptIn_DEV_0 then
        v54({
            keyCode = Enum.KeyCode.O, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 479 ]]
            -- upvalues: v3 (ref), v110 (copy), v94 (copy), v16 (ref)
            v3:debug("Ctrl + O pressed, showing new TC double opt in banner");
            v110({
                type = "DEBUG_ShowNewTopModal", 
                conversationId = v94.conversationId, 
                modalVariant = v16.Constants.ConversationTopModal.AddTrustedConnection
            });
        end, {
            v110, 
            v94.conversationId
        });
        v54({
            keyCode = Enum.KeyCode.P, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 488 ]]
            -- upvalues: v3 (ref), v110 (copy), v94 (copy), v16 (ref)
            v3:debug("Ctrl + P pressed, showing new TC double opt in request banner");
            v110({
                type = "DEBUG_ShowNewTopModal", 
                conversationId = v94.conversationId, 
                modalVariant = v16.Constants.ConversationTopModal.TrustedConnectionRequest
            });
        end, {
            v110, 
            v94.conversationId
        });
    end;
    if l_FFlagTCUpsellModalEnabled_DEV_0 then
        v54({
            keyCode = Enum.KeyCode.L, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 499 ]]
            -- upvalues: v3 (ref), v110 (copy), v94 (copy), v16 (ref)
            v3:debug("Ctrl + L pressed, showing new TC created overlay");
            v110({
                type = "DEBUG_ShowNewTCOverlay", 
                conversationId = v94.conversationId, 
                modalVariant = v16.Constants.ConversationOverlay.TrustedConnectionCreated
            });
        end, {
            v110, 
            v94.conversationId
        });
    end;
    if v81 then
        v54({
            keyCode = Enum.KeyCode.N, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 510 ]]
            -- upvalues: v3 (ref), v110 (copy), v94 (copy), v16 (ref)
            v3:debug("Ctrl + N pressed, showing nudge to chat upsell overlay");
            v110({
                type = "DEBUG_ShowNudgeToChatUpsellOverlay", 
                conversationId = v94.conversationId, 
                modalVariant = v16.Constants.ConversationOverlay.NudgeToChatUpsell
            });
        end, {
            v110, 
            v94.conversationId
        });
    end;
    if l_FFlagEnableAEGIS2AppChatConversationBanner_0 then
        local v152 = nil;
        local v153, v154 = v52(v16.rodux.GetModalSequence.API, v94.conversationId);
        v152 = v153;
        v150 = v154;
        do
            local l_v152_0 = v152;
            l_useEffect_0(function() --[[ Line: 526 ]]
                -- upvalues: v150 (ref), v110 (copy), l_v152_0 (ref), v16 (ref), v128 (copy), v3 (ref)
                if not v150 then
                    return;
                else
                    v110(l_v152_0({
                        modalSequence = v16.Constants.ModalSequence.ConversationBottomModal, 
                        isInExperience = v128
                    })):catch(function(v156) --[[ Line: 534 ]]
                        -- upvalues: v3 (ref)
                        v3:warning((("GetModalSequence for ConversationBottomModal error in ChatConversationContainer %*"):format((tostring(v156)))));
                    end);
                    return;
                end;
            end, {
                v94.conversationId, 
                v150, 
                v128
            });
        end;
    end;
    local v157 = v53(v94.conversationId);
    l_useEffect_0(function() --[[ Line: 542 ]]
        -- upvalues: v157 (copy), v94 (copy)
        if v157 then
            v94.navigateToConversationOverlay();
        end;
    end, {
        v157, 
        v94.conversationId
    });
    local v158 = nil;
    local v159 = nil;
    local v160 = nil;
    local v161 = nil;
    if l_getFFlagAppChatEnableIntervention_0() then
        local v162 = v140 ~= "channels";
        local l_v162_0 = v162 --[[ copy: 47 -> 65 ]];
        local v165 = l_useSelector_0(function(v164) --[[ Line: 554 ]]
            -- upvalues: l_v162_0 (copy), v16 (ref), v94 (copy), v40 (ref)
            return (if l_v162_0 then v16.rodux.GetChatModerationStatuses.getStatus(v164) else v16.rodux.GetChatModerationStatuses.getStatus(v164, v94.conversationId)) == v40.Enum.NetworkStatus.NotStarted;
        end);
        local l_v165_0 = v165 --[[ copy: 48 -> 66 ]];
        l_useEffect_0(function() --[[ Line: 561 ]]
            -- upvalues: l_v165_0 (copy), v110 (copy), v16 (ref), l_v162_0 (copy), v94 (copy)
            if l_v165_0 then
                v110(v16.rodux.GetChatModerationStatuses.API(if l_v162_0 then nil else {
                    v94.conversationId
                })):catch(function(v167) --[[ Line: 567 ]]
                    warn("GetChatModerationStatuses error in ChatConversationContainer " .. tostring(v167));
                end);
            end;
        end, {
            v94.conversationId, 
            v162, 
            v110, 
            v165
        });
        local v168 = v41({
            conversationId = v94.conversationId, 
            conversationModerationType = v137
        });
        v158 = v168.isTimedOut;
        v159 = v168.timeoutEndTimestamp;
        v160 = v168.decisionEventId;
        v161 = v168.duration;
    end;
    local v169 = nil;
    l_useEffect_0(function() --[[ Line: 584 ]]
        -- upvalues: v134 (copy), v45 (ref), v121 (copy)
        v134.emit(v45.ScreenRendered, {
            loadedMessageCount = #v121
        });
    end, {
        v94.conversationId
    });
    v169 = v4.useCallback(function(v170) --[[ Line: 592 ]]
        -- upvalues: v134 (copy), v45 (ref), v136 (copy)
        v134.emit(v45.ScreenExit, {
            conversationExitType = v170
        });
        v136();
    end, {
        v134, 
        v136
    });
    v99 = v99 or {};
    local v171 = false;
    if v99.participantPendingStatus ~= v13.UserPendingStatus.Pending then
        v171 = v108;
    end;
    local v172 = not v171 and v108;
    local v173 = v36({
        v55.ViewUserProfile
    });
    local v174 = v99.conversationType == v14.Type.MULTI_USER_CONVERSATION;
    local v176 = l_useSelector_0(function(v175) --[[ Line: 612 ]]
        -- upvalues: v174 (copy), v99 (ref)
        return v174 and v99.initiator == v175.LocalUserId;
    end);
    local function v178(v177) --[[ Line: 617 ]]
        -- upvalues: v173 (copy), v55 (ref), v97 (copy), v94 (copy), v15 (ref), v139 (copy), v174 (copy), v176 (copy)
        if v173[v55.ViewUserProfile] then
            v97(v177);
            return;
        else
            v94.navigateToScreen(v15.ParticipantDialog, {
                conversationId = v94.conversationId, 
                participantId = v177, 
                showRemoveUserButton = not v139 and v174 and v176
            }, true);
            return;
        end;
    end;
    local v179 = if v129 then if v132 then v133.replyToYourselfChatInputPlaceholder else v133.replyChatInputPlaceholder else v133.chatInputPlaceholder;
    l_useEffect_0(function() --[[ Line: 635 ]]
        -- upvalues: v94 (copy), v104 (ref)
        v94.updateConversationTitle(v104);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v104, 
        v94.updateConversationTitle
    } else l_dependencyArray_0(v104, v94.updateConversationTitle));
    local v180 = if l_getFFlagAppChatEnableIntervention_0() then v4.useCallback(function() --[[ Line: 644 ]]
        -- upvalues: l_chatInputBoxDisabledPressedSignal_0 (ref), v159 (ref), v160 (ref), v161 (ref)
        l_chatInputBoxDisabledPressedSignal_0:fire({
            endTimestamp = v159, 
            decisionEventId = v160, 
            duration = v161
        });
    end, {
        v159, 
        v160, 
        v161
    }) else nil;
    local v181, v182 = v4.useState(v94.navigation and v94.navigation.isFocused and v94.navigation.isFocused());
    local v183 = nil;
    local v184 = nil;
    if v58 then
        v183 = v181;
        if v62 and v94.isFocused and not v94.isFocused() then
            v183 = false;
        end;
        v184 = v183 and not v139;
    end;
    local v185 = nil;
    if v58 then
        local v186 = v4.useRef(false);
        local l_v186_0 = v186 --[[ copy: 61 -> 64 ]];
        v4.useEffect(function() --[[ Line: 674 ]]
            -- upvalues: l_v186_0 (copy), v171 (copy)
            l_v186_0.current = not v171;
        end, {
            v94.conversationId, 
            v171
        });
        local v189 = v4.useCallback(function(v188) --[[ Line: 678 ]]
            -- upvalues: v59 (ref), v94 (copy), v184 (ref), l_v186_0 (copy), v3 (ref), v121 (copy)
            if not v59.isActive(v59.Events.ChatConversationTTI, {
                conversationId = v94.conversationId
            }) or not v184 then
                return;
            elseif not l_v186_0.current then
                v3:debug("TTI: Messages ready but waiting for input bar (chatInputBarReady={}, reason={})", l_v186_0.current, v188);
                return;
            else
                v59.finish(v59.Events.ChatConversationTTI, {
                    conversationId = v94.conversationId, 
                    numElementsRendered = #v121
                });
                return;
            end;
        end, {
            v94.conversationId, 
            v181, 
            v139, 
            #v121
        });
        v4.useEffect(function() --[[ Line: 702 ]]
            -- upvalues: v189 (copy)
            v189("messages_ready");
        end, {
            v189, 
            #v121, 
            v94.conversationId
        });
        v185 = v4.useCallback(function() --[[ Line: 706 ]]
            -- upvalues: l_v186_0 (copy), v189 (copy)
            l_v186_0.current = true;
            v189("input_bar_ready");
        end, {
            v189
        });
    end;
    if v58 then
        local v190 = v4.useRef(nil);
        local l_v190_0 = v190 --[[ copy: 61 -> 63 ]];
        v4.useEffect(function() --[[ Line: 720 ]]
            -- upvalues: v3 (ref), v94 (copy), l_v190_0 (copy), v59 (ref)
            v3:debug("Perf: Resetting message perf tracking for conversation {}", v94.conversationId);
            l_v190_0.current = nil;
            local v192 = {
                conversationId = v94.conversationId
            };
            v59.cancel(v59.Events.MessageSendToPendingRender, v192);
            v59.cancel(v59.Events.MessageSendResponseToFinalRender, v192);
            v59.cancel(v59.Events.MessageSendToFinalRender, v192);
            v59.cancel(v59.Events.MessageReceiveToRender, v192);
        end, {
            v94.conversationId
        });
        v4.useEffect(function() --[[ Line: 733 ]]
            -- upvalues: v121 (copy), v94 (copy), v106 (copy), l_v190_0 (copy), v59 (ref)
            local v193 = v121[1];
            if not v193 or not v193.id then
                return;
            else
                local v194 = {
                    conversationId = v94.conversationId
                };
                local v195 = v193.senderTargetId == v106;
                if not v193.isSending and (v193.senderType == "system" or not v195) then
                    if v193.id ~= l_v190_0.current then
                        l_v190_0.current = v193.id;
                        v59.finish(v59.Events.MessageReceiveToRender, v194);
                    end;
                elseif v59.isActive(v59.Events.MessageReceiveToRender, v194) then
                    v59.cancel(v59.Events.MessageReceiveToRender, v194);
                end;
                if not v195 then
                    return;
                elseif v193.isSending then
                    v59.finish(v59.Events.MessageSendToPendingRender, v194);
                    return;
                else
                    v59.finish(v59.Events.MessageSendResponseToFinalRender, v194);
                    v59.finish(v59.Events.MessageSendToFinalRender, v194);
                    return;
                end;
            end;
        end, {
            v121, 
            v106, 
            v94.conversationId
        });
    end;
    l_useEffect_0(function() --[[ Line: 778 ]]
        -- upvalues: v94 (copy), v6 (ref), v58 (ref), v182 (copy), v59 (ref)
        local v198 = v94.navigation and v94.navigation.addListener and v94.navigation.addListener(v6.Events.WillBlur, function(v196) --[[ Line: 781 ]]
            -- upvalues: v58 (ref), v182 (ref), v59 (ref), v94 (ref)
            if v58 then
                local v197 = v196 and v196.action and v196.action.params and v196.action.params.isOverlay or false;
                v182(v197);
                if v197 then
                    return;
                elseif v59.isActive(v59.Events.ChatConversationTTI, {
                    conversationId = v94.conversationId
                }) then
                    v59.cancel(v59.Events.ChatConversationTTI, {
                        conversationId = v94.conversationId
                    });
                    return;
                end;
            elseif v196 and v196.action and v196.action.params and v196.action.params.isOverlay then
                v182(true);
                return;
            else
                v182(false);
            end;
        end);
        local v200 = v94.navigation and v94.navigation.addListener and v94.navigation.addListener(v6.Events.WillFocus, function(_) --[[ Line: 812 ]]
            -- upvalues: v182 (ref)
            v182(true);
        end);
        return function() --[[ Line: 816 ]]
            -- upvalues: v198 (copy), v200 (copy)
            if v198 then
                v198.remove();
            end;
            if v200 then
                v200.remove();
            end;
        end;
    end, {
        v94.navigation, 
        v94.conversationId
    });
    l_useEffect_0(function() --[[ Line: 827 ]]
        -- upvalues: v122 (copy), v110 (copy), v50 (ref), v51 (ref), v94 (copy), v72 (ref), v133 (copy)
        if v122.shouldShowOsaCardOnInitialLoad then
            v110(v50(v51, v94.conversationId, v72)):catch(function() --[[ Line: 831 ]]
                -- upvalues: v94 (ref), v133 (ref)
                v94.navigateToToast({
                    toastProps = {
                        toastContent = {
                            toastTitle = v133.networkErrorText
                        }
                    }
                });
            end);
        end;
    end, {
        v122.shouldShowOsaCardOnInitialLoad
    });
    local v201 = not l_FFlagIsSquadEnabledAMP_0 or v94.getCanAccessParty;
    if v58 then
        if not v183 then
            return nil;
        elseif v139 then
            return v4.createElement(v9, {
                conversationId = v94.conversationId, 
                topBarHeight = v94.topBarHeight, 
                networkErrorText = v133.networkErrorText, 
                navigateToToast = v94.navigateToToast, 
                wideMode = v94.wideMode, 
                onConversationUnmount = v169, 
                navigateBack = v94.navigateBack
            });
        else
            return v4.createElement(v8, v5.Dictionary.join(v94, v98, v133, {
                moreMenuEnabled = if l_FFlagIsSquadEnabledAMP_0 then v201 else nil, 
                conversation = v99, 
                conversationTitle = v104, 
                itemList = v124, 
                localUserId = v106, 
                openGameDetailsPage = v94.openGameDetailsPage, 
                openViewProfile = v178, 
                readingMessagesIsEnabled = v94.getReadingMessagesIsEnabled(), 
                Users = v118, 
                usersTyping = v119, 
                displayNamesAvailable = v127, 
                onConversationUnmount = v169, 
                recipientIdsSerialized = v100, 
                chatIsVisible = v107, 
                chatInputPlaceholder = v179, 
                replyingToMessage = v129, 
                replyingToMessageDispatch = v130, 
                shouldShowChatInputBar = v171, 
                shouldShowLegacyBottomModal = v172, 
                shouldDisableChatInputBar = v158, 
                onChatInputBarReady = if v58 then v185 else nil, 
                inputBarDisabledEndTimestampDisplay = v159, 
                onDisabledInputBarActivated = v180, 
                scrollToTopOnInitialOsaLoad = v122.shouldShowOsaCardOnInitialLoad and v122.fetchedOldestMessage, 
                navigateToSquadLobby = if v201 then v94.navigateToSquadLobby else nil, 
                shouldHideMoreMenuButton = if v201 then not v171 else nil
            }));
        end;
    elseif not v181 then
        return nil;
    elseif v62 and v94.isFocused and not v94.isFocused() then
        return nil;
    elseif v139 then
        return v4.createElement(v9, {
            conversationId = v94.conversationId, 
            topBarHeight = v94.topBarHeight, 
            networkErrorText = v133.networkErrorText, 
            navigateToToast = v94.navigateToToast, 
            wideMode = v94.wideMode, 
            onConversationUnmount = v169, 
            navigateBack = v94.navigateBack, 
            style = v94.style
        });
    else
        return v4.createElement(v8, v5.Dictionary.join(v94, v98, v133, {
            moreMenuEnabled = if l_FFlagIsSquadEnabledAMP_0 then v201 else nil, 
            conversation = v99, 
            conversationTitle = v104, 
            itemList = v124, 
            localUserId = v106, 
            openGameDetailsPage = v94.openGameDetailsPage, 
            openViewProfile = v178, 
            readingMessagesIsEnabled = v94.getReadingMessagesIsEnabled(), 
            Users = v118, 
            usersTyping = v119, 
            displayNamesAvailable = v127, 
            onConversationUnmount = v169, 
            recipientIdsSerialized = v100, 
            chatIsVisible = v107, 
            chatInputPlaceholder = v179, 
            replyingToMessage = v129, 
            replyingToMessageDispatch = v130, 
            shouldShowChatInputBar = v171, 
            shouldShowLegacyBottomModal = v172, 
            shouldDisableChatInputBar = v158, 
            onChatInputBarReady = if v58 then v185 else nil, 
            inputBarDisabledEndTimestampDisplay = v159, 
            onDisabledInputBarActivated = v180, 
            scrollToTopOnInitialOsaLoad = v122.shouldShowOsaCardOnInitialLoad and v122.fetchedOldestMessage, 
            navigateToSquadLobby = if v201 then v94.navigateToSquadLobby else nil, 
            shouldHideMoreMenuButton = if v201 then not v171 else nil
        }));
    end;
end;
return l_UniversalAppPolicy_0.connect(function(v202) --[[ Line: 945 ]]
    return {
        viewProfileOnAvatarPressed = v202.getChatTapConversationThumbnail(), 
        getCanAccessParty = v202.getCanAccessParty()
    };
end)(ChatConversationContainer);