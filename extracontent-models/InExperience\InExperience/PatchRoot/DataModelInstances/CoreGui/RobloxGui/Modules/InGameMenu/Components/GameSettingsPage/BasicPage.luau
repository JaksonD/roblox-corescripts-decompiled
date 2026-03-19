local l_Players_0 = game:GetService("Players");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_VRService_0 = game:GetService("VRService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Platform_0 = game:GetService("UserInputService"):GetPlatform();
local v7 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v7.Roact;
local l_RoactRodux_0 = v7.RoactRodux;
local l_t_0 = v7.t;
local l_UIBlox_0 = v7.UIBlox;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_l_LocalPlayer_0_PropertyChangedSignal_0 = l_LocalPlayer_0:GetPropertyChangedSignal("DevEnableMouseLock");
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("IsUsingCameraYInverted");
local v15 = require(script.Parent.Parent.Connection.FocusHandler);
local l_Parent_0 = script.Parent.Parent.Parent;
local v17 = require(l_Parent_0.Components.Divider);
local v18 = require(l_Parent_0.Utility.ExternalEventConnection);
local v19 = require(l_Parent_0.Components.Page);
local v20 = require(l_Parent_0.Components.ThemedTextLabel);
local v21 = require(l_Parent_0.Localization.withLocalization);
local v22 = require(l_Parent_0.Resources.Assets);
local v23 = require(l_Parent_0.Actions.SetCurrentPage);
local v24 = require(script.Parent.AutoPropertyToggleEntry);
local v25 = require(script.Parent.SafetyBubbleModeEntry);
local v26 = nil;
if game:GetEngineFeature("VRMoreComfortSettings") then
    v26 = require(script.Parent.ComfortSettingsEntry);
end;
local v27 = require(script.Parent.CameraModeEntry);
local v28 = require(script.Parent.CameraSensitivityEntry);
local v29 = require(script.Parent.CategoryHeader);
local v30 = require(script.Parent.DeviceSelectionEntry);
local v31 = require(script.Parent.GraphicsQualityEntry);
local v32 = require(script.Parent.MovementModeEntry);
local v33 = require(script.Parent.ToggleEntry);
local v34 = require(script.Parent.VolumeEntry);
local v35 = require(l_Parent_0.Utility.SendAnalytics);
local v36 = require(l_Parent_0.Resources.Constants);
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Flags_0 = l_Parent_0.Flags;
local v41 = require(l_Flags_0.GetFFlagIGMGamepadSelectionHistory);
local v42 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAlwaysShowVRToggle);
local l_game_EngineFeature_0 = game:GetEngineFeature("VRMoreComfortSettings");
local l_l_UserGameSettings_0_PropertyChangedSignal_1 = l_UserGameSettings_0:GetPropertyChangedSignal("VREnabled");
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v46 = l_Roact_0.PureComponent:extend("BasicPage");
v46.validateProps = l_t_0.strictInterface({
    switchToAdvancedPage = l_t_0.callback, 
    switchToVRComfortSettingsPage = l_t_0.callback, 
    pageTitle = l_t_0.string, 
    isMenuOpen = l_t_0.boolean, 
    currentPage = l_t_0.optional(l_t_0.string), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    canGamepadCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    vrService = l_t_0.optional(l_t_0.union(l_t_0.Instance, l_t_0.table)), 
    isVRAppBuild = l_t_0.optional(l_t_0.callback), 
    currentZone = v41() and l_t_0.optional(l_t_0.number) or nil
});
v46.defaultProps = {
    vrService = l_VRService_0, 
    isVRAppBuild = l_IsVRAppBuild_0
};
local l_VREnabled_0 = l_UserGameSettings_0.VREnabled;
v46.init = function(v48) --[[ Line: 94 ]] --[[ Name: init ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_UserGameSettings_0 (copy), l_Roact_0 (copy)
    v48:setState({
        shiftLockEnabled = l_LocalPlayer_0.DevEnableMouseLock, 
        fullScreenEnabled = l_UserGameSettings_0:InFullScreen(), 
        invertedCameraEnabled = l_UserGameSettings_0.IsUsingCameraYInverted, 
        vrActive = v48.props.vrService.VREnabled, 
        vrEnabled = l_UserGameSettings_0.VREnabled, 
        voiceChatEnabled = false
    });
    local v49, v50 = l_Roact_0.createBinding(UDim2.new(0, 0, 0, 0));
    v48.pageSize = v49;
    v48.setPageSize = v50;
    v48.cameraModeButton = l_Roact_0.createRef();
    v48.volumeButton = l_Roact_0.createRef();
end;
v46.didUpdate = function(v51, v52) --[[ Line: 110 ]] --[[ Name: didUpdate ]]
    -- upvalues: v41 (copy), l_GuiService_0 (copy)
    if not v41() and v51.props.canCaptureFocus and v51.props.canGamepadCaptureFocus and (not v52.canCaptureFocus or not v52.canGamepadCaptureFocus) then
        if not v51.state.vrActive then
            l_GuiService_0.SelectedCoreObject = v51.cameraModeButton:getValue();
            return;
        else
            l_GuiService_0.SelectedCoreObject = v51.volumeButton:getValue();
        end;
    end;
end;
local function _() --[[ Line: 127 ]] --[[ Name: createLayoutOrderGenerator ]]
    local v53 = 0;
    return function() --[[ Line: 129 ]]
        -- upvalues: v53 (ref)
        v53 = v53 + 1;
        return v53;
    end;
end;
v46.renderWithSelectionCursor = function(v55, v56) --[[ Line: 135 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v42 (copy), l_Platform_0 (copy), l_UserGameSettings_0 (copy), l_Roact_0 (copy), v19 (copy), v41 (copy), v15 (copy), v36 (copy), l_GuiService_0 (copy), v29 (copy), l_game_EngineFeature_0 (copy), v24 (copy), v26 (ref), v21 (copy), v20 (copy), l_ImageSetLabel_0 (copy), v22 (copy), l_VREnabled_0 (copy), v25 (copy), v17 (copy), v27 (copy), v28 (copy), v32 (copy), v34 (copy), v30 (copy), v31 (copy), v33 (copy), v35 (copy), l_CursorKind_0 (copy), v18 (copy), l_l_LocalPlayer_0_PropertyChangedSignal_0 (copy), l_LocalPlayer_0 (copy), l_l_UserGameSettings_0_PropertyChangedSignal_0 (copy), l_l_UserGameSettings_0_PropertyChangedSignal_1 (copy)
    local v57 = false;
    local v58 = 0;
    local v59;
    if true then
        local l_v58_0 = v58;
        v59 = function() --[[ Line: 129 ]]
            -- upvalues: l_v58_0 (ref)
            l_v58_0 = l_v58_0 + 1;
            return l_v58_0;
        end;
    end;
    v58 = v55.state.voiceChatEnabled and not v55.props.isVRAppBuild();
    local v61 = if v42() then l_Platform_0 == Enum.Platform.Windows or l_Platform_0 == Enum.Platform.UWP else (v55.state.vrActive or l_UserGameSettings_0.HasEverUsedVR) and not v55.props.isVRAppBuild();
    local l_createElement_0 = l_Roact_0.createElement;
    local l_v19_0 = v19;
    local v64 = {
        pageTitle = v55.props.pageTitle, 
        position = v55.props.position
    };
    local v65 = {};
    local v66;
    if v41() then
        v66 = l_Roact_0.createElement;
        local l_v15_0 = v15;
        local v68 = {
            isFocused = v55.props.canCaptureFocus and v55.props.canGamepadCaptureFocus
        };
        local v69 = true;
        if v55.props.currentPage ~= v36.MainPagePageKey then
            v69 = v55.props.currentZone == 0;
        end;
        v68.shouldForgetPreviousSelection = v69;
        v68.didFocus = function(v70) --[[ Line: 150 ]] --[[ Name: didFocus ]]
            -- upvalues: l_GuiService_0 (ref), v55 (copy)
            if v70 then
                l_GuiService_0.SelectedCoreObject = v70;
                return;
            elseif not v55.state.vrActive then
                l_GuiService_0.SelectedCoreObject = v55.cameraModeButton:getValue();
                return;
            else
                l_GuiService_0.SelectedCoreObject = v55.volumeButton:getValue();
                return;
            end;
        end;
        v66 = v66(l_v15_0, v68);
        v57 = v66;
    end;
    if not v57 then
        v66 = nil;
    end;
    v57 = false;
    v65.FocusHandler = v66;
    v65.PageContents = l_Roact_0.createElement("ScrollingFrame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        CanvasSize = v55.pageSize, 
        Position = v55.props.position, 
        Size = UDim2.new(1, 0, 1, 0), 
        Selectable = false
    }, {
        Layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            [l_Roact_0.Change.AbsoluteContentSize] = function(v71) --[[ Line: 172 ]]
                -- upvalues: v55 (copy)
                v55.setPageSize(UDim2.new(0, 0, 0, v71.AbsoluteContentSize.Y));
            end
        }), 
        VRControlsHeader = if v55.state.vrActive then l_Roact_0.createElement(v29, {
            LayoutOrder = v59(), 
            localizationKey = "CoreScripts.InGameMenu.GameSettings.VrControlsTitle"
        }) else nil, 
        VignetteEnabled = if not l_game_EngineFeature_0 and v55.state.vrActive then l_Roact_0.createElement(v24, {
            LayoutOrder = v59(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled", 
            instance = l_UserGameSettings_0, 
            valueKey = "VignetteEnabled"
        }) else nil, 
        VRSmoothRotationEnabled = if not l_game_EngineFeature_0 and v55.state.vrActive then l_Roact_0.createElement(v24, {
            LayoutOrder = v59(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.VRSmoothRotationEnabled", 
            instance = l_UserGameSettings_0, 
            valueKey = "VRSmoothRotationEnabled"
        }) else nil, 
        VRComfortSettings = if l_game_EngineFeature_0 and v55.state.vrActive then l_Roact_0.createElement(v26, {
            LayoutOrder = v59()
        }) else nil, 
        VRComfortSettingsPageButton = if l_game_EngineFeature_0 and v55.state.vrActive then l_Roact_0.createElement("TextButton", {
            LayoutOrder = v59(), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 54), 
            Text = "", 
            [l_Roact_0.Event.Activated] = v55.props.switchToVRComfortSettingsPage
        }, {
            Text = v21({
                text = "CoreScripts.InGameMenu.GameSettings.SwitchToVRComfortSettings"
            })(function(v72) --[[ Line: 213 ]]
                -- upvalues: l_Roact_0 (ref), v20 (ref)
                return l_Roact_0.createElement(v20, {
                    Text = v72.text, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    Size = UDim2.new(1, -96, 1, 0), 
                    Position = UDim2.new(0, 24, 0.5, 0), 
                    AnchorPoint = Vector2.new(0, 0.5)
                });
            end), 
            Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v22.Images.NavigateForward, 
                Size = UDim2.new(0, 36, 0, 36), 
                Position = UDim2.new(1, -36, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5)
            })
        }) else nil, 
        VRMode = if v61 then l_Roact_0.createElement(v24, {
            LayoutOrder = v59(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.VREnabled", 
            instance = l_UserGameSettings_0, 
            valueKey = "VREnabled", 
            subtextEnabled = v55.state.vrEnabled ~= l_VREnabled_0, 
            subtextKey = "CoreScripts.InGameMenu.GameSettings.RestartPending"
        }) else nil, 
        VRSafetyBubbleMode = if v55.state.vrActive then l_Roact_0.createElement(v25, {
            LayoutOrder = v59()
        }) else nil, 
        VRControlsDivider = if v55.state.vrActive then l_Roact_0.createElement(v17, {
            LayoutOrder = v59(), 
            Size = UDim2.new(1, -24, 0, 1)
        }) else nil, 
        CameraHeader = if not v55.state.vrActive then l_Roact_0.createElement(v29, {
            LayoutOrder = v59(), 
            localizationKey = "CoreScripts.InGameMenu.GameSettings.CameraTitle"
        }) else nil, 
        CameraMode = not v55.state.vrActive and l_Roact_0.createElement(v27, {
            LayoutOrder = v59(), 
            ButtonRef = v55.cameraModeButton, 
            canOpen = v55.props.canCaptureFocus, 
            canCaptureFocus = v55.props.canGamepadCaptureFocus
        }), 
        InvertedCamera = not v55.state.vrActive and v55.state.invertedCameraEnabled and l_Roact_0.createElement(v24, {
            LayoutOrder = v59(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.InvertedCamera", 
            instance = l_UserGameSettings_0, 
            valueKey = "CameraYInverted"
        }), 
        CameraSensitivity = not v55.state.vrActive and l_Roact_0.createElement(v28, {
            LayoutOrder = v59(), 
            canCaptureFocus = v55.props.canCaptureFocus and v55.props.canGamepadCaptureFocus, 
            isMenuOpen = v55.props.isMenuOpen
        }), 
        CameraDivider = if not v55.state.vrActive then l_Roact_0.createElement(v17, {
            LayoutOrder = v59(), 
            Size = UDim2.new(1, -24, 0, 1)
        }) else nil, 
        ControlsHeader = l_Roact_0.createElement(v29, {
            LayoutOrder = v59(), 
            localizationKey = "CoreScripts.InGameMenu.GameSettings.ControlsAudio"
        }), 
        ShiftLock = not v55.state.vrActive and l_Roact_0.createElement(v24, {
            LayoutOrder = v59(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.ShiftLock", 
            instance = l_UserGameSettings_0, 
            valueKey = "ControlMode", 
            onValue = Enum.ControlMode.MouseLockSwitch, 
            offValue = Enum.ControlMode.Classic, 
            lockedToOff = not v55.state.shiftLockEnabled
        }), 
        MovementMode = not v55.state.vrActive and l_Roact_0.createElement(v32, {
            LayoutOrder = v59(), 
            canOpen = v55.props.canCaptureFocus, 
            canCaptureFocus = v55.props.canGamepadCaptureFocus
        }), 
        VolumeEntry = l_Roact_0.createElement(v34, {
            LayoutOrder = v59(), 
            buttonRef = v55.volumeButton, 
            canCaptureFocus = v55.props.canCaptureFocus and v55.props.canGamepadCaptureFocus, 
            isMenuOpen = v55.props.isMenuOpen
        }), 
        HapticsToggle = l_Roact_0.createElement(v24, {
            LayoutOrder = v59(), 
            labelKey = "Feature.Accessibility.Header.Haptics", 
            instance = l_UserGameSettings_0, 
            valueKey = "HapticStrength", 
            onValue = 1, 
            offValue = 0
        }), 
        InputDevice = v58 and l_Roact_0.createElement(v30, {
            LayoutOrder = v59(), 
            deviceType = v30.DeviceType.Input, 
            isMenuOpen = v55.props.isMenuOpen, 
            canOpen = v55.props.canCaptureFocus, 
            canCaptureFocus = v55.props.canGamepadCaptureFocus
        }), 
        OutputDevice = v58 and l_Roact_0.createElement(v30, {
            LayoutOrder = v59(), 
            deviceType = v30.DeviceType.Output, 
            isMenuOpen = v55.props.isMenuOpen, 
            canOpen = v55.props.canCaptureFocus, 
            canCaptureFocus = v55.props.canGamepadCaptureFocus
        }), 
        ControlsDivider = l_Roact_0.createElement(v17, {
            LayoutOrder = v59(), 
            Size = UDim2.new(1, -24, 0, 1)
        }), 
        GraphicsHeader = l_Roact_0.createElement(v29, {
            LayoutOrder = v59(), 
            localizationKey = "CoreScripts.InGameMenu.GameSettings.GraphicsTitle"
        }), 
        GraphicsQualityEntry = l_Roact_0.createElement(v31, {
            LayoutOrder = v59(), 
            canCaptureFocus = v55.props.canCaptureFocus and v55.props.canGamepadCaptureFocus, 
            isMenuOpen = v55.props.isMenuOpen
        }), 
        FullScreen = not v55.state.vrActive and l_Roact_0.createElement(v33, {
            LayoutOrder = v59(), 
            labelKey = "CoreScripts.InGameMenu.GameSettings.FullScreen", 
            checked = v55.state.fullScreenEnabled, 
            onToggled = function() --[[ Line: 355 ]] --[[ Name: onToggled ]]
                -- upvalues: l_GuiService_0 (ref), v35 (ref), v36 (ref)
                l_GuiService_0:ToggleFullscreen();
                v35(v36.AnalyticsSettingsChangeName, nil, {}, true);
            end
        }), 
        GraphicsDivider = l_Roact_0.createElement(v17, {
            LayoutOrder = v59(), 
            Size = UDim2.new(1, -24, 0, 1)
        }), 
        AdvancedSettings = l_Roact_0.createElement("TextButton", {
            LayoutOrder = v59(), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 54), 
            Text = "", 
            SelectionImageObject = v56(l_CursorKind_0.Square), 
            [l_Roact_0.Event.Activated] = v55.props.switchToAdvancedPage
        }, {
            Text = v21({
                text = "CoreScripts.InGameMenu.GameSettings.SwitchToAdvancedSettings"
            })(function(v73) --[[ Line: 374 ]]
                -- upvalues: l_Roact_0 (ref), v20 (ref)
                return l_Roact_0.createElement(v20, {
                    Text = v73.text, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    Size = UDim2.new(1, -96, 1, 0), 
                    Position = UDim2.new(0, 24, 0.5, 0), 
                    AnchorPoint = Vector2.new(0, 0.5)
                });
            end), 
            Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v22.Images.NavigateForward, 
                Size = UDim2.new(0, 36, 0, 36), 
                Position = UDim2.new(1, -36, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5)
            })
        }), 
        AdvancedDivider = l_Roact_0.createElement(v17, {
            LayoutOrder = v59(), 
            Size = UDim2.new(1, -24, 0, 1)
        }), 
        ShiftLockEnabledListener = l_Roact_0.createElement(v18, {
            event = l_l_LocalPlayer_0_PropertyChangedSignal_0, 
            callback = function() --[[ Line: 405 ]] --[[ Name: callback ]]
                -- upvalues: v55 (copy), l_LocalPlayer_0 (ref)
                v55:setState({
                    shiftLockEnabled = l_LocalPlayer_0.DevEnableMouseLock
                });
            end
        }), 
        FullScreenListener = l_Roact_0.createElement(v18, {
            event = l_UserGameSettings_0.FullscreenChanged, 
            callback = function(v74) --[[ Line: 413 ]] --[[ Name: callback ]]
                -- upvalues: v55 (copy), v35 (ref), v36 (ref)
                v55:setState({
                    fullScreenEnabled = v74
                });
                v35(v36.AnalyticsInGameMenuName, v36.AnalyticsFullscreenModeName, {
                    enabled = v74
                });
            end
        }), 
        CameraYInvertedListener = l_Roact_0.createElement(v18, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = function() --[[ Line: 425 ]] --[[ Name: callback ]]
                -- upvalues: v55 (copy), l_UserGameSettings_0 (ref)
                v55:setState({
                    invertedCameraEnabled = l_UserGameSettings_0.IsUsingCameraYInverted
                });
            end
        }), 
        VRActiveListener = l_Roact_0.createElement(v18, {
            event = v55.props.vrService:GetPropertyChangedSignal("VREnabled"), 
            callback = function() --[[ Line: 433 ]] --[[ Name: callback ]]
                -- upvalues: v55 (copy), l_UserGameSettings_0 (ref)
                if v55.props.vrService.VREnabled then
                    l_UserGameSettings_0.HasEverUsedVR = true;
                end;
                v55:setState({
                    vrActive = v55.props.vrService.VREnabled
                });
            end
        }), 
        VREnabledListener = l_Roact_0.createElement(v18, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_1, 
            callback = function() --[[ Line: 444 ]] --[[ Name: callback ]]
                -- upvalues: v55 (copy), l_UserGameSettings_0 (ref)
                v55:setState({
                    vrEnabled = l_UserGameSettings_0.VREnabled
                });
            end
        })
    });
    return l_createElement_0(l_v19_0, v64, v65);
end;
v46.render = function(v75) --[[ Line: 454 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v76) --[[ Line: 455 ]]
        -- upvalues: v75 (copy)
        return v75:renderWithSelectionCursor(v76);
    end);
end;
v46.didMount = function(v77) --[[ Line: 460 ]] --[[ Name: didMount ]]
    -- upvalues: l_RobloxGui_0 (copy)
    spawn(function() --[[ Line: 461 ]]
        -- upvalues: l_RobloxGui_0 (ref), v77 (copy)
        require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default:asyncInit():andThen(function() --[[ Line: 466 ]]
            -- upvalues: v77 (ref)
            v77:setState({
                voiceChatEnabled = true
            });
        end):catch(function() --[[ Line: 471 ]]

        end);
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v78) --[[ Line: 475 ]]
    -- upvalues: v36 (copy), v41 (copy)
    local v79 = false;
    if v78.menuPage == "GameSettings" then
        v79 = v78.isMenuOpen and not v78.respawn.dialogOpen;
    end;
    local v80 = false;
    if v78.displayOptions.inputType == v36.InputType.Gamepad then
        v80 = v78.currentZone == 1;
    end;
    local v81 = nil;
    if v41() then
        v81 = v78.currentZone;
    end;
    return {
        isMenuOpen = v78.isMenuOpen, 
        currentPage = v78.menuPage, 
        currentZone = v81, 
        canCaptureFocus = v79, 
        canGamepadCaptureFocus = v80
    };
end, function(v82) --[[ Line: 493 ]]
    -- upvalues: v23 (copy), v36 (copy)
    return {
        switchToAdvancedPage = function() --[[ Line: 495 ]] --[[ Name: switchToAdvancedPage ]]
            -- upvalues: v82 (copy), v23 (ref), v36 (ref)
            v82(v23(v36.advancedSettingsPageKey));
        end, 
        switchToVRComfortSettingsPage = function() --[[ Line: 498 ]] --[[ Name: switchToVRComfortSettingsPage ]]
            -- upvalues: v82 (copy), v23 (ref), v36 (ref)
            v82(v23(v36.vrComfortSettingsPageKey));
        end
    };
end)(v46);