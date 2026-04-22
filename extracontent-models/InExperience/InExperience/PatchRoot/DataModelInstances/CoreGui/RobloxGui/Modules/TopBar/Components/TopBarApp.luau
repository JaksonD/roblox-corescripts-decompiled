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
local l_FFlagEnableUISelector_0 = v26.Flags.FFlagEnableUISelector;
local l_FFlagEnableConsoleExpControls_0 = v8.FFlagEnableConsoleExpControls;
local l_FFlagTopBarSignalizeKeepOutAreas_0 = v26.Flags.FFlagTopBarSignalizeKeepOutAreas;
local l_FFlagAddUILessMode_0 = v8.FFlagAddUILessMode;
local l_FIntAddUILessModeVariant_0 = v8.FIntAddUILessModeVariant;
local v51 = game:DefineFastInt("UILessTooltipDuration", 10);
local l_FFlagTopBarSignalizeMenuOpen_0 = v26.Flags.FFlagTopBarSignalizeMenuOpen;
local l_FFlagTopBarSignalizeScreenSize_0 = v26.Flags.FFlagTopBarSignalizeScreenSize;
local l_FFlagAddTraversalBackButton_0 = l_Traversal_0.Flags.FFlagAddTraversalBackButton;
local v55 = game:DefineFastFlag("UseNewHeadsetDisconnectDialog", false);
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local l_FFlagDisableGamepadConnectorInVR_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Flags.FFlagDisableGamepadConnectorInVR;
local v59 = nil;
local v60 = nil;
local v61 = nil;
if l_Enabled_0() then
    v59 = require(l_Chrome_0.ChromeShared.Unibar);
end;
if game:GetEngineFeature("InGameChromeSignalAPI") then
    v60 = require(l_Chrome_0.ChromeShared.Service.KeepOutAreasHandler);
    if l_Enabled_0() then
        v61 = require(l_Chrome_0.ChromeShared.Analytics);
    end;
end;
local v62 = nil;
local v63 = nil;
if l_Enabled_0() then
    v62 = require(l_Chrome_0.ChromeShared.Service.LocalStore);
    v63 = require(l_Chrome_0.ChromeShared.Unibar.Constants);
end;
local v64 = require(script.Parent.Connection);
local l_Parent_0 = l_Presentation_0.Parent.Parent;
local v66 = require(l_Parent_0.Constants);
local v67 = require(l_Parent_0.Actions.SetScreenSize);
local v68 = require(l_Parent_0.Actions.SetKeepOutArea);
local v69 = require(l_Parent_0.Actions.RemoveKeepOutArea);
local v70 = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then require(script.Parent.MenuIconContext) else nil;
local v71 = nil;
local v72 = nil;
local v73 = nil;
local v74 = nil;
if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then
    v72 = require(script.Parent.GamepadConnector);
    v73 = v8.FFlagAddMenuNavigationToggleDialog;
    v74 = require(l_Presentation_0.GamepadMenu.MenuNavigationToggleDialog);
else
    v71 = require(l_Presentation_0.GamepadMenu);
end;
local v75 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v76 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v77 = require(l_RobloxGui_0.Modules.isNewTiltIconEnabled);
local v78 = require(l_RobloxGui_0.Modules.Flags.GetFFlagBetaBadge);
local v79 = require(l_Parent_0.Flags.FFlagGamepadNavigationDialogABTest);
local l_GetFFlagEnableCrossExpVoice_0 = v8.GetFFlagEnableCrossExpVoice;
local v81 = require(script.Parent.Parent.Parent.Chrome.Integrations.Party.PartyMicBinder);
local l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 = v8.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice;
local v83 = nil;
if game:GetEngineFeature("VoiceChatSupported") and l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and l_Enabled_0() then
    v83 = require(script.Parent.Parent.Parent.Chrome.Integrations.JoinVoiceBinder);
end;
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v85 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v86 = require(script.Parent.Parent.TopBarAppPolicy);
local v87 = l_Enabled_0();
local v88 = if l_isInExperienceUIVREnabled_0 and l_Enabled_0() then require(script.Parent.VRBottomUnibar) else require(l_RobloxGui_0.Modules.VR.VRBottomBar.VRBottomBar);
local function _(v89) --[[ Line: 156 ]] --[[ Name: selectMenuOpen ]]
    return v89.displayOptions.menuOpen or v89.displayOptions.inspectMenuOpen;
end;
local v91 = v12.PureComponent:extend("TopBarApp");
v91.validateProps = v15.strictInterface({
    menuOpen = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else v15.optional(v15.boolean), 
    inspectMenuOpen = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else v15.optional(v15.boolean), 
    displayBetaBadge = v15.boolean, 
    setScreenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v15.callback, 
    setKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v15.callback, 
    removeKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v15.callback, 
    showBadgeOver12 = v15.optional(v15.boolean)
});
v91.init = function(v92) --[[ Line: 175 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), v9 (copy), v10 (copy), l_FFlagAddUILessMode_0 (copy), l_Stores_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_TweenService_0 (copy), v62 (ref), v63 (ref), v51 (copy), v30 (copy), l_Constants_0 (copy), l_ContextActionService_0 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), l_SettingsShowSignal_0 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v26 (copy), l_Enabled_0 (copy), l_Chrome_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v72 (ref), v13 (copy), l_TextChatService_0 (copy)
    local v93, v94 = v12.createBinding(UDim2.new());
    v92.unibarRightSidePosition = v93;
    v92.setUnibarRightSidePosition = v94;
    v93, v94 = v12.createBinding(false);
    v92.closeButtonState = v93;
    v92.setCloseButtonState = v94;
    v92.disposeUiScaleEffect = v9.createEffect(function(v95) --[[ Line: 178 ]]
        -- upvalues: v10 (ref), v92 (copy)
        local v96 = v10.GetDisplayStore(v95);
        v92:setState({
            UiScale = v96.getUIScale(v95)
        });
    end);
    if l_FFlagAddUILessMode_0 then
        v92.uiLessStore = l_Stores_0.GetUILessStore(false);
        if l_FIntAddUILessModeVariant_0 ~= 0 then
            v93, v94 = v12.createBinding(false);
            v92.uiLessTooltipVisible = v93;
            v92.setUILessTooltipVisible = v94;
            v93, v94 = v12.createBinding(0);
            v92.uiLessTooltipTransparency = v93;
            v92.setUILessTooltipTransparency = v94;
            v92.fadeOutUILessTooltip = function() --[[ Line: 192 ]]
                -- upvalues: v92 (copy), l_TweenService_0 (ref)
                local l_NumberValue_0 = Instance.new("NumberValue");
                l_NumberValue_0.Value = 0;
                l_NumberValue_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 195 ]]
                    -- upvalues: v92 (ref), l_NumberValue_0 (copy)
                    v92.setUILessTooltipTransparency(l_NumberValue_0.Value);
                end);
                local v98 = {
                    Value = 1
                };
                local v99 = TweenInfo.new(0.5);
                v92.uiLessTooltipTween = l_TweenService_0:Create(l_NumberValue_0, v99, v98);
                v92.uiLessTooltipTween.Completed:Connect(function() --[[ Line: 202 ]]
                    -- upvalues: v92 (ref)
                    v92.setUILessTooltipVisible(false);
                    v92.uiLessTooltipTween = nil;
                end);
                v92.uiLessTooltipTween:Play();
            end;
            v92.cleanupUILessTooltip = function() --[[ Line: 210 ]]
                -- upvalues: v92 (copy)
                if v92.uiLessTooltipTween then
                    v92.uiLessTooltipTween:Cancel();
                    v92.uiLessTooltipTween = nil;
                end;
                if v92.uiLessTooltipTimer then
                    task.cancel(v92.uiLessTooltipTimer);
                    v92.uiLessTooltipTimer = nil;
                end;
            end;
            if v92.uiLessStore.getUILessModeEnabled(false) then
                v93 = true;
                if v62 then
                    v94 = v62.loadForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2") or 0;
                    v93 = v94 < v63.MAX_NUM_UNIVERSES_SHOWN;
                    if v93 then
                        v62.storeForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2", v94 + 1);
                    end;
                end;
                if v93 then
                    v92.setUILessTooltipVisible(true);
                    v92.uiLessTooltipTimer = task.delay(v51, function() --[[ Line: 233 ]]
                        -- upvalues: v92 (copy)
                        v92.fadeOutUILessTooltip();
                        v92.uiLessTooltipTimer = nil;
                    end);
                end;
            end;
            l_ContextActionService_0:BindCoreAction("ToggleUILess", function(_, v101) --[[ Line: 240 ]]
                -- upvalues: v92 (copy), l_FIntAddUILessModeVariant_0 (ref), v30 (ref), l_Constants_0 (ref)
                if v101 ~= Enum.UserInputState.Begin then
                    return;
                else
                    if v92.uiLessStore.getUILessModeEnabled(false) then
                        if l_FIntAddUILessModeVariant_0 == 1 then
                            v92.uiLessStore.setUIVisible(function(v102) --[[ Line: 245 ]]
                                -- upvalues: v30 (ref), l_Constants_0 (ref)
                                if v102 == v30:GetVisibility() then
                                    v30:PopMenu(false, true, l_Constants_0.AnalyticsMenuOpenTypes.Keyboard);
                                end;
                                return not v102;
                            end);
                            v92.cleanupUILessTooltip();
                            v92.setUILessTooltipVisible(false);
                            return;
                        elseif l_FIntAddUILessModeVariant_0 == 2 then
                            v92.uiLessStore.setUIVisible(function(v103) --[[ Line: 256 ]]
                                return not v103;
                            end);
                            if v30:GetVisibility() then
                                v30:PopMenu(false, true, l_Constants_0.AnalyticsMenuOpenTypes.Keyboard);
                            end;
                            v92.cleanupUILessTooltip();
                            v92.setUILessTooltipVisible(false);
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
        v93, v94 = v12.createBinding(false);
        v92.tiltMenuOpen = v93;
        v92.setTiltMenuOpen = v94;
        v93, v94 = v12.createBinding(false);
        v92.inspectMenuOpen = v93;
        v92.setInspectMenuOpen = v94;
        v92.inspectMenuDisposeEffect = v9.createEffect(function(v104) --[[ Line: 278 ]]
            -- upvalues: l_Stores_0 (ref), v92 (copy)
            local v105 = l_Stores_0.GetInspectAndBuyStore(v104).getInspectAndBuyOpen(v104);
            v92.setInspectMenuOpen(v105);
        end);
        l_SettingsShowSignal_0:connect(function(v106) --[[ Line: 283 ]]
            -- upvalues: v92 (copy)
            v92.setTiltMenuOpen(v106);
        end);
    end;
    if l_FFlagTopBarSignalizeKeepOutAreas_0 then
        v92.keepOutAreasStore = v26.Stores.GetKeepOutAreasStore(false);
    end;
    v92.onCloseBtnStateChange = function(_, v108) --[[ Line: 292 ]]
        -- upvalues: v92 (copy)
        v92.setCloseButtonState(v108);
    end;
    if l_Enabled_0() then
        v92:setState({
            unibarAlignment = require(l_Chrome_0.Service):orderAlignment():get()
        });
        if l_FFlagEnableConsoleExpControls_0 then
            v92.GamepadConnector = v72;
        end;
        if l_FFlagEnableConsoleExpControls_0 then
            v92.unibarMenuRef = v13.createRef();
            v92.menuIconRef = v12.createRef();
        end;
    end;
    v92:setState({
        chatVersion = l_TextChatService_0.ChatVersion
    });
    if not game:IsLoaded() then
        game.Loaded:Connect(function() --[[ Line: 318 ]]
            -- upvalues: v92 (copy), l_TextChatService_0 (ref)
            v92:setState({
                chatVersion = l_TextChatService_0.ChatVersion
            });
        end);
    end;
end;
v91.didMount = function(v109) --[[ Line: 326 ]] --[[ Name: didMount ]]
    -- upvalues: l_Enabled_0 (copy), l_Chrome_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagDisableGamepadConnectorInVR_0 (copy), l_isSpatial_0 (copy), l_VRService_0 (copy)
    if l_Enabled_0() then
        local v110 = require(l_Chrome_0.Service);
        v109.orderAlignmentConnection = v110:orderAlignment():connect(function() --[[ Line: 329 ]]
            -- upvalues: v109 (copy), v110 (copy)
            v109:setState({
                unibarAlignment = v110:orderAlignment():get()
            });
        end);
        if l_FFlagEnableConsoleExpControls_0 then
            if l_FFlagDisableGamepadConnectorInVR_0 then
                if not l_isSpatial_0() then
                    v109.GamepadConnector:connectToTopbar();
                end;
                v109.vrEnabledConnection = l_VRService_0:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ Line: 340 ]]
                    -- upvalues: l_isSpatial_0 (ref), v109 (copy)
                    if l_isSpatial_0() then
                        v109.GamepadConnector:disconnectFromTopbar();
                        return;
                    else
                        v109.GamepadConnector:connectToTopbar();
                        return;
                    end;
                end);
                return;
            else
                v109.GamepadConnector:connectToTopbar();
            end;
        end;
    end;
end;
v91.willUnmount = function(v111) --[[ Line: 354 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_Enabled_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagDisableGamepadConnectorInVR_0 (copy), l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_ContextActionService_0 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy)
    if l_Enabled_0() then
        if v111.orderAlignmentConnection then
            v111.orderAlignmentConnection:disconnect();
            v111.orderAlignmentConnection = nil;
        end;
        if l_FFlagEnableConsoleExpControls_0 then
            if l_FFlagDisableGamepadConnectorInVR_0 and v111.vrEnabledConnection then
                v111.vrEnabledConnection:Disconnect();
                v111.vrEnabledConnection = nil;
            end;
            v111.GamepadConnector:disconnectFromTopbar();
        end;
    end;
    if v111.disposeUiScaleEffect then
        v111.disposeUiScaleEffect();
    end;
    if l_FFlagAddUILessMode_0 then
        if v111.uiLessStore then
            v111.uiLessStore.cleanup();
        end;
        if l_FIntAddUILessModeVariant_0 ~= 0 then
            v111.cleanupUILessTooltip();
            l_ContextActionService_0:UnbindCoreAction("ToggleUILess");
        end;
    end;
    if l_FFlagTopBarSignalizeMenuOpen_0 then
        if v111.tiltMenuDisposeEffect then
            v111.tiltMenuDisposeEffect();
        end;
        if v111.inspectMenuDisposeEffect then
            v111.inspectMenuDisposeEffect();
        end;
    end;
    if l_FFlagTopBarSignalizeKeepOutAreas_0 and v111.keepOutAreasStore then
        v111.keepOutAreasStore.cleanup();
    end;
end;
v91.render = function(v112) --[[ Line: 402 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v113) --[[ Line: 403 ]]
        -- upvalues: v112 (copy)
        return v112:renderWithStyle(v113);
    end);
end;
v91.renderUnibarFrame = function(v114, v115) --[[ Line: 408 ]] --[[ Name: renderUnibarFrame ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v13 (copy), v70 (copy), v59 (ref), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v12 (copy)
    if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
        return nil;
    elseif l_FFlagEnableConsoleExpControls_0 then
        return v13.createElement(v70.Provider, {
            value = {
                menuIconRef = v114.menuIconRef
            }
        }, {
            v13.createElement(v59, {
                layoutOrder = 1, 
                onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v114.keepOutAreasStore.setKeepOutArea else v114.props.setKeepOutArea, 
                onMinWidthChanged = function(v116) --[[ Line: 422 ]] --[[ Name: onMinWidthChanged ]]
                    -- upvalues: v114 (copy)
                    v114.setUnibarRightSidePosition(UDim2.new(0, v116, 0, 0));
                end, 
                menuRef = if v115 then v114.unibarMenuRef else nil
            })
        });
    else
        return v12.createElement(v59, {
            layoutOrder = 1, 
            onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v114.keepOutAreasStore.setKeepOutArea else v114.props.setKeepOutArea, 
            onMinWidthChanged = function(v117) --[[ Line: 434 ]] --[[ Name: onMinWidthChanged ]]
                -- upvalues: v114 (copy)
                v114.setUnibarRightSidePosition(UDim2.new(0, v117, 0, 0));
            end
        });
    end;
end;
v91.renderWithStyle = function(v118, v119) --[[ Line: 441 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: l_Enabled_0 (copy), v78 (copy), v66 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), v75 (copy), v12 (copy), v85 (copy), v88 (copy), l_default_0 (copy), l_isInExperienceUIVREnabled_0 (copy), v33 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), l_SelectionCursorProvider_0 (copy), l_isSpatial_0 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v64 (copy), l_FFlagEnableUISelector_0 (copy), v13 (copy), v26 (copy), v71 (ref), v73 (ref), v74 (ref), v79 (copy), v38 (copy), v55 (copy), l_HeadsetDisconnectDialog_0 (copy), v39 (copy), l_VRService_0 (copy), v60 (ref), v37 (copy), v77 (copy), l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_withLocalization_0 (copy), v59 (ref), v76 (copy), l_Interactable_0 (copy), l_RobloxGui_0 (copy), l_ControlState_0 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy), v24 (copy), v45 (copy), v83 (ref), l_GetFFlagEnableCrossExpVoice_0 (copy), v81 (copy), v61 (ref), l_FFlagAddTraversalBackButton_0 (copy), l_View_0 (copy), v42 (copy), v87 (copy), v36 (copy), v41 (copy), l_Analytics_0 (copy), v34 (copy), v35 (copy)
    local v120 = l_Enabled_0();
    local v121 = v78() and not v120;
    local l_displayBetaBadge_0 = v118.props.displayBetaBadge;
    local l_Right_0 = Enum.HorizontalAlignment.Right;
    if v118.state.unibarAlignment ~= nil then
        l_Right_0 = v118.state.unibarAlignment;
    end;
    local v124 = v66.ScreenSideOffset * v118.state.UiScale;
    local v125 = v66.TopBarHeight * v118.state.UiScale;
    local v126 = v66.TopBarTopMargin * v118.state.UiScale;
    local v127 = v66.TopBarPadding * v118.state.UiScale;
    local v128 = v66.LegacyCloseMenuIconSize * v118.state.UiScale;
    local v129 = v66.UnibarFrame.PaddingTop * v118.state.UiScale;
    local v130 = v66.UnibarFrame.PaddingBottom * v118.state.UiScale;
    local v131 = v66.UnibarFrame.PaddingLeft * v118.state.UiScale;
    local v132 = v66.UnibarFrame.ExtendedSize * v118.state.UiScale;
    local v133 = if l_FFlagTopBarSignalizeMenuOpen_0 then v118.tiltMenuOpen else v118.props.menuOpen;
    if v75:IsEnabled() and not l_Enabled_0() then
        v124 = v66.ScreenSideOffsetTenFoot;
        v125 = v66.TopBarHeightTenFoot;
    end;
    local v135 = if l_FFlagTopBarSignalizeMenuOpen_0 then v12.joinBindings({
        v118.tiltMenuOpen, 
        v118.inspectMenuOpen
    }):map(function(v134) --[[ Line: 470 ]]
        return not (v134[0] or v134[1]);
    end) else not (v118.props.menuOpen or v118.props.inspectMenuOpen);
    local v136 = UDim2.new(0, 0, 0, v126);
    local v137 = v125 - v126;
    local v138 = UDim2.new(0, v124, 0, 0);
    local v139 = UDim2.new(1, -v124, 0, 0);
    local v140 = UDim2.new(1, -v124, 0, v126);
    local v141 = UDim2.new(0, 0, 0.5, 0);
    local v143 = v12.createElement(v85.Provider, {}, {
        VRBottomBar = v85.withVoiceState(function(v142) --[[ Line: 484 ]]
            -- upvalues: v12 (ref), v88 (ref), l_default_0 (ref), l_isInExperienceUIVREnabled_0 (ref), v118 (copy)
            return v12.createElement(v88, {
                voiceChatServiceManager = l_default_0, 
                voiceEnabled = v142.voiceEnabled, 
                voiceState = v142.voiceState, 
                showBadgeOver12 = if l_isInExperienceUIVREnabled_0 then v118.props.showBadgeOver12 else nil
            });
        end)
    });
    local v144 = v12.createElement(v33, {
        iconScale = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else if v118.props.menuOpen then v66.MenuIconOpenScale else 1, 
        layoutOrder = 1, 
        showBadgeOver12 = v118.props.showBadgeOver12, 
        menuIconRef = if v120 and l_FFlagEnableConsoleExpControls_0 then v118.menuIconRef else nil, 
        unibarMenuRef = if v120 and l_FFlagEnableConsoleExpControls_0 then v118.unibarMenuRef else nil, 
        onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v118.keepOutAreasStore.setKeepOutArea else nil
    });
    v144 = v12.createElement(l_SelectionCursorProvider_0, {}, {
        Icon = v144
    });
    local v145 = true;
    if l_isInExperienceUIVREnabled_0 then
        v145 = not l_isSpatial_0();
    end;
    return v12.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false, 
        DisplayOrder = 6, 
        [v12.Change.AbsoluteSize] = if l_FFlagTopBarSignalizeScreenSize_0 then nil else function(v146) --[[ Line: 518 ]]
            -- upvalues: v118 (copy)
            v118.props.setScreenSize(v146.AbsoluteSize);
        end
    }, {
        Connection = v12.createElement(v64), 
        InExperienceUiSelector = if l_FFlagEnableUISelector_0 then v13.createElement(v26.Components.InExperienceUiSelector) else nil, 
        GamepadMenu = if not l_FFlagEnableConsoleExpControls_0 then v12.createElement(v71, {
            chatVersion = v118.state.chatVersion
        }) else nil, 
        MenuNavigationToggleDialog = if v120 and v73 and l_FFlagEnableConsoleExpControls_0 then v12.createElement(v74, {
            Position = UDim2.fromScale(0.5, 0.1), 
            GamepadConnector = if l_FFlagEnableConsoleExpControls_0 then v118.GamepadConnector else nil
        }) else nil, 
        GamepadNavigationDialog = if v79 then v12.createElement(v38) else nil, 
        HeadsetMenu = if v55 then v12.createElement(l_HeadsetDisconnectDialog_0) else v12.createElement(v39), 
        VRBottomBar = l_VRService_0.VREnabled and v143 or nil, 
        KeepOutAreasHandler = if not l_FFlagTopBarSignalizeKeepOutAreas_0 and v60 then v12.createElement(v60) else nil, 
        FullScreenFrame = v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = v135
        }, {
            HurtOverlay = v12.createElement(v37)
        }), 
        MenuIconHolder = if v145 and v77() then v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v124, 0, v126), 
            Size = UDim2.new(1, 0, 0, v137)
        }, {
            MenuIcon = v144
        }) else nil, 
        UILessTooltip = if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 then l_withLocalization_0({
            uiLessTooltipTitle = v66.LocalizedKeys.UILessTooltipTitle, 
            uiLessTooltipDescription = v66.LocalizedKeys.UILessTooltipDescription
        })(function(v147) --[[ Line: 580 ]]
            -- upvalues: v12 (ref), v119 (copy), v124 (ref), v126 (copy), v118 (copy)
            return v12.createElement("Frame", {
                BackgroundColor3 = v119.Tokens.Global.Color.White.Color3, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0, v124, 0, v126), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = v118.uiLessTooltipTransparency, 
                Visible = v118.uiLessTooltipVisible, 
                ZIndex = 10000, 
                [v12.Ref] = v118.uiLessTooltip
            }, {
                Padding = v12.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v119.Tokens.Global.Space_100), 
                    PaddingBottom = UDim.new(0, v119.Tokens.Global.Space_100), 
                    PaddingLeft = UDim.new(0, v119.Tokens.Global.Space_150), 
                    PaddingRight = UDim.new(0, v119.Tokens.Global.Space_150)
                }), 
                Corner = v12.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v119.Tokens.Semantic.Radius.Small)
                }), 
                VerticalLayout = v12.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v119.Tokens.Global.Space_50)
                }), 
                Title = v12.createElement("TextLabel", {
                    Text = v147.uiLessTooltipTitle, 
                    TextSize = v119.Tokens.Global.FontSize_50, 
                    TextTransparency = v118.uiLessTooltipTransparency, 
                    Font = Enum.Font.BuilderSansBold, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1
                }), 
                Description = v12.createElement("TextLabel", {
                    Text = v147.uiLessTooltipDescription, 
                    TextSize = v119.Tokens.Global.FontSize_50, 
                    TextTransparency = v118.uiLessTooltipTransparency, 
                    Font = Enum.Font.BuilderSans, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2
                })
            });
        end) else nil, 
        LegacyCloseMenu = not v59 and not v76() and v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v124, 0, 0), 
            Size = UDim2.new(1, 0, 0, v125), 
            Visible = v133
        }, {
            CloseMenuButtonRound = v59 and v12.createElement(l_Interactable_0, {
                onStateChanged = v118.onCloseBtnStateChange, 
                Visible = not v75:IsEnabled(), 
                BackgroundTransparency = v119.Theme.Overlay.Transparency, 
                Position = v141, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(0, v128, 0, v128), 
                BackgroundColor3 = v119.Theme.Overlay.Color, 
                [v12.Event.Activated] = function() --[[ Line: 649 ]]
                    -- upvalues: l_RobloxGui_0 (ref)
                    require(l_RobloxGui_0.Modules.Settings.SettingsHub):ToggleVisibility();
                end
            }, {
                UICorner = v120 and v12.createElement("UICorner", {
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
                StateOverlayRound = not v120 and v12.createElement("Frame", {
                    BackgroundTransparency = v118.closeButtonState:map(function(v148) --[[ Line: 679 ]]
                        -- upvalues: l_ControlState_0 (ref), v119 (copy)
                        if v148 == l_ControlState_0.Pressed then
                            return v119.Theme.BackgroundOnPress.Transparency;
                        elseif v148 == l_ControlState_0.Hover then
                            return v119.Theme.BackgroundOnHover.Transparency;
                        else
                            return 1;
                        end;
                    end), 
                    BackgroundColor3 = v118.closeButtonState:map(function(v149) --[[ Line: 688 ]]
                        -- upvalues: l_ControlState_0 (ref), v119 (copy)
                        if v149 == l_ControlState_0.Pressed then
                            return v119.Theme.BackgroundOnPress.Color;
                        elseif v149 == l_ControlState_0.Hover then
                            return v119.Theme.BackgroundOnHover.Color;
                        else
                            return Color3.new(1, 1, 1);
                        end;
                    end), 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = 2
                }, {
                    UICorner = v120 and v12.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }) or nil
                }) or nil
            }) or nil, 
            CloseMenuButton = not v59 and v12.createElement(l_ImageSetButton_0, {
                Visible = not v75:IsEnabled(), 
                BackgroundTransparency = 1, 
                Position = v141, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(0, v128, 0, v128), 
                Image = l_Images_0["icons/controls/close-ingame"], 
                [v12.Event.Activated] = function() --[[ Line: 714 ]]
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
        UnibarLeftFrame = v59 and l_Right_0 == Enum.HorizontalAlignment.Left and v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v137), 
            Position = v140, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            JoinVoiceBinder = if v120 and v83 then v12.createElement(v83) else nil, 
            PartyMicBinder = if v120 and l_GetFFlagEnableCrossExpVoice_0() then v12.createElement(v81) else nil, 
            ChromeAnalytics = if v61 then v12.createElement(v61) else nil, 
            Padding = v12.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v129), 
                PaddingBottom = UDim.new(0, v130), 
                PaddingLeft = UDim.new(0, v131)
            }), 
            TopBarLeftContainer = l_FFlagAddTraversalBackButton_0 and v13.createElement(l_View_0, {
                tag = "auto-xy row gap-xsmall"
            }, {
                TraversalBackButton = if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then nil else v13.createElement(v42), 
                UnibarFrame = v118:renderUnibarFrame(v120)
            }), 
            Unibar = if not l_FFlagAddTraversalBackButton_0 then v118:renderUnibarFrame(v120) else nil, 
            HealthBar = if v87 then v12.createElement(v36, {}) else nil, 
            StackedElements = v12.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = v118.unibarRightSidePosition, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Padding = v12.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v127)
                }), 
                Layout = v12.createElement("UIListLayout", {
                    Padding = UDim.new(0, v127), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HealthBar = if v87 then nil else v12.createElement(v36, {
                    layoutOrder = 10
                }), 
                VoiceBetaBadge = if v78() and l_displayBetaBadge_0 then v12.createElement(v41, {
                    layoutOrder = 6, 
                    Analytics = l_Analytics_0.new()
                }) else nil
            })
        }) or nil, 
        UnibarRightFrame = v59 and l_Right_0 == Enum.HorizontalAlignment.Right and v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v137), 
            Position = v140, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            ChromeAnalytics = if v61 then v12.createElement(v61) else nil, 
            Padding = v12.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v129), 
                PaddingBottom = UDim.new(0, v130)
            }), 
            Layout = v12.createElement("UIListLayout", {
                Padding = UDim.new(0, v127), 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            HealthBar = v12.createElement(v36, {
                layoutOrder = 1
            }), 
            Unibar = v12.createElement(v59, {
                onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v118.keepOutAreasStore.setKeepOutArea else v118.props.setKeepOutArea, 
                layoutOrder = 2
            })
        }) or nil, 
        TopBarFrame = v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v137), 
            Visible = v135, 
            Position = v136
        }, {
            LeftFrame = (not not v120 or not v75:IsEnabled()) and v12.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.5, -v124, 1, 0), 
                Position = v138
            }, {
                Layout = v12.createElement("UIListLayout", {
                    Padding = UDim.new(0, v127), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Blank = v120 and v12.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, v132, 0, 1), 
                    BackgroundTransparency = 1
                }), 
                MenuIcon = not v77() and v12.createElement(v33, {
                    layoutOrder = 1, 
                    showBadgeOver12 = v118.props.showBadgeOver12, 
                    onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v118.keepOutAreasStore.setKeepOutArea else nil
                }), 
                ChatIcon = not v120 and v12.createElement(v34, {
                    layoutOrder = 3
                }) or nil, 
                VoiceBetaBadge = if v121 and l_displayBetaBadge_0 then v12.createElement(v41, {
                    layoutOrder = 4, 
                    Analytics = l_Analytics_0.new()
                }) else nil
            }), 
            RightFrame = not v59 and v12.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.5, -v124, 1, 0), 
                Position = v139, 
                AnchorPoint = Vector2.new(1, 0)
            }, {
                Layout = v12.createElement("UIListLayout", {
                    Padding = UDim.new(0, v127), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HealthBar = v12.createElement(v36, {
                    layoutOrder = 1
                }), 
                MoreMenu = not v75:IsEnabled() and v12.createElement(v35, {
                    layoutOrder = 2
                })
            }) or nil
        })
    });
end;
local function v152(v150) --[[ Line: 916 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagTopBarSignalizeMenuOpen_0 (copy)
    if l_FFlagTopBarSignalizeMenuOpen_0 then
        return nil;
    else
        local l_inspectMenuOpen_0 = v150.displayOptions.inspectMenuOpen;
        return {
            menuOpen = v150.displayOptions.menuOpen, 
            inspectMenuOpen = l_inspectMenuOpen_0
        };
    end;
end;
local v155 = v86.connect(function(v153, _) --[[ Line: 929 ]]
    return {
        displayBetaBadge = v153.getDisplayVoiceBetaBadge(), 
        showBadgeOver12 = v153.showBadgeOver12()
    };
end)(v91);
return v14.UNSTABLE_connect2(if l_FFlagTopBarSignalizeMenuOpen_0 then nil else v152, function(v156) --[[ Line: 936 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy), v67 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v68 (copy), v69 (copy)
    return {
        setScreenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else function(v157) --[[ Line: 940 ]]
            -- upvalues: v156 (copy), v67 (ref)
            return v156(v67(v157));
        end, 
        setKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v158, v159, v160) --[[ Line: 945 ]]
            -- upvalues: v156 (copy), v68 (ref)
            return v156(v68(v158, v159, v160));
        end, 
        removeKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v161) --[[ Line: 950 ]]
            -- upvalues: v156 (copy), v69 (ref)
            return v156(v69(v161));
        end
    };
end)(v155);