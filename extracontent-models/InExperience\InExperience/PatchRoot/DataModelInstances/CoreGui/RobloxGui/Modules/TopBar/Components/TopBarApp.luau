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
local l_FFlagDisableGamepadConnectorInVR_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Flags.FFlagDisableGamepadConnectorInVR;
local v58 = nil;
local v59 = nil;
local v60 = nil;
if l_Enabled_0() then
    v58 = require(l_Chrome_0.ChromeShared.Unibar);
end;
if game:GetEngineFeature("InGameChromeSignalAPI") then
    v59 = require(l_Chrome_0.ChromeShared.Service.KeepOutAreasHandler);
    if l_Enabled_0() then
        v60 = require(l_Chrome_0.ChromeShared.Analytics);
    end;
end;
local v61 = nil;
local v62 = nil;
if l_Enabled_0() then
    v61 = require(l_Chrome_0.ChromeShared.Service.LocalStore);
    v62 = require(l_Chrome_0.ChromeShared.Unibar.Constants);
end;
local v63 = require(script.Parent.Connection);
local l_Parent_0 = l_Presentation_0.Parent.Parent;
local v65 = require(l_Parent_0.Constants);
local v66 = require(l_Parent_0.Actions.SetScreenSize);
local v67 = require(l_Parent_0.Actions.SetKeepOutArea);
local v68 = require(l_Parent_0.Actions.RemoveKeepOutArea);
local v69 = if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then require(script.Parent.MenuIconContext) else nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
local v73 = nil;
if l_Enabled_0() and l_FFlagEnableConsoleExpControls_0 then
    v71 = require(script.Parent.GamepadConnector);
    v72 = v8.FFlagAddMenuNavigationToggleDialog;
    v73 = require(l_Presentation_0.GamepadMenu.MenuNavigationToggleDialog);
else
    v70 = require(l_Presentation_0.GamepadMenu);
end;
local v74 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v75 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v76 = require(l_RobloxGui_0.Modules.isNewTiltIconEnabled);
local v77 = require(l_RobloxGui_0.Modules.Flags.GetFFlagBetaBadge);
local v78 = require(l_Parent_0.Flags.FFlagGamepadNavigationDialogABTest);
local l_GetFFlagEnableCrossExpVoice_0 = v8.GetFFlagEnableCrossExpVoice;
local v80 = require(script.Parent.Parent.Parent.Chrome.Integrations.Party.PartyMicBinder);
local l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 = v8.GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice;
local v82 = nil;
if game:GetEngineFeature("VoiceChatSupported") and l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() and l_Enabled_0() then
    v82 = require(script.Parent.Parent.Parent.Chrome.Integrations.JoinVoiceBinder);
end;
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v84 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v85 = require(script.Parent.Parent.TopBarAppPolicy);
local v86 = l_Enabled_0();
local v87 = if l_isInExperienceUIVREnabled_0 and l_Enabled_0() then require(script.Parent.VRBottomUnibar) else require(l_RobloxGui_0.Modules.VR.VRBottomBar.VRBottomBar);
local function _(v88) --[[ Line: 154 ]] --[[ Name: selectMenuOpen ]]
    return v88.displayOptions.menuOpen or v88.displayOptions.inspectMenuOpen;
end;
local v90 = v12.PureComponent:extend("TopBarApp");
v90.validateProps = v15.strictInterface({
    menuOpen = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else v15.optional(v15.boolean), 
    inspectMenuOpen = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else v15.optional(v15.boolean), 
    displayBetaBadge = v15.boolean, 
    setScreenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v15.callback, 
    setKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v15.callback, 
    removeKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else v15.callback, 
    showBadgeOver12 = v15.optional(v15.boolean)
});
v90.init = function(v91) --[[ Line: 173 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), v9 (copy), v10 (copy), l_FFlagAddUILessMode_0 (copy), l_Stores_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_TweenService_0 (copy), v61 (ref), v62 (ref), v50 (copy), v30 (copy), l_Constants_0 (copy), l_ContextActionService_0 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), l_SettingsShowSignal_0 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v26 (copy), l_Enabled_0 (copy), l_Chrome_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v71 (ref), v13 (copy), l_TextChatService_0 (copy)
    local v92, v93 = v12.createBinding(UDim2.new());
    v91.unibarRightSidePosition = v92;
    v91.setUnibarRightSidePosition = v93;
    v92, v93 = v12.createBinding(false);
    v91.closeButtonState = v92;
    v91.setCloseButtonState = v93;
    v91.disposeUiScaleEffect = v9.createEffect(function(v94) --[[ Line: 176 ]]
        -- upvalues: v10 (ref), v91 (copy)
        local v95 = v10.GetDisplayStore(v94);
        v91:setState({
            UiScale = v95.getUIScale(v94)
        });
    end);
    if l_FFlagAddUILessMode_0 then
        v91.uiLessStore = l_Stores_0.GetUILessStore(false);
        if l_FIntAddUILessModeVariant_0 ~= 0 then
            v92, v93 = v12.createBinding(false);
            v91.uiLessTooltipVisible = v92;
            v91.setUILessTooltipVisible = v93;
            v92, v93 = v12.createBinding(0);
            v91.uiLessTooltipTransparency = v92;
            v91.setUILessTooltipTransparency = v93;
            v91.fadeOutUILessTooltip = function() --[[ Line: 190 ]]
                -- upvalues: v91 (copy), l_TweenService_0 (ref)
                local l_NumberValue_0 = Instance.new("NumberValue");
                l_NumberValue_0.Value = 0;
                l_NumberValue_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 193 ]]
                    -- upvalues: v91 (ref), l_NumberValue_0 (copy)
                    v91.setUILessTooltipTransparency(l_NumberValue_0.Value);
                end);
                local v97 = {
                    Value = 1
                };
                local v98 = TweenInfo.new(0.5);
                v91.uiLessTooltipTween = l_TweenService_0:Create(l_NumberValue_0, v98, v97);
                v91.uiLessTooltipTween.Completed:Connect(function() --[[ Line: 200 ]]
                    -- upvalues: v91 (ref)
                    v91.setUILessTooltipVisible(false);
                    v91.uiLessTooltipTween = nil;
                end);
                v91.uiLessTooltipTween:Play();
            end;
            v91.cleanupUILessTooltip = function() --[[ Line: 208 ]]
                -- upvalues: v91 (copy)
                if v91.uiLessTooltipTween then
                    v91.uiLessTooltipTween:Cancel();
                    v91.uiLessTooltipTween = nil;
                end;
                if v91.uiLessTooltipTimer then
                    task.cancel(v91.uiLessTooltipTimer);
                    v91.uiLessTooltipTimer = nil;
                end;
            end;
            if v91.uiLessStore.getUILessModeEnabled(false) then
                v92 = true;
                if v61 then
                    v93 = v61.loadForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2") or 0;
                    v92 = v93 < v62.MAX_NUM_UNIVERSES_SHOWN;
                    if v92 then
                        v61.storeForLocalPlayer("NumExperiencesUserSeenUILessTooltipKey2", v93 + 1);
                    end;
                end;
                if v92 then
                    v91.setUILessTooltipVisible(true);
                    v91.uiLessTooltipTimer = task.delay(v50, function() --[[ Line: 231 ]]
                        -- upvalues: v91 (copy)
                        v91.fadeOutUILessTooltip();
                        v91.uiLessTooltipTimer = nil;
                    end);
                end;
            end;
            l_ContextActionService_0:BindCoreAction("ToggleUILess", function(_, v100) --[[ Line: 238 ]]
                -- upvalues: v91 (copy), l_FIntAddUILessModeVariant_0 (ref), v30 (ref), l_Constants_0 (ref)
                if v100 ~= Enum.UserInputState.Begin then
                    return;
                else
                    if v91.uiLessStore.getUILessModeEnabled(false) then
                        if l_FIntAddUILessModeVariant_0 == 1 then
                            v91.uiLessStore.setUIVisible(function(v101) --[[ Line: 243 ]]
                                -- upvalues: v30 (ref), l_Constants_0 (ref)
                                if v101 == v30:GetVisibility() then
                                    v30:PopMenu(false, true, l_Constants_0.AnalyticsMenuOpenTypes.Keyboard);
                                end;
                                return not v101;
                            end);
                            v91.cleanupUILessTooltip();
                            v91.setUILessTooltipVisible(false);
                            return;
                        elseif l_FIntAddUILessModeVariant_0 == 2 then
                            v91.uiLessStore.setUIVisible(function(v102) --[[ Line: 254 ]]
                                return not v102;
                            end);
                            if v30:GetVisibility() then
                                v30:PopMenu(false, true, l_Constants_0.AnalyticsMenuOpenTypes.Keyboard);
                            end;
                            v91.cleanupUILessTooltip();
                            v91.setUILessTooltipVisible(false);
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
        v92, v93 = v12.createBinding(false);
        v91.tiltMenuOpen = v92;
        v91.setTiltMenuOpen = v93;
        v92, v93 = v12.createBinding(false);
        v91.inspectMenuOpen = v92;
        v91.setInspectMenuOpen = v93;
        v91.inspectMenuDisposeEffect = v9.createEffect(function(v103) --[[ Line: 276 ]]
            -- upvalues: l_Stores_0 (ref), v91 (copy)
            local v104 = l_Stores_0.GetInspectAndBuyStore(v103).getInspectAndBuyOpen(v103);
            v91.setInspectMenuOpen(v104);
        end);
        l_SettingsShowSignal_0:connect(function(v105) --[[ Line: 281 ]]
            -- upvalues: v91 (copy)
            v91.setTiltMenuOpen(v105);
        end);
    end;
    if l_FFlagTopBarSignalizeKeepOutAreas_0 then
        v91.keepOutAreasStore = v26.Stores.GetKeepOutAreasStore(false);
    end;
    v91.onCloseBtnStateChange = function(_, v107) --[[ Line: 290 ]]
        -- upvalues: v91 (copy)
        v91.setCloseButtonState(v107);
    end;
    if l_Enabled_0() then
        v91:setState({
            unibarAlignment = require(l_Chrome_0.Service):orderAlignment():get()
        });
        if l_FFlagEnableConsoleExpControls_0 then
            v91.GamepadConnector = v71;
        end;
        if l_FFlagEnableConsoleExpControls_0 then
            v91.unibarMenuRef = v13.createRef();
            v91.menuIconRef = v12.createRef();
        end;
    end;
    v91:setState({
        chatVersion = l_TextChatService_0.ChatVersion
    });
    if not game:IsLoaded() then
        game.Loaded:Connect(function() --[[ Line: 316 ]]
            -- upvalues: v91 (copy), l_TextChatService_0 (ref)
            v91:setState({
                chatVersion = l_TextChatService_0.ChatVersion
            });
        end);
    end;
end;
v90.didMount = function(v108) --[[ Line: 324 ]] --[[ Name: didMount ]]
    -- upvalues: l_Enabled_0 (copy), l_Chrome_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagDisableGamepadConnectorInVR_0 (copy), l_isSpatial_0 (copy), l_VRService_0 (copy)
    if l_Enabled_0() then
        local v109 = require(l_Chrome_0.Service);
        v108.orderAlignmentConnection = v109:orderAlignment():connect(function() --[[ Line: 327 ]]
            -- upvalues: v108 (copy), v109 (copy)
            v108:setState({
                unibarAlignment = v109:orderAlignment():get()
            });
        end);
        if l_FFlagEnableConsoleExpControls_0 then
            if l_FFlagDisableGamepadConnectorInVR_0 then
                if not l_isSpatial_0() then
                    v108.GamepadConnector:connectToTopbar();
                end;
                v108.vrEnabledConnection = l_VRService_0:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ Line: 338 ]]
                    -- upvalues: l_isSpatial_0 (ref), v108 (copy)
                    if l_isSpatial_0() then
                        v108.GamepadConnector:disconnectFromTopbar();
                        return;
                    else
                        v108.GamepadConnector:connectToTopbar();
                        return;
                    end;
                end);
                return;
            else
                v108.GamepadConnector:connectToTopbar();
            end;
        end;
    end;
end;
v90.willUnmount = function(v110) --[[ Line: 352 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_Enabled_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagDisableGamepadConnectorInVR_0 (copy), l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_ContextActionService_0 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy)
    if l_Enabled_0() then
        if v110.orderAlignmentConnection then
            v110.orderAlignmentConnection:disconnect();
            v110.orderAlignmentConnection = nil;
        end;
        if l_FFlagEnableConsoleExpControls_0 then
            if l_FFlagDisableGamepadConnectorInVR_0 and v110.vrEnabledConnection then
                v110.vrEnabledConnection:Disconnect();
                v110.vrEnabledConnection = nil;
            end;
            v110.GamepadConnector:disconnectFromTopbar();
        end;
    end;
    if v110.disposeUiScaleEffect then
        v110.disposeUiScaleEffect();
    end;
    if l_FFlagAddUILessMode_0 then
        if v110.uiLessStore then
            v110.uiLessStore.cleanup();
        end;
        if l_FIntAddUILessModeVariant_0 ~= 0 then
            v110.cleanupUILessTooltip();
            l_ContextActionService_0:UnbindCoreAction("ToggleUILess");
        end;
    end;
    if l_FFlagTopBarSignalizeMenuOpen_0 then
        if v110.tiltMenuDisposeEffect then
            v110.tiltMenuDisposeEffect();
        end;
        if v110.inspectMenuDisposeEffect then
            v110.inspectMenuDisposeEffect();
        end;
    end;
    if l_FFlagTopBarSignalizeKeepOutAreas_0 and v110.keepOutAreasStore then
        v110.keepOutAreasStore.cleanup();
    end;
end;
v90.render = function(v111) --[[ Line: 400 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v112) --[[ Line: 401 ]]
        -- upvalues: v111 (copy)
        return v111:renderWithStyle(v112);
    end);
end;
v90.renderUnibarFrame = function(v113, v114) --[[ Line: 406 ]] --[[ Name: renderUnibarFrame ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v13 (copy), v69 (copy), v58 (ref), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v12 (copy)
    if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
        return nil;
    elseif l_FFlagEnableConsoleExpControls_0 then
        return v13.createElement(v69.Provider, {
            value = {
                menuIconRef = v113.menuIconRef
            }
        }, {
            v13.createElement(v58, {
                layoutOrder = 1, 
                onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v113.keepOutAreasStore.setKeepOutArea else v113.props.setKeepOutArea, 
                onMinWidthChanged = function(v115) --[[ Line: 420 ]] --[[ Name: onMinWidthChanged ]]
                    -- upvalues: v113 (copy)
                    v113.setUnibarRightSidePosition(UDim2.new(0, v115, 0, 0));
                end, 
                menuRef = if v114 then v113.unibarMenuRef else nil
            })
        });
    else
        return v12.createElement(v58, {
            layoutOrder = 1, 
            onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v113.keepOutAreasStore.setKeepOutArea else v113.props.setKeepOutArea, 
            onMinWidthChanged = function(v116) --[[ Line: 432 ]] --[[ Name: onMinWidthChanged ]]
                -- upvalues: v113 (copy)
                v113.setUnibarRightSidePosition(UDim2.new(0, v116, 0, 0));
            end
        });
    end;
end;
v90.renderWithStyle = function(v117, v118) --[[ Line: 439 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: l_Enabled_0 (copy), v77 (copy), v65 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), v74 (copy), v12 (copy), v84 (copy), v87 (copy), l_default_0 (copy), l_isInExperienceUIVREnabled_0 (copy), v33 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), l_SelectionCursorProvider_0 (copy), l_isSpatial_0 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v63 (copy), v70 (ref), v72 (ref), v73 (ref), v78 (copy), v38 (copy), v54 (copy), l_HeadsetDisconnectDialog_0 (copy), v39 (copy), l_VRService_0 (copy), v59 (ref), v37 (copy), v76 (copy), l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_withLocalization_0 (copy), v58 (ref), v75 (copy), l_Interactable_0 (copy), l_RobloxGui_0 (copy), l_ControlState_0 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy), v24 (copy), v45 (copy), v82 (ref), l_GetFFlagEnableCrossExpVoice_0 (copy), v80 (copy), v60 (ref), l_FFlagAddTraversalBackButton_0 (copy), v13 (copy), l_View_0 (copy), v42 (copy), v86 (copy), v36 (copy), v41 (copy), l_Analytics_0 (copy), v34 (copy), v35 (copy)
    local v119 = l_Enabled_0();
    local v120 = v77() and not v119;
    local l_displayBetaBadge_0 = v117.props.displayBetaBadge;
    local l_Right_0 = Enum.HorizontalAlignment.Right;
    if v117.state.unibarAlignment ~= nil then
        l_Right_0 = v117.state.unibarAlignment;
    end;
    local v123 = v65.ScreenSideOffset * v117.state.UiScale;
    local v124 = v65.TopBarHeight * v117.state.UiScale;
    local v125 = v65.TopBarTopMargin * v117.state.UiScale;
    local v126 = v65.TopBarPadding * v117.state.UiScale;
    local v127 = v65.LegacyCloseMenuIconSize * v117.state.UiScale;
    local v128 = v65.UnibarFrame.PaddingTop * v117.state.UiScale;
    local v129 = v65.UnibarFrame.PaddingBottom * v117.state.UiScale;
    local v130 = v65.UnibarFrame.PaddingLeft * v117.state.UiScale;
    local v131 = v65.UnibarFrame.ExtendedSize * v117.state.UiScale;
    local v132 = if l_FFlagTopBarSignalizeMenuOpen_0 then v117.tiltMenuOpen else v117.props.menuOpen;
    if v74:IsEnabled() and not l_Enabled_0() then
        v123 = v65.ScreenSideOffsetTenFoot;
        v124 = v65.TopBarHeightTenFoot;
    end;
    local v134 = if l_FFlagTopBarSignalizeMenuOpen_0 then v12.joinBindings({
        v117.tiltMenuOpen, 
        v117.inspectMenuOpen
    }):map(function(v133) --[[ Line: 468 ]]
        return not (v133[0] or v133[1]);
    end) else not (v117.props.menuOpen or v117.props.inspectMenuOpen);
    local v135 = UDim2.new(0, 0, 0, v125);
    local v136 = v124 - v125;
    local v137 = UDim2.new(0, v123, 0, 0);
    local v138 = UDim2.new(1, -v123, 0, 0);
    local v139 = UDim2.new(1, -v123, 0, v125);
    local v140 = UDim2.new(0, 0, 0.5, 0);
    local v142 = v12.createElement(v84.Provider, {}, {
        VRBottomBar = v84.withVoiceState(function(v141) --[[ Line: 482 ]]
            -- upvalues: v12 (ref), v87 (ref), l_default_0 (ref), l_isInExperienceUIVREnabled_0 (ref), v117 (copy)
            return v12.createElement(v87, {
                voiceChatServiceManager = l_default_0, 
                voiceEnabled = v141.voiceEnabled, 
                voiceState = v141.voiceState, 
                showBadgeOver12 = if l_isInExperienceUIVREnabled_0 then v117.props.showBadgeOver12 else nil
            });
        end)
    });
    local v143 = v12.createElement(v33, {
        iconScale = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else if v117.props.menuOpen then v65.MenuIconOpenScale else 1, 
        layoutOrder = 1, 
        showBadgeOver12 = v117.props.showBadgeOver12, 
        menuIconRef = if v119 and l_FFlagEnableConsoleExpControls_0 then v117.menuIconRef else nil, 
        unibarMenuRef = if v119 and l_FFlagEnableConsoleExpControls_0 then v117.unibarMenuRef else nil, 
        onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v117.keepOutAreasStore.setKeepOutArea else nil
    });
    v143 = v12.createElement(l_SelectionCursorProvider_0, {}, {
        Icon = v143
    });
    local v144 = true;
    if l_isInExperienceUIVREnabled_0 then
        v144 = not l_isSpatial_0();
    end;
    return v12.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false, 
        DisplayOrder = 6, 
        [v12.Change.AbsoluteSize] = if l_FFlagTopBarSignalizeScreenSize_0 then nil else function(v145) --[[ Line: 516 ]]
            -- upvalues: v117 (copy)
            v117.props.setScreenSize(v145.AbsoluteSize);
        end
    }, {
        Connection = v12.createElement(v63), 
        GamepadMenu = if not l_FFlagEnableConsoleExpControls_0 then v12.createElement(v70, {
            chatVersion = v117.state.chatVersion
        }) else nil, 
        MenuNavigationToggleDialog = if v119 and v72 and l_FFlagEnableConsoleExpControls_0 then v12.createElement(v73, {
            Position = UDim2.fromScale(0.5, 0.1), 
            GamepadConnector = if l_FFlagEnableConsoleExpControls_0 then v117.GamepadConnector else nil
        }) else nil, 
        GamepadNavigationDialog = if v78 then v12.createElement(v38) else nil, 
        HeadsetMenu = if v54 then v12.createElement(l_HeadsetDisconnectDialog_0) else v12.createElement(v39), 
        VRBottomBar = l_VRService_0.VREnabled and v142 or nil, 
        KeepOutAreasHandler = if not l_FFlagTopBarSignalizeKeepOutAreas_0 and v59 then v12.createElement(v59) else nil, 
        FullScreenFrame = v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = v134
        }, {
            HurtOverlay = v12.createElement(v37)
        }), 
        MenuIconHolder = if v144 and v76() then v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v123, 0, v125), 
            Size = UDim2.new(1, 0, 0, v136)
        }, {
            MenuIcon = v143
        }) else nil, 
        UILessTooltip = if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 then l_withLocalization_0({
            uiLessTooltipTitle = v65.LocalizedKeys.UILessTooltipTitle, 
            uiLessTooltipDescription = v65.LocalizedKeys.UILessTooltipDescription
        })(function(v146) --[[ Line: 575 ]]
            -- upvalues: v12 (ref), v118 (copy), v123 (ref), v125 (copy), v117 (copy)
            return v12.createElement("Frame", {
                BackgroundColor3 = v118.Tokens.Global.Color.White.Color3, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0, v123, 0, v125), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = v117.uiLessTooltipTransparency, 
                Visible = v117.uiLessTooltipVisible, 
                ZIndex = 10000, 
                [v12.Ref] = v117.uiLessTooltip
            }, {
                Padding = v12.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v118.Tokens.Global.Space_100), 
                    PaddingBottom = UDim.new(0, v118.Tokens.Global.Space_100), 
                    PaddingLeft = UDim.new(0, v118.Tokens.Global.Space_150), 
                    PaddingRight = UDim.new(0, v118.Tokens.Global.Space_150)
                }), 
                Corner = v12.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v118.Tokens.Semantic.Radius.Small)
                }), 
                VerticalLayout = v12.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v118.Tokens.Global.Space_50)
                }), 
                Title = v12.createElement("TextLabel", {
                    Text = v146.uiLessTooltipTitle, 
                    TextSize = v118.Tokens.Global.FontSize_50, 
                    TextTransparency = v117.uiLessTooltipTransparency, 
                    Font = Enum.Font.BuilderSansBold, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1
                }), 
                Description = v12.createElement("TextLabel", {
                    Text = v146.uiLessTooltipDescription, 
                    TextSize = v118.Tokens.Global.FontSize_50, 
                    TextTransparency = v117.uiLessTooltipTransparency, 
                    Font = Enum.Font.BuilderSans, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2
                })
            });
        end) else nil, 
        LegacyCloseMenu = not v58 and not v75() and v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v123, 0, 0), 
            Size = UDim2.new(1, 0, 0, v124), 
            Visible = v132
        }, {
            CloseMenuButtonRound = v58 and v12.createElement(l_Interactable_0, {
                onStateChanged = v117.onCloseBtnStateChange, 
                Visible = not v74:IsEnabled(), 
                BackgroundTransparency = v118.Theme.Overlay.Transparency, 
                Position = v140, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(0, v127, 0, v127), 
                BackgroundColor3 = v118.Theme.Overlay.Color, 
                [v12.Event.Activated] = function() --[[ Line: 644 ]]
                    -- upvalues: l_RobloxGui_0 (ref)
                    require(l_RobloxGui_0.Modules.Settings.SettingsHub):ToggleVisibility();
                end
            }, {
                UICorner = v119 and v12.createElement("UICorner", {
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
                StateOverlayRound = not v119 and v12.createElement("Frame", {
                    BackgroundTransparency = v117.closeButtonState:map(function(v147) --[[ Line: 674 ]]
                        -- upvalues: l_ControlState_0 (ref), v118 (copy)
                        if v147 == l_ControlState_0.Pressed then
                            return v118.Theme.BackgroundOnPress.Transparency;
                        elseif v147 == l_ControlState_0.Hover then
                            return v118.Theme.BackgroundOnHover.Transparency;
                        else
                            return 1;
                        end;
                    end), 
                    BackgroundColor3 = v117.closeButtonState:map(function(v148) --[[ Line: 683 ]]
                        -- upvalues: l_ControlState_0 (ref), v118 (copy)
                        if v148 == l_ControlState_0.Pressed then
                            return v118.Theme.BackgroundOnPress.Color;
                        elseif v148 == l_ControlState_0.Hover then
                            return v118.Theme.BackgroundOnHover.Color;
                        else
                            return Color3.new(1, 1, 1);
                        end;
                    end), 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = 2
                }, {
                    UICorner = v119 and v12.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }) or nil
                }) or nil
            }) or nil, 
            CloseMenuButton = not v58 and v12.createElement(l_ImageSetButton_0, {
                Visible = not v74:IsEnabled(), 
                BackgroundTransparency = 1, 
                Position = v140, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(0, v127, 0, v127), 
                Image = l_Images_0["icons/controls/close-ingame"], 
                [v12.Event.Activated] = function() --[[ Line: 709 ]]
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
        UnibarLeftFrame = v58 and l_Right_0 == Enum.HorizontalAlignment.Left and v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v136), 
            Position = v139, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            JoinVoiceBinder = if v119 and v82 then v12.createElement(v82) else nil, 
            PartyMicBinder = if v119 and l_GetFFlagEnableCrossExpVoice_0() then v12.createElement(v80) else nil, 
            ChromeAnalytics = if v60 then v12.createElement(v60) else nil, 
            Padding = v12.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v128), 
                PaddingBottom = UDim.new(0, v129), 
                PaddingLeft = UDim.new(0, v130)
            }), 
            TopBarLeftContainer = l_FFlagAddTraversalBackButton_0 and v13.createElement(l_View_0, {
                tag = "auto-xy row gap-xsmall"
            }, {
                TraversalBackButton = if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then nil else v13.createElement(v42), 
                UnibarFrame = v117:renderUnibarFrame(v119)
            }), 
            Unibar = if not l_FFlagAddTraversalBackButton_0 then v117:renderUnibarFrame(v119) else nil, 
            HealthBar = if v86 then v12.createElement(v36, {}) else nil, 
            StackedElements = v12.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = v117.unibarRightSidePosition, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Padding = v12.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v126)
                }), 
                Layout = v12.createElement("UIListLayout", {
                    Padding = UDim.new(0, v126), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HealthBar = if v86 then nil else v12.createElement(v36, {
                    layoutOrder = 10
                }), 
                VoiceBetaBadge = if v77() and l_displayBetaBadge_0 then v12.createElement(v41, {
                    layoutOrder = 6, 
                    Analytics = l_Analytics_0.new()
                }) else nil
            })
        }) or nil, 
        UnibarRightFrame = v58 and l_Right_0 == Enum.HorizontalAlignment.Right and v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v136), 
            Position = v139, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            ChromeAnalytics = if v60 then v12.createElement(v60) else nil, 
            Padding = v12.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v128), 
                PaddingBottom = UDim.new(0, v129)
            }), 
            Layout = v12.createElement("UIListLayout", {
                Padding = UDim.new(0, v126), 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            HealthBar = v12.createElement(v36, {
                layoutOrder = 1
            }), 
            Unibar = v12.createElement(v58, {
                onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v117.keepOutAreasStore.setKeepOutArea else v117.props.setKeepOutArea, 
                layoutOrder = 2
            })
        }) or nil, 
        TopBarFrame = v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v136), 
            Visible = v134, 
            Position = v135
        }, {
            LeftFrame = (not not v119 or not v74:IsEnabled()) and v12.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.5, -v123, 1, 0), 
                Position = v137
            }, {
                Layout = v12.createElement("UIListLayout", {
                    Padding = UDim.new(0, v126), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Blank = v119 and v12.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, v131, 0, 1), 
                    BackgroundTransparency = 1
                }), 
                MenuIcon = not v76() and v12.createElement(v33, {
                    layoutOrder = 1, 
                    showBadgeOver12 = v117.props.showBadgeOver12, 
                    onAreaChanged = if l_FFlagTopBarSignalizeKeepOutAreas_0 then v117.keepOutAreasStore.setKeepOutArea else nil
                }), 
                ChatIcon = not v119 and v12.createElement(v34, {
                    layoutOrder = 3
                }) or nil, 
                VoiceBetaBadge = if v120 and l_displayBetaBadge_0 then v12.createElement(v41, {
                    layoutOrder = 4, 
                    Analytics = l_Analytics_0.new()
                }) else nil
            }), 
            RightFrame = not v58 and v12.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.5, -v123, 1, 0), 
                Position = v138, 
                AnchorPoint = Vector2.new(1, 0)
            }, {
                Layout = v12.createElement("UIListLayout", {
                    Padding = UDim.new(0, v126), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HealthBar = v12.createElement(v36, {
                    layoutOrder = 1
                }), 
                MoreMenu = not v74:IsEnabled() and v12.createElement(v35, {
                    layoutOrder = 2
                })
            }) or nil
        })
    });
end;
local function v151(v149) --[[ Line: 911 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagTopBarSignalizeMenuOpen_0 (copy)
    if l_FFlagTopBarSignalizeMenuOpen_0 then
        return nil;
    else
        local l_inspectMenuOpen_0 = v149.displayOptions.inspectMenuOpen;
        return {
            menuOpen = v149.displayOptions.menuOpen, 
            inspectMenuOpen = l_inspectMenuOpen_0
        };
    end;
end;
local v154 = v85.connect(function(v152, _) --[[ Line: 924 ]]
    return {
        displayBetaBadge = v152.getDisplayVoiceBetaBadge(), 
        showBadgeOver12 = v152.showBadgeOver12()
    };
end)(v90);
return v14.UNSTABLE_connect2(if l_FFlagTopBarSignalizeMenuOpen_0 then nil else v151, function(v155) --[[ Line: 931 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy), v66 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v67 (copy), v68 (copy)
    return {
        setScreenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else function(v156) --[[ Line: 935 ]]
            -- upvalues: v155 (copy), v66 (ref)
            return v155(v66(v156));
        end, 
        setKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v157, v158, v159) --[[ Line: 940 ]]
            -- upvalues: v155 (copy), v67 (ref)
            return v155(v67(v157, v158, v159));
        end, 
        removeKeepOutArea = if l_FFlagTopBarSignalizeKeepOutAreas_0 then nil else function(v160) --[[ Line: 945 ]]
            -- upvalues: v155 (copy), v68 (ref)
            return v155(v68(v160));
        end
    };
end)(v154);