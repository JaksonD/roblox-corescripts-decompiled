local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_ReactProfiler_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Profiling.ReactProfiler;
local v5 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_useNavBarPlacement_0 = v5.useNavBarPlacement;
local l_useNavBarSize_0 = v5.useNavBarSize;
local v8 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagLuaAppEnableStickyShortcutBar_0 = v8.FFlagLuaAppEnableStickyShortcutBar;
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport);
local v11 = v8.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and v10();
local v12 = if l_FFlagLuaAppEnableStickyShortcutBar_0 then require(l_CorePackages_0.Workspace.Packages.AppShortcutBar).AppShortcutBarStatusListener else nil;
return function(v13) --[[ Line: 28 ]] --[[ Name: AppNavContainer ]]
    -- upvalues: l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), v2 (copy), l_ReactProfiler_0 (copy), v3 (copy), v12 (copy), v11 (copy), l_useNavBarPlacement_0 (copy), l_useNavBarSize_0 (copy), v5 (copy)
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    if l_FFlagLuaAppEnableStickyShortcutBar_0 then
        local v17, v18 = v2.useBinding(0);
        v14 = v17;
        v15 = v18;
        v16 = v2.useMemo(function() --[[ Line: 32 ]]
            -- upvalues: v14 (ref)
            return v14:map(function(v19) --[[ Line: 33 ]]
                return UDim2.new(1, 0, 1, -v19);
            end);
        end, {
            v14
        });
    end;
    local v20 = v2.createElement(l_ReactProfiler_0, {
        id = "AppNavContainer"
    }, {
        ResponsiveContainerFrame = v2.createElement(v3.ResponsiveContainerFrame), 
        NavigatorView = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = if l_FFlagLuaAppEnableStickyShortcutBar_0 then v16 else UDim2.new(1, 0, 1, 0), 
            ZIndex = 1
        }, v13.children), 
        ShortcutBarStatusListener = if l_FFlagLuaAppEnableStickyShortcutBar_0 then v2.createElement(v12, {
            onHeightChanged = v15
        }) else nil
    });
    if v11 then
        local v21 = l_useNavBarPlacement_0();
        local v22 = l_useNavBarSize_0();
        local v23 = v21 == v5.Placement.Left;
        local v24 = if v23 then UDim2.new(0, v22, 0, 0) else UDim2.new(0, 0, 0, 0);
        local v25 = if v23 then UDim2.new(1, -v22, 1, 0) else UDim2.new(1, 0, 1, 0);
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = v24, 
            Size = v25
        }, {
            Inner = v20
        });
    else
        return v20;
    end;
end;