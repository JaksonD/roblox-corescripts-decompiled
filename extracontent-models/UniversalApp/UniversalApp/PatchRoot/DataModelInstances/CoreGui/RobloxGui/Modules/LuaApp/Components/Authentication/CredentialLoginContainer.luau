local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Common_0 = l_Modules_0.Common;
local v3 = require(l_Common_0.Roact);
local v4 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v5 = require(l_Modules_0.LuaApp.Components.Authentication.CredentialLoginForm);
local l_GetFFlagEnableTextFieldContentType_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableTextFieldContentType;
local v7 = game:DefineFastFlag("DisableLoginOnEmptyUserOrPass", false);
local v8 = if v7 then require(l_Modules_0.LuaApp.Components.Authentication.Logger) else nil;
return function(v9) --[[ Line: 62 ]]
    -- upvalues: l_GetFFlagEnableTextFieldContentType_0 (copy), v4 (copy), v7 (copy), v8 (copy), v3 (copy), v5 (copy)
    local v10 = l_GetFFlagEnableTextFieldContentType_0() and Enum.TextInputType.Username or Enum.TextInputType.NoSuggestions;
    local function v11() --[[ Line: 66 ]]
        -- upvalues: v9 (copy), v4 (ref)
        if v9.loginButtonDisabled then
            return;
        elseif v9.isLoginInProgress then
            return;
        else
            v9.updateIsLoginInProgress(true);
            v9.authAnalytics.reportLogInButtonClicked(v4.Context.LoginScreen);
            v9.authAnalytics.reportAuthButtonClick(v4.Context.LoginForm, v4.Button.LogIn);
            v9.handleLoginWithFormDataCallback();
            return;
        end;
    end;
    local function v12() --[[ Line: 86 ]]
        -- upvalues: v9 (copy)
        spawn(function() --[[ Line: 87 ]]
            -- upvalues: v9 (ref)
            v9.cvalueRef.current:ReleaseFocus();
            v9.passwordRef.current:CaptureFocus();
        end);
    end;
    local function v15() --[[ Line: 93 ]]
        -- upvalues: v9 (copy), v7 (ref), v8 (ref), v11 (copy)
        v9.passwordRef.current:ReleaseFocus();
        if v7 then
            local v13 = v9.cvalueRef and v9.cvalueRef.current and v9.cvalueRef.current.Text;
            local v14 = v9.passwordRef and v9.passwordRef.current and v9.passwordRef.current.Text;
            if not v13 or v13 == "" or not v14 or v14 == "" then
                v8:warning("Login attempt skipped: empty credential or password field");
                return;
            end;
        end;
        v11();
    end;
    local v16 = false;
    local function v17() --[[ Line: 110 ]]
        -- upvalues: v16 (ref), v9 (copy), v4 (ref)
        if not v16 then
            v16 = true;
            v9.authAnalytics.reportUsernameFocus(v4.Context.LoginScreen);
            v9.authAnalytics.reportAuthFormInteraction(v4.Context.LoginForm, v4.Field.Username);
        end;
    end;
    local v18 = false;
    local function v19() --[[ Line: 122 ]]
        -- upvalues: v18 (ref), v9 (copy), v4 (ref)
        if not v18 then
            v18 = true;
            v9.authAnalytics.reportPasswordFocus(v4.Context.LoginScreen);
            v9.authAnalytics.reportAuthFormInteraction(v4.Context.LoginForm, v4.Field.Password);
        end;
    end;
    local function v21(v20) --[[ Line: 133 ]]
        -- upvalues: v9 (copy), v4 (ref)
        v9.authAnalytics.reportAuthButtonClick(v4.Context.LoginForm, v4.Button.ShowPassword, v20 and "show" or "hide");
        if v20 then
            v9.authAnalytics.reportShowPasswordButtonClicked(v4.Context.LoginScreen);
            return;
        else
            v9.authAnalytics.reportHidePasswordButtonClicked(v4.Context.LoginScreen);
            return;
        end;
    end;
    return v3.createElement(v5, {
        disableRegularLogin = v9.disableRegularLogin, 
        usernameTextInputType = v10, 
        crossDeviceLoginEnabled = v9.crossDeviceLoginEnabled, 
        loginWithExistingAccountVariantEnabled = v9.loginWithExistingAccountVariantEnabled, 
        quickLoginButtonText = v9.quickLoginButtonText, 
        cvalueText = v9.cvalueText, 
        passwordText = v9.passwordText, 
        onTextBoxesChanged = v9.onTextBoxesChanged, 
        onReturnPressedFromOnScreenKeyboardWhenFocusedOnCValue = v12, 
        onReturnPressedFromOnScreenKeyboardWhenFocusedOnPassword = v15, 
        cvalueTextBoxOnFocus = v17, 
        passwordTextBoxOnFocus = v19, 
        passwordVisibilityToggleCallback = v21, 
        buttonRef = v9.buttonRef, 
        cvalueRef = v9.cvalueRef, 
        passwordRef = v9.passwordRef, 
        loginButtonRef = v9.loginButtonRef, 
        forgotLinkRef = v9.forgotLinkRef, 
        crossDeviceButtonRef = v9.crossDeviceButtonRef, 
        emailOtpRef = v9.emailOtpRef, 
        localizedError = v9.localizedError, 
        localizedErrorMessage = v9.localizedErrorMessage, 
        forceLoginByUsername = v9.forceLoginByUsername, 
        showLinkAccountText = v9.showLinkAccountText, 
        showForgotButton = v9.showForgotButton, 
        onForgetButtonActivated = v9.onForgetButtonActivated, 
        onCrossDeviceLoginActivated = v9.onCrossDeviceLoginActivated, 
        loginButtonDisabled = v9.loginButtonDisabled, 
        isLoginInProgress = v9.isLoginInProgress, 
        onLoginButtonActivated = v11, 
        maxSizeX = v9.maxSizeX, 
        showDisclaimerLinks = v9.showDisclaimerLinks, 
        showDisclaimerButtons = v9.showDisclaimerButtons, 
        showCredentialHeader = v9.showCredentialHeader, 
        isDualLayout = v9.isDualLayout, 
        isTenFootUiMode = v9.isTenFootUiMode, 
        onEmailOtpActivated = v9.onEmailOtpActivated, 
        emailOtpEnabled = v9.emailOtpEnabled
    });
end;