local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.types);
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local l_DeviceType_0 = require(l_Parent_0.RobloxAppEnums).DeviceType;
local v7 = require(script.Parent.Logger);
local v8 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v9 = require(l_Parent_0.AppChatNetworking);
local v10 = require(l_Parent_0.UIBlox);
local l_Images_0 = v10.App.ImageSet.Images;
local l_PeekView_0 = require(l_Parent_0.PeekView).PeekView;
local l_PeekViewState_0 = require(l_Parent_0.PeekView).PeekViewState;
local l_ContextualMenu_0 = v10.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v10.App.Menu.MenuDirection;
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_useStyle_0 = v10.Core.Style.useStyle;
local l_useDeviceType_0 = require(l_Parent_0.RobloxAppHooks).useDeviceType;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v21 = require(l_script_FirstAncestor_0.Components.ChatConversation.MessageInteraction.ReplyingContext.useReplyingToMessageDispatch);
local l_useLayerCollector_0 = v10.Core.Layout.LayerCollector.useLayerCollector;
local v23 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v25 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableManualTranslation);
local v26 = {
    message = nil, 
    userOwnsMessage = false, 
    inputBoxRef = v3.createRef(), 
    unitTestDeviceType = nil, 
    unitTestScreenSize = nil
};
if v26.unitTestDeviceType ~= nil then
    v7:error("Default unit test device type must ALWAYS BE NIL!");
    error("Default unit test device type was not nil.");
end;
if v26.unitTestScreenSize ~= nil then
    v7:error("Default unit test screen size must ALWAYS BE NIL!");
    error("Default unit test screen size was not nil.");
end;
MessageContextMenu = function(v27) --[[ Line: 84 ]] --[[ Name: MessageContextMenu ]]
    -- upvalues: v2 (copy), v26 (copy), v21 (copy), l_useStyle_0 (copy), v3 (copy), l_Signal_0 (copy), l_useLayerCollector_0 (copy), l_useNavigation_0 (copy), l_useDeviceType_0 (copy), v23 (copy), l_useLocalization_0 (copy), l_PeekViewState_0 (copy), v8 (copy), l_DeviceType_0 (copy), l_default_0 (copy), v25 (copy), l_useDispatch_0 (copy), v9 (copy), v7 (copy), l_Images_0 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy), l_PeekView_0 (copy)
    local v28 = v2.Dictionary.union(v26, v27);
    local v29 = v21();
    local l_Color_0 = l_useStyle_0().Tokens.Global.Color;
    local v31 = v3.useRef(l_Signal_0.new());
    local v32 = v28.unitTestScreenSize or l_useLayerCollector_0().absoluteSize;
    local v33 = l_useNavigation_0();
    local v34 = v28.unitTestDeviceType or l_useDeviceType_0();
    local v35 = v23();
    local v36 = l_useLocalization_0({
        replyText = "Feature.Chat.Action.Reply", 
        copyText = "Feature.Chat.Action.Copy", 
        editText = "Feature.Chat.Action.Edit", 
        deleteText = "Feature.Chat.Action.Delete", 
        reportText = "Feature.Chat.Action.Report", 
        translateText = "Feature.Chat.Action.Translate"
    });
    local v38 = v3.useCallback(function(v37) --[[ Line: 109 ]]
        -- upvalues: v35 (copy), v28 (copy)
        if v35 then
            v35.fireAnalyticsEvent(v37, {
                conversationId = if v28.message then v28.message.conversationId else nil, 
                targetMessageSenderId = if v28.message then v28.message.senderTargetId else nil, 
                targetMessageId = if v28.message then v28.message.id else nil, 
                targetMessageSentAt = if v28.message and v28.message.sent then tostring(v28.message.sent.dateTime) else nil, 
                targetMessageLength = if v28.message and v28.message.content then #v28.message.content else nil
            });
        end;
    end, {
        v28.message
    });
    local v39 = v3.useRef(false);
    local v40 = v3.useCallback(function() --[[ Line: 129 ]]
        -- upvalues: v28 (copy)
        if v28.inputBoxRef and v28.inputBoxRef.current then
            v28.inputBoxRef.current:CaptureFocus();
        end;
    end, {
        v28.inputBoxRef
    });
    local v41 = v3.useCallback(function() --[[ Line: 136 ]]
        -- upvalues: v33 (copy)
        v33.goBack();
    end, {
        v33 and v33.goBack
    });
    local v42 = v3.useCallback(function() --[[ Line: 141 ]]
        -- upvalues: v31 (copy)
        v31.current:fire();
    end, {
        v31.current
    });
    local v45 = v3.useCallback(function(v43, _) --[[ Line: 147 ]]
        -- upvalues: l_PeekViewState_0 (ref), v41 (copy)
        if v43 == l_PeekViewState_0.Closed then
            v41();
        end;
    end, {
        v41
    });
    v3.useEffect(function() --[[ Line: 153 ]]
        -- upvalues: v38 (copy), v8 (ref), v28 (copy), v39 (copy)
        v38(v8.ChatMessageMenuOpened);
        if v28.inputBoxRef and v28.inputBoxRef.current then
            v39.current = v28.inputBoxRef.current:IsFocused();
        end;
    end, {});
    local v46 = v3.useCallback(function() --[[ Line: 162 ]]
        -- upvalues: v34 (copy), l_DeviceType_0 (ref), v42 (copy), v41 (copy)
        if v34 == l_DeviceType_0.Phone then
            v42();
            return;
        else
            v41();
            return;
        end;
    end, {
        v34, 
        v42, 
        v41
    });
    local v47 = v3.useCallback(function() --[[ Line: 170 ]]
        -- upvalues: v46 (copy), v39 (copy), v40 (copy)
        v46();
        if v39.current then
            v40();
        end;
    end, {
        v46, 
        v39.current, 
        v40
    });
    local v48 = v3.useCallback(function() --[[ Line: 178 ]]
        -- upvalues: v38 (copy), v8 (ref), v46 (copy), v29 (copy), v28 (copy), v40 (copy)
        v38(v8.ChatMessageMenuReplyBtnActivated);
        v46();
        v29(v28.message);
        v40();
    end, {
        v38, 
        v46, 
        v29, 
        v28.message, 
        v40
    });
    local v49 = v3.useCallback(function() --[[ Line: 197 ]]
        -- upvalues: v38 (copy), v8 (ref), v46 (copy), l_default_0 (ref), v28 (copy)
        v38(v8.ChatMessageMenuCopyBtnActivated);
        v46();
        l_default_0:shareText({
            text = v28.message.content, 
            context = "AppChat-ChatConversation-MessageContextMenu"
        });
    end, {
        v38, 
        v46, 
        v28.message
    });
    local v50 = v3.useCallback(function() --[[ Line: 212 ]]

    end);
    local v51 = v3.useCallback(function() --[[ Line: 216 ]]

    end);
    local v52 = nil;
    if v25() then
        local v53 = l_useDispatch_0();
        local l_v53_0 = v53 --[[ copy: 23 -> 33 ]];
        v52 = v3.useCallback(function() --[[ Line: 224 ]]
            -- upvalues: v46 (copy), l_v53_0 (copy), v9 (ref), v28 (copy), v7 (ref)
            v46();
            l_v53_0(v9.rodux.TranslateUserMessage.API(v28.message.conversationId, v28.message.id)):catch(function(v55) --[[ Line: 228 ]]
                -- upvalues: v7 (ref)
                v7:error("Error translating message: ", v55);
            end);
        end, {
            v28.message, 
            v46, 
            v53
        });
    end;
    local v56 = v3.useCallback(function() --[[ Line: 240 ]]

    end);
    local v58 = v3.useMemo(function() --[[ Line: 245 ]]
        -- upvalues: l_Images_0 (ref), v36 (copy), v48 (copy), v49 (copy), v28 (copy), v50 (copy), l_Color_0 (copy), v51 (copy), v25 (ref), v52 (ref), v56 (copy)
        local v57 = {
            {
                icon = l_Images_0["icons/placeholder/placeholderOff"], 
                text = v36.replyText, 
                onActivated = v48
            }, 
            {
                icon = l_Images_0["icons/actions/edit/copy"], 
                text = v36.copyText, 
                onActivated = v49
            }
        };
        if v28.userOwnsMessage then
            table.insert(v57, {
                icon = l_Images_0["icons/actions/edit/edit"], 
                text = v36.editText, 
                onActivated = v50
            });
            table.insert(v57, {
                icon = l_Images_0["icons/actions/edit/delete"], 
                iconColorOverride = l_Color_0.Red.Color3, 
                text = v36.deleteText, 
                textColorOverride = l_Color_0.Red.Color3, 
                onActivated = v51
            });
            return v57;
        else
            if v25() then
                table.insert(v57, {
                    icon = l_Images_0["icons/placeholder/placeholderOff"], 
                    text = "Translate", 
                    onActivated = v52
                });
            end;
            table.insert(v57, {
                icon = l_Images_0["icons/placeholder/placeholderOff"], 
                iconColorOverride = l_Color_0.Red.Color3, 
                text = v36.reportText, 
                textColorOverride = l_Color_0.Red.Color3, 
                onActivated = v56
            });
            return v57;
        end;
    end, {
        v36.replyText, 
        v36.copyText, 
        v36.editText, 
        v36.deleteText, 
        v36.reportText, 
        v36.translateText, 
        v48, 
        v49, 
        v50, 
        v51, 
        if v25() then v52 else nil, 
        v56, 
        v28.userOwnsMessage
    });
    local v59 = #v58 * 56;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    local v63 = nil;
    local v64 = nil;
    if v34 == l_DeviceType_0.Desktop or v34 == l_DeviceType_0.Tablet then
        v60 = 20;
        v61 = v32;
        v62 = Vector2.new(0.5, 0.5);
        v63 = UDim.new(0.5, 0);
        v64 = UDim.new(0.5, 0);
    else
        v60 = 0;
        v61 = Vector2.new(0, 0);
        v62 = Vector2.new(0.5, 1);
        v63 = UDim.new(0, v59);
        v64 = UDim.new(1, 0);
    end;
    local v65 = v3.createElement(l_ContextualMenu_0, {
        screenSize = v61, 
        menuDirection = l_MenuDirection_0.Up, 
        openPositionY = v63, 
        anchorPointOverride = v62, 
        horizontalAlignment = Enum.HorizontalAlignment.Center, 
        contextMenuWidthOverride = v64, 
        borderCornerRadius = v60, 
        buttonProps = v58, 
        isElementBackgroundVisible = true, 
        isElementDividerVisible = true, 
        open = true, 
        onDismiss = v47
    });
    local v66 = v3.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        [v3.Event.Activated] = v47
    }, {
        PeekView = v3.createElement(l_PeekView_0, {
            briefViewContentHeight = UDim.new(0, v59), 
            fullViewContentHeight = UDim.new(1, -v59), 
            mountAsFullView = false, 
            mountAnimation = true, 
            showDraggerInClosedState = false, 
            closeSignal = v31.current, 
            viewStateChanged = v45
        }, {
            v65
        })
    });
    if v34 == l_DeviceType_0.Desktop or v34 == l_DeviceType_0.Tablet then
        return v65;
    else
        return v66;
    end;
end;
return v3.memo(MessageContextMenu);