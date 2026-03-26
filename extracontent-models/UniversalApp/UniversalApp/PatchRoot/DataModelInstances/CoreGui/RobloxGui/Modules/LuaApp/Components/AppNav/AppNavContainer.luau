local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_ReactProfiler_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Profiling.ReactProfiler;
local v5 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_useNavBarPlacement_0 = v5.useNavBarPlacement;
local l_useNavBarSize_0 = v5.useNavBarSize;
local l_CompositionStyleSheet_0 = require(l_CorePackages_0.Workspace.Packages.AppComposition).CompositionStyleSheet;
local v9 = require(l_CorePackages_0.Workspace.Packages.CollectionViews);
local v10 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagLuaAppCompositionSupport_0 = v10.FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppEnableStickyShortcutBar_0 = v10.FFlagLuaAppEnableStickyShortcutBar;
local v13 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport);
local v14 = v10.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and v13();
local l_FFlagFixNavigationInsetsOnHiddenTabBar_0 = v10.FFlagFixNavigationInsetsOnHiddenTabBar;
local v16 = if l_FFlagLuaAppEnableStickyShortcutBar_0 then require(l_CorePackages_0.Workspace.Packages.AppShortcutBar).AppShortcutBarStatusListener else nil;
return function(v17) --[[ Line: 35 ]] --[[ Name: AppNavContainer ]]
    -- upvalues: l_FFlagLuaAppCompositionSupport_0 (copy), v2 (copy), v9 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), l_ReactProfiler_0 (copy), l_CompositionStyleSheet_0 (copy), v3 (copy), v16 (copy), v14 (copy), l_useNavBarPlacement_0 (copy), l_useNavBarSize_0 (copy), v5 (copy), l_FFlagFixNavigationInsetsOnHiddenTabBar_0 (copy)
    local v18 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v18 = v2.useCallback(function(v19) --[[ Line: 38 ]]
            -- upvalues: v9 (ref)
            local v20 = v9.getMainCollectionLayoutStore(false);
            if v20.setDefaultContentRegionWidth then
                v20.setDefaultContentRegionWidth(v19.AbsoluteSize.X);
            end;
        end, {});
    end;
    local v21 = nil;
    local v22 = nil;
    local v23 = nil;
    if l_FFlagLuaAppEnableStickyShortcutBar_0 then
        local v24, v25 = v2.useBinding(0);
        v21 = v24;
        v22 = v25;
        v23 = v2.useMemo(function() --[[ Line: 50 ]]
            -- upvalues: v21 (ref)
            return v21:map(function(v26) --[[ Line: 51 ]]
                return UDim2.new(1, 0, 1, -v26);
            end);
        end, {
            v21
        });
    end;
    local v27 = v2.createElement(l_ReactProfiler_0, {
        id = "AppNavContainer"
    }, {
        CompositionStyleSheet = if l_FFlagLuaAppCompositionSupport_0 then v2.createElement(l_CompositionStyleSheet_0) else nil, 
        ResponsiveContainerFrame = v2.createElement(v3.ResponsiveContainerFrame), 
        NavigatorView = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = if l_FFlagLuaAppEnableStickyShortcutBar_0 then v23 else UDim2.new(1, 0, 1, 0), 
            ZIndex = 1, 
            [v2.Change.AbsoluteSize] = if l_FFlagLuaAppCompositionSupport_0 then v18 else nil
        }, v17.children), 
        ShortcutBarStatusListener = if l_FFlagLuaAppEnableStickyShortcutBar_0 then v2.createElement(v16, {
            onHeightChanged = v22
        }) else nil
    });
    if v14 then
        local v28 = l_useNavBarPlacement_0();
        local v29 = l_useNavBarSize_0();
        local v30 = v28 == v5.Placement.Left;
        local v31 = if v30 and (not l_FFlagFixNavigationInsetsOnHiddenTabBar_0 or v17.isTabBarVisible) then UDim2.new(0, v29, 0, 0) else UDim2.new(0, 0, 0, 0);
        local v32 = if v30 and (not l_FFlagFixNavigationInsetsOnHiddenTabBar_0 or v17.isTabBarVisible) then UDim2.new(1, -v29, 1, 0) else UDim2.new(1, 0, 1, 0);
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = v31, 
            Size = v32
        }, {
            Inner = v27
        });
    else
        return v27;
    end;
end;