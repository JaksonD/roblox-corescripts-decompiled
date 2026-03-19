local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local _ = l_script_FirstAncestor_0.Parent;
local l_RoactNavigation_0 = v1.RoactNavigation;
local v4 = require(l_script_FirstAncestor_0.EnumScreens);
local v5 = require(l_script_FirstAncestor_0.Navigator.MainStackNavigatorConnector);
local v6 = require(l_script_FirstAncestor_0.Components.FriendsLandingFilter);
local v7 = require(l_script_FirstAncestor_0.Components.FriendsLandingContextualMenu);
local l_DiscoverabilityOverlay_0 = v1.DiscoverabilityOverlay;
local l_Roact_0 = v1.Roact;
local _ = require(l_script_FirstAncestor_0.Parent.React);
local v11 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v12 = require(l_script_FirstAncestor_0.Navigator.ProfileQRCodePageWrapper);
l_Roact_0.PureComponent:extend("DiscoverabilityWrapped").render = function(v13) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), l_Roact_0 (copy), l_DiscoverabilityOverlay_0 (copy)
    return v11.with(function(v14) --[[ Line: 19 ]]
        -- upvalues: l_Roact_0 (ref), l_DiscoverabilityOverlay_0 (ref), v13 (copy)
        return l_Roact_0.createElement(l_DiscoverabilityOverlay_0, {
            navigation = v13.props.navigation, 
            context = v14
        });
    end);
end;
local v15 = {
    {
        MainStackNavigator = {
            screen = v5, 
            navigationOptions = {
                overlayTransparency = 1
            }
        }
    }, 
    {
        [v4.FilterByModal] = {
            screen = v6
        }
    }, 
    {
        [v4.ContextualMenu] = v7
    }, 
    {
        [v4.ProfileQRCodePage] = v12
    }
};
return (l_RoactNavigation_0.createRobloxStackNavigator(v15, {
    defaultNavigationOptions = {
        overlayEnabled = true, 
        absorbInput = true, 
        absorbInputSelectable = false
    }, 
    mode = l_RoactNavigation_0.StackPresentationStyle.Overlay
}));