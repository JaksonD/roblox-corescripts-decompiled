local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.Navigation);
local v4 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local l_useNavigation_0 = v3.useNavigation;
local l_getActiveRoutes_0 = v3.getActiveRoutes;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v8 = require(l_Modules_0.LuaApp.AppPageProperties);
local v9 = require(l_Modules_0.LuaApp.Enum.HeaderBarDisplayOptions);
local l_GetFFlagLuaAppEnableTopBanner_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableTopBanner;
local function v15(v11) --[[ Line: 35 ]] --[[ Name: createPageNavigationOptionsFromRouteState ]]
    -- upvalues: v8 (copy), l_AppPage_0 (copy), v9 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy)
    local l_routeName_0 = v11.routeName;
    local v13 = v8[l_routeName_0] or {};
    local v14 = if l_routeName_0 == l_AppPage_0.SearchPage and v11.params then v11.params.detail else nil;
    return {
        routeName = l_routeName_0, 
        titleLocalizationKey = v13.nameLocalizationKey, 
        headerBarDisplayOption = if v13.renderUnderlyingPage then v9.DeferBeneath else v13.headerBarDisplayOption, 
        searchUuid = v14, 
        disableAppTopBanner = if l_GetFFlagLuaAppEnableTopBanner_0() then v13.disableAppTopBanner == true else false
    };
end;
local function _(v16) --[[ Line: 60 ]] --[[ Name: getRootPage ]]
    -- upvalues: v4 (copy)
    if v16.routes and v16.index then
        local v17 = v16.routes[1];
        if v17.routes and v17.index and v17.routeName == v4.Constants.TempRnSwitchNavigatorName then
            return v17.routes[v17.index].routeName;
        else
            return v17.routeName;
        end;
    else
        return nil;
    end;
end;
local function v23(v19) --[[ Line: 76 ]] --[[ Name: getPageNavigationOptionsInReverse ]]
    -- upvalues: l_getActiveRoutes_0 (copy), v15 (copy), v9 (copy), l_AppPage_0 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy)
    local v20 = l_getActiveRoutes_0(v19);
    for v21 = #v20, 1, -1 do
        local v22 = v15(v20[v21]);
        if v22.headerBarDisplayOption ~= v9.DeferBeneath then
            return v22;
        end;
    end;
    return {
        routeName = l_AppPage_0.None, 
        titleLocalizationKey = "", 
        headerBarDisplayOption = v9.HideAll, 
        searchUuid = nil, 
        disableAppTopBanner = not l_GetFFlagLuaAppEnableTopBanner_0() and nil
    };
end;
return function() --[[ Line: 95 ]] --[[ Name: usePageNavigationOptions ]]
    -- upvalues: l_useNavigation_0 (copy), v2 (copy), v23 (copy), v4 (copy), v8 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy)
    local v24 = l_useNavigation_0();
    return v2.useMemo(function() --[[ Line: 97 ]]
        -- upvalues: v23 (ref), v24 (copy), v4 (ref), v8 (ref), l_GetFFlagLuaAppEnableTopBanner_0 (ref)
        local v25 = v23(v24.state);
        local l_state_0 = v24.state;
        local v27;
        if l_state_0.routes and l_state_0.index then
            local v28 = l_state_0.routes[1];
            v27 = if v28.routes and v28.index and v28.routeName == v4.Constants.TempRnSwitchNavigatorName then v28.routes[v28.index].routeName else v28.routeName;
        else
            v27 = nil;
        end;
        if v27 then
            l_state_0 = v8[v27];
            v25.rootPageOptions = {
                routeName = v27, 
                titleLocalizationKey = if l_state_0 then l_state_0.nameLocalizationKey else nil, 
                disableAppTopBanner = if l_GetFFlagLuaAppEnableTopBanner_0() and l_state_0 then l_state_0.disableAppTopBanner == true else nil
            };
        end;
        return v25;
    end, {
        v24.state
    });
end;