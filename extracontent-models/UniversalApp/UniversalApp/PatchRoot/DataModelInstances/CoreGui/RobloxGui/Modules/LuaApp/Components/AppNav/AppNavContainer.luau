local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_ReactProfiler_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Profiling.ReactProfiler;
local v5 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_useNavBarPlacement_0 = v5.useNavBarPlacement;
local l_useNavBarSize_0 = v5.useNavBarSize;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_CompositionStyleSheet_0 = require(l_CorePackages_0.Workspace.Packages.AppComposition).CompositionStyleSheet;
local v10 = require(l_CorePackages_0.Workspace.Packages.CollectionViews);
local v11 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagLuaAppCompositionSupport_0 = v11.FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppEnableStickyShortcutBar_0 = v11.FFlagLuaAppEnableStickyShortcutBar;
local v14 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport);
local v15 = v11.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and v14();
local l_FFlagFixNavigationInsetsOnHiddenTabBar_0 = v11.FFlagFixNavigationInsetsOnHiddenTabBar;
local l_FFlagGuacStickyShortcutBarEnabled_0 = v11.FFlagGuacStickyShortcutBarEnabled;
local v18 = if not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0 then require(l_CorePackages_0.Workspace.Packages.AppShortcutBar).AppShortcutBarStatusListener else nil;
return function(v19) --[[ Line: 37 ]] --[[ Name: AppNavContainer ]]
    -- upvalues: l_FFlagLuaAppCompositionSupport_0 (copy), v2 (copy), v10 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), l_FFlagGuacStickyShortcutBarEnabled_0 (copy), l_useAppPolicy_0 (copy), l_ReactProfiler_0 (copy), l_CompositionStyleSheet_0 (copy), v3 (copy), v18 (copy), v15 (copy), l_useNavBarPlacement_0 (copy), l_useNavBarSize_0 (copy), v5 (copy), l_FFlagFixNavigationInsetsOnHiddenTabBar_0 (copy)
    local v20 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v20 = v2.useCallback(function(v21) --[[ Line: 40 ]]
            -- upvalues: v10 (ref)
            local v22 = v10.getMainCollectionLayoutStore(false);
            if v22.setDefaultContentRegionWidth then
                v22.setDefaultContentRegionWidth(v21.AbsoluteSize.X);
            end;
        end, {});
    end;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    if l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0 then
        local v26, v27 = v2.useBinding(0);
        v23 = v26;
        v24 = v27;
        v25 = v2.useMemo(function() --[[ Line: 52 ]]
            -- upvalues: v23 (ref)
            return v23:map(function(v28) --[[ Line: 53 ]]
                return UDim2.new(1, 0, 1, -v28);
            end);
        end, {
            v23
        });
    end;
    local v30 = if l_FFlagGuacStickyShortcutBarEnabled_0 then l_useAppPolicy_0(function(v29) --[[ Line: 60 ]]
        return v29.getStickyShortcutBarEnabled();
    end) else nil;
    local v31 = v2.createElement(l_ReactProfiler_0, {
        id = "AppNavContainer"
    }, {
        CompositionStyleSheet = if l_FFlagLuaAppCompositionSupport_0 then v2.createElement(l_CompositionStyleSheet_0) else nil, 
        ResponsiveContainerFrame = v2.createElement(v3.ResponsiveContainerFrame), 
        NavigatorView = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = if not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0 and v30 then v25 else UDim2.new(1, 0, 1, 0), 
            ZIndex = 1, 
            [v2.Change.AbsoluteSize] = if l_FFlagLuaAppCompositionSupport_0 then v20 else nil
        }, v19.children), 
        ShortcutBarStatusListener = if not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0 and v30 then v2.createElement(v18, {
            onHeightChanged = v24
        }) else nil
    });
    if v15 then
        local v32 = l_useNavBarPlacement_0();
        local v33 = l_useNavBarSize_0();
        local v34 = v32 == v5.Placement.Left;
        local v35 = if v34 and (not l_FFlagFixNavigationInsetsOnHiddenTabBar_0 or v19.isTabBarVisible) then UDim2.new(0, v33, 0, 0) else UDim2.new(0, 0, 0, 0);
        local v36 = if v34 and (not l_FFlagFixNavigationInsetsOnHiddenTabBar_0 or v19.isTabBarVisible) then UDim2.new(1, -v33, 1, 0) else UDim2.new(1, 0, 1, 0);
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = v35, 
            Size = v36
        }, {
            Inner = v31
        });
    else
        return v31;
    end;
end;