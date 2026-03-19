local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Rendering_0 = settings().Rendering;
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("SavedQualityLevel");
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(script.Parent.ToggleEntry);
local v9 = require(l_Parent_0.Utility.ExternalEventConnection);
local v10 = require(script.Parent.SliderEntry);
local v11 = require(l_Parent_0.Utility.SendAnalytics);
local v12 = require(l_Parent_0.Resources.Constants);
local v13 = #Enum.SavedQualitySetting:GetEnumItems() - 1;
local function _(v14, v15, v16, v17, v18) --[[ Line: 30 ]] --[[ Name: mapInteger ]]
    return (math.clamp(math.floor(v17 + (v14 - v15) * (v18 - v17) / (v16 - v15)), v17, v18));
end;
local v20 = l_Roact_0.PureComponent:extend("GraphicsQualityEntry");
v20.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    isMenuOpen = l_t_0.optional(l_t_0.boolean)
});
v20.init = function(v21) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    local v22 = l_UserGameSettings_0.SavedQualityLevel == Enum.SavedQualitySetting.Automatic;
    v21:setState({
        quality = v22 and 5 or l_UserGameSettings_0.SavedQualityLevel.Value, 
        automatic = v22
    });
    v21.onQualityChanged = function() --[[ Line: 48 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v21 (copy)
        local l_SavedQualityLevel_0 = l_UserGameSettings_0.SavedQualityLevel;
        local v24 = l_SavedQualityLevel_0 == Enum.SavedQualitySetting.Automatic;
        v21:setState({
            quality = not v24 and l_SavedQualityLevel_0.Value or nil, 
            automatic = l_SavedQualityLevel_0 == Enum.SavedQualitySetting.Automatic
        });
    end;
    if v22 then
        v21:setAutomaticQualityLevel();
        return;
    else
        v21:setManualQualityLevel(v21.state.quality);
        return;
    end;
end;
v20.setAutomaticQualityLevel = function(_) --[[ Line: 65 ]] --[[ Name: setAutomaticQualityLevel ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_Rendering_0 (copy)
    l_UserGameSettings_0.SavedQualityLevel = Enum.SavedQualitySetting.Automatic;
    l_Rendering_0.QualityLevel = 0;
end;
v20.setManualQualityLevel = function(_, v27) --[[ Line: 70 ]] --[[ Name: setManualQualityLevel ]]
    -- upvalues: v13 (copy), l_Rendering_0 (copy), l_UserGameSettings_0 (copy)
    local l_v13_0 = v13;
    local v29 = l_Rendering_0:GetMaxQualityLevel() - 1;
    local v30 = math.clamp(math.floor(1 + (v27 - 1) * (v29 - 1) / (l_v13_0 - 1)), 1, v29);
    l_UserGameSettings_0.SavedQualityLevel = v27;
    l_Rendering_0.QualityLevel = v30;
    return nil;
end;
v20.render = function(v31) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v8 (copy), v11 (copy), v12 (copy), v10 (copy), v9 (copy), l_l_UserGameSettings_0_PropertyChangedSignal_0 (copy)
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 156), 
        LayoutOrder = v31.props.LayoutOrder
    }, {
        Layout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        AutoToggle = l_Roact_0.createElement(v8, {
            LayoutOrder = 1, 
            labelKey = "CoreScripts.InGameMenu.GameSettings.AutoGraphicsQuality", 
            checked = v31.state.automatic, 
            onToggled = function() --[[ Line: 98 ]] --[[ Name: onToggled ]]
                -- upvalues: v31 (copy), v11 (ref), v12 (ref)
                if v31.state.automatic then
                    v31:setManualQualityLevel(v31.state.quality);
                else
                    v31:setAutomaticQualityLevel();
                end;
                v11(v12.AnalyticsSettingsChangeName, nil, {}, true);
            end
        }), 
        Slider = l_Roact_0.createElement(v10, {
            LayoutOrder = 2, 
            labelKey = "CoreScripts.InGameMenu.GameSettings.ManualGraphicsQuality", 
            min = 1, 
            max = 10, 
            stepInterval = 1, 
            value = v31.state.quality, 
            disabled = v31.state.automatic, 
            valueChanged = function(v32) --[[ Line: 115 ]] --[[ Name: valueChanged ]]
                -- upvalues: v31 (copy), v11 (ref), v12 (ref)
                v31:setManualQualityLevel(v32);
                v11(v12.AnalyticsSettingsChangeName, nil, {}, true);
            end, 
            canCaptureFocus = v31.props.canCaptureFocus, 
            isMenuOpen = v31.props.isMenuOpen
        }), 
        QualityListener = l_Roact_0.createElement(v9, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = v31.onQualityChanged
        })
    });
end;
return v20;