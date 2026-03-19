local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AppRouterParamsContext);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v6 = require(l_Modules_0.LuaApp.Navigation.isRootRouteInRN);
return function(v7) --[[ Line: 20 ]]
    -- upvalues: v3 (copy), v5 (copy), v6 (copy), v2 (copy), v4 (copy)
    local v8 = v3.PureComponent:extend("AppRouterParams");
    v8.init = function(v9) --[[ Line: 23 ]] --[[ Name: init ]]
        -- upvalues: v5 (ref), v6 (ref)
        local l_navigation_0 = v9.props.navigation;
        local v11 = v5.getRootNavigation(l_navigation_0);
        if v6(v11.state) and v9.props.params then
            l_navigation_0.setParams(v9.props.params);
        end;
    end;
    v8.render = function(v12) --[[ Line: 33 ]] --[[ Name: render ]]
        -- upvalues: v3 (ref), v7 (copy), v2 (ref)
        if v12.props.navigation.state.params == nil then
            return nil;
        else
            return v3.createElement(v7, v2.Dictionary.join(v12.props, {
                params = v2.None
            }));
        end;
    end;
    return function(v13) --[[ Line: 47 ]]
        -- upvalues: v3 (ref), v4 (ref), v2 (ref), v8 (copy)
        return v3.createElement(v4.Consumer, {
            render = function(v14) --[[ Line: 49 ]] --[[ Name: render ]]
                -- upvalues: v13 (copy), v2 (ref), v3 (ref), v8 (ref)
                if v14.setNavigationForTests then
                    v14.setNavigationForTests(v13.navigation);
                    v14 = v2.Dictionary.join(v14, {
                        setNavigationForTests = v2.None
                    });
                end;
                local v15 = v2.Dictionary.join(v13, {
                    params = v14
                });
                return v3.createElement(v8, v15);
            end
        });
    end;
end;