local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("MasterVolume");
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Utility.ExternalEventConnection);
local v9 = require(script.Parent.SliderEntry);
local v10 = require(l_Parent_0.Utility.SendAnalytics);
local v11 = require(l_Parent_0.Resources.Constants);
if l_CoreGui_0.RobloxGui:FindFirstChild("Sounds") == nil then
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "Sounds";
    l_Folder_0.Parent = l_CoreGui_0.RobloxGui;
end;
local v13 = Instance.new("Sound", l_CoreGui_0.RobloxGui.Sounds);
v13.Name = "VolumeChangeSound";
v13.Volume = 1;
v13.SoundId = "rbxasset://sounds/uuhhh.mp3";
local v14 = l_Roact_0.PureComponent:extend("VolumeEntry");
v14.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    isMenuOpen = l_t_0.optional(l_t_0.boolean), 
    buttonRef = l_t_0.optional(l_t_0.table)
});
v14.init = function(v15) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    v15.onVolumeChanged = function() --[[ Line: 40 ]]
        -- upvalues: v15 (copy), l_UserGameSettings_0 (ref)
        v15:setState({
            volume = math.floor(l_UserGameSettings_0.MasterVolume * 10 + 0.5)
        });
    end;
    v15.onVolumeChanged();
end;
v14.render = function(v16) --[[ Line: 49 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v9 (copy), l_UserGameSettings_0 (copy), v13 (copy), v10 (copy), v11 (copy), v8 (copy), l_l_UserGameSettings_0_PropertyChangedSignal_0 (copy)
    return l_Roact_0.createFragment({
        VolumeSlider = l_Roact_0.createElement(v9, {
            labelKey = "CoreScripts.InGameMenu.GameSettings.Volume", 
            LayoutOrder = v16.props.LayoutOrder, 
            min = 0, 
            max = 10, 
            stepInterval = 1, 
            value = v16.state.volume, 
            valueChanged = function(v17) --[[ Line: 58 ]] --[[ Name: valueChanged ]]
                -- upvalues: l_UserGameSettings_0 (ref), v13 (ref), v10 (ref), v11 (ref)
                l_UserGameSettings_0.MasterVolume = v17 / 10;
                v13:Play();
                v10(v11.AnalyticsSettingsChangeName, nil, {}, true);
            end, 
            canCaptureFocus = v16.props.canCaptureFocus, 
            isMenuOpen = v16.props.isMenuOpen, 
            buttonRef = v16.props.buttonRef
        }), 
        VolumeListener = l_Roact_0.createElement(v8, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = v16.onVolumeChanged
        })
    });
end;
return v14;