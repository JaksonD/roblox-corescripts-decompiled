local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v3 = require(l_script_FirstAncestor_0.Navigator.MainStackNavigator);
local v4 = require(l_script_FirstAncestor_0.Components.FriendsLandingHeaderBar);
local v5 = require(l_script_FirstAncestor_0.Navigator.isFromConnectionsHub);
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
local v7 = l_Roact_0.PureComponent:extend("MainStackNavigatorConnector");
v7.render = function(v8) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagCreateConnectionsHub_0 (copy), v5 (copy), l_Roact_0 (copy), v4 (copy), v3 (copy)
    local l_navigation_0 = v8.props.navigation;
    local v10 = l_FFlagCreateConnectionsHub_0 and v5(l_navigation_0);
    return l_Roact_0.createFragment({
        layout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        topBar = if l_FFlagCreateConnectionsHub_0 and v10 then nil else l_Roact_0.createElement(v4, {
            navigation = v8.props.navigation
        }), 
        navigator = l_Roact_0.createElement(v3, {
            navigation = v8.props.navigation
        })
    });
end;
v7.router = v3.router;
return v7;