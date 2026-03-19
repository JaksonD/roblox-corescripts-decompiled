local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local v7 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v8 = require(l_Modules_0.LuaApp.Thunks.Authentication.VerifyCredentials);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v9.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local v12 = v2.PureComponent:extend("LoginEmailVerificationPrompt");
v12.init = function(v13) --[[ Line: 23 ]] --[[ Name: init ]]
    v13.resendCallback = function() --[[ Line: 24 ]]
        -- upvalues: v13 (copy)
        v13.props.verifyCredentials(v13.props.networking, v13.props.credentialValue, v13.props.password);
        v13.props.onClose(v13.props.credentialValue);
        v13.props.closeCentralOverlay();
    end;
    v13.closeCallback = function() --[[ Line: 30 ]]
        -- upvalues: v13 (copy)
        v13.props.onClose(v13.props.credentialValue);
        v13.props.closeCentralOverlay();
    end;
end;
v12.render = function(v14) --[[ Line: 36 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v6({
        alertTitle = "Authentication.Login.Label.EmailNeedsVerification", 
        buttonText = "Authentication.Login.Action.SendVerificationEmail", 
        cancelText = "Feature.Chat.Action.Cancel", 
        message = "Authentication.Login.Label.UnverifiedEmailInstructions"
    })(function(v15) --[[ Line: 42 ]]
        -- upvalues: v2 (ref), l_InteractiveAlert_0 (ref), l_ButtonType_0 (ref), v14 (copy)
        return v2.createElement(l_InteractiveAlert_0, {
            title = v15.alertTitle, 
            bodyText = v15.message, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v14.closeCallback, 
                            text = v15.cancelText
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v14.resendCallback, 
                            text = v15.buttonText
                        }
                    }
                }
            }, 
            screenSize = v14.props.screenSize
        });
    end);
end;
v12 = l_RoactServices_0.connect({
    networking = v5
})(v12);
return (v3.connect(function(v16, _) --[[ Line: 73 ]]
    return {
        screenSize = v16.ScreenSize
    };
end, function(v18) --[[ Line: 77 ]]
    -- upvalues: v8 (copy), v7 (copy)
    return {
        verifyCredentials = function(v19, v20, v21) --[[ Line: 79 ]] --[[ Name: verifyCredentials ]]
            -- upvalues: v18 (copy), v8 (ref)
            return v18(v8(v19, "Email", v20, v21));
        end, 
        closeCentralOverlay = function() --[[ Line: 82 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v18 (copy), v7 (ref)
            return v18(v7());
        end
    };
end)(v12));