local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local _ = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_RoactNavigation_0 = v2.RoactNavigation;
local v5 = require(l_script_FirstAncestor_0.Components.FriendsLandingScreen);
local v6 = require(l_script_FirstAncestor_0.Components.FriendsLandingScreen.NavigationOptions);
local v7 = require(l_script_FirstAncestor_0.EnumScreens);
return (l_RoactNavigation_0.createRobloxStackNavigator({
    {
        [v7.FriendsLanding] = {
            screen = v5, 
            navigationOptions = v6
        }
    }
}, {
    transitionConfig = function() --[[ Line: 13 ]] --[[ Name: getTransitionConfig ]]
        -- upvalues: l_UserGameSettings_0 (copy), l_RoactNavigation_0 (copy)
        if l_UserGameSettings_0.ReducedMotion then
            return l_RoactNavigation_0.StackViewTransitionConfigs.FadeInPlace;
        else
            return l_RoactNavigation_0.StackViewTransitionConfigs.SlideFromRight;
        end;
    end
}));