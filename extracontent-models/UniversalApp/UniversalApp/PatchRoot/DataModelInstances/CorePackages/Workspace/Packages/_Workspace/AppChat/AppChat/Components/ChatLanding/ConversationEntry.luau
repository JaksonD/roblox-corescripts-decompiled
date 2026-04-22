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
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local l_FFlagAppChatEnableGroupOSA_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableGroupOSA;
local v34 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
local l_FFlagAppChatLiftPostAPICallActionsUp_0 = require(l_Parent_0.SharedFlags).FFlagAppChatLiftPostAPICallActionsUp;
local v36 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDisableSquadButtonIfOSANotAcknowledged);
local v37 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatSquadJoinButtonOSA);
local v38 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatSquadJoinButtonU13OSA);
local v39 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local v40 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUpdateConvAfterRecordModalSequence);
local v41 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationListUnreadDot);
local v42 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationListRelativeTimestamps);
local v43 = v41 or v42;
local v44 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v45 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local v46 = require(l_script_FirstAncestor_0.Constants);
local l_API_0 = require(l_Parent_0.AppChatNetworking).rodux.GetConversationDetails.API;
local v48 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v49 = require(l_script_FirstAncestor_0.EnumScreens);
local v50 = require(l_script_FirstAncestor_0.Models.Conversation);
local v51 = require(l_script_FirstAncestor_0.Utils.shouldShowOSAForConversation);
local v52 = require(l_script_FirstAncestor_0.Utils.shouldShowU13ChatOptInForConversation);
local v53 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore);
local v54 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore.OverlayTypes);
local l_FFlagAppChatGroupOsaDialogHost_0 = require(l_Parent_0.SharedFlags).FFlagAppChatGroupOsaDialogHost;
local l_useChatPlacementContext_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).useChatPlacementContext;
local l_useCanAccessParty_0 = require(l_Parent_0.Squads).Hooks.useCanAccessParty;
local _ = require(l_script_FirstAncestor_0.types);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v60 = {
    entryHeight = 64, 
    boldTitle = true, 
    onSquadJoinButtonActivated = function() --[[ Line: 102 ]] --[[ Name: onSquadJoinButtonActivated ]]

    end
};
return l_memo_0(function(v61) --[[ Line: 106 ]] --[[ Name: ConversationEntry ]]
    -- upvalues: v15 (copy), v60 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useTextSizeOffset_0 (copy), v34 (copy), v44 (copy), v45 (copy), v8 (copy), v41 (copy), v17 (copy), l_FFlagAppChatLiftPostAPICallActionsUp_0 (copy), l_useDispatch_0 (copy), l_useChatPlacementContext_0 (copy), v10 (copy), v9 (copy), v42 (copy), l_useMemo_0 (copy), l_Text_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v4 (copy), l_useNavigation_0 (copy), l_FFlagAppChatEnableGroupOSA_0 (copy), l_FFlagAppChatGroupOsaDialogHost_0 (copy), v53 (copy), v49 (copy), v54 (copy), v40 (copy), l_API_0 (copy), v37 (copy), v38 (copy), v50 (copy), v48 (copy), v52 (copy), v46 (copy), v51 (copy), l_HttpService_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v28 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_useCanAccessParty_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v36 (copy), v43 (copy), l_SquadComponentAccessWrapper_0 (copy), l_SquadJoinButton_0 (copy), l_SquadButtonSourceEnum_0 (copy), v39 (copy), v21 (copy), l_ConversationCell_0 (copy), v29 (copy), v20 (copy), v19 (copy)
    local v62 = v15.Dictionary.join(v60, v61);
    local v63 = l_useStyle_0();
    local v64 = l_useTokens_0();
    local v65 = l_useTextSizeOffset_0();
    local v66 = nil;
    if v34 then
        v66 = v44(v45.Context);
    end;
    local l_conversation_0 = v62.conversation;
    local l_hasGroupUp_0 = l_conversation_0.hasGroupUp;
    local v69 = v8(l_conversation_0);
    local v70 = l_conversation_0.hasUnreadMessages and not v69;
    local v71 = v41 and v70;
    local v72 = v70 and not v71;
    local v73 = if v72 then v17(v63) else v63;
    local v74 = if l_FFlagAppChatLiftPostAPICallActionsUp_0 then l_useDispatch_0() else nil;
    local v75 = l_useChatPlacementContext_0();
    local v76 = v10();
    local l_CaptionSubHeader_0 = v73.Font.CaptionSubHeader;
    local v78 = v73.Font.BaseSize * l_CaptionSubHeader_0.RelativeSize;
    local v79 = v62.conversation.shortRelativeTime or "";
    local v80 = v9(if v42 then v62.conversation.unixTime else nil);
    local v81 = if v42 then v80 else v79;
    local v82 = l_useMemo_0(function() --[[ Line: 138 ]]
        -- upvalues: l_Text_0 (ref), v79 (copy), l_CaptionSubHeader_0 (copy), v78 (copy)
        return l_Text_0.GetTextWidth(v79, l_CaptionSubHeader_0.Font, v78);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v79, 
        l_CaptionSubHeader_0.Font, 
        v78, 
        v65
    } else l_dependencyArray_0(v79, l_CaptionSubHeader_0.Font, v78, v65));
    local v83 = v4.useRef(nil);
    local v84 = l_useNavigation_0();
    local v85 = false;
    if v84.getScreenProps then
        v85 = v84.getScreenProps("wideMode", v85);
    end;
    v4.useEffect(function() --[[ Line: 152 ]]
        -- upvalues: v62 (copy)
        v62.fireImpressionEvent(v62.conversation);
    end, {});
    local v86 = nil;
    local v87 = nil;
    if l_FFlagAppChatEnableGroupOSA_0 then
        local v88 = if l_FFlagAppChatGroupOsaDialogHost_0 then v53(false) else nil;
        local v90 = v4.useCallback(function(v89) --[[ Line: 161 ]]
            -- upvalues: v84 (copy), v49 (ref)
            v84.navigate(v49.ChatConversation, {
                conversationId = v89, 
                isNavigatedFromGroupOSAJoin = true
            });
        end, {
            v84
        });
        local l_v88_0 = v88 --[[ copy: 27 -> 40 ]];
        local l_v90_0 = v90 --[[ copy: 28 -> 41 ]];
        v87 = v4.useCallback(function(v93, v94, v95, v96, v97) --[[ Line: 169 ]]
            -- upvalues: l_FFlagAppChatGroupOsaDialogHost_0 (ref), l_v88_0 (copy), v54 (ref), l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v40 (ref), v74 (copy), l_API_0 (ref), v37 (ref), v38 (ref), l_v90_0 (copy), v50 (ref), v48 (ref), v84 (copy), v49 (ref)
            if l_FFlagAppChatGroupOsaDialogHost_0 then
                l_v88_0.showOverlay(v54.GroupOSADialog, {
                    conversationId = v93, 
                    impressionId = v94, 
                    modalVariant = v95, 
                    onJoin = function() --[[ Line: 181 ]] --[[ Name: onJoin ]]
                        -- upvalues: l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v40 (ref), v93 (copy), v74 (ref), l_API_0 (ref), l_v88_0 (ref), v37 (ref), v38 (ref), v97 (copy), l_v90_0 (ref)
                        if l_FFlagAppChatLiftPostAPICallActionsUp_0 and not v40 and v93 then
                            v74(l_API_0(v93));
                        end;
                        l_v88_0.dismissOverlay();
                        if (v37 or v38) and v97 then
                            v97(v93);
                            return;
                        else
                            l_v90_0(v93);
                            return;
                        end;
                    end, 
                    onDecline = function() --[[ Line: 199 ]] --[[ Name: onDecline ]]
                        -- upvalues: l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v93 (copy), v96 (copy), v50 (ref), v74 (ref), v48 (ref), l_v88_0 (ref)
                        if l_FFlagAppChatLiftPostAPICallActionsUp_0 and v93 and v96 == v50.Type.MULTI_USER_CONVERSATION then
                            v74(v48(v93));
                        end;
                        l_v88_0.dismissOverlay();
                    end
                });
                return;
            else
                v84.navigate(v49.GroupOSADialog, {
                    conversationId = v93, 
                    impressionId = v94, 
                    modalVariant = v95
                });
                return;
            end;
        end, {
            v84, 
            if l_FFlagAppChatGroupOsaDialogHost_0 then v90 else nil, 
            if l_FFlagAppChatLiftPostAPICallActionsUp_0 then v74 else nil
        });
        v86 = v4.useCallback(function(v98) --[[ Line: 226 ]]
            -- upvalues: v52 (ref), v46 (ref), v51 (ref), v34 (ref), l_HttpService_0 (ref), v87 (ref), v62 (copy), v66 (ref)
            local v99 = nil;
            local v100 = nil;
            if v52(v98) then
                v100 = v46.OptInVariant.ChatOptInInfoCard;
            elseif v51(v98) then
                v100 = v46.OptInVariant.OsaContextCard;
            end;
            if v100 then
                if v34 then
                    v99 = l_HttpService_0:GenerateGUID(false);
                end;
                v87(v98.id, v99, v100, v98.conversationType);
            elseif v62.onActivated then
                v62.onActivated(v98);
            end;
            if v34 then
                v62.fireClickEvent(v98, v66, v99);
            end;
        end, {
            v87, 
            v62.onActivated, 
            if v34 then v62.fireClickEvent else nil, 
            if v34 then v66 else nil
        });
    end;
    local v101 = nil;
    if l_FFlagAppChatEnableGroupOSA_0 and (v37 or v38) then
        local l_onSquadJoinButtonActivated_0 = v62.onSquadJoinButtonActivated;
        local l_l_onSquadJoinButtonActivated_0_0 = l_onSquadJoinButtonActivated_0 --[[ copy: 28 -> 39 ]];
        v101 = v4.useCallback(function(v104) --[[ Line: 261 ]]
            -- upvalues: v37 (ref), v51 (ref), l_conversation_0 (copy), v46 (ref), v38 (ref), v52 (ref), v50 (ref), v87 (ref), v34 (ref), l_HttpService_0 (ref), l_l_onSquadJoinButtonActivated_0_0 (copy)
            local v105 = nil;
            if v37 and v51(l_conversation_0) then
                v105 = v46.OptInVariant.OsaContextCard;
            elseif v38 and v52(l_conversation_0) and l_conversation_0.conversationType == v50.Type.MULTI_USER_CONVERSATION then
                v105 = v46.OptInVariant.ChatOptInInfoCard;
            end;
            if v105 and v87 then
                local v106 = nil;
                if v34 then
                    v106 = l_HttpService_0:GenerateGUID(false);
                end;
                v87(v104, v106, v105, l_conversation_0.conversationType, l_l_onSquadJoinButtonActivated_0_0);
                return;
            else
                if l_l_onSquadJoinButtonActivated_0_0 then
                    l_l_onSquadJoinButtonActivated_0_0(v104);
                end;
                return;
            end;
        end, {
            v87, 
            l_conversation_0, 
            l_onSquadJoinButtonActivated_0
        });
    end;
    local v107 = if l_FFlagAppChatEnableGroupOSA_0 then v86 else v62.onActivated;
    local v108 = nil;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v108 = v4.useContext(v28.FocusNavigationContext);
    end;
    v4.useEffect(function() --[[ Line: 303 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v85 (ref), v107 (copy), v108 (ref), v83 (copy), l_conversation_0 (copy)
        if l_FFlagEnableAppChatFocusableFixes_0 and v85 and v107 and v108 then
            local v110 = v108.focusedGuiObject:subscribe(function(v109) --[[ Line: 306 ]]
                -- upvalues: v83 (ref), v107 (ref), l_conversation_0 (ref)
                if v83.current and v109 == v83.current.cell then
                    v107(l_conversation_0);
                end;
            end);
            return function() --[[ Line: 311 ]]
                -- upvalues: v110 (copy)
                v110:unsubscribe();
            end;
        else
            return function() --[[ Line: 316 ]]

            end;
        end;
    end, {
        v107, 
        v85, 
        v108
    });
    local v111 = v62.children or {};
    local l_Size_1900_0 = v64.Size.Size_1900;
    local v113 = nil;
    local v114 = if l_FFlagIsSquadEnabledAMP_0 then l_useCanAccessParty_0() else nil;
    local v115 = if l_FFlagIsSquadEnabledAMP_0 then v114 else l_GetFFlagIsSquadEnabled_0();
    local v116 = v36 and v51(l_conversation_0) and not v37;
    local v117 = if v71 then v64.Size.Size_200 + v64.Gap.XSmall else 0;
    local v118 = if v43 then v76.right else 24;
    v113 = if not (v115 and l_hasGroupUp_0) or v116 then v82 + v117 + v118 else v118 + l_Size_1900_0;
    if not v43 then
        v113 = v113 - 12;
    end;
    local v119 = if not (v115 and l_hasGroupUp_0 and l_conversation_0.id) or v116 then nil else v4.createElement(l_SquadComponentAccessWrapper_0, {
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
                onActivated = v101 or v62.onSquadJoinButtonActivated, 
                Selectable = false, 
                shouldAnimate = false, 
                squadLocation = v75.chatPlacement, 
                squadButtonSource = l_SquadButtonSourceEnum_0.ConversationEntry, 
                testId = if v39 then v21.chatLandingConversationEntrySquadButton(l_conversation_0.title) else nil
            })
        })
    });
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v62.entryHeight), 
        BackgroundTransparency = 1, 
        ref = v83
    }, {
        cell = v4.createElement(l_ConversationCell_0, {
            Size = UDim2.new(1, 0, 0, v62.entryHeight), 
            conversation = v62.conversation, 
            childWidth = v113, 
            subTitleText = if v29() then v62.conversation.id else v62.conversation.lastMessageContent, 
            onActivated = v107, 
            style = v73, 
            boldTitle = v72, 
            hideLeftAvatarPadding = true, 
            onSquadJoinButtonActivated = v62.onSquadJoinButtonActivated, 
            paddingLeft = v76.left, 
            paddingRight = v76.right, 
            testId = if v39 then v21.chatLandingConversationEntry(l_conversation_0.title) else nil
        }, v15.Dictionary.join(v111, {
            timeStamp = if v119 then nil else if v43 then v4.createElement(v20, {
                timestampText = v81, 
                hasUnreadMessages = v70
            }) else v4.createElement(v19, {
                currentStyle = v73, 
                paddingX = not v119 and 0 or 12, 
                paddingY = 14, 
                text = v79, 
                textSize = v78, 
                textWidth = v82
            }), 
            squadButton = v119
        }))
    });
end);