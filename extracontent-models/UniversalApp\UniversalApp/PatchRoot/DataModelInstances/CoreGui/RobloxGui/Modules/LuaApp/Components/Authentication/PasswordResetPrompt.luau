local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local v5 = require(l_Modules_0.LuaApp.Http.Url);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v7 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v8 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v9 = require(l_Modules_0.LuaApp.AppPage);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v10.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v10.App.Button.Enum.ButtonType;
local l_GetFFlagEnableLuafiedRecoveryFlow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableLuafiedRecoveryFlow;
local l_enrolledInLuafiedRecoveryExperiment_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Experiments.enrolledInLuafiedRecoveryExperiment;
local v15 = v2.PureComponent:extend("PasswordResetPrompt");
v15.init = function(v16) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagEnableLuafiedRecoveryFlow_0 (copy), l_enrolledInLuafiedRecoveryExperiment_0 (copy), v9 (copy)
    v16.callback = function() --[[ Line: 31 ]]
        -- upvalues: l_GetFFlagEnableLuafiedRecoveryFlow_0 (ref), l_enrolledInLuafiedRecoveryExperiment_0 (ref), v16 (copy), v9 (ref)
        if l_GetFFlagEnableLuafiedRecoveryFlow_0() and l_enrolledInLuafiedRecoveryExperiment_0() then
            v16.props.navigateToPage({
                name = v9.AccountRecovery, 
                extraProps = {
                    identifier = "", 
                    recoverPassword = true
                }
            });
        else
            v16.props.goToSecurityNotificationPage();
        end;
        v16.props.closeCentralOverlay();
    end;
end;
v15.render = function(v17) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v4({
        alertTitle = "CommonUI.Messages.Label.Alert", 
        buttonText = "CommonUI.Messages.Action.OK", 
        message = "Authentication.ResetPassword.Response.ResetPasswordStarted"
    })(function(v18) --[[ Line: 52 ]]
        -- upvalues: v2 (ref), l_InteractiveAlert_0 (ref), l_ButtonType_0 (ref), v17 (copy)
        return v2.createElement(l_InteractiveAlert_0, {
            title = v18.alertTitle, 
            bodyText = v18.message, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v17.callback, 
                            text = v18.buttonText
                        }
                    }
                }
            }, 
            screenSize = v17.props.screenSize
        });
    end);
end;
return (v3.connect(function(v19, _) --[[ Line: 72 ]]
    return {
        screenSize = v19.ScreenSize
    };
end, function(v21) --[[ Line: 76 ]]
    -- upvalues: v7 (copy), v6 (copy), v9 (copy), v5 (copy), v8 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 78 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v21 (copy), v7 (ref)
            return v21(v7());
        end, 
        goToSecurityNotificationPage = function() --[[ Line: 81 ]] --[[ Name: goToSecurityNotificationPage ]]
            -- upvalues: v21 (copy), v6 (ref), v9 (ref), v5 (ref), v8 (ref)
            return v21(v6({
                name = v9.GenericWebPage, 
                detail = string.format("%slogin/securityNotification", v5.BASE_URL), 
                extraProps = {
                    title = "", 
                    transitionAnimation = v8.None
                }
            }));
        end, 
        navigateToPage = function(v22) --[[ Line: 91 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v21 (copy), v6 (ref)
            return v21(v6(v22));
        end
    };
end)(v15));