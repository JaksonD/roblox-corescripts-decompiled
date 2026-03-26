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
local v60 = UDim2.new(0, 0, 0.5, 0);
local v61 = UDim2.new(1, 0, 0.5, 0);
local v62 = Vector2.new(0, 0.5);
local v63 = Vector2.new(1, 0.5);
local v64 = {
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
    openViewProfile = function() --[[ Line: 94 ]] --[[ Name: openViewProfile ]]
        -- upvalues: v21 (copy)
        v21:warning("openViewProfile was not passed to ChatMessage");
    end, 
    renderMessage = function() --[[ Line: 97 ]] --[[ Name: renderMessage ]]
        -- upvalues: v21 (copy)
        v21:warning("renderMessage was not passed to ChatMessage");
    end, 
    closeKeyboard = function() --[[ Line: 100 ]] --[[ Name: closeKeyboard ]]

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
local v65 = v33() and "TextButton" or "Frame";
ChatMessageContainer = function(v66) --[[ Line: 115 ]] --[[ Name: ChatMessageContainer ]]
    -- upvalues: v14 (copy), v64 (copy), v51 (copy), v52 (copy), v6 (copy), l_useStyle_0 (copy), v20 (copy), v54 (copy), v9 (copy), v18 (copy), v56 (copy), l_IXPService_0 (copy), v57 (copy), v15 (copy), v53 (copy), v58 (copy), v32 (copy), v60 (copy), v61 (copy), v59 (copy), v62 (copy), v63 (copy), v34 (copy), v37 (copy), v26 (copy), l_useTriggerFeedback_0 (copy), v27 (copy), v48 (copy), l_MessageFtuxTooltipDismissSignal_0 (copy), l_MessageFtuxTooltipVariant_0 (copy), v25 (copy), l_useNavigation_0 (copy), v35 (copy), l_useLocalUserId_0 (copy), l_HapticFeedbackContext_0 (copy), l_HapticFeedbackType_0 (copy), v41 (copy), v13 (copy), v49 (copy), l_setTimeout_0 (copy), v50 (copy), l_UserInputService_0 (copy), v45 (copy), v12 (copy), v11 (copy), v24 (copy), l_useLocalization_0 (copy), l_TextService_0 (copy), v33 (copy), v10 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), v55 (copy), l_UserPresence_0 (copy), l_Skeleton_0 (copy), l_MessageFtuxTooltip_0 (copy), v46 (copy), v47 (copy), v65 (copy), v23 (copy), v22 (copy)
    local v67 = v14.Dictionary.join(v64, v66);
    local v68 = if v51 and v67.visibility then v67.visibility == v52.VisibilityTypes.Hidden else false;
    local v69 = v6.useCallback(function() --[[ Line: 122 ]]
        -- upvalues: v67 (copy)
        if v67.viewProfileOnAvatarPressed then
            v67.openViewProfile(v67.senderUserId);
        end;
    end, {
        v67.senderUserId
    });
    local v70 = l_useStyle_0();
    local l_shouldShowName_0 = v67.shouldShowName;
    local v72 = v20();
    local v73 = v54(v67.senderUserId or "");
    local v74 = v9(v67.conversationId or "");
    local v75 = v74 and v74.conversationType == v18.Type.MULTI_USER_CONVERSATION;
    v6.useEffect(function() --[[ Line: 136 ]]
        -- upvalues: v56 (ref), l_IXPService_0 (ref), v57 (ref)
        if v56 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v57);
        end;
    end, {});
    local v76 = v15.Hooks.useTokens();
    local v77 = nil;
    local v78 = nil;
    local v79 = nil;
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    if v53 then
        v85 = v6.useMemo(function() --[[ Line: 153 ]]
            -- upvalues: v58 (ref), v67 (copy), v32 (ref), v15 (ref), v60 (ref), v61 (ref), v59 (ref), v62 (ref), v63 (ref)
            if v58 then
                return {
                    direction = if v67.isIncoming then v32.Right else v32.Left, 
                    iconName = if v67.isIncoming then v15.Enums.IconName.ArrowThickToRight else v15.Enums.IconName.ArrowThickToLeft, 
                    messagePosition = if v67.isIncoming then v60 else v61, 
                    iconOffset = if v67.isIncoming then v59 else -v59, 
                    iconAnchorPoint = if v67.isIncoming then v62 else v63
                };
            else
                return {
                    direction = v32.Right, 
                    iconName = v15.Enums.IconName.ArrowThickToRight, 
                    messagePosition = v60, 
                    iconOffset = v59, 
                    iconAnchorPoint = v62
                };
            end;
        end, {});
    end;
    local v86 = nil;
    local v87 = nil;
    local v88 = nil;
    local v89 = nil;
    local v90 = nil;
    local v91 = nil;
    local v92 = nil;
    local v93 = v6.useRef(nil);
    local v94 = v6.useRef(Vector2.zero);
    if v34() then
        local v95 = v37(v26.Context);
        local v96 = l_useTriggerFeedback_0();
        local v97, v98 = v6.useState(false);
        v79 = v97;
        v80 = v98;
        v97, v98 = v6.useState(false);
        local v99, v100 = v6.useState(false);
        local l_v100_0 = v100 --[[ copy: 34 -> 53 ]];
        v6.useEffect(function() --[[ Line: 194 ]]
            -- upvalues: v27 (ref), l_v100_0 (copy)
            local v102 = v27.dismissed:connect(function() --[[ Line: 195 ]]
                -- upvalues: l_v100_0 (ref)
                l_v100_0(false);
            end);
            return function() --[[ Line: 198 ]]
                -- upvalues: v102 (copy)
                v102:disconnect();
            end;
        end);
        local v103 = v6.useMemo(function() --[[ Line: 204 ]]
            -- upvalues: v67 (copy), v51 (ref)
            return {
                conversationId = v67.conversationId, 
                targetMessageSenderId = v67.senderUserId, 
                targetMessageId = v67.messageId, 
                targetMessageSentAt = if v67.sent then v67.sent.dateTime else nil, 
                targetMessageLength = if v67.content then #v67.content else nil, 
                targetMessageVisibility = if v51 then v67.visibility else nil
            };
        end, {
            v67.conversationId, 
            v67.senderUserId, 
            v67.messageId, 
            v67.sent, 
            v67.content, 
            if v51 then v67.visibility else nil
        });
        local l_v97_0 = v97 --[[ copy: 31 -> 54 ]];
        local l_v99_0 = v99 --[[ copy: 33 -> 55 ]];
        v77 = v6.useMemo(function() --[[ Line: 224 ]]
            -- upvalues: v51 (ref), v68 (copy), l_v97_0 (copy), v53 (ref), l_v99_0 (copy)
            local v106;
            if v51 then
                v106 = not v68;
                if v106 then
                    v106 = l_v97_0;
                    if not v106 then
                        v106 = not v53;
                        if v106 then
                            return l_v99_0;
                        end;
                    end;
                end;
            else
                v106 = l_v97_0 or not v53 and l_v99_0;
            end;
            return v106;
        end, {
            v97, 
            v99, 
            v68
        });
        v6.useEffect(function() --[[ Line: 231 ]]
            -- upvalues: v48 (ref), v77 (ref), v67 (copy), l_MessageFtuxTooltipDismissSignal_0 (ref), l_MessageFtuxTooltipVariant_0 (ref)
            if v48 and v77 and v67.isLastIncomingChatMessage then
                l_MessageFtuxTooltipDismissSignal_0.dismiss(l_MessageFtuxTooltipVariant_0.Replies);
            end;
        end, {
            v77, 
            v67.isLastIncomingChatMessage
        });
        local l_v95_0 = v95 --[[ copy: 29 -> 56 ]];
        local l_v103_0 = v103 --[[ copy: 35 -> 57 ]];
        v78 = v6.useCallback(function() --[[ Line: 236 ]]
            -- upvalues: v25 (ref), l_v95_0 (copy), l_v103_0 (copy)
            if v25.ConversationMessageReplyIconImpression then
                l_v95_0.emit(v25.ConversationMessageReplyIconImpression, l_v103_0);
            end;
        end, {
            v95, 
            v103
        });
        v81 = l_useNavigation_0();
        v82 = v9(v67.conversationId);
        local v109 = nil;
        if v82 and v82.messages then
            v109 = v82.messages:Get(v67.messageId);
        end;
        local v110 = v35();
        v83 = l_useLocalUserId_0();
        do
            local l_v109_0 = v109;
            if v53 then
                local l_v96_0 = v96 --[[ copy: 30 -> 67 ]];
                local v113 = v6.useCallback(function() --[[ Line: 256 ]]
                    -- upvalues: v51 (ref), v68 (copy), l_v96_0 (copy), l_HapticFeedbackContext_0 (ref), l_HapticFeedbackType_0 (ref)
                    if not v51 or not v68 then
                        l_v96_0(l_HapticFeedbackContext_0.Default, l_HapticFeedbackType_0.Press);
                    end;
                end, {});
                local l_v95_1 = v95 --[[ copy: 29 -> 68 ]];
                local l_v103_1 = v103 --[[ copy: 35 -> 69 ]];
                local l_v110_0 = v110 --[[ copy: 37 -> 70 ]];
                local v117 = v6.useCallback(function() --[[ Line: 262 ]]
                    -- upvalues: v25 (ref), l_v95_1 (copy), l_v103_1 (copy), v51 (ref), v68 (copy), l_v110_0 (copy), l_v109_0 (ref)
                    if v25.ConversationMessageSwiped then
                        l_v95_1.emit(v25.ConversationMessageSwiped, l_v103_1);
                    end;
                    if not v51 or not v68 then
                        l_v110_0(l_v109_0);
                    end;
                end, {
                    v110, 
                    l_v109_0, 
                    v95, 
                    v103
                });
                v84 = v41({
                    onSwipeThresholdReached = v113, 
                    onSwipeComplete = v117, 
                    direction = v85.direction
                });
            end;
            local v118 = v6.useCallback(function() --[[ Line: 278 ]]
                -- upvalues: v81 (ref), v13 (ref), v67 (copy)
                v81.navigate(v13.MessageContextMenu, {
                    messageId = v67.messageId, 
                    conversationId = v67.conversationId, 
                    inputBoxRef = v67.inputBoxRef
                });
            end, {
                v81.navigate, 
                v67.messageId, 
                v67.conversationId, 
                v67.inputBoxRef
            });
            local v124 = v6.useCallback(function(v119, v120, v121) --[[ Line: 287 ]]
                -- upvalues: v49 (ref), v94 (copy), l_setTimeout_0 (ref), v50 (ref), v92 (ref)
                if v49 and v120 then
                    v94.current = Vector2.new(v120.Position.X, v120.Position.Y);
                end;
                l_setTimeout_0(function() --[[ Line: 291 ]]
                    -- upvalues: v49 (ref), v120 (copy), v94 (ref), v50 (ref), v92 (ref), v119 (copy)
                    local v122 = 0;
                    if v49 and v120 then
                        local l_current_0 = v94.current;
                        v122 = (Vector2.new(v120.Position.X, v120.Position.Y) - l_current_0).Magnitude;
                    end;
                    if v120 and (v120.UserInputState == Enum.UserInputState.Begin or v120.UserInputState == Enum.UserInputState.Change) and (not v49 or v122 < v50) then
                        v92(v119, v120);
                    end;
                end, v121);
            end, {
                v92
            });
            local l_v98_0 = v98 --[[ copy: 32 -> 58 ]];
            local l_v95_2 = v95 --[[ copy: 29 -> 59 ]];
            local l_v103_2 = v103 --[[ copy: 35 -> 60 ]];
            local l_v96_1 = v96 --[[ copy: 30 -> 61 ]];
            local l_v100_1 = v100 --[[ copy: 34 -> 62 ]];
            local l_v118_0 = v118 --[[ copy: 38 -> 63 ]];
            local l_v124_0 = v124 --[[ copy: 39 -> 64 ]];
            local l_v99_1 = v99 --[[ copy: 33 -> 65 ]];
            local l_v110_1 = v110 --[[ copy: 37 -> 66 ]];
            v92 = v6.useCallback(function(v134, v135, v136) --[[ Line: 314 ]]
                -- upvalues: v67 (copy), l_UserInputService_0 (ref), v6 (ref), l_v98_0 (copy), v25 (ref), l_v95_2 (copy), l_v103_2 (copy), v51 (ref), v68 (copy), v53 (ref), l_v96_1 (copy), l_HapticFeedbackContext_0 (ref), l_HapticFeedbackType_0 (ref), l_v100_1 (copy), v45 (ref), l_v118_0 (copy), l_v124_0 (copy), v12 (ref), v49 (ref), v80 (ref), l_v99_1 (copy), v27 (ref), v11 (ref), l_v110_1 (copy), l_v109_0 (ref)
                if v67.isPending then
                    return;
                else
                    if l_UserInputService_0.MouseEnabled then
                        if v134 == v6.Event.MouseEnter then
                            l_v98_0(true);
                        end;
                        if v134 == v6.Event.MouseLeave then
                            l_v98_0(false);
                        end;
                        if v134 == v6.Event.MouseButton1Down then
                            v67.closeKeyboard();
                        end;
                    end;
                    if l_UserInputService_0.GamepadEnabled or l_UserInputService_0.TouchEnabled or v67.unitTestTouchEnabled then
                        if v134 == v6.Event.TouchLongPress then
                            if v25.ConversationMessageLongPressed then
                                l_v95_2.emit(v25.ConversationMessageLongPressed, l_v103_2);
                            end;
                            if not v51 or not v68 then
                                if not v53 then
                                    l_v96_1(l_HapticFeedbackContext_0.Default, l_HapticFeedbackType_0.Release);
                                end;
                                l_v100_1(true);
                                if v45 then
                                    l_v118_0();
                                end;
                                l_v124_0(v6.Event.InputEnded, v135, v12.PEEK_VIEW_ANIMATION_MILLISEC);
                            end;
                        end;
                        if v134 == v6.Event.InputBegan and v135 then
                            if v25.ConversationMessagePressed then
                                l_v95_2.emit(v25.ConversationMessagePressed, l_v103_2);
                            end;
                            if not v51 or not v68 then
                                if not v49 then
                                    l_v96_1(l_HapticFeedbackContext_0.Default, l_HapticFeedbackType_0.Press);
                                    v80(true);
                                end;
                                if not l_v99_1 then
                                    v27.dismiss();
                                end;
                            end;
                            l_v124_0(v6.Event.TouchLongPress, v135, v12.LONG_PRESS_DELAY_MILLISEC);
                        end;
                        if not v49 and v134 == v6.Event.InputEnded then
                            v80(false);
                        end;
                        if v134 == v6.Event.TouchTap then
                            v67.closeKeyboard();
                        end;
                    end;
                    if v134 == v6.Event.Activated then
                        v27.dismiss();
                        if v136 == v11.MessageContextMenu then
                            if v25.ConversationMessageOpenMenuIconClicked then
                                l_v95_2.emit(v25.ConversationMessageOpenMenuIconClicked, l_v103_2);
                            end;
                            l_v118_0();
                        end;
                        if v136 == v11.Reply then
                            if v25.ConversationMessageReplyIconClicked then
                                l_v95_2.emit(v25.ConversationMessageReplyIconClicked, l_v103_2);
                            end;
                            l_v96_1(l_HapticFeedbackContext_0.Default, l_HapticFeedbackType_0.Press);
                            l_v110_1(l_v109_0);
                        end;
                    end;
                    return;
                end;
            end, {
                v67.isPending, 
                v67.unitTestTouchEnabled, 
                l_UserInputService_0.MouseEnabled, 
                l_UserInputService_0.TouchEnabled, 
                v124, 
                v98, 
                v100, 
                v80, 
                v95, 
                v118, 
                v110, 
                v96, 
                v68
            });
            v88 = v6.useCallback(function(v137, v138) --[[ Line: 428 ]]
                -- upvalues: v53 (ref), l_UserInputService_0 (ref), v84 (ref), l_MessageFtuxTooltipDismissSignal_0 (ref), l_MessageFtuxTooltipVariant_0 (ref), l_v124_0 (copy), v6 (ref), v12 (ref)
                if v53 and l_UserInputService_0.TouchEnabled and v84 then
                    v84.onInputBegan(v137, v138);
                    l_MessageFtuxTooltipDismissSignal_0.dismiss(l_MessageFtuxTooltipVariant_0.Replies);
                end;
                l_v124_0(v6.Event.InputBegan, v138, v12.INPUT_BEGAN_DELAY_MILLISEC);
            end, {
                v124, 
                v84
            });
            v89 = v6.useCallback(function(_) --[[ Line: 437 ]]
                -- upvalues: v92 (ref), v6 (ref)
                v92(v6.Event.InputEnded);
            end, {
                v92
            });
            v86 = v6.useCallback(function(_) --[[ Line: 441 ]]
                -- upvalues: v92 (ref), v6 (ref)
                v92(v6.Event.MouseEnter);
            end, {
                v92
            });
            v87 = v6.useCallback(function(_) --[[ Line: 445 ]]
                -- upvalues: v92 (ref), v6 (ref)
                v92(v6.Event.MouseLeave);
            end, {
                v92
            });
            v90 = v6.useCallback(function(_) --[[ Line: 449 ]]
                -- upvalues: v92 (ref), v6 (ref)
                v92(v6.Event.TouchTap);
            end, {
                v92
            });
            v91 = v6.useCallback(function(_) --[[ Line: 453 ]]
                -- upvalues: v92 (ref), v6 (ref)
                v92(v6.Event.MouseButton1Down);
            end, {
                v92
            });
        end;
    end;
    local v144 = v34() and v67.repliesTo and v67.repliesTo.senderTargetId;
    local function v150(v145, v146) --[[ Line: 460 ]] --[[ Name: getDisplayNameText ]]
        -- upvalues: v83 (ref), v67 (copy), v144 (copy), v82 (ref), v18 (ref)
        local v147 = v83 == v67.senderUserId;
        local v148 = v67.senderUserId == v67.repliesTo.senderTargetId;
        local v149 = v83 == v67.repliesTo.senderTargetId;
        if not v144 then
            return v145;
        elseif v147 and v148 then
            return "Feature.Chat.Label.YouRepliedToYou";
        else
            if v82.conversationType == v18.Type.ONE_TO_ONE_CONVERSATION then
                if v147 and not v148 then
                    return "Feature.Chat.Label.OneToOne.YouRepliedToThem";
                elseif not v147 and v149 then
                    return "Feature.Chat.Label.OneToOne.ThemRepliedToYou";
                elseif not v147 and v148 then
                    return "Feature.Chat.Label.OneToOne.ThemRepliedToThem";
                end;
            end;
            if v82.conversationType == v18.Type.MULTI_USER_CONVERSATION then
                if v147 and not v148 then
                    return {
                        "Feature.Chat.Label.Group.YouRepliedToThem"; 
                        DISPLAY_NAME = v146
                    };
                elseif not v147 and v149 then
                    return {
                        "Feature.Chat.Label.Group.ThemRepliedToYou"; 
                        DISPLAY_NAME = v145
                    };
                elseif not v147 and v148 then
                    return {
                        "Feature.Chat.Label.Group.ThemRepliedToThem"; 
                        DISPLAY_NAME = v145
                    };
                elseif not v147 and not v149 then
                    return {
                        "Feature.Chat.Label.Group.ThemRepliedToOther"; 
                        DISPLAY_NAME_1 = v145, 
                        DISPLAY_NAME_2 = v146
                    };
                end;
            end;
            return v67.unknownUserKey;
        end;
    end;
    local v151 = {
        v67.senderUserId
    };
    if v144 then
        table.insert(v151, v67.repliesTo.senderTargetId);
    end;
    local v152 = v24.Hooks.useUserProfilesFetch({
        userIds = v151, 
        query = v24.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v153 = nil;
    local v154 = nil;
    if v152.data then
        v154 = false;
        local v155 = v24.Selectors.getCombinedNameFromId(v152.data, v67.senderUserId) or v67.unknownUserKey;
        v153 = if v144 then v150(v155, v24.Selectors.getCombinedNameFromId(v152.data, v67.repliesTo.senderTargetId) or v67.unknownUserKey) else v155;
    else
        v154 = true;
        v153 = nil;
    end;
    local v156 = l_useLocalization_0(if v144 then {
        displayName = v153
    } else {}).displayName or v153;
    local v159 = v6.useCallback(function() --[[ Line: 552 ]]
        -- upvalues: v67 (copy), v12 (ref), l_TextService_0 (ref), v156 (ref), v70 (copy)
        local v157 = Vector2.new(math.max(1, v67.messageMaxWidth - v12.TAIL_WIDTH), 1e999);
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v156, v70.Font.BaseSize * v70.Font.Footer.RelativeSize, v70.Font.Footer.Font, v157);
        return UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y);
    end, {
        v70.Font.BaseSize * v70.Font.Footer.RelativeSize, 
        v70.Font.Footer.Font, 
        v67.messageMaxWidth - v12.TAIL_WIDTH, 
        v156
    });
    local v160 = 0;
    if not v67.showDateTime then
        v160 = (if not not v67.isNewSender or v144 then v12.CHAT_MESSAGE_MAX_SPACE else v12.CHAT_MESSAGE_MIN_SPACE) + v67.messageTypePaddingOffset;
    end;
    local l_left_0 = v72.left;
    local v162 = l_left_0 + v76.Size.Size_700;
    local v163 = v67.isIncoming and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right;
    local v164, v165 = v6.useState(false);
    local v167 = v6.useCallback(function() --[[ Line: 580 ]]
        -- upvalues: v33 (ref), v165 (copy)
        if v33() then
            v165(function(v166) --[[ Line: 582 ]]
                return not v166;
            end);
        end;
    end, {
        v165
    });
    local v168 = v164 or v67.moderated or v67.filteredForReceivers or v51 and v68;
    local v169 = if v164 then v67.messageId else if v51 and v68 then v67.messageHiddenNoticeText else v67.moderated and v67.messageModeratedNoticeText or v67.messageDefaultNoticeText;
    local v170 = v6.useMemo(function() --[[ Line: 597 ]]
        -- upvalues: v6 (ref), v15 (ref), v76 (copy), v67 (copy)
        return v6.createElement(v15.Icon, {
            name = v15.Enums.IconName.TriangleExclamation, 
            size = v15.Enums.IconSize.Large, 
            style = v76.Color.System.Alert, 
            LayoutOrder = v67.isIncoming and 0 or 3
        });
    end, {
        v76, 
        v70, 
        v67.isIncoming
    });
    local v171 = nil;
    v171 = if not not v67.failed or v67.moderated then v170 else if v77 then v6.createElement(v10, {
        LayoutOrder = v67.isIncoming and 2 or 1, 
        isIncoming = v67.isIncoming, 
        handleEvent = v92, 
        emitImpressionTelemetryEvent = v78
    }) else nil;
    local v172 = not v34() or v67.isIncoming;
    local v175 = if v53 and v84 and v84.swipeProgress then v84.swipeProgress:map(function(v173) --[[ Line: 625 ]]
        -- upvalues: v76 (copy)
        local v174 = 1 - math.pow(v173, 3);
        return {
            Color3 = v76.Semantic.Color.Icon.Default.Color3, 
            Transparency = v174
        };
    end) else nil;
    local v178 = if v53 and v84 and v84.swipeOffset then v84.swipeOffset:map(function(v176) --[[ Line: 638 ]]
        -- upvalues: v85 (ref), v32 (ref)
        local v177 = if v85.direction == v32.Right then v176 else -v176;
        return UDim2.new(0, v177, 0, 0);
    end) else nil;
    local v180 = if v53 and v84 and v84.swipeProgress then v84.swipeProgress:map(function(v179) --[[ Line: 648 ]]
        -- upvalues: v85 (ref)
        return v85.messagePosition + UDim2.new(0, v179 * v85.iconOffset, 0, 0);
    end) else nil;
    local function v182() --[[ Line: 654 ]] --[[ Name: renderMessage ]]
        -- upvalues: v6 (ref), v53 (ref), v178 (copy), v86 (ref), v87 (ref), v160 (ref), v67 (copy), l_left_0 (copy), v162 (copy), v72 (copy), v163 (copy), v15 (ref), l_UserTile_0 (ref), l_LayoutMode_0 (ref), v55 (ref), v75 (copy), v73 (copy), l_UserPresence_0 (ref), v69 (copy), v76 (copy), l_shouldShowName_0 (copy), v12 (ref), v172 (copy), v144 (copy), v154 (ref), v70 (copy), v159 (copy), v156 (ref), l_Skeleton_0 (ref), v34 (ref), v170 (copy), v88 (ref), v89 (ref), v90 (ref), v91 (ref), v79 (ref), v171 (ref), v93 (copy), v48 (ref), v51 (ref), v68 (copy), l_MessageFtuxTooltip_0 (ref), l_MessageFtuxTooltipVariant_0 (ref), v85 (ref), v180 (copy), v175 (copy)
        local v181 = v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 0), 
            Position = if v53 then v178 else nil, 
            [v6.Event.MouseEnter] = v86, 
            [v6.Event.MouseLeave] = v87
        }, {
            Padding = v6.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v160), 
                PaddingLeft = UDim.new(0, v67.thumbnail and l_left_0 or v162), 
                PaddingRight = UDim.new(0, v72.right - 0)
            }), 
            Layout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = v163
            }), 
            AvatarContainer = if v67.thumbnail then v6.createElement(v15.View, {
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
                        userId = v67.senderUserId, 
                        layoutMode = l_LayoutMode_0.compact, 
                        userPresenceType = if v55 and v75 then v73.presence else l_UserPresence_0.None, 
                        layoutOrder = 1, 
                        onActivated = v69
                    })
                })
            }) else nil, 
            MessageWithDisplayName = v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, v67.isIncoming and -v162 or 0, 0, 0)
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = v163
                }), 
                Padding = v6.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v67.isIncoming and v76.Size.Size_200 or 0)
                }), 
                DisplayNameContainer = l_shouldShowName_0 and v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, v67.messageMaxWidth - v12.TAIL_WIDTH, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 1
                }, {
                    Padding = v6.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v12.GROUPED_MESSAGE_DISPLAY_NAME_LEFT_PADDING), 
                        PaddingRight = if v172 then UDim.new(0, 0) else UDim.new(0, v12.TAIL_WIDTH), 
                        PaddingBottom = if v144 then UDim.new(0, v12.REPLIED_DISPLAY_NAME_BOTTOM_PADDING) else UDim.new(0, v12.GROUPED_MESSAGE_DISPLAY_NAME_BOTTOM_PADDING)
                    }), 
                    DisplayName = if not v154 then v6.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Font = v70.Font.Footer.Font, 
                        Size = v159(), 
                        AnchorPoint = if v172 then Vector2.new(0, 0) else Vector2.new(1, 0), 
                        Position = if v172 then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0), 
                        Text = v156, 
                        TextColor3 = v70.Theme.TextDefault.Color, 
                        TextSize = v70.Font.BaseSize * v70.Font.Footer.RelativeSize, 
                        TextTransparency = v70.Theme.TextDefault.Transparency, 
                        TextXAlignment = if v172 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right, 
                        TextYAlignment = Enum.TextYAlignment.Top
                    }) else nil, 
                    ShimmerName = if v154 then v6.createElement(l_Skeleton_0, {
                        AnchorPoint = if v172 then Vector2.new(0, 0) else Vector2.new(1, 0), 
                        Position = if v172 then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0), 
                        Size = UDim2.new(0, v12.SHIMMER_WIDTH, 0, v12.SHIMMER_HEIGHT), 
                        LayoutOrder = 2
                    }) else nil
                }), 
                MessageWithIcons = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, v67.isIncoming and -v162 or 0, 0, 0)
                }, {
                    Layout = v6.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = v163, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 10), 
                        ItemLineAlignment = Enum.ItemLineAlignment.Center
                    }), 
                    AlertIcon = if not v34() and (v67.failed or v67.moderated) then v170 else nil, 
                    Message = v67.renderMessage({
                        LayoutOrder = v67.isIncoming and 1 or 2, 
                        [v6.Event.InputBegan] = v88, 
                        [v6.Event.InputEnded] = v89, 
                        [v6.Event.TouchTap] = v90, 
                        [v6.Event.MouseButton1Down] = v91
                    }, if v34() then {
                        isPressed = v79, 
                        Icons = v171, 
                        ref = v93
                    } else nil), 
                    MessageFtuxTooltip = if not (v48 and v34() and v67.isLastIncomingChatMessage) or v51 and v68 then nil else v6.createElement(l_MessageFtuxTooltip_0, {
                        variant = l_MessageFtuxTooltipVariant_0.Replies, 
                        messageRef = v93, 
                        isReversed = v67.isIncoming
                    })
                })
            })
        });
        if v53 and (not v51 or not v68) then
            return v6.createElement(v15.View, {
                tag = "size-full-0 auto-y", 
                ClipsDescendants = false, 
                LayoutOrder = 2, 
                ZIndex = 2
            }, {
                ReplyIconFilled = v6.createElement(v15.Icon, {
                    name = v85.iconName, 
                    size = v15.Enums.IconSize.Medium, 
                    variant = v15.Enums.IconVariant.Filled, 
                    AnchorPoint = v85.iconAnchorPoint, 
                    Position = v180, 
                    style = v175, 
                    ZIndex = 1
                }), 
                Content = v181
            });
        else
            return v181;
        end;
    end;
    v6.useEffect(function() --[[ Line: 826 ]]
        -- upvalues: v46 (ref), v67 (copy), l_IXPService_0 (ref), v47 (ref)
        if v46 and v67.isLastIncomingChatMessage then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v47);
        end;
    end, {
        v67.isLastIncomingChatMessage
    });
    return v6.createElement(v65, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        Text = v33() and "" or nil, 
        [v6.Event.Activated] = if v33() then v167 else nil
    }, {
        Layout = v6.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = v163, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        DateTime = v67.showDateTime and v6.createElement(v23, {
            LayoutOrder = 1, 
            Text = v67.sent:GetLongRelativeTime(), 
            maxWidth = v12.DATETIME_MAX_WIDTH
        }), 
        MessageWithAvatar = v182(), 
        Notice = v168 and v6.createElement(v22, {
            Font = v67.Font, 
            HorizontalAlignment = v163, 
            LayoutOrder = 3, 
            Text = v169, 
            TextColor3 = if v51 and v68 then v76.Color.Content.Muted.Color3 else v67.moderated and v70.Theme.Alert.Color or v70.Theme.UIDefault.Color, 
            TextTransparency = if v51 and v68 then v76.Color.Content.Muted.Transparency else v67.moderated and v70.Theme.Alert.Transparency or v70.Theme.UIDefault.Transparency, 
            TextXAlignment = v67.isIncoming and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right, 
            TextSize = v76.Typography.CaptionSmall.FontSize, 
            margin = {
                top = v76.Padding.Small, 
                left = v67.isIncoming and v162 + v12.NOTICE_HORIZONTAL_PADDING or 0, 
                right = not v67.isIncoming and v72.right or 0, 
                bottom = 0
            }, 
            maxWidth = v67.parentWidth, 
            width = UDim.new(1, v67.isIncoming and -v162 or 0)
        }), 
        debug = v67.debugElement or nil
    });
end;
return ChatMessageContainer;