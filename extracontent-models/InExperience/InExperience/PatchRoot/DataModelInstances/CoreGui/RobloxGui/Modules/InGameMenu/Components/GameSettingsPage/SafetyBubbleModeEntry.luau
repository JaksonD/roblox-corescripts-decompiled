local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local v2 = require(l_CorePackages_0.Packages.LuauPolyfill);
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_t_0 = v3.t;
local l_UIBlox_0 = v3.UIBlox;
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Components.ThemedTextLabel);
local l_l_GameSettings_0_PropertyChangedSignal_0 = l_GameSettings_0:GetPropertyChangedSignal("VRSafetyBubbleMode");
local v10 = require(l_Parent_0.Utility.ExternalEventConnection);
local v11 = require(script.Parent.InputLabel);
local l_RadioButtonList_0 = l_UIBlox_0.App.InputButton.RadioButtonList;
local v13 = require(l_Parent_0.Localization.withLocalization);
local v14 = require(l_Parent_0.Utility.SendAnalytics);
local v15 = require(l_Parent_0.Resources.Constants);
local v16 = require(l_Parent_0.Flags.FFlagFixSafetyBubbleWidth)();
local v17 = {
    Title = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle", 
    Description = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription", 
    ["Enum.VRSafetyBubbleMode.NoOne"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeNoOne", 
    ["Enum.VRSafetyBubbleMode.OnlyFriends"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeOnlyFriends", 
    ["Enum.VRSafetyBubbleMode.Anyone"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeAnyone"
};
local l_EnumItems_0 = Enum.VRSafetyBubbleMode:GetEnumItems();
local function _(v19) --[[ Line: 36 ]] --[[ Name: getSafetyBubbleModeIndex ]]
    -- upvalues: v2 (copy), l_EnumItems_0 (copy)
    return v2.Array.indexOf(l_EnumItems_0, v19);
end;
local function _(v21) --[[ Line: 40 ]] --[[ Name: setSafetyBubbleModeByIndex ]]
    -- upvalues: l_EnumItems_0 (copy), l_GameSettings_0 (copy), v14 (copy), v15 (copy)
    local v22 = l_EnumItems_0[v21];
    l_GameSettings_0.VRSafetyBubbleMode = v22;
    v14(v15.AnalyticsSettingsChangeName, v15.AnalyticsSettingsSafetyBubbleModeChangeName, {
        mode = tostring(v22)
    });
end;
local v24 = v4.PureComponent:extend("SafetyBubbleModeEntry");
v24.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.optional(l_t_0.integer)
});
v24.init = function(v25) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: l_GameSettings_0 (copy), v2 (copy), l_EnumItems_0 (copy)
    local v26 = {};
    local l_VRSafetyBubbleMode_0 = l_GameSettings_0.VRSafetyBubbleMode;
    v26.selectedMode = v2.Array.indexOf(l_EnumItems_0, l_VRSafetyBubbleMode_0);
    v25:setState(v26);
end;
v24.render = function(v28) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), v17 (copy), v4 (copy), v10 (copy), l_l_GameSettings_0_PropertyChangedSignal_0 (copy), l_GameSettings_0 (copy), v2 (copy), l_EnumItems_0 (copy), v11 (copy), v8 (copy), l_RadioButtonList_0 (copy), v14 (copy), v15 (copy), v16 (copy)
    return v13(v17)(function(v29) --[[ Line: 60 ]]
        -- upvalues: v4 (ref), v10 (ref), l_l_GameSettings_0_PropertyChangedSignal_0 (ref), v28 (copy), l_GameSettings_0 (ref), v2 (ref), l_EnumItems_0 (ref), v11 (ref), v17 (ref), v8 (ref), l_RadioButtonList_0 (ref), v14 (ref), v15 (ref), v16 (ref)
        return v4.createFragment({
            VRSafetyBubbleModeListener = v4.createElement(v10, {
                event = l_l_GameSettings_0_PropertyChangedSignal_0, 
                callback = function() --[[ Line: 64 ]] --[[ Name: callback ]]
                    -- upvalues: v28 (ref), l_GameSettings_0 (ref), v2 (ref), l_EnumItems_0 (ref)
                    local l_v28_0 = v28;
                    local v31 = {};
                    local l_VRSafetyBubbleMode_1 = l_GameSettings_0.VRSafetyBubbleMode;
                    v31.selectedMode = v2.Array.indexOf(l_EnumItems_0, l_VRSafetyBubbleMode_1);
                    l_v28_0:setState(v31);
                end
            }), 
            SafetyBubbleModeEntrySelector = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = v28.props.LayoutOrder, 
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
                InputLabel = v4.createElement(v11, {
                    localizationKey = v17.Title, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0, 0), 
                    LayoutOrder = 1
                }), 
                InputDescription = v4.createElement(v8, {
                    themeKey = "TextDefault", 
                    fontKey = "CaptionHeader", 
                    Text = v29.Description, 
                    Size = UDim2.new(0.9, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextWrapped = true, 
                    LayoutOrder = 2, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                RadioList = v4.createElement(l_RadioButtonList_0, {
                    layoutOrder = 3, 
                    radioButtons = v2.Array.map(l_EnumItems_0, function(v33, _) --[[ Line: 108 ]]
                        -- upvalues: v29 (copy)
                        return {
                            label = v29[tostring(v33)]
                        };
                    end), 
                    onActivated = function(v35) --[[ Line: 113 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_EnumItems_0 (ref), l_GameSettings_0 (ref), v14 (ref), v15 (ref)
                        local v36 = l_EnumItems_0[v35];
                        l_GameSettings_0.VRSafetyBubbleMode = v36;
                        v14(v15.AnalyticsSettingsChangeName, v15.AnalyticsSettingsSafetyBubbleModeChangeName, {
                            mode = tostring(v36)
                        });
                    end, 
                    currentValue = v28.state.selectedMode, 
                    automaticSize = true, 
                    padding = UDim.new(0, 20), 
                    elementSize = if v16 then UDim2.new(1, 0, 0, 20) else UDim2.new(0, 0, 0, 20)
                })
            })
        });
    end);
end;
return v24;