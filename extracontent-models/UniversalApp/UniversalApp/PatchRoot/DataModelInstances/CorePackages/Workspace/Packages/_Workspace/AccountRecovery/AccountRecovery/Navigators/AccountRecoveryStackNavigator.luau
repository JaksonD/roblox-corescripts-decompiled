local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactNavigation);
local v4 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryPageState);
local _ = require(l_Parent_0.Navigation);
local v6 = require(l_script_FirstAncestor_0.Components.RequestRecoveryScreen);
local v7 = require(l_script_FirstAncestor_0.Components.SendCodeScreen);
local v8 = require(l_script_FirstAncestor_0.Components.AccountVerifiedConfirmationScreen);
local v9 = require(l_script_FirstAncestor_0.Components.VerifyCodeScreen);
local v10 = require(l_script_FirstAncestor_0.Components.ChooseAccountScreen);
local v11 = require(l_script_FirstAncestor_0.Components.ResetPasswordScreen);
local v12 = require(l_script_FirstAncestor_0.Components.ContinueFallbackScreen);
local v13 = require(l_script_FirstAncestor_0.Components.CannotRecoverAccountScreen);
local v22 = {
    {
        [v4.RequestRecoveryScreen] = {
            screen = function(v14) --[[ Line: 21 ]] --[[ Name: screen ]]
                -- upvalues: v2 (copy), v6 (copy)
                return v2.createElement(v6, v14);
            end, 
            navigationOptions = {
                title = v4.RequestRecoveryScreen
            }
        }
    }, 
    {
        [v4.SendCodeScreen] = {
            screen = function(v15) --[[ Line: 31 ]] --[[ Name: screen ]]
                -- upvalues: v2 (copy), v7 (copy)
                return v2.createElement(v7, v15);
            end, 
            navigationOptions = {
                title = v4.SendCodeScreen
            }
        }
    }, 
    {
        [v4.AccountVerifiedConfirmationScreen] = {
            screen = function(v16) --[[ Line: 41 ]] --[[ Name: screen ]]
                -- upvalues: v2 (copy), v8 (copy)
                return v2.createElement(v8, v16);
            end, 
            navigationOptions = {
                title = v4.AccountVerifiedConfirmationScreen
            }
        }
    }, 
    {
        [v4.VerifyCodeScreen] = {
            screen = function(v17) --[[ Line: 51 ]] --[[ Name: screen ]]
                -- upvalues: v2 (copy), v9 (copy)
                return v2.createElement(v9, v17);
            end, 
            navigationOptions = {
                title = v4.VerifyCodeScreen
            }
        }
    }, 
    {
        [v4.ChooseAccountScreen] = {
            screen = function(v18) --[[ Line: 61 ]] --[[ Name: screen ]]
                -- upvalues: v2 (copy), v10 (copy)
                return v2.createElement(v10, v18);
            end, 
            navigationOptions = {
                title = v4.ChooseAccountScreen
            }
        }
    }, 
    {
        [v4.ResetPasswordScreen] = {
            screen = function(v19) --[[ Line: 71 ]] --[[ Name: screen ]]
                -- upvalues: v2 (copy), v11 (copy)
                return v2.createElement(v11, v19);
            end, 
            navigationOptions = {
                title = v4.ResetPasswordScreen
            }
        }
    }, 
    {
        [v4.ContinueFallbackScreen] = {
            screen = function(v20) --[[ Line: 81 ]] --[[ Name: screen ]]
                -- upvalues: v2 (copy), v12 (copy)
                return v2.createElement(v12, v20);
            end, 
            navigationOptions = {
                title = v4.ContinueFallbackScreen
            }
        }
    }, 
    {
        [v4.CannotRecoverAccountScreen] = {
            screen = function(v21) --[[ Line: 91 ]] --[[ Name: screen ]]
                -- upvalues: v2 (copy), v13 (copy)
                return v2.createElement(v13, v21);
            end, 
            navigationOptions = {
                title = v4.CannotRecoverAccountScreen
            }
        }
    }
};
return (v3.createRobloxStackNavigator(v22, {
    initialRouteName = v4.RequestRecoveryScreen, 
    keepVisitedScreensMounted = false, 
    backBehavior = v3.BackBehavior.History, 
    transitionConfig = function() --[[ Line: 101 ]]
        return {
            transitionSpec = {
                frequency = 1000000, 
                dampingRatio = 1
            }
        };
    end
}));