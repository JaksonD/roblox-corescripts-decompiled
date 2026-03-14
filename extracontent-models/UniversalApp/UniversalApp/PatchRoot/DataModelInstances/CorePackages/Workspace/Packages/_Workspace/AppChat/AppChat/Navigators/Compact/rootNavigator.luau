local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactNavigation);
local v4 = require(l_script_FirstAncestor_0.EnumScreens);
local v5 = require(l_script_FirstAncestor_0.Components.Toast.ToastScreen);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDisableAbsorbInputSelectable);
local v7 = require(script.Parent.chatLandingWithDialogsNavigator);
local v8 = v2.Component:extend("ChatLandingWithDialogsNavigatorConnector");
v8.router = v7.router;
v8.render = function(v9) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v7 (copy)
    return v2.createElement(v7, v9.props);
end;
return v3.createRobloxStackNavigator({
    {
        ChatLandingWithDialogs = v8
    }, 
    {
        [v4.RoactChatToast] = {
            screen = v5, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 1, 
                absorbInput = false
            }
        }
    }
}, {
    defaultNavigationOptions = if v6 then {
        absorbInputSelectable = false
    } else nil, 
    mode = v3.StackPresentationStyle.Overlay
});