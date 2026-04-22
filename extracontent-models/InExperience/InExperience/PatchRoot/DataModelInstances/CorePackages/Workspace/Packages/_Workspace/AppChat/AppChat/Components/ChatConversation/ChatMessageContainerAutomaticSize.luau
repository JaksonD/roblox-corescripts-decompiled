local l_IXPService_0 = game:GetService("IXPService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_setTimeout_0 = require(l_Parent_0.LuauPolyfill).setTimeout;
local v6 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v9 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v10 = require(l_script_FirstAncestor_0.Components.ChatConversation.MessageInteraction.Options);
local v11 = require(l_script_FirstAncestor_0.Components.ChatConversation.MessageInteraction.OptionsEnum);
local v12 = require(script.Parent.ChatMessageContainerConstants);
local v13 = require(l_script_FirstAncestor_0.EnumScreens);
local v14 = require(l_Parent_0.Cryo);
local v15 = require(l_Parent_0.Foundation);
local l_Skeleton_0 = v15.Skeleton;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v18 = require(l_script_FirstAncestor_0.Models.Conversation);
local _ = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v20 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.useChatPagePadding);
local v21 = require(script.Parent.Logger);
local v22 = require(script.Parent.NoticeText);
local v23 = require(script.Parent.SystemMessage);
local v24 = require(l_Parent_0.UserProfiles);
local v25 = require(l_script_FirstAncestor_0.Components.ChatConversation.ChatConversationTelemetryEvents);
local v26 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local v27 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.GlobalLongPressSignal);
local v28 = require(script.Parent.MessageFtuxTooltip);
local l_MessageFtuxTooltip_0 = v28.MessageFtuxTooltip;
local l_MessageFtuxTooltipVariant_0 = v28.MessageFtuxTooltipVariant;
local l_MessageFtuxTooltipDismissSignal_0 = v28.MessageFtuxTooltipDismissSignal;
local v32 = require(l_script_FirstAncestor_0.Enums.SwipeDirection);
local v33 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugAppChat);
local v34 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v35 = require(l_script_FirstAncestor_0.Components.ChatConversation.MessageInteraction.ReplyingContext.useReplyingToMessageDispatch);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v37 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local l_useTriggerFeedback_0 = require(l_Parent_0.InteractionFeedback).useTriggerFeedback;
local l_HapticFeedbackContext_0 = require(l_script_FirstAncestor_0.Utils.HapticFeedback).HapticFeedbackContext;
local l_HapticFeedbackType_0 = require(l_script_FirstAncestor_0.Utils.HapticFeedback).HapticFeedbackType;
local v41 = require(l_script_FirstAncestor_0.Hooks.useSwipeGesture);
local l_UserTile_0 = require(l_Parent_0.UserTile).UserTile;
local l_LayoutMode_0 = require(l_Parent_0.UserTile).LayoutMode;
local l_UserPresence_0 = require(l_Parent_0.Foundation).Enums.UserPresence;
local v45 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableMessageContextMenu);
local v46 = game:DefineFastFlag("AppChatEnableRepliesUIIxpEnabled2", false);
local v47 = game:DefineFastString("AppChatEnableRepliesUIIxpLayer1", "Party.ConversationPage");
local v48 = game:DefineFastFlag("AppChatEnableRepliesUITooltip", false);
local v49 = game:DefineFastFlag("AppChatMessageGestureRefactor2", false);
local v50 = game:DefineFastInt("AppChatMessageLongPressDistanceThreshold", 25);
local v51 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableHiddenMessages);
local v52 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v53 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseSwipeForReplies);
local v54 = require(l_script_FirstAncestor_0.Hooks.useFoundationPresence);
local v55 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableMessageAuthorPresence);
local v56 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAvatarPresenceIxpEnabled);
local v57 = require(l_script_FirstAncestor_0.Flags.FStringAppChatAvatarPresenceIxpLayer);
local v58 = game:DefineFastFlag("AppChatUseSymmetricSwipe", false);
local v59 = game:DefineFastInt("AppChatReplyIconSwipeOffset", 25);
local v60 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatSignalsMessageStore);
local v61 = if v60 then require(l_script_FirstAncestor_0.Stores.GetMessageViewModelStore) else nil;
local v62 = UDim2.new(0, 0, 0.5, 0);
local v63 = UDim2.new(1, 0, 0.5, 0);
local v64 = Vector2.new(0, 0.5);
local v65 = Vector2.new(1, 0.5);
local v66 = {
    failed = false, 
    filteredForReceivers = false, 
    Font = Enum.Font.Gotham, 
    isIncoming = false, 
    isNewSender = false, 
    parentWidth = 0, 
    messageId = "", 
    conversationId = "", 
    messageType = nil, 
    messageTypePaddingOffset = 0, 
    moderated = false, 
    messageMaxWidth = 0, 
    openViewProfile = function() --[[ Line: 98 ]] --[[ Name: openViewProfile ]]
        -- upvalues: v21 (copy)
        v21:warning("openViewProfile was not passed to ChatMessage");
    end, 
    renderMessage = function() --[[ Line: 101 ]] --[[ Name: renderMessage ]]
        -- upvalues: v21 (copy)
        v21:warning("renderMessage was not passed to ChatMessage");
    end, 
    closeKeyboard = function() --[[ Line: 104 ]] --[[ Name: closeKeyboard ]]

    end, 
    inputBoxRef = nil, 
    viewProfileOnAvatarPressed = true, 
    messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.", 
    messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.", 
    messageHiddenNoticeText = "PLACEHOLDER This message is not available", 
    unknownUserKey = "Feature.Chat.Label.UnknownUser", 
    isPending = false, 
    visibility = nil, 
    unitTestTouchEnabled = false
};
local v67 = v33() and "TextButton" or "Frame";
ChatMessageContainer = function(v68) --[[ Line: 119 ]] --[[ Name: ChatMessageContainer ]]
    -- upvalues: v14 (copy), v66 (copy), v51 (copy), v52 (copy), v6 (copy), l_useStyle_0 (copy), v20 (copy), v54 (copy), v9 (copy), v18 (copy), v56 (copy), l_IXPService_0 (copy), v57 (copy), v15 (copy), v53 (copy), v58 (copy), v32 (copy), v62 (copy), v63 (copy), v59 (copy), v64 (copy), v65 (copy), v34 (copy), v37 (copy), v26 (copy), l_useTriggerFeedback_0 (copy), v27 (copy), v48 (copy), l_MessageFtuxTooltipDismissSignal_0 (copy), l_MessageFtuxTooltipVariant_0 (copy), v25 (copy), l_useNavigation_0 (copy), v60 (copy), v61 (copy), v35 (copy), l_useLocalUserId_0 (copy), l_HapticFeedbackContext_0 (copy), l_HapticFeedbackType_0 (copy), v41 (copy), v13 (copy), v49 (copy), l_setTimeout_0 (copy), v50 (copy), l_UserInputService_0 (copy), v45 (copy), v12 (copy), v11 (copy), v24 (copy), l_useLocalization_0 (copy), l_TextService_0 (copy), v33 (copy), v10 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), v55 (copy), l_UserPresence_0 (copy), l_Skeleton_0 (copy), l_MessageFtuxTooltip_0 (copy), v46 (copy), v47 (copy), v67 (copy), v23 (copy), v22 (copy)
    local v69 = v14.Dictionary.join(v66, v68);
    local v70 = if v51 and v69.visibility then v69.visibility == v52.VisibilityTypes.Hidden else false;
    local v71 = v6.useCallback(function() --[[ Line: 126 ]]
        -- upvalues: v69 (copy)
        if v69.viewProfileOnAvatarPressed then
            v69.openViewProfile(v69.senderUserId);
        end;
    end, {
        v69.senderUserId
    });
    local v72 = l_useStyle_0();
    local l_shouldShowName_0 = v69.shouldShowName;
    local v74 = v20();
    local v75 = v54(v69.senderUserId or "");
    local v76 = v9(v69.conversationId or "");
    local v77 = v76 and v76.conversationType == v18.Type.MULTI_USER_CONVERSATION;
    v6.useEffect(function() --[[ Line: 140 ]]
        -- upvalues: v56 (ref), l_IXPService_0 (ref), v57 (ref)
        if v56 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v57);
        end;
    end, {});
    local v78 = v15.Hooks.useTokens();
    local v79 = nil;
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    if v53 then
        v87 = v6.useMemo(function() --[[ Line: 157 ]]
            -- upvalues: v58 (ref), v69 (copy), v32 (ref), v15 (ref), v62 (ref), v63 (ref), v59 (ref), v64 (ref), v65 (ref)
            if v58 then
                return {
                    direction = if v69.isIncoming then v32.Right else v32.Left, 
                    iconName = if v69.isIncoming then v15.Enums.IconName.ArrowThickToRight else v15.Enums.IconName.ArrowThickToLeft, 
                    messagePosition = if v69.isIncoming then v62 else v63, 
                    iconOffset = if v69.isIncoming then v59 else -v59, 
                    iconAnchorPoint = if v69.isIncoming then v64 else v65
                };
            else
                return {
                    direction = v32.Right, 
                    iconName = v15.Enums.IconName.ArrowThickToRight, 
                    messagePosition = v62, 
                    iconOffset = v59, 
                    iconAnchorPoint = v64
                };
            end;
        end, {});
    end;
    local v88 = nil;
    local v89 = nil;
    local v90 = nil;
    local v91 = nil;
    local v92 = nil;
    local v93 = nil;
    local v94 = nil;
    local v95 = v6.useRef(nil);
    local v96 = v6.useRef(Vector2.zero);
    if v34() then
        local v97 = v37(v26.Context);
        local v98 = l_useTriggerFeedback_0();
        local v99, v100 = v6.useState(false);
        v81 = v99;
        v82 = v100;
        v99, v100 = v6.useState(false);
        local v101, v102 = v6.useState(false);
        local l_v102_0 = v102 --[[ copy: 34 -> 53 ]];
        v6.useEffect(function() --[[ Line: 198 ]]
            -- upvalues: v27 (ref), l_v102_0 (copy)
            local v104 = v27.dismissed:connect(function() --[[ Line: 199 ]]
                -- upvalues: l_v102_0 (ref)
                l_v102_0(false);
            end);
            return function() --[[ Line: 202 ]]
                -- upvalues: v104 (copy)
                v104:disconnect();
            end;
        end);
        local v105 = v6.useMemo(function() --[[ Line: 208 ]]
            -- upvalues: v69 (copy), v51 (ref)
            return {
                conversationId = v69.conversationId, 
                targetMessageSenderId = v69.senderUserId, 
                targetMessageId = v69.messageId, 
                targetMessageSentAt = if v69.sent then v69.sent.dateTime else nil, 
                targetMessageLength = if v69.content then #v69.content else nil, 
                targetMessageVisibility = if v51 then v69.visibility else nil
            };
        end, {
            v69.conversationId, 
            v69.senderUserId, 
            v69.messageId, 
            v69.sent, 
            v69.content, 
            if v51 then v69.visibility else nil
        });
        local l_v99_0 = v99 --[[ copy: 31 -> 54 ]];
        local l_v101_0 = v101 --[[ copy: 33 -> 55 ]];
        v79 = v6.useMemo(function() --[[ Line: 228 ]]
            -- upvalues: v51 (ref), v70 (copy), l_v99_0 (copy), v53 (ref), l_v101_0 (copy)
            local v108;
            if v51 then
                v108 = not v70;
                if v108 then
                    v108 = l_v99_0;
                    if not v108 then
                        v108 = not v53;
                        if v108 then
                            return l_v101_0;
                        end;
                    end;
                end;
            else
                v108 = l_v99_0 or not v53 and l_v101_0;
            end;
            return v108;
        end, {
            v99, 
            v101, 
            v70
        });
        v6.useEffect(function() --[[ Line: 235 ]]
            -- upvalues: v48 (ref), v79 (ref), v69 (copy), l_MessageFtuxTooltipDismissSignal_0 (ref), l_MessageFtuxTooltipVariant_0 (ref)
            if v48 and v79 and v69.isLastIncomingChatMessage then
                l_MessageFtuxTooltipDismissSignal_0.dismiss(l_MessageFtuxTooltipVariant_0.Replies);
            end;
        end, {
            v79, 
            v69.isLastIncomingChatMessage
        });
        local l_v97_0 = v97 --[[ copy: 29 -> 56 ]];
        local l_v105_0 = v105 --[[ copy: 35 -> 57 ]];
        v80 = v6.useCallback(function() --[[ Line: 240 ]]
            -- upvalues: v25 (ref), l_v97_0 (copy), l_v105_0 (copy)
            if v25.ConversationMessageReplyIconImpression then
                l_v97_0.emit(v25.ConversationMessageReplyIconImpression, l_v105_0);
            end;
        end, {
            v97, 
            v105
        });
        v83 = l_useNavigation_0();
        v84 = v9(v69.conversationId);
        local v111 = nil;
        if v60 and v61 then
            v111 = v61(false).channelsMessageStore.messages[v69.messageId];
        elseif v84 and v84.messages then
            v111 = v84.messages:Get(v69.messageId);
        end;
        local v112 = v35();
        v85 = l_useLocalUserId_0();
        do
            local l_v111_0 = v111;
            if v53 then
                local l_v98_0 = v98 --[[ copy: 30 -> 67 ]];
                local v115 = v6.useCallback(function() --[[ Line: 263 ]]
                    -- upvalues: v51 (ref), v70 (copy), l_v98_0 (copy), l_HapticFeedbackContext_0 (ref), l_HapticFeedbackType_0 (ref)
                    if not v51 or not v70 then
                        l_v98_0(l_HapticFeedbackContext_0.Default, l_HapticFeedbackType_0.Press);
                    end;
                end, {});
                local l_v97_1 = v97 --[[ copy: 29 -> 68 ]];
                local l_v105_1 = v105 --[[ copy: 35 -> 69 ]];
                local l_v112_0 = v112 --[[ copy: 37 -> 70 ]];
                local v119 = v6.useCallback(function() --[[ Line: 269 ]]
                    -- upvalues: v25 (ref), l_v97_1 (copy), l_v105_1 (copy), v51 (ref), v70 (copy), l_v112_0 (copy), l_v111_0 (ref)
                    if v25.ConversationMessageSwiped then
                        l_v97_1.emit(v25.ConversationMessageSwiped, l_v105_1);
                    end;
                    if not v51 or not v70 then
                        l_v112_0(l_v111_0);
                    end;
                end, {
                    v112, 
                    l_v111_0, 
                    v97, 
                    v105
                });
                v86 = v41({
                    onSwipeThresholdReached = v115, 
                    onSwipeComplete = v119, 
                    direction = v87.direction
                });
            end;
            local v120 = v6.useCallback(function() --[[ Line: 285 ]]
                -- upvalues: v83 (ref), v13 (ref), v69 (copy)
                v83.navigate(v13.MessageContextMenu, {
                    messageId = v69.messageId, 
                    conversationId = v69.conversationId, 
                    inputBoxRef = v69.inputBoxRef
                });
            end, {
                v83.navigate, 
                v69.messageId, 
                v69.conversationId, 
                v69.inputBoxRef
            });
            local v126 = v6.useCallback(function(v121, v122, v123) --[[ Line: 294 ]]
                -- upvalues: v49 (ref), v96 (copy), l_setTimeout_0 (ref), v50 (ref), v94 (ref)
                if v49 and v122 then
                    v96.current = Vector2.new(v122.Position.X, v122.Position.Y);
                end;
                l_setTimeout_0(function() --[[ Line: 298 ]]
                    -- upvalues: v49 (ref), v122 (copy), v96 (ref), v50 (ref), v94 (ref), v121 (copy)
                    local v124 = 0;
                    if v49 and v122 then
                        local l_current_0 = v96.current;
                        v124 = (Vector2.new(v122.Position.X, v122.Position.Y) - l_current_0).Magnitude;
                    end;
                    if v122 and (v122.UserInputState == Enum.UserInputState.Begin or v122.UserInputState == Enum.UserInputState.Change) and (not v49 or v124 < v50) then
                        v94(v121, v122);
                    end;
                end, v123);
            end, {
                v94
            });
            local l_v100_0 = v100 --[[ copy: 32 -> 58 ]];
            local l_v97_2 = v97 --[[ copy: 29 -> 59 ]];
            local l_v105_2 = v105 --[[ copy: 35 -> 60 ]];
            local l_v98_1 = v98 --[[ copy: 30 -> 61 ]];
            local l_v102_1 = v102 --[[ copy: 34 -> 62 ]];
            local l_v120_0 = v120 --[[ copy: 38 -> 63 ]];
            local l_v126_0 = v126 --[[ copy: 39 -> 64 ]];
            local l_v101_1 = v101 --[[ copy: 33 -> 65 ]];
            local l_v112_1 = v112 --[[ copy: 37 -> 66 ]];
            v94 = v6.useCallback(function(v136, v137, v138) --[[ Line: 321 ]]
                -- upvalues: v69 (copy), l_UserInputService_0 (ref), v6 (ref), l_v100_0 (copy), v25 (ref), l_v97_2 (copy), l_v105_2 (copy), v51 (ref), v70 (copy), v53 (ref), l_v98_1 (copy), l_HapticFeedbackContext_0 (ref), l_HapticFeedbackType_0 (ref), l_v102_1 (copy), v45 (ref), l_v120_0 (copy), l_v126_0 (copy), v12 (ref), v49 (ref), v82 (ref), l_v101_1 (copy), v27 (ref), v11 (ref), l_v112_1 (copy), l_v111_0 (ref)
                if v69.isPending then
                    return;
                else
                    if l_UserInputService_0.MouseEnabled then
                        if v136 == v6.Event.MouseEnter then
                            l_v100_0(true);
                        end;
                        if v136 == v6.Event.MouseLeave then
                            l_v100_0(false);
                        end;
                        if v136 == v6.Event.MouseButton1Down then
                            v69.closeKeyboard();
                        end;
                    end;
                    if l_UserInputService_0.GamepadEnabled or l_UserInputService_0.TouchEnabled or v69.unitTestTouchEnabled then
                        if v136 == v6.Event.TouchLongPress then
                            if v25.ConversationMessageLongPressed then
                                l_v97_2.emit(v25.ConversationMessageLongPressed, l_v105_2);
                            end;
                            if not v51 or not v70 then
                                if not v53 then
                                    l_v98_1(l_HapticFeedbackContext_0.Default, l_HapticFeedbackType_0.Release);
                                end;
                                l_v102_1(true);
                                if v45 then
                                    l_v120_0();
                                end;
                                l_v126_0(v6.Event.InputEnded, v137, v12.PEEK_VIEW_ANIMATION_MILLISEC);
                            end;
                        end;
                        if v136 == v6.Event.InputBegan and v137 then
                            if v25.ConversationMessagePressed then
                                l_v97_2.emit(v25.ConversationMessagePressed, l_v105_2);
                            end;
                            if not v51 or not v70 then
                                if not v49 then
                                    l_v98_1(l_HapticFeedbackContext_0.Default, l_HapticFeedbackType_0.Press);
                                    v82(true);
                                end;
                                if not l_v101_1 then
                                    v27.dismiss();
                                end;
                            end;
                            l_v126_0(v6.Event.TouchLongPress, v137, v12.LONG_PRESS_DELAY_MILLISEC);
                        end;
                        if not v49 and v136 == v6.Event.InputEnded then
                            v82(false);
                        end;
                        if v136 == v6.Event.TouchTap then
                            v69.closeKeyboard();
                        end;
                    end;
                    if v136 == v6.Event.Activated then
                        v27.dismiss();
                        if v138 == v11.MessageContextMenu then
                            if v25.ConversationMessageOpenMenuIconClicked then
                                l_v97_2.emit(v25.ConversationMessageOpenMenuIconClicked, l_v105_2);
                            end;
                            l_v120_0();
                        end;
                        if v138 == v11.Reply then
                            if v25.ConversationMessageReplyIconClicked then
                                l_v97_2.emit(v25.ConversationMessageReplyIconClicked, l_v105_2);
                            end;
                            l_v98_1(l_HapticFeedbackContext_0.Default, l_HapticFeedbackType_0.Press);
                            l_v112_1(l_v111_0);
                        end;
                    end;
                    return;
                end;
            end, {
                v69.isPending, 
                v69.unitTestTouchEnabled, 
                l_UserInputService_0.MouseEnabled, 
                l_UserInputService_0.TouchEnabled, 
                v126, 
                v100, 
                v102, 
                v82, 
                v97, 
                v120, 
                v112, 
                v98, 
                v70
            });
            v90 = v6.useCallback(function(v139, v140) --[[ Line: 435 ]]
                -- upvalues: v53 (ref), l_UserInputService_0 (ref), v86 (ref), l_MessageFtuxTooltipDismissSignal_0 (ref), l_MessageFtuxTooltipVariant_0 (ref), l_v126_0 (copy), v6 (ref), v12 (ref)
                if v53 and l_UserInputService_0.TouchEnabled and v86 then
                    v86.onInputBegan(v139, v140);
                    l_MessageFtuxTooltipDismissSignal_0.dismiss(l_MessageFtuxTooltipVariant_0.Replies);
                end;
                l_v126_0(v6.Event.InputBegan, v140, v12.INPUT_BEGAN_DELAY_MILLISEC);
            end, {
                v126, 
                v86
            });
            v91 = v6.useCallback(function(_) --[[ Line: 444 ]]
                -- upvalues: v94 (ref), v6 (ref)
                v94(v6.Event.InputEnded);
            end, {
                v94
            });
            v88 = v6.useCallback(function(_) --[[ Line: 448 ]]
                -- upvalues: v94 (ref), v6 (ref)
                v94(v6.Event.MouseEnter);
            end, {
                v94
            });
            v89 = v6.useCallback(function(_) --[[ Line: 452 ]]
                -- upvalues: v94 (ref), v6 (ref)
                v94(v6.Event.MouseLeave);
            end, {
                v94
            });
            v92 = v6.useCallback(function(_) --[[ Line: 456 ]]
                -- upvalues: v94 (ref), v6 (ref)
                v94(v6.Event.TouchTap);
            end, {
                v94
            });
            v93 = v6.useCallback(function(_) --[[ Line: 460 ]]
                -- upvalues: v94 (ref), v6 (ref)
                v94(v6.Event.MouseButton1Down);
            end, {
                v94
            });
        end;
    end;
    local v146 = v34() and v69.repliesTo and v69.repliesTo.senderTargetId;
    local function v152(v147, v148) --[[ Line: 467 ]] --[[ Name: getDisplayNameText ]]
        -- upvalues: v85 (ref), v69 (copy), v146 (copy), v84 (ref), v18 (ref)
        local v149 = v85 == v69.senderUserId;
        local v150 = v69.senderUserId == v69.repliesTo.senderTargetId;
        local v151 = v85 == v69.repliesTo.senderTargetId;
        if not v146 then
            return v147;
        elseif v149 and v150 then
            return "Feature.Chat.Label.YouRepliedToYou";
        else
            if v84.conversationType == v18.Type.ONE_TO_ONE_CONVERSATION then
                if v149 and not v150 then
                    return "Feature.Chat.Label.OneToOne.YouRepliedToThem";
                elseif not v149 and v151 then
                    return "Feature.Chat.Label.OneToOne.ThemRepliedToYou";
                elseif not v149 and v150 then
                    return "Feature.Chat.Label.OneToOne.ThemRepliedToThem";
                end;
            end;
            if v84.conversationType == v18.Type.MULTI_USER_CONVERSATION then
                if v149 and not v150 then
                    return {
                        "Feature.Chat.Label.Group.YouRepliedToThem"; 
                        DISPLAY_NAME = v148
                    };
                elseif not v149 and v151 then
                    return {
                        "Feature.Chat.Label.Group.ThemRepliedToYou"; 
                        DISPLAY_NAME = v147
                    };
                elseif not v149 and v150 then
                    return {
                        "Feature.Chat.Label.Group.ThemRepliedToThem"; 
                        DISPLAY_NAME = v147
                    };
                elseif not v149 and not v151 then
                    return {
                        "Feature.Chat.Label.Group.ThemRepliedToOther"; 
                        DISPLAY_NAME_1 = v147, 
                        DISPLAY_NAME_2 = v148
                    };
                end;
            end;
            return v69.unknownUserKey;
        end;
    end;
    local v153 = {
        v69.senderUserId
    };
    if v146 then
        table.insert(v153, v69.repliesTo.senderTargetId);
    end;
    local v154 = v24.Hooks.useUserProfilesFetch({
        userIds = v153, 
        query = v24.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v155 = nil;
    local v156 = nil;
    if v154.data then
        v156 = false;
        local v157 = v24.Selectors.getCombinedNameFromId(v154.data, v69.senderUserId) or v69.unknownUserKey;
        v155 = if v146 then v152(v157, v24.Selectors.getCombinedNameFromId(v154.data, v69.repliesTo.senderTargetId) or v69.unknownUserKey) else v157;
    else
        v156 = true;
        v155 = nil;
    end;
    local v158 = l_useLocalization_0(if v146 then {
        displayName = v155
    } else {}).displayName or v155;
    local v161 = v6.useCallback(function() --[[ Line: 559 ]]
        -- upvalues: v69 (copy), v12 (ref), l_TextService_0 (ref), v158 (ref), v72 (copy)
        local v159 = Vector2.new(math.max(1, v69.messageMaxWidth - v12.TAIL_WIDTH), 1e999);
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v158, v72.Font.BaseSize * v72.Font.Footer.RelativeSize, v72.Font.Footer.Font, v159);
        return UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y);
    end, {
        v72.Font.BaseSize * v72.Font.Footer.RelativeSize, 
        v72.Font.Footer.Font, 
        v69.messageMaxWidth - v12.TAIL_WIDTH, 
        v158
    });
    local v162 = 0;
    if not v69.showDateTime then
        v162 = (if not not v69.isNewSender or v146 then v12.CHAT_MESSAGE_MAX_SPACE else v12.CHAT_MESSAGE_MIN_SPACE) + v69.messageTypePaddingOffset;
    end;
    local l_left_0 = v74.left;
    local v164 = l_left_0 + v78.Size.Size_700;
    local v165 = v69.isIncoming and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right;
    local v166, v167 = v6.useState(false);
    local v169 = v6.useCallback(function() --[[ Line: 587 ]]
        -- upvalues: v33 (ref), v167 (copy)
        if v33() then
            v167(function(v168) --[[ Line: 589 ]]
                return not v168;
            end);
        end;
    end, {
        v167
    });
    local v170 = v166 or v69.moderated or v69.filteredForReceivers or v51 and v70;
    local v171 = if v166 then v69.messageId else if v51 and v70 then v69.messageHiddenNoticeText else v69.moderated and v69.messageModeratedNoticeText or v69.messageDefaultNoticeText;
    local v172 = v6.useMemo(function() --[[ Line: 604 ]]
        -- upvalues: v6 (ref), v15 (ref), v78 (copy), v69 (copy)
        return v6.createElement(v15.Icon, {
            name = v15.Enums.IconName.TriangleExclamation, 
            size = v15.Enums.IconSize.Large, 
            style = v78.Color.System.Alert, 
            LayoutOrder = v69.isIncoming and 0 or 3
        });
    end, {
        v78, 
        v72, 
        v69.isIncoming
    });
    local v173 = nil;
    v173 = if not not v69.failed or v69.moderated then v172 else if v79 then v6.createElement(v10, {
        LayoutOrder = v69.isIncoming and 2 or 1, 
        isIncoming = v69.isIncoming, 
        handleEvent = v94, 
        emitImpressionTelemetryEvent = v80
    }) else nil;
    local v174 = not v34() or v69.isIncoming;
    local v177 = if v53 and v86 and v86.swipeProgress then v86.swipeProgress:map(function(v175) --[[ Line: 632 ]]
        -- upvalues: v78 (copy)
        local v176 = 1 - math.pow(v175, 3);
        return {
            Color3 = v78.Semantic.Color.Icon.Default.Color3, 
            Transparency = v176
        };
    end) else nil;
    local v180 = if v53 and v86 and v86.swipeOffset then v86.swipeOffset:map(function(v178) --[[ Line: 645 ]]
        -- upvalues: v87 (ref), v32 (ref)
        local v179 = if v87.direction == v32.Right then v178 else -v178;
        return UDim2.new(0, v179, 0, 0);
    end) else nil;
    local v182 = if v53 and v86 and v86.swipeProgress then v86.swipeProgress:map(function(v181) --[[ Line: 655 ]]
        -- upvalues: v87 (ref)
        return v87.messagePosition + UDim2.new(0, v181 * v87.iconOffset, 0, 0);
    end) else nil;
    local function v184() --[[ Line: 661 ]] --[[ Name: renderMessage ]]
        -- upvalues: v6 (ref), v53 (ref), v180 (copy), v88 (ref), v89 (ref), v162 (ref), v69 (copy), l_left_0 (copy), v164 (copy), v74 (copy), v165 (copy), v15 (ref), l_UserTile_0 (ref), l_LayoutMode_0 (ref), v55 (ref), v77 (copy), v75 (copy), l_UserPresence_0 (ref), v71 (copy), v78 (copy), l_shouldShowName_0 (copy), v12 (ref), v174 (copy), v146 (copy), v156 (ref), v72 (copy), v161 (copy), v158 (ref), l_Skeleton_0 (ref), v34 (ref), v172 (copy), v90 (ref), v91 (ref), v92 (ref), v93 (ref), v81 (ref), v173 (ref), v95 (copy), v48 (ref), v51 (ref), v70 (copy), l_MessageFtuxTooltip_0 (ref), l_MessageFtuxTooltipVariant_0 (ref), v87 (ref), v182 (copy), v177 (copy)
        local v183 = v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 0), 
            Position = if v53 then v180 else nil, 
            [v6.Event.MouseEnter] = v88, 
            [v6.Event.MouseLeave] = v89
        }, {
            Padding = v6.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v162), 
                PaddingLeft = UDim.new(0, v69.thumbnail and l_left_0 or v164), 
                PaddingRight = UDim.new(0, v74.right - 0)
            }), 
            Layout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = v165
            }), 
            AvatarContainer = if v69.thumbnail then v6.createElement(v15.View, {
                tag = {
                    ["col auto-x size-0-full"] = true, 
                    ["align-y-top"] = false
                }, 
                LayoutOrder = 1
            }, {
                Avatar = v6.createElement(v15.View, {
                    tag = "size-700-700"
                }, {
                    AvatarCircle = v6.createElement(l_UserTile_0, {
                        userId = v69.senderUserId, 
                        layoutMode = l_LayoutMode_0.compact, 
                        userPresenceType = if v55 and v77 then v75.presence else l_UserPresence_0.None, 
                        layoutOrder = 1, 
                        onActivated = v71
                    })
                })
            }) else nil, 
            MessageWithDisplayName = v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, v69.isIncoming and -v164 or 0, 0, 0)
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = v165
                }), 
                Padding = v6.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v69.isIncoming and v78.Size.Size_200 or 0)
                }), 
                DisplayNameContainer = l_shouldShowName_0 and v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, v69.messageMaxWidth - v12.TAIL_WIDTH, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 1
                }, {
                    Padding = v6.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v12.GROUPED_MESSAGE_DISPLAY_NAME_LEFT_PADDING), 
                        PaddingRight = if v174 then UDim.new(0, 0) else UDim.new(0, v12.TAIL_WIDTH), 
                        PaddingBottom = if v146 then UDim.new(0, v12.REPLIED_DISPLAY_NAME_BOTTOM_PADDING) else UDim.new(0, v12.GROUPED_MESSAGE_DISPLAY_NAME_BOTTOM_PADDING)
                    }), 
                    DisplayName = if not v156 then v6.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Font = v72.Font.Footer.Font, 
                        Size = v161(), 
                        AnchorPoint = if v174 then Vector2.new(0, 0) else Vector2.new(1, 0), 
                        Position = if v174 then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0), 
                        Text = v158, 
                        TextColor3 = v72.Theme.TextDefault.Color, 
                        TextSize = v72.Font.BaseSize * v72.Font.Footer.RelativeSize, 
                        TextTransparency = v72.Theme.TextDefault.Transparency, 
                        TextXAlignment = if v174 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right, 
                        TextYAlignment = Enum.TextYAlignment.Top
                    }) else nil, 
                    ShimmerName = if v156 then v6.createElement(l_Skeleton_0, {
                        AnchorPoint = if v174 then Vector2.new(0, 0) else Vector2.new(1, 0), 
                        Position = if v174 then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0), 
                        Size = UDim2.new(0, v12.SHIMMER_WIDTH, 0, v12.SHIMMER_HEIGHT), 
                        LayoutOrder = 2
                    }) else nil
                }), 
                MessageWithIcons = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, v69.isIncoming and -v164 or 0, 0, 0)
                }, {
                    Layout = v6.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = v165, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 10), 
                        ItemLineAlignment = Enum.ItemLineAlignment.Center
                    }), 
                    AlertIcon = if not v34() and (v69.failed or v69.moderated) then v172 else nil, 
                    Message = v69.renderMessage({
                        LayoutOrder = v69.isIncoming and 1 or 2, 
                        [v6.Event.InputBegan] = v90, 
                        [v6.Event.InputEnded] = v91, 
                        [v6.Event.TouchTap] = v92, 
                        [v6.Event.MouseButton1Down] = v93
                    }, if v34() then {
                        isPressed = v81, 
                        Icons = v173, 
                        ref = v95
                    } else nil), 
                    MessageFtuxTooltip = if not (v48 and v34() and v69.isLastIncomingChatMessage) or v51 and v70 then nil else v6.createElement(l_MessageFtuxTooltip_0, {
                        variant = l_MessageFtuxTooltipVariant_0.Replies, 
                        messageRef = v95, 
                        isReversed = v69.isIncoming
                    })
                })
            })
        });
        if v53 and (not v51 or not v70) then
            return v6.createElement(v15.View, {
                tag = "size-full-0 auto-y", 
                ClipsDescendants = false, 
                LayoutOrder = 2, 
                ZIndex = 2
            }, {
                ReplyIconFilled = v6.createElement(v15.Icon, {
                    name = v87.iconName, 
                    size = v15.Enums.IconSize.Medium, 
                    variant = v15.Enums.IconVariant.Filled, 
                    AnchorPoint = v87.iconAnchorPoint, 
                    Position = v182, 
                    style = v177, 
                    ZIndex = 1
                }), 
                Content = v183
            });
        else
            return v183;
        end;
    end;
    v6.useEffect(function() --[[ Line: 833 ]]
        -- upvalues: v46 (ref), v69 (copy), l_IXPService_0 (ref), v47 (ref)
        if v46 and v69.isLastIncomingChatMessage then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v47);
        end;
    end, {
        v69.isLastIncomingChatMessage
    });
    return v6.createElement(v67, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        Text = v33() and "" or nil, 
        [v6.Event.Activated] = if v33() then v169 else nil
    }, {
        Layout = v6.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = v165, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        DateTime = v69.showDateTime and v6.createElement(v23, {
            LayoutOrder = 1, 
            Text = v69.sent:GetLongRelativeTime(), 
            maxWidth = v12.DATETIME_MAX_WIDTH
        }), 
        MessageWithAvatar = v184(), 
        Notice = v170 and v6.createElement(v22, {
            Font = v69.Font, 
            HorizontalAlignment = v165, 
            LayoutOrder = 3, 
            Text = v171, 
            TextColor3 = if v51 and v70 then v78.Color.Content.Muted.Color3 else v69.moderated and v72.Theme.Alert.Color or v72.Theme.UIDefault.Color, 
            TextTransparency = if v51 and v70 then v78.Color.Content.Muted.Transparency else v69.moderated and v72.Theme.Alert.Transparency or v72.Theme.UIDefault.Transparency, 
            TextXAlignment = v69.isIncoming and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right, 
            TextSize = v78.Typography.CaptionSmall.FontSize, 
            margin = {
                top = v78.Padding.Small, 
                left = v69.isIncoming and v164 + v12.NOTICE_HORIZONTAL_PADDING or 0, 
                right = not v69.isIncoming and v74.right or 0, 
                bottom = 0
            }, 
            maxWidth = v69.parentWidth, 
            width = UDim.new(1, v69.isIncoming and -v164 or 0)
        }), 
        debug = v69.debugElement or nil
    });
end;
return ChatMessageContainer;