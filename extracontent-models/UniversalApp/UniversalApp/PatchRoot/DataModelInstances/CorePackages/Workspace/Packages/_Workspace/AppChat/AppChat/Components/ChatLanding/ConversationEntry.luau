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
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v26 = require(l_Parent_0.ReactFocusNavigation);
local v27 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugAppChat);
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v30 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationBadgingLogging);
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local l_FFlagAppChatEnableGroupOSA_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableGroupOSA;
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
local v34 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDisableSquadButtonIfOSANotAcknowledged);
local v35 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableDomLocators);
local v36 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v37 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local v38 = require(l_script_FirstAncestor_0.EnumScreens);
local v39 = require(l_script_FirstAncestor_0.Utils.shouldShowOSAForConversation);
local v40 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore);
local v41 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore.OverlayTypes);
local l_FFlagAppChatGroupOsaDialogHost_0 = require(l_Parent_0.SharedFlags).FFlagAppChatGroupOsaDialogHost;
local l_useChatPlacementContext_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).useChatPlacementContext;
local l_useCanAccessParty_0 = require(l_Parent_0.Squads).Hooks.useCanAccessParty;
local _ = require(l_script_FirstAncestor_0.types);
local v46 = {
    entryHeight = 64, 
    boldTitle = true, 
    onSquadJoinButtonActivated = function() --[[ Line: 81 ]] --[[ Name: onSquadJoinButtonActivated ]]

    end
};
return l_memo_0(function(v47) --[[ Line: 85 ]] --[[ Name: ConversationEntry ]]
    -- upvalues: v14 (copy), v46 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useTextSizeOffset_0 (copy), v33 (copy), v36 (copy), v37 (copy), v8 (copy), v17 (copy), l_useChatPlacementContext_0 (copy), v9 (copy), l_useMemo_0 (copy), l_Text_0 (copy), l_dependencyArray_0 (copy), v4 (copy), l_useNavigation_0 (copy), v30 (copy), l_FFlagAppChatEnableGroupOSA_0 (copy), l_FFlagAppChatGroupOsaDialogHost_0 (copy), v40 (copy), v38 (copy), v39 (copy), l_HttpService_0 (copy), v41 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v26 (copy), l_FFlagAppChatEnableHandheldScalingFixes_0 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_useCanAccessParty_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v34 (copy), l_SquadComponentAccessWrapper_0 (copy), l_SquadJoinButton_0 (copy), l_SquadButtonSourceEnum_0 (copy), l_ConversationCell_0 (copy), v27 (copy), v35 (copy), v20 (copy), v19 (copy)
    local v48 = v14.Dictionary.join(v46, v47);
    local v49 = l_useStyle_0();
    local v50 = l_useTokens_0();
    local v51 = l_useTextSizeOffset_0();
    local v52 = nil;
    if v33 then
        v52 = v36(v37.Context);
    end;
    local l_conversation_0 = v48.conversation;
    local l_hasGroupUp_0 = l_conversation_0.hasGroupUp;
    local v55 = v8(l_conversation_0);
    local v56 = l_conversation_0.hasUnreadMessages and not v55;
    local v57 = if v56 then v17(v49) else v49;
    local v58 = l_useChatPlacementContext_0();
    local v59 = v9();
    local l_CaptionSubHeader_0 = v57.Font.CaptionSubHeader;
    local v61 = v57.Font.BaseSize * l_CaptionSubHeader_0.RelativeSize;
    local v62 = v48.conversation.shortRelativeTime or "";
    local v63 = l_useMemo_0(function() --[[ Line: 108 ]]
        -- upvalues: l_Text_0 (ref), v62 (copy), l_CaptionSubHeader_0 (copy), v61 (copy)
        return l_Text_0.GetTextWidth(v62, l_CaptionSubHeader_0.Font, v61);
    end, l_dependencyArray_0(v62, l_CaptionSubHeader_0.Font, v61, v51));
    local v64 = v4.useRef(nil);
    local v65 = l_useNavigation_0();
    local v66 = false;
    if v65.getScreenProps then
        v66 = v65.getScreenProps("wideMode", v66);
    end;
    if v30 then
        v4.useEffect(function() --[[ Line: 119 ]]
            -- upvalues: v48 (copy)
            v48.fireImpressionEvent(v48.conversation);
        end, {});
    end;
    local v67 = nil;
    if l_FFlagAppChatEnableGroupOSA_0 then
        local v68 = if l_FFlagAppChatGroupOsaDialogHost_0 then v40(false) else nil;
        local v70 = v4.useCallback(function(v69) --[[ Line: 129 ]]
            -- upvalues: v65 (copy), v38 (ref)
            v65.navigate(v38.ChatConversation, {
                conversationId = v69, 
                isNavigatedFromGroupOSAJoin = true
            });
        end, {
            v65
        });
        local l_v68_0 = v68 --[[ copy: 21 -> 30 ]];
        local l_v70_0 = v70 --[[ copy: 22 -> 31 ]];
        v67 = v4.useCallback(function(v73) --[[ Line: 137 ]]
            -- upvalues: v39 (ref), v33 (ref), l_HttpService_0 (ref), l_FFlagAppChatGroupOsaDialogHost_0 (ref), l_v68_0 (copy), v41 (ref), l_v70_0 (copy), v65 (copy), v38 (ref), v48 (copy), v52 (ref)
            local v74 = nil;
            if v39(v73) then
                if v33 then
                    v74 = l_HttpService_0:GenerateGUID(false);
                end;
                if l_FFlagAppChatGroupOsaDialogHost_0 then
                    l_v68_0.showOverlay(v41.GroupOSADialog, {
                        conversationId = v73.id, 
                        impressionId = v74, 
                        onJoin = function() --[[ Line: 148 ]] --[[ Name: onJoin ]]
                            -- upvalues: l_v68_0 (ref), l_v70_0 (ref), v73 (copy)
                            l_v68_0.dismissOverlay();
                            l_v70_0(v73.id);
                        end, 
                        onDecline = function() --[[ Line: 152 ]] --[[ Name: onDecline ]]
                            -- upvalues: l_v68_0 (ref)
                            l_v68_0.dismissOverlay();
                        end
                    });
                else
                    v65.navigate(v38.GroupOSADialog, {
                        conversationId = v73.id, 
                        impressionId = v74
                    });
                end;
            elseif v48.onActivated then
                v48.onActivated(v73);
            end;
            if v33 then
                v48.fireClickEvent(v73, v52, v74);
            end;
        end, {
            v65, 
            v48.onActivated, 
            if v33 then v48.fireClickEvent else nil, 
            if v33 then v52 else nil, 
            if l_FFlagAppChatGroupOsaDialogHost_0 then v70 else nil
        });
    end;
    local v75 = if l_FFlagAppChatEnableGroupOSA_0 then v67 else v48.onActivated;
    local v76 = nil;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v76 = v4.useContext(v26.FocusNavigationContext);
    end;
    v4.useEffect(function() --[[ Line: 187 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v66 (ref), v75 (copy), v76 (ref), v64 (copy), l_conversation_0 (copy)
        if l_FFlagEnableAppChatFocusableFixes_0 and v66 and v75 and v76 then
            local v78 = v76.focusedGuiObject:subscribe(function(v77) --[[ Line: 190 ]]
                -- upvalues: v64 (ref), v75 (ref), l_conversation_0 (ref)
                if v64.current and v77 == v64.current.cell then
                    v75(l_conversation_0);
                end;
            end);
            return function() --[[ Line: 195 ]]
                -- upvalues: v78 (copy)
                v78:unsubscribe();
            end;
        else
            return function() --[[ Line: 200 ]]

            end;
        end;
    end, {
        v75, 
        v66, 
        v76
    });
    local v79 = v48.children or {};
    local v80 = if l_FFlagAppChatEnableHandheldScalingFixes_0 then v50.Size.Size_1900 else 77;
    local v81 = nil;
    local v82 = if l_FFlagIsSquadEnabledAMP_0 then l_useCanAccessParty_0() else nil;
    local v83 = if l_FFlagIsSquadEnabledAMP_0 then v82 else l_GetFFlagIsSquadEnabled_0();
    local v84 = v34 and v39(l_conversation_0);
    v81 = (if not (v83 and l_hasGroupUp_0) or v84 then v63 + 24 else if l_FFlagAppChatEnableHandheldScalingFixes_0 then 24 + v80 else v63 + 36 + v80) - 12;
    local v85 = if not (v83 and l_hasGroupUp_0 and l_conversation_0.id) or v84 then nil else v4.createElement(l_SquadComponentAccessWrapper_0, {
        parentChannelId = l_conversation_0.id
    }, {
        v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v80, 1, 0), 
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
                onActivated = v48.onSquadJoinButtonActivated, 
                Selectable = false, 
                shouldAnimate = false, 
                squadLocation = v58.chatPlacement, 
                squadButtonSource = l_SquadButtonSourceEnum_0.ConversationEntry
            })
        })
    });
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v48.entryHeight), 
        BackgroundTransparency = 1, 
        ref = v64
    }, {
        cell = v4.createElement(l_ConversationCell_0, {
            Size = UDim2.new(1, 0, 0, v48.entryHeight), 
            conversation = v48.conversation, 
            childWidth = v81, 
            subTitleText = if v27() then v48.conversation.id else v48.conversation.lastMessageContent, 
            onActivated = v75, 
            style = v57, 
            boldTitle = v56, 
            hideLeftAvatarPadding = true, 
            onSquadJoinButtonActivated = v48.onSquadJoinButtonActivated, 
            paddingLeft = v59.left, 
            paddingRight = v59.right, 
            testId = if v35 then v20.chatLandingConversationEntry(l_conversation_0.title) else nil
        }, v14.Dictionary.join(v79, {
            timeStamp = if l_FFlagAppChatEnableHandheldScalingFixes_0 and v85 then nil else v4.createElement(v19, {
                currentStyle = v57, 
                paddingX = not v85 and 0 or 12, 
                paddingY = 14, 
                text = v62, 
                textSize = v61, 
                textWidth = v63
            }), 
            squadButton = v85
        }))
    });
end);