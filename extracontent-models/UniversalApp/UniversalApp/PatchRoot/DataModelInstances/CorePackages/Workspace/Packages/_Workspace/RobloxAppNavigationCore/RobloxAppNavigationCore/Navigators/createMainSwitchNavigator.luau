local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactNavigation);
local _ = require(l_Parent_0.Navigation);
local l_CurrentTabContext_0 = require(l_Parent_0.RobloxAppNavigation).CurrentTabContext;
local v5 = require(script.Parent.createAdaptiveSwitchNavigator);
return function(v6) --[[ Line: 16 ]] --[[ Name: createMainSwitchNavigator ]]
    -- upvalues: v5 (copy), v2 (copy), v1 (copy), l_CurrentTabContext_0 (copy)
    local v7 = v5(v6, {
        keepVisitedScreensMounted = true, 
        resetOnBlur = false, 
        backBehavior = v2.BackBehavior.InitialRoute
    });
    local v8 = v1.Component:extend("SwitchNavigatorWrapper");
    v8.router = v7.router;
    v8.render = function(v9) --[[ Line: 26 ]] --[[ Name: render ]]
        -- upvalues: v1 (ref), l_CurrentTabContext_0 (ref), v7 (copy)
        local l_state_0 = v9.props.navigation.state;
        local v11 = l_state_0.routes[l_state_0.index];
        return v1.createElement(l_CurrentTabContext_0.Provider, {
            value = v11.routeName
        }, {
            Navigator = v1.createElement(v7, v9.props)
        });
    end;
    return v8;
end;