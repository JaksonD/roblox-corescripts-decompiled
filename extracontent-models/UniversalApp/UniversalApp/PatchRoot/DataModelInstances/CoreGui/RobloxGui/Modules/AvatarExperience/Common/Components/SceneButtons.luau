local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_SpringAnimatedItem_0 = require(l_CorePackages_0.Packages.UIBlox).Utility.SpringAnimatedItem;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.selectTopBarHeight);
local l_useProperty_0 = require(l_CorePackages_0.Workspace.Packages.GuiObjectUtils).useProperty;
local v8 = require(l_Modules_0.AvatarExperience.Common.Context.NamedRefsContext);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.FullViewEntryButton);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_useRouteName_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useRouteName;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v14 = Vector2.new(8, 8);
local v15 = Vector2.new(36, 36);
local v16 = {
    dampingRatio = 0.6, 
    frequency = 4.25
};
local v17 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local function v19(v18) --[[ Line: 45 ]] --[[ Name: mapValuesToProps ]]
    return {
        Size = UDim2.new(1, 0, 0, v18.height)
    };
end;
local function v21(v20) --[[ Line: 51 ]] --[[ Name: selectDeviceOrientation ]]
    return v20.DeviceOrientation;
end;
local function _() --[[ Line: 63 ]] --[[ Name: useTopPanelRef ]]
    -- upvalues: l_useRouteName_0 (copy), v3 (copy), v8 (copy)
    local v22 = l_useRouteName_0();
    return v3.useContext(v8)[v22 .. "TopPanel"];
end;
local function v30(v24, v25) --[[ Line: 69 ]] --[[ Name: useButtonHeight ]]
    -- upvalues: l_useRouteName_0 (copy), v3 (copy), v8 (copy), l_useProperty_0 (copy), l_useSelector_0 (copy), v21 (copy), l_getUseSelectorDeepEquals_0 (copy), l_DeviceOrientationMode_0 (copy), v15 (copy), v14 (copy)
    local v26 = l_useRouteName_0();
    local v27 = v3.useContext(v8)[v26 .. "TopPanel"];
    v26 = l_useProperty_0(v27, "Size") or UDim2.fromScale(0, 0);
    local v28 = l_useSelector_0(v21, l_getUseSelectorDeepEquals_0()) == l_DeviceOrientationMode_0.Portrait;
    local l_v25_0 = v25;
    if v24 and v28 then
        l_v25_0 = l_v25_0 + (v15.Y + v14.Y + 14 + v26.Y.Offset);
    end;
    return l_v25_0;
end;
return function(v31) --[[ Line: 86 ]] --[[ Name: SceneButtons ]]
    -- upvalues: l_useSelector_0 (copy), v6 (copy), l_getUseSelectorDeepEquals_0 (copy), v21 (copy), l_DeviceOrientationMode_0 (copy), v30 (copy), v17 (copy), v16 (copy), v3 (copy), l_SpringAnimatedItem_0 (copy), v19 (copy), v10 (copy)
    local v32 = v31.isUIFullView or false;
    local v33 = v31.sceneHeight or 0;
    local l_isSceneFullView_0 = v31.isSceneFullView;
    local l_changeViewFunction_0 = v31.changeViewFunction;
    local l_ZIndex_0 = v31.ZIndex;
    local v37 = l_useSelector_0(v6, l_getUseSelectorDeepEquals_0());
    local v38 = l_useSelector_0(v21, l_getUseSelectorDeepEquals_0()) == l_DeviceOrientationMode_0.Portrait;
    local v39 = v30(v32, v33);
    local v40 = nil;
    local v41 = 0;
    if not v32 then
        v40 = v17;
        v41 = 11;
    else
        v40 = v16;
    end;
    local v42 = v38 and v37 or 0;
    local l_createElement_0 = v3.createElement;
    local l_AnimatedFrame_0 = l_SpringAnimatedItem_0.AnimatedFrame;
    local v45 = {};
    local v46 = {
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(1, 0, 0, v42), 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = l_ZIndex_0
    };
    local v47 = false;
    if l_changeViewFunction_0 ~= nil then
        v47 = v38 or l_isSceneFullView_0;
    end;
    v46.Visible = v47;
    v45.regularProps = v46;
    v45.animatedValues = {
        height = v39
    };
    v45.mapValuesToProps = v19;
    v45.springOptions = v40;
    return l_createElement_0(l_AnimatedFrame_0, v45, {
        Container = v3.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.new(1, 0, 1, 0), 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 14)
            }), 
            UIPadding = v3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v41), 
                PaddingRight = UDim.new(0, v41)
            }), 
            FullViewEntryButton = v3.createElement(v10, {
                isUIFullView = v31.isUIFullView, 
                isSceneFullView = v31.isSceneFullView, 
                changeViewFunction = v31.changeViewFunction, 
                LayoutOrder = 2
            })
        })
    });
end;