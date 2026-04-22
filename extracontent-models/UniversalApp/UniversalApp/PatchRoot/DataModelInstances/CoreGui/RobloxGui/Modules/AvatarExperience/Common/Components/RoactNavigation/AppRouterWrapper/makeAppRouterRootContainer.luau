local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v5 = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v7 = require(l_Modules_0.LuaApp.AppPageProperties);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AppRouterParamsContext);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.makeAppRouterRootNavigator);
local l_AvatarRouteContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Context.AvatarRouteContext;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.makeAvatarRoute);
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local function _(v15) --[[ Line: 36 ]] --[[ Name: getPageName ]]
    -- upvalues: v5 (copy)
    local l_name_0 = v15.name;
    if l_name_0 == v5.AvatarExperienceWrapper or l_name_0 == v5.AvatarExperienceWrapperTransparent then
        l_name_0 = v15.extraProps.routeName;
    end;
    return l_name_0;
end;
local function v30(v18, v19) --[[ Line: 49 ]] --[[ Name: isVisible ]]
    -- upvalues: v6 (copy), l_AvatarScreenProperties_0 (copy), v5 (copy), v7 (copy)
    local v20 = v6.getActiveScreenNavigationState(v18.state);
    local v21 = v20.params and v20.params.detail or nil;
    local l_routeName_0 = v20.routeName;
    local v23 = l_AvatarScreenProperties_0[l_routeName_0];
    local v24 = v23 and v23.isTransparent;
    local v25 = 0;
    for v26 = #v19, 1, -1 do
        local v27 = v19[v26];
        local l_name_1 = v27.name;
        if l_name_1 == v5.AvatarExperienceWrapper or l_name_1 == v5.AvatarExperienceWrapperTransparent then
            l_name_1 = v27.extraProps.routeName;
        end;
        local l_l_name_1_0 = l_name_1;
        if l_l_name_1_0 == l_routeName_0 and v27.detail == v21 then
            return true;
        elseif v7[l_l_name_1_0] and not v7[l_l_name_1_0].renderUnderlyingPage then
            return false;
        elseif v24 then
            v25 = v25 + 1;
            if v25 >= 1 then
                return false;
            end;
        end;
    end;
    return false;
end;
return function(v31) --[[ Line: 78 ]] --[[ Name: makeAppRouterRootContainer ]]
    -- upvalues: v9 (copy), v2 (copy), v8 (copy), l_AvatarRouteContext_0 (copy), v11 (copy), v30 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v3 (copy)
    local v32 = v9(v31);
    local v33 = v2.PureComponent:extend("AppRouterRootContainer");
    v33.render = function(v34) --[[ Line: 83 ]] --[[ Name: render ]]
        -- upvalues: v2 (ref), v8 (ref), l_AvatarRouteContext_0 (ref), v11 (ref), v30 (ref), v32 (copy)
        local l_navigation_0 = v34.props.navigation;
        return v2.createElement(v8.Provider, {
            value = v34.props.params
        }, {
            AvatarRouteProvider = v2.createElement(l_AvatarRouteContext_0.Provider, {
                value = v11(l_navigation_0, (v30(l_navigation_0, v34.props.currentRoute)))
            }, {
                navigation = v2.createElement(v32, {
                    navigation = l_navigation_0
                }), 
                androidBackButtonNavigationHandler = v34.props.renderAndroidBackButtonNavigationHandler(l_navigation_0)
            })
        });
    end;
    local function v38(v36, _) --[[ Line: 101 ]] --[[ Name: mapStateToProps ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref)
        return {
            currentRoute = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v36) else v36.Navigation.history[#v36.Navigation.history]
        };
    end;
    v33 = v3.connect(v38, nil)(v33);
    v33.router = v32.router;
    return v33;
end;