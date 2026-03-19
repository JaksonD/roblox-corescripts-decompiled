local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.withLocalization);
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v7 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v8.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local v11 = v2.PureComponent:extend("LoginConfirmationPrompt");
v11.init = function(v12) --[[ Line: 27 ]] --[[ Name: init ]]
    v12.retryCodeCallback = function() --[[ Line: 28 ]]
        -- upvalues: v12 (copy)
        v12.props.closeCentralOverlay();
        if v12.props.retryCallback then
            v12.props.retryCallback();
        end;
    end;
    v12.closePageCallback = function() --[[ Line: 35 ]]
        -- upvalues: v12 (copy)
        v12.props.closeCentralOverlay();
        if v12.props.closeCallback then
            v12.props.closeCallback();
        end;
    end;
end;
v11.didMount = function(v13) --[[ Line: 43 ]] --[[ Name: didMount ]]
    v13.props.authAnalytics.reportScreenLoaded(v13.props.loginSuccess and "quickLoginSucceeded" or "quickLoginFailed");
end;
v11.render = function(v14) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local l_loginSuccess_0 = v14.props.loginSuccess;
    return v5({
        alertTitle = l_loginSuccess_0 and "Authentication.CrossDevice.Response.LoginSuccess" or "Authentication.CrossDevice.Response.LoginFail", 
        errorMessage = "Authentication.CrossDevice.Label.CodeNotVerified", 
        successButtonText = "Authentication.CrossDevice.Action.Done", 
        retryButtonText = "Authentication.CrossDevice.Action.TryAgain", 
        cancelButtonText = "Authentication.CrossDevice.Action.CancelLogin"
    })(function(v16) --[[ Line: 55 ]]
        -- upvalues: l_loginSuccess_0 (copy), v14 (copy), v2 (ref), l_InteractiveAlert_0 (ref), l_ButtonType_0 (ref)
        local v17 = l_loginSuccess_0 and v14.props.deviceString or v16.errorMessage;
        return v2.createElement(l_InteractiveAlert_0, {
            title = v16.alertTitle, 
            bodyText = v17, 
            buttonStackInfo = {
                buttons = l_loginSuccess_0 and {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v14.closePageCallback, 
                            text = v16.successButtonText
                        }
                    }
                } or {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v14.closePageCallback, 
                            text = v16.cancelButtonText
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v14.retryCodeCallback, 
                            text = v16.retryButtonText
                        }
                    }
                }
            }, 
            screenSize = v14.props.screenSize
        });
    end);
end;
v11 = l_RoactServices_0.connect({
    authAnalytics = v6
})(v11);
return (v3.connect(function(v18, _) --[[ Line: 96 ]]
    return {
        screenSize = v18.ScreenSize
    };
end, function(v20) --[[ Line: 100 ]]
    -- upvalues: v7 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 102 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v20 (copy), v7 (ref)
            return v20(v7());
        end
    };
end)(v11));