local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local v8 = require(l_Parent_0.ReactFocusNavigation);
local l_CoreGui_0 = v8.EngineInterface.CoreGui;
local l_FocusNavigationService_0 = v8.FocusNavigationService;
local v11 = require(l_Parent_0.FocusBehaviors);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_IXPService_0 = game:GetService("IXPService");
local v14 = require(l_Parent_0.RoactNavigation);
local v15 = require(script.Parent.MessageList);
local v16 = require(script.Parent.ReplyComposeBarContainer);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatNewChatInputBar);
local v18 = if v17 then require(script.Parent.ChatInputBar) else require(script.Parent.ChatInputBarDeprecated);
local v19 = require(script.Parent.UserTypingIndicator);
local v20 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v21 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.withChatPagePadding);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local l_LocalStorageKey_0 = require(l_Parent_0.LocalStorage).Enums.LocalStorageKey;
local v26 = require(script.Parent.ChatConversationMoreMenu);
local v27 = require(script.Parent.KeyboardOffsetEventHandler);
local v28 = require(script.Parent.Utils.GlobalLongPressSignal);
local _ = require(script.Parent.MessageInteraction.ReplyingContext.ReplyingToMessageContext);
local v30 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatReplyComposeBarContainer);
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v34 = require(l_script_FirstAncestor_0.Analytics.Enums.ConversationExitType);
local v35 = require(l_script_FirstAncestor_0.Analytics.Enums.SendMessageError);
local v36 = require(l_script_FirstAncestor_0.LegacyAnalytics.withRoactChatAnalytics);
local v37 = require(l_script_FirstAncestor_0.Telemetry.connectTelemetry);
local v38 = require(script.Parent.ChatConversationTelemetryEvents);
local v39 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local v40 = game:DefineFastFlag("AppChatNewChatInputBarIxpEnabled", false);
local v41 = game:DefineFastString("AppChatNewChatInputBarIxpLayer", "");
local l_FFlagAppChatEnableDoubleOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableDoubleOptIn;
local v43 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseSwipeForReplies);
local v44 = game:DefineFastFlag("AppChatFocusInputBarFix", false);
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local v46 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatPerfTracking);
local v47 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local l_game_EngineFeature_0 = game:GetEngineFeature("ScheduledSquadTooltipSeen");
local l_FFlagEnableScheduledSquads_0 = require(l_Parent_0.SharedFlags).FFlagEnableScheduledSquads;
local l_ScheduledPartiesExperimentation_0 = require(l_Parent_0.SocialExperiments).ScheduledPartiesExperimentation;
local v51 = if l_FFlagAppChatEnableDoubleOptIn_0 then require(script.Parent.ConversationTopModalContainer) else require(script.Parent.ConversationTopModalContainerDeprecated);
local v52 = require(script.Parent.ConversationModal.ConversationBottomModalContainer);
local v53 = v5.PureComponent:extend("ChatConversation");
v53.defaultProps = {
    topBarHeight = 0, 
    conversationId = nil, 
    conversationTitle = nil, 
    itemList = {}, 
    inputBoxRef = nil, 
    wideMode = false, 
    getOlderMessages = function() --[[ Line: 79 ]] --[[ Name: getOlderMessages ]]

    end, 
    isDebugEnabled = false, 
    sendMessage = function() --[[ Line: 81 ]] --[[ Name: sendMessage ]]

    end, 
    navigateToToast = function() --[[ Line: 82 ]] --[[ Name: navigateToToast ]]

    end, 
    markConversationAsRead = function() --[[ Line: 83 ]] --[[ Name: markConversationAsRead ]]

    end, 
    postTypingStatus = function() --[[ Line: 84 ]] --[[ Name: postTypingStatus ]]

    end, 
    navigateBack = function() --[[ Line: 85 ]] --[[ Name: navigateBack ]]

    end, 
    openViewProfile = function() --[[ Line: 86 ]] --[[ Name: openViewProfile ]]

    end, 
    updateConversationTitle = function() --[[ Line: 87 ]] --[[ Name: updateConversationTitle ]]

    end, 
    openGameDetailsPage = function() --[[ Line: 88 ]] --[[ Name: openGameDetailsPage ]]

    end, 
    navigateToScreen = function() --[[ Line: 89 ]] --[[ Name: navigateToScreen ]]

    end, 
    navigateToSquadLobby = function() --[[ Line: 90 ]] --[[ Name: navigateToSquadLobby ]]

    end, 
    onChatInputBarReady = function() --[[ Line: 91 ]] --[[ Name: onChatInputBarReady ]]

    end, 
    viewProfileOnAvatarPressed = true, 
    chatInputPlaceholder = "Say something", 
    usersTyping = {}, 
    invalidMessageTypeText = "PLACEHOLDER This message could not be displayed", 
    messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.", 
    messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.", 
    newText = l_ScheduledPartiesExperimentation_0.getScheduledPartiesTooltipEnabled() and "New" or "", 
    schedulePartyText = l_ScheduledPartiesExperimentation_0.getScheduledPartiesTooltipEnabled() and "Schedule Party" or "", 
    networkErrorText = "PLACEHOLDER There was a network error, please try again later", 
    unknownUserText = "PLACEHOLDER unknown user", 
    oneUserTyping = "PLACEHOLDER {DISPLAY_NAME} is typing...", 
    twoUsersTyping = "PLACEHOLDER {DISPLAY_NAME_1} and {DISPLAY_NAME_2} are typing...", 
    severalUsersTyping = "PLACEHOLDER Several users are typing...", 
    bottomModalText = "PLACEHOLDER At this time, Chat is not available with this user.", 
    readingMessagesIsEnabled = true, 
    onConversationUnmount = function() --[[ Line: 109 ]] --[[ Name: onConversationUnmount ]]

    end, 
    chatIsVisible = true, 
    moreMenuEnabled = not l_FFlagIsSquadEnabledAMP_0 and nil, 
    keyboardOffset = nil, 
    replyingToMessage = nil, 
    replyingToMessageDispatch = function(_) --[[ Line: 115 ]] --[[ Name: replyingToMessageDispatch ]]

    end, 
    shouldShowChatInputBar = true, 
    shouldDisableChatInputBar = false, 
    shouldShowLegacyBottomModal = false, 
    telemetry = {
        emit = function() --[[ Line: 120 ]] --[[ Name: emit ]]

        end
    }, 
    scrollToTopOnInitialOsaLoad = false, 
    displayNamesAvailable = true, 
    shouldHideMoreMenuButton = false
};
v53.init = function(v55) --[[ Line: 127 ]] --[[ Name: init ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_FFlagEnableScheduledSquads_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_ScheduledPartiesExperimentation_0 (copy), v5 (copy), l_UserInputService_0 (copy), l_memoize_0 (copy), v20 (copy), v46 (copy), v47 (copy), v30 (copy), l_StatusCodes_0 (copy), v35 (copy), v38 (copy), l_DateTime_0 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), v31 (copy), v34 (copy), v43 (copy), v28 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_FocusNavigationService_0 (copy), l_CoreGui_0 (copy)
    local v56 = nil;
    if l_game_EngineFeature_0 and l_FFlagEnableScheduledSquads_0 and not v55.props.shouldHideMoreMenuButton then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 131 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.ScheduledSquadTooltipSeen);
        end);
        if l_status_0 and l_result_0 == "false" then
            if l_ScheduledPartiesExperimentation_0.getScheduledPartiesTooltipEnabled() then
                v56 = ("%*: %*"):format(v55.props.newText, v55.props.schedulePartyText);
            end;
            l_AppStorageService_0:SetItem(l_LocalStorageKey_0.ScheduledSquadTooltipSeen, "true");
            l_AppStorageService_0:Flush();
            l_ScheduledPartiesExperimentation_0.logExposure();
        end;
    end;
    v55.state = {
        inputBarHeight = 0, 
        keyboardOffset = 0, 
        replyComposeBarHeight = 0, 
        conversationBannerHeight = 0, 
        messageListHeight = 0, 
        bottomModalHeight = 0, 
        tooltipText = if l_FFlagEnableScheduledSquads_0 then v56 else nil
    };
    v55.inputBoxRef = v55.props.inputBoxRef or v5.createRef();
    v55.inputBarRef = v5.createRef();
    v55.conversationViewRef = v5.createRef();
    v55.messageListRef = v5.createRef();
    v55.getKeyboardOffset = function() --[[ Line: 162 ]]
        -- upvalues: l_UserInputService_0 (ref), v55 (copy)
        if l_UserInputService_0.OnScreenKeyboardVisible and v55.inputBoxRef:getValue() and v55.inputBoxRef:getValue():IsFocused() then
            if v55.props.keyboardOffset ~= nil then
                return v55.props.keyboardOffset;
            else
                local v59 = v55.conversationViewRef:getValue();
                if v59 then
                    return v59.AbsolutePosition.Y + v59.AbsoluteSize.Y - l_UserInputService_0.OnScreenKeyboardPosition.Y;
                end;
            end;
        end;
        return 0;
    end;
    v55.updateKeyboardOffset = function() --[[ Line: 185 ]]
        -- upvalues: v55 (copy)
        if not v55.isMounted then
            return;
        else
            local v60 = v55.getKeyboardOffset();
            if v55.state.keyboardOffset ~= v60 then
                v55:setState({
                    keyboardOffset = v60
                });
            end;
            return;
        end;
    end;
    v55.onKeyboardOffsetChanged = function(v61) --[[ Line: 197 ]]
        -- upvalues: v55 (copy)
        if not v55.isMounted then
            return;
        else
            if not v55.inputBoxRef:getValue() or not v55.inputBoxRef:getValue():IsFocused() then
                v61 = 0;
            end;
            if v55.state.keyboardOffset ~= v61 then
                v55:setState({
                    keyboardOffset = v61
                });
            end;
            return;
        end;
    end;
    v55.clearKeyboardOffset = function() --[[ Line: 214 ]]
        -- upvalues: v55 (copy)
        v55:setState({
            keyboardOffset = 0
        });
    end;
    v55.loadNext = l_memoize_0(function(v62, v63) --[[ Line: 220 ]]
        -- upvalues: v55 (copy)
        return function() --[[ Line: 221 ]]
            -- upvalues: v62 (copy), v63 (copy), v55 (ref)
            local v64 = v62(v63);
            if v64 then
                v64:catch(function() --[[ Line: 224 ]]
                    -- upvalues: v55 (ref)
                    v55.showNetworkErrorToast();
                end);
            end;
        end;
    end);
    v55.markAsRead = l_memoize_0(function(v65, v66) --[[ Line: 231 ]]
        -- upvalues: v55 (copy)
        return function() --[[ Line: 232 ]]
            -- upvalues: v55 (ref), v65 (copy), v66 (copy)
            if v55.props.readingMessagesIsEnabled then
                v65(v66);
            end;
        end;
    end);
    v55.showNetworkErrorToast = function() --[[ Line: 239 ]]
        -- upvalues: v55 (copy)
        v55.props.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v55.props.networkErrorText
                }
            }
        });
    end;
    v55.onSendChat = l_memoize_0(function(v67, v68, v69, v70, v71, v72, v73, v74) --[[ Line: 250 ]]
        -- upvalues: v20 (ref), v46 (ref), v47 (ref), v30 (ref), v55 (copy), l_StatusCodes_0 (ref), v35 (ref), v38 (ref), l_DateTime_0 (ref)
        return function(v75) --[[ Line: 260 ]]
            -- upvalues: v71 (copy), v20 (ref), v68 (ref), v72 (copy), v70 (copy), v73 (copy), v46 (ref), v47 (ref), v67 (copy), v30 (ref), v55 (ref), l_StatusCodes_0 (ref), v69 (copy), v35 (ref), v74 (copy), v38 (ref), l_DateTime_0 (ref)
            if v71 and v71.source == "friends" then
                v20:info("Creating a conversation for friend conversation {} via onSendChat", v68);
                local v76, v77 = v72(v68, v70):await();
                if v76 and v77 then
                    v20:debug("Created conversation {} for friend conversation {} via onSendChat", v77.id, v68);
                    v68 = v77.id;
                    v73(v77.id);
                else
                    v20:error("Could not create conversation. Error: {}", (tostring(v77)));
                    return;
                end;
            end;
            v20:info("Sending message '{}' to conversationId {} via onSendChat", v75, v68);
            if v46 then
                v47.start(v47.Events.MessageSendToPendingRender, {
                    conversationId = tostring(v68)
                });
                v47.start(v47.Events.MessageSendToFinalRender, {
                    conversationId = tostring(v68)
                });
            end;
            local v78 = v67(v68, v75, if v30() then v55.props.replyingToMessage else nil);
            if v78 then
                v78:andThen(function(v79) --[[ Line: 297 ]]
                    -- upvalues: l_StatusCodes_0 (ref), v55 (ref), v69 (ref), v68 (ref)
                    if v79 and v79.StatusCode == l_StatusCodes_0.CONFLICT then
                        v55.showNetworkErrorToast();
                        return;
                    else
                        if v69 then
                            v69(v68);
                        end;
                        return;
                    end;
                end);
            elseif v69 then
                v69(v68);
            end;
            if v30() then
                v55.closeReplying();
            end;
            local v80 = {
                messageSentResult = v35.OtherFailure, 
                recipientIds = v55.props.recipientIdsSerialized
            };
            if not v78 then
                v74.emit(v38.ConversationMessageSent, v80);
                return;
            else
                v78:andThen(function(v81) --[[ Line: 323 ]]
                    -- upvalues: v35 (ref), l_StatusCodes_0 (ref), v30 (ref), l_DateTime_0 (ref), v74 (ref), v38 (ref), v55 (ref)
                    local v82 = nil;
                    local v83 = nil;
                    local v84 = nil;
                    local v85 = nil;
                    local v86 = nil;
                    local v87 = nil;
                    local v88 = v81 and v81.StatusCode;
                    if not v81 then
                        v82 = v35.NoResponse;
                    elseif v88 == l_StatusCodes_0.CONFLICT then
                        v82 = v35.Conflict;
                    elseif not v81.responseBody then
                        v82 = v35.NoResponseBody;
                    elseif not v81.responseBody.messages or #v81.responseBody.messages == 0 then
                        v82 = v35.NoMessages;
                    elseif not v81.responseBody.messages[1].status then
                        v82 = v35.NoMessageStatus;
                    else
                        v82 = v81.responseBody.messages[1].status;
                        v83 = v81.responseBody.messages[1].id;
                        if v30() and v81.responseBody.messages[1].replies_to then
                            local l_replies_to_0 = v81.responseBody.messages[1].replies_to;
                            v84 = l_replies_to_0.id;
                            v85 = l_replies_to_0.sender_user_id;
                            v86 = tostring(l_DateTime_0.fromIsoDate(l_replies_to_0.created_at).dateTime);
                            v87 = if l_replies_to_0.content then #l_replies_to_0.content else nil;
                        end;
                    end;
                    v74.emit(v38.ConversationMessageSent, {
                        messageSentResult = v82, 
                        messageId = v83, 
                        recipientIds = v55.props.recipientIdsSerialized, 
                        targetMessageId = v84, 
                        targetMessageSenderId = v85, 
                        targetMessageSentAt = v86, 
                        targetMessageLength = v87
                    });
                end):catch(function() --[[ Line: 373 ]]
                    -- upvalues: v74 (ref), v38 (ref), v80 (copy)
                    v74.emit(v38.ConversationMessageSent, v80);
                end);
                return;
            end;
        end;
    end);
    v55.onSendBtnClicked = l_memoize_0(function(v90) --[[ Line: 380 ]]
        -- upvalues: v38 (ref)
        return function(v91) --[[ Line: 383 ]]
            -- upvalues: v90 (copy), v38 (ref)
            v90.emit(v38.ConversationSendBtnClicked, {
                sendBtnClickResult = v91
            });
        end;
    end);
    v55.isMoreMenuEnabled = function() --[[ Line: 390 ]]
        -- upvalues: l_FFlagIsSquadEnabledAMP_0 (ref), v55 (copy)
        return l_FFlagIsSquadEnabledAMP_0 and v55.props.moreMenuEnabled or not l_FFlagIsSquadEnabledAMP_0;
    end;
    v55.reportInputBarReady = v46 and function(v92) --[[ Line: 395 ]]
        -- upvalues: v55 (copy)
        if v55.props.onChatInputBarReady and v55.props.shouldShowChatInputBar and v92 > 0 then
            v55.props.onChatInputBarReady();
        end;
    end or nil;
    if v55.isMoreMenuEnabled() or v31 then
        v55.onHeightChanged = function(v93) --[[ Line: 403 ]]
            -- upvalues: v46 (ref), v55 (copy)
            if v46 then
                v55.reportInputBarReady(v93.AbsoluteSize.Y);
            end;
            v55:setState(function(v94, _) --[[ Line: 408 ]]
                -- upvalues: v93 (copy)
                if v93.AbsoluteSize.Y ~= v94.inputBarHeight then
                    return {
                        inputBarHeight = v93.AbsoluteSize.Y
                    };
                else
                    return {};
                end;
            end);
        end;
    else
        v55.onHeightChanged = function(v96) --[[ Line: 417 ]]
            -- upvalues: v46 (ref), v55 (copy)
            if v46 then
                v55.reportInputBarReady(v96);
            end;
            v55:setState(function(v97, _) --[[ Line: 422 ]]
                -- upvalues: v96 (copy)
                if v96 ~= v97.inputBarHeight then
                    return {
                        inputBarHeight = v96
                    };
                else
                    return {};
                end;
            end);
        end;
    end;
    v55.lastTypingRequest = 0;
    v55.chatInputTextChanged = function() --[[ Line: 433 ]]
        -- upvalues: v55 (copy)
        if v55.props.conversation and v55.props.conversation.source == "friends" then
            return;
        else
            local v99 = tick();
            if v99 - v55.lastTypingRequest >= 3 then
                v55.lastTypingRequest = v99;
                v55.props.postTypingStatus(v55.props.conversationId, true);
            end;
            return;
        end;
    end;
    v55.exitTypeForAnalytics = v34.Default;
    if not v43 then
        v55.onTouchSwipe = function(_, v101, v102) --[[ Line: 449 ]]
            -- upvalues: v55 (copy), v34 (ref)
            if not v55.props.wideMode and v101 == Enum.SwipeDirection.Right and v102 == 1 then
                v55.exitTypeForAnalytics = v34.SwipedRight;
                v55.props.navigateBack();
            end;
        end;
    end;
    v55.fireAnalyticsEventOnUnmount = function() --[[ Line: 457 ]]
        -- upvalues: v55 (copy), v34 (ref)
        v55.props.onConversationUnmount(v55.exitTypeForAnalytics);
        v55.exitTypeForAnalytics = v34.Default;
    end;
    v55.closeKeyboard = function() --[[ Line: 464 ]]
        -- upvalues: v55 (copy)
        if v55.inputBoxRef:getValue() then
            v55.inputBoxRef:getValue():ReleaseFocus();
        end;
    end;
    if v30() then
        v55.closeReplying = function() --[[ Line: 471 ]]
            -- upvalues: v55 (copy)
            v55.props.replyingToMessageDispatch(nil);
        end;
        v55.onPointerInput = function() --[[ Line: 474 ]]
            -- upvalues: v28 (ref), v55 (copy)
            v28.dismiss();
            v55.closeKeyboard();
        end;
    end;
    v55.onSizeChange = function() --[[ Line: 480 ]]
        -- upvalues: v55 (copy)
        v55.updateKeyboardOffset();
    end;
    v55.calculateScrollOffset = function(v103) --[[ Line: 484 ]]
        local l_Y_0 = v103.CanvasPosition.Y;
        local l_Y_1 = v103.AbsoluteCanvasSize.Y;
        local l_Y_2 = v103.AbsoluteWindowSize.Y;
        return l_Y_1 - l_Y_0 - l_Y_2;
    end;
    v55.setBannerHeight = function(v107) --[[ Line: 491 ]]
        -- upvalues: v55 (copy)
        v55:setState({
            conversationBannerHeight = v107
        });
    end;
    v55.setBottomModalHeight = function(v108) --[[ Line: 497 ]]
        -- upvalues: v55 (copy)
        v55:setState({
            bottomModalHeight = v108
        });
    end;
    if not v31 and v30() then
        v55.setReplyComposeBarHeight = function(v109) --[[ Line: 504 ]]
            -- upvalues: v55 (copy)
            v55:setState({
                replyComposeBarHeight = v109
            });
        end;
    end;
    v55.onMessageListSizeChange = function(v110) --[[ Line: 511 ]]
        -- upvalues: v55 (copy)
        v55:setState({
            messageListHeight = v110.AbsoluteSize.Y
        });
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v55.focusNavigationService = l_FocusNavigationService_0.new(l_CoreGui_0);
    end;
end;
v53.didMount = function(v111) --[[ Line: 522 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy), v11 (copy), v40 (copy), l_IXPService_0 (copy), v41 (copy)
    v111.isMounted = true;
    v111.markAsRead(v111.props.markConversationAsRead, v111.props.conversationId)();
    if l_FFlagEnableAppChatFocusableFixes_0 then
        local v112 = v111.conversationViewRef:getValue();
        local v113 = v111.inputBarRef:getValue();
        v111.focusNavigationService:registerFocusBehavior(v112, v11.mostRecentOrDefault(v113));
        if not v111.props.wideMode and v111.focusNavigationService.focusedGuiObject:getValue() ~= nil then
            v111.focusNavigationService:focusGuiObject(v113);
        end;
    end;
    if v40 and v111.props.shouldShowChatInputBar then
        l_IXPService_0:LogFlagLinkedUserLayerExposure(v41);
    end;
end;
v53.willUpdate = function(v114, v115, _) --[[ Line: 543 ]] --[[ Name: willUpdate ]]
    if v115.chatIsVisible ~= v114.props.chatIsVisible and not v115.chatIsVisible then
        v114.closeKeyboard();
    end;
end;
v53.didUpdate = function(v117, v118, v119) --[[ Line: 549 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy), v17 (copy), v44 (copy), v46 (copy), v30 (copy)
    if l_FFlagEnableAppChatFocusableFixes_0 and v117.props.wideMode and v117.props.navigation.getParam("navigatedWithFocus") then
        local v120 = if not not v17 or v44 then v117.inputBarRef:getValue() else v117.inputBoxRef:getValue();
        v117.props.navigation.setParams({
            navigatedWithFocus = false
        });
        v117.focusNavigationService:focusGuiObject(v120);
    end;
    if v118.conversationId ~= v117.props.conversationId then
        if v46 then
            v117.reportInputBarReady(v117.state.inputBarHeight);
        end;
        if v117.inputBoxRef:getValue() then
            v117.inputBoxRef:getValue().Text = "";
            v117.inputBoxRef:getValue():ReleaseFocus();
        end;
        if v30() then
            v117.closeReplying();
        end;
        v117.markAsRead(v117.props.markConversationAsRead, v117.props.conversationId, false)();
    end;
    if v46 and v118.shouldShowChatInputBar ~= v117.props.shouldShowChatInputBar then
        v117.reportInputBarReady(v117.state.inputBarHeight);
    end;
    local v121 = v117.messageListRef and v117.messageListRef.current and v117.messageListRef.current._listRef;
    local v122 = v121 and v121._scrollRef and v121._scrollRef.getNativeScrollRef();
    local v123 = v117.state.messageListHeight - v119.messageListHeight;
    if v121 and v122 and v119.messageListHeight ~= 0 and v123 ~= 0 then
        local v124 = v117.calculateScrollOffset(v122._nativeRef.current);
        if v124 <= 0 then
            return;
        else
            v121:scrollToOffset({
                offset = v124 + v123
            });
        end;
    end;
end;
v53.willUnmount = function(v125) --[[ Line: 615 ]] --[[ Name: willUnmount ]]
    -- upvalues: v30 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    v125.fireAnalyticsEventOnUnmount();
    if v30() then
        v125.closeReplying();
    end;
    v125.keyboardConnections = {};
    v125.isMounted = false;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v125.focusNavigationService:teardown();
    end;
end;
v53.render = function(v126) --[[ Line: 627 ]] --[[ Name: render ]]
    -- upvalues: v36 (copy), l_withStyle_0 (copy), v21 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), v5 (copy), v43 (copy), v30 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v27 (copy), v51 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), v31 (copy), v15 (copy), v19 (copy), v4 (copy), v3 (copy), v16 (copy), v26 (copy), l_FFlagEnableScheduledSquads_0 (copy), v18 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), v52 (copy)
    local v127 = false;
    if #v126.props.usersTyping > 0 then
        v127 = v126.props.displayNamesAvailable;
    end;
    local v128 = if v126.props.conversation then v126.props.conversation.source == "friends" else false;
    local v129 = "MessageList" .. tostring(v126.props.conversationId);
    return v36(function(v130) --[[ Line: 638 ]]
        -- upvalues: l_withStyle_0 (ref), v21 (ref), v126 (copy), l_getFFlagAppChatEnableIntervention_0 (ref), v5 (ref), v43 (ref), v30 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), v27 (ref), v51 (ref), l_FFlagAppChatEnableDoubleOptIn_0 (ref), v31 (ref), v129 (copy), v15 (ref), v128 (copy), v127 (copy), v19 (ref), v4 (ref), v3 (ref), v16 (ref), v26 (ref), l_FFlagEnableScheduledSquads_0 (ref), v18 (ref), l_FFlagIsSquadEnabledAMP_0 (ref), v52 (ref)
        return l_withStyle_0(function(v131) --[[ Line: 639 ]]
            -- upvalues: v21 (ref), v126 (ref), l_getFFlagAppChatEnableIntervention_0 (ref), v5 (ref), v43 (ref), v30 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), v27 (ref), v51 (ref), l_FFlagAppChatEnableDoubleOptIn_0 (ref), v31 (ref), v129 (ref), v15 (ref), v128 (ref), v127 (ref), v19 (ref), v4 (ref), v3 (ref), v16 (ref), v26 (ref), l_FFlagEnableScheduledSquads_0 (ref), v18 (ref), v130 (copy), l_FFlagIsSquadEnabledAMP_0 (ref), v52 (ref)
            return v21(function(v132) --[[ Line: 640 ]]
                -- upvalues: v126 (ref), l_getFFlagAppChatEnableIntervention_0 (ref), v5 (ref), v131 (copy), v43 (ref), v30 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), v27 (ref), v51 (ref), l_FFlagAppChatEnableDoubleOptIn_0 (ref), v31 (ref), v129 (ref), v15 (ref), v128 (ref), v127 (ref), v19 (ref), v4 (ref), v3 (ref), v16 (ref), v26 (ref), l_FFlagEnableScheduledSquads_0 (ref), v18 (ref), v130 (ref), l_FFlagIsSquadEnabledAMP_0 (ref), v52 (ref)
                local v133 = nil;
                if v126.isMoreMenuEnabled() then
                    v133 = UDim.new(0, (math.max(v132.right - 6, 0)));
                    if l_getFFlagAppChatEnableIntervention_0() and v126.props.shouldDisableChatInputBar then
                        v133 = UDim.new(0, v132.right);
                    end;
                end;
                return v5.createElement("TextButton", {
                    AutoButtonColor = false, 
                    BackgroundColor3 = v131.Theme.BackgroundDefault.Color, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = "", 
                    Transparency = v131.Tokens.Global.Color.None.Transparency, 
                    [v5.Event.TouchSwipe] = if not v43 then v126.onTouchSwipe else nil, 
                    [v5.Event.TouchTap] = if v30() then v126.onPointerInput else v126.closeKeyboard, 
                    [v5.Event.MouseButton1Down] = if v30() then v126.onPointerInput else v126.closeKeyboard, 
                    [v5.Ref] = v126.conversationViewRef, 
                    Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil
                }, {
                    KeyboardOffsetEventHandler = v5.createElement(v27, {
                        onKeyboardOffsetChanged = v126.onKeyboardOffsetChanged, 
                        parentViewRef = v126.conversationViewRef
                    }), 
                    Layout = v5.createElement("UIListLayout", {
                        HorizontalAlignment = if v126.isMoreMenuEnabled() then nil else Enum.HorizontalAlignment.Right, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    ConversationTopModal = v5.createElement(v51, {
                        conversationId = if l_FFlagAppChatEnableDoubleOptIn_0 then v126.props.conversationId else nil, 
                        conversation = if l_FFlagAppChatEnableDoubleOptIn_0 then nil else v126.props.conversation, 
                        navigateToScreen = if l_FFlagAppChatEnableDoubleOptIn_0 then nil else v126.props.navigateToScreen, 
                        setModalHeight = v126.setBannerHeight, 
                        layoutOrder = 1
                    }), 
                    MessageListFrame = v5.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 2, 
                        [v5.Change.AbsoluteSize] = v126.onMessageListSizeChange, 
                        Size = UDim2.new(1, 0, 1, -v126.state.inputBarHeight - v126.state.keyboardOffset - (if not v31 and v30() then v126.state.replyComposeBarHeight else 0) - v126.state.conversationBannerHeight - v126.state.bottomModalHeight)
                    }, {
                        [v129] = v5.createElement(v15, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            bottomMargin = 28, 
                            conversationId = v126.props.conversationId, 
                            isDebugEnabled = v126.props.isDebugEnabled, 
                            itemList = v126.props.itemList, 
                            loadNext = if v128 then nil else v126.loadNext(v126.props.getOlderMessages, v126.props.conversationId), 
                            localUserId = v126.props.localUserId, 
                            markAsRead = v126.markAsRead(v126.props.markConversationAsRead, v126.props.conversationId), 
                            messageListRef = v126.messageListRef, 
                            openViewProfile = v126.props.openViewProfile, 
                            onDetailsOpened = v126.closeKeyboard, 
                            closeKeyboard = if v30() then v126.closeKeyboard else nil, 
                            inputBoxRef = if v30() then v126.inputBoxRef else nil, 
                            wideMode = v126.props.wideMode, 
                            viewProfileOnAvatarPressed = v126.props.viewProfileOnAvatarPressed, 
                            readingMessagesIsEnabled = v126.props.readingMessagesIsEnabled, 
                            invalidMessageTypeText = v126.props.invalidMessageTypeText, 
                            messageDefaultNoticeText = v126.props.messageDefaultNoticeText, 
                            messageModeratedNoticeText = v126.props.messageModeratedNoticeText, 
                            messageHiddenNoticeText = v126.props.messageHiddenNoticeText, 
                            unknownUserText = v126.props.unknownUserText, 
                            openGameDetailsPage = v126.props.openGameDetailsPage, 
                            scrollToTopOnInitialOsaLoad = v126.props.scrollToTopOnInitialOsaLoad
                        }), 
                        UserTypingIndicator = v127 and v5.createElement(v19, {
                            AnchorPoint = Vector2.new(0, 1), 
                            Position = UDim2.new(0, 0, 1, 0), 
                            ZIndex = 2, 
                            height = 28, 
                            usersTyping = v126.props.usersTyping, 
                            oneUserTyping = v126.props.oneUserTyping, 
                            twoUsersTyping = v126.props.twoUsersTyping, 
                            severalUsersTyping = v126.props.severalUsersTyping
                        })
                    }), 
                    ReplyAndInputContainer = if v31 then v4.createElement(v3.View, {
                        LayoutOrder = 3, 
                        tag = {
                            ["col size-full-0 auto-y gap-medium padding-y-medium"] = true, 
                            ["bg-surface-100"] = v126.props.replyingToMessage
                        }, 
                        onAbsoluteSizeChanged = v126.onHeightChanged, 
                        padding = {
                            left = UDim.new(0, v132.left), 
                            right = v133
                        }
                    }, {
                        ReplyComposeBar = if v30() and v126.props.replyingToMessage then v5.createElement(v16, {
                            LayoutOrder = 1, 
                            message = v126.props.replyingToMessage, 
                            close = v126.closeReplying, 
                            inputBoxRef = v126.inputBoxRef
                        }) else nil, 
                        Divider = if not v126.isMoreMenuEnabled() or v126.props.shouldShowChatInputBar or v126.props.shouldHideMoreMenuButton then nil else v4.createElement(v3.View, {
                            LayoutOrder = 4, 
                            tag = "size-full-0 auto-y stroke-standard stroke-default"
                        }), 
                        ActionInputContainer = if v126.isMoreMenuEnabled() then v4.createElement(v3.View, {
                            LayoutOrder = 2, 
                            tag = "size-full-0 row gap-small auto-y align-y-center"
                        }, {
                            MoreMenu = if not v126.props.shouldHideMoreMenuButton then v5.createElement(v26, {
                                conversation = v126.props.conversation, 
                                conversationId = v126.props.conversationId, 
                                navigateToSquadLobby = v126.props.navigateToSquadLobby, 
                                layoutOrder = 1, 
                                showButtonText = not v126.props.shouldShowChatInputBar, 
                                tooltipText = if l_FFlagEnableScheduledSquads_0 then v126.state.tooltipText else ""
                            }) else nil, 
                            ChatInputBar = if v126.props.shouldShowChatInputBar then v5.createElement(v18, {
                                LayoutOrder = 2, 
                                onFocusLost = v126.clearKeyboardOffset, 
                                conversationId = v126.props.conversationId, 
                                inputBoxRef = v126.inputBoxRef, 
                                inputBarRef = if l_FFlagEnableAppChatFocusableFixes_0 then v126.inputBarRef else nil, 
                                localUserId = v126.props.localUserId, 
                                messageListRef = v126.messageListRef, 
                                onSendChat = v126.onSendChat(v126.props.sendMessage, v126.props.conversationId, v126.props.markConversationAsRead, v130, v126.props.conversation, v126.props.createFriendConversation, v126.props.navigateToChatConversation, v126.props.telemetry), 
                                onSendBtnClicked = v126.onSendBtnClicked(v126.props.telemetry), 
                                onTextChanged = v126.chatInputTextChanged, 
                                placeholderText = v126.props.chatInputPlaceholder, 
                                isDisabled = v126.props.shouldDisableChatInputBar, 
                                inputBarDisabledText = v126.props.inputBarDisabledText, 
                                disabledEndTimestampDisplay = v126.props.inputBarDisabledEndTimestampDisplay, 
                                onDisabledInputBarActivated = v126.props.onDisabledInputBarActivated, 
                                moreMenuEnabled = v126.isMoreMenuEnabled()
                            }) else nil
                        }) else nil, 
                        ChatInputBar = if not v126.isMoreMenuEnabled() and v126.props.shouldShowChatInputBar then v5.createElement(v18, {
                            LayoutOrder = 4, 
                            onFocusLost = v126.clearKeyboardOffset, 
                            conversationId = v126.props.conversationId, 
                            inputBoxRef = v126.inputBoxRef, 
                            inputBarRef = if l_FFlagEnableAppChatFocusableFixes_0 then v126.inputBarRef else nil, 
                            localUserId = v126.props.localUserId, 
                            messageListRef = v126.messageListRef, 
                            onSendChat = v126.onSendChat(v126.props.sendMessage, v126.props.conversationId, v126.props.markConversationAsRead, v130, v126.props.conversation, v126.props.createFriendConversation, v126.props.navigateToChatConversation, v126.props.telemetry), 
                            onSendBtnClicked = v126.onSendBtnClicked(v126.props.telemetry), 
                            onTextChanged = v126.chatInputTextChanged, 
                            placeholderText = v126.props.chatInputPlaceholder, 
                            isDisabled = v126.props.shouldDisableChatInputBar, 
                            inputBarDisabledText = v126.props.inputBarDisabledText, 
                            disabledEndTimestampDisplay = v126.props.inputBarDisabledEndTimestampDisplay, 
                            onDisabledInputBarActivated = v126.props.onDisabledInputBarActivated, 
                            moreMenuEnabled = v126.isMoreMenuEnabled()
                        }) else nil
                    }) else nil, 
                    ReplyComposeBar = if not v31 and v30() and v126.props.replyingToMessage then v5.createElement(v16, {
                        LayoutOrder = 3, 
                        message = v126.props.replyingToMessage, 
                        close = v126.closeReplying, 
                        setReplyComposeBarHeight = v126.setReplyComposeBarHeight, 
                        inputBoxRef = v126.inputBoxRef
                    }) else nil, 
                    Divider = if not (not v31 and v126.isMoreMenuEnabled()) or v126.props.shouldShowChatInputBar or v126.props.shouldHideMoreMenuButton then nil else v4.createElement(v3.View, {
                        LayoutOrder = 4, 
                        tag = "size-full-0 auto-y stroke-standard stroke-default"
                    }), 
                    ActionInputContainer = if not v31 and v126.isMoreMenuEnabled() then v4.createElement(v3.View, {
                        LayoutOrder = not v126.props.shouldShowChatInputBar and 4 or 5, 
                        tag = "size-full-0 row gap-small auto-y align-y-center padding-y-small", 
                        padding = {
                            left = UDim.new(0, v132.left), 
                            right = v133
                        }, 
                        onAbsoluteSizeChanged = v126.onHeightChanged
                    }, {
                        MoreMenu = if not v126.props.shouldHideMoreMenuButton then v5.createElement(v26, {
                            conversation = v126.props.conversation, 
                            conversationId = v126.props.conversationId, 
                            navigateToSquadLobby = v126.props.navigateToSquadLobby, 
                            layoutOrder = 1, 
                            showButtonText = not v126.props.shouldShowChatInputBar, 
                            tooltipText = if l_FFlagEnableScheduledSquads_0 then v126.state.tooltipText else ""
                        }) else nil, 
                        ChatInputBar = if v126.props.shouldShowChatInputBar then v5.createElement(v18, {
                            LayoutOrder = 2, 
                            onFocusLost = v126.clearKeyboardOffset, 
                            conversationId = v126.props.conversationId, 
                            inputBoxRef = v126.inputBoxRef, 
                            inputBarRef = if l_FFlagEnableAppChatFocusableFixes_0 then v126.inputBarRef else nil, 
                            localUserId = v126.props.localUserId, 
                            messageListRef = v126.messageListRef, 
                            onSendChat = v126.onSendChat(v126.props.sendMessage, v126.props.conversationId, v126.props.markConversationAsRead, v130, v126.props.conversation, v126.props.createFriendConversation, v126.props.navigateToChatConversation, v126.props.telemetry), 
                            onSendBtnClicked = v126.onSendBtnClicked(v126.props.telemetry), 
                            onTextChanged = v126.chatInputTextChanged, 
                            placeholderText = v126.props.chatInputPlaceholder, 
                            isDisabled = v126.props.shouldDisableChatInputBar, 
                            inputBarDisabledText = v126.props.inputBarDisabledText, 
                            disabledEndTimestampDisplay = v126.props.inputBarDisabledEndTimestampDisplay, 
                            onDisabledInputBarActivated = v126.props.onDisabledInputBarActivated, 
                            moreMenuEnabled = if l_FFlagIsSquadEnabledAMP_0 then v126.props.moreMenuEnabled else nil
                        }) else nil
                    }) else nil, 
                    ChatInputBar = if not (not not v31 or v126.isMoreMenuEnabled()) and v126.props.shouldShowChatInputBar then v5.createElement(v18, {
                        LayoutOrder = 4, 
                        onFocusLost = v126.clearKeyboardOffset, 
                        conversationId = v126.props.conversationId, 
                        inputBoxRef = v126.inputBoxRef, 
                        inputBarRef = if l_FFlagEnableAppChatFocusableFixes_0 then v126.inputBarRef else nil, 
                        localUserId = v126.props.localUserId, 
                        messageListRef = v126.messageListRef, 
                        onHeightChanged = if v126.isMoreMenuEnabled() then nil else v126.onHeightChanged, 
                        onSendChat = v126.onSendChat(v126.props.sendMessage, v126.props.conversationId, v126.props.markConversationAsRead, v130, v126.props.conversation, v126.props.createFriendConversation, v126.props.navigateToChatConversation, v126.props.telemetry), 
                        onSendBtnClicked = v126.onSendBtnClicked(v126.props.telemetry), 
                        onTextChanged = v126.chatInputTextChanged, 
                        placeholderText = v126.props.chatInputPlaceholder, 
                        isDisabled = v126.props.shouldDisableChatInputBar, 
                        inputBarDisabledText = v126.props.inputBarDisabledText, 
                        disabledEndTimestampDisplay = v126.props.inputBarDisabledEndTimestampDisplay, 
                        onDisabledInputBarActivated = v126.props.onDisabledInputBarActivated, 
                        moreMenuEnabled = if l_FFlagIsSquadEnabledAMP_0 then v126.props.moreMenuEnabled else nil
                    }) else nil, 
                    BottomModal = v4.createElement(v52, {
                        conversationId = v126.props.conversationId, 
                        layoutOrder = 5, 
                        onHeightChanged = v126.setBottomModalHeight, 
                        legacyBottomModalText = v126.props.bottomModalText, 
                        shouldShowLegacyBottomModal = v126.props.shouldShowLegacyBottomModal, 
                        shouldShowChatInputBar = v126.props.shouldShowChatInputBar
                    })
                });
            end);
        end);
    end);
end;
return v37(v39.Context)(if l_FFlagEnableAppChatFocusableFixes_0 then v14.withNavigation(v53) else v53);