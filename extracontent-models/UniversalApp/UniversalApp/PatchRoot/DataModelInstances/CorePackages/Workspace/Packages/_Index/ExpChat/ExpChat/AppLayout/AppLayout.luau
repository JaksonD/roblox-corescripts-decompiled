local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_Players_0 = game:GetService("Players");
local l_FocusUtils_0 = require(l_Parent_0.Chrome).FocusUtils;
local l_LocalStorageKey_0 = require(l_Parent_0.LocalStorage).Enums.LocalStorageKey;
local v8 = require(l_Parent_0.Otter);
local v9 = require(l_Parent_0.ReactFocusNavigation);
local v10 = require(l_Parent_0.Roact);
local v11 = require(l_Parent_0.Signals);
local v12 = require(l_Parent_0.SocialUpsell);
local l_createEffect_0 = v11.createEffect;
local v14 = require(l_Parent_0.SharedFlags);
local v15 = require(l_Parent_0.UIBlox);
local l_CursorKind_0 = v15.App.SelectionImage.CursorKind;
local l_SelectionCursorProvider_0 = v15.App.SelectionImage.SelectionCursorProvider;
local l_CursorProvider_0 = v15.App.SelectionCursor.CursorProvider;
local l_withSelectionCursorProvider_0 = v15.App.SelectionImage.withSelectionCursorProvider;
local v20 = require(l_script_FirstAncestor_0.ChatInput);
local v21 = require(l_script_FirstAncestor_0.ChatWindow);
local v22 = require(l_script_FirstAncestor_0.ChannelBar);
local v23 = require(l_script_FirstAncestor_0.EnableChatButton);
local v24 = require(l_script_FirstAncestor_0.Config);
local v25 = require(l_script_FirstAncestor_0.Stores.GetChatConfigurationStore);
local v26 = require(l_script_FirstAncestor_0.Stores.GetChatStatusStore);
local v27 = require(l_script_FirstAncestor_0.Timer);
local v28 = require(l_script_FirstAncestor_0.SpatialUI);
local v29 = require(l_script_FirstAncestor_0.ClientSettings.ClientSettingsUtility);
local v30 = require(l_script_FirstAncestor_0.canPlatformEnableChat);
local v31 = require(l_script_FirstAncestor_0.isChatRegionLocked);
local v32 = require(l_script_FirstAncestor_0.showChatEnabledUI);
local l_FStringExpChatFOMOUpsellImpressionsCountKey_0 = v14.FStringExpChatFOMOUpsellImpressionsCountKey;
local l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 = v14.GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled;
local l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 = v14.FIntMaxExpChatUnlockChatButtonImpressionsCount;
local v36 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFocusNavigation);
local v37 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatFocusChannelBarSupport);
local v38 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatTransparentFocusSupport);
local v39 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatEnableChannelTabsUI);
local v40 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatConditionallyMountAppLayout);
local v41 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableV2ChatWindow);
local v42 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatKeepV2PoolMounted);
local v43 = require(l_script_FirstAncestor_0.Flags.FFlagAEGIS2ExpChatShowEnableChatButton);
local v44 = require(l_script_FirstAncestor_0.Flags.FFlagAEGIS2EnableGatesForExpChat);
local v45 = game:DefineFastFlag("DebugForceEnableChatButtonOn", false);
local l_FFlagExpChatUseMessagesStore_0 = v14.FFlagExpChatUseMessagesStore;
local l_FFlagExpChatUseChatConfigStore_0 = v14.FFlagExpChatUseChatConfigStore;
local l_isInExperienceUIVREnabled_0 = require(l_Parent_0.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v49 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatTriggerWindowStatusEvent);
local v50 = if l_isInExperienceUIVREnabled_0 then {
    DEFAULT = UDim2.fromScale(0.95, 0.94), 
    WITH_CHANNEL_BAR = UDim2.fromScale(0.95, 0.78), 
    WITH_CHATINPUT_BAR = UDim2.fromScale(0.95, 0.76), 
    WITH_CHANNEL_CHATINPUT_BAR = UDim2.fromScale(0.95, 0.6098)
} else nil;
local v51 = require(l_script_FirstAncestor_0.Stores.GetFocusNavigationStore);
local v52 = require(l_script_FirstAncestor_0.Stores.GetTransparencyStore);
local v53 = require(l_script_FirstAncestor_0.Stores.GetChatWindowStatusStore);
local l_manuallyInvokeAmpUpsell_0 = v12.Utils.manuallyInvokeAmpUpsell;
local v55 = v10.PureComponent:extend("AppLayout");
v55.defaultProps = {
    addTopPadding = true, 
    canLocalUserChat = false, 
    isChatInputBarVisible = true, 
    isChatWindowVisible = true, 
    isChannelBarVisible = false, 
    LayoutOrder = 1, 
    mutedUserIds = nil, 
    onSendChat = nil, 
    onSendGlobalChat = nil, 
    textTimer = v27.new(v24.ChatWindowTextFadeOutTime), 
    timer = v27.new(v24.ChatWindowBackgroundFadeOutTime), 
    isSpatialUIEnabled = false, 
    canPlatformEnableChat = if v43 then v30 else nil
};
local v56 = {
    frequency = 1.25, 
    dampingRatio = 1
};
v55.init = function(v57) --[[ Line: 94 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), v8 (copy), v52 (copy), v49 (copy), v53 (copy), l_Players_0 (copy), l_TextChatService_0 (copy), l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_HttpService_0 (copy), l_FStringExpChatFOMOUpsellImpressionsCountKey_0 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v25 (copy), v38 (copy), v56 (copy), l_createEffect_0 (copy), v44 (copy), v26 (copy), v36 (copy), v9 (copy), v37 (copy), v51 (copy), l_FocusUtils_0 (copy)
    local v58, v59 = v10.createBinding(0);
    v57.transparencyValue = v58;
    v57.updateBackgroundTransparency = v59;
    v57.backgroundTransparencyMotor = v8.createSingleMotor(0);
    v57.backgroundTransparencyMotor:onStep(v57.updateBackgroundTransparency);
    v58, v59 = v10.createBinding(0);
    v57.textTransparencyValue = v58;
    v57.updateTextTransparencyValue = v59;
    v57.textTransparencyMotor = v8.createSingleMotor(0);
    v57.textTransparencyMotor:onStep(v57.updateTextTransparencyValue);
    v58 = v52(false);
    v57.ChatWindowStatusStore = if v49() then v53(false) else nil;
    if v49() then
        v57.localPlayerLeavingConnection = l_Players_0.PlayerRemoving:Connect(function(v60) --[[ Line: 109 ]]
            -- upvalues: l_Players_0 (ref), v57 (copy), l_TextChatService_0 (ref)
            if v60 == l_Players_0.LocalPlayer then
                v57.ChatWindowStatusStore.setPreviousChatWindowState(v57.ChatWindowStatusStore.getCurrentChatWindowState(false));
                local v61 = v57.ChatWindowStatusStore.getDurationUpdates(false);
                l_TextChatService_0:SendExpChatWindowStatusChange(v61.closedDuration, v61.openDuration, v61.backgroundIdleDuration, v61.textIdleDuration);
            end;
        end);
    end;
    if l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0() then
        v59 = {};
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 131 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.ExpChatFOMOUpsellImpressionsCount);
        end);
        if l_status_0 and l_result_0 ~= "" then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 136 ]]
                -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
                return l_HttpService_0:JSONDecode(l_result_0);
            end);
            if l_status_1 then
                v59 = l_result_1;
            end;
        end;
        v57.FOMOUpsellImpressionsCount = v59[l_FStringExpChatFOMOUpsellImpressionsCountKey_0];
    end;
    if l_FFlagExpChatUseChatConfigStore_0 then
        v57.ChatConfigurationStore = v25(false);
    end;
    v57.resetBackgroundTransparency = function() --[[ Line: 151 ]]
        -- upvalues: v38 (ref), v58 (copy), v57 (copy), v8 (ref), v49 (ref), v56 (ref)
        local v66 = if v38 then v58.getIsFocused(false) else v58.getIsTextBoxFocused(false);
        v57.backgroundTransparencyMotor:setGoal(v8.instant(0));
        v57.props.timer:stop();
        if v66 == false and v57.props.isSpatialUIEnabled == false then
            v57.props.timer:start():andThen(function() --[[ Line: 160 ]]
                -- upvalues: v49 (ref), v57 (ref), v8 (ref), v56 (ref)
                if v49() then
                    v57.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock());
                end;
                v57.backgroundTransparencyMotor:setGoal(v8.spring(1, v56));
            end);
        end;
    end;
    v57.resetTextTransparency = function() --[[ Line: 169 ]]
        -- upvalues: v38 (ref), v58 (copy), v57 (copy), v8 (ref), v49 (ref), v56 (ref)
        local v67 = if v38 then v58.getIsFocused(false) else v58.getIsTextBoxFocused(false);
        v57.textTransparencyMotor:setGoal(v8.instant(0));
        v57.props.textTimer:stop();
        if v67 == false then
            v57.props.textTimer:start():andThen(function() --[[ Line: 178 ]]
                -- upvalues: v49 (ref), v57 (ref), v8 (ref), v56 (ref)
                if v49() then
                    v57.ChatWindowStatusStore.setTextTimerStarted(os.clock());
                end;
                v57.textTransparencyMotor:setGoal(v8.spring(1, v56));
            end);
        end;
    end;
    v57.disposeBackgroundEffect = l_createEffect_0(function(v68) --[[ Line: 186 ]]
        -- upvalues: v58 (copy), v57 (copy)
        local _ = v58.getLastActivity(v68);
        v57.resetBackgroundTransparency();
        v57.resetTextTransparency();
    end);
    v57.disposeTextEffect = l_createEffect_0(function(v70) --[[ Line: 192 ]]
        -- upvalues: v58 (copy), v57 (copy)
        local _ = v58.getLastMessageActivity(v70);
        v57.resetTextTransparency();
    end);
    if v44 then
        v57.disposeChatStatusEffect = l_createEffect_0(function(v72) --[[ Line: 198 ]]
            -- upvalues: v26 (ref), v57 (copy)
            local v73 = v26(v72).getChatStatus(v72);
            v57:setState({
                chatStatus = v73
            });
        end);
    end;
    v57.onAbsolutePositionChanged = function(v74, v75) --[[ Line: 208 ]]
        v75.AbsolutePositionWrite = v74.AbsolutePosition;
    end;
    v57.onAbsoluteSizeChanged = function(v76, v77) --[[ Line: 212 ]]
        v77.AbsoluteSizeWrite = v76.AbsoluteSize;
    end;
    if v36 then
        v57.focusNavigationService = v9.FocusNavigationService.new(v9.EngineInterface.CoreGui);
        v57.topBorderRef = if v37 then v10.createRef() else nil;
        v57.onContainerSelectionChanged = function(v78, _, _, v81) --[[ Line: 222 ]]
            -- upvalues: v51 (ref), v38 (ref), v58 (copy), v37 (ref), v57 (copy), l_FocusUtils_0 (ref)
            if v81 == nil or not v81:IsDescendantOf(v78) then
                v51(false).unfocusChatInputBar();
                if v38 then
                    v58.clearWindowFocusInput();
                    return;
                end;
            else
                if v38 then
                    v58.setWindowFocusInput();
                end;
                if v37 and v81 == v57.topBorderRef.current then
                    l_FocusUtils_0.FocusOnChrome(function() --[[ Line: 236 ]]
                        -- upvalues: v51 (ref)
                        v51(false).unfocusChatInputBar();
                    end, "chat");
                end;
            end;
        end;
        if not v37 then
            v57.onBorderSelectionChanged = function(_, v83, _, _) --[[ Line: 245 ]]
                -- upvalues: l_FocusUtils_0 (ref), v51 (ref)
                if v83 then
                    l_FocusUtils_0.FocusOnChrome(function() --[[ Line: 247 ]]
                        -- upvalues: v51 (ref)
                        v51(false).unfocusChatInputBar();
                    end, "chat");
                end;
            end;
        end;
    end;
end;
v55.didMount = function(v86) --[[ Line: 256 ]] --[[ Name: didMount ]]
    -- upvalues: v49 (copy), v8 (copy), v56 (copy)
    v86.props.timer:start():andThen(function() --[[ Line: 257 ]]
        -- upvalues: v49 (ref), v86 (copy), v8 (ref), v56 (ref)
        if v49() then
            v86.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock());
        end;
        v86.backgroundTransparencyMotor:setGoal(v8.spring(1, v56));
    end);
    v86.props.textTimer:start():andThen(function() --[[ Line: 264 ]]
        -- upvalues: v49 (ref), v86 (copy), v8 (ref), v56 (ref)
        if v49() then
            v86.ChatWindowStatusStore.setTextTimerStarted(os.clock());
        end;
        v86.textTransparencyMotor:setGoal(v8.spring(1, v56));
    end);
end;
v55.render = function(v87) --[[ Line: 272 ]] --[[ Name: render ]]
    -- upvalues: v49 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v29 (copy), l_isInExperienceUIVREnabled_0 (copy), v40 (copy), v39 (copy), v50 (copy), v24 (copy), v44 (copy), v32 (copy), v45 (copy), v43 (copy), v31 (copy), l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 (copy), l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 (copy), v10 (copy), v28 (copy), v36 (copy), v37 (copy), v41 (copy), v42 (copy), v21 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v23 (copy), l_manuallyInvokeAmpUpsell_0 (copy), v20 (copy), v22 (copy), v9 (copy), l_SelectionCursorProvider_0 (copy), l_CursorProvider_0 (copy), l_withSelectionCursorProvider_0 (copy), l_CursorKind_0 (copy)
    if v49() then
        if v87.props.isChatWindowVisible or v87.props.isChatInputBarVisible then
            v87.ChatWindowStatusStore.setOpenTimerStarted(os.clock());
        else
            v87.ChatWindowStatusStore.setClosedTimerStarted(os.clock());
        end;
    end;
    local v88 = if l_FFlagExpChatUseChatConfigStore_0 and v87.ChatConfigurationStore then v87.ChatConfigurationStore.getChatWindowSettings(false) else v87.props.chatWindowSettings;
    local v89 = v29.getBackgroundTransparency(v88, v87.props.clientSettings);
    local v90 = v29.getBackgroundColor(v88, v87.props.clientSettings);
    local v91 = nil;
    if l_isInExperienceUIVREnabled_0 then
        if v87.props.isSpatialUIEnabled then
            local v92 = v40() and v39() and v87.props.isChannelBarVisible;
            local l_isChatInputBarVisible_0 = v87.props.isChatInputBarVisible;
            v91 = if v92 and l_isChatInputBarVisible_0 then v50.WITH_CHANNEL_CHATINPUT_BAR else if not v92 or l_isChatInputBarVisible_0 then if not v92 and l_isChatInputBarVisible_0 then v50.WITH_CHATINPUT_BAR else v50.DEFAULT else v50.WITH_CHANNEL_BAR;
        else
            v91 = UDim2.fromScale(v24.ChatWindowSize.X.Scale * v88.WidthScale, v24.ChatWindowSize.Y.Scale * v88.HeightScale);
        end;
    end;
    local v94 = nil;
    local l_isChatInputBarVisible_1 = v87.props.isChatInputBarVisible;
    if v44 then
        v94 = v87.state.chatStatus;
        l_isChatInputBarVisible_1 = l_isChatInputBarVisible_1 and v32(v94);
    end;
    local v96 = v45 or v44 and v43 and not v31() and v87.props.canPlatformEnableChat() and v94 == "AgeVerificationRequired" and (not l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0() or v87.FOMOUpsellImpressionsCount and v87.FOMOUpsellImpressionsCount <= l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0);
    local function v104(v97) --[[ Line: 338 ]]
        -- upvalues: v10 (ref), v28 (ref), v87 (copy), v36 (ref), l_isInExperienceUIVREnabled_0 (ref), v91 (ref), v24 (ref), v88 (copy), v90 (copy), v89 (copy), v39 (ref), v37 (ref), v40 (ref), v41 (ref), v42 (ref), v21 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v96 (copy), v23 (ref), l_manuallyInvokeAmpUpsell_0 (ref), v20 (ref), l_isChatInputBarVisible_1 (ref), v22 (ref)
        return v10.createElement(v28.Provider, {
            value = {
                isSpatialUIEnabled = v87.props.isSpatialUIEnabled
            }
        }, {
            appLayout = v10.createElement("Frame", {
                AnchorPoint = v87.props.chatLayoutAlignment.AnchorPoint, 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                BackgroundTransparency = 1, 
                Position = v87.props.chatLayoutAlignment.Position, 
                SelectionBehaviorDown = if v36 then Enum.SelectionBehavior.Stop else nil, 
                SelectionBehaviorLeft = if v36 then Enum.SelectionBehavior.Stop else nil, 
                SelectionBehaviorRight = if v36 then Enum.SelectionBehavior.Stop else nil, 
                SelectionBehaviorUp = if v36 then Enum.SelectionBehavior.Stop else nil, 
                SelectionGroup = v36 and true or nil, 
                Size = if l_isInExperienceUIVREnabled_0 then v91 else if v87.props.isSpatialUIEnabled then UDim2.fromScale(0.95, 0.68) else UDim2.fromScale(v24.ChatWindowSize.X.Scale * v88.WidthScale, v24.ChatWindowSize.Y.Scale * v88.HeightScale), 
                [v10.Event.SelectionChanged] = v87.onContainerSelectionChanged
            }, {
                uiSizeConstraint = v10.createElement("UISizeConstraint", {
                    MaxSize = if v87.props.isSpatialUIEnabled then Vector2.new(1e999, 1e999) else Vector2.new(v24.ChatWindowMaxWidth, 1e999)
                }), 
                layout = v10.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = v87.props.chatLayoutAlignment.UIListLayoutVerticalAlignment
                }), 
                topBorder = v10.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/TopRoundedRect8px.png", 
                    ImageColor3 = v90, 
                    ImageTransparency = v87.transparencyValue:map(function(v98) --[[ Line: 381 ]]
                        -- upvalues: v89 (ref)
                        local l_v89_0 = v89;
                        return l_v89_0 + v98 * (1 - l_v89_0);
                    end), 
                    LayoutOrder = 1, 
                    SelectionImageObject = v97, 
                    Selectable = v36 and true or nil, 
                    ScaleType = Enum.ScaleType.Slice, 
                    Size = UDim2.new(1, 0, 0, 8), 
                    SliceCenter = Rect.new(8, 8, 24, 32), 
                    Visible = if v39() then (v87.props.isChatWindowVisible or v87.props.isChatInputBarVisible) and not v87.props.isChannelBarVisible else v87.props.isChatWindowVisible or v87.props.isChatInputBarVisible, 
                    [v10.Event.MouseEnter] = v87.props.onHovered, 
                    [v10.Event.MouseLeave] = v87.props.onUnhovered, 
                    [v10.Event.SelectionChanged] = if v37 then nil else v87.onBorderSelectionChanged, 
                    [v10.Ref] = if v37 then v87.topBorderRef else nil
                }, {
                    uiSizeConstraint = v10.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v24.ChatWindowMaxWidth, 1e999)
                    })
                }), 
                topPadding = v10.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 8), 
                    Visible = if v39() then v87.props.isChannelBarVisible else false, 
                    BackgroundTransparency = v87.transparencyValue:map(function(v100) --[[ Line: 410 ]]
                        -- upvalues: v89 (ref)
                        local l_v89_1 = v89;
                        return l_v89_1 + v100 * (1 - l_v89_1);
                    end), 
                    BackgroundColor3 = v88.BackgroundColor3, 
                    BorderSizePixel = 0, 
                    [v10.Event.MouseEnter] = v87.props.onHovered, 
                    [v10.Event.MouseLeave] = v87.props.onUnhovered, 
                    ZIndex = 0
                }), 
                chatWindow = (not v40() or v41 and v42 and true or v87.props.isChatWindowVisible) and v10.createElement(v21, {
                    LayoutOrder = 2, 
                    size = UDim2.fromScale(1, 1), 
                    transparencyValue = v87.transparencyValue, 
                    textTransparency = v87.textTransparencyValue, 
                    onHovered = v87.props.onHovered, 
                    onUnhovered = v87.props.onUnhovered, 
                    mutedUserIds = v87.props.mutedUserIds, 
                    canLocalUserChat = if l_FFlagExpChatUseMessagesStore_0 then nil else v87.props.canLocalUserChat, 
                    activateWhisperMode = v87.props.activateWhisperMode, 
                    resetTargetChannel = v87.props.resetTargetChannel, 
                    visible = v87.props.isChatWindowVisible, 
                    onAbsoluteSizeChanged = v87.onAbsoluteSizeChanged, 
                    onAbsolutePositionChanged = v87.onAbsolutePositionChanged, 
                    chatWindowSettings = v88, 
                    showTranslationButton = v87.props.showTranslationButton, 
                    isChannelBarVisible = if v39() then v87.props.isChannelBarVisible else false, 
                    isSpatialUIEnabled = v87.props.isSpatialUIEnabled
                }), 
                enableChatButton = if v96 then v10.createElement(v23, {
                    chatWindowSettings = v88, 
                    transparencyValue = v87.transparencyValue, 
                    addTopPadding = v87.props.isChatWindowVisible, 
                    onHovered = v87.props.onHovered, 
                    onUnhovered = v87.props.onUnhovered, 
                    isSpatialUIEnabled = v87.props.isSpatialUIEnabled, 
                    LayoutOrder = 3, 
                    visible = v87.props.isChatWindowVisible or v87.props.isChatInputBarVisible, 
                    onActivated = function() --[[ Line: 455 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_manuallyInvokeAmpUpsell_0 (ref)
                        l_manuallyInvokeAmpUpsell_0("InExperienceTextChatUpsell");
                    end
                }) else nil, 
                chatInputBar = v10.createElement(v20, {
                    LayoutOrder = 3, 
                    addTopPadding = v87.props.isChatWindowVisible, 
                    onSendChat = v87.props.onSendChat, 
                    onSendGlobalChat = v87.props.onSendGlobalChat, 
                    transparencyValue = v87.transparencyValue, 
                    canLocalUserChat = if l_FFlagExpChatUseMessagesStore_0 then nil else v87.props.canLocalUserChat, 
                    resetTargetChannel = v87.props.resetTargetChannel, 
                    visible = l_isChatInputBarVisible_1, 
                    onAbsoluteSizeChanged = v87.onAbsoluteSizeChanged, 
                    onAbsolutePositionChanged = v87.onAbsolutePositionChanged, 
                    chatWindowSettings = v88, 
                    isChannelBarVisible = if v39() then v87.props.isChannelBarVisible else false, 
                    isSpatialUIEnabled = v87.props.isSpatialUIEnabled
                }), 
                channelBar = (not v40() or v87.props.isChannelBarVisible) and v10.createElement(v22, {
                    LayoutOrder = 4, 
                    size = UDim2.fromScale(1, 1), 
                    transparencyValue = v87.transparencyValue, 
                    onHovered = v87.props.onHovered, 
                    onUnhovered = v87.props.onUnhovered, 
                    chatWindowSettings = v88, 
                    visible = if v39() then v87.props.isChannelBarVisible else false, 
                    topBorderRef = if v37 then v87.topBorderRef else nil
                }), 
                bottomBorder = v10.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/BottomRoundedRect8px.png", 
                    ImageColor3 = v90, 
                    ImageTransparency = v87.transparencyValue:map(function(v102) --[[ Line: 495 ]]
                        -- upvalues: v89 (ref)
                        local l_v89_2 = v89;
                        return l_v89_2 + v102 * (1 - l_v89_2);
                    end), 
                    LayoutOrder = 5, 
                    ScaleType = Enum.ScaleType.Slice, 
                    Size = UDim2.new(1, 0, 0, 8), 
                    SliceCenter = Rect.new(8, 0, 24, 16), 
                    Visible = v87.props.isChatWindowVisible or v87.props.isChatInputBarVisible, 
                    [v10.Event.MouseEnter] = v87.props.onHovered, 
                    [v10.Event.MouseLeave] = v87.props.onUnhovered
                }, {
                    uiSizeConstraint = v10.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v24.ChatWindowMaxWidth, 1e999)
                    })
                })
            })
        });
    end;
    if v36 then
        return v10.createElement(v9.FocusNavigationContext.Provider, {
            value = v87.focusNavigationService
        }, {
            CursorProvider = v10.createElement(l_SelectionCursorProvider_0, {}, {
                NewCursorProvider = v10.createElement(l_CursorProvider_0, {}, {
                    l_withSelectionCursorProvider_0(function(v105) --[[ Line: 521 ]]
                        -- upvalues: v104 (copy), l_CursorKind_0 (ref)
                        return v104(v105(l_CursorKind_0.Invisible));
                    end)
                })
            })
        });
    else
        return v104(nil);
    end;
end;
v55.willUnmount = function(v106) --[[ Line: 532 ]] --[[ Name: willUnmount ]]
    -- upvalues: v49 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v44 (copy)
    v106.disposeBackgroundEffect();
    v106.disposeTextEffect();
    v106.textTransparencyMotor:destroy();
    v106.backgroundTransparencyMotor:destroy();
    if v49() and v106.localPlayerLeavingConnection then
        v106.localPlayerLeavingConnection:Disconnect();
    end;
    if l_FFlagExpChatUseChatConfigStore_0 and v106.disposeChatWindowSettingsEffect then
        v106.disposeChatWindowSettingsEffect();
    end;
    if l_FFlagExpChatUseChatConfigStore_0 and v106.disposeChatInputBarSettingsEffect then
        v106.disposeChatInputBarSettingsEffect();
    end;
    if v44 and v106.disposeChatStatusEffect then
        v106.disposeChatStatusEffect();
    end;
end;
return v55;