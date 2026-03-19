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
local v41 = require(l_script_FirstAncestor_0.Flags.FFlagAEGIS2ExpChatShowEnableChatButton);
local v42 = require(l_script_FirstAncestor_0.Flags.FFlagAEGIS2EnableGatesForExpChat);
local v43 = game:DefineFastFlag("DebugForceEnableChatButtonOn", false);
local l_FFlagExpChatUseMessagesStore_0 = v14.FFlagExpChatUseMessagesStore;
local l_FFlagExpChatUseChatConfigStore_0 = v14.FFlagExpChatUseChatConfigStore;
local l_isInExperienceUIVREnabled_0 = require(l_Parent_0.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v47 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatTriggerWindowStatusEvent);
local v48 = if l_isInExperienceUIVREnabled_0 then {
    DEFAULT = UDim2.fromScale(0.95, 0.94), 
    WITH_CHANNEL_BAR = UDim2.fromScale(0.95, 0.78), 
    WITH_CHATINPUT_BAR = UDim2.fromScale(0.95, 0.76), 
    WITH_CHANNEL_CHATINPUT_BAR = UDim2.fromScale(0.95, 0.6098)
} else nil;
local v49 = require(l_script_FirstAncestor_0.Stores.GetFocusNavigationStore);
local v50 = require(l_script_FirstAncestor_0.Stores.GetTransparencyStore);
local v51 = require(l_script_FirstAncestor_0.Stores.GetChatWindowStatusStore);
local l_manuallyInvokeAmpUpsell_0 = v12.Utils.manuallyInvokeAmpUpsell;
local v53 = v10.PureComponent:extend("AppLayout");
v53.defaultProps = {
    addTopPadding = true, 
    canLocalUserChat = false, 
    isChatInputBarVisible = true, 
    isChatWindowVisible = true, 
    isChannelBarVisible = false, 
    LayoutOrder = 1, 
    mutedUserIds = nil, 
    onSendChat = nil, 
    textTimer = v27.new(v24.ChatWindowTextFadeOutTime), 
    timer = v27.new(v24.ChatWindowBackgroundFadeOutTime), 
    isSpatialUIEnabled = false, 
    canPlatformEnableChat = if v41 then v30 else nil
};
local v54 = {
    frequency = 1.25, 
    dampingRatio = 1
};
v53.init = function(v55) --[[ Line: 91 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), v8 (copy), v50 (copy), v47 (copy), v51 (copy), l_Players_0 (copy), l_TextChatService_0 (copy), l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_HttpService_0 (copy), l_FStringExpChatFOMOUpsellImpressionsCountKey_0 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v25 (copy), v38 (copy), v54 (copy), l_createEffect_0 (copy), v42 (copy), v26 (copy), v36 (copy), v9 (copy), v37 (copy), v49 (copy), l_FocusUtils_0 (copy)
    local v56, v57 = v10.createBinding(0);
    v55.transparencyValue = v56;
    v55.updateBackgroundTransparency = v57;
    v55.backgroundTransparencyMotor = v8.createSingleMotor(0);
    v55.backgroundTransparencyMotor:onStep(v55.updateBackgroundTransparency);
    v56, v57 = v10.createBinding(0);
    v55.textTransparencyValue = v56;
    v55.updateTextTransparencyValue = v57;
    v55.textTransparencyMotor = v8.createSingleMotor(0);
    v55.textTransparencyMotor:onStep(v55.updateTextTransparencyValue);
    v56 = v50(false);
    v55.ChatWindowStatusStore = if v47() then v51(false) else nil;
    if v47() then
        v55.localPlayerLeavingConnection = l_Players_0.PlayerRemoving:Connect(function(v58) --[[ Line: 106 ]]
            -- upvalues: l_Players_0 (ref), v55 (copy), l_TextChatService_0 (ref)
            if v58 == l_Players_0.LocalPlayer then
                v55.ChatWindowStatusStore.setPreviousChatWindowState(v55.ChatWindowStatusStore.getCurrentChatWindowState(false));
                local v59 = v55.ChatWindowStatusStore.getDurationUpdates(false);
                l_TextChatService_0:SendExpChatWindowStatusChange(v59.closedDuration, v59.openDuration, v59.backgroundIdleDuration, v59.textIdleDuration);
            end;
        end);
    end;
    if l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0() then
        v57 = {};
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 128 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.ExpChatFOMOUpsellImpressionsCount);
        end);
        if l_status_0 and l_result_0 ~= "" then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 133 ]]
                -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
                return l_HttpService_0:JSONDecode(l_result_0);
            end);
            if l_status_1 then
                v57 = l_result_1;
            end;
        end;
        v55.FOMOUpsellImpressionsCount = v57[l_FStringExpChatFOMOUpsellImpressionsCountKey_0];
    end;
    if l_FFlagExpChatUseChatConfigStore_0 then
        v55.ChatConfigurationStore = v25(false);
    end;
    v55.resetBackgroundTransparency = function() --[[ Line: 148 ]]
        -- upvalues: v38 (ref), v56 (copy), v55 (copy), v8 (ref), v47 (ref), v54 (ref)
        local v64 = if v38 then v56.getIsFocused(false) else v56.getIsTextBoxFocused(false);
        v55.backgroundTransparencyMotor:setGoal(v8.instant(0));
        v55.props.timer:stop();
        if v64 == false and v55.props.isSpatialUIEnabled == false then
            v55.props.timer:start():andThen(function() --[[ Line: 157 ]]
                -- upvalues: v47 (ref), v55 (ref), v8 (ref), v54 (ref)
                if v47() then
                    v55.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock());
                end;
                v55.backgroundTransparencyMotor:setGoal(v8.spring(1, v54));
            end);
        end;
    end;
    v55.resetTextTransparency = function() --[[ Line: 166 ]]
        -- upvalues: v38 (ref), v56 (copy), v55 (copy), v8 (ref), v47 (ref), v54 (ref)
        local v65 = if v38 then v56.getIsFocused(false) else v56.getIsTextBoxFocused(false);
        v55.textTransparencyMotor:setGoal(v8.instant(0));
        v55.props.textTimer:stop();
        if v65 == false then
            v55.props.textTimer:start():andThen(function() --[[ Line: 175 ]]
                -- upvalues: v47 (ref), v55 (ref), v8 (ref), v54 (ref)
                if v47() then
                    v55.ChatWindowStatusStore.setTextTimerStarted(os.clock());
                end;
                v55.textTransparencyMotor:setGoal(v8.spring(1, v54));
            end);
        end;
    end;
    v55.disposeBackgroundEffect = l_createEffect_0(function(v66) --[[ Line: 183 ]]
        -- upvalues: v56 (copy), v55 (copy)
        local _ = v56.getLastActivity(v66);
        v55.resetBackgroundTransparency();
        v55.resetTextTransparency();
    end);
    v55.disposeTextEffect = l_createEffect_0(function(v68) --[[ Line: 189 ]]
        -- upvalues: v56 (copy), v55 (copy)
        local _ = v56.getLastMessageActivity(v68);
        v55.resetTextTransparency();
    end);
    if v42 then
        v55.disposeChatStatusEffect = l_createEffect_0(function(v70) --[[ Line: 195 ]]
            -- upvalues: v26 (ref), v55 (copy)
            local v71 = v26(v70).getChatStatus(v70);
            v55:setState({
                chatStatus = v71
            });
        end);
    end;
    v55.onAbsolutePositionChanged = function(v72, v73) --[[ Line: 205 ]]
        v73.AbsolutePositionWrite = v72.AbsolutePosition;
    end;
    v55.onAbsoluteSizeChanged = function(v74, v75) --[[ Line: 209 ]]
        v75.AbsoluteSizeWrite = v74.AbsoluteSize;
    end;
    if v36 then
        v55.focusNavigationService = v9.FocusNavigationService.new(v9.EngineInterface.CoreGui);
        v55.topBorderRef = if v37 then v10.createRef() else nil;
        v55.onContainerSelectionChanged = function(v76, _, _, v79) --[[ Line: 219 ]]
            -- upvalues: v49 (ref), v38 (ref), v56 (copy), v37 (ref), v55 (copy), l_FocusUtils_0 (ref)
            if v79 == nil or not v79:IsDescendantOf(v76) then
                v49(false).unfocusChatInputBar();
                if v38 then
                    v56.clearWindowFocusInput();
                    return;
                end;
            else
                if v38 then
                    v56.setWindowFocusInput();
                end;
                if v37 and v79 == v55.topBorderRef.current then
                    l_FocusUtils_0.FocusOnChrome(function() --[[ Line: 233 ]]
                        -- upvalues: v49 (ref)
                        v49(false).unfocusChatInputBar();
                    end, "chat");
                end;
            end;
        end;
        if not v37 then
            v55.onBorderSelectionChanged = function(_, v81, _, _) --[[ Line: 242 ]]
                -- upvalues: l_FocusUtils_0 (ref), v49 (ref)
                if v81 then
                    l_FocusUtils_0.FocusOnChrome(function() --[[ Line: 244 ]]
                        -- upvalues: v49 (ref)
                        v49(false).unfocusChatInputBar();
                    end, "chat");
                end;
            end;
        end;
    end;
end;
v53.didMount = function(v84) --[[ Line: 253 ]] --[[ Name: didMount ]]
    -- upvalues: v47 (copy), v8 (copy), v54 (copy)
    v84.props.timer:start():andThen(function() --[[ Line: 254 ]]
        -- upvalues: v47 (ref), v84 (copy), v8 (ref), v54 (ref)
        if v47() then
            v84.ChatWindowStatusStore.setBackgroundTimerStarted(os.clock());
        end;
        v84.backgroundTransparencyMotor:setGoal(v8.spring(1, v54));
    end);
    v84.props.textTimer:start():andThen(function() --[[ Line: 261 ]]
        -- upvalues: v47 (ref), v84 (copy), v8 (ref), v54 (ref)
        if v47() then
            v84.ChatWindowStatusStore.setTextTimerStarted(os.clock());
        end;
        v84.textTransparencyMotor:setGoal(v8.spring(1, v54));
    end);
end;
v53.render = function(v85) --[[ Line: 269 ]] --[[ Name: render ]]
    -- upvalues: v47 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v29 (copy), l_isInExperienceUIVREnabled_0 (copy), v40 (copy), v39 (copy), v48 (copy), v24 (copy), v42 (copy), v32 (copy), v43 (copy), v41 (copy), v31 (copy), l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 (copy), l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 (copy), v10 (copy), v28 (copy), v36 (copy), v37 (copy), v21 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v23 (copy), l_manuallyInvokeAmpUpsell_0 (copy), v20 (copy), v22 (copy), v9 (copy), l_SelectionCursorProvider_0 (copy), l_CursorProvider_0 (copy), l_withSelectionCursorProvider_0 (copy), l_CursorKind_0 (copy)
    if v47() then
        if v85.props.isChatWindowVisible or v85.props.isChatInputBarVisible then
            v85.ChatWindowStatusStore.setOpenTimerStarted(os.clock());
        else
            v85.ChatWindowStatusStore.setClosedTimerStarted(os.clock());
        end;
    end;
    local v86 = if l_FFlagExpChatUseChatConfigStore_0 and v85.ChatConfigurationStore then v85.ChatConfigurationStore.getChatWindowSettings(false) else v85.props.chatWindowSettings;
    local v87 = v29.getBackgroundTransparency(v86, v85.props.clientSettings);
    local v88 = v29.getBackgroundColor(v86, v85.props.clientSettings);
    local v89 = nil;
    if l_isInExperienceUIVREnabled_0 then
        if v85.props.isSpatialUIEnabled then
            local v90 = v40() and v39() and v85.props.isChannelBarVisible;
            local l_isChatInputBarVisible_0 = v85.props.isChatInputBarVisible;
            v89 = if v90 and l_isChatInputBarVisible_0 then v48.WITH_CHANNEL_CHATINPUT_BAR else if not v90 or l_isChatInputBarVisible_0 then if not v90 and l_isChatInputBarVisible_0 then v48.WITH_CHATINPUT_BAR else v48.DEFAULT else v48.WITH_CHANNEL_BAR;
        else
            v89 = UDim2.fromScale(v24.ChatWindowSize.X.Scale * v86.WidthScale, v24.ChatWindowSize.Y.Scale * v86.HeightScale);
        end;
    end;
    local v92 = nil;
    local l_isChatInputBarVisible_1 = v85.props.isChatInputBarVisible;
    if v42 then
        v92 = v85.state.chatStatus;
        l_isChatInputBarVisible_1 = l_isChatInputBarVisible_1 and v32(v92);
    end;
    local v94 = v43 or v42 and v41 and not v31() and v85.props.canPlatformEnableChat() and v92 == "AgeVerificationRequired" and (not l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0() or v85.FOMOUpsellImpressionsCount and v85.FOMOUpsellImpressionsCount <= l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0);
    local function v102(v95) --[[ Line: 335 ]]
        -- upvalues: v10 (ref), v28 (ref), v85 (copy), v36 (ref), l_isInExperienceUIVREnabled_0 (ref), v89 (ref), v24 (ref), v86 (copy), v88 (copy), v87 (copy), v39 (ref), v37 (ref), v40 (ref), v21 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v94 (copy), v23 (ref), l_manuallyInvokeAmpUpsell_0 (ref), v20 (ref), l_isChatInputBarVisible_1 (ref), v22 (ref)
        return v10.createElement(v28.Provider, {
            value = {
                isSpatialUIEnabled = v85.props.isSpatialUIEnabled
            }
        }, {
            appLayout = v10.createElement("Frame", {
                AnchorPoint = v85.props.chatLayoutAlignment.AnchorPoint, 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                BackgroundTransparency = 1, 
                Position = v85.props.chatLayoutAlignment.Position, 
                SelectionBehaviorDown = if v36 then Enum.SelectionBehavior.Stop else nil, 
                SelectionBehaviorLeft = if v36 then Enum.SelectionBehavior.Stop else nil, 
                SelectionBehaviorRight = if v36 then Enum.SelectionBehavior.Stop else nil, 
                SelectionBehaviorUp = if v36 then Enum.SelectionBehavior.Stop else nil, 
                SelectionGroup = v36 and true or nil, 
                Size = if l_isInExperienceUIVREnabled_0 then v89 else if v85.props.isSpatialUIEnabled then UDim2.fromScale(0.95, 0.68) else UDim2.fromScale(v24.ChatWindowSize.X.Scale * v86.WidthScale, v24.ChatWindowSize.Y.Scale * v86.HeightScale), 
                [v10.Event.SelectionChanged] = v85.onContainerSelectionChanged
            }, {
                uiSizeConstraint = v10.createElement("UISizeConstraint", {
                    MaxSize = if v85.props.isSpatialUIEnabled then Vector2.new(1e999, 1e999) else Vector2.new(v24.ChatWindowMaxWidth, 1e999)
                }), 
                layout = v10.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = v85.props.chatLayoutAlignment.UIListLayoutVerticalAlignment
                }), 
                topBorder = v10.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/TopRoundedRect8px.png", 
                    ImageColor3 = v88, 
                    ImageTransparency = v85.transparencyValue:map(function(v96) --[[ Line: 378 ]]
                        -- upvalues: v87 (ref)
                        local l_v87_0 = v87;
                        return l_v87_0 + v96 * (1 - l_v87_0);
                    end), 
                    LayoutOrder = 1, 
                    SelectionImageObject = v95, 
                    Selectable = v36 and true or nil, 
                    ScaleType = Enum.ScaleType.Slice, 
                    Size = UDim2.new(1, 0, 0, 8), 
                    SliceCenter = Rect.new(8, 8, 24, 32), 
                    Visible = if v39() then (v85.props.isChatWindowVisible or v85.props.isChatInputBarVisible) and not v85.props.isChannelBarVisible else v85.props.isChatWindowVisible or v85.props.isChatInputBarVisible, 
                    [v10.Event.MouseEnter] = v85.props.onHovered, 
                    [v10.Event.MouseLeave] = v85.props.onUnhovered, 
                    [v10.Event.SelectionChanged] = if v37 then nil else v85.onBorderSelectionChanged, 
                    [v10.Ref] = if v37 then v85.topBorderRef else nil
                }, {
                    uiSizeConstraint = v10.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v24.ChatWindowMaxWidth, 1e999)
                    })
                }), 
                topPadding = v10.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 8), 
                    Visible = if v39() then v85.props.isChannelBarVisible else false, 
                    BackgroundTransparency = v85.transparencyValue:map(function(v98) --[[ Line: 407 ]]
                        -- upvalues: v87 (ref)
                        local l_v87_1 = v87;
                        return l_v87_1 + v98 * (1 - l_v87_1);
                    end), 
                    BackgroundColor3 = v86.BackgroundColor3, 
                    BorderSizePixel = 0, 
                    [v10.Event.MouseEnter] = v85.props.onHovered, 
                    [v10.Event.MouseLeave] = v85.props.onUnhovered, 
                    ZIndex = 0
                }), 
                chatWindow = (not v40() or v85.props.isChatWindowVisible) and v10.createElement(v21, {
                    LayoutOrder = 2, 
                    size = UDim2.fromScale(1, 1), 
                    transparencyValue = v85.transparencyValue, 
                    textTransparency = v85.textTransparencyValue, 
                    onHovered = v85.props.onHovered, 
                    onUnhovered = v85.props.onUnhovered, 
                    mutedUserIds = v85.props.mutedUserIds, 
                    canLocalUserChat = if l_FFlagExpChatUseMessagesStore_0 then nil else v85.props.canLocalUserChat, 
                    activateWhisperMode = v85.props.activateWhisperMode, 
                    resetTargetChannel = v85.props.resetTargetChannel, 
                    visible = v85.props.isChatWindowVisible, 
                    onAbsoluteSizeChanged = v85.onAbsoluteSizeChanged, 
                    onAbsolutePositionChanged = v85.onAbsolutePositionChanged, 
                    chatWindowSettings = v86, 
                    showTranslationButton = v85.props.showTranslationButton, 
                    isChannelBarVisible = if v39() then v85.props.isChannelBarVisible else false, 
                    isSpatialUIEnabled = v85.props.isSpatialUIEnabled
                }), 
                enableChatButton = if v94 then v10.createElement(v23, {
                    chatWindowSettings = v86, 
                    transparencyValue = v85.transparencyValue, 
                    addTopPadding = v85.props.isChatWindowVisible, 
                    onHovered = v85.props.onHovered, 
                    onUnhovered = v85.props.onUnhovered, 
                    isSpatialUIEnabled = v85.props.isSpatialUIEnabled, 
                    LayoutOrder = 3, 
                    visible = v85.props.isChatWindowVisible or v85.props.isChatInputBarVisible, 
                    onActivated = function() --[[ Line: 451 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_manuallyInvokeAmpUpsell_0 (ref)
                        l_manuallyInvokeAmpUpsell_0("InExperienceTextChatUpsell");
                    end
                }) else nil, 
                chatInputBar = v10.createElement(v20, {
                    LayoutOrder = 3, 
                    addTopPadding = v85.props.isChatWindowVisible, 
                    onSendChat = v85.props.onSendChat, 
                    transparencyValue = v85.transparencyValue, 
                    canLocalUserChat = if l_FFlagExpChatUseMessagesStore_0 then nil else v85.props.canLocalUserChat, 
                    resetTargetChannel = v85.props.resetTargetChannel, 
                    visible = l_isChatInputBarVisible_1, 
                    onAbsoluteSizeChanged = v85.onAbsoluteSizeChanged, 
                    onAbsolutePositionChanged = v85.onAbsolutePositionChanged, 
                    chatWindowSettings = v86, 
                    isChannelBarVisible = if v39() then v85.props.isChannelBarVisible else false, 
                    isSpatialUIEnabled = v85.props.isSpatialUIEnabled
                }), 
                channelBar = (not v40() or v85.props.isChannelBarVisible) and v10.createElement(v22, {
                    LayoutOrder = 4, 
                    size = UDim2.fromScale(1, 1), 
                    transparencyValue = v85.transparencyValue, 
                    onHovered = v85.props.onHovered, 
                    onUnhovered = v85.props.onUnhovered, 
                    chatWindowSettings = v86, 
                    visible = if v39() then v85.props.isChannelBarVisible else false, 
                    topBorderRef = if v37 then v85.topBorderRef else nil
                }), 
                bottomBorder = v10.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/BottomRoundedRect8px.png", 
                    ImageColor3 = v88, 
                    ImageTransparency = v85.transparencyValue:map(function(v100) --[[ Line: 490 ]]
                        -- upvalues: v87 (ref)
                        local l_v87_2 = v87;
                        return l_v87_2 + v100 * (1 - l_v87_2);
                    end), 
                    LayoutOrder = 5, 
                    ScaleType = Enum.ScaleType.Slice, 
                    Size = UDim2.new(1, 0, 0, 8), 
                    SliceCenter = Rect.new(8, 0, 24, 16), 
                    Visible = v85.props.isChatWindowVisible or v85.props.isChatInputBarVisible, 
                    [v10.Event.MouseEnter] = v85.props.onHovered, 
                    [v10.Event.MouseLeave] = v85.props.onUnhovered
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
            value = v85.focusNavigationService
        }, {
            CursorProvider = v10.createElement(l_SelectionCursorProvider_0, {}, {
                NewCursorProvider = v10.createElement(l_CursorProvider_0, {}, {
                    l_withSelectionCursorProvider_0(function(v103) --[[ Line: 516 ]]
                        -- upvalues: v102 (copy), l_CursorKind_0 (ref)
                        return v102(v103(l_CursorKind_0.Invisible));
                    end)
                })
            })
        });
    else
        return v102(nil);
    end;
end;
v53.willUnmount = function(v104) --[[ Line: 527 ]] --[[ Name: willUnmount ]]
    -- upvalues: v47 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v42 (copy)
    v104.disposeBackgroundEffect();
    v104.disposeTextEffect();
    v104.textTransparencyMotor:destroy();
    v104.backgroundTransparencyMotor:destroy();
    if v47() and v104.localPlayerLeavingConnection then
        v104.localPlayerLeavingConnection:Disconnect();
    end;
    if l_FFlagExpChatUseChatConfigStore_0 and v104.disposeChatWindowSettingsEffect then
        v104.disposeChatWindowSettingsEffect();
    end;
    if l_FFlagExpChatUseChatConfigStore_0 and v104.disposeChatInputBarSettingsEffect then
        v104.disposeChatInputBarSettingsEffect();
    end;
    if v42 and v104.disposeChatStatusEffect then
        v104.disposeChatStatusEffect();
    end;
end;
return v53;