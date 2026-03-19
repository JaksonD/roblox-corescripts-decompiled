local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.withLocalization);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v7 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v8 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v9 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v10 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v11 = v1.PureComponent:extend("AgreeToPhoneNumberVerification");
v11.defaultProps = {
    phoneNumber = ""
};
v11.init = function(v12) --[[ Line: 22 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy)
    v12.onConfirm = function() --[[ Line: 23 ]]
        -- upvalues: v12 (copy), v10 (ref)
        v12.props.closeAlert();
        v12.props.verificationChallengeCallback();
        v12.props.authEventAnalytics.reportButtonClicked(v10.Context.SinglePageSignUpScreen, v10.Button.VerifyPhonePrompt);
    end;
end;
v11.render = function(v13) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v5 (copy), v1 (copy), v7 (copy)
    return l_withStyle_0(function(v14) --[[ Line: 34 ]]
        -- upvalues: v13 (copy), v5 (ref), v1 (ref), v7 (ref)
        local l_Theme_0 = v14.Theme;
        local l_containerWidth_0 = v13.props.containerWidth;
        local l_closeAlert_0 = v13.props.closeAlert;
        return v5({
            titleText = "Feature.VerificationUpsell.Label.VerifyPhoneNumber", 
            messageText = "Feature.VerificationUpsell.Message.Confirmation", 
            confirmButtonText = "Feature.VerificationUpsell.Action.Ok", 
            cancelButtonText = "Feature.VerificationUpsell.Action.Edit"
        })(function(v18) --[[ Line: 44 ]]
            -- upvalues: v1 (ref), v7 (ref), l_Theme_0 (copy), l_containerWidth_0 (copy), v14 (copy), v13 (ref), l_closeAlert_0 (copy)
            return v1.createElement(v7, {
                theme = l_Theme_0, 
                containerWidth = l_containerWidth_0, 
                titleText = v18.titleText, 
                titleFont = v14.Font.Title.Font, 
                messageText = string.gsub(v18.messageText, "{phoneNumber}", v13.props.phoneNumber), 
                messageFont = v14.Font.Body.Font, 
                buttonFont = v14.Font.Body.Font, 
                confirmButtonText = v18.confirmButtonText, 
                cancelButtonText = v18.cancelButtonText, 
                onConfirm = v13.onConfirm, 
                isConfirming = false, 
                hasCancelButton = true, 
                onCancel = l_closeAlert_0
            });
        end);
    end);
end;
v11 = v2.connect(nil, function(v19) --[[ Line: 64 ]]
    -- upvalues: v8 (copy)
    return {
        closeAlert = function() --[[ Line: 66 ]] --[[ Name: closeAlert ]]
            -- upvalues: v19 (copy), v8 (ref)
            return v19(v8());
        end
    };
end)(v11);
return (l_RoactServices_0.connect({
    authEventAnalytics = v9
})(v11));