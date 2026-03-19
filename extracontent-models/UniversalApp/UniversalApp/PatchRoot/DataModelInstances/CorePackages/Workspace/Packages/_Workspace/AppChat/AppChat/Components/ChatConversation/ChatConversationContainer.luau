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
local v71 = game:DefineFastInt("AppChatGetAllMessagesDepth", 100);
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local v73 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatSuppressGroupOSAContextCard);
local l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 = require(l_Parent_0.SharedFlags).FFlagAppChatNavigateBackIfOSAUnacknowledged;
local v75 = require(l_script_FirstAncestor_0.Utils.shouldShowOSAForConversation);
local function _(v76) --[[ Line: 87 ]] --[[ Name: isOverlayNavigation ]]
    return v76 and v76.action and v76.action.params and v76.action.params.isOverlay or false;
end;
local v79 = {
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
    getReadingMessagesIsEnabled = function() --[[ Line: 114 ]] --[[ Name: getReadingMessagesIsEnabled ]]

    end, 
    updateConversationTitle = function(_) --[[ Line: 115 ]] --[[ Name: updateConversationTitle ]]

    end, 
    navigateToScreen = function() --[[ Line: 116 ]] --[[ Name: navigateToScreen ]]

    end, 
    inputBarDisabledKey = "Feature.Chat.Label.ChatDisabled", 
    navigateToChatLanding = function() --[[ Line: 118 ]] --[[ Name: navigateToChatLanding ]]

    end, 
    releaseInputBarFocus = function() --[[ Line: 119 ]] --[[ Name: releaseInputBarFocus ]]

    end, 
    navigateToSquadLobby = function() --[[ Line: 120 ]] --[[ Name: navigateToSquadLobby ]]

    end, 
    navigateToConversationOverlay = function() --[[ Line: 121 ]] --[[ Name: navigateToConversationOverlay ]]

    end, 
    getCanAccessParty = true
};
local function v86(v80) --[[ Line: 126 ]] --[[ Name: getOsaState ]]
    -- upvalues: v73 (copy), v14 (copy)
    local v81 = v80 and v80.fetchedOldestMessage;
    local v82 = not v73 or not v80 or v80.conversationType ~= v14.Type.MULTI_USER_CONVERSATION;
    local v83 = v80 and v82 and (v80.source == "friends" or v80.osaAcknowledgementStatus == v14.OsaAcknowledgementStatus.Unacknowledged or v80.osaAcknowledgementStatus == v14.OsaAcknowledgementStatus.Acknowledged);
    local v84 = v80 and v80.osaAcknowledgementStatus == v14.OsaAcknowledgementStatus.Unacknowledged;
    local v85 = v80 and v80.source == "friends";
    return {
        shouldShowOsaCardInConversation = v83, 
        fetchedOldestMessage = v81, 
        shouldShowOsaCardOnInitialLoad = v83 and v84 and not v85, 
        shouldShowOsaCardNow = v83 and (v81 or v85)
    };
end;
ChatConversationContainer = function(v87) --[[ Line: 154 ]] --[[ Name: ChatConversationContainer ]]
    -- upvalues: v5 (copy), v79 (copy), v11 (copy), v4 (copy), v10 (copy), v24 (copy), v18 (copy), v19 (copy), v32 (copy), l_HttpService_0 (copy), l_useLocalUserId_0 (copy), v34 (copy), v38 (copy), v46 (copy), l_useEffect_0 (copy), l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 (copy), v75 (copy), l_FFlagAppChatInterventionFocusFix_0 (copy), l_useSignal_0 (copy), l_interventionTreatmentShownSignal_0 (copy), l_Constants_0 (copy), v29 (copy), v31 (copy), v30 (copy), v25 (copy), v26 (copy), v12 (copy), v86 (copy), v56 (copy), v57 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), v37 (copy), v60 (copy), v27 (copy), v28 (copy), l_useLocalization_0 (copy), v44 (copy), v42 (copy), v43 (copy), l_useDispatch_0 (copy), v33 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), v52 (copy), v16 (copy), v3 (copy), l_FFlagDebugEnableTCDoubleOptIn_DEV_0 (copy), v54 (copy), l_FFlagTCUpsellModalEnabled_DEV_0 (copy), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), v53 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), l_useSelector_0 (copy), v40 (copy), v41 (copy), v45 (copy), v13 (copy), v36 (copy), v55 (copy), v14 (copy), v15 (copy), l_dependencyArray_0 (copy), l_chatInputBoxDisabledPressedSignal_0 (copy), v58 (copy), v62 (copy), v59 (copy), v6 (copy), v50 (copy), v51 (copy), v71 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), v9 (copy), v8 (copy)
    local v88 = v5.Dictionary.join(v79, v87);
    local v89 = v11();
    local v91 = v4.useCallback(function(v90) --[[ Line: 157 ]]
        -- upvalues: v89 (copy), v10 (ref), v88 (copy)
        v89:navigate(v10.NavigationEvents.ChatConversationProfile);
        v88.openViewProfile(v90);
    end, {
        v88.openViewProfile, 
        v89
    });
    local v92 = v24(v18);
    local v93 = v19(v88.conversationId);
    local v94 = nil;
    local v95 = v32(v93);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 165 ]]
        -- upvalues: l_HttpService_0 (ref), v95 (copy)
        return l_HttpService_0:JSONEncode(v95);
    end);
    v94 = if l_status_0 then l_result_0 else "[]";
    local v98 = nil;
    local v99 = nil;
    local v100 = l_useLocalUserId_0();
    local v101 = v34();
    local v102 = v38();
    local v103 = v46();
    l_useEffect_0(function() --[[ Line: 178 ]]
        -- upvalues: v103 (copy), v88 (copy)
        if not v103 then
            v88.navigateToChatLanding();
        end;
    end, {
        v103, 
        v88.navigateToChatLanding
    });
    if l_FFlagAppChatNavigateBackIfOSAUnacknowledged_0 then
        local v104 = if v88.navigation and v88.navigation.getParam then v88.navigation.getParam("isNavigatedFromGroupOSAJoin", false) else false;
        local l_v104_0 = v104 --[[ copy: 16 -> 69 ]];
        l_useEffect_0(function() --[[ Line: 190 ]]
            -- upvalues: l_v104_0 (copy), v75 (ref), v93 (ref), v88 (copy)
            if not l_v104_0 and v75(v93) then
                v88.navigateToChatLanding();
            end;
        end, {
            v93, 
            v88.navigateToChatLanding, 
            v104
        });
    end;
    if l_FFlagAppChatInterventionFocusFix_0 then
        l_useSignal_0(l_interventionTreatmentShownSignal_0, v4.useCallback(function(v106) --[[ Line: 200 ]]
            -- upvalues: l_Constants_0 (ref), v88 (copy)
            if v106 == l_Constants_0.TreatmentType.PartyChatNudgeDialog or v106 == l_Constants_0.TreatmentType.PartyChatTimeoutDialog then
                v88.releaseInputBarFocus();
            end;
        end, {
            v88.releaseInputBarFocus
        }));
    end;
    v99 = v29.Hooks.useUserProfilesFetch({
        userIds = v31(v93, v100), 
        query = v29.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v107 = v29.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v100))
        }, 
        query = v29.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    v98 = v30(v93, v99.data and v99.data.userProfiles, if v107.data then v29.Selectors.getCombinedNameFromId(v107.data, (tostring(v100))) else "");
    local v108 = v25();
    local v109 = v26(v88.conversationId);
    local v110 = v4.useRef({
        itemList = {}, 
        previousMessagesState = {}, 
        previousSendingMessagesState = {}, 
        previousMessagesResult = {}
    });
    local v111 = v4.useMemo(function() --[[ Line: 239 ]]
        -- upvalues: v110 (copy), v12 (ref), v93 (ref), v88 (copy), v108 (copy), v100 (copy)
        v110.current = v12({
            conversation = v93, 
            conversationId = v88.conversationId, 
            Users = v108, 
            localUserId = v100
        }, v110.current);
        return v110.current.itemList;
    end, {
        v93, 
        v88.conversationId, 
        v108, 
        v100
    });
    local v112 = v86(v93);
    local v114 = v4.useMemo(function() --[[ Line: 252 ]]
        -- upvalues: v112 (copy), v111 (copy), v56 (ref), v57 (ref)
        local v113 = {};
        if v112.shouldShowOsaCardOnInitialLoad and not v112.fetchedOldestMessage then
            return v113;
        else
            v113 = table.clone(v111);
            if v112.shouldShowOsaCardNow then
                table.insert(v113, {
                    messageType = v56.Custom, 
                    customEntryType = v57.OsaContextCardOneToOne, 
                    stable_key = v57.OsaContextCardOneToOne
                });
            end;
            return v113;
        end;
    end, {
        v111, 
        v93, 
        v112.shouldShowOsaCardOnInitialLoad, 
        v112.shouldShowOsaCardInConversation, 
        v112.shouldShowOsaCardNow, 
        v112.fetchedOldestMessage
    });
    local v115 = if v109[1] and v99.data then v29.Selectors.getCombinedNameFromId(v99.data, v109[1].id) else nil;
    local v116 = if v109[2] and v99.data then v29.Selectors.getCombinedNameFromId(v99.data, v109[2].id) else nil;
    local v117 = true;
    if #v109 == 1 and not v115 then
        v117 = false;
    elseif #v109 == 2 and (not v115 or not v116) then
        v117 = false;
    end;
    local v118 = l_GetFFlagEnableAppChatInExperience_0() and v37();
    local v119 = nil;
    local v120 = nil;
    local v121 = nil;
    local v122 = nil;
    if v60() then
        v119 = v27();
        v120 = v28();
        if v119 then
            v122 = v119.senderTargetId == v100;
            v121 = if not v122 and v99.data then v29.Selectors.getCombinedNameFromId(v99.data, v119.senderTargetId) else nil;
        end;
    end;
    local v123 = l_useLocalization_0({
        chatInputPlaceholder = v88.chatInputPlaceholderKey, 
        replyChatInputPlaceholder = {
            v88.replyChatInputPlaceholderKey; 
            DISPLAY_NAME = v121
        }, 
        replyToYourselfChatInputPlaceholder = v88.replyToYourselfChatInputPlaceholderKey, 
        invalidMessageTypeText = v88.notImplementedMessageTypeKey, 
        messageDefaultNoticeText = v88.messageDefaultNoticeKey, 
        messageModeratedNoticeText = v88.messageModeratedNoticeKey, 
        messageHiddenNoticeText = v88.messageHiddenNoticeKey, 
        networkErrorText = v88.networkErrorTextKey, 
        newText = v88.newTextKey, 
        schedulePartyText = v88.schedulePartyTextKey, 
        unknownUserText = v88.unknownUserTextKey, 
        oneUserTyping = {
            "Feature.Chat.Message.OneUserTyping"; 
            DISPLAY_NAME = v115
        }, 
        twoUsersTyping = {
            "Feature.Chat.Message.TwoUsersTyping"; 
            DISPLAY_NAME_1 = v115, 
            DISPLAY_NAME_2 = v116
        }, 
        severalUsersTyping = v88.severalUsersTyping, 
        bottomModalText = v88.chatUnavailableWithUserKey, 
        inputBarDisabledText = v88.inputBarDisabledKey
    });
    local v124 = v44(v42.Context);
    local v125 = v43.useMergeState();
    local v126 = v43.useClearState();
    local v127 = l_useDispatch_0();
    local v128 = v93 and v93.moderationType or v5.None;
    local v129 = v93 and v93.userPendingStatus or v5.None;
    l_useEffect_0(function() --[[ Line: 347 ]]
        -- upvalues: v125 (copy), v88 (copy), v128 (copy), v129 (copy)
        v125({
            conversationId = v88.conversationId, 
            moderationType = v128, 
            userPendingStatus = v129
        });
    end, {
        v125, 
        v88.conversationId, 
        v128, 
        v129
    });
    local v130 = v33(v93 or {});
    local v131 = v93 and v93.source;
    if l_FFlagAppChatEnableDoubleOptIn_0 then
        local v132, v133 = v52(v16.rodux.GetModalSequence.API, v88.conversationId);
        local l_v133_0 = v133 --[[ copy: 41 -> 67 ]];
        local l_v132_0 = v132 --[[ copy: 40 -> 68 ]];
        l_useEffect_0(function() --[[ Line: 363 ]]
            -- upvalues: l_v133_0 (copy), v130 (copy), v131 (copy), v127 (copy), v16 (ref), v88 (copy), v118 (copy), v3 (ref), l_v132_0 (copy)
            if not l_v133_0 then
                return;
            else
                if v130 and v131 == "channels" then
                    v127(v16.rodux.GetPendingStateModal.API(v88.conversationId, v118)):catch(function(v136) --[[ Line: 369 ]]
                        -- upvalues: v3 (ref)
                        v3:warning((("GetPendingStateModal error in ChatConversationContainer %*"):format((tostring(v136)))));
                    end);
                end;
                if not v130 then
                    v127(l_v132_0({
                        modalSequence = v16.Constants.ModalSequence.ConversationTopModal, 
                        isInExperience = v118
                    })):catch(function(v137) --[[ Line: 378 ]]
                        -- upvalues: v3 (ref)
                        v3:warning((("GetModalSequence for ConversationTopModal error in ChatConversationContainer %*"):format((tostring(v137)))));
                    end);
                end;
                return;
            end;
        end, {
            v88.conversationId, 
            v133, 
            v118, 
            v130, 
            v131
        });
    else
        l_useEffect_0(function() --[[ Line: 386 ]]
            -- upvalues: v131 (copy), v130 (copy), v127 (copy), v16 (ref), v88 (copy), v118 (copy)
            if v131 ~= "channels" then
                return;
            elseif v130 then
                v127(v16.rodux.GetPendingStateModal.API(v88.conversationId, v118)):catch(function(v138) --[[ Line: 392 ]]
                    warn("GetPendingStateModal error in ChatConversationContainer " .. tostring(v138));
                end);
                return;
            else
                v127(v16.rodux.GetConversationTopModal.API(v88.conversationId, v118)):catch(function(v139) --[[ Line: 398 ]]
                    warn("GetConversationTopModal error in ChatConversationContainer " .. tostring(v139));
                end);
                return;
            end;
        end, {
            v88.conversationId, 
            v127, 
            v131
        });
    end;
    local v140, v141 = v52(v16.rodux.GetModalSequence.API, v88.conversationId);
    l_useEffect_0(function() --[[ Line: 409 ]]
        -- upvalues: v130 (copy), v141 (ref), v127 (copy), v140 (copy), v16 (ref), v118 (copy), v3 (ref)
        if not v130 and v141 then
            v127(v140({
                modalSequence = v16.Constants.ModalSequence.ConversationOverlay, 
                isInExperience = v118
            })):catch(function(v142) --[[ Line: 414 ]]
                -- upvalues: v3 (ref)
                v3:warning((("GetModalSequence error in ChatConversationContainer %*"):format((tostring(v142)))));
            end);
        end;
    end, {
        v141, 
        v88.conversationId, 
        v130, 
        v118, 
        v128
    });
    if l_FFlagDebugEnableTCDoubleOptIn_DEV_0 then
        v54({
            keyCode = Enum.KeyCode.O, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 421 ]]
            -- upvalues: v3 (ref), v127 (copy), v88 (copy), v16 (ref)
            v3:debug("Ctrl + O pressed, showing new TC double opt in banner");
            v127({
                type = "DEBUG_ShowNewTopModal", 
                conversationId = v88.conversationId, 
                modalVariant = v16.Constants.ConversationTopModal.AddTrustedConnection
            });
        end, {
            v127, 
            v88.conversationId
        });
        v54({
            keyCode = Enum.KeyCode.P, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 430 ]]
            -- upvalues: v3 (ref), v127 (copy), v88 (copy), v16 (ref)
            v3:debug("Ctrl + P pressed, showing new TC double opt in request banner");
            v127({
                type = "DEBUG_ShowNewTopModal", 
                conversationId = v88.conversationId, 
                modalVariant = v16.Constants.ConversationTopModal.TrustedConnectionRequest
            });
        end, {
            v127, 
            v88.conversationId
        });
    end;
    if l_FFlagTCUpsellModalEnabled_DEV_0 then
        v54({
            keyCode = Enum.KeyCode.L, 
            modifierKey = Enum.ModifierKey.Ctrl
        }, function() --[[ Line: 441 ]]
            -- upvalues: v3 (ref), v127 (copy), v88 (copy), v16 (ref)
            v3:debug("Ctrl + L pressed, showing new TC created overlay");
            v127({
                type = "DEBUG_ShowNewTCOverlay", 
                conversationId = v88.conversationId, 
                modalVariant = v16.Constants.ConversationOverlay.TrustedConnectionCreated
            });
        end, {
            v127, 
            v88.conversationId
        });
    end;
    if l_FFlagEnableAEGIS2AppChatConversationBanner_0 then
        local v143 = nil;
        local v144, v145 = v52(v16.rodux.GetModalSequence.API, v88.conversationId);
        v143 = v144;
        v141 = v145;
        do
            local l_v143_0 = v143;
            l_useEffect_0(function() --[[ Line: 457 ]]
                -- upvalues: v141 (ref), v127 (copy), l_v143_0 (ref), v16 (ref), v118 (copy), v3 (ref)
                if not v141 then
                    return;
                else
                    v127(l_v143_0({
                        modalSequence = v16.Constants.ModalSequence.ConversationBottomModal, 
                        isInExperience = v118
                    })):catch(function(v147) --[[ Line: 465 ]]
                        -- upvalues: v3 (ref)
                        v3:warning((("GetModalSequence for ConversationBottomModal error in ChatConversationContainer %*"):format((tostring(v147)))));
                    end);
                    return;
                end;
            end, {
                v88.conversationId, 
                v141, 
                v118
            });
        end;
    end;
    local v148 = v53(v88.conversationId);
    l_useEffect_0(function() --[[ Line: 473 ]]
        -- upvalues: v148 (copy), v88 (copy)
        if v148 then
            v88.navigateToConversationOverlay();
        end;
    end, {
        v148, 
        v88.conversationId
    });
    local v149 = nil;
    local v150 = nil;
    local v151 = nil;
    local v152 = nil;
    if l_getFFlagAppChatEnableIntervention_0() then
        local v153 = v131 ~= "channels";
        local l_v153_0 = v153 --[[ copy: 47 -> 65 ]];
        local v156 = l_useSelector_0(function(v155) --[[ Line: 485 ]]
            -- upvalues: l_v153_0 (copy), v16 (ref), v88 (copy), v40 (ref)
            return (if l_v153_0 then v16.rodux.GetChatModerationStatuses.getStatus(v155) else v16.rodux.GetChatModerationStatuses.getStatus(v155, v88.conversationId)) == v40.Enum.NetworkStatus.NotStarted;
        end);
        local l_v156_0 = v156 --[[ copy: 48 -> 66 ]];
        l_useEffect_0(function() --[[ Line: 492 ]]
            -- upvalues: l_v156_0 (copy), v127 (copy), v16 (ref), l_v153_0 (copy), v88 (copy)
            if l_v156_0 then
                v127(v16.rodux.GetChatModerationStatuses.API(if l_v153_0 then nil else {
                    v88.conversationId
                })):catch(function(v158) --[[ Line: 498 ]]
                    warn("GetChatModerationStatuses error in ChatConversationContainer " .. tostring(v158));
                end);
            end;
        end, {
            v88.conversationId, 
            v153, 
            v127, 
            v156
        });
        local v159 = v41({
            conversationId = v88.conversationId, 
            conversationModerationType = v128
        });
        v149 = v159.isTimedOut;
        v150 = v159.timeoutEndTimestamp;
        v151 = v159.decisionEventId;
        v152 = v159.duration;
    end;
    local v160 = nil;
    l_useEffect_0(function() --[[ Line: 515 ]]
        -- upvalues: v124 (copy), v45 (ref), v111 (copy)
        v124.emit(v45.ScreenRendered, {
            loadedMessageCount = #v111
        });
    end, {
        v88.conversationId
    });
    v160 = v4.useCallback(function(v161) --[[ Line: 523 ]]
        -- upvalues: v124 (copy), v45 (ref), v126 (copy)
        v124.emit(v45.ScreenExit, {
            conversationExitType = v161
        });
        v126();
    end, {
        v124, 
        v126
    });
    v93 = v93 or {};
    local v162 = false;
    if v93.participantPendingStatus ~= v13.UserPendingStatus.Pending then
        v162 = v102;
    end;
    local v163 = not v162 and v102;
    local v164 = v36({
        v55.ViewUserProfile
    });
    local v165 = v93.conversationType == v14.Type.MULTI_USER_CONVERSATION;
    local v167 = l_useSelector_0(function(v166) --[[ Line: 543 ]]
        -- upvalues: v165 (copy), v93 (ref)
        return v165 and v93.initiator == v166.LocalUserId;
    end);
    local function v169(v168) --[[ Line: 548 ]]
        -- upvalues: v164 (copy), v55 (ref), v91 (copy), v88 (copy), v15 (ref), v130 (copy), v165 (copy), v167 (copy)
        if v164[v55.ViewUserProfile] then
            v91(v168);
            return;
        else
            v88.navigateToScreen(v15.ParticipantDialog, {
                conversationId = v88.conversationId, 
                participantId = v168, 
                showRemoveUserButton = not v130 and v165 and v167
            }, true);
            return;
        end;
    end;
    local v170 = if v119 then if v122 then v123.replyToYourselfChatInputPlaceholder else v123.replyChatInputPlaceholder else v123.chatInputPlaceholder;
    l_useEffect_0(function() --[[ Line: 565 ]]
        -- upvalues: v88 (copy), v98 (ref)
        v88.updateConversationTitle(v98);
    end, l_dependencyArray_0(v98, v88.updateConversationTitle));
    local v171 = if l_getFFlagAppChatEnableIntervention_0() then v4.useCallback(function() --[[ Line: 570 ]]
        -- upvalues: l_chatInputBoxDisabledPressedSignal_0 (ref), v150 (ref), v151 (ref), v152 (ref)
        l_chatInputBoxDisabledPressedSignal_0:fire({
            endTimestamp = v150, 
            decisionEventId = v151, 
            duration = v152
        });
    end, {
        v150, 
        v151, 
        v152
    }) else nil;
    local v172, v173 = v4.useState(v88.navigation and v88.navigation.isFocused and v88.navigation.isFocused());
    local v174 = nil;
    local v175 = nil;
    if v58 then
        v174 = v172;
        if v62 and v88.isFocused and not v88.isFocused() then
            v174 = false;
        end;
        v175 = v174 and not v130;
    end;
    local v176 = nil;
    if v58 then
        local v177 = v4.useRef(false);
        local l_v177_0 = v177 --[[ copy: 61 -> 64 ]];
        v4.useEffect(function() --[[ Line: 600 ]]
            -- upvalues: l_v177_0 (copy), v162 (copy)
            l_v177_0.current = not v162;
        end, {
            v88.conversationId, 
            v162
        });
        local v180 = v4.useCallback(function(v179) --[[ Line: 604 ]]
            -- upvalues: v59 (ref), v88 (copy), v175 (ref), l_v177_0 (copy), v3 (ref), v111 (copy)
            if not v59.isActive(v59.Events.ChatConversationTTI, {
                conversationId = v88.conversationId
            }) or not v175 then
                return;
            elseif not l_v177_0.current then
                v3:debug("TTI: Messages ready but waiting for input bar (chatInputBarReady={}, reason={})", l_v177_0.current, v179);
                return;
            else
                v59.finish(v59.Events.ChatConversationTTI, {
                    conversationId = v88.conversationId, 
                    numElementsRendered = #v111
                });
                return;
            end;
        end, {
            v88.conversationId, 
            v172, 
            v130, 
            #v111
        });
        v4.useEffect(function() --[[ Line: 628 ]]
            -- upvalues: v180 (copy)
            v180("messages_ready");
        end, {
            v180, 
            #v111, 
            v88.conversationId
        });
        v176 = v4.useCallback(function() --[[ Line: 632 ]]
            -- upvalues: l_v177_0 (copy), v180 (copy)
            l_v177_0.current = true;
            v180("input_bar_ready");
        end, {
            v180
        });
    end;
    if v58 then
        local v181 = v4.useRef(nil);
        local l_v181_0 = v181 --[[ copy: 61 -> 63 ]];
        v4.useEffect(function() --[[ Line: 646 ]]
            -- upvalues: v3 (ref), v88 (copy), l_v181_0 (copy), v59 (ref)
            v3:debug("Perf: Resetting message perf tracking for conversation {}", v88.conversationId);
            l_v181_0.current = nil;
            local v183 = {
                conversationId = v88.conversationId
            };
            v59.cancel(v59.Events.MessageSendToPendingRender, v183);
            v59.cancel(v59.Events.MessageSendResponseToFinalRender, v183);
            v59.cancel(v59.Events.MessageSendToFinalRender, v183);
            v59.cancel(v59.Events.MessageReceiveToRender, v183);
        end, {
            v88.conversationId
        });
        v4.useEffect(function() --[[ Line: 659 ]]
            -- upvalues: v111 (copy), v88 (copy), v100 (copy), l_v181_0 (copy), v59 (ref)
            local v184 = v111[1];
            if not v184 or not v184.id then
                return;
            else
                local v185 = {
                    conversationId = v88.conversationId
                };
                local v186 = v184.senderTargetId == v100;
                if not v184.isSending and (v184.senderType == "system" or not v186) then
                    if v184.id ~= l_v181_0.current then
                        l_v181_0.current = v184.id;
                        v59.finish(v59.Events.MessageReceiveToRender, v185);
                    end;
                elseif v59.isActive(v59.Events.MessageReceiveToRender, v185) then
                    v59.cancel(v59.Events.MessageReceiveToRender, v185);
                end;
                if not v186 then
                    return;
                elseif v184.isSending then
                    v59.finish(v59.Events.MessageSendToPendingRender, v185);
                    return;
                else
                    v59.finish(v59.Events.MessageSendResponseToFinalRender, v185);
                    v59.finish(v59.Events.MessageSendToFinalRender, v185);
                    return;
                end;
            end;
        end, {
            v111, 
            v100, 
            v88.conversationId
        });
    end;
    l_useEffect_0(function() --[[ Line: 704 ]]
        -- upvalues: v88 (copy), v6 (ref), v58 (ref), v173 (copy), v59 (ref)
        local v189 = v88.navigation and v88.navigation.addListener and v88.navigation.addListener(v6.Events.WillBlur, function(v187) --[[ Line: 707 ]]
            -- upvalues: v58 (ref), v173 (ref), v59 (ref), v88 (ref)
            if v58 then
                local v188 = v187 and v187.action and v187.action.params and v187.action.params.isOverlay or false;
                v173(v188);
                if v188 then
                    return;
                elseif v59.isActive(v59.Events.ChatConversationTTI, {
                    conversationId = v88.conversationId
                }) then
                    v59.cancel(v59.Events.ChatConversationTTI, {
                        conversationId = v88.conversationId
                    });
                    return;
                end;
            elseif v187 and v187.action and v187.action.params and v187.action.params.isOverlay then
                v173(true);
                return;
            else
                v173(false);
            end;
        end);
        local v191 = v88.navigation and v88.navigation.addListener and v88.navigation.addListener(v6.Events.WillFocus, function(_) --[[ Line: 738 ]]
            -- upvalues: v173 (ref)
            v173(true);
        end);
        return function() --[[ Line: 742 ]]
            -- upvalues: v189 (copy), v191 (copy)
            if v189 then
                v189.remove();
            end;
            if v191 then
                v191.remove();
            end;
        end;
    end, {
        v88.navigation, 
        v88.conversationId
    });
    l_useEffect_0(function() --[[ Line: 753 ]]
        -- upvalues: v112 (copy), v127 (copy), v50 (ref), v51 (ref), v88 (copy), v71 (ref), v123 (copy)
        if v112.shouldShowOsaCardOnInitialLoad then
            v127(v50(v51, v88.conversationId, v71)):catch(function() --[[ Line: 757 ]]
                -- upvalues: v88 (ref), v123 (ref)
                v88.navigateToToast({
                    toastProps = {
                        toastContent = {
                            toastTitle = v123.networkErrorText
                        }
                    }
                });
            end);
        end;
    end, {
        v112.shouldShowOsaCardOnInitialLoad
    });
    local v192 = not l_FFlagIsSquadEnabledAMP_0 or v88.getCanAccessParty;
    if v58 then
        if not v174 then
            return nil;
        elseif v130 then
            return v4.createElement(v9, {
                conversationId = v88.conversationId, 
                topBarHeight = v88.topBarHeight, 
                networkErrorText = v123.networkErrorText, 
                navigateToToast = v88.navigateToToast, 
                wideMode = v88.wideMode, 
                onConversationUnmount = v160, 
                navigateBack = v88.navigateBack
            });
        else
            return v4.createElement(v8, v5.Dictionary.join(v88, v92, v123, {
                moreMenuEnabled = if l_FFlagIsSquadEnabledAMP_0 then v192 else nil, 
                conversation = v93, 
                conversationTitle = v98, 
                itemList = v114, 
                localUserId = v100, 
                openGameDetailsPage = v88.openGameDetailsPage, 
                openViewProfile = v169, 
                readingMessagesIsEnabled = v88.getReadingMessagesIsEnabled(), 
                Users = v108, 
                usersTyping = v109, 
                displayNamesAvailable = v117, 
                onConversationUnmount = v160, 
                recipientIdsSerialized = v94, 
                chatIsVisible = v101, 
                chatInputPlaceholder = v170, 
                replyingToMessage = v119, 
                replyingToMessageDispatch = v120, 
                shouldShowChatInputBar = v162, 
                shouldShowLegacyBottomModal = v163, 
                shouldDisableChatInputBar = v149, 
                onChatInputBarReady = if v58 then v176 else nil, 
                inputBarDisabledEndTimestampDisplay = v150, 
                onDisabledInputBarActivated = v171, 
                scrollToTopOnInitialOsaLoad = v112.shouldShowOsaCardOnInitialLoad and v112.fetchedOldestMessage, 
                navigateToSquadLobby = if v192 then v88.navigateToSquadLobby else nil, 
                shouldHideMoreMenuButton = if v192 then not v162 else nil
            }));
        end;
    elseif not v172 then
        return nil;
    elseif v62 and v88.isFocused and not v88.isFocused() then
        return nil;
    elseif v130 then
        return v4.createElement(v9, {
            conversationId = v88.conversationId, 
            topBarHeight = v88.topBarHeight, 
            networkErrorText = v123.networkErrorText, 
            navigateToToast = v88.navigateToToast, 
            wideMode = v88.wideMode, 
            onConversationUnmount = v160, 
            navigateBack = v88.navigateBack, 
            style = v88.style
        });
    else
        return v4.createElement(v8, v5.Dictionary.join(v88, v92, v123, {
            moreMenuEnabled = if l_FFlagIsSquadEnabledAMP_0 then v192 else nil, 
            conversation = v93, 
            conversationTitle = v98, 
            itemList = v114, 
            localUserId = v100, 
            openGameDetailsPage = v88.openGameDetailsPage, 
            openViewProfile = v169, 
            readingMessagesIsEnabled = v88.getReadingMessagesIsEnabled(), 
            Users = v108, 
            usersTyping = v109, 
            displayNamesAvailable = v117, 
            onConversationUnmount = v160, 
            recipientIdsSerialized = v94, 
            chatIsVisible = v101, 
            chatInputPlaceholder = v170, 
            replyingToMessage = v119, 
            replyingToMessageDispatch = v120, 
            shouldShowChatInputBar = v162, 
            shouldShowLegacyBottomModal = v163, 
            shouldDisableChatInputBar = v149, 
            onChatInputBarReady = if v58 then v176 else nil, 
            inputBarDisabledEndTimestampDisplay = v150, 
            onDisabledInputBarActivated = v171, 
            scrollToTopOnInitialOsaLoad = v112.shouldShowOsaCardOnInitialLoad and v112.fetchedOldestMessage, 
            navigateToSquadLobby = if v192 then v88.navigateToSquadLobby else nil, 
            shouldHideMoreMenuButton = if v192 then not v162 else nil
        }));
    end;
end;
return l_UniversalAppPolicy_0.connect(function(v193) --[[ Line: 871 ]]
    return {
        viewProfileOnAvatarPressed = v193.getChatTapConversationThumbnail(), 
        getCanAccessParty = v193.getCanAccessParty()
    };
end)(ChatConversationContainer);