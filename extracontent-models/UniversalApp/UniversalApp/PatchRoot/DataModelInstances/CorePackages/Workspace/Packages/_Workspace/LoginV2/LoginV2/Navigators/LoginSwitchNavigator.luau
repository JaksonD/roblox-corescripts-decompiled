local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactNavigation);
local v4 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local _ = require(l_Parent_0.Navigation);
local v6 = require(l_script_FirstAncestor_0.Components.AuthenticationScreen);
local v7 = require(l_script_FirstAncestor_0.Components.LoginScreenV2);
local v8 = require(l_script_FirstAncestor_0.Components.EmailOtpScreen);
local v12 = {
    {
        [v4.LoginScreenV2] = {
            screen = function(v9) --[[ Line: 16 ]] --[[ Name: screen ]]
                -- upvalues: v2 (copy), v7 (copy)
                return v2.createElement(v7, v9);
            end, 
            navigationOptions = {
                title = v4.LoginScreenV2
            }
        }
    }, 
    {
        [v4.AuthenticationScreen] = {
            screen = function(v10) --[[ Line: 26 ]] --[[ Name: screen ]]
                -- upvalues: v2 (copy), v6 (copy)
                return v2.createElement(v6, v10);
            end, 
            navigationOptions = {
                title = v4.AuthenticationScreen
            }
        }
    }, 
    {
        [v4.EmailOtpScreen] = {
            screen = function(v11) --[[ Line: 36 ]] --[[ Name: screen ]]
                -- upvalues: v2 (copy), v8 (copy)
                return v2.createElement(v8, v11);
            end, 
            navigationOptions = {
                title = v4.EmailOtpScreen
            }
        }
    }
};
return (v3.createRobloxSwitchNavigator(v12, {
    initialRouteName = v4.LoginScreenV2, 
    keepVisitedScreensMounted = false, 
    backBehavior = v3.BackBehavior.InitialRoute
}));