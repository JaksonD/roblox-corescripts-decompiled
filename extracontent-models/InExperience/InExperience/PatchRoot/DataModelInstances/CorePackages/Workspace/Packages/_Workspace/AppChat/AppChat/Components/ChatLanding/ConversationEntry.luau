local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.RoactUtils);
local v4 = require(l_Parent_0.React);
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_useMemo_0 = v4.useMemo;
local v8 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local v9 = require(l_script_FirstAncestor_0.Hooks.useRelativeTimestampBinding);
local v10 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.useChatPagePadding);
local v11 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v11.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v11.Core.Style.useTextSizeOffset;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v15 = require(l_Parent_0.Cryo);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v17 = require(script.Parent.Utils.getBoldTextTheme);
local l_ConversationCell_0 = require(l_script_FirstAncestor_0.Components.Cells).ConversationCell;
local v19 = require(script.Parent.ConversationTimestamp);
local v20 = require(script.Parent.ConversationRelativeTimestamp);
local v21 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v22 = require(l_Parent_0.Squads);
local l_SquadJoinButton_0 = v22.SquadJoinButton;
local l_SquadButtonSourceEnum_0 = v22.Enums.SquadButtonSourceEnum;
local l_SquadComponentAccessWrapper_0 = v22.SquadComponentAccessWrapper;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v28 = require(l_Parent_0.ReactFocusNavigation);
local v29 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugAppChat);
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v32 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationBadgingLogging);
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local l_FFlagAppChatEnableGroupOSA_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableGroupOSA;
local v35 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
local l_FFlagAppChatLiftPostAPICallActionsUp_0 = require(l_Parent_0.SharedFlags).FFlagAppChatLiftPostAPICallActionsUp;
local v37 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDisableSquadButtonIfOSANotAcknowledged);
local v38 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatSquadJoinButtonOSA);
local v39 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatSquadJoinButtonU13OSA);
local v40 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local v41 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUpdateConvAfterRecordModalSequence);
local v42 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationListUnreadDot);
local v43 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationListRelativeTimestamps);
local v44 = v42 or v43;
local v45 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v46 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local v47 = require(l_script_FirstAncestor_0.Constants);
local l_API_0 = require(l_Parent_0.AppChatNetworking).rodux.GetConversationDetails.API;
local v49 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v50 = require(l_script_FirstAncestor_0.EnumScreens);
local v51 = require(l_script_FirstAncestor_0.Models.Conversation);
local v52 = require(l_script_FirstAncestor_0.Utils.shouldShowOSAForConversation);
local v53 = require(l_script_FirstAncestor_0.Utils.shouldShowU13ChatOptInForConversation);
local v54 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore);
local v55 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore.OverlayTypes);
local l_FFlagAppChatGroupOsaDialogHost_0 = require(l_Parent_0.SharedFlags).FFlagAppChatGroupOsaDialogHost;
local l_useChatPlacementContext_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).useChatPlacementContext;
local l_useCanAccessParty_0 = require(l_Parent_0.Squads).Hooks.useCanAccessParty;
local _ = require(l_script_FirstAncestor_0.types);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v61 = {
    entryHeight = 64, 
    boldTitle = true, 
    onSquadJoinButtonActivated = function() --[[ Line: 103 ]] --[[ Name: onSquadJoinButtonActivated ]]

    end
};
return l_memo_0(function(v62) --[[ Line: 107 ]] --[[ Name: ConversationEntry ]]
    -- upvalues: v15 (copy), v61 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useTextSizeOffset_0 (copy), v35 (copy), v45 (copy), v46 (copy), v8 (copy), v42 (copy), v17 (copy), l_FFlagAppChatLiftPostAPICallActionsUp_0 (copy), l_useDispatch_0 (copy), l_useChatPlacementContext_0 (copy), v10 (copy), v9 (copy), v43 (copy), l_useMemo_0 (copy), l_Text_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v4 (copy), l_useNavigation_0 (copy), v32 (copy), l_FFlagAppChatEnableGroupOSA_0 (copy), l_FFlagAppChatGroupOsaDialogHost_0 (copy), v54 (copy), v50 (copy), v55 (copy), v41 (copy), l_API_0 (copy), v38 (copy), v39 (copy), v51 (copy), v49 (copy), v53 (copy), v47 (copy), v52 (copy), l_HttpService_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v28 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_useCanAccessParty_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v37 (copy), v44 (copy), l_SquadComponentAccessWrapper_0 (copy), l_SquadJoinButton_0 (copy), l_SquadButtonSourceEnum_0 (copy), v40 (copy), v21 (copy), l_ConversationCell_0 (copy), v29 (copy), v20 (copy), v19 (copy)
    local v63 = v15.Dictionary.join(v61, v62);
    local v64 = l_useStyle_0();
    local v65 = l_useTokens_0();
    local v66 = l_useTextSizeOffset_0();
    local v67 = nil;
    if v35 then
        v67 = v45(v46.Context);
    end;
    local l_conversation_0 = v63.conversation;
    local l_hasGroupUp_0 = l_conversation_0.hasGroupUp;
    local v70 = v8(l_conversation_0);
    local v71 = l_conversation_0.hasUnreadMessages and not v70;
    local v72 = v42 and v71;
    local v73 = v71 and not v72;
    local v74 = if v73 then v17(v64) else v64;
    local v75 = if l_FFlagAppChatLiftPostAPICallActionsUp_0 then l_useDispatch_0() else nil;
    local v76 = l_useChatPlacementContext_0();
    local v77 = v10();
    local l_CaptionSubHeader_0 = v74.Font.CaptionSubHeader;
    local v79 = v74.Font.BaseSize * l_CaptionSubHeader_0.RelativeSize;
    local v80 = v63.conversation.shortRelativeTime or "";
    local v81 = v9(if v43 then v63.conversation.unixTime else nil);
    local v82 = if v43 then v81 else v80;
    local v83 = l_useMemo_0(function() --[[ Line: 139 ]]
        -- upvalues: l_Text_0 (ref), v80 (copy), l_CaptionSubHeader_0 (copy), v79 (copy)
        return l_Text_0.GetTextWidth(v80, l_CaptionSubHeader_0.Font, v79);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v80, 
        l_CaptionSubHeader_0.Font, 
        v79, 
        v66
    } else l_dependencyArray_0(v80, l_CaptionSubHeader_0.Font, v79, v66));
    local v84 = v4.useRef(nil);
    local v85 = l_useNavigation_0();
    local v86 = false;
    if v85.getScreenProps then
        v86 = v85.getScreenProps("wideMode", v86);
    end;
    if v32 then
        v4.useEffect(function() --[[ Line: 154 ]]
            -- upvalues: v63 (copy)
            v63.fireImpressionEvent(v63.conversation);
        end, {});
    end;
    local v87 = nil;
    local v88 = nil;
    if l_FFlagAppChatEnableGroupOSA_0 then
        local v89 = if l_FFlagAppChatGroupOsaDialogHost_0 then v54(false) else nil;
        local v91 = v4.useCallback(function(v90) --[[ Line: 164 ]]
            -- upvalues: v85 (copy), v50 (ref)
            v85.navigate(v50.ChatConversation, {
                conversationId = v90, 
                isNavigatedFromGroupOSAJoin = true
            });
        end, {
            v85
        });
        local l_v89_0 = v89 --[[ copy: 27 -> 40 ]];
        local l_v91_0 = v91 --[[ copy: 28 -> 41 ]];
        v88 = v4.useCallback(function(v94, v95, v96, v97, v98) --[[ Line: 172 ]]
            -- upvalues: l_FFlagAppChatGroupOsaDialogHost_0 (ref), l_v89_0 (copy), v55 (ref), l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v41 (ref), v75 (copy), l_API_0 (ref), v38 (ref), v39 (ref), l_v91_0 (copy), v51 (ref), v49 (ref), v85 (copy), v50 (ref)
            if l_FFlagAppChatGroupOsaDialogHost_0 then
                l_v89_0.showOverlay(v55.GroupOSADialog, {
                    conversationId = v94, 
                    impressionId = v95, 
                    modalVariant = v96, 
                    onJoin = function() --[[ Line: 184 ]] --[[ Name: onJoin ]]
                        -- upvalues: l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v41 (ref), v94 (copy), v75 (ref), l_API_0 (ref), l_v89_0 (ref), v38 (ref), v39 (ref), v98 (copy), l_v91_0 (ref)
                        if l_FFlagAppChatLiftPostAPICallActionsUp_0 and not v41 and v94 then
                            v75(l_API_0(v94));
                        end;
                        l_v89_0.dismissOverlay();
                        if (v38 or v39) and v98 then
                            v98(v94);
                            return;
                        else
                            l_v91_0(v94);
                            return;
                        end;
                    end, 
                    onDecline = function() --[[ Line: 202 ]] --[[ Name: onDecline ]]
                        -- upvalues: l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v94 (copy), v97 (copy), v51 (ref), v75 (ref), v49 (ref), l_v89_0 (ref)
                        if l_FFlagAppChatLiftPostAPICallActionsUp_0 and v94 and v97 == v51.Type.MULTI_USER_CONVERSATION then
                            v75(v49(v94));
                        end;
                        l_v89_0.dismissOverlay();
                    end
                });
                return;
            else
                v85.navigate(v50.GroupOSADialog, {
                    conversationId = v94, 
                    impressionId = v95, 
                    modalVariant = v96
                });
                return;
            end;
        end, {
            v85, 
            if l_FFlagAppChatGroupOsaDialogHost_0 then v91 else nil, 
            if l_FFlagAppChatLiftPostAPICallActionsUp_0 then v75 else nil
        });
        v87 = v4.useCallback(function(v99) --[[ Line: 229 ]]
            -- upvalues: v53 (ref), v47 (ref), v52 (ref), v35 (ref), l_HttpService_0 (ref), v88 (ref), v63 (copy), v67 (ref)
            local v100 = nil;
            local v101 = nil;
            if v53(v99) then
                v101 = v47.OptInVariant.ChatOptInInfoCard;
            elseif v52(v99) then
                v101 = v47.OptInVariant.OsaContextCard;
            end;
            if v101 then
                if v35 then
                    v100 = l_HttpService_0:GenerateGUID(false);
                end;
                v88(v99.id, v100, v101, v99.conversationType);
            elseif v63.onActivated then
                v63.onActivated(v99);
            end;
            if v35 then
                v63.fireClickEvent(v99, v67, v100);
            end;
        end, {
            v88, 
            v63.onActivated, 
            if v35 then v63.fireClickEvent else nil, 
            if v35 then v67 else nil
        });
    end;
    local v102 = nil;
    if l_FFlagAppChatEnableGroupOSA_0 and (v38 or v39) then
        local l_onSquadJoinButtonActivated_0 = v63.onSquadJoinButtonActivated;
        local l_l_onSquadJoinButtonActivated_0_0 = l_onSquadJoinButtonActivated_0 --[[ copy: 28 -> 39 ]];
        v102 = v4.useCallback(function(v105) --[[ Line: 264 ]]
            -- upvalues: v38 (ref), v52 (ref), l_conversation_0 (copy), v47 (ref), v39 (ref), v53 (ref), v51 (ref), v88 (ref), v35 (ref), l_HttpService_0 (ref), l_l_onSquadJoinButtonActivated_0_0 (copy)
            local v106 = nil;
            if v38 and v52(l_conversation_0) then
                v106 = v47.OptInVariant.OsaContextCard;
            elseif v39 and v53(l_conversation_0) and l_conversation_0.conversationType == v51.Type.MULTI_USER_CONVERSATION then
                v106 = v47.OptInVariant.ChatOptInInfoCard;
            end;
            if v106 and v88 then
                local v107 = nil;
                if v35 then
                    v107 = l_HttpService_0:GenerateGUID(false);
                end;
                v88(v105, v107, v106, l_conversation_0.conversationType, l_l_onSquadJoinButtonActivated_0_0);
                return;
            else
                if l_l_onSquadJoinButtonActivated_0_0 then
                    l_l_onSquadJoinButtonActivated_0_0(v105);
                end;
                return;
            end;
        end, {
            v88, 
            l_conversation_0, 
            l_onSquadJoinButtonActivated_0
        });
    end;
    local v108 = if l_FFlagAppChatEnableGroupOSA_0 then v87 else v63.onActivated;
    local v109 = nil;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v109 = v4.useContext(v28.FocusNavigationContext);
    end;
    v4.useEffect(function() --[[ Line: 306 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v86 (ref), v108 (copy), v109 (ref), v84 (copy), l_conversation_0 (copy)
        if l_FFlagEnableAppChatFocusableFixes_0 and v86 and v108 and v109 then
            local v111 = v109.focusedGuiObject:subscribe(function(v110) --[[ Line: 309 ]]
                -- upvalues: v84 (ref), v108 (ref), l_conversation_0 (ref)
                if v84.current and v110 == v84.current.cell then
                    v108(l_conversation_0);
                end;
            end);
            return function() --[[ Line: 314 ]]
                -- upvalues: v111 (copy)
                v111:unsubscribe();
            end;
        else
            return function() --[[ Line: 319 ]]

            end;
        end;
    end, {
        v108, 
        v86, 
        v109
    });
    local v112 = v63.children or {};
    local l_Size_1900_0 = v65.Size.Size_1900;
    local v114 = nil;
    local v115 = if l_FFlagIsSquadEnabledAMP_0 then l_useCanAccessParty_0() else nil;
    local v116 = if l_FFlagIsSquadEnabledAMP_0 then v115 else l_GetFFlagIsSquadEnabled_0();
    local v117 = v37 and v52(l_conversation_0) and not v38;
    local v118 = if v72 then v65.Size.Size_200 + v65.Gap.XSmall else 0;
    local v119 = if v44 then v77.right else 24;
    v114 = if not (v116 and l_hasGroupUp_0) or v117 then v83 + v118 + v119 else v119 + l_Size_1900_0;
    if not v44 then
        v114 = v114 - 12;
    end;
    local v120 = if not (v116 and l_hasGroupUp_0 and l_conversation_0.id) or v117 then nil else v4.createElement(l_SquadComponentAccessWrapper_0, {
        parentChannelId = l_conversation_0.id
    }, {
        v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_Size_1900_0, 1, 0), 
            LayoutOrder = 2
        }, {}, {
            layout = v4.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            padding = v4.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 0)
            }), 
            button = v4.createElement(l_SquadJoinButton_0, {
                conversationId = l_conversation_0.id, 
                isFullWidth = false, 
                isInCard = false, 
                layoutOrder = 0, 
                onActivated = v102 or v63.onSquadJoinButtonActivated, 
                Selectable = false, 
                shouldAnimate = false, 
                squadLocation = v76.chatPlacement, 
                squadButtonSource = l_SquadButtonSourceEnum_0.ConversationEntry, 
                testId = if v40 then v21.chatLandingConversationEntrySquadButton(l_conversation_0.title) else nil
            })
        })
    });
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v63.entryHeight), 
        BackgroundTransparency = 1, 
        ref = v84
    }, {
        cell = v4.createElement(l_ConversationCell_0, {
            Size = UDim2.new(1, 0, 0, v63.entryHeight), 
            conversation = v63.conversation, 
            childWidth = v114, 
            subTitleText = if v29() then v63.conversation.id else v63.conversation.lastMessageContent, 
            onActivated = v108, 
            style = v74, 
            boldTitle = v73, 
            hideLeftAvatarPadding = true, 
            onSquadJoinButtonActivated = v63.onSquadJoinButtonActivated, 
            paddingLeft = v77.left, 
            paddingRight = v77.right, 
            testId = if v40 then v21.chatLandingConversationEntry(l_conversation_0.title) else nil
        }, v15.Dictionary.join(v112, {
            timeStamp = if v120 then nil else if v44 then v4.createElement(v20, {
                timestampText = v82, 
                hasUnreadMessages = v71
            }) else v4.createElement(v19, {
                currentStyle = v74, 
                paddingX = not v120 and 0 or 12, 
                paddingY = 14, 
                text = v80, 
                textSize = v79, 
                textWidth = v83
            }), 
            squadButton = v120
        }))
    });
end);