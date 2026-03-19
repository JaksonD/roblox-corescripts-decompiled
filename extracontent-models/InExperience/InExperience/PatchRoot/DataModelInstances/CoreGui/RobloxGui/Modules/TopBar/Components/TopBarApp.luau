local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local _ = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_TweenService_0 = game:GetService("TweenService");
local v8 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v9 = require(l_CorePackages_0.Packages.Signals);
local v10 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_View_0 = require(l_CorePackages_0.Packages.Foundation).View;
local v12 = require(l_CorePackages_0.Packages.Roact);
local v13 = require(l_CorePackages_0.Packages.React);
local v14 = require(l_CorePackages_0.Packages.RoactRodux);
local v15 = require(l_CorePackages_0.Packages.t);
local v16 = require(l_CorePackages_0.Packages.UIBlox);
local l_Interactable_0 = v16.Core.Control.Interactable;
local l_ControlState_0 = v16.Core.Control.Enum.ControlState;
local l_Analytics_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics;
local l_withStyle_0 = v16.Core.Style.withStyle;
local l_ImageSetButton_0 = v16.Core.ImageSet.ImageSetButton;
local l_Images_0 = v16.App.ImageSet.Images;
local l_SelectionCursorProvider_0 = v16.App.SelectionImage.SelectionCursorProvider;
local v24 = require(l_CorePackages_0.Workspace.Packages.Songbird);
local l_Traversal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).Traversal;
local v26 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_Stores_0 = v26.Stores;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v30 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
local l_SettingsShowSignal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal;
local l_Presentation_0 = script.Parent.Presentation;
local v33 = require(l_Presentation_0.MenuIcon);
local v34 = require(l_Presentation_0.ChatIcon);
local v35 = require(l_Presentation_0.MoreMenu);
local v36 = require(l_Presentation_0.HealthBar);
local v37 = require(l_Presentation_0.HurtOverlay);
local v38 = require(l_Presentation_0.GamepadNavigationDialog);
local v39 = require(l_Presentation_0.HeadsetMenu);
local l_HeadsetDisconnectDialog_0 = v26.Components.HeadsetDisconnectDialog;
local v41 = require(l_Presentation_0.VoiceBetaBadge);
local v42 = require(script.Parent.TraversalBackButton);
local l_Chrome_0 = script.Parent.Parent.Parent.Chrome;
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local v45 = require(l_Chrome_0.Integrations.MusicUtility.Constants);
local l_FFlagEnableConsoleExpControls_0 = v8.FFlagEnableConsoleExpControls;
local l_FFlagTopBarSignalizeKeepOutAreas_0 = v26.Flags.FFlagTopBarSignalizeKeepOutAreas;
local l_FFlagAddUILessMode_0 = v8.FFlagAddUILessMode;
local l_FIntAddUILessModeVariant_0 = v8.FIntAddUILessModeVariant;
local v50 = game:DefineFastInt("UILessTooltipDuration", 10);
local l_FFlagTopBarSignalizeMenuOpen_0 = v26.Flags.FFlagTopBarSignalizeMenuOpen;
local l_FFlagTopBarSignalizeScreenSize_0 = v26.Flags.FFlagTopBarSignalizeScreenSize;
local l_FFlagAddTraversalBackButton_0 = l_Traversal_0.Flags.FFlagAddTraversalBackButton;
local v54 = game:DefineFastFlag("UseNewHeadsetDisconnectDialog", false);
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v57 = nil;
local v58 = nil;
local v59 = nil;
if l_Enabled_0() then
    v57 = require(l_Chrome_0.ChromeShared.Unibar);
end;
if game:GetEngineFeature("InGameChromeSignalAPI") then
    v58 = require(l_Chrome_0.ChromeShared.Service.KeepOutAreasHandler);
    if l_Enabled_0() then
        v59 = require(l_Chrome_0.ChromeShared.Analytics);
    end;
end;
local v60 = nil;
local v61 = nil;
if l_Enabled_0() then
    v60 = require(l_Chrome_0.ChromeShared.Service.LocalStore);
    v61 = require(l_Chrome_0.ChromeShared.Unibar.Constants);
end;
local v62 = require(script.Parent.Connection);
local l_Parent_0 = l_Presentation_0.Parent.Parent;
local v64 = require(l_Parent_0.Constants);
local v65 = require(l_Parent_0.Actions.SetScreenSize);
local v66 = require(l_Parent_0.Actions.SetKeepOutArea);
local v67 = require(l_Parent_0.Actions.RemoveKeepOutArea);
local v68 = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then require(script.Parent.MenuIconContext) else nil;
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then
    v70 = require(script.Parent.GamepadConnector);
    v71 = v8.FFlagAddMenuNavigationToggleDialog;
    v72 = require(l_Presentation_0.GamepadMenu.MenuNavigationToggleDialog);
else
    v69 = require(l_Presentation_0.GamepadMenu);
end;
local v73 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v74 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v75 = require(l_RobloxGui_0.Modules.isNewTiltIconEnabled);
local v76 = require(l_RobloxGui_0.Modules.Flags.GetFFlagBetaBadge);
local v77 = require(l_Parent_0.Flags.FFlagGamepadNavigationDialogABTest);
local l_GetFFlagEnableCrossExpVoice_0 = v8.GetFFlagEnableCrossExpVoice;
local v79 = require(script.Parent.Parent.Parent.Chrome.Integrations.Party.PartyMicBinder);
local l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 = v8.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice;
local v81 = nil;
if game:GetEngineFeature("VoiceChatSupported") and l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and l_Enabled_0() then
    v81 = require(script.Parent.Parent.Parent.Chrome.Integrations.JoinVoiceBinder);
end;
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v83 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v84 = require(script.Parent.Parent.TopBarAppPolicy);
local v85 = l_Enabled_0();
local v86 = if l_isInExperienceUIVREnabled_0 and l_Enabled_0() then require(script.Parent.VRBottomUnibar) else require(l_RobloxGui_0.Modules.VR.VRBottomBar.VRBottomBar);
local function _(v87) --[[ Line: 153 ]] --[[ Name: selectMenuOpen ]]
    return v87.displayOptions.menuOpen or v87.displayOptions.inspectMenuOpen;
end;
local v89 = v12.PureComponent:extend("TopBarApp");
v89.validateProps = v15.strictInterface({
    menuOpen = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else v15.optional(v15.boolean), 
    inspectMenuOpen = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else v15.optional(v15.boolean), 
    displayBetaBadge = v15.boolean, 
    setScreenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v15.callback, 
    setKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v15.callback, 
    removeKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v15.callback, 
    showBadgeOver12 = v15.optional(v15.boolean)
});
v89.init = function(v90) --[[ Line: 172 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), v9 (copy), v10 (copy), l_FFlagAddUILessMode_0 (copy), l_Stores_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_TweenService_0 (copy), v60 (ref), v61 (ref), v50 (copy), v30 (copy), l_Constants_0 (copy), l_ContextActionService_0 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), l_SettingsShowSignal_0 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v26 (copy), l_Enabled_0 (copy), l_Chrome_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v70 (ref), v13 (copy), l_TextChatService_0 (copy)
    local v91, v92 = v12.createBinding(UDim2.new());
    v90.unibarRightSidePosition = v91;
    v90.setUnibarRightSidePosition = v92;
    v91, v92 = v12.createBinding(false);
    v90.closeButtonState = v91;
    v90.setCloseButtonState = v92;
    v90.disposeUiScaleEffect = v9.createEffect(function(v93) --[[ Line: 175 ]]
        -- upvalues: v10 (ref), v90 (copy)
        local v94 = v10.GetDisplayStore(v93);
        v90:setState({
            UiScale = v94.getUIScale(v93)
        });
    end);
    if l_FFlagAddUILessMode_0 then
        v90.uiLessStore = l_Stores_0.GetUILessStore(false);
        if l_FIntAddUILessModeVariant_0 ~= 0 then
            v91, v92 = v12.createBinding(false);
            v90.uiLessTooltipVisible = v91;
            v90.setUILessTooltipVisible = v92;
            v91, v92 = v12.createBinding(0);
            v90.uiLessTooltipTransparency = v91;
            v90.setUILessTooltipTransparency = v92;
            v90.fadeOutUILessTooltip = function() --[[ Line: 189 ]]
                -- upvalues: v90 (copy), l_TweenService_0 (ref)
                local l_NumberValue_0 = Instance.new("NumberValue");
                l_NumberValue_0.Value = 0;
                l_NumberValue_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 192 ]]
                    -- upvalues: v90 (ref), l_NumberValue_0 (copy)
                    v90.setUILessTooltipTransparency(l_NumberValue_0.Value);
                end);
                local v96 = {
                    Value = 1
                };
                local v97 = TweenInfo.new(0.5);
                v90.uiLessTooltipTween = l_TweenService_0:Create(l_NumberValue_0, v97, v96);
                v90.uiLessTooltipTween.Completed:Connect(function() --[[ Line: 199 ]]
                    -- upvalues: v90 (ref)
                    v90.setUILessTooltipVisible(false);
                    v90.uiLessTooltipTween = nil;
                end);
                v90.uiLessTooltipTween:Play();
            end;
            v90.cleanupUILessTooltip = function() --[[ Line: 207 ]]
                -- upvalues: v90 (copy)
                if v90.uiLessTooltipTween then
                    v90.uiLessTooltipTween:Cancel();
                    v90.uiLessTooltipTween = nil;
                end;
                if v90.uiLessTooltipTimer then
                    task.cancel(v90.uiLessTooltipTimer);
                    v90.uiLessTooltipTimer = nil;
                end;
            end;
            if v90.uiLessStore.getUILessModeEnabled(false) then
                v91 = true;
                if v60 then
                    v92 = v60.loadForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2") or 0;
                    v91 = v92 < v61.MAX_NUM_UNIVERSES_SHOWN;
                    if v91 then
                        v60.storeForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2", v92 + 1);
                    end;
                end;
                if v91 then
                    v90.setUILessTooltipVisible(true);
                    v90.uiLessTooltipTimer = task.delay(v50, function() --[[ Line: 230 ]]
                        -- upvalues: v90 (copy)
                        v90.fadeOutUILessTooltip();
                        v90.uiLessTooltipTimer = nil;
                    end);
                end;
            end;
            l_ContextActionService_0:BindCoreAction("ToggleUILess", function(_, v99) --[[ Line: 237 ]]
                -- upvalues: v90 (copy), l_FIntAddUILessModeVariant_0 (ref), v30 (ref), l_Constants_0 (ref)
                if v99 ~= Enum.UserInputState.Begin then
                    return;
                else
                    if v90.uiLessStore.getUILessModeEnabled(false) then
                        if l_FIntAddUILessModeVariant_0 == 1 then
                            v90.uiLessStore.setUIVisible(function(v100) --[[ Line: 242 ]]
                                -- upvalues: v30 (ref), l_Constants_0 (ref)
                                if v100 == v30:GetVisibility() then
                                    v30:PopMenu(false, true, l_Constants_0.AnalyticsMenuOpenTypes.Keyboard);
                                end;
                                return not v100;
                            end);
                            v90.cleanupUILessTooltip();
                            v90.setUILessTooltipVisible(false);
                            return;
                        elseif l_FIntAddUILessModeVariant_0 == 2 then
                            v90.uiLessStore.setUIVisible(function(v101) --[[ Line: 253 ]]
                                return not v101;
                            end);
                            if v30:GetVisibility() then
                                v30:PopMenu(false, true, l_Constants_0.AnalyticsMenuOpenTypes.Keyboard);
                            end;
                            v90.cleanupUILessTooltip();
                            v90.setUILessTooltipVisible(false);
                            return;
                        end;
                    else
                        v30:PopMenu(false, true, l_Constants_0.AnalyticsMenuOpenTypes.Keyboard);
                    end;
                    return;
                end;
            end, false, Enum.KeyCode.Escape);
        end;
    end;
    if l_FFlagTopBarSignalizeMenuOpen_0 then
        v91, v92 = v12.createBinding(false);
        v90.tiltMenuOpen = v91;
        v90.setTiltMenuOpen = v92;
        v91, v92 = v12.createBinding(false);
        v90.inspectMenuOpen = v91;
        v90.setInspectMenuOpen = v92;
        v90.inspectMenuDisposeEffect = v9.createEffect(function(v102) --[[ Line: 275 ]]
            -- upvalues: l_Stores_0 (ref), v90 (copy)
            local v103 = l_Stores_0.GetInspectAndBuyStore(v102).getInspectAndBuyOpen(v102);
            v90.setInspectMenuOpen(v103);
        end);
        l_SettingsShowSignal_0:connect(function(v104) --[[ Line: 280 ]]
            -- upvalues: v90 (copy)
            v90.setTiltMenuOpen(v104);
        end);
    end;
    if l_FFlagTopBarSignalizeKeepOutAreas_0 then
        v90.keepOutAreasStore = v26.Stores.GetKeepOutAreasStore(false);
    end;
    v90.onCloseBtnStateChange = function(_, v106) --[[ Line: 289 ]]
        -- upvalues: v90 (copy)
        v90.setCloseButtonState(v106);
    end;
    if l_Enabled_0() then
        v90:setState({
            unibarAlignment = require(l_Chrome_0.Service):orderAlignment():get()
        });
        if l_FFlagEnableConsoleExpControls_0 then
            v90.GamepadConnector = v70;
        end;
        if l_FFlagEnableConsoleExpControls_0 then
            v90.unibarMenuRef = v13.createRef();
            v90.menuIconRef = v12.createRef();
        end;
    end;
    v90:setState({
        chatVersion = l_TextChatService_0.ChatVersion
    });
    if not game:IsLoaded() then
        game.Loaded:Connect(function() --[[ Line: 315 ]]
            -- upvalues: v90 (copy), l_TextChatService_0 (ref)
            v90:setState({
                chatVersion = l_TextChatService_0.ChatVersion
            });
        end);
    end;
end;
v89.didMount = function(v107) --[[ Line: 323 ]] --[[ Name: didMount ]]
    -- upvalues: l_Enabled_0 (copy), l_Chrome_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy)
    if l_Enabled_0() then
        local v108 = require(l_Chrome_0.Service);
        v107.orderAlignmentConnection = v108:orderAlignment():connect(function() --[[ Line: 326 ]]
            -- upvalues: v107 (copy), v108 (copy)
            v107:setState({
                unibarAlignment = v108:orderAlignment():get()
            });
        end);
        if l_FFlagEnableConsoleExpControls_0 then
            v107.GamepadConnector:connectToTopbar();
        end;
    end;
end;
v89.willUnmount = function(v109) --[[ Line: 338 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_Enabled_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_ContextActionService_0 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy)
    if l_Enabled_0() then
        if v109.orderAlignmentConnection then
            v109.orderAlignmentConnection:disconnect();
            v109.orderAlignmentConnection = nil;
        end;
        if l_FFlagEnableConsoleExpControls_0 then
            v109.GamepadConnector:disconnectFromTopbar();
        end;
    end;
    if v109.disposeUiScaleEffect then
        v109.disposeUiScaleEffect();
    end;
    if l_FFlagAddUILessMode_0 then
        if v109.uiLessStore then
            v109.uiLessStore.cleanup();
        end;
        if l_FIntAddUILessModeVariant_0 ~= 0 then
            v109.cleanupUILessTooltip();
            l_ContextActionService_0:UnbindCoreAction("ToggleUILess");
        end;
    end;
    if l_FFlagTopBarSignalizeMenuOpen_0 then
        if v109.tiltMenuDisposeEffect then
            v109.tiltMenuDisposeEffect();
        end;
        if v109.inspectMenuDisposeEffect then
            v109.inspectMenuDisposeEffect();
        end;
    end;
    if l_FFlagTopBarSignalizeKeepOutAreas_0 and v109.keepOutAreasStore then
        v109.keepOutAreasStore.cleanup();
    end;
end;
v89.render = function(v110) --[[ Line: 380 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v111) --[[ Line: 381 ]]
        -- upvalues: v110 (copy)
        return v110:renderWithStyle(v111);
    end);
end;
v89.renderUnibarFrame = function(v112, v113) --[[ Line: 386 ]] --[[ Name: renderUnibarFrame ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v13 (copy), v68 (copy), v57 (ref), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v12 (copy)
    if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
        return nil;
    elseif l_FFlagEnableConsoleExpControls_0 then
        return v13.createElement(v68.Provider, {
            value = {
                menuIconRef = v112.menuIconRef
            }
        }, {
            v13.createElement(v57, {
                layoutOrder = 1, 
                onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v112.keepOutAreasStore.setKeepOutArea else v112.props.setKeepOutArea, 
                onMinWidthChanged = function(v114) --[[ Line: 400 ]] --[[ Name: onMinWidthChanged ]]
                    -- upvalues: v112 (copy)
                    v112.setUnibarRightSidePosition(UDim2.new(0, v114, 0, 0));
                end, 
                menuRef = if v113 then v112.unibarMenuRef else nil
            })
        });
    else
        return v12.createElement(v57, {
            layoutOrder = 1, 
            onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v112.keepOutAreasStore.setKeepOutArea else v112.props.setKeepOutArea, 
            onMinWidthChanged = function(v115) --[[ Line: 412 ]] --[[ Name: onMinWidthChanged ]]
                -- upvalues: v112 (copy)
                v112.setUnibarRightSidePosition(UDim2.new(0, v115, 0, 0));
            end
        });
    end;
end;
v89.renderWithStyle = function(v116, v117) --[[ Line: 419 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: l_Enabled_0 (copy), v76 (copy), v64 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), v73 (copy), v12 (copy), v83 (copy), v86 (copy), l_default_0 (copy), l_isInExperienceUIVREnabled_0 (copy), v33 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), l_SelectionCursorProvider_0 (copy), l_isSpatial_0 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v62 (copy), v69 (ref), v71 (ref), v72 (ref), v77 (copy), v38 (copy), v54 (copy), l_HeadsetDisconnectDialog_0 (copy), v39 (copy), l_VRService_0 (copy), v58 (ref), v37 (copy), v75 (copy), l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_withLocalization_0 (copy), v57 (ref), v74 (copy), l_Interactable_0 (copy), l_RobloxGui_0 (copy), l_ControlState_0 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy), v24 (copy), v45 (copy), v81 (ref), l_GetFFlagEnableCrossExpVoice_0 (copy), v79 (copy), v59 (ref), l_FFlagAddTraversalBackButton_0 (copy), v13 (copy), l_View_0 (copy), v42 (copy), v85 (copy), v36 (copy), v41 (copy), l_Analytics_0 (copy), v34 (copy), v35 (copy)
    local v118 = l_Enabled_0();
    local v119 = v76() and not v118;
    local l_displayBetaBadge_0 = v116.props.displayBetaBadge;
    local l_Right_0 = Enum.HorizontalAlignment.Right;
    if v116.state.unibarAlignment ~= nil then
        l_Right_0 = v116.state.unibarAlignment;
    end;
    local v122 = v64.ScreenSideOffset * v116.state.UiScale;
    local v123 = v64.TopBarHeight * v116.state.UiScale;
    local v124 = v64.TopBarTopMargin * v116.state.UiScale;
    local v125 = v64.TopBarPadding * v116.state.UiScale;
    local v126 = v64.LegacyCloseMenuIconSize * v116.state.UiScale;
    local v127 = v64.UnibarFrame.PaddingTop * v116.state.UiScale;
    local v128 = v64.UnibarFrame.PaddingBottom * v116.state.UiScale;
    local v129 = v64.UnibarFrame.PaddingLeft * v116.state.UiScale;
    local v130 = v64.UnibarFrame.ExtendedSize * v116.state.UiScale;
    local v131 = if l_FFlagTopBarSignalizeMenuOpen_0 then v116.tiltMenuOpen else v116.props.menuOpen;
    if v73:IsEnabled() and not l_Enabled_0() then
        v122 = v64.ScreenSideOffsetTenFoot;
        v123 = v64.TopBarHeightTenFoot;
    end;
    local v133 = if l_FFlagTopBarSignalizeMenuOpen_0 then v12.joinBindings({
        v116.tiltMenuOpen, 
        v116.inspectMenuOpen
    }):map(function(v132) --[[ Line: 448 ]]
        return not (v132[0] or v132[1]);
    end) else not (v116.props.menuOpen or v116.props.inspectMenuOpen);
    local v134 = UDim2.new(0, 0, 0, v124);
    local v135 = v123 - v124;
    local v136 = UDim2.new(0, v122, 0, 0);
    local v137 = UDim2.new(1, -v122, 0, 0);
    local v138 = UDim2.new(1, -v122, 0, v124);
    local v139 = UDim2.new(0, 0, 0.5, 0);
    local v141 = v12.createElement(v83.Provider, {}, {
        VRBottomBar = v83.withVoiceState(function(v140) --[[ Line: 462 ]]
            -- upvalues: v12 (ref), v86 (ref), l_default_0 (ref), l_isInExperienceUIVREnabled_0 (ref), v116 (copy)
            return v12.createElement(v86, {
                voiceChatServiceManager = l_default_0, 
                voiceEnabled = v140.voiceEnabled, 
                voiceState = v140.voiceState, 
                showBadgeOver12 = if l_isInExperienceUIVREnabled_0 then v116.props.showBadgeOver12 else nil
            });
        end)
    });
    local v142 = v12.createElement(v33, {
        iconScale = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else if v116.props.menuOpen then v64.MenuIconOpenScale else 1, 
        layoutOrder = 1, 
        showBadgeOver12 = v116.props.showBadgeOver12, 
        menuIconRef = if v118 and l_FFlagEnableConsoleExpControls_0 then v116.menuIconRef else nil, 
        unibarMenuRef = if v118 and l_FFlagEnableConsoleExpControls_0 then v116.unibarMenuRef else nil, 
        onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v116.keepOutAreasStore.setKeepOutArea else nil
    });
    v142 = v12.createElement(l_SelectionCursorProvider_0, {}, {
        Icon = v142
    });
    local v143 = true;
    if l_isInExperienceUIVREnabled_0 then
        v143 = not l_isSpatial_0();
    end;
    return v12.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false, 
        DisplayOrder = 6, 
        [v12.Change.AbsoluteSize] = if l_FFlagTopBarSignalizeScreenSize_0 then nil else function(v144) --[[ Line: 496 ]]
            -- upvalues: v116 (copy)
            v116.props.setScreenSize(v144.AbsoluteSize);
        end
    }, {
        Connection = v12.createElement(v62), 
        GamepadMenu = if not l_FFlagEnableConsoleExpControls_0 then v12.createElement(v69, {
            chatVersion = v116.state.chatVersion
        }) else nil, 
        MenuNavigationToggleDialog = if v118 and v71 and l_FFlagEnableConsoleExpControls_0 then v12.createElement(v72, {
            Position = UDim2.fromScale(0.5, 0.1), 
            GamepadConnector = if l_FFlagEnableConsoleExpControls_0 then v116.GamepadConnector else nil
        }) else nil, 
        GamepadNavigationDialog = if v77 then v12.createElement(v38) else nil, 
        HeadsetMenu = if v54 then v12.createElement(l_HeadsetDisconnectDialog_0) else v12.createElement(v39), 
        VRBottomBar = l_VRService_0.VREnabled and v141 or nil, 
        KeepOutAreasHandler = if not l_FFlagTopBarSignalizeKeepOutAreas_0 and v58 then v12.createElement(v58) else nil, 
        FullScreenFrame = v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = v133
        }, {
            HurtOverlay = v12.createElement(v37)
        }), 
        MenuIconHolder = if v143 and v75() then v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v122, 0, v124), 
            Size = UDim2.new(1, 0, 0, v135)
        }, {
            MenuIcon = v142
        }) else nil, 
        UILessTooltip = if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 then l_withLocalization_0({
            uiLessTooltipTitle = v64.LocalizedKeys.UILessTooltipTitle, 
            uiLessTooltipDescription = v64.LocalizedKeys.UILessTooltipDescription
        })(function(v145) --[[ Line: 555 ]]
            -- upvalues: v12 (ref), v117 (copy), v122 (ref), v124 (copy), v116 (copy)
            return v12.createElement("Frame", {
                BackgroundColor3 = v117.Tokens.Global.Color.White.Color3, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0, v122, 0, v124), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = v116.uiLessTooltipTransparency, 
                Visible = v116.uiLessTooltipVisible, 
                ZIndex = 10000, 
                [v12.Ref] = v116.uiLessTooltip
            }, {
                Padding = v12.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v117.Tokens.Global.Space_100), 
                    PaddingBottom = UDim.new(0, v117.Tokens.Global.Space_100), 
                    PaddingLeft = UDim.new(0, v117.Tokens.Global.Space_150), 
                    PaddingRight = UDim.new(0, v117.Tokens.Global.Space_150)
                }), 
                Corner = v12.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v117.Tokens.Semantic.Radius.Small)
                }), 
                VerticalLayout = v12.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v117.Tokens.Global.Space_50)
                }), 
                Title = v12.createElement("TextLabel", {
                    Text = v145.uiLessTooltipTitle, 
                    TextSize = v117.Tokens.Global.FontSize_50, 
                    TextTransparency = v116.uiLessTooltipTransparency, 
                    Font = Enum.Font.BuilderSansBold, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1
                }), 
                Description = v12.createElement("TextLabel", {
                    Text = v145.uiLessTooltipDescription, 
                    TextSize = v117.Tokens.Global.FontSize_50, 
                    TextTransparency = v116.uiLessTooltipTransparency, 
                    Font = Enum.Font.BuilderSans, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2
                })
            });
        end) else nil, 
        LegacyCloseMenu = not v57 and not v74() and v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v122, 0, 0), 
            Size = UDim2.new(1, 0, 0, v123), 
            Visible = v131
        }, {
            CloseMenuButtonRound = v57 and v12.createElement(l_Interactable_0, {
                onStateChanged = v116.onCloseBtnStateChange, 
                Visible = not v73:IsEnabled(), 
                BackgroundTransparency = v117.Theme.Overlay.Transparency, 
                Position = v139, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(0, v126, 0, v126), 
                BackgroundColor3 = v117.Theme.Overlay.Color, 
                [v12.Event.Activated] = function() --[[ Line: 624 ]]
                    -- upvalues: l_RobloxGui_0 (ref)
                    require(l_RobloxGui_0.Modules.Settings.SettingsHub):ToggleVisibility();
                end
            }, {
                UICorner = v118 and v12.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }) or nil, 
                Line1 = v12.createElement("Frame", {
                    Name = "TopLine", 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Size = UDim2.new(0, 16, 0, 2), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    Rotation = 45
                }), 
                Line2 = v12.createElement("Frame", {
                    Name = "BottomLine", 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Size = UDim2.new(0, 16, 0, 2), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    Rotation = -45
                }), 
                StateOverlayRound = not v118 and v12.createElement("Frame", {
                    BackgroundTransparency = v116.closeButtonState:map(function(v146) --[[ Line: 654 ]]
                        -- upvalues: l_ControlState_0 (ref), v117 (copy)
                        if v146 == l_ControlState_0.Pressed then
                            return v117.Theme.BackgroundOnPress.Transparency;
                        elseif v146 == l_ControlState_0.Hover then
                            return v117.Theme.BackgroundOnHover.Transparency;
                        else
                            return 1;
                        end;
                    end), 
                    BackgroundColor3 = v116.closeButtonState:map(function(v147) --[[ Line: 663 ]]
                        -- upvalues: l_ControlState_0 (ref), v117 (copy)
                        if v147 == l_ControlState_0.Pressed then
                            return v117.Theme.BackgroundOnPress.Color;
                        elseif v147 == l_ControlState_0.Hover then
                            return v117.Theme.BackgroundOnHover.Color;
                        else
                            return Color3.new(1, 1, 1);
                        end;
                    end), 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = 2
                }, {
                    UICorner = v118 and v12.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }) or nil
                }) or nil
            }) or nil, 
            CloseMenuButton = not v57 and v12.createElement(l_ImageSetButton_0, {
                Visible = not v73:IsEnabled(), 
                BackgroundTransparency = 1, 
                Position = v139, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(0, v126, 0, v126), 
                Image = l_Images_0["icons/controls/close-ingame"], 
                [v12.Event.Activated] = function() --[[ Line: 689 ]]
                    -- upvalues: l_RobloxGui_0 (ref)
                    require(l_RobloxGui_0.Modules.Settings.SettingsHub):ToggleVisibility();
                end
            }) or nil
        }), 
        SongbirdDebugAudio = v12.createElement(v24.DebugAudioEmitters), 
        SongbirdReportAudioFrame = l_Enabled_0() and v12.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(1, 0, 0, v45.AUDIO_REPORTING_WINDOW_MIN_HEIGHT)
        }, {
            ReportAudioPopup = v12.createElement(v24.ReportAudioPopup)
        }), 
        UnibarLeftFrame = v57 and l_Right_0 == Enum.HorizontalAlignment.Left and v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v135), 
            Position = v138, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            JoinVoiceBinder = if v118 and v81 then v12.createElement(v81) else nil, 
            PartyMicBinder = if v118 and l_GetFFlagEnableCrossExpVoice_0() then v12.createElement(v79) else nil, 
            ChromeAnalytics = if v59 then v12.createElement(v59) else nil, 
            Padding = v12.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v127), 
                PaddingBottom = UDim.new(0, v128), 
                PaddingLeft = UDim.new(0, v129)
            }), 
            TopBarLeftContainer = l_FFlagAddTraversalBackButton_0 and v13.createElement(l_View_0, {
                tag = "auto-xy row gap-xsmall"
            }, {
                TraversalBackButton = if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then nil else v13.createElement(v42), 
                UnibarFrame = v116:renderUnibarFrame(v118)
            }), 
            Unibar = if not l_FFlagAddTraversalBackButton_0 then v116:renderUnibarFrame(v118) else nil, 
            HealthBar = if v85 then v12.createElement(v36, {}) else nil, 
            StackedElements = v12.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = v116.unibarRightSidePosition, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Padding = v12.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v125)
                }), 
                Layout = v12.createElement("UIListLayout", {
                    Padding = UDim.new(0, v125), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HealthBar = if v85 then nil else v12.createElement(v36, {
                    layoutOrder = 10
                }), 
                VoiceBetaBadge = if v76() and l_displayBetaBadge_0 then v12.createElement(v41, {
                    layoutOrder = 6, 
                    Analytics = l_Analytics_0.new()
                }) else nil
            })
        }) or nil, 
        UnibarRightFrame = v57 and l_Right_0 == Enum.HorizontalAlignment.Right and v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v135), 
            Position = v138, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            ChromeAnalytics = if v59 then v12.createElement(v59) else nil, 
            Padding = v12.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v127), 
                PaddingBottom = UDim.new(0, v128)
            }), 
            Layout = v12.createElement("UIListLayout", {
                Padding = UDim.new(0, v125), 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            HealthBar = v12.createElement(v36, {
                layoutOrder = 1
            }), 
            Unibar = v12.createElement(v57, {
                onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v116.keepOutAreasStore.setKeepOutArea else v116.props.setKeepOutArea, 
                layoutOrder = 2
            })
        }) or nil, 
        TopBarFrame = v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v135), 
            Visible = v133, 
            Position = v134
        }, {
            LeftFrame = (not not v118 or not v73:IsEnabled()) and v12.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.5, -v122, 1, 0), 
                Position = v136
            }, {
                Layout = v12.createElement("UIListLayout", {
                    Padding = UDim.new(0, v125), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Blank = v118 and v12.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, v130, 0, 1), 
                    BackgroundTransparency = 1
                }), 
                MenuIcon = not v75() and v12.createElement(v33, {
                    layoutOrder = 1, 
                    showBadgeOver12 = v116.props.showBadgeOver12, 
                    onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v116.keepOutAreasStore.setKeepOutArea else nil
                }), 
                ChatIcon = not v118 and v12.createElement(v34, {
                    layoutOrder = 3
                }) or nil, 
                VoiceBetaBadge = if v119 and l_displayBetaBadge_0 then v12.createElement(v41, {
                    layoutOrder = 4, 
                    Analytics = l_Analytics_0.new()
                }) else nil
            }), 
            RightFrame = not v57 and v12.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.5, -v122, 1, 0), 
                Position = v137, 
                AnchorPoint = Vector2.new(1, 0)
            }, {
                Layout = v12.createElement("UIListLayout", {
                    Padding = UDim.new(0, v125), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HealthBar = v12.createElement(v36, {
                    layoutOrder = 1
                }), 
                MoreMenu = not v73:IsEnabled() and v12.createElement(v35, {
                    layoutOrder = 2
                })
            }) or nil
        })
    });
end;
local function v150(v148) --[[ Line: 891 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagTopBarSignalizeMenuOpen_0 (copy)
    if l_FFlagTopBarSignalizeMenuOpen_0 then
        return nil;
    else
        local l_inspectMenuOpen_0 = v148.displayOptions.inspectMenuOpen;
        return {
            menuOpen = v148.displayOptions.menuOpen, 
            inspectMenuOpen = l_inspectMenuOpen_0
        };
    end;
end;
local v153 = v84.connect(function(v151, _) --[[ Line: 904 ]]
    return {
        displayBetaBadge = v151.getDisplayVoiceBetaBadge(), 
        showBadgeOver12 = v151.showBadgeOver12()
    };
end)(v89);
return v14.UNSTABLE_connect2(if l_FFlagTopBarSignalizeMenuOpen_0 then nil else v150, function(v154) --[[ Line: 911 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy), v65 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v66 (copy), v67 (copy)
    return {
        setScreenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else function(v155) --[[ Line: 915 ]]
            -- upvalues: v154 (copy), v65 (ref)
            return v154(v65(v155));
        end, 
        setKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v156, v157, v158) --[[ Line: 920 ]]
            -- upvalues: v154 (copy), v66 (ref)
            return v154(v66(v156, v157, v158));
        end, 
        removeKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v159) --[[ Line: 925 ]]
            -- upvalues: v154 (copy), v67 (ref)
            return v154(v67(v159));
        end
    };
end)(v153);