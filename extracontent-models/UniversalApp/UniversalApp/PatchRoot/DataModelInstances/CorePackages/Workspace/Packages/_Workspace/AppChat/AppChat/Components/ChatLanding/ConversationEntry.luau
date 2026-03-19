local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.RoactUtils);
local v4 = require(l_Parent_0.React);
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_useMemo_0 = v4.useMemo;
local v8 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local v9 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.useChatPagePadding);
local v10 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v10.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v10.Core.Style.useTextSizeOffset;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v14 = require(l_Parent_0.Cryo);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_FFlagAppChatEnableHandheldScalingFixes_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableHandheldScalingFixes;
local v17 = require(script.Parent.Utils.getBoldTextTheme);
local l_ConversationCell_0 = require(l_script_FirstAncestor_0.Components.Cells).ConversationCell;
local v19 = require(script.Parent.ConversationTimestamp);
local v20 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v21 = require(l_Parent_0.Squads);
local l_SquadJoinButton_0 = v21.SquadJoinButton;
local l_SquadButtonSourceEnum_0 = v21.Enums.SquadButtonSourceEnum;
local l_SquadComponentAccessWrapper_0 = v21.SquadComponentAccessWrapper;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v27 = require(l_Parent_0.ReactFocusNavigation);
local v28 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugAppChat);
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationBadgingLogging);
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local l_FFlagAppChatEnableGroupOSA_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableGroupOSA;
local v34 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
local l_FFlagAppChatLiftPostAPICallActionsUp_0 = require(l_Parent_0.SharedFlags).FFlagAppChatLiftPostAPICallActionsUp;
local v36 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDisableSquadButtonIfOSANotAcknowledged);
local v37 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatSquadJoinButtonOSA);
local v38 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatSquadJoinButtonU13OSA);
local v39 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableDomLocators);
local v40 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUpdateConvAfterRecordModalSequence);
local v41 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v42 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local v43 = require(l_script_FirstAncestor_0.Constants);
local l_API_0 = require(l_Parent_0.AppChatNetworking).rodux.GetConversationDetails.API;
local v45 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v46 = require(l_script_FirstAncestor_0.EnumScreens);
local v47 = require(l_script_FirstAncestor_0.Models.Conversation);
local v48 = require(l_script_FirstAncestor_0.Utils.shouldShowOSAForConversation);
local v49 = require(l_script_FirstAncestor_0.Utils.shouldShowU13ChatOptInForConversation);
local v50 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore);
local v51 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore.OverlayTypes);
local l_FFlagAppChatGroupOsaDialogHost_0 = require(l_Parent_0.SharedFlags).FFlagAppChatGroupOsaDialogHost;
local l_useChatPlacementContext_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).useChatPlacementContext;
local l_useCanAccessParty_0 = require(l_Parent_0.Squads).Hooks.useCanAccessParty;
local _ = require(l_script_FirstAncestor_0.types);
local v56 = {
    entryHeight = 64, 
    boldTitle = true, 
    onSquadJoinButtonActivated = function() --[[ Line: 94 ]] --[[ Name: onSquadJoinButtonActivated ]]

    end
};
return l_memo_0(function(v57) --[[ Line: 98 ]] --[[ Name: ConversationEntry ]]
    -- upvalues: v14 (copy), v56 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useTextSizeOffset_0 (copy), v34 (copy), v41 (copy), v42 (copy), v8 (copy), v17 (copy), l_FFlagAppChatLiftPostAPICallActionsUp_0 (copy), l_useDispatch_0 (copy), l_useChatPlacementContext_0 (copy), v9 (copy), l_useMemo_0 (copy), l_Text_0 (copy), l_dependencyArray_0 (copy), v4 (copy), l_useNavigation_0 (copy), v31 (copy), l_FFlagAppChatEnableGroupOSA_0 (copy), l_FFlagAppChatGroupOsaDialogHost_0 (copy), v50 (copy), v46 (copy), v51 (copy), v40 (copy), l_API_0 (copy), v37 (copy), v38 (copy), v47 (copy), v45 (copy), v49 (copy), v43 (copy), v48 (copy), l_HttpService_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v27 (copy), l_FFlagAppChatEnableHandheldScalingFixes_0 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_useCanAccessParty_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v36 (copy), l_SquadComponentAccessWrapper_0 (copy), l_SquadJoinButton_0 (copy), l_SquadButtonSourceEnum_0 (copy), l_ConversationCell_0 (copy), v28 (copy), v39 (copy), v20 (copy), v19 (copy)
    local v58 = v14.Dictionary.join(v56, v57);
    local v59 = l_useStyle_0();
    local v60 = l_useTokens_0();
    local v61 = l_useTextSizeOffset_0();
    local v62 = nil;
    if v34 then
        v62 = v41(v42.Context);
    end;
    local l_conversation_0 = v58.conversation;
    local l_hasGroupUp_0 = l_conversation_0.hasGroupUp;
    local v65 = v8(l_conversation_0);
    local v66 = l_conversation_0.hasUnreadMessages and not v65;
    local v67 = if v66 then v17(v59) else v59;
    local v68 = if l_FFlagAppChatLiftPostAPICallActionsUp_0 then l_useDispatch_0() else nil;
    local v69 = l_useChatPlacementContext_0();
    local v70 = v9();
    local l_CaptionSubHeader_0 = v67.Font.CaptionSubHeader;
    local v72 = v67.Font.BaseSize * l_CaptionSubHeader_0.RelativeSize;
    local v73 = v58.conversation.shortRelativeTime or "";
    local v74 = l_useMemo_0(function() --[[ Line: 123 ]]
        -- upvalues: l_Text_0 (ref), v73 (copy), l_CaptionSubHeader_0 (copy), v72 (copy)
        return l_Text_0.GetTextWidth(v73, l_CaptionSubHeader_0.Font, v72);
    end, l_dependencyArray_0(v73, l_CaptionSubHeader_0.Font, v72, v61));
    local v75 = v4.useRef(nil);
    local v76 = l_useNavigation_0();
    local v77 = false;
    if v76.getScreenProps then
        v77 = v76.getScreenProps("wideMode", v77);
    end;
    if v31 then
        v4.useEffect(function() --[[ Line: 134 ]]
            -- upvalues: v58 (copy)
            v58.fireImpressionEvent(v58.conversation);
        end, {});
    end;
    local v78 = nil;
    local v79 = nil;
    if l_FFlagAppChatEnableGroupOSA_0 then
        local v80 = if l_FFlagAppChatGroupOsaDialogHost_0 then v50(false) else nil;
        local v82 = v4.useCallback(function(v81) --[[ Line: 144 ]]
            -- upvalues: v76 (copy), v46 (ref)
            v76.navigate(v46.ChatConversation, {
                conversationId = v81, 
                isNavigatedFromGroupOSAJoin = true
            });
        end, {
            v76
        });
        local l_v80_0 = v80 --[[ copy: 23 -> 34 ]];
        local l_v82_0 = v82 --[[ copy: 24 -> 35 ]];
        v79 = v4.useCallback(function(v85, v86, v87, v88, v89) --[[ Line: 152 ]]
            -- upvalues: l_FFlagAppChatGroupOsaDialogHost_0 (ref), l_v80_0 (copy), v51 (ref), l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v40 (ref), v68 (copy), l_API_0 (ref), v37 (ref), v38 (ref), l_v82_0 (copy), v47 (ref), v45 (ref), v76 (copy), v46 (ref)
            if l_FFlagAppChatGroupOsaDialogHost_0 then
                l_v80_0.showOverlay(v51.GroupOSADialog, {
                    conversationId = v85, 
                    impressionId = v86, 
                    modalVariant = v87, 
                    onJoin = function() --[[ Line: 164 ]] --[[ Name: onJoin ]]
                        -- upvalues: l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v40 (ref), v85 (copy), v68 (ref), l_API_0 (ref), l_v80_0 (ref), v37 (ref), v38 (ref), v89 (copy), l_v82_0 (ref)
                        if l_FFlagAppChatLiftPostAPICallActionsUp_0 and not v40 and v85 then
                            v68(l_API_0(v85));
                        end;
                        l_v80_0.dismissOverlay();
                        if (v37 or v38) and v89 then
                            v89(v85);
                            return;
                        else
                            l_v82_0(v85);
                            return;
                        end;
                    end, 
                    onDecline = function() --[[ Line: 182 ]] --[[ Name: onDecline ]]
                        -- upvalues: l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v85 (copy), v88 (copy), v47 (ref), v68 (ref), v45 (ref), l_v80_0 (ref)
                        if l_FFlagAppChatLiftPostAPICallActionsUp_0 and v85 and v88 == v47.Type.MULTI_USER_CONVERSATION then
                            v68(v45(v85));
                        end;
                        l_v80_0.dismissOverlay();
                    end
                });
                return;
            else
                v76.navigate(v46.GroupOSADialog, {
                    conversationId = v85, 
                    impressionId = v86, 
                    modalVariant = v87
                });
                return;
            end;
        end, {
            v76, 
            if l_FFlagAppChatGroupOsaDialogHost_0 then v82 else nil, 
            if l_FFlagAppChatLiftPostAPICallActionsUp_0 then v68 else nil
        });
        v78 = v4.useCallback(function(v90) --[[ Line: 209 ]]
            -- upvalues: v49 (ref), v43 (ref), v48 (ref), v34 (ref), l_HttpService_0 (ref), v79 (ref), v58 (copy), v62 (ref)
            local v91 = nil;
            local v92 = nil;
            if v49(v90) then
                v92 = v43.OptInVariant.ChatOptInInfoCard;
            elseif v48(v90) then
                v92 = v43.OptInVariant.OsaContextCard;
            end;
            if v92 then
                if v34 then
                    v91 = l_HttpService_0:GenerateGUID(false);
                end;
                v79(v90.id, v91, v92, v90.conversationType);
            elseif v58.onActivated then
                v58.onActivated(v90);
            end;
            if v34 then
                v58.fireClickEvent(v90, v62, v91);
            end;
        end, {
            v79, 
            v58.onActivated, 
            if v34 then v58.fireClickEvent else nil, 
            if v34 then v62 else nil
        });
    end;
    local v93 = nil;
    if l_FFlagAppChatEnableGroupOSA_0 and (v37 or v38) then
        local l_onSquadJoinButtonActivated_0 = v58.onSquadJoinButtonActivated;
        local l_l_onSquadJoinButtonActivated_0_0 = l_onSquadJoinButtonActivated_0 --[[ copy: 24 -> 33 ]];
        v93 = v4.useCallback(function(v96) --[[ Line: 244 ]]
            -- upvalues: v37 (ref), v48 (ref), l_conversation_0 (copy), v43 (ref), v38 (ref), v49 (ref), v47 (ref), v79 (ref), v34 (ref), l_HttpService_0 (ref), l_l_onSquadJoinButtonActivated_0_0 (copy)
            local v97 = nil;
            if v37 and v48(l_conversation_0) then
                v97 = v43.OptInVariant.OsaContextCard;
            elseif v38 and v49(l_conversation_0) and l_conversation_0.conversationType == v47.Type.MULTI_USER_CONVERSATION then
                v97 = v43.OptInVariant.ChatOptInInfoCard;
            end;
            if v97 and v79 then
                local v98 = nil;
                if v34 then
                    v98 = l_HttpService_0:GenerateGUID(false);
                end;
                v79(v96, v98, v97, l_conversation_0.conversationType, l_l_onSquadJoinButtonActivated_0_0);
                return;
            else
                if l_l_onSquadJoinButtonActivated_0_0 then
                    l_l_onSquadJoinButtonActivated_0_0(v96);
                end;
                return;
            end;
        end, {
            v79, 
            l_conversation_0, 
            l_onSquadJoinButtonActivated_0
        });
    end;
    local v99 = if l_FFlagAppChatEnableGroupOSA_0 then v78 else v58.onActivated;
    local v100 = nil;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v100 = v4.useContext(v27.FocusNavigationContext);
    end;
    v4.useEffect(function() --[[ Line: 286 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v77 (ref), v99 (copy), v100 (ref), v75 (copy), l_conversation_0 (copy)
        if l_FFlagEnableAppChatFocusableFixes_0 and v77 and v99 and v100 then
            local v102 = v100.focusedGuiObject:subscribe(function(v101) --[[ Line: 289 ]]
                -- upvalues: v75 (ref), v99 (ref), l_conversation_0 (ref)
                if v75.current and v101 == v75.current.cell then
                    v99(l_conversation_0);
                end;
            end);
            return function() --[[ Line: 294 ]]
                -- upvalues: v102 (copy)
                v102:unsubscribe();
            end;
        else
            return function() --[[ Line: 299 ]]

            end;
        end;
    end, {
        v99, 
        v77, 
        v100
    });
    local v103 = v58.children or {};
    local v104 = if l_FFlagAppChatEnableHandheldScalingFixes_0 then v60.Size.Size_1900 else 77;
    local v105 = nil;
    local v106 = if l_FFlagIsSquadEnabledAMP_0 then l_useCanAccessParty_0() else nil;
    local v107 = if l_FFlagIsSquadEnabledAMP_0 then v106 else l_GetFFlagIsSquadEnabled_0();
    local v108 = v36 and v48(l_conversation_0) and not v37;
    v105 = (if not (v107 and l_hasGroupUp_0) or v108 then v74 + 24 else if l_FFlagAppChatEnableHandheldScalingFixes_0 then 24 + v104 else v74 + 36 + v104) - 12;
    local v109 = if not (v107 and l_hasGroupUp_0 and l_conversation_0.id) or v108 then nil else v4.createElement(l_SquadComponentAccessWrapper_0, {
        parentChannelId = l_conversation_0.id
    }, {
        v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v104, 1, 0), 
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
                onActivated = v93 or v58.onSquadJoinButtonActivated, 
                Selectable = false, 
                shouldAnimate = false, 
                squadLocation = v69.chatPlacement, 
                squadButtonSource = l_SquadButtonSourceEnum_0.ConversationEntry
            })
        })
    });
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v58.entryHeight), 
        BackgroundTransparency = 1, 
        ref = v75
    }, {
        cell = v4.createElement(l_ConversationCell_0, {
            Size = UDim2.new(1, 0, 0, v58.entryHeight), 
            conversation = v58.conversation, 
            childWidth = v105, 
            subTitleText = if v28() then v58.conversation.id else v58.conversation.lastMessageContent, 
            onActivated = v99, 
            style = v67, 
            boldTitle = v66, 
            hideLeftAvatarPadding = true, 
            onSquadJoinButtonActivated = v58.onSquadJoinButtonActivated, 
            paddingLeft = v70.left, 
            paddingRight = v70.right, 
            testId = if v39 then v20.chatLandingConversationEntry(l_conversation_0.title) else nil
        }, v14.Dictionary.join(v103, {
            timeStamp = if l_FFlagAppChatEnableHandheldScalingFixes_0 and v109 then nil else v4.createElement(v19, {
                currentStyle = v67, 
                paddingX = not v109 and 0 or 12, 
                paddingY = 14, 
                text = v73, 
                textSize = v72, 
                textWidth = v74
            }), 
            squadButton = v109
        }))
    });
end);