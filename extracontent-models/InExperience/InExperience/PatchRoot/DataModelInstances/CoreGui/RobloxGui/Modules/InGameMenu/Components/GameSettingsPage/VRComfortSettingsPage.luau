local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_t_0 = v1.t;
local l_withStyle_0 = v1.UIBlox.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(script.Parent.Parent.Page);
local v8 = require(l_Parent_0.Thunks.CloseMenu);
local v9 = nil;
local v10 = nil;
if game:GetEngineFeature("VRMoreComfortSettings") then
    v9 = require(script.Parent.VRComfortAutoToggleEntry);
    v10 = require(script.Parent.ComfortSettingsEntry);
end;
local v11 = l_Roact_0.PureComponent:extend("VRComfortSettingsPage");
v11.validateProps = l_t_0.strictInterface({
    closeMenu = l_t_0.callback, 
    pageTitle = l_t_0.string
});
local function _() --[[ Line: 26 ]] --[[ Name: createLayoutOrderGenerator ]]
    local v12 = 0;
    return function() --[[ Line: 28 ]]
        -- upvalues: v12 (ref)
        v12 = v12 + 1;
        return v12;
    end;
end;
v11.render = function(v14) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), v7 (copy), v10 (ref), v9 (ref)
    return l_withStyle_0(function(_) --[[ Line: 35 ]]
        -- upvalues: l_Roact_0 (ref), v7 (ref), v14 (copy), v10 (ref), v9 (ref)
        local v16 = 0;
        local v17;
        do
            local l_v16_0 = v16;
            v17 = function() --[[ Line: 28 ]]
                -- upvalues: l_v16_0 (ref)
                l_v16_0 = l_v16_0 + 1;
                return l_v16_0;
            end;
        end;
        return l_Roact_0.createElement(v7, {
            pageTitle = v14.props.pageTitle, 
            zIndex = 2, 
            position = v14.props.position
        }, {
            Layout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            VRComfortSettings = if game:GetEngineFeature("VRMoreComfortSettings") then l_Roact_0.createElement(v10, {
                LayoutOrder = v17()
            }) else nil, 
            VignetteEnabled = if game:GetEngineFeature("VRMoreComfortSettings") then l_Roact_0.createElement(v9, {
                LayoutOrder = v17(), 
                labelKey = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled", 
                customValueKey = "VignetteEnabledCustomOption", 
                derivedValueKey = "VignetteEnabled"
            }) else nil, 
            VRSteppedRotationEnabled = if game:GetEngineFeature("VRMoreComfortSettings") then l_Roact_0.createElement(v9, {
                LayoutOrder = v17(), 
                labelKey = "CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled", 
                customValueKey = "VRSmoothRotationEnabledCustomOption", 
                derivedValueKey = "VRSmoothRotationEnabled", 
                checkedValue = false
            }) else nil, 
            VRThirdPersonFixedCamEnabled = if game:GetEngineFeature("VRMoreComfortSettings") then l_Roact_0.createElement(v9, {
                LayoutOrder = v17(), 
                labelKey = "CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled", 
                customValueKey = "VRThirdPersonFollowCamEnabledCustomOption", 
                derivedValueKey = "VRThirdPersonFollowCamEnabled", 
                checkedValue = false
            }) else nil
        });
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v19) --[[ Line: 83 ]]
    -- upvalues: v8 (copy)
    return {
        closeMenu = function() --[[ Line: 85 ]] --[[ Name: closeMenu ]]
            -- upvalues: v19 (copy), v8 (ref)
            v19(v8);
        end
    };
end)(v11);