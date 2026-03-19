local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v10 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v11 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v12 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpLayout);
local v13 = require(l_Modules_0.LuaApp.Components.Authentication.TextInputValidationWidget);
local v14 = require(l_Modules_0.LuaApp.Thunks.Authentication.PasswordValidator);
local v15 = require(l_Modules_0.LuaApp.Thunks.Authentication.SignUp);
local v16 = require(l_Modules_0.LuaApp.Thunks.Authentication.StoreSignUpPassword);
local v17 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpSelectedCharacterWithName);
local v18 = require(l_Modules_0.LuaApp.Enum.SignUpErrorCodes);
local v19 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v20 = v3.PureComponent:extend("PasswordPage");
v20.init = function(v21) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy), v19 (copy), v2 (copy), v14 (copy), v3 (copy), v13 (copy)
    v21.state = {
        isSignUpInProgress = false
    };
    v21.isMounted = false;
    v21.updateIsSignUpInProgress = function(v22) --[[ Line: 39 ]]
        -- upvalues: v21 (copy)
        spawn(function() --[[ Line: 40 ]]
            -- upvalues: v21 (ref), v22 (copy)
            local l_isSignUpInProgress_0 = v21.state.isSignUpInProgress;
            if v21.isMounted and l_isSignUpInProgress_0 ~= v22 then
                v21:setState({
                    isSignUpInProgress = v22
                });
            end;
        end);
    end;
    v21.requestSignUp = function(v24) --[[ Line: 51 ]]
        -- upvalues: v21 (copy), v18 (ref)
        local l_networking_0 = v21.props.networking;
        local l_analytics_0 = v21.props.analytics;
        local l_appPolicy_0 = v21.props.appPolicy;
        local l_guiService_0 = v21.props.guiService;
        local l_signUp_0 = v21.props.signUp;
        local l_setBackNavigationDisabled_0 = v21.props.setBackNavigationDisabled;
        l_signUp_0(l_networking_0, v21.props.omniRecommendationsRequest, l_guiService_0, function(v31, v32) --[[ Line: 60 ]]
            -- upvalues: l_setBackNavigationDisabled_0 (copy), v21 (ref)
            if v31 then
                l_setBackNavigationDisabled_0(true);
                v21.requestSignUp(v32);
                return;
            else
                v21.updateIsSignUpInProgress(false);
                return;
            end;
        end, v24, l_analytics_0, l_appPolicy_0):andThen(function() --[[ Line: 72 ]]
            -- upvalues: l_setBackNavigationDisabled_0 (copy)
            l_setBackNavigationDisabled_0(false);
        end, function(v33) --[[ Line: 78 ]]
            -- upvalues: l_setBackNavigationDisabled_0 (copy), v18 (ref), v21 (ref)
            l_setBackNavigationDisabled_0(false);
            if v33 ~= v18.Captcha then
                v21.updateIsSignUpInProgress(false);
            end;
        end);
    end;
    v21.continueButtonActivated = function(v34) --[[ Line: 91 ]]
        -- upvalues: v21 (copy), v19 (ref)
        local l_networking_1 = v21.props.networking;
        local l_authAnalytics_0 = v21.props.authAnalytics;
        local l_storeSignUpPassword_0 = v21.props.storeSignUpPassword;
        local l_setBackNavigationDisabled_1 = v21.props.setBackNavigationDisabled;
        local l_selectedUsername_0 = v21.props.selectedUsername;
        if not v21.state.isSignUpInProgress then
            l_setBackNavigationDisabled_1(true);
            v21.updateIsSignUpInProgress(true);
            l_storeSignUpPassword_0(l_networking_1, l_selectedUsername_0, v34):andThen(function() --[[ Line: 103 ]]
                -- upvalues: l_authAnalytics_0 (copy), v19 (ref), v21 (ref)
                l_authAnalytics_0.reportContinueButtonClicked(v19.Context.PasswordScreen);
                v21.requestSignUp();
            end, function() --[[ Line: 106 ]]
                -- upvalues: l_setBackNavigationDisabled_1 (copy), v21 (ref)
                l_setBackNavigationDisabled_1(false);
                v21.updateIsSignUpInProgress(false);
            end);
        end;
    end;
    v21.passwordTextBoxDidGainFocus = false;
    v21.textInputOnFocus = function() --[[ Line: 115 ]]
        -- upvalues: v21 (copy), v19 (ref)
        if not v21.passwordTextBoxDidGainFocus then
            v21.passwordTextBoxDidGainFocus = true;
            v21.props.authAnalytics.reportPasswordFocus(v19.Context.PasswordScreen);
        end;
    end;
    v21.renderWidget = function(v40) --[[ Line: 122 ]]
        -- upvalues: v21 (copy), v2 (ref), v14 (ref), v3 (ref), v13 (ref)
        local l_isSignUpInProgress_1 = v21.state.isSignUpInProgress;
        local v42 = v2.Dictionary.join(v40, {
            continueButtonActivated = v21.continueButtonActivated, 
            continueButtonActionInProgress = l_isSignUpInProgress_1, 
            continueButtonKey = "Authentication.SignUp.Action.CreateAccount", 
            textInputType = Enum.TextInputType.Password, 
            returnKeyType = Enum.ReturnKeyType.Done, 
            captureFocusOnMount = true, 
            textInputOnFocus = v21.textInputOnFocus, 
            validator = v14, 
            validatorAdditionalProps = {
                username = v21.props.selectedUsername
            }
        });
        return v3.createElement(v13, v42);
    end;
    v21.props.authAnalytics.reportScreenLoaded(v19.Context.PasswordScreen);
end;
v20.didMount = function(v43) --[[ Line: 145 ]] --[[ Name: didMount ]]
    v43.isMounted = true;
end;
v20.willUnmount = function(v44) --[[ Line: 149 ]] --[[ Name: willUnmount ]]
    v44.isMounted = false;
end;
v20.render = function(v45) --[[ Line: 153 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v12 (copy), v17 (copy)
    local l_isSignUpInProgress_2 = v45.state.isSignUpInProgress;
    return v3.createElement(v12, {
        titleTextKey = "Authentication.SignUp.Heading.PasswordPage", 
        paragraphTextKeys = {
            "Authentication.SignUp.Description.PasswordPage", 
            "Authentication.SignUp.Description.VerificationPage"
        }, 
        showDisclaimerLinks = true, 
        disablePageInteraction = l_isSignUpInProgress_2, 
        renderWidget = v45.renderWidget, 
        renderCharacter = function() --[[ Line: 165 ]] --[[ Name: renderCharacter ]]
            -- upvalues: v3 (ref), v17 (ref)
            return v3.createElement(v17);
        end
    });
end;
v20 = v4.connect(function(v47, _) --[[ Line: 171 ]]
    return {
        selectedUsername = v47.SignUpInfo.SignUpUsername, 
        formFactor = v47.FormFactor, 
        birthday = v47.SignUpInfo.SignUpBirthday
    };
end, function(v49) --[[ Line: 177 ]]
    -- upvalues: v16 (copy), v15 (copy), v11 (copy)
    return {
        storeSignUpPassword = function(v50, v51, v52) --[[ Line: 179 ]] --[[ Name: storeSignUpPassword ]]
            -- upvalues: v49 (copy), v16 (ref)
            return v49(v16(v50, v51, v52));
        end, 
        signUp = function(v53, v54, v55, v56, v57, v58, v59) --[[ Line: 182 ]] --[[ Name: signUp ]]
            -- upvalues: v49 (copy), v15 (ref)
            return v49(v15(v53, v54, v55, v56, v57, v58, v59));
        end, 
        setBackNavigationDisabled = function(v60) --[[ Line: 203 ]] --[[ Name: setBackNavigationDisabled ]]
            -- upvalues: v49 (copy), v11 (ref)
            return v49(v11(v60));
        end
    };
end)(v20);
v20 = l_RoactServices_0.connect({
    networking = v8, 
    guiService = l_AppGuiService_0, 
    authAnalytics = v6, 
    analytics = v10
})(v20);
return (l_RoactAppPolicy_0.connect(function(v61, _) --[[ Line: 216 ]]
    return {
        appPolicy = v61
    };
end)(v20));