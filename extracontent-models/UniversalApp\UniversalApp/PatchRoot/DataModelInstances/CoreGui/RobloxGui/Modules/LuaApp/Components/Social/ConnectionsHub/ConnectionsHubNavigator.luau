local l_CorePackages_0 = game:GetService("CorePackages");
local l_Packages_0 = l_CorePackages_0.Packages;
local v2 = require(l_Packages_0.React);
local v3 = require(l_Packages_0.RoactNavigation);
local l_ConnectionsHub_0 = require(l_CorePackages_0.Workspace.Packages.ConnectionsHub).ConnectionsHub;
local v5 = require(script.Parent.ConnectionsHubRouter);
local v6 = require(script.Parent.TabConfig);
local v7 = v3.createRobloxSwitchNavigator(v5, {
    resetOnBlur = false, 
    keepVisitedScreensMounted = true, 
    backBehavior = v3.BackBehavior.None
});
local function v11(v8) --[[ Line: 22 ]]
    -- upvalues: v2 (copy), v7 (copy), l_ConnectionsHub_0 (copy), v6 (copy)
    local l_navigation_0 = v8.navigation;
    local v10 = v2.useCallback(function() --[[ Line: 25 ]]
        -- upvalues: v2 (ref), v7 (ref), l_navigation_0 (copy)
        return v2.createElement(v7, {
            navigation = l_navigation_0
        });
    end, {
        l_navigation_0
    });
    return v2.createElement(l_ConnectionsHub_0, {
        renderNavigator = v10, 
        tabConfig = v6
    });
end;
local v12 = v2.PureComponent:extend("ClassWrapper");
v12.render = function(v13) --[[ Line: 40 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v11 (copy)
    return v2.createElement(v11, v13.props);
end;
v12.router = v7.router;
return v12;