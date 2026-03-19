local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local v2 = require(l_CorePackages_0.Packages.LuauPolyfill);
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_t_0 = v3.t;
local l_SegmentedControl_0 = v3.UIBlox.App.Control.SegmentedControl;
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Components.ThemedTextLabel);
local l_l_GameSettings_0_PropertyChangedSignal_0 = l_GameSettings_0:GetPropertyChangedSignal("VRComfortSetting");
local v10 = require(l_Parent_0.Utility.ExternalEventConnection);
local v11 = require(l_Parent_0.Localization.withLocalization);
local v12 = require(l_Parent_0.Utility.SendAnalytics);
local v13 = require(l_Parent_0.Resources.Constants);
local v14 = {
    Description = "CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription", 
    ["Enum.VRComfortSetting.Comfort"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingComfort", 
    ["Enum.VRComfortSetting.Normal"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingNormal", 
    ["Enum.VRComfortSetting.Expert"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingExpert", 
    ["Enum.VRComfortSetting.Custom"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingCustom"
};
local l_EnumItems_0 = Enum.VRComfortSetting:GetEnumItems();
local function _(v16) --[[ Line: 40 ]] --[[ Name: getComfortSettingIndex ]]
    -- upvalues: v2 (copy), l_EnumItems_0 (copy)
    return v2.Array.indexOf(l_EnumItems_0, v16);
end;
local function _(v18) --[[ Line: 44 ]] --[[ Name: setComfortSettingByIndex ]]
    -- upvalues: l_EnumItems_0 (copy), l_GameSettings_0 (copy), v12 (copy), v13 (copy)
    local v19 = l_EnumItems_0[v18];
    l_GameSettings_0.VRComfortSetting = v19;
    v12(v13.AnalyticsSettingsChangeName, v13.AnalyticsSettingsVRComfortSettingChangeName, {
        mode = tostring(v19)
    });
end;
local v21 = v4.PureComponent:extend("ComfortSettingsEntry");
v21.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.optional(l_t_0.integer)
});
v21.init = function(v22) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: l_GameSettings_0 (copy), v2 (copy), l_EnumItems_0 (copy)
    local v23 = {};
    local l_VRComfortSetting_0 = l_GameSettings_0.VRComfortSetting;
    v23.selectedMode = v2.Array.indexOf(l_EnumItems_0, l_VRComfortSetting_0);
    v22:setState(v23);
end;
v21.render = function(v25) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v14 (copy), v4 (copy), v10 (copy), l_l_GameSettings_0_PropertyChangedSignal_0 (copy), l_GameSettings_0 (copy), v2 (copy), l_EnumItems_0 (copy), v8 (copy), l_SegmentedControl_0 (copy), v12 (copy), v13 (copy)
    return v11(v14)(function(v26) --[[ Line: 64 ]]
        -- upvalues: v4 (ref), v10 (ref), l_l_GameSettings_0_PropertyChangedSignal_0 (ref), v25 (copy), l_GameSettings_0 (ref), v2 (ref), l_EnumItems_0 (ref), v8 (ref), l_SegmentedControl_0 (ref), v12 (ref), v13 (ref)
        return v4.createFragment({
            VRComfortSettingListener = v4.createElement(v10, {
                event = l_l_GameSettings_0_PropertyChangedSignal_0, 
                callback = function() --[[ Line: 68 ]] --[[ Name: callback ]]
                    -- upvalues: v25 (ref), l_GameSettings_0 (ref), v2 (ref), l_EnumItems_0 (ref)
                    local l_v25_0 = v25;
                    local v28 = {};
                    local l_VRComfortSetting_1 = l_GameSettings_0.VRComfortSetting;
                    v28.selectedMode = v2.Array.indexOf(l_EnumItems_0, l_VRComfortSetting_1);
                    l_v25_0:setState(v28);
                end
            }), 
            ComfortSettingEntrySelector = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = v25.props.LayoutOrder, 
                ZIndex = 2
            }, {
                Padding = v4.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingBottom = UDim.new(0, 15), 
                    PaddingTop = UDim.new(0, 15)
                }), 
                ListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 20)
                }), 
                InputDescription = v4.createElement(v8, {
                    themeKey = "TextDefault", 
                    fontKey = "CaptionHeader", 
                    Text = v26.Description, 
                    Size = UDim2.new(0.9, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextWrapped = true, 
                    LayoutOrder = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                Frame = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    SegmentedControl = v4.createElement(l_SegmentedControl_0, {
                        width = UDim.new(1, 0), 
                        selectedTabIndex = v25.state.selectedMode, 
                        onTabActivated = function(v30) --[[ Line: 113 ]] --[[ Name: onTabActivated ]]
                            -- upvalues: l_EnumItems_0 (ref), l_GameSettings_0 (ref), v12 (ref), v13 (ref)
                            local v31 = l_EnumItems_0[v30];
                            l_GameSettings_0.VRComfortSetting = v31;
                            v12(v13.AnalyticsSettingsChangeName, v13.AnalyticsSettingsVRComfortSettingChangeName, {
                                mode = tostring(v31)
                            });
                        end, 
                        tabs = v2.Array.map(l_EnumItems_0, function(v32, _) --[[ Line: 116 ]]
                            -- upvalues: v26 (copy)
                            return {
                                tabName = v26[tostring(v32)]
                            };
                        end)
                    })
                })
            })
        });
    end);
end;
return v21;