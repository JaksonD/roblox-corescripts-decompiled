local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v6.Enums.AvatarScreen;
local l_RouteInfo_0 = v6.AvatarRoute.RouteInfo;
local l_AvatarRoute_0 = v6.AvatarRoute.AvatarRoute;
local l_AvatarRouteContext_0 = v6.AvatarRoute.Context.AvatarRouteContext;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v12 = require(l_Modules_0.LuaApp.AppPage);
local v13 = require(l_Modules_0.LuaApp.AppPageProperties);
local v14 = require(l_Modules_0.AvatarExperience.Common.isComponent);
local v15 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v16 = require(l_Modules_0.AvatarExperience.Common.withContextValue);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.LuaApp.Reducers.Navigation);
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_SwitchTab_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SwitchTab;
local function _(v21) --[[ Line: 53 ]] --[[ Name: isAvatarRoute ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_SwitchTab_0 (copy)
    local v22 = true;
    if v21 ~= l_AvatarScreen_0.AvatarExperienceRoot then
        v22 = v21 == l_SwitchTab_0.AvatarExperienceTab;
    end;
    return v22;
end;
return function(v24) --[[ Line: 57 ]]
    -- upvalues: v15 (copy), v14 (copy), v13 (copy), l_AvatarScreen_0 (copy), v12 (copy), v5 (copy), l_RouteInfo_0 (copy), v3 (copy), l_SwitchTab_0 (copy), l_AvatarRoute_0 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v4 (copy), v16 (copy), l_AvatarRouteContext_0 (copy)
    v15.assert(v14(v24), "withAppRoute must be called with a Roact component");
    local function v29(v25) --[[ Line: 61 ]] --[[ Name: opaquePageFromRoute ]]
        -- upvalues: v13 (ref), l_AvatarScreen_0 (ref)
        for v26 = #v25, 1, -1 do
            local v27 = v25[v26];
            local v28 = v13[v27.name];
            if v28 == nil or not v28.renderUnderlyingPage then
                return v27;
            end;
        end;
        return {
            name = l_AvatarScreen_0.None
        };
    end;
    local function _(v30) --[[ Line: 80 ]] --[[ Name: isAvatarExperienceWrapper ]]
        -- upvalues: v12 (ref)
        local v31 = true;
        if v30.name ~= v12.AvatarExperienceWrapper then
            v31 = v30.name == v12.AvatarExperienceWrapperTransparent;
        end;
        return v31;
    end;
    local function v38(v33) --[[ Line: 88 ]] --[[ Name: routeInfoFromPage ]]
        -- upvalues: v12 (ref), v5 (ref), l_RouteInfo_0 (ref)
        local l_name_0 = v33.name;
        local l_l_name_0_0 = l_name_0;
        if v33.detail then
            l_l_name_0_0 = l_l_name_0_0 .. ":" .. v33.detail;
        end;
        local v36 = v33.extraProps or {};
        local v37 = true;
        if v33.name ~= v12.AvatarExperienceWrapper then
            v37 = v33.name == v12.AvatarExperienceWrapperTransparent;
        end;
        if v37 then
            l_name_0 = v36.routeName;
            v36 = v36.params;
        end;
        v36 = v5.Dictionary.join(v36, {
            detail = v33.detail
        });
        return l_RouteInfo_0.new(l_name_0, l_l_name_0_0, v36);
    end;
    local v39 = v3.PureComponent:extend("AppRouteWrapper");
    v39.getAvatarRoute = function(v40) --[[ Line: 108 ]] --[[ Name: getAvatarRoute ]]
        -- upvalues: l_AvatarScreen_0 (ref), l_SwitchTab_0 (ref), v29 (copy), l_AvatarRoute_0 (ref), v38 (copy), v12 (ref)
        local l_currentNavigationRoute_0 = v40.props.currentNavigationRoute;
        local v42 = l_currentNavigationRoute_0[#l_currentNavigationRoute_0];
        local l_name_1 = v42.name;
        local v44 = true;
        if l_name_1 ~= l_AvatarScreen_0.AvatarExperienceRoot then
            v44 = l_name_1 == l_SwitchTab_0.AvatarExperienceTab;
        end;
        if v44 then
            return v40.props.avatarRoute;
        else
            v44 = v29(l_currentNavigationRoute_0);
            local l_name_2 = v44.name;
            l_name_1 = true;
            if l_name_2 ~= l_AvatarScreen_0.AvatarExperienceRoot then
                l_name_1 = l_name_2 == l_SwitchTab_0.AvatarExperienceTab;
            end;
            if l_name_1 then
                l_name_1 = v40.props.avatarRoute;
                return l_AvatarRoute_0.new({
                    current = v38(v42), 
                    opaque = l_name_1.opaque, 
                    isVisible = true, 
                    isOverlayVisible = v40.props.centralOverlayShowing
                });
            else
                l_name_1 = l_AvatarRoute_0.new;
                l_name_2 = {
                    current = v38(v42), 
                    opaque = v38(v44)
                };
                local v46 = true;
                if v42.name ~= v12.AvatarExperienceWrapper then
                    v46 = v42.name == v12.AvatarExperienceWrapperTransparent;
                end;
                if not v46 then
                    v46 = true;
                    if v44.name ~= v12.AvatarExperienceWrapper then
                        v46 = v44.name == v12.AvatarExperienceWrapperTransparent;
                    end;
                end;
                l_name_2.isVisible = v46;
                l_name_2.isOverlayVisible = v40.props.centralOverlayShowing;
                return l_name_1(l_name_2);
            end;
        end;
    end;
    v39.render = function(v47) --[[ Line: 143 ]] --[[ Name: render ]]
        -- upvalues: v3 (ref), v24 (copy), v5 (ref)
        local v48 = v47:getAvatarRoute();
        return v3.createElement(v24, v5.Dictionary.join(v47.props, {
            avatarRoute = v48, 
            currentNavigationRoute = v5.None, 
            centralOverlayShowing = v5.None
        }));
    end;
    local function v54(v49, v50) --[[ Line: 156 ]] --[[ Name: mapStateToProps ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref)
        local v51 = nil;
        local v52 = nil;
        v51 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v49) else v49.Navigation.history[#v49.Navigation.history];
        v52 = v49.CentralOverlay.OverlayType ~= nil;
        local v53 = v50.avatarRoute or v49.AvatarExperience.AvatarScene.AvatarRoute;
        return {
            currentNavigationRoute = v51, 
            avatarRoute = v53, 
            centralOverlayShowing = v52
        };
    end;
    local v55 = v4.connect(v54, nil)(v39);
    return (v16(v55, l_AvatarRouteContext_0.Consumer, "avatarRoute", {
        required = false
    }));
end;