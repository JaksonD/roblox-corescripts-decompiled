local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactNavigation);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local _ = require(l_CorePackages_0.Packages.React);
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v7 = require(l_Modules_0.LuaApp.Navigation.AndroidBackButtonNavigationHandler.Container);
local v8 = require(l_Modules_0.LuaApp.Navigation.isRootRouteInRN);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_Modules_0.LuaApp.Actions.ApplySetNavigationLocked);
local v12 = require(l_Modules_0.LuaApp.AppPage);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.makeNavigationStateLogger);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.makeAppRouterRootContainer);
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local v16 = v2.Component:extend("AvatarExperienceWrapper");
v16.validateProps = v10.strictInterface({
    routeName = v10.string, 
    params = v10.interface({
        detail = v10.string
    }), 
    currentAppPageName = v10.optional(v10.string), 
    currentAppPageDetail = v10.optional(v10.string), 
    unlockNavigation = v10.callback
});
v16.init = function(v17) --[[ Line: 54 ]] --[[ Name: init ]]
    -- upvalues: v14 (copy), v3 (copy), l_memoize_0 (copy), v12 (copy), v2 (copy), v7 (copy), v8 (copy), v13 (copy)
    local l_routeName_0 = v17.props.routeName;
    local v19 = v14(l_routeName_0);
    v17.navigationAppContainer = v3.createAppContainer(v19, nil);
    v17.isAndroidBackButtonHandlerDisabled = l_memoize_0(function(v20, v21, v22) --[[ Line: 60 ]]
        -- upvalues: v12 (ref)
        return not ((not (v20 ~= v12.AvatarExperienceWrapper) or v20 == v12.AvatarExperienceWrapperTransparent) and v21 == v22);
    end);
    v17.renderAndroidBackButtonNavigationHandler = l_memoize_0(function(v23) --[[ Line: 73 ]]
        -- upvalues: v2 (ref), v7 (ref), v8 (ref)
        return function(v24) --[[ Line: 74 ]]
            -- upvalues: v2 (ref), v7 (ref), v8 (ref), v23 (copy)
            return v2.createElement(v7, {
                canGoBackInRN = not v8(v24.state), 
                navigateBackInRN = v24.pop, 
                disabled = v23
            });
        end;
    end);
    local v25 = v13("AvatarExperienceWrapper:" .. v17.props.routeName);
    v17.onNavigationStateChange = function(v26, v27, v28) --[[ Line: 86 ]]
        -- upvalues: v25 (copy), v17 (copy)
        v25(v26, v27, v28);
        if not v27.isTransitioning then
            v17.props.unlockNavigation();
        end;
    end;
end;
v16.render = function(v29) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    local v30 = v29.isAndroidBackButtonHandlerDisabled(v29.props.currentAppPageName, v29.props.currentAppPageDetail, v29.props.params and v29.props.params.detail or nil);
    return v2.createElement(v29.navigationAppContainer, {
        onNavigationStateChange = v29.onNavigationStateChange, 
        renderAndroidBackButtonNavigationHandler = v29.renderAndroidBackButtonNavigationHandler(v30), 
        params = v29.props.params
    });
end;
return (v4.connect(function(v31, _) --[[ Line: 113 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    local v33 = nil;
    if l_FFlagUseNavigationSelectors_0 then
        v33 = l_Selectors_0.selectCurrentLegacyPage(v31);
    else
        local v34 = v31.Navigation.history[#v31.Navigation.history];
        v33 = v34[#v34];
    end;
    local v35 = v33 and v33.name or nil;
    local v36 = v33 and v33.detail or nil;
    return {
        currentAppPageName = v35, 
        currentAppPageDetail = v36
    };
end, function(v37) --[[ Line: 130 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy)
    return {
        unlockNavigation = function() --[[ Line: 132 ]] --[[ Name: unlockNavigation ]]
            -- upvalues: v37 (copy), v11 (ref)
            v37(v11(false));
        end
    };
end)(v16));