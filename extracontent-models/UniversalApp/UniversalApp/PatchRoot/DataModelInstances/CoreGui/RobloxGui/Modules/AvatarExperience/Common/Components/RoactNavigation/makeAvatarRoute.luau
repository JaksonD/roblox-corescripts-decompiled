local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v3.Enums.AvatarScreen;
local l_RouteInfo_0 = v3.AvatarRoute.RouteInfo;
local l_AvatarRoute_0 = v3.AvatarRoute.AvatarRoute;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v8 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.route");
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local function v11(v10) --[[ Line: 15 ]] --[[ Name: makeRouteInfo ]]
    -- upvalues: l_RouteInfo_0 (copy)
    return l_RouteInfo_0.new(v10.routeName, v10.key, v10.params);
end;
local function v12(v13, v14, v15) --[[ Line: 22 ]] --[[ Name: findRoute ]]
    -- upvalues: v12 (copy)
    if v13.routeName == v14 then
        return v13, v15;
    else
        local v16 = v13.routes or {};
        local v17 = v13.index or 0;
        for v18, v19 in v16 do
            local v20, v21 = v12(v19, v14, v18 == v17);
            if v20 then
                return v20, v15 and v21;
            end;
        end;
        return nil, false;
    end;
end;
local function v26(v22, v23) --[[ Line: 44 ]] --[[ Name: findNavigationRoute ]]
    -- upvalues: v12 (copy)
    local v24, v25 = v12(v22.state or {}, v23, true);
    if v24 == nil then
        if not _G.__TESTEZ_RUNNING_TEST__ then
            warn(v23 .. " not found in current navigation state");
        end;
        v24 = {};
    end;
    return v24, v25;
end;
return function(v27, v28) --[[ Line: 57 ]] --[[ Name: makeAvatarRoute ]]
    -- upvalues: v26 (copy), l_AvatarScreen_0 (copy), v9 (copy), l_RouteInfo_0 (copy), l_AvatarRoute_0 (copy), v11 (copy), l_AvatarScreenProperties_0 (copy), v8 (copy)
    local v29 = nil;
    local v30 = nil;
    local v31 = {};
    local v32, v33 = v26(v27, l_AvatarScreen_0.AvatarExperienceMainStackNavigator);
    local l_routes_0 = v32.routes;
    if l_routes_0 and v32.index then
        local v35 = v9.getActiveScreenNavigationState(l_routes_0[v32.index]);
        v29 = l_RouteInfo_0.new(v35.routeName, v35.key, v35.params);
        for v36 = v32.index, 1, -1 do
            local v37 = v9.getActiveScreenNavigationState(l_routes_0[v36]);
            if #v31 < l_AvatarRoute_0.maxPreviousCount and v36 < v32.index then
                table.insert(v31, v11(v37));
            end;
            if not l_AvatarScreenProperties_0[v37.routeName].isTransparent then
                v30 = l_RouteInfo_0.new(v37.routeName, v37.key, v37.params);
                break;
            end;
        end;
    end;
    local v38 = l_AvatarRoute_0.new({
        isVisible = v28, 
        isOverlayVisible = not v33, 
        current = v29, 
        previousPages = v31, 
        opaque = v30
    });
    v8:debug("makeAvatarRoute: {}", v38);
    return v38;
end;