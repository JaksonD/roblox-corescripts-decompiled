local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("ComputerMovementMode");
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
    [Enum.ComputerMovementMode.KeyboardMouse] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeKeyboardMouse", 
    [Enum.ComputerMovementMode.ClickToMove] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeClickToMove", 
    [Enum.ComputerMovementMode.Default] = "CoreScripts.InGameMenu.GameSettings.Default"
};
local v21 = {
    [Enum.DevComputerMovementMode.KeyboardMouse] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeKeyboardMouse", 
    [Enum.DevComputerMovementMode.ClickToMove] = "CoreScripts.InGameMenu.GameSettings.ComputerMoveModeClickToMove"
};
local v22 = l_Roact_0.PureComponent:extend("MovementModeEntry");
v22.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    canOpen = l_t_0.optional(l_t_0.boolean), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean)
});
v22.defaultProps = {
    canOpen = true
};
v22.init = function(v23) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: l_UserGameSettings_0 (copy), v7 (copy), l_LocalPlayer_0 (copy)
    v23:setState({
        selectedComputerMode = l_UserGameSettings_0.ComputerMovementMode, 
        computerOptions = v7 and v7:GetRegisteredComputerMovementModes() or {}, 
        developerComputerMode = l_LocalPlayer_0.DevComputerMovementMode
    });
end;
v22.render = function(v24) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v14 (copy), l_l_UserGameSettings_0_PropertyChangedSignal_0 (copy), l_UserGameSettings_0 (copy), v7 (copy), l_l_LocalPlayer_0_PropertyChangedSignal_0 (copy), l_LocalPlayer_0 (copy), v20 (copy), v15 (copy), v17 (copy), v21 (copy), v13 (copy), v18 (copy), v19 (copy), v16 (copy)
    local v25 = {
        ComputerMovementModeListener = l_Roact_0.createElement(v14, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = function() --[[ Line: 69 ]] --[[ Name: callback ]]
                -- upvalues: v24 (copy), l_UserGameSettings_0 (ref)
                v24:setState({
                    selectedComputerMode = l_UserGameSettings_0.ComputerMovementMode
                });
            end
        }), 
        ComputerMovementModeRegisteredListener = v7 and l_Roact_0.createElement(v14, {
            event = v7.ComputerMovementModeRegistered, 
            callback = function() --[[ Line: 77 ]] --[[ Name: callback ]]
                -- upvalues: v24 (copy), v7 (ref)
                v24:setState({
                    computerOptions = v7:GetRegisteredComputerMovementModes()
                });
            end
        }), 
        DevComputerMovementMode = l_Roact_0.createElement(v14, {
            event = l_l_LocalPlayer_0_PropertyChangedSignal_0, 
            callback = function() --[[ Line: 85 ]] --[[ Name: callback ]]
                -- upvalues: v24 (copy), l_LocalPlayer_0 (ref)
                v24:setState({
                    developerComputerMode = l_LocalPlayer_0.DevComputerMovementMode
                });
            end
        })
    };
    if #v24.state.computerOptions == 0 then
        return l_Roact_0.createFragment(v25);
    else
        local v26 = v24.state.developerComputerMode ~= Enum.DevComputerMovementMode.UserChoice;
        local v27 = {};
        local v28 = 0;
        if not v26 then
            for v29, v30 in ipairs(v24.state.computerOptions) do
                v27[v29] = v20[v30];
                assert(v27[v29] ~= nil, "Movement mode " .. v30.Name .. " has no localization key");
                if v24.state.selectedComputerMode.Value == v30.Value then
                    v28 = v29;
                end;
            end;
        end;
        v25.MovementModeEntrySelector = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 120), 
            BackgroundTransparency = 1, 
            LayoutOrder = v24.props.LayoutOrder, 
            ZIndex = 2
        }, {
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            InputLabel = l_Roact_0.createElement(v15, {
                localizationKey = "CoreScripts.InGameMenu.GameSettings.MovementMode", 
                Size = UDim2.new(1, 0, 0, 56), 
                Position = UDim2.new(0, 0, 0, 0), 
                AnchorPoint = Vector2.new(0, 0)
            }), 
            Dropdown = v17({
                placeholder = v26 and v21[v24.state.developerComputerMode] or nil
            })(function(v31) --[[ Line: 130 ]]
                -- upvalues: l_Roact_0 (ref), v13 (ref), v27 (copy), v28 (ref), v26 (copy), v24 (copy), l_UserGameSettings_0 (ref), v18 (ref), v19 (ref)
                return l_Roact_0.createElement(v13, {
                    Size = UDim2.new(1, 0, 0, 44), 
                    Position = UDim2.new(0, 0, 0, 56), 
                    selections = v27, 
                    selectedIndex = v28, 
                    placeHolderText = v31.placeholder, 
                    enabled = not v26, 
                    localize = true, 
                    selectionParentName = "MovementModeEntryDropdown", 
                    canOpen = v24.props.canOpen, 
                    canCaptureFocus = v24.props.canCaptureFocus, 
                    selectionChanged = function(v32) --[[ Line: 142 ]] --[[ Name: selectionChanged ]]
                        -- upvalues: l_UserGameSettings_0 (ref), v24 (ref), v18 (ref), v19 (ref)
                        l_UserGameSettings_0.ComputerMovementMode = v24.state.computerOptions[v32];
                        v18(v19.AnalyticsSettingsChangeName, nil, {}, true);
                    end
                });
            end), 
            LockedLabel = v26 and l_Roact_0.createElement(v16, {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, -72, 0.25, 0)
            })
        });
        return l_Roact_0.createFragment(v25);
    end;
end;
return v22;