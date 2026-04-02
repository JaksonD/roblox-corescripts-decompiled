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
local v82 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatNudgeToChatUpsellEnabled);
local function _(v83) --[[ Line: 96 ]] --[[ Name: isOverlayNavigation ]]
    return v83 and v83.action and v83.action.params and v83.action.params.isOverlay or false;
end;
local v86 = {
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
    getReadingMessagesIsEnabled = function() --[[ Line: 123 ]] --[[ Name: getReadingMessagesIsEnabled ]]

    end, 
    updateConversationTitle = function(_) --[[ Line: 124 ]] --[[ Name: updateConversationTitle ]]

    end, 
    navigateToScreen = function() --[[ Line: 125 ]] --[[ Name: navigateToScreen ]]

    end, 
    inputBarDisabledKey = "Feature.Chat.Label.ChatDisabled", 
    navigateToChatLanding = function() --[[ Line: 127 ]] --[[ Name: navigateToChatLanding ]]

    end, 
    releaseInputBarFocus = function() --[[ Line: 128 ]] --[[ Name: releaseInputBarFocus ]]

    end, 
    navigateToSquadLobby = function() --[[ Line: 129 ]] --[[ Name: navigateToSquadLobby ]]

    end, 
    navigateToConversationOverlay = function() --[[ Line: 130 ]] --[[ Name: navigateToConversationOverlay ]]

    end, 
    getCanAccessParty = true
};
local function v93(v87) --[[ Line: 135 ]] --[[ Name: getOsaState ]]
    -- upvalues: v74 (copy), v14 (copy)
    local v88 = v87 and v87.fetchedOldestMessage;
    local v89 = not v74 or not v87 or v87.conversationType ~= v14.Type.MULTI_USER_CONVERSATION;
    local v90 = v87 and v89 and (v87.source == "friends" or v87.osaAcknowledgementStatus == v14.OsaAcknowledgementStatus.Unacknowledged or v87.osaAcknowledgementStatus == v14.OsaAcknowledgementStatus.Acknowledged);
    local v91 = v87 and v87.osaAcknowledgementStatus == v14.OsaAcknowledgementStatus.Unacknowledged;
    local v92 = v87 and v87.source == "friends";
    return {
        shouldShowOsaCardInConversation = v90, 
        fetchedOldestMessage = v88, 
        shouldShowOsaCardOnInitialLoad = v90 and v91 and not v92, 
        shouldShowOsaCardNow = v90 and (v88 or v92)
    };
end;
ChatConversationContainer = function(v94) --[[ Line: 163 ]] --[[ Name: ChatConversationContainer ]]
    -- upvalues: v5 (copy), v86 (copy), v11 (copy), v4 (copy), v10 (copy), v24 (copy), v18 (copy), v19 (copy), v32 (copy), l_HttpService_0 (copy), l_useLocalUserId_0 (copy), v34 (copy), v38 (copy), v46 (copy), l_useDispatch_0 (copy), l_useEffect_0 (copy), l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (copy), v6 (copy), l_navigateWithOsaGate_0 (copy), v76 (copy), v80 (copy), v78 (copy), l_FFlagAppChatInterventionFocusFix_0 (copy), l_useSignal_0 (copy), l_interventionTreatmentShownSignal_0 (copy), l_Constants_0 (copy), v29 (copy), v31 (copy), v30 (copy), v25 (copy), v26 (copy), v12 (copy), v93 (copy), v56 (copy), v57 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), v37 (copy), v60 (copy), v27 (copy), v28 (copy), l_useLocalization_0 (copy), v44 (copy), v42 (copy), v43 (copy), v33 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), v52 (copy), v16 (copy), v3 (copy), l_FFlagDebugEnableTCDoubleOptIn_DEV_0 (copy), v54 (copy), l_FFlagTCUpsellModalEnabled_DEV_0 (copy), v81 (copy), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), v82 (copy), v53 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), l_useSelector_0 (copy), v40 (copy), v41 (copy), v45 (copy), v13 (copy), v36 (copy), v55 (copy), v14 (copy), v15 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_chatInputBoxDisabledPressedSignal_0 (copy), v58 (copy), v62 (copy), v59 (copy), v50 (copy), v51 (copy), v72 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), v9 (copy), v8 (copy)
    local v95 = v5.Dictionary.join(v86, v94);
    local v96 = v11();
    local v98 = v4.useCallback(function(v97) --[[ Line: 166 ]]
        -- upvalues: v96 (copy), v10 (ref), v95 (copy)
        v96:navigate(v10.NavigationEvents.ChatConversationProfile);
        v95.openViewProfile(v97);
    end, {
        v95.openViewProfile, 
        v96
    });
    local v99 = v24(v18);
    local v100 = v19(v95.conversationId);
    local v101 = nil;
    local v102 = v32(v100);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 174 ]]
        -- upvalues: l_HttpService_0 (ref), v102 (copy)
        return l_HttpService_0:JSONEncode(v102);
    end);
    v101 = if l_status_0 then l_result_0 else "[]";
    local v105 = nil;
    local v106 = nil;
    local v107 = l_useLocalUserId_0();
    local v108 = v34();
    local v109 = v38();
    local v110 = v46();
    local v111 = l_useDispatch_0();
    l_useEffect_0(function() --[[ Line: 188 ]]
        -- upvalues: v110 (copy), v95 (copy)
        if not v110 then
            v95.navigateToChatLanding();
        end;
    end, {
        v110, 
        v95.navigateToChatLanding
    });
    if l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 then
        local v112 = if v95.navigation and v95.navigation.getParam then v95.navigation.getParam("isNavigatedFromGroupOSAJoin", false) else false;
        if l_FFlagAppChatShowOSAOnPageEntry_0 then
            l_useEffect_0(function() --[[ Line: 201 ]]
                -- upvalues: v95 (copy), v6 (ref), l_navigateWithOsaGate_0 (ref), v111 (copy)
                if not v95.navigation or not v95.navigation.addListener then
                    return;
                else
                    local v113 = v95.navigation.addListener(v6.Events.WillFocus, function() --[[ Line: 205 ]]
                        -- upvalues: l_navigateWithOsaGate_0 (ref), v95 (ref), v111 (ref)
                        l_navigateWithOsaGate_0({
                            conversationId = v95.conversationId, 
                            dispatch = v111, 
                            onAccepted = function() --[[ Line: 209 ]] --[[ Name: onAccepted ]]

                            end, 
                            onDeclined = function() --[[ Line: 210 ]] --[[ Name: onDeclined ]]
                                -- upvalues: v95 (ref)
                                v95.navigateToChatLanding();
                            end
                        });
                    end);
                    return function() --[[ Line: 215 ]]
                        -- upvalues: v113 (copy)
                        if v113 then
                            v113:remove();
                        end;
                    end;
                end;
            end, {
                v95.navigation, 
                v95.conversationId, 
                v111
            });
        else
            local l_v112_0 = v112 --[[ copy: 17 -> 69 ]];
            l_useEffect_0(function() --[[ Line: 222 ]]
                -- upvalues: l_v112_0 (copy), v76 (ref), v100 (ref), v95 (copy)
                if not l_v112_0 and v76(v100) then
                    v95.navigateToChatLanding();
                end;
            end, {
                v100, 
                v95.navigateToChatLanding, 
                v112
            });
        end;
    end;
    if v80 then
        l_useEffect_0(function() --[[ Line: 232 ]]
            -- upvalues: v100 (ref), v76 (ref), v78 (ref), l_navigateWithOsaGate_0 (ref), v95 (copy), v111 (copy)
            if not v100 then
                return;
            else
                local v115 = v76(v100);
                local v116 = v78(v100);
                if v115 or v116 then
                    l_navigateWithOsaGate_0({
                        conversationId = v95.conversationId, 
                        dispatch = v111, 
                        onAccepted = function() --[[ Line: 242 ]] --[[ Name: onAccepted ]]

                        end, 
                        onDeclined = function() --[[ Line: 243 ]] --[[ Name: onDeclined ]]
                            -- upvalues: v95 (ref)
                            v95.navigateToChatLanding();
                        end
                    });
                end;
                return;
            end;
        end, {
            v100, 
            v95.conversationId, 
            v111
        });
    end;
    if l_FFlagAppChatInterventionFocusFix_0 then
        l_useSignal_0(l_interventionTreatmentShownSignal_0, v4.useCallback(function(v117) --[[ Line: 260 ]]
            -- upvalues: l_Constants_0 (ref), v95 (copy)
            if v117 == l_Constants_0.TreatmentType.PartyChatNudgeDialog or v117 == l_Constants_0.TreatmentType.PartyChatTimeoutDialog then
                v95.releaseInputBarFocus();
            end;
        end, {
            v95.releaseInputBarFocus
        }));
    end;
    v106 = v29.Hooks.useUserProfilesFetch({
        userIds = v31(v100, v107), 
        query = v29.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v118 = v29.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v107))
        }, 
        query = v29.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    v105 = v30(v100, v106.data and v106.data.userProfiles, if v118.data then v29.Selectors.getCombinedNameFromId(v118.data, (tostring(v107))) else "");
    local v119 = v25();
    local v120 = v26(v95.conversationId);
    local v121 = v4.useRef({
        itemList = {}, 
        previousMessagesState = {}, 
        previousSendingMessagesState = {}, 
        previousMessagesResult = {}
    });
    local v122 = v4.useMemo(function() --[[ Line: 299 ]]
        -- upvalues: v121 (copy), v12 (ref), v100 (ref), v95 (copy), v119 (copy), v107 (copy)
        v121.current = v12({
            conversation = v100, 
            conversationId = v95.conversationId, 
            Users = v119, 
            localUserId = v107
        }, v121.current);
        return v121.current.itemList;
    end, {
        v100, 
        v95.conversationId, 
        v119, 
        v107
    });
    local v123 = v93(v100);
    local v125 = v4.useMemo(function() --[[ Line: 312 ]]
        -- upvalues: v123 (copy), v122 (copy), v56 (ref), v57 (ref)
        local v124 = {};
        if v123.shouldShowOsaCardOnInitialLoad and not v123.fetchedOldestMessage then
            return v124;
        else
            v124 = table.clone(v122);
            if v123.shouldShowOsaCardNow then
                table.insert(v124, {
                    messageType = v56.Custom, 
                    customEntryType = v57.OsaContextCardOneToOne, 
                    stable_key = v57.OsaContextCardOneToOne
                });
            end;
            return v124;
        end;
    end, {
        v122, 
        v100, 
        v123.shouldShowOsaCardOnInitialLoad, 
        v123.shouldShowOsaCardInConversation, 
        v123.shouldShowOsaCardNow, 
        v123.fetchedOldestMessage
    });
    local v126 = if v120[1] and v106.data then v29.Selectors.getCombinedNameFromId(v106.data, v120[1].id) else nil;
    local v127 = if v120[2] and v106.data then v29.Selectors.getCombinedNameFromId(v106.data, v120[2].id) else nil;
    local v128 = true;
    if #v120 == 1 and not v126 then
        v128 = false;
    elseif #v120 == 2 and (not v126 or not v127) then
        v128 = false;
    end;
    local v129 = l_GetFFlagEnableAppChatInExperience_0() and v37();
    local v130 = nil;
    local v131 = nil;
    local v132 = nil;
    local v133 = nil;
    if v60() then
        v130 = v27();
        v131 = v28();
        if v130 then
            v133 = v130.senderTargetId == v107;
            v132 = if not v133 and v106.data then v29.Selectors.getCombinedNameFromId(v106.data, v130.senderTargetId) else nil;
        end;
    end;
    local v134 = l_useLocalization_0({
        chatInputPlaceholder = v95.chatInputPlaceholderKey, 
        replyChatInputPlaceholder = {
            v95.replyChatInputPlaceholderKey; 
            DISPLAY_NAME = v132
        }, 
        replyToYourselfChatInputPlaceholder = v95.replyToYourselfChatInputPlaceholderKey, 
        invalidMessageTypeText = v95.notImplementedMessageTypeKey, 
        messageDefaultNoticeText = v95.messageDefaultNoticeKey, 
        messageModeratedNoticeText = v95.messageModeratedNoticeKey, 
        messageHiddenNoticeText = v95.messageHiddenNoticeKey, 
        networkErrorText = v95.networkErrorTextKey, 
        newText = v95.newTextKey, 
        schedulePartyText = v95.schedulePartyTextKey, 
        unknownUserText = v95.unknownUserTextKey, 
        oneUserTyping = {
            "Feature.Chat.Message.OneUserTyping"; 
            DISPLAY_NAME = v126
        }, 
        twoUsersTyping = {
            "Feature.Chat.Message.TwoUsersTyping"; 
            DISPLAY_NAME_1 = v126, 
            DISPLAY_NAME_2 = v127
        }, 
        severalUsersTyping = v95.severalUsersTyping, 
        bottomModalText = v95.chatUnavailableWithUserKey, 
        inputBarDisabledText = v95.inputBarDisabledKey
    });
    local v135 = v44(v42.Context);
    local v136 = v43.useMergeState();
    local v137 = v43.useClearState();
    local v138 = v100 and v100.moderationType or v5.None;
    local v139 = v100 and v100.userPendingStatus or v5.None;
    l_useEffect_0(function() --[[ Line: 406 ]]
        -- upvalues: v136 (copy), v95 (copy), v138 (copy), v139 (copy)
        v136({
            conversationId = v95.conversationId, 
            moderationType = v138, 
            userPendingStatus = v139
        });
    end, {
        v136, 
        v95.conversationId, 
        v138, 
        v139
    });
    local v140 = v33(v100 or {});
    local v141 = v100 and v100.source;
    if l_FFlagAppChatEnableDoubleOptIn_0 then
        local v142, v143 = v52(v16.rodux.GetModalSequence.API, v95.conversationId);
        local l_v143_0 = v143 --[[ copy: 41 -> 67 ]];
        local l_v142_0 = v142 --[[ copy: 40 -> 68 ]];
        l_useEffect_0(function() --[[ Line: 422 ]]
            -- upvalues: l_v143_0 (copy), v140 (copy), v141 (copy), v111 (copy), v16 (ref), v95 (copy), v129 (copy), v3 (ref), l_v142_0 (copy)
            if not l_v143_0 then
                return;
            else
                if v140 and v141 == "channels" then
                    v111(v16.rodux.GetPendingStateModal.API(v95.conversationId, v129)):catch(function(v146) --[[ Line: 428 ]]
                        -- upvalues: v3 (ref)
                        v3:warning((("GetPendingStateModal error in ChatConversationContainer %*"):format((tostring(v146)))));
                    end);
                end;
                if not v140 then
                    v111(l_v142_0({
                        modalSequence = v16.Constants.ModalSequence.ConversationTopModal, 
                        isInExperience = v129
                    })):catch(function(v147) --[[ Line: 437 ]]
                        -- upvalues: v3 (ref)
                        v3:warning((("GetModalSequence for ConversationTopModal error in ChatConversationContainer %*"):format((tostring(v147)))));
                    end);
                end;
                return;
            end;
        end, {
            v95.conversationId, 
            v143, 
            v129, 
            v140, 
            v141
        });
    else
        l_useEffect_0(function() --[[ Line: 445 ]]
            -- upvalues: v141 (copy), v140 (copy), v111 (copy), v16 (ref), v95 (copy), v129 (copy)
            if v141 ~= "channels" then
                return;
            elseif v140 then
                v111(v16.rodux.GetPendingStateModal.API(v95.conversationId, v129)):catch(function(v148) --[[ Line: 451 ]]
                    warn("GetPendingStateModal error in ChatConversationContainer " .. tostring(v148));
                end);
                return;
            else
                v111(v16.rodux.GetConversationTopModal.API(v95.conversationId, v129)):catch(function(v149) --[[ Line: 457 ]]
                    warn("GetConversationTopModal error in ChatConversationContainer " .. tostring(v149));
                end);
                return;
            end;
        end, {
            v95.conversationId, 
            v111, 
            v141
        });
    end;
    local v150, v151 = v52(v16.rodux.GetModalSequence.API, v95.conversationId);
    l_useEffect_0(function() --[[ Line: 468 ]]
        -- upvalues: v140 (copy), v151 (ref), v111 (copy), v150 (copy), v16 (ref), v129 (copy), v3 (ref)
        if not v140 and v151 then
            v111(v150({
                modalSequence = v16.Constants.ModalSequence.ConversationOverlay, 
                isInExperience = v129
            })):catch(function(v152) --[[ Line: 473 ]]
                -- upvalues: v3 (ref)
                v3:warning((("GetModalSequence error in ChatConversationContainer %*"):format((tostring(v152)))));
            end);
        end;
    end, {
        v151, 
        v95.conversationId, 
        v140, 
        v129, 
        v138
    });
    if l_FFlagDebugEnableTCDoubleOptIn_DEV_0 then
        v54({
            keyCode = Enum.KeyCode.O, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 480 ]]
            -- upvalues: v3 (ref), v111 (copy), v95 (copy), v16 (ref)
            v3:debug("Ctrl + O pressed, showing new TC double opt in banner");
            v111({
                type = "DEBUG_ShowNewTopModal", 
                conversationId = v95.conversationId, 
                modalVariant = v16.Constants.ConversationTopModal.AddTrustedConnection
            });
        end, {
            v111, 
            v95.conversationId
        });
        v54({
            keyCode = Enum.KeyCode.P, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 489 ]]
            -- upvalues: v3 (ref), v111 (copy), v95 (copy), v16 (ref)
            v3:debug("Ctrl + P pressed, showing new TC double opt in request banner");
            v111({
                type = "DEBUG_ShowNewTopModal", 
                conversationId = v95.conversationId, 
                modalVariant = v16.Constants.ConversationTopModal.TrustedConnectionRequest
            });
        end, {
            v111, 
            v95.conversationId
        });
    end;
    if l_FFlagTCUpsellModalEnabled_DEV_0 then
        v54({
            keyCode = Enum.KeyCode.L, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 500 ]]
            -- upvalues: v3 (ref), v111 (copy), v95 (copy), v16 (ref)
            v3:debug("Ctrl + L pressed, showing new TC created overlay");
            v111({
                type = "DEBUG_ShowNewTCOverlay", 
                conversationId = v95.conversationId, 
                modalVariant = v16.Constants.ConversationOverlay.TrustedConnectionCreated
            });
        end, {
            v111, 
            v95.conversationId
        });
    end;
    if v81 then
        v54({
            keyCode = Enum.KeyCode.N, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 511 ]]
            -- upvalues: v3 (ref), v111 (copy), v95 (copy), v16 (ref)
            v3:debug("Ctrl + N pressed, showing nudge to chat upsell bottom modal");
            v111({
                type = "DEBUG_ShowNudgeToChatUpsellOverlay", 
                conversationId = v95.conversationId, 
                modalVariant = v16.Constants.ConversationBottomModal.NudgeToChatUpsell
            });
        end, {
            v111, 
            v95.conversationId
        });
    end;
    if l_FFlagEnableAEGIS2AppChatConversationBanner_0 or v82 then
        local v153 = nil;
        local v154, v155 = v52(v16.rodux.GetModalSequence.API, v95.conversationId);
        v153 = v154;
        v151 = v155;
        do
            local l_v153_0 = v153;
            l_useEffect_0(function() --[[ Line: 527 ]]
                -- upvalues: v151 (ref), v111 (copy), l_v153_0 (ref), v16 (ref), v129 (copy), v3 (ref)
                if not v151 then
                    return;
                else
                    v111(l_v153_0({
                        modalSequence = v16.Constants.ModalSequence.ConversationBottomModal, 
                        isInExperience = v129
                    })):catch(function(v157) --[[ Line: 535 ]]
                        -- upvalues: v3 (ref)
                        v3:warning((("GetModalSequence for ConversationBottomModal error in ChatConversationContainer %*"):format((tostring(v157)))));
                    end);
                    return;
                end;
            end, {
                v95.conversationId, 
                v151, 
                v129
            });
        end;
    end;
    local v158 = v53(v95.conversationId);
    l_useEffect_0(function() --[[ Line: 543 ]]
        -- upvalues: v158 (copy), v95 (copy)
        if v158 then
            v95.navigateToConversationOverlay();
        end;
    end, {
        v158, 
        v95.conversationId
    });
    local v159 = nil;
    local v160 = nil;
    local v161 = nil;
    local v162 = nil;
    if l_getFFlagAppChatEnableIntervention_0() then
        local v163 = v141 ~= "channels";
        local l_v163_0 = v163 --[[ copy: 47 -> 65 ]];
        local v166 = l_useSelector_0(function(v165) --[[ Line: 555 ]]
            -- upvalues: l_v163_0 (copy), v16 (ref), v95 (copy), v40 (ref)
            return (if l_v163_0 then v16.rodux.GetChatModerationStatuses.getStatus(v165) else v16.rodux.GetChatModerationStatuses.getStatus(v165, v95.conversationId)) == v40.Enum.NetworkStatus.NotStarted;
        end);
        local l_v166_0 = v166 --[[ copy: 48 -> 66 ]];
        l_useEffect_0(function() --[[ Line: 562 ]]
            -- upvalues: l_v166_0 (copy), v111 (copy), v16 (ref), l_v163_0 (copy), v95 (copy)
            if l_v166_0 then
                v111(v16.rodux.GetChatModerationStatuses.API(if l_v163_0 then nil else {
                    v95.conversationId
                })):catch(function(v168) --[[ Line: 568 ]]
                    warn("GetChatModerationStatuses error in ChatConversationContainer " .. tostring(v168));
                end);
            end;
        end, {
            v95.conversationId, 
            v163, 
            v111, 
            v166
        });
        local v169 = v41({
            conversationId = v95.conversationId, 
            conversationModerationType = v138
        });
        v159 = v169.isTimedOut;
        v160 = v169.timeoutEndTimestamp;
        v161 = v169.decisionEventId;
        v162 = v169.duration;
    end;
    local v170 = nil;
    l_useEffect_0(function() --[[ Line: 585 ]]
        -- upvalues: v135 (copy), v45 (ref), v122 (copy)
        v135.emit(v45.ScreenRendered, {
            loadedMessageCount = #v122
        });
    end, {
        v95.conversationId
    });
    v170 = v4.useCallback(function(v171) --[[ Line: 593 ]]
        -- upvalues: v135 (copy), v45 (ref), v137 (copy)
        v135.emit(v45.ScreenExit, {
            conversationExitType = v171
        });
        v137();
    end, {
        v135, 
        v137
    });
    v100 = v100 or {};
    local v172 = false;
    if v100.participantPendingStatus ~= v13.UserPendingStatus.Pending then
        v172 = v109;
    end;
    local v173 = not v172 and v109;
    local v174 = v36({
        v55.ViewUserProfile
    });
    local v175 = v100.conversationType == v14.Type.MULTI_USER_CONVERSATION;
    local v177 = l_useSelector_0(function(v176) --[[ Line: 613 ]]
        -- upvalues: v175 (copy), v100 (ref)
        return v175 and v100.initiator == v176.LocalUserId;
    end);
    local function v179(v178) --[[ Line: 618 ]]
        -- upvalues: v174 (copy), v55 (ref), v98 (copy), v95 (copy), v15 (ref), v140 (copy), v175 (copy), v177 (copy)
        if v174[v55.ViewUserProfile] then
            v98(v178);
            return;
        else
            v95.navigateToScreen(v15.ParticipantDialog, {
                conversationId = v95.conversationId, 
                participantId = v178, 
                showRemoveUserButton = not v140 and v175 and v177
            }, true);
            return;
        end;
    end;
    local v180 = if v130 then if v133 then v134.replyToYourselfChatInputPlaceholder else v134.replyChatInputPlaceholder else v134.chatInputPlaceholder;
    l_useEffect_0(function() --[[ Line: 636 ]]
        -- upvalues: v95 (copy), v105 (ref)
        v95.updateConversationTitle(v105);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v105, 
        v95.updateConversationTitle
    } else l_dependencyArray_0(v105, v95.updateConversationTitle));
    local v181 = if l_getFFlagAppChatEnableIntervention_0() then v4.useCallback(function() --[[ Line: 645 ]]
        -- upvalues: l_chatInputBoxDisabledPressedSignal_0 (ref), v160 (ref), v161 (ref), v162 (ref)
        l_chatInputBoxDisabledPressedSignal_0:fire({
            endTimestamp = v160, 
            decisionEventId = v161, 
            duration = v162
        });
    end, {
        v160, 
        v161, 
        v162
    }) else nil;
    local v182, v183 = v4.useState(v95.navigation and v95.navigation.isFocused and v95.navigation.isFocused());
    local v184 = nil;
    local v185 = nil;
    if v58 then
        v184 = v182;
        if v62 and v95.isFocused and not v95.isFocused() then
            v184 = false;
        end;
        v185 = v184 and not v140;
    end;
    local v186 = nil;
    if v58 then
        local v187 = v4.useRef(false);
        local l_v187_0 = v187 --[[ copy: 61 -> 64 ]];
        v4.useEffect(function() --[[ Line: 675 ]]
            -- upvalues: l_v187_0 (copy), v172 (copy)
            l_v187_0.current = not v172;
        end, {
            v95.conversationId, 
            v172
        });
        local v190 = v4.useCallback(function(v189) --[[ Line: 679 ]]
            -- upvalues: v59 (ref), v95 (copy), v185 (ref), l_v187_0 (copy), v3 (ref), v122 (copy)
            if not v59.isActive(v59.Events.ChatConversationTTI, {
                conversationId = v95.conversationId
            }) or not v185 then
                return;
            elseif not l_v187_0.current then
                v3:debug("TTI: Messages ready but waiting for input bar (chatInputBarReady={}, reason={})", l_v187_0.current, v189);
                return;
            else
                v59.finish(v59.Events.ChatConversationTTI, {
                    conversationId = v95.conversationId, 
                    numElementsRendered = #v122
                });
                return;
            end;
        end, {
            v95.conversationId, 
            v182, 
            v140, 
            #v122
        });
        v4.useEffect(function() --[[ Line: 703 ]]
            -- upvalues: v190 (copy)
            v190("messages_ready");
        end, {
            v190, 
            #v122, 
            v95.conversationId
        });
        v186 = v4.useCallback(function() --[[ Line: 707 ]]
            -- upvalues: l_v187_0 (copy), v190 (copy)
            l_v187_0.current = true;
            v190("input_bar_ready");
        end, {
            v190
        });
    end;
    if v58 then
        local v191 = v4.useRef(nil);
        local l_v191_0 = v191 --[[ copy: 61 -> 63 ]];
        v4.useEffect(function() --[[ Line: 721 ]]
            -- upvalues: v3 (ref), v95 (copy), l_v191_0 (copy), v59 (ref)
            v3:debug("Perf: Resetting message perf tracking for conversation {}", v95.conversationId);
            l_v191_0.current = nil;
            local v193 = {
                conversationId = v95.conversationId
            };
            v59.cancel(v59.Events.MessageSendToPendingRender, v193);
            v59.cancel(v59.Events.MessageSendResponseToFinalRender, v193);
            v59.cancel(v59.Events.MessageSendToFinalRender, v193);
            v59.cancel(v59.Events.MessageReceiveToRender, v193);
        end, {
            v95.conversationId
        });
        v4.useEffect(function() --[[ Line: 734 ]]
            -- upvalues: v122 (copy), v95 (copy), v107 (copy), l_v191_0 (copy), v59 (ref)
            local v194 = v122[1];
            if not v194 or not v194.id then
                return;
            else
                local v195 = {
                    conversationId = v95.conversationId
                };
                local v196 = v194.senderTargetId == v107;
                if not v194.isSending and (v194.senderType == "system" or not v196) then
                    if v194.id ~= l_v191_0.current then
                        l_v191_0.current = v194.id;
                        v59.finish(v59.Events.MessageReceiveToRender, v195);
                    end;
                elseif v59.isActive(v59.Events.MessageReceiveToRender, v195) then
                    v59.cancel(v59.Events.MessageReceiveToRender, v195);
                end;
                if not v196 then
                    return;
                elseif v194.isSending then
                    v59.finish(v59.Events.MessageSendToPendingRender, v195);
                    return;
                else
                    v59.finish(v59.Events.MessageSendResponseToFinalRender, v195);
                    v59.finish(v59.Events.MessageSendToFinalRender, v195);
                    return;
                end;
            end;
        end, {
            v122, 
            v107, 
            v95.conversationId
        });
    end;
    l_useEffect_0(function() --[[ Line: 779 ]]
        -- upvalues: v95 (copy), v6 (ref), v58 (ref), v183 (copy), v59 (ref)
        local v199 = v95.navigation and v95.navigation.addListener and v95.navigation.addListener(v6.Events.WillBlur, function(v197) --[[ Line: 782 ]]
            -- upvalues: v58 (ref), v183 (ref), v59 (ref), v95 (ref)
            if v58 then
                local v198 = v197 and v197.action and v197.action.params and v197.action.params.isOverlay or false;
                v183(v198);
                if v198 then
                    return;
                elseif v59.isActive(v59.Events.ChatConversationTTI, {
                    conversationId = v95.conversationId
                }) then
                    v59.cancel(v59.Events.ChatConversationTTI, {
                        conversationId = v95.conversationId
                    });
                    return;
                end;
            elseif v197 and v197.action and v197.action.params and v197.action.params.isOverlay then
                v183(true);
                return;
            else
                v183(false);
            end;
        end);
        local v201 = v95.navigation and v95.navigation.addListener and v95.navigation.addListener(v6.Events.WillFocus, function(_) --[[ Line: 813 ]]
            -- upvalues: v183 (ref)
            v183(true);
        end);
        return function() --[[ Line: 817 ]]
            -- upvalues: v199 (copy), v201 (copy)
            if v199 then
                v199.remove();
            end;
            if v201 then
                v201.remove();
            end;
        end;
    end, {
        v95.navigation, 
        v95.conversationId
    });
    l_useEffect_0(function() --[[ Line: 828 ]]
        -- upvalues: v123 (copy), v111 (copy), v50 (ref), v51 (ref), v95 (copy), v72 (ref), v134 (copy)
        if v123.shouldShowOsaCardOnInitialLoad then
            v111(v50(v51, v95.conversationId, v72)):catch(function() --[[ Line: 832 ]]
                -- upvalues: v95 (ref), v134 (ref)
                v95.navigateToToast({
                    toastProps = {
                        toastContent = {
                            toastTitle = v134.networkErrorText
                        }
                    }
                });
            end);
        end;
    end, {
        v123.shouldShowOsaCardOnInitialLoad
    });
    local v202 = not l_FFlagIsSquadEnabledAMP_0 or v95.getCanAccessParty;
    if v58 then
        if not v184 then
            return nil;
        elseif v140 then
            return v4.createElement(v9, {
                conversationId = v95.conversationId, 
                topBarHeight = v95.topBarHeight, 
                networkErrorText = v134.networkErrorText, 
                navigateToToast = v95.navigateToToast, 
                wideMode = v95.wideMode, 
                onConversationUnmount = v170, 
                navigateBack = v95.navigateBack
            });
        else
            return v4.createElement(v8, v5.Dictionary.join(v95, v99, v134, {
                moreMenuEnabled = if l_FFlagIsSquadEnabledAMP_0 then v202 else nil, 
                conversation = v100, 
                conversationTitle = v105, 
                itemList = v125, 
                localUserId = v107, 
                openGameDetailsPage = v95.openGameDetailsPage, 
                openViewProfile = v179, 
                readingMessagesIsEnabled = v95.getReadingMessagesIsEnabled(), 
                Users = v119, 
                usersTyping = v120, 
                displayNamesAvailable = v128, 
                onConversationUnmount = v170, 
                recipientIdsSerialized = v101, 
                chatIsVisible = v108, 
                chatInputPlaceholder = v180, 
                replyingToMessage = v130, 
                replyingToMessageDispatch = v131, 
                shouldShowChatInputBar = v172, 
                shouldShowLegacyBottomModal = v173, 
                shouldDisableChatInputBar = v159, 
                onChatInputBarReady = if v58 then v186 else nil, 
                inputBarDisabledEndTimestampDisplay = v160, 
                onDisabledInputBarActivated = v181, 
                scrollToTopOnInitialOsaLoad = v123.shouldShowOsaCardOnInitialLoad and v123.fetchedOldestMessage, 
                navigateToSquadLobby = if v202 then v95.navigateToSquadLobby else nil, 
                shouldHideMoreMenuButton = if v202 then not v172 else nil
            }));
        end;
    elseif not v182 then
        return nil;
    elseif v62 and v95.isFocused and not v95.isFocused() then
        return nil;
    elseif v140 then
        return v4.createElement(v9, {
            conversationId = v95.conversationId, 
            topBarHeight = v95.topBarHeight, 
            networkErrorText = v134.networkErrorText, 
            navigateToToast = v95.navigateToToast, 
            wideMode = v95.wideMode, 
            onConversationUnmount = v170, 
            navigateBack = v95.navigateBack, 
            style = v95.style
        });
    else
        return v4.createElement(v8, v5.Dictionary.join(v95, v99, v134, {
            moreMenuEnabled = if l_FFlagIsSquadEnabledAMP_0 then v202 else nil, 
            conversation = v100, 
            conversationTitle = v105, 
            itemList = v125, 
            localUserId = v107, 
            openGameDetailsPage = v95.openGameDetailsPage, 
            openViewProfile = v179, 
            readingMessagesIsEnabled = v95.getReadingMessagesIsEnabled(), 
            Users = v119, 
            usersTyping = v120, 
            displayNamesAvailable = v128, 
            onConversationUnmount = v170, 
            recipientIdsSerialized = v101, 
            chatIsVisible = v108, 
            chatInputPlaceholder = v180, 
            replyingToMessage = v130, 
            replyingToMessageDispatch = v131, 
            shouldShowChatInputBar = v172, 
            shouldShowLegacyBottomModal = v173, 
            shouldDisableChatInputBar = v159, 
            onChatInputBarReady = if v58 then v186 else nil, 
            inputBarDisabledEndTimestampDisplay = v160, 
            onDisabledInputBarActivated = v181, 
            scrollToTopOnInitialOsaLoad = v123.shouldShowOsaCardOnInitialLoad and v123.fetchedOldestMessage, 
            navigateToSquadLobby = if v202 then v95.navigateToSquadLobby else nil, 
            shouldHideMoreMenuButton = if v202 then not v172 else nil
        }));
    end;
end;
return l_UniversalAppPolicy_0.connect(function(v203) --[[ Line: 946 ]]
    return {
        viewProfileOnAvatarPressed = v203.getChatTapConversationThumbnail(), 
        getCanAccessParty = v203.getCanAccessParty()
    };
end)(ChatConversationContainer);