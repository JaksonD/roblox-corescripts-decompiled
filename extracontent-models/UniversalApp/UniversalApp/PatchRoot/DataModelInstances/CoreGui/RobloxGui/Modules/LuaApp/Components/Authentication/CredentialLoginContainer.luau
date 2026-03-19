local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Common_0 = l_Modules_0.Common;
local v3 = require(l_Common_0.Roact);
local v4 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v5 = require(l_Modules_0.LuaApp.Components.Authentication.CredentialLoginForm);
local l_GetFFlagEnableTextFieldContentType_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableTextFieldContentType;
return function(v7) --[[ Line: 56 ]]
    -- upvalues: l_GetFFlagEnableTextFieldContentType_0 (copy), v4 (copy), v3 (copy), v5 (copy)
    local v8 = l_GetFFlagEnableTextFieldContentType_0() and Enum.TextInputType.Username or Enum.TextInputType.NoSuggestions;
    local function v9() --[[ Line: 60 ]]
        -- upvalues: v7 (copy), v4 (ref)
        if v7.loginButtonDisabled then
            return;
        elseif v7.isLoginInProgress then
            return;
        else
            v7.updateIsLoginInProgress(true);
            v7.authAnalytics.reportLogInButtonClicked(v4.Context.LoginScreen);
            v7.authAnalytics.reportAuthButtonClick(v4.Context.LoginForm, v4.Button.LogIn);
            v7.handleLoginWithFormDataCallback();
            return;
        end;
    end;
    local function v10() --[[ Line: 80 ]]
        -- upvalues: v7 (copy)
        spawn(function() --[[ Line: 81 ]]
            -- upvalues: v7 (ref)
            v7.cvalueRef.current:ReleaseFocus();
            v7.passwordRef.current:CaptureFocus();
        end);
    end;
    local function v11() --[[ Line: 87 ]]
        -- upvalues: v7 (copy), v9 (copy)
        v7.passwordRef.current:ReleaseFocus();
        v9();
    end;
    local v12 = false;
    local function v13() --[[ Line: 94 ]]
        -- upvalues: v12 (ref), v7 (copy), v4 (ref)
        if not v12 then
            v12 = true;
            v7.authAnalytics.reportUsernameFocus(v4.Context.LoginScreen);
            v7.authAnalytics.reportAuthFormInteraction(v4.Context.LoginForm, v4.Field.Username);
        end;
    end;
    local v14 = false;
    local function v15() --[[ Line: 106 ]]
        -- upvalues: v14 (ref), v7 (copy), v4 (ref)
        if not v14 then
            v14 = true;
            v7.authAnalytics.reportPasswordFocus(v4.Context.LoginScreen);
            v7.authAnalytics.reportAuthFormInteraction(v4.Context.LoginForm, v4.Field.Password);
        end;
    end;
    local function v17(v16) --[[ Line: 117 ]]
        -- upvalues: v7 (copy), v4 (ref)
        v7.authAnalytics.reportAuthButtonClick(v4.Context.LoginForm, v4.Button.ShowPassword, v16 and "show" or "hide");
        if v16 then
            v7.authAnalytics.reportShowPasswordButtonClicked(v4.Context.LoginScreen);
            return;
        else
            v7.authAnalytics.reportHidePasswordButtonClicked(v4.Context.LoginScreen);
            return;
        end;
    end;
    return v3.createElement(v5, {
        disableRegularLogin = v7.disableRegularLogin, 
        usernameTextInputType = v8, 
        crossDeviceLoginEnabled = v7.crossDeviceLoginEnabled, 
        loginWithExistingAccountVariantEnabled = v7.loginWithExistingAccountVariantEnabled, 
        quickLoginButtonText = v7.quickLoginButtonText, 
        cvalueText = v7.cvalueText, 
        passwordText = v7.passwordText, 
        onTextBoxesChanged = v7.onTextBoxesChanged, 
        onReturnPressedFromOnScreenKeyboardWhenFocusedOnCValue = v10, 
        onReturnPressedFromOnScreenKeyboardWhenFocusedOnPassword = v11, 
        cvalueTextBoxOnFocus = v13, 
        passwordTextBoxOnFocus = v15, 
        passwordVisibilityToggleCallback = v17, 
        buttonRef = v7.buttonRef, 
        cvalueRef = v7.cvalueRef, 
        passwordRef = v7.passwordRef, 
        loginButtonRef = v7.loginButtonRef, 
        forgotLinkRef = v7.forgotLinkRef, 
        crossDeviceButtonRef = v7.crossDeviceButtonRef, 
        emailOtpRef = v7.emailOtpRef, 
        localizedError = v7.localizedError, 
        localizedErrorMessage = v7.localizedErrorMessage, 
        forceLoginByUsername = v7.forceLoginByUsername, 
        showLinkAccountText = v7.showLinkAccountText, 
        showForgotButton = v7.showForgotButton, 
        onForgetButtonActivated = v7.onForgetButtonActivated, 
        onCrossDeviceLoginActivated = v7.onCrossDeviceLoginActivated, 
        loginButtonDisabled = v7.loginButtonDisabled, 
        isLoginInProgress = v7.isLoginInProgress, 
        onLoginButtonActivated = v9, 
        maxSizeX = v7.maxSizeX, 
        showDisclaimerLinks = v7.showDisclaimerLinks, 
        showDisclaimerButtons = v7.showDisclaimerButtons, 
        showCredentialHeader = v7.showCredentialHeader, 
        isDualLayout = v7.isDualLayout, 
        isTenFootUiMode = v7.isTenFootUiMode, 
        onEmailOtpActivated = v7.onEmailOtpActivated, 
        emailOtpEnabled = v7.emailOtpEnabled
    });
end;