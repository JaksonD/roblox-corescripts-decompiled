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
local v45 = require(l_script_FirstAncestor_0.Components.Cells.AvatarCircle);
local v46 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableNewChatBubbleUI);
local v47 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAutotranslation);
local v48 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableMessageContextMenu);
local v49 = game:DefineFastFlag("AppChatEnableRepliesUIIxpEnabled2", false);
local v50 = game:DefineFastString("AppChatEnableRepliesUIIxpLayer1", "Party.ConversationPage");
local v51 = game:DefineFastFlag("AppChatEnableRepliesUITooltip", false);
local v52 = game:DefineFastFlag("AppChatMessageGestureRefactor2", false);
local v53 = game:DefineFastInt("AppChatMessageLongPressDistanceThreshold", 25);
local v54 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableHiddenMessages);
local v55 = require(l_script_FirstAncestor_0.Models.MessageModel);
local l_FFlagAppChatEnableConversationUserTileAvatars_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableConversationUserTileAvatars;
local v57 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseSwipeForReplies);
local v58 = require(l_script_FirstAncestor_0.Hooks.useFoundationPresence);
local v59 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableMessageAuthorPresence);
local v60 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAvatarPresenceIxpEnabled);
local v61 = require(l_script_FirstAncestor_0.Flags.FStringAppChatAvatarPresenceIxpLayer);
local v62 = game:DefineFastFlag("AppChatUseSymmetricSwipe", false);
local v63 = game:DefineFastInt("AppChatReplyIconSwipeOffset", 25);
local v64 = UDim2.new(0, 0, 0.5, 0);
local v65 = UDim2.new(1, 0, 0.5, 0);
local v66 = Vector2.new(0, 0.5);
local v67 = Vector2.new(1, 0.5);
local v68 = {
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
    openViewProfile = function() --[[ Line: 100 ]] --[[ Name: openViewProfile ]]
        -- upvalues: v21 (copy)
        v21:warning("openViewProfile was not passed to ChatMessage");
    end, 
    renderMessage = function() --[[ Line: 103 ]] --[[ Name: renderMessage ]]
        -- upvalues: v21 (copy)
        v21:warning("renderMessage was not passed to ChatMessage");
    end, 
    closeKeyboard = function() --[[ Line: 106 ]] --[[ Name: closeKeyboard ]]

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
local v69 = v33() and "TextButton" or "Frame";
ChatMessageContainer = function(v70) --[[ Line: 121 ]] --[[ Name: ChatMessageContainer ]]
    -- upvalues: v14 (copy), v68 (copy), v54 (copy), v55 (copy), v6 (copy), l_useStyle_0 (copy), v20 (copy), v58 (copy), v9 (copy), v18 (copy), v60 (copy), l_IXPService_0 (copy), v61 (copy), l_FFlagAppChatEnableConversationUserTileAvatars_0 (copy), v46 (copy), v15 (copy), v57 (copy), v62 (copy), v32 (copy), v64 (copy), v65 (copy), v63 (copy), v66 (copy), v67 (copy), v34 (copy), v37 (copy), v26 (copy), l_useTriggerFeedback_0 (copy), v27 (copy), v51 (copy), l_MessageFtuxTooltipDismissSignal_0 (copy), l_MessageFtuxTooltipVariant_0 (copy), v25 (copy), l_useNavigation_0 (copy), v35 (copy), l_useLocalUserId_0 (copy), l_HapticFeedbackContext_0 (copy), l_HapticFeedbackType_0 (copy), v41 (copy), v13 (copy), v52 (copy), l_setTimeout_0 (copy), v53 (copy), l_UserInputService_0 (copy), v48 (copy), v12 (copy), v11 (copy), v24 (copy), l_useLocalization_0 (copy), l_TextService_0 (copy), v33 (copy), v10 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), v59 (copy), l_UserPresence_0 (copy), v45 (copy), v47 (copy), l_Skeleton_0 (copy), l_MessageFtuxTooltip_0 (copy), v49 (copy), v50 (copy), v69 (copy), v23 (copy), v22 (copy)
    local v71 = v14.Dictionary.join(v68, v70);
    local v72 = if v54 and v71.visibility then v71.visibility == v55.VisibilityTypes.Hidden else false;
    local v73 = v6.useCallback(function() --[[ Line: 128 ]]
        -- upvalues: v71 (copy)
        if v71.viewProfileOnAvatarPressed then
            v71.openViewProfile(v71.senderUserId);
        end;
    end, {
        v71.senderUserId
    });
    local v74 = l_useStyle_0();
    local l_shouldShowName_0 = v71.shouldShowName;
    local v76 = v20();
    local v77 = v58(v71.senderUserId or "");
    local v78 = v9(v71.conversationId or "");
    local v79 = v78 and v78.conversationType == v18.Type.MULTI_USER_CONVERSATION;
    v6.useEffect(function() --[[ Line: 142 ]]
        -- upvalues: v60 (ref), l_IXPService_0 (ref), v61 (ref)
        if v60 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v61);
        end;
    end, {});
    local v80 = if not not l_FFlagAppChatEnableConversationUserTileAvatars_0 or v54 or v46 then v15.Hooks.useTokens() else {};
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    local v88 = nil;
    local v89 = nil;
    if v57 then
        v89 = v6.useMemo(function() --[[ Line: 163 ]]
            -- upvalues: v62 (ref), v71 (copy), v32 (ref), v15 (ref), v64 (ref), v65 (ref), v63 (ref), v66 (ref), v67 (ref)
            if v62 then
                return {
                    direction = if v71.isIncoming then v32.Right else v32.Left, 
                    iconName = if v71.isIncoming then v15.Enums.IconName.ArrowThickToRight else v15.Enums.IconName.ArrowThickToLeft, 
                    messagePosition = if v71.isIncoming then v64 else v65, 
                    iconOffset = if v71.isIncoming then v63 else -v63, 
                    iconAnchorPoint = if v71.isIncoming then v66 else v67
                };
            else
                return {
                    direction = v32.Right, 
                    iconName = v15.Enums.IconName.ArrowThickToRight, 
                    messagePosition = v64, 
                    iconOffset = v63, 
                    iconAnchorPoint = v66
                };
            end;
        end, {});
    end;
    local v90 = nil;
    local v91 = nil;
    local v92 = nil;
    local v93 = nil;
    local v94 = nil;
    local v95 = nil;
    local v96 = nil;
    local v97 = v6.useRef(nil);
    local v98 = v6.useRef(Vector2.zero);
    if v34() then
        local v99 = v37(v26.Context);
        local v100 = l_useTriggerFeedback_0();
        local v101, v102 = v6.useState(false);
        v83 = v101;
        v84 = v102;
        v101, v102 = v6.useState(false);
        local v103, v104 = v6.useState(false);
        local l_v104_0 = v104 --[[ copy: 34 -> 53 ]];
        v6.useEffect(function() --[[ Line: 204 ]]
            -- upvalues: v27 (ref), l_v104_0 (copy)
            local v106 = v27.dismissed:connect(function() --[[ Line: 205 ]]
                -- upvalues: l_v104_0 (ref)
                l_v104_0(false);
            end);
            return function() --[[ Line: 208 ]]
                -- upvalues: v106 (copy)
                v106:disconnect();
            end;
        end);
        local v107 = v6.useMemo(function() --[[ Line: 214 ]]
            -- upvalues: v71 (copy), v54 (ref)
            return {
                conversationId = v71.conversationId, 
                targetMessageSenderId = v71.senderUserId, 
                targetMessageId = v71.messageId, 
                targetMessageSentAt = if v71.sent then v71.sent.dateTime else nil, 
                targetMessageLength = if v71.content then #v71.content else nil, 
                targetMessageVisibility = if v54 then v71.visibility else nil
            };
        end, {
            v71.conversationId, 
            v71.senderUserId, 
            v71.messageId, 
            v71.sent, 
            v71.content, 
            if v54 then v71.visibility else nil
        });
        local l_v101_0 = v101 --[[ copy: 31 -> 54 ]];
        local l_v103_0 = v103 --[[ copy: 33 -> 55 ]];
        v81 = v6.useMemo(function() --[[ Line: 234 ]]
            -- upvalues: v54 (ref), v72 (copy), l_v101_0 (copy), v57 (ref), l_v103_0 (copy)
            local v110;
            if v54 then
                v110 = not v72;
                if v110 then
                    v110 = l_v101_0;
                    if not v110 then
                        v110 = not v57;
                        if v110 then
                            return l_v103_0;
                        end;
                    end;
                end;
            else
                v110 = l_v101_0 or not v57 and l_v103_0;
            end;
            return v110;
        end, {
            v101, 
            v103, 
            v72
        });
        v6.useEffect(function() --[[ Line: 241 ]]
            -- upvalues: v51 (ref), v81 (ref), v71 (copy), l_MessageFtuxTooltipDismissSignal_0 (ref), l_MessageFtuxTooltipVariant_0 (ref)
            if v51 and v81 and v71.isLastIncomingChatMessage then
                l_MessageFtuxTooltipDismissSignal_0.dismiss(l_MessageFtuxTooltipVariant_0.Replies);
            end;
        end, {
            v81, 
            v71.isLastIncomingChatMessage
        });
        local l_v99_0 = v99 --[[ copy: 29 -> 56 ]];
        local l_v107_0 = v107 --[[ copy: 35 -> 57 ]];
        v82 = v6.useCallback(function() --[[ Line: 246 ]]
            -- upvalues: v25 (ref), l_v99_0 (copy), l_v107_0 (copy)
            if v25.ConversationMessageReplyIconImpression then
                l_v99_0.emit(v25.ConversationMessageReplyIconImpression, l_v107_0);
            end;
        end, {
            v99, 
            v107
        });
        v85 = l_useNavigation_0();
        v86 = v9(v71.conversationId);
        local v113 = nil;
        if v86 and v86.messages then
            v113 = v86.messages:Get(v71.messageId);
        end;
        local v114 = v35();
        v87 = l_useLocalUserId_0();
        do
            local l_v113_0 = v113;
            if v57 then
                local l_v100_0 = v100 --[[ copy: 30 -> 67 ]];
                local v117 = v6.useCallback(function() --[[ Line: 266 ]]
                    -- upvalues: v54 (ref), v72 (copy), l_v100_0 (copy), l_HapticFeedbackContext_0 (ref), l_HapticFeedbackType_0 (ref)
                    if not v54 or not v72 then
                        l_v100_0(l_HapticFeedbackContext_0.Default, l_HapticFeedbackType_0.Press);
                    end;
                end, {});
                local l_v99_1 = v99 --[[ copy: 29 -> 68 ]];
                local l_v107_1 = v107 --[[ copy: 35 -> 69 ]];
                local l_v114_0 = v114 --[[ copy: 37 -> 70 ]];
                local v121 = v6.useCallback(function() --[[ Line: 272 ]]
                    -- upvalues: v25 (ref), l_v99_1 (copy), l_v107_1 (copy), v54 (ref), v72 (copy), l_v114_0 (copy), l_v113_0 (ref)
                    if v25.ConversationMessageSwiped then
                        l_v99_1.emit(v25.ConversationMessageSwiped, l_v107_1);
                    end;
                    if not v54 or not v72 then
                        l_v114_0(l_v113_0);
                    end;
                end, {
                    v114, 
                    l_v113_0, 
                    v99, 
                    v107
                });
                v88 = v41({
                    onSwipeThresholdReached = v117, 
                    onSwipeComplete = v121, 
                    direction = v89.direction
                });
            end;
            local v122 = v6.useCallback(function() --[[ Line: 288 ]]
                -- upvalues: v85 (ref), v13 (ref), v71 (copy)
                v85.navigate(v13.MessageContextMenu, {
                    messageId = v71.messageId, 
                    conversationId = v71.conversationId, 
                    inputBoxRef = v71.inputBoxRef
                });
            end, {
                v85.navigate, 
                v71.messageId, 
                v71.conversationId, 
                v71.inputBoxRef
            });
            local v128 = v6.useCallback(function(v123, v124, v125) --[[ Line: 297 ]]
                -- upvalues: v52 (ref), v98 (copy), l_setTimeout_0 (ref), v53 (ref), v96 (ref)
                if v52 and v124 then
                    v98.current = Vector2.new(v124.Position.X, v124.Position.Y);
                end;
                l_setTimeout_0(function() --[[ Line: 301 ]]
                    -- upvalues: v52 (ref), v124 (copy), v98 (ref), v53 (ref), v96 (ref), v123 (copy)
                    local v126 = 0;
                    if v52 and v124 then
                        local l_current_0 = v98.current;
                        v126 = (Vector2.new(v124.Position.X, v124.Position.Y) - l_current_0).Magnitude;
                    end;
                    if v124 and (v124.UserInputState == Enum.UserInputState.Begin or v124.UserInputState == Enum.UserInputState.Change) and (not v52 or v126 < v53) then
                        v96(v123, v124);
                    end;
                end, v125);
            end, {
                v96
            });
            local l_v102_0 = v102 --[[ copy: 32 -> 58 ]];
            local l_v99_2 = v99 --[[ copy: 29 -> 59 ]];
            local l_v107_2 = v107 --[[ copy: 35 -> 60 ]];
            local l_v100_1 = v100 --[[ copy: 30 -> 61 ]];
            local l_v104_1 = v104 --[[ copy: 34 -> 62 ]];
            local l_v122_0 = v122 --[[ copy: 38 -> 63 ]];
            local l_v128_0 = v128 --[[ copy: 39 -> 64 ]];
            local l_v103_1 = v103 --[[ copy: 33 -> 65 ]];
            local l_v114_1 = v114 --[[ copy: 37 -> 66 ]];
            v96 = v6.useCallback(function(v138, v139, v140) --[[ Line: 324 ]]
                -- upvalues: v71 (copy), l_UserInputService_0 (ref), v6 (ref), l_v102_0 (copy), v25 (ref), l_v99_2 (copy), l_v107_2 (copy), v54 (ref), v72 (copy), v57 (ref), l_v100_1 (copy), l_HapticFeedbackContext_0 (ref), l_HapticFeedbackType_0 (ref), l_v104_1 (copy), v48 (ref), l_v122_0 (copy), l_v128_0 (copy), v12 (ref), v52 (ref), v84 (ref), l_v103_1 (copy), v27 (ref), v11 (ref), l_v114_1 (copy), l_v113_0 (ref)
                if v71.isPending then
                    return;
                else
                    if l_UserInputService_0.MouseEnabled then
                        if v138 == v6.Event.MouseEnter then
                            l_v102_0(true);
                        end;
                        if v138 == v6.Event.MouseLeave then
                            l_v102_0(false);
                        end;
                        if v138 == v6.Event.MouseButton1Down then
                            v71.closeKeyboard();
                        end;
                    end;
                    if l_UserInputService_0.GamepadEnabled or l_UserInputService_0.TouchEnabled or v71.unitTestTouchEnabled then
                        if v138 == v6.Event.TouchLongPress then
                            if v25.ConversationMessageLongPressed then
                                l_v99_2.emit(v25.ConversationMessageLongPressed, l_v107_2);
                            end;
                            if not v54 or not v72 then
                                if not v57 then
                                    l_v100_1(l_HapticFeedbackContext_0.Default, l_HapticFeedbackType_0.Release);
                                end;
                                l_v104_1(true);
                                if v48 then
                                    l_v122_0();
                                end;
                                l_v128_0(v6.Event.InputEnded, v139, v12.PEEK_VIEW_ANIMATION_MILLISEC);
                            end;
                        end;
                        if v138 == v6.Event.InputBegan and v139 then
                            if v25.ConversationMessagePressed then
                                l_v99_2.emit(v25.ConversationMessagePressed, l_v107_2);
                            end;
                            if not v54 or not v72 then
                                if not v52 then
                                    l_v100_1(l_HapticFeedbackContext_0.Default, l_HapticFeedbackType_0.Press);
                                    v84(true);
                                end;
                                if not l_v103_1 then
                                    v27.dismiss();
                                end;
                            end;
                            l_v128_0(v6.Event.TouchLongPress, v139, v12.LONG_PRESS_DELAY_MILLISEC);
                        end;
                        if not v52 and v138 == v6.Event.InputEnded then
                            v84(false);
                        end;
                        if v138 == v6.Event.TouchTap then
                            v71.closeKeyboard();
                        end;
                    end;
                    if v138 == v6.Event.Activated then
                        v27.dismiss();
                        if v140 == v11.MessageContextMenu then
                            if v25.ConversationMessageOpenMenuIconClicked then
                                l_v99_2.emit(v25.ConversationMessageOpenMenuIconClicked, l_v107_2);
                            end;
                            l_v122_0();
                        end;
                        if v140 == v11.Reply then
                            if v25.ConversationMessageReplyIconClicked then
                                l_v99_2.emit(v25.ConversationMessageReplyIconClicked, l_v107_2);
                            end;
                            l_v100_1(l_HapticFeedbackContext_0.Default, l_HapticFeedbackType_0.Press);
                            l_v114_1(l_v113_0);
                        end;
                    end;
                    return;
                end;
            end, {
                v71.isPending, 
                v71.unitTestTouchEnabled, 
                l_UserInputService_0.MouseEnabled, 
                l_UserInputService_0.TouchEnabled, 
                v128, 
                v102, 
                v104, 
                v84, 
                v99, 
                v122, 
                v114, 
                v100, 
                v72
            });
            v92 = v6.useCallback(function(v141, v142) --[[ Line: 438 ]]
                -- upvalues: v57 (ref), l_UserInputService_0 (ref), v88 (ref), l_MessageFtuxTooltipDismissSignal_0 (ref), l_MessageFtuxTooltipVariant_0 (ref), l_v128_0 (copy), v6 (ref), v12 (ref)
                if v57 and l_UserInputService_0.TouchEnabled and v88 then
                    v88.onInputBegan(v141, v142);
                    l_MessageFtuxTooltipDismissSignal_0.dismiss(l_MessageFtuxTooltipVariant_0.Replies);
                end;
                l_v128_0(v6.Event.InputBegan, v142, v12.INPUT_BEGAN_DELAY_MILLISEC);
            end, {
                v128, 
                v88
            });
            v93 = v6.useCallback(function(_) --[[ Line: 447 ]]
                -- upvalues: v96 (ref), v6 (ref)
                v96(v6.Event.InputEnded);
            end, {
                v96
            });
            v90 = v6.useCallback(function(_) --[[ Line: 451 ]]
                -- upvalues: v96 (ref), v6 (ref)
                v96(v6.Event.MouseEnter);
            end, {
                v96
            });
            v91 = v6.useCallback(function(_) --[[ Line: 455 ]]
                -- upvalues: v96 (ref), v6 (ref)
                v96(v6.Event.MouseLeave);
            end, {
                v96
            });
            v94 = v6.useCallback(function(_) --[[ Line: 459 ]]
                -- upvalues: v96 (ref), v6 (ref)
                v96(v6.Event.TouchTap);
            end, {
                v96
            });
            v95 = v6.useCallback(function(_) --[[ Line: 463 ]]
                -- upvalues: v96 (ref), v6 (ref)
                v96(v6.Event.MouseButton1Down);
            end, {
                v96
            });
        end;
    end;
    local v148 = v34() and v71.repliesTo and v71.repliesTo.senderTargetId;
    local function v154(v149, v150) --[[ Line: 470 ]] --[[ Name: getDisplayNameText ]]
        -- upvalues: v87 (ref), v71 (copy), v148 (copy), v86 (ref), v18 (ref)
        local v151 = v87 == v71.senderUserId;
        local v152 = v71.senderUserId == v71.repliesTo.senderTargetId;
        local v153 = v87 == v71.repliesTo.senderTargetId;
        if not v148 then
            return v149;
        elseif v151 and v152 then
            return "Feature.Chat.Label.YouRepliedToYou";
        else
            if v86.conversationType == v18.Type.ONE_TO_ONE_CONVERSATION then
                if v151 and not v152 then
                    return "Feature.Chat.Label.OneToOne.YouRepliedToThem";
                elseif not v151 and v153 then
                    return "Feature.Chat.Label.OneToOne.ThemRepliedToYou";
                elseif not v151 and v152 then
                    return "Feature.Chat.Label.OneToOne.ThemRepliedToThem";
                end;
            end;
            if v86.conversationType == v18.Type.MULTI_USER_CONVERSATION then
                if v151 and not v152 then
                    return {
                        "Feature.Chat.Label.Group.YouRepliedToThem"; 
                        DISPLAY_NAME = v150
                    };
                elseif not v151 and v153 then
                    return {
                        "Feature.Chat.Label.Group.ThemRepliedToYou"; 
                        DISPLAY_NAME = v149
                    };
                elseif not v151 and v152 then
                    return {
                        "Feature.Chat.Label.Group.ThemRepliedToThem"; 
                        DISPLAY_NAME = v149
                    };
                elseif not v151 and not v153 then
                    return {
                        "Feature.Chat.Label.Group.ThemRepliedToOther"; 
                        DISPLAY_NAME_1 = v149, 
                        DISPLAY_NAME_2 = v150
                    };
                end;
            end;
            return v71.unknownUserKey;
        end;
    end;
    local v155 = {
        v71.senderUserId
    };
    if v148 then
        table.insert(v155, v71.repliesTo.senderTargetId);
    end;
    local v156 = v24.Hooks.useUserProfilesFetch({
        userIds = v155, 
        query = v24.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v157 = nil;
    local v158 = nil;
    if v156.data then
        v158 = false;
        local v159 = v24.Selectors.getCombinedNameFromId(v156.data, v71.senderUserId) or v71.unknownUserKey;
        v157 = if v148 then v154(v159, v24.Selectors.getCombinedNameFromId(v156.data, v71.repliesTo.senderTargetId) or v71.unknownUserKey) else v159;
    else
        v158 = true;
        v157 = nil;
    end;
    local v160 = l_useLocalization_0(if v148 then {
        displayName = v157
    } else {}).displayName or v157;
    local v163 = v6.useCallback(function() --[[ Line: 562 ]]
        -- upvalues: v71 (copy), v12 (ref), l_TextService_0 (ref), v160 (ref), v74 (copy)
        local v161 = Vector2.new(math.max(1, v71.messageMaxWidth - v12.TAIL_WIDTH), 1e999);
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v160, v74.Font.BaseSize * v74.Font.Footer.RelativeSize, v74.Font.Footer.Font, v161);
        return UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y);
    end, {
        v74.Font.BaseSize * v74.Font.Footer.RelativeSize, 
        v74.Font.Footer.Font, 
        v71.messageMaxWidth - v12.TAIL_WIDTH, 
        v160
    });
    local v164 = 0;
    if not v71.showDateTime then
        v164 = (if not not v71.isNewSender or v148 then v12.CHAT_MESSAGE_MAX_SPACE else v12.CHAT_MESSAGE_MIN_SPACE) + v71.messageTypePaddingOffset;
    end;
    local l_left_0 = v76.left;
    local v166 = l_left_0 + if l_FFlagAppChatEnableConversationUserTileAvatars_0 then v80.Size.Size_700 else v12.THUMBNAIL_SIZE;
    local v167 = v71.isIncoming and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right;
    local v168, v169 = v6.useState(false);
    local v171 = v6.useCallback(function() --[[ Line: 591 ]]
        -- upvalues: v33 (ref), v169 (copy)
        if v33() then
            v169(function(v170) --[[ Line: 593 ]]
                return not v170;
            end);
        end;
    end, {
        v169
    });
    local v172 = v168 or v71.moderated or v71.filteredForReceivers or v54 and v72;
    local v173 = if v168 then v71.messageId else if v54 and v72 then v71.messageHiddenNoticeText else v71.moderated and v71.messageModeratedNoticeText or v71.messageDefaultNoticeText;
    local v174 = v6.useMemo(function() --[[ Line: 608 ]]
        -- upvalues: v46 (ref), v6 (ref), v15 (ref), v80 (copy), v71 (copy), v12 (ref), v74 (copy)
        if v46 then
            return (v6.createElement(v15.Icon, {
                name = v15.Enums.IconName.TriangleExclamation, 
                size = v15.Enums.IconSize.Large, 
                style = v80.Color.System.Alert, 
                LayoutOrder = v71.isIncoming and 0 or 3
            }));
        else
            return (v6.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = v12.ALERT_ICON_IMAGE, 
                ImageColor3 = v74.Theme.Alert.Color, 
                ImageTransparency = v74.Theme.Alert.Transparency, 
                LayoutOrder = v71.isIncoming and 2 or 1, 
                Size = UDim2.new(0, v12.ALERT_ICON_SIZE, 0, v12.ALERT_ICON_SIZE)
            }));
        end;
    end, {
        v80, 
        v74, 
        v71.isIncoming
    });
    local v175 = nil;
    v175 = if not not v71.failed or v71.moderated then v174 else if v81 then v6.createElement(v10, {
        LayoutOrder = v71.isIncoming and 2 or 1, 
        isIncoming = v71.isIncoming, 
        handleEvent = v96, 
        emitImpressionTelemetryEvent = v82
    }) else nil;
    local v176 = not v34() or v71.isIncoming;
    local v179 = if v57 and v88 and v88.swipeProgress then v88.swipeProgress:map(function(v177) --[[ Line: 645 ]]
        -- upvalues: v80 (copy)
        local v178 = 1 - math.pow(v177, 3);
        return {
            Color3 = v80.Semantic.Color.Icon.Default.Color3, 
            Transparency = v178
        };
    end) else nil;
    local v182 = if v57 and v88 and v88.swipeOffset then v88.swipeOffset:map(function(v180) --[[ Line: 658 ]]
        -- upvalues: v89 (ref), v32 (ref)
        local v181 = if v89.direction == v32.Right then v180 else -v180;
        return UDim2.new(0, v181, 0, 0);
    end) else nil;
    local v184 = if v57 and v88 and v88.swipeProgress then v88.swipeProgress:map(function(v183) --[[ Line: 668 ]]
        -- upvalues: v89 (ref)
        return v89.messagePosition + UDim2.new(0, v183 * v89.iconOffset, 0, 0);
    end) else nil;
    local function v186() --[[ Line: 674 ]] --[[ Name: renderMessage ]]
        -- upvalues: v6 (ref), v57 (ref), v182 (copy), v90 (ref), v91 (ref), v164 (ref), v71 (copy), l_left_0 (copy), v166 (copy), v76 (copy), v46 (ref), v12 (ref), v167 (copy), l_FFlagAppChatEnableConversationUserTileAvatars_0 (ref), v15 (ref), l_UserTile_0 (ref), l_LayoutMode_0 (ref), v59 (ref), v79 (copy), v77 (copy), l_UserPresence_0 (ref), v73 (copy), v74 (copy), v45 (ref), v47 (ref), v80 (copy), l_shouldShowName_0 (copy), v176 (copy), v148 (copy), v158 (ref), v163 (copy), v160 (ref), l_Skeleton_0 (ref), v34 (ref), v174 (copy), v92 (ref), v93 (ref), v94 (ref), v95 (ref), v83 (ref), v175 (ref), v97 (copy), v51 (ref), v54 (ref), v72 (copy), l_MessageFtuxTooltip_0 (ref), l_MessageFtuxTooltipVariant_0 (ref), v89 (ref), v184 (copy), v179 (copy)
        local v185 = v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 0), 
            Position = if v57 then v182 else nil, 
            [v6.Event.MouseEnter] = v90, 
            [v6.Event.MouseLeave] = v91
        }, {
            Padding = v6.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v164), 
                PaddingLeft = UDim.new(0, v71.thumbnail and l_left_0 or v166), 
                PaddingRight = UDim.new(0, v76.right - (v46 and 0 or v12.TAIL_WIDTH))
            }), 
            Layout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = v167
            }), 
            AvatarContainer = if v71.thumbnail then if l_FFlagAppChatEnableConversationUserTileAvatars_0 then v6.createElement(v15.View, {
                tag = {
                    ["col auto-x size-0-full"] = true, 
                    ["align-y-bottom"] = v46, 
                    ["align-y-top"] = not v46
                }, 
                LayoutOrder = 1
            }, {
                Avatar = v6.createElement(v15.View, {
                    tag = "size-700-700"
                }, {
                    AvatarCircle = v6.createElement(l_UserTile_0, {
                        userId = v71.senderUserId, 
                        layoutMode = l_LayoutMode_0.compact, 
                        userPresenceType = if v59 and v79 then v77.presence else l_UserPresence_0.None, 
                        layoutOrder = 1, 
                        onActivated = v73
                    })
                })
            }) else v6.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundTransparency = v74.Tokens.Global.Color.None.Transparency, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, v12.THUMBNAIL_SIZE, 1, 0)
            }, {
                Avatar = v71.thumbnail and v6.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = v74.Tokens.Global.Color.None.Transparency, 
                    Size = UDim2.new(0, v12.THUMBNAIL_SIZE, 0, v12.THUMBNAIL_SIZE), 
                    Position = if v46 then UDim2.new(0, 0, 1, -v12.THUMBNAIL_SIZE) else UDim2.new(0, 0, 0, 0)
                }, {
                    AvatarCircle = v6.createElement(v45, {
                        circleColor3 = v71.BackgroundColor3 or v74.Theme.BackgroundDefault.Color, 
                        circleTransparency = v74.Tokens.Global.Color.None.Transparency, 
                        circleInteriorTransparency = v74.Tokens.Global.Color.None.Transparency, 
                        circleInteriorBackgroundColor3 = v71.BackgroundColor3 or v74.Theme.BackgroundDefault.Color, 
                        onActivated = v73, 
                        thumbnails = {
                            v71.thumbnail
                        }
                    })
                }) or nil
            }) else nil, 
            MessageWithDisplayName = v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                AutomaticSize = if not not v46 or v47 then Enum.AutomaticSize.Y else nil, 
                Size = UDim2.new(1, v71.isIncoming and -v166 or 0, 0, 0)
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = v167
                }), 
                Padding = v6.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v71.isIncoming and (if l_FFlagAppChatEnableConversationUserTileAvatars_0 then v80.Size.Size_200 else v12.AVATAR_MESSAGE_GAP) or 0)
                }), 
                DisplayNameContainer = l_shouldShowName_0 and v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, v71.messageMaxWidth - v12.TAIL_WIDTH, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 1
                }, {
                    Padding = v6.createElement("UIPadding", {
                        PaddingLeft = if v46 then UDim.new(0, v12.GROUPED_MESSAGE_DISPLAY_NAME_LEFT_PADDING) else if v176 then UDim.new(0, v12.TAIL_WIDTH) else UDim.new(0, 0), 
                        PaddingRight = if v176 then UDim.new(0, 0) else UDim.new(0, v12.TAIL_WIDTH), 
                        PaddingBottom = if v148 then UDim.new(0, v12.REPLIED_DISPLAY_NAME_BOTTOM_PADDING) else if v46 then UDim.new(0, v12.GROUPED_MESSAGE_DISPLAY_NAME_BOTTOM_PADDING) else nil
                    }), 
                    DisplayName = if not v158 then v6.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Font = v74.Font.Footer.Font, 
                        Size = v163(), 
                        AnchorPoint = if v176 then Vector2.new(0, 0) else Vector2.new(1, 0), 
                        Position = if v176 then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0), 
                        Text = v160, 
                        TextColor3 = v74.Theme.TextDefault.Color, 
                        TextSize = v74.Font.BaseSize * v74.Font.Footer.RelativeSize, 
                        TextTransparency = v74.Theme.TextDefault.Transparency, 
                        TextXAlignment = if v176 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right, 
                        TextYAlignment = Enum.TextYAlignment.Top
                    }) else nil, 
                    ShimmerName = if v158 then v6.createElement(l_Skeleton_0, {
                        AnchorPoint = if v176 then Vector2.new(0, 0) else Vector2.new(1, 0), 
                        Position = if v176 then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0), 
                        Size = UDim2.new(0, v12.SHIMMER_WIDTH, 0, v12.SHIMMER_HEIGHT), 
                        LayoutOrder = 2
                    }) else nil
                }), 
                MessageWithIcons = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, v71.isIncoming and -v166 or 0, 0, 0)
                }, {
                    Layout = v6.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = v167, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 10), 
                        ItemLineAlignment = if v46 then Enum.ItemLineAlignment.Center else nil
                    }), 
                    AlertIcon = if not v34() and (v71.failed or v71.moderated) then v174 else nil, 
                    Message = v71.renderMessage({
                        LayoutOrder = v71.isIncoming and 1 or 2, 
                        [v6.Event.InputBegan] = v92, 
                        [v6.Event.InputEnded] = v93, 
                        [v6.Event.TouchTap] = v94, 
                        [v6.Event.MouseButton1Down] = v95
                    }, if v34() then {
                        isPressed = v83, 
                        Icons = v175, 
                        ref = v97
                    } else nil), 
                    MessageFtuxTooltip = if not (v51 and v34() and v71.isLastIncomingChatMessage) or v54 and v72 then nil else v6.createElement(l_MessageFtuxTooltip_0, {
                        variant = l_MessageFtuxTooltipVariant_0.Replies, 
                        messageRef = v97, 
                        isReversed = v71.isIncoming
                    })
                })
            })
        });
        if v57 and (not v54 or not v72) then
            return v6.createElement(v15.View, {
                tag = "size-full-0 auto-y", 
                ClipsDescendants = false, 
                LayoutOrder = 2, 
                ZIndex = 2
            }, {
                ReplyIconFilled = v6.createElement(v15.Icon, {
                    name = v89.iconName, 
                    size = v15.Enums.IconSize.Medium, 
                    variant = v15.Enums.IconVariant.Filled, 
                    AnchorPoint = v89.iconAnchorPoint, 
                    Position = v184, 
                    style = v179, 
                    ZIndex = 1
                }), 
                Content = v185
            });
        else
            return v185;
        end;
    end;
    v6.useEffect(function() --[[ Line: 894 ]]
        -- upvalues: v49 (ref), v71 (copy), l_IXPService_0 (ref), v50 (ref)
        if v49 and v71.isLastIncomingChatMessage then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v50);
        end;
    end, {
        v71.isLastIncomingChatMessage
    });
    return v6.createElement(v69, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        Text = v33() and "" or nil, 
        [v6.Event.Activated] = if v33() then v171 else nil
    }, {
        Layout = v6.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = v167, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        DateTime = v71.showDateTime and v6.createElement(v23, {
            LayoutOrder = 1, 
            Text = v71.sent:GetLongRelativeTime(), 
            maxWidth = v12.DATETIME_MAX_WIDTH
        }), 
        MessageWithAvatar = v186(), 
        Notice = v172 and v6.createElement(v22, {
            Font = v71.Font, 
            HorizontalAlignment = v167, 
            LayoutOrder = 3, 
            Text = v173, 
            TextColor3 = if v54 and v72 then v80.Color.Content.Muted.Color3 else v71.moderated and v74.Theme.Alert.Color or v74.Theme.UIDefault.Color, 
            TextTransparency = if v54 and v72 then v80.Color.Content.Muted.Transparency else v71.moderated and v74.Theme.Alert.Transparency or v74.Theme.UIDefault.Transparency, 
            TextXAlignment = v71.isIncoming and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right, 
            TextSize = if v46 then v80.Typography.CaptionSmall.FontSize else nil, 
            margin = {
                top = if v46 then v80.Padding.Small else 0, 
                left = v71.isIncoming and v166 + v12.NOTICE_HORIZONTAL_PADDING or 0, 
                right = not v71.isIncoming and v76.right or 0, 
                bottom = 0
            }, 
            maxWidth = v71.parentWidth, 
            width = UDim.new(1, v71.isIncoming and -v166 or 0)
        }), 
        debug = v71.debugElement or nil
    });
end;
return ChatMessageContainer;