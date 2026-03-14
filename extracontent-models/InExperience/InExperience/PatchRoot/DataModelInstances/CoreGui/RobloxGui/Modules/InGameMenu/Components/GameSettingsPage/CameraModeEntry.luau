local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("ComputerCameraMovementMode");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.CoreUtility);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v7 = v5.waitForChildOfClass(l_LocalPlayer_0, "PlayerScripts");
local l_l_LocalPlayer_0_PropertyChangedSignal_0 = l_LocalPlayer_0:GetPropertyChangedSignal("DevComputerMovementMode");
local v9 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v9.Roact;
local l_t_0 = v9.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v13 = require(l_Parent_0.Components.DropDownSelection);
local v14 = require(l_Parent_0.Utility.ExternalEventConnection);
local v15 = require(script.Parent.InputLabel);
local v16 = require(script.Parent.DeveloperLockLabel);
local v17 = require(l_Parent_0.Localization.withLocalization);
local v18 = require(l_Parent_0.Utility.SendAnalytics);
local v19 = require(l_Parent_0.Resources.Constants);
local v20 = {
    [Enum.ComputerCameraMovementMode.Classic] = "CoreScripts.InGameMenu.GameSettings.CameraModeClassic", 
    [Enum.ComputerCameraMovementMode.Follow] = "CoreScripts.InGameMenu.GameSettings.CameraModeFollow", 
    [Enum.ComputerCameraMovementMode.Default] = "CoreScripts.InGameMenu.GameSettings.Default", 
    [Enum.ComputerCameraMovementMode.CameraToggle] = "CoreScripts.InGameMenu.GameSettings.CameraModeCameraToggle"
};
local v21 = l_Roact_0.PureComponent:extend("CameraModeEntry");
v21.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    canOpen = l_t_0.optional(l_t_0.boolean), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    ButtonRef = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table))
});
v21.defaultProps = {
    canOpen = true
};
v21.init = function(v22) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: l_UserGameSettings_0 (copy), v7 (copy), l_LocalPlayer_0 (copy)
    v22:setState({
        selectedComputerMode = l_UserGameSettings_0.ComputerCameraMovementMode, 
        computerOptions = v7 and v7:GetRegisteredComputerCameraMovementModes() or {}, 
        developerComputerMode = l_LocalPlayer_0.DevComputerCameraMode
    });
end;
v21.render = function(v23) --[[ Line: 60 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v14 (copy), l_l_UserGameSettings_0_PropertyChangedSignal_0 (copy), l_UserGameSettings_0 (copy), v7 (copy), l_l_LocalPlayer_0_PropertyChangedSignal_0 (copy), l_LocalPlayer_0 (copy), v20 (copy), v15 (copy), v17 (copy), v13 (copy), v18 (copy), v19 (copy), v16 (copy)
    local v24 = {
        ComputerCameraMovementModeListener = l_Roact_0.createElement(v14, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = function() --[[ Line: 66 ]] --[[ Name: callback ]]
                -- upvalues: v23 (copy), l_UserGameSettings_0 (ref)
                v23:setState({
                    selectedComputerMode = l_UserGameSettings_0.ComputerCameraMovementMode
                });
            end
        }), 
        ComputerCameraMovementModeRegisteredListener = v7 and l_Roact_0.createElement(v14, {
            event = v7.ComputerCameraMovementModeRegistered, 
            callback = function() --[[ Line: 75 ]] --[[ Name: callback ]]
                -- upvalues: v23 (copy), v7 (ref)
                v23:setState({
                    computerOptions = v7:GetRegisteredComputerCameraMovementModes()
                });
            end
        }), 
        LocalPlayerComputerMovementMode = l_Roact_0.createElement(v14, {
            event = l_l_LocalPlayer_0_PropertyChangedSignal_0, 
            callback = function() --[[ Line: 83 ]] --[[ Name: callback ]]
                -- upvalues: v23 (copy), l_LocalPlayer_0 (ref)
                v23:setState({
                    developerComputerMode = l_LocalPlayer_0.DevComputerCameraMode
                });
            end
        })
    };
    if #v23.state.computerOptions == 0 then
        return l_Roact_0.createFragment(v24);
    else
        local v25 = v23.state.developerComputerMode ~= Enum.DevComputerCameraMovementMode.UserChoice;
        local v26 = {};
        local v27 = 0;
        if not v25 then
            for v28, v29 in ipairs(v23.state.computerOptions) do
                v26[v28] = v20[v29];
                assert(v26[v28] ~= nil, "Camera movement mode " .. v29.Name .. " has no localization key");
                if v23.state.selectedComputerMode.Value == v29.Value then
                    v27 = v28;
                end;
            end;
        end;
        v24.CameraModeEntrySelector = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 120), 
            BackgroundTransparency = 1, 
            LayoutOrder = v23.props.LayoutOrder, 
            ZIndex = 2
        }, {
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            InputLabel = l_Roact_0.createElement(v15, {
                localizationKey = "CoreScripts.InGameMenu.GameSettings.CameraMode", 
                Size = UDim2.new(1, 0, 0, 56), 
                Position = UDim2.new(0, 0, 0, 0), 
                AnchorPoint = Vector2.new(0, 0)
            }), 
            Dropdown = v17({
                placeholder = v25 and v20[v23.state.developerComputerMode] or nil
            })(function(_) --[[ Line: 128 ]]
                -- upvalues: l_Roact_0 (ref), v13 (ref), v26 (copy), v27 (ref), v23 (copy), v25 (copy), l_UserGameSettings_0 (ref), v18 (ref), v19 (ref)
                return l_Roact_0.createElement(v13, {
                    Size = UDim2.new(1, 0, 0, 44), 
                    Position = UDim2.new(0, 0, 0, 56), 
                    selections = v26, 
                    selectedIndex = v27, 
                    placeHolderText = v23.state.developerComputerMode.Name, 
                    enabled = not v25, 
                    localize = true, 
                    selectionChanged = function(v31) --[[ Line: 137 ]] --[[ Name: selectionChanged ]]
                        -- upvalues: l_UserGameSettings_0 (ref), v23 (ref), v18 (ref), v19 (ref)
                        l_UserGameSettings_0.ComputerCameraMovementMode = v23.state.computerOptions[v31];
                        v18(v19.AnalyticsSettingsChangeName, nil, {}, true);
                    end, 
                    selectionParentName = "cameraModeDropdown", 
                    canOpen = v23.props.canOpen, 
                    canCaptureFocus = v23.props.canCaptureFocus, 
                    ButtonRef = v23.props.ButtonRef
                });
            end), 
            LockedLabel = v25 and l_Roact_0.createElement(v16, {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, -72, 0.25, 0)
            })
        });
        return l_Roact_0.createFragment(v24);
    end;
end;
return v21;