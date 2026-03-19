local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_getActiveRoutes_0 = require(l_Parent_0.Navigation).getActiveRoutes;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local _ = require(l_script_FirstAncestor_0.types);
local v6 = require(l_script_FirstAncestor_0.Constants);
local function v9(v7) --[[ Line: 18 ]] --[[ Name: legacyRouteFilter ]]
    -- upvalues: v6 (copy)
    local v8 = false;
    if v7.routeName ~= v6.TempRnSwitchNavigatorName then
        v8 = v7.key ~= "StackRouterRoot";
    end;
    return v8;
end;
local function v11(v10) --[[ Line: 22 ]] --[[ Name: getLegacyPageFromRoactNavigationRoute ]]
    -- upvalues: v2 (copy)
    return v2.Dictionary.join(v10.params or {}, {
        name = v10.routeName, 
        rnKey = v10.key
    });
end;
local function v13(v12) --[[ Line: 29 ]] --[[ Name: getLegacyRouteFromRoactNavigationState ]]
    -- upvalues: v2 (copy), l_getActiveRoutes_0 (copy), v9 (copy), v11 (copy)
    return v2.List.map(v2.List.filter(l_getActiveRoutes_0(v12), v9), v11);
end;
local function v14(v15) --[[ Line: 36 ]] --[[ Name: getTabNavigatorState ]]
    -- upvalues: v6 (copy), v14 (copy)
    if v15.routeName == v6.TempRnSwitchNavigatorName then
        return v15;
    else
        local v16 = v15.routes[v15.index];
        if v16.routes then
            return v14(v16);
        else
            return nil;
        end;
    end;
end;
return {
    getLegacyPageFromRoactNavigationRoute = v11, 
    getLegacyRouteFromRoactNavigationState = v13, 
    getCurrentTabName = function(v17) --[[ Line: 49 ]] --[[ Name: getCurrentTabName ]]
        -- upvalues: v6 (copy), v14 (copy), l_AppPage_0 (copy)
        local v18;
        if v17.routeName == v6.TempRnSwitchNavigatorName then
            v18 = v17;
        else
            local v19 = v17.routes[v17.index];
            v18 = if v19.routes then v14(v19) else nil;
        end;
        if v18 ~= nil then
            return v18.routes[v18.index].routeName;
        else
            return l_AppPage_0.None;
        end;
    end
};