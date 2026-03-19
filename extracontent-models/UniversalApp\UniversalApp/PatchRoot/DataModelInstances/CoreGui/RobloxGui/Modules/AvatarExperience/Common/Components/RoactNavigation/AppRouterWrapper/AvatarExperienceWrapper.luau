local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactNavigation);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local _ = require(l_CorePackages_0.Packages.React);
local v6 = require(l_Modules_0.LuaApp.Navigation.AndroidBackButtonNavigationHandler.Container);
local v7 = require(l_Modules_0.LuaApp.Navigation.isRootRouteInRN);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_Modules_0.LuaApp.Actions.ApplySetNavigationLocked);
local v11 = require(l_Modules_0.LuaApp.AppPage);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.makeNavigationStateLogger);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.makeAppRouterRootContainer);
local v14 = v2.Component:extend("AvatarExperienceWrapper");
v14.validateProps = v9.strictInterface({
    routeName = v9.string, 
    params = v9.interface({
        detail = v9.string
    }), 
    currentAppPageName = v9.optional(v9.string), 
    currentAppPageDetail = v9.optional(v9.string), 
    unlockNavigation = v9.callback
});
v14.init = function(v15) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), v3 (copy), l_memoize_0 (copy), v11 (copy), v2 (copy), v6 (copy), v7 (copy), v12 (copy)
    local l_routeName_0 = v15.props.routeName;
    local v17 = v13(l_routeName_0);
    v15.navigationAppContainer = v3.createAppContainer(v17, nil);
    v15.isAndroidBackButtonHandlerDisabled = l_memoize_0(function(v18, v19, v20) --[[ Line: 58 ]]
        -- upvalues: v11 (ref)
        return not ((not (v18 ~= v11.AvatarExperienceWrapper) or v18 == v11.AvatarExperienceWrapperTransparent) and v19 == v20);
    end);
    v15.renderAndroidBackButtonNavigationHandler = l_memoize_0(function(v21) --[[ Line: 71 ]]
        -- upvalues: v2 (ref), v6 (ref), v7 (ref)
        return function(v22) --[[ Line: 72 ]]
            -- upvalues: v2 (ref), v6 (ref), v7 (ref), v21 (copy)
            return v2.createElement(v6, {
                canGoBackInRN = not v7(v22.state), 
                navigateBackInRN = v22.pop, 
                disabled = v21
            });
        end;
    end);
    local v23 = v12("AvatarExperienceWrapper:" .. v15.props.routeName);
    v15.onNavigationStateChange = function(v24, v25, v26) --[[ Line: 84 ]]
        -- upvalues: v23 (copy), v15 (copy)
        v23(v24, v25, v26);
        if not v25.isTransitioning then
            v15.props.unlockNavigation();
        end;
    end;
end;
v14.render = function(v27) --[[ Line: 95 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    local v28 = v27.isAndroidBackButtonHandlerDisabled(v27.props.currentAppPageName, v27.props.currentAppPageDetail, v27.props.params and v27.props.params.detail or nil);
    return v2.createElement(v27.navigationAppContainer, {
        onNavigationStateChange = v27.onNavigationStateChange, 
        renderAndroidBackButtonNavigationHandler = v27.renderAndroidBackButtonNavigationHandler(v28), 
        params = v27.props.params
    });
end;
return (v4.connect(function(v29, _) --[[ Line: 111 ]] --[[ Name: mapStateToProps ]]
    local v31 = v29.Navigation.history[#v29.Navigation.history];
    local v32 = v31[#v31];
    local v33 = v32 and v32.name or nil;
    local v34 = v32 and v32.detail or nil;
    return {
        currentAppPageName = v33, 
        currentAppPageDetail = v34
    };
end, function(v35) --[[ Line: 123 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v10 (copy)
    return {
        unlockNavigation = function() --[[ Line: 125 ]] --[[ Name: unlockNavigation ]]
            -- upvalues: v35 (copy), v10 (ref)
            v35(v10(false));
        end
    };
end)(v14));