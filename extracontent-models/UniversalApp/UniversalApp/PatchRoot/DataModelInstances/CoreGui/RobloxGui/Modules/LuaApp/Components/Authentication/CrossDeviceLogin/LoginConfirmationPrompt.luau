local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.withLocalization);
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v7 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceEnterCodeRefresh);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v9.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local v12 = v2.PureComponent:extend("LoginConfirmationPrompt");
v12.init = function(v13) --[[ Line: 28 ]] --[[ Name: init ]]
    v13.retryCodeCallback = function() --[[ Line: 29 ]]
        -- upvalues: v13 (copy)
        v13.props.closeCentralOverlay();
        if v13.props.retryCallback then
            v13.props.retryCallback();
        end;
    end;
    v13.closePageCallback = function() --[[ Line: 36 ]]
        -- upvalues: v13 (copy)
        v13.props.closeCentralOverlay();
        if v13.props.closeCallback then
            v13.props.closeCallback();
        end;
    end;
end;
v12.didMount = function(v14) --[[ Line: 44 ]] --[[ Name: didMount ]]
    v14.props.authAnalytics.reportScreenLoaded(v14.props.loginSuccess and "quickLoginSucceeded" or "quickLoginFailed");
end;
v12.render = function(v15) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v5 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local l_loginSuccess_0 = v15.props.loginSuccess;
    local v17 = v8() and "Authentication.CrossDevice.Label.OK" or "Authentication.CrossDevice.Action.Done";
    return v5({
        alertTitle = l_loginSuccess_0 and "Authentication.CrossDevice.Response.LoginSuccess" or "Authentication.CrossDevice.Response.LoginFail", 
        errorMessage = "Authentication.CrossDevice.Label.CodeNotVerified", 
        successButtonText = v17, 
        retryButtonText = "Authentication.CrossDevice.Action.TryAgain", 
        cancelButtonText = "Authentication.CrossDevice.Action.CancelLogin"
    })(function(v18) --[[ Line: 59 ]]
        -- upvalues: l_loginSuccess_0 (copy), v15 (copy), v2 (ref), l_InteractiveAlert_0 (ref), l_ButtonType_0 (ref)
        local v19 = l_loginSuccess_0 and v15.props.deviceString or v18.errorMessage;
        return v2.createElement(l_InteractiveAlert_0, {
            title = v18.alertTitle, 
            bodyText = v19, 
            buttonStackInfo = {
                buttons = l_loginSuccess_0 and {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v15.closePageCallback, 
                            text = v18.successButtonText
                        }
                    }
                } or {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v15.closePageCallback, 
                            text = v18.cancelButtonText
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v15.retryCodeCallback, 
                            text = v18.retryButtonText
                        }
                    }
                }
            }, 
            screenSize = v15.props.screenSize
        });
    end);
end;
v12 = l_RoactServices_0.connect({
    authAnalytics = v6
})(v12);
return (v3.connect(function(v20, _) --[[ Line: 100 ]]
    return {
        screenSize = v20.ScreenSize
    };
end, function(v22) --[[ Line: 104 ]]
    -- upvalues: v7 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 106 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v22 (copy), v7 (ref)
            return v22(v7());
        end
    };
end)(v12));