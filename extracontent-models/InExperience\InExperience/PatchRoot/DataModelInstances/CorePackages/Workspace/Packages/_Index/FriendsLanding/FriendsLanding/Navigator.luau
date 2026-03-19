local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_RoactNavigation_0 = v1.RoactNavigation;
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_script_FirstAncestor_0.Navigator.ModalStackNavigator);
local l_ToastScreen_0 = v1.SocialLibraries.Components.ToastScreen;
return (l_RoactNavigation_0.createRobloxStackNavigator({
    {
        ModalStackNavigator = {
            screen = v4, 
            navigationOptions = {
                transparent = true, 
                absorbInputSelectable = false
            }
        }
    }, 
    {
        [v3.GenericToast] = {
            screen = l_ToastScreen_0, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 1, 
                absorbInput = false
            }
        }
    }
}, {
    mode = l_RoactNavigation_0.StackPresentationStyle.Overlay
}));