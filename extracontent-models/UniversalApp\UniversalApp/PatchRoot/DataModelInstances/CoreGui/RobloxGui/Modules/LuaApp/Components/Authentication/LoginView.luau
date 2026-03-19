local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v9 = require(l_CorePackages_0.Packages.Cryo);
local l_Common_0 = l_Modules_0.Common;
local v11 = require(l_Common_0.Roact);
local v12 = require(l_Common_0.RoactRodux);
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v16 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v18 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v19 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v20 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_GetPasswordManagerUsageStore_0 = v20.Stores.GetPasswordManagerUsageStore;
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v24 = require(l_Modules_0.LuaApp.AppPage);
local v25 = require(l_Modules_0.LuaApp.Thunks.Authentication.Login);
local v26 = require(l_Modules_0.LuaApp.Thunks.Authentication.LoginByCode);
local v27 = require(l_Modules_0.LuaApp.Thunks.Authentication.LoginByPasskey);
local v28 = require(l_Modules_0.LuaApp.Thunks.Authentication.LoginByOtp);
local v29 = require(l_Modules_0.LuaApp.Models.Authentication.LoginResult);
local v30 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v31 = require(l_Modules_0.LuaApp.Thunks.Authentication.StartPasskeyAuthentication);
local v32 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v33 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLoginPasswordResetPrompt);
local v34 = require(l_Modules_0.LuaApp.Actions.Authentication.SetLoginResult);
local v35 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v36 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v37 = require(l_Modules_0.LuaApp.Thunks.Authentication.CrossDeviceLogin);
local v38 = require(l_Modules_0.LuaApp.Components.Authentication.DisclaimerLinks);
local v39 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSelector);
local v40 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v41 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenEmailOtp);
local v42 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v43 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v44 = require(l_Modules_0.LuaApp.Http.Requests.AuthCanVerifyCredentials);
local v45 = require(l_Modules_0.LuaApp.Http.Requests.GetIXPLayerParameters);
local v46 = require(l_Modules_0.LuaApp.Components.Authentication.LogoWithContentsLayout);
local v47 = require(l_Modules_0.LuaApp.Components.Authentication.DualLoginWithContentsLayout);
local l_isStringEmail_0 = v20.Utils.isStringEmail;
local l_isStringPhone_0 = v20.Utils.isStringPhone;
local l_enrolledInLuafiedRecoveryExperiment_0 = v20.Experiments.enrolledInLuafiedRecoveryExperiment;
local v51 = require(l_Modules_0.LuaApp.Util.Base64);
local v52 = require(l_Modules_0.LuaApp.Components.Authentication.CredentialLoginContainer);
local v53 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodePrompt);
local v54 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v55 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodes);
local v56 = require(l_Modules_0.LuaApp.Enum.Alignment);
local l_LocalStorageKey_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey;
local v58 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v59 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v60 = require(l_Modules_0.LuaApp.Enum.CredentialType);
local v61 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v61.Style.withStyle;
local v63 = require(l_Modules_0.LuaApp.withLocalization);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v65 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v66 = require(l_Modules_0.LuaApp.Analytics.Events.AppLoginCounterNames);
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local v68 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v69 = require(l_Modules_0.LuaApp.Constants);
local l_AccountSwitcherConstants_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Common.AccountSwitcherConstants;
local v71 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local l_LinkButton_0 = v61.App.Button.LinkButton;
local v73 = require(l_Modules_0.LuaApp.FlagSettings);
local v74 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v75 = require(l_Modules_0.LuaApp.Enum.Challenge.Type);
local v76 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppWaitBeforeTwoStepRenderDev);
local v77 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDev);
local v78 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin);
local v79 = require(l_Modules_0.LuaApp.Thunks.Challenge.RenderChallenge);
local v80 = require(l_Modules_0.LuaApp.Http.Requests.TwoStepRequests);
local v81 = require(l_Modules_0.LuaApp.Thunks.Authentication.AccountSwitcher.LogoutAllLoggedInUsers);
local v82 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetAppState);
local v83 = require(l_Modules_0.LuaApp.Enum.Challenge.TwoStepVerification.ActionType);
local l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0 = v74.GetFFlagLuaAppEnableDesktopDualLoginABTest;
local v85 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLoginAccountSelector);
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v87 = require(l_Modules_0.LuaApp.Flags.GetFIntLoginViewBottomPaddingPx);
local v88 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableOtpEmailLogin);
local v89 = require(l_Modules_0.LuaApp.Flags.GetFFlagShouldUsePeekViewForLoginDisambiguation);
local v90 = require(l_Modules_0.LuaApp.Flags.GetFFlagShouldEnableOtpDisambiguationPeekViewFix);
local v91 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCredentialsProtocolPasswords);
local v92 = require(l_Modules_0.LuaApp.Flags.GetFFlagAuthIntentLoggingAtLoginEnabled);
local v93 = require(l_Modules_0.LuaApp.Flags.GetFFlagAlwaysSaveCredentialsAfter2Sv);
local v94 = require(l_Modules_0.LuaApp.Flags.GetFFlagReportCrossAppLoginAttempt);
local l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 = v74.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues;
local l_FFlagPasswordManagerAwaitEnabled_0 = v74.FFlagPasswordManagerAwaitEnabled;
local l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 = v74.FFlagEnableCredentialsV2InterfaceDetectionFix;
local v98 = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV1", false);
local v99 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol);
local l_Constants_0 = v99.Constants;
local l_default_0 = v99.CredentialsProtocol.default;
local l_CredentialsProtocolErrorCodes_0 = v99.CredentialsProtocolErrorCodes;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v107 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v108 = require(l_Modules_0.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore);
local v109 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSwitchingErrorOverlay);
local v110 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v111 = require(l_Modules_0.LuaApp.Flags.FFlagEnableKoreaKISACompliance);
local v112 = require(l_Modules_0.LuaApp.Flags.FFlagLuaEnableDidSwitchAccount);
local v113 = game:DefineFastFlag("AwaitLoginCompletionForDisambiguationFlow", false);
game:DefineFastFlag("LuaLoginManualCredentialValidation", false);
game:DefineFastFlag("EnablePlayerAppLoginPageExperiments", false);
local v114 = game:DefineFastFlag("EnableLoginV1RegisterCredentialsFix", false);
local l_FFlagEnablePasskeyLoginErrorLogging_0 = v74.FFlagEnablePasskeyLoginErrorLogging;
local l_FFlagUseErrorTypeForPasskeyLoginLogging_0 = v74.FFlagUseErrorTypeForPasskeyLoginLogging;
local l_FFlagAuthSecExclusions_0 = v74.FFlagAuthSecExclusions;
local l_FFlagEnablePWManagerLoginCheck_0 = v74.FFlagEnablePWManagerLoginCheck;
local l_FFlagEnableAuthDeepLinkReceiver_0 = v74.FFlagEnableAuthDeepLinkReceiver;
local l_PreAuthDeepLinkUrlStore_0 = v20.Stores.PreAuthDeepLinkUrlStore;
local v121 = require(script.Parent.Parent.Parent.Thunks.Authentication.User);
local v122 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v124 = require(l_CorePackages_0.Packages.Promise);
local v125 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVNGNewAppAvailableModal);
local v126 = require(l_Modules_0.LuaApp.Flags.GetFStringVNGDownloadNowUrl);
local v127 = game:DefineFastFlag("FixLoginSelection", false);
local v128 = require(l_Modules_0.LuaApp.Flags.FFlagEnableVNGDUARSignupCompliance);
local l_GetFFlagEnableAccountSwitcherFoundationDesign_0 = v74.GetFFlagEnableAccountSwitcherFoundationDesign;
local v130 = require(l_Modules_0.LuaApp.Flags.FFlagEnableIosKeychainLoginLua);
local l_GetUserByUsername_0 = v20.Thunks.GetUserByUsername;
local l_withNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).withNavigationProps;
local l_KeystoreConstants_0 = v20.Common.KeystoreConstants;
local l_KeystoreAnalyticsEvents_0 = v20.Analytics.KeystoreAnalyticsEvents;
local l_KeystoreEventConstants_0 = v20.Analytics.KeystoreEventConstants;
local l_AccountLinkingAlertType_0 = v20.Enums.AccountLinkingAlertType;
local l_TwoStepErrorCodes_0 = v20.Enums.TwoStepErrorCodes;
local l_getTwoStepLoginErrorKey_0 = v20.Utils.getTwoStepLoginErrorKey;
local v139 = game:DefineFastFlag("LoginButtonAutoDisabled", false);
local v140 = game:DefineFastFlag("EnableTwoStepLoginChallengeAnalytics", false);
local v141 = game:DefineFastFlag("DebugOTPBypass", false);
local l_GetFFlagBypassKeystoreLoginIxpV2_0 = v74.GetFFlagBypassKeystoreLoginIxpV2;
local l_GetFFlagEnableLuafiedRecoveryFlow_0 = v74.GetFFlagEnableLuafiedRecoveryFlow;
local l_FFlagDisableMemStorageServicePasswordEvent_0 = v74.FFlagDisableMemStorageServicePasswordEvent;
local l_FFlagEnableLoginV1ForcedUsernameOverride_0 = v74.FFlagEnableLoginV1ForcedUsernameOverride;
local l_GetFFlagKeystoreAutoLoginAvailable_0 = v74.GetFFlagKeystoreAutoLoginAvailable;
local l_GetFFlagCheckIsAvailableForKeystoreOperations_0 = v74.GetFFlagCheckIsAvailableForKeystoreOperations;
local l_GetFFlagEnable2SVRecovery_0 = require(l_CorePackages_0.Workspace.Packages.AccountRecovery).Flags.GetFFlagEnable2SVRecovery;
local v149 = require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeFeature);
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local l_PasskeyConstants_0 = v20.Common.PasskeyConstants;
local v152 = v11.PureComponent:extend("LoginView");
local v153 = v87();
local v154 = {
    CValue = 1, 
    Password = 2
};
v152.init = function(v155) --[[ Line: 209 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), v127 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), v110 (copy), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (copy), l_FFlagEnablePWManagerLoginCheck_0 (copy), l_GetPasswordManagerUsageStore_0 (copy), v55 (copy), v154 (copy), v121 (copy), v107 (copy), l_MemStorageService_0 (copy), v58 (copy), l_UserInputService_0 (copy), v44 (copy), v65 (copy), v66 (copy), l_HttpService_0 (copy), v51 (copy), l_default_0 (copy), l_Logger_0 (copy), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (copy), l_CredentialsProtocolErrorCodes_0 (copy), v68 (copy), l_PasskeyConstants_0 (copy), l_FFlagEnablePasskeyLoginErrorLogging_0 (copy), v88 (copy), v75 (copy), v76 (copy), v77 (copy), v140 (copy), v83 (copy), l_GetFFlagEnable2SVRecovery_0 (copy), v80 (copy), v93 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (copy), v91 (copy), l_FFlagPasswordManagerAwaitEnabled_0 (copy), v98 (copy), l_TwoStepErrorCodes_0 (copy), l_getTwoStepLoginErrorKey_0 (copy), l_AccountLinkingAlertType_0 (copy), l_isStringEmail_0 (copy), l_isStringPhone_0 (copy), v113 (copy), v90 (copy), v89 (copy), v124 (copy), v130 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (copy), l_ContentProvider_0 (copy), l_GetUserByUsername_0 (copy), v108 (copy), l_KeystoreConstants_0 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (copy), v29 (copy), v149 (copy), v85 (copy), l_Constants_0 (copy), v114 (copy), v81 (copy), l_GuiService_0 (copy), v78 (copy), l_StatusCodes_0 (copy), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (copy), v69 (copy), v60 (copy), v125 (copy), v126 (copy), l_GetFFlagEnableLuafiedRecoveryFlow_0 (copy), l_enrolledInLuafiedRecoveryExperiment_0 (copy), v24 (copy), v54 (copy), v94 (copy), l_RbxAnalyticsService_0 (copy)
    v155.cvalueRef = v11.createRef();
    v155.passwordRef = v11.createRef();
    v155.loginButtonRef = v11.createRef();
    v155.forgotLinkRef = v11.createRef();
    v155.crossDeviceButtonRef = v11.createRef();
    v155.emailOtpRef = v11.createRef();
    if v127 then
        v155.focusRef = v11.createRef();
    end;
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(l_LocalStorageKey_0.CredentialValue);
    if v110 then
        local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem(l_LocalStorageKey_0.AccountBlob);
        if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
            l_l_AppStorageService_0_Item_0 = "";
        end;
    end;
    if l_FFlagEnableLoginV1ForcedUsernameOverride_0 and v155.props.forcedUsernameOverride then
        l_l_AppStorageService_0_Item_0 = v155.props.forcedUsernameOverride;
    end;
    local v158, v159 = v11.createBinding(l_l_AppStorageService_0_Item_0);
    v155.cvalueText = v158;
    v155.updateCValueText = v159;
    v158, v159 = v11.createBinding("");
    v155.passwordText = v158;
    v155.updatePasswordText = v159;
    v155.state = {
        errorKey = "", 
        localizedErrorMessage = nil, 
        errorCode = -1, 
        loginButtonDisabled = true, 
        isLoginInProgress = false, 
        forceLoginByUsername = false, 
        forgotLinkFocused = false, 
        quickLoginButtonTextOverride = "", 
        isDesktopDualLoginEnabled = false, 
        isLoginByOtp = false, 
        otpSessionToken = "", 
        otpCode = "", 
        isCredentialsProtocolRegisterPasswordAvailable = false
    };
    v155.passwordManagerUsageStore = if l_FFlagEnablePWManagerLoginCheck_0 then l_GetPasswordManagerUsageStore_0(false) else nil;
    if v155.passwordManagerUsageStore then
        v155.passwordManagerUsageStore.setLoggedinUsingSavedPassword(false);
        v155.passwordManagerUsageStore.setSavedPasswordAfterLogin(false);
    end;
    v155.errorHandlingInfoList = {
        [v55.IncorrectCValueOrPassword] = {
            textBoxesToClear = {
                v154.Password
            }, 
            newFocusedTextBox = v154.Password
        }, 
        [v55.CValueAndPasswordRequired] = {
            textBoxesToClear = {
                v154.Password
            }, 
            newFocusedTextBox = v154.Password
        }, 
        [v55.AccountLocked] = {
            textBoxesToClear = {
                v154.Password
            }
        }, 
        [v55.MoreThanOneUsername] = {
            textBoxesToClear = {
                v154.CValue, 
                v154.Password
            }, 
            newFocusedTextBox = v154.CValue, 
            forceLoginByUsername = true
        }, 
        [v55.AccountNotVerified] = {
            textBoxesToClear = {
                v154.CValue, 
                v154.Password
            }, 
            forceLoginByUsername = true
        }, 
        [v55.MultipleUsersPerCredential] = if v155.props.appPolicy.getAccountDisambiguationDisabled() then {
            textBoxesToClear = {
                v154.CValue, 
                v154.Password
            }, 
            newFocusedTextBox = v154.CValue, 
            forceLoginByUsername = true
        } else nil
    };
    v155.isAlreadyAuthenticated = v121.fromLocalStorage().userId ~= -1;
    resetDefaultTheme = function() --[[ Line: 293 ]]
        -- upvalues: v107 (ref), l_MemStorageService_0 (ref), v58 (ref)
        local v160 = v107.getAuthenticatedTheme();
        if v160 ~= "" then
            l_MemStorageService_0:Fire(v58.ThemeUpdate, v160);
        end;
    end;
    v155.updateIsLoginInProgress = function(v161) --[[ Line: 300 ]]
        -- upvalues: v155 (copy)
        spawn(function() --[[ Line: 301 ]]
            -- upvalues: v155 (ref), v161 (copy)
            local l_isLoginInProgress_0 = v155.state.isLoginInProgress;
            if v155.isMounted and l_isLoginInProgress_0 ~= v161 then
                v155:setState({
                    isLoginInProgress = v161
                });
            end;
        end);
    end;
    v155.onTextBoxesChanged = function(v163) --[[ Line: 311 ]]
        -- upvalues: v155 (copy)
        if not v155.cvalueRef.current or not v155.passwordRef.current or not v155.isMounted then
            return;
        else
            local v164 = v163.Text:gsub("\t", "");
            if v163.Text ~= v164 then
                v163.Text = v164;
            end;
            local l_v155_0 = v155;
            local v166 = {};
            local v167 = true;
            if #v155.cvalueRef.current.Text ~= 0 then
                v167 = #v155.passwordRef.current.Text == 0;
            end;
            v166.loginButtonDisabled = v167;
            v166.errorKey = #v163.Text == 0 and v155.state.errorKey or "";
            v166.errorCode = -1;
            l_v155_0:setState(v166);
            return;
        end;
    end;
    v155.unfocusTextBoxes = function() --[[ Line: 329 ]]
        -- upvalues: l_UserInputService_0 (ref), v155 (copy)
        local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
        if l_l_UserInputService_0_FocusedTextBox_0 and (l_l_UserInputService_0_FocusedTextBox_0 == v155.cvalueRef.current or l_l_UserInputService_0_FocusedTextBox_0 == v155.passwordRef.current) then
            l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
        end;
    end;
    v155.handleCaptchaResult = function(v169, v170) --[[ Line: 338 ]]
        -- upvalues: v155 (copy)
        if v169 then
            v155.handleLoginWithFormData(v170);
            return;
        else
            v155.updateIsLoginInProgress(false);
            return;
        end;
    end;
    v155.getCaptchaResultHandlerWithCode = function(v171, v172) --[[ Line: 346 ]]
        -- upvalues: v155 (copy)
        return function(v173, v174) --[[ Line: 347 ]]
            -- upvalues: v155 (ref), v171 (copy), v172 (copy)
            if v173 then
                v155.handleLoginWithCode(v171, v172, v174);
                return;
            else
                v155.updateIsLoginInProgress(false);
                return;
            end;
        end;
    end;
    v155.getSecurityQuestionsLoginWithCodeCallback = function(v175, v176) --[[ Line: 356 ]]
        -- upvalues: v155 (copy)
        return function(v177) --[[ Line: 357 ]]
            -- upvalues: v155 (ref), v175 (copy), v176 (copy)
            v155.handleLoginWithCode(v175, v176, nil, v177);
        end;
    end;
    v155.getSecurityQuestionsLoginWithOtpCallback = function() --[[ Line: 362 ]]
        -- upvalues: v155 (copy)
        return function(v178) --[[ Line: 363 ]]
            -- upvalues: v155 (ref)
            v155.handleLoginWithOtp(v178, nil);
        end;
    end;
    v155.getSecurityQuestionsLoginWithFormDataCallback = function() --[[ Line: 368 ]]
        -- upvalues: v155 (copy)
        return function(v179) --[[ Line: 369 ]]
            -- upvalues: v155 (ref)
            v155.handleLoginWithFormData(nil, v179);
        end;
    end;
    v155.canVerifyCredentials = function(v180, v181, v182) --[[ Line: 374 ]]
        -- upvalues: v44 (ref), v155 (copy)
        return v44(v155.props.networking, v180, v181, v182):andThen(function(v183) --[[ Line: 376 ]]
            return v183 and v183.responseBody and v183.responseBody.canSend;
        end, function() --[[ Line: 379 ]]
            return false;
        end);
    end;
    v155.handleLoginWithCode = function(v184, v185, v186, v187) --[[ Line: 385 ]]
        -- upvalues: v155 (copy), v55 (ref), v65 (ref), v66 (ref)
        v155.updateIsLoginInProgress(true);
        local l_setBackNavigationDisabled_0 = v155.props.setBackNavigationDisabled;
        v155.unfocusTextBoxes();
        l_setBackNavigationDisabled_0(true);
        local l_loginByCode_0 = v155.props.loginByCode;
        local v190 = v155.getCaptchaResultHandlerWithCode(v184, v185);
        local v191 = v155.getSecurityQuestionsLoginWithCodeCallback(v184, v185);
        return l_loginByCode_0(v155.props.networking, v184, v185, v190, v186, v191, v187):andThen(function(v192) --[[ Line: 406 ]]
            -- upvalues: v155 (ref)
            v155.handleLoginResult(v192, nil);
        end, function(v193) --[[ Line: 408 ]]
            -- upvalues: v55 (ref), v65 (ref), v66 (ref), v155 (ref), v184 (copy), v185 (copy)
            if v193.errorCode ~= v55.Captcha then
                v65(v66.FailureAuthCode, 1);
            end;
            v155.handleLoginError(v193, v184, v185);
        end);
    end;
    v155.handleLoginWithPasskey = function(v194, v195) --[[ Line: 416 ]]
        -- upvalues: v155 (copy)
        v155.updateIsLoginInProgress(true);
        local l_setBackNavigationDisabled_1 = v155.props.setBackNavigationDisabled;
        v155.unfocusTextBoxes();
        l_setBackNavigationDisabled_1(true);
        return v155.props.loginByPasskey(v155.props.networking, v194, v195):andThen(function(v197) --[[ Line: 424 ]]
            -- upvalues: v155 (ref)
            v155.handleLoginResult(v197, nil);
        end, function(v198) --[[ Line: 426 ]]
            -- upvalues: v155 (ref), v194 (copy)
            v155.handleLoginError(v198, v194);
        end);
    end;
    v155.showPasskeyLoginPopup = function() --[[ Line: 431 ]]
        -- upvalues: v155 (copy), l_HttpService_0 (ref), l_UserInputService_0 (ref), v51 (ref), l_default_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), v68 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref)
        local l_networking_0 = v155.props.networking;
        return v155.props.startPasskeyAuthentication(l_networking_0):andThen(function(v200) --[[ Line: 434 ]]
            -- upvalues: l_HttpService_0 (ref), l_UserInputService_0 (ref), v51 (ref), l_default_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), v155 (ref), v68 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref)
            local v201 = l_HttpService_0:JSONDecode(v200.authenticationOptions);
            local l_sessionId_0 = v200.sessionId;
            local v203 = tonumber(v201.publicKey.timeout);
            v201.keyType = "platform";
            v201.deviceBoundOnly = true;
            if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                v201.publicKey.challenge = v51.FromUrlSafeBase64(v201.publicKey.challenge);
            end;
            local v204 = l_HttpService_0:JSONEncode(v201);
            l_default_0:getCredentials(l_default_0.CredentialsTypes.FIDO2, v204, v203):andThen(function(v205) --[[ Line: 451 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), v155 (ref), v68 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), v51 (ref), l_sessionId_0 (copy)
                local v206 = l_HttpService_0:JSONDecode(v205);
                if v206 == nil or next(v206) == nil then
                    l_Logger_0:info("Passkey credential signing failed. No result returned.");
                    return;
                else
                    if v206.errorCode ~= nil then
                        l_Logger_0:info("Passkey credential signing failed. Error {} (msg: {}) returned.", v206.errorCode, v206.errorMsg);
                        if l_FFlagUseErrorTypeForPasskeyLoginLogging_0 then
                            local v207 = tonumber(v206.errorCode);
                            local v208 = l_CredentialsProtocolErrorCodes_0.GetCredentialsErrorCodes[v207 or -1] or string.format(l_CredentialsProtocolErrorCodes_0.UNMAPPED_ERROR_CODE, (tostring(v206.errorCode)));
                            v155.props.authAnalytics.reportAuthClientError(v68.Context.PasskeyLoginAttempt, v208, l_PasskeyConstants_0.PASSKEY_FETCH_LOGIN_V1);
                            return;
                        elseif l_FFlagEnablePasskeyLoginErrorLogging_0 and type(v206.errorMsg) == "string" then
                            v155.props.authAnalytics.reportAuthClientError(v68.Context.PasskeyLoginAttempt, v206.errorMsg, l_PasskeyConstants_0.PASSKEY_FETCH_LOGIN_V1);
                            return;
                        end;
                    else
                        l_Logger_0:info("Passkey credential signing completed. Attempting login.");
                        v206.id = v51.ToUrlSafeBase64(v206.id);
                        v206.rawId = v51.ToUrlSafeBase64(v206.rawId);
                        v206.response.signature = v51.ToUrlSafeBase64(v206.response.signature);
                        v206.response.userHandle = v51.ToUrlSafeBase64(v206.response.userHandle);
                        v206.response.authenticatorData = v51.ToUrlSafeBase64(v206.response.authenticatorData);
                        v206.response.clientDataJSON = v51.ToUrlSafeBase64(v206.response.clientDataJSON);
                        v155.handleLoginWithPasskey(v206, l_sessionId_0);
                    end;
                    return;
                end;
            end, function(v209) --[[ Line: 498 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Passkey credential signing failed. Error: {}", v209);
            end);
        end, function(v210) --[[ Line: 502 ]]
            -- upvalues: l_Logger_0 (ref)
            l_Logger_0:warning("Fetching passkey login options failed with error code: {}", v210.errorCode);
        end);
    end;
    v155.showGenericCredentialLoginPopup = function(v211, v212) --[[ Line: 507 ]]
        -- upvalues: v155 (copy), l_HttpService_0 (ref), l_UserInputService_0 (ref), v51 (ref), l_Logger_0 (ref), l_default_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), v68 (ref), l_PasskeyConstants_0 (ref)
        if not v211 and not v212 then
            return;
        else
            local l_networking_1 = v155.props.networking;
            local l_startPasskeyAuthentication_0 = v155.props.startPasskeyAuthentication;
            local v215 = nil;
            local v216 = nil;
            local v217 = nil;
            local v218 = {};
            if v211 then
                l_startPasskeyAuthentication_0(l_networking_1):andThen(function(v219) --[[ Line: 519 ]]
                    -- upvalues: v215 (ref), l_HttpService_0 (ref), v216 (ref), v217 (ref), l_UserInputService_0 (ref), v51 (ref)
                    v215 = l_HttpService_0:JSONDecode(v219.authenticationOptions);
                    v216 = v219.sessionId;
                    v217 = tonumber(v215.publicKey.timeout);
                    v215.keyType = "platform";
                    v215.deviceBoundOnly = true;
                    if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                        v215.publicKey.challenge = v51.FromUrlSafeBase64(v215.publicKey.challenge);
                    end;
                end, function(v220) --[[ Line: 533 ]]
                    -- upvalues: l_Logger_0 (ref)
                    l_Logger_0:warning("Fetching passkey login options failed with error code: {}", v220.errorCode);
                end):await();
                if v215 ~= nil then
                    v218.FIDO2 = v215;
                end;
            end;
            if v212 then
                v218.password = {};
            end;
            local v221 = l_HttpService_0:JSONEncode(v218);
            return l_default_0:getCredentials(l_default_0.CredentialsTypes.all, v221, v217 / 1000):andThen(function(v222) --[[ Line: 550 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), v155 (ref), v68 (ref), l_PasskeyConstants_0 (ref), l_default_0 (ref), v51 (ref), v216 (ref)
                local v223 = l_HttpService_0:JSONDecode(v222);
                if v223 == nil or not v223.response and not v223.errorCode then
                    l_Logger_0:info("Generic credential fetch failed. No result returned.");
                    return;
                else
                    if v223.errorCode ~= nil then
                        l_Logger_0:info("Generic credential fetch failed. Error {} (msg: {}) returned.", v223.errorCode, v223.errorMsg);
                        if l_FFlagEnablePasskeyLoginErrorLogging_0 and type(v223.errorMsg) == "string" then
                            v155.props.authAnalytics.reportAuthClientError(v68.Context.PasskeyLoginAttempt, v223.errorMsg, l_PasskeyConstants_0.GENERIC_CREDENTIAL_FETCH_LOGIN_V1);
                            return;
                        end;
                    elseif v223.credentialType == l_default_0.CredentialsTypes.password then
                        local l_username_0 = v223.response.username;
                        local l_password_0 = v223.response.password;
                        v155.updateCValueText(l_username_0);
                        v155.updatePasswordText(l_password_0);
                        v155.props.authAnalytics.reportAuthButtonClick(v68.Context.CMPasswordLogin, v68.Button.SelectPassword);
                        v155.updateIsLoginInProgress(true);
                        v155.handleLoginWithFormData(nil, nil, nil, true);
                        return;
                    elseif v223.credentialType == l_default_0.CredentialsTypes.FIDO2 then
                        v223.response.id = v51.ToUrlSafeBase64(v223.response.id);
                        v223.response.rawId = v51.ToUrlSafeBase64(v223.response.rawId);
                        v223.response.response.signature = v51.ToUrlSafeBase64(v223.response.response.signature);
                        v223.response.response.userHandle = v51.ToUrlSafeBase64(v223.response.response.userHandle);
                        v223.response.response.authenticatorData = v51.ToUrlSafeBase64(v223.response.response.authenticatorData);
                        v223.response.response.clientDataJSON = v51.ToUrlSafeBase64(v223.response.response.clientDataJSON);
                        v155.handleLoginWithPasskey(v223.response, v216);
                    end;
                    return;
                end;
            end, function(v226) --[[ Line: 598 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Generic credential signing failed. Error: {}", v226);
            end);
        end;
    end;
    v155.handleLoginWithOtp = function(v227, v228) --[[ Line: 603 ]]
        -- upvalues: v88 (ref), v155 (copy)
        if not v88() and v155.props.isLoginWithOtpEnabled then
            return;
        else
            v155.updateIsLoginInProgress(true);
            local l_setBackNavigationDisabled_2 = v155.props.setBackNavigationDisabled;
            v155.unfocusTextBoxes();
            l_setBackNavigationDisabled_2(true);
            local l_loginByOtp_0 = v155.props.loginByOtp;
            local v231 = v155.getSecurityQuestionsLoginWithOtpCallback();
            return l_loginByOtp_0(v155.props.networking, v155.state.otpSessionToken, v155.state.otpCode, v231, v227, v228):andThen(function(v232) --[[ Line: 626 ]]
                -- upvalues: v155 (ref)
                v155.handleLoginResult(v232, nil);
            end, function(v233) --[[ Line: 628 ]]
                -- upvalues: v155 (ref)
                v155.handleLoginError(v233, v155.state.otpSessionToken, v155.state.otpCode);
                return v233.errorKey;
            end);
        end;
    end;
    v155.validateFormCredentials = function(v234) --[[ Line: 634 ]]
        return #v234:gsub("%s+", "") > 0;
    end;
    v155.handleLoginWithFormData = function(v235, v236, v237, v238) --[[ Line: 638 ]]
        -- upvalues: v155 (copy), v55 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), v68 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), l_HttpService_0 (ref)
        if not v155.cvalueRef.current or not v155.passwordRef.current then
            return;
        else
            local l_Text_0 = v155.cvalueRef.current.Text;
            local l_Text_1 = v155.passwordRef.current.Text;
            if game:GetFastFlag("LuaLoginManualCredentialValidation") and not v155.validateFormCredentials(l_Text_0) then
                v155.handleLoginError({
                    errorKey = "Authentication.Login.Response.IncorrectUsernamePassword", 
                    errorCode = v55.IncorrectCValueOrPassword
                }, l_Text_0, l_Text_1);
                v155.updateCValueText("");
                return;
            else
                local l_setBackNavigationDisabled_3 = v155.props.setBackNavigationDisabled;
                v155.unfocusTextBoxes();
                l_setBackNavigationDisabled_3(true);
                local l_login_0 = v155.props.login;
                local l_handleCaptchaResult_0 = v155.handleCaptchaResult;
                return l_login_0(v155.props.networking, l_Text_0, l_Text_1, l_handleCaptchaResult_0, v235, v155.getSecurityQuestionsLoginWithFormDataCallback(), v236, v237, v155.state.forceLoginByUsername):andThen(function(v244) --[[ Line: 677 ]]
                    -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_Text_0 (copy), v238 (copy), v155 (ref), v68 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), l_HttpService_0 (ref), l_Text_1 (copy)
                    l_AppStorageService_0:SetItem(l_LocalStorageKey_0.CredentialValue, l_Text_0);
                    l_AppStorageService_0:flush();
                    if v238 then
                        v155.props.authAnalytics.reportAuthFormInteraction(v68.Context.CMPasswordLogin, nil, "success");
                        if l_FFlagEnablePWManagerLoginCheck_0 and v155.passwordManagerUsageStore then
                            v155.passwordManagerUsageStore.setLoggedinUsingSavedPassword(true);
                        end;
                    end;
                    local v245 = if not v238 then l_HttpService_0:JSONEncode({
                        cvalue = l_Text_0, 
                        password = l_Text_1, 
                        authType = "login"
                    }) else nil;
                    v155.handleLoginResult(v244, v245);
                end, function(v246) --[[ Line: 702 ]]
                    -- upvalues: v238 (copy), v155 (ref), v68 (ref), l_Text_0 (copy), l_Text_1 (copy)
                    if v238 then
                        v155.props.authAnalytics.reportAuthFormInteraction(v68.Context.CMPasswordLogin, nil, "error");
                    end;
                    v155.handleLoginError(v246, l_Text_0, l_Text_1);
                end);
            end;
        end;
    end;
    v155.renderSecurityQuestions = function(_, _, v249, v250) --[[ Line: 715 ]]
        -- upvalues: v155 (copy), v75 (ref)
        v155.props.renderChallenge({
            challengeType = v75.SecurityQuestions, 
            challengeParameters = {
                sessionId = v250.sessionId, 
                userId = v250.userId, 
                onChallengeCompleted = function(v251) --[[ Line: 721 ]] --[[ Name: onChallengeCompleted ]]
                    -- upvalues: v250 (copy), v249 (copy)
                    local v252 = {
                        sessionId = v250.sessionId, 
                        redemptionToken = v251.redemptionToken
                    };
                    v249(v252);
                end, 
                onChallengeInvalidated = function(v253) --[[ Line: 728 ]] --[[ Name: onChallengeInvalidated ]]
                    -- upvalues: v155 (ref)
                    v155.updateIsLoginInProgress(false);
                    if v155.isMounted then
                        if v253.errorCode ~= 0 then
                            v155:setState({
                                errorKey = false, 
                                localizedErrorMessage = v253.errorMessage
                            });
                            return;
                        else
                            v155:setState({
                                errorKey = "Authentication.Login.Response.SomethingWentWrong"
                            });
                        end;
                    end;
                end
            }, 
            onChallengeAbandoned = function() --[[ Line: 746 ]] --[[ Name: onChallengeAbandoned ]]
                -- upvalues: v155 (ref)
                v155.updateIsLoginInProgress(false);
            end, 
            onChallengeLoadFailed = function() --[[ Line: 749 ]] --[[ Name: onChallengeLoadFailed ]]
                -- upvalues: v155 (ref)
                v155.updateIsLoginInProgress(false);
                if v155.isMounted then
                    v155:setState({
                        errorKey = "Authentication.Login.Response.SomethingWentWrong"
                    });
                end;
            end, 
            forceWebViewVisible = true
        });
    end;
    v155.renderTwoStepChallenge = function(v254, v255) --[[ Line: 762 ]]
        -- upvalues: v155 (copy), v76 (ref), v77 (ref), v140 (ref), v68 (ref), v75 (ref), v83 (ref), l_GetFFlagEnable2SVRecovery_0 (ref), v80 (ref), v93 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v58 (ref), v91 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v65 (ref), v66 (ref), v110 (ref), v98 (ref), l_HttpService_0 (ref), l_TwoStepErrorCodes_0 (ref), l_getTwoStepLoginErrorKey_0 (ref), l_AccountLinkingAlertType_0 (ref)
        local l_launchApp_0 = v155.props.launchApp;
        local l_networking_2 = v155.props.networking;
        local l_appPolicy_0 = v155.props.appPolicy;
        local l_analytics_0 = v155.props.analytics;
        local l_omniRecommendationsRequest_0 = v155.props.omniRecommendationsRequest;
        local l_ticket_0 = v254.twoStepVerificationData.ticket;
        local l_id_0 = v254.user.id;
        local l_handleLoginCompletionWithAccountSwitching_0 = v155.props.handleLoginCompletionWithAccountSwitching;
        local l_clearApp_0 = v155.props.clearApp;
        if v76() then
            wait(v77());
        end;
        if v140 then
            v155.props.authAnalytics.reportAuthPageload(v68.Context.TwoStepLoginChallengeRenderInitiated, l_ticket_0);
        end;
        v155.props.renderChallenge({
            challengeType = v75.TwoStepVerification, 
            challengeParameters = {
                actionType = v83.Login, 
                challengeId = l_ticket_0, 
                userId = l_id_0, 
                allowRememberDevice = true, 
                clientSupports2svRecovery = l_GetFFlagEnable2SVRecovery_0() and true or false, 
                onChallengeCompleted = function(v265) --[[ Line: 792 ]] --[[ Name: onChallengeCompleted ]]
                    -- upvalues: v140 (ref), v155 (ref), v68 (ref), l_ticket_0 (copy), v80 (ref), l_networking_2 (copy), l_id_0 (copy), v93 (ref), v255 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v58 (ref), v91 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v65 (ref), v66 (ref), v110 (ref), l_handleLoginCompletionWithAccountSwitching_0 (copy), l_omniRecommendationsRequest_0 (copy), l_analytics_0 (copy), l_appPolicy_0 (copy), l_clearApp_0 (copy), l_launchApp_0 (copy), v98 (ref), l_HttpService_0 (ref), l_TwoStepErrorCodes_0 (ref), l_getTwoStepLoginErrorKey_0 (ref), l_AccountLinkingAlertType_0 (ref)
                    if v140 then
                        v155.props.authAnalytics.reportAuthPageload(v68.Context.TwoStepLoginChallengeCompleted, l_ticket_0);
                    end;
                    v80.login(l_networking_2, l_id_0, l_ticket_0, v265.verificationToken, v265.rememberDevice):andThen(function(v266) --[[ Line: 800 ]]
                        -- upvalues: v93 (ref), v255 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v58 (ref), v91 (ref), v155 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v65 (ref), v66 (ref), v110 (ref), l_handleLoginCompletionWithAccountSwitching_0 (ref), l_networking_2 (ref), l_omniRecommendationsRequest_0 (ref), l_analytics_0 (ref), l_appPolicy_0 (ref), l_clearApp_0 (ref), l_launchApp_0 (ref)
                        if v93() and v255 then
                            if not l_FFlagDisableMemStorageServicePasswordEvent_0 then
                                l_MemStorageService_0:Fire(v58.AuthenticatedCredentials, v255);
                            end;
                            if v91() and v155.state.isCredentialsProtocolRegisterPasswordAvailable then
                                if l_FFlagPasswordManagerAwaitEnabled_0 then
                                    v155.credentialsProtocolRegisterPassword(v255):await();
                                else
                                    v155.credentialsProtocolRegisterPassword(v255);
                                end;
                            end;
                        end;
                        v65(v66.Success, 1);
                        if v110 then
                            l_handleLoginCompletionWithAccountSwitching_0(l_networking_2, l_omniRecommendationsRequest_0, l_analytics_0, l_appPolicy_0, v266.responseBody.accountBlob, l_clearApp_0, l_launchApp_0);
                            return;
                        else
                            l_launchApp_0(l_networking_2, l_omniRecommendationsRequest_0, l_analytics_0, l_appPolicy_0);
                            return;
                        end;
                    end, function(v267) --[[ Line: 836 ]]
                        -- upvalues: l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), v93 (ref), v255 (ref), l_MemStorageService_0 (ref), v58 (ref), v65 (ref), v66 (ref), v98 (ref), l_HttpService_0 (ref), l_TwoStepErrorCodes_0 (ref), l_getTwoStepLoginErrorKey_0 (ref), v155 (ref), l_AccountLinkingAlertType_0 (ref)
                        if not l_FFlagDisableMemStorageServicePasswordEvent_0 and not v93() and v255 then
                            l_MemStorageService_0:Fire(v58.AuthenticatedCredentials, v255);
                        end;
                        v65(v66.Failure, 1);
                        local v268 = "Authentication.Login.Response.SomethingWentWrong";
                        if v98 then
                            local _, l_result_0 = pcall(function() --[[ Line: 851 ]]
                                -- upvalues: l_HttpService_0 (ref), v267 (copy)
                                return l_HttpService_0:JSONDecode(v267.Body).errors[1].code;
                            end);
                            if l_result_0 == l_TwoStepErrorCodes_0.IllegalChildAccountLinking then
                                v65(v66.FailureTwoStepVerification, 1);
                            else
                                v65(v66.FailureUnknownError, 1);
                            end;
                            v268 = l_getTwoStepLoginErrorKey_0(l_result_0);
                        else
                            v65(v66.FailureUnknownError, 1);
                        end;
                        v155.updateIsLoginInProgress(false);
                        if v155.isMounted then
                            v155:setState({
                                errorKey = v268
                            });
                        end;
                        if v267 and v267.Body then
                            local v271 = l_HttpService_0:JSONDecode(v267.Body);
                            local v272 = v271 and v271.errors and v271.errors[1] and v271.errors[1].code;
                            local v273 = v271 and v271.errors and v271.errors[1] and v271.errors[1].userFacingMessage;
                            if v272 == l_TwoStepErrorCodes_0.AccountLinkingRequired then
                                v155.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.IncompatibleAccounts, v273);
                            end;
                            if v272 == l_TwoStepErrorCodes_0.AccountLinkingFailed then
                                v155.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.RetryLogInConnectionFailure);
                            end;
                        end;
                    end);
                end, 
                onChallengeInvalidated = function(v274) --[[ Line: 894 ]] --[[ Name: onChallengeInvalidated ]]
                    -- upvalues: v140 (ref), v155 (ref), v68 (ref), l_ticket_0 (copy)
                    if v140 then
                        v155.props.authAnalytics.reportAuthPageload(v68.Context.TwoStepLoginChallengeInvalidated, l_ticket_0);
                    end;
                    v155.updateIsLoginInProgress(false);
                    if v155.isMounted then
                        if v274.errorCode ~= 0 then
                            v155:setState({
                                errorKey = false, 
                                localizedErrorMessage = v274.errorMessage
                            });
                            return;
                        else
                            v155:setState({
                                errorKey = "Authentication.Login.Response.SomethingWentWrong"
                            });
                        end;
                    end;
                end
            }, 
            onChallengeAbandoned = function() --[[ Line: 918 ]] --[[ Name: onChallengeAbandoned ]]
                -- upvalues: v140 (ref), v155 (ref), v68 (ref), l_ticket_0 (copy)
                if v140 then
                    v155.props.authAnalytics.reportAuthPageload(v68.Context.TwoStepLoginChallengeAbandoned, l_ticket_0);
                end;
                v155.updateIsLoginInProgress(false);
            end, 
            onChallengeLoadFailed = function() --[[ Line: 927 ]] --[[ Name: onChallengeLoadFailed ]]
                -- upvalues: v140 (ref), v155 (ref), v68 (ref), l_ticket_0 (copy)
                if v140 then
                    v155.props.authAnalytics.reportAuthPageload(v68.Context.TwoStepLoginChallengeLoadFailed, l_ticket_0);
                end;
                v155.updateIsLoginInProgress(false);
                if v155.isMounted then
                    v155:setState({
                        errorKey = "Authentication.Login.Response.SomethingWentWrong"
                    });
                end;
            end, 
            forceWebViewVisible = true
        });
    end;
    v155.handleMultipleUsersPerCredentialError = function(v275) --[[ Line: 947 ]]
        -- upvalues: v155 (copy), v68 (ref), l_isStringEmail_0 (ref), l_isStringPhone_0 (ref), v113 (ref), v90 (ref), v89 (ref)
        local v276 = "";
        if v155.state.isLoginByOtp then
            v276 = v68.Context.DisambiguationOTP;
        elseif l_isStringEmail_0(v155.props.cvalue) then
            v276 = v68.Context.DisambiguationEmail;
        elseif l_isStringPhone_0(v155.props.cvalue) then
            v276 = v68.Context.DisambiguationPhone;
        end;
        local v278 = {
            origin = v68.Context.Login, 
            context = v276, 
            users = v275, 
            onAccountSelection = function(v277) --[[ Line: 961 ]] --[[ Name: onAccountSelection ]]
                -- upvalues: v155 (ref), v113 (ref)
                if v155.state.isLoginByOtp then
                    if v113 then
                        v155.handleLoginWithOtp(nil, v277):await();
                        return;
                    else
                        v155.handleLoginWithOtp(nil, v277);
                        return;
                    end;
                elseif v113 then
                    v155.handleLoginWithFormData(nil, nil, v277):await();
                    return;
                else
                    v155.handleLoginWithFormData(nil, nil, v277);
                    return;
                end;
            end, 
            onAccountSelectionAbandoned = function() --[[ Line: 976 ]] --[[ Name: onAccountSelectionAbandoned ]]
                -- upvalues: v155 (ref)
                v155.updateIsLoginInProgress(false);
                v155.state.otpSessionToken = "";
                v155.state.otpCode = "";
                v155.state.isLoginByOtp = false;
                v155.props.closeCentralOverlay();
            end, 
            titleTextKey = "Authentication.Login.Label.AccountSelectorTitle", 
            helpTextKey = "Authentication.Login.Description.AccountSelectorHelp", 
            screenSize = v155.props.screenSize
        };
        if v90() and v89() then
            v155.props.closeCentralOverlay();
        end;
        v155.props.openAccountSelector(v278);
    end;
    v155.performKeystoreOperations = function(v279, v280) --[[ Line: 995 ]]
        -- upvalues: v124 (ref), v130 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v155 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v108 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref)
        return v124.new(function(v281, v282) --[[ Line: 999 ]]
            -- upvalues: v130 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v280 (ref), v155 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v279 (copy), v108 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), v124 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref)
            if (v130 or l_GetFFlagKeystoreAutoLoginAvailable_0()) == false or v280 == nil then
                v281();
                return;
            else
                local v283 = v155.props.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                local v284 = l_HttpService_0:JSONEncode({
                    server = l_ContentProvider_0.BaseUrl
                });
                v280 = l_HttpService_0:JSONDecode(v280);
                l_GetUserByUsername_0(v279, v280.cvalue)():andThen(function(v285) --[[ Line: 1020 ]]
                    -- upvalues: v282 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v108 (ref), v284 (copy), l_default_0 (ref), l_KeystoreConstants_0 (ref)
                    if not v285 or not v285.id then
                        return v282("Invalid usernameInfo");
                    elseif l_GetFFlagKeystoreAutoLoginAvailable_0() then
                        return v108(v284):andThen(function() --[[ Line: 1026 ]]
                            -- upvalues: v285 (copy)
                            return v285;
                        end);
                    else
                        return l_default_0:deleteAllCredentialsFromiOSKeychain(l_default_0.CredentialsTypes.iosKeychainPassword, v284, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 1034 ]]
                            -- upvalues: v285 (copy)
                            return v285;
                        end);
                    end;
                end):andThen(function(v286) --[[ Line: 1039 ]]
                    -- upvalues: v283 (copy), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v280 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_default_0 (ref), v124 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref)
                    local v287 = nil;
                    if v283 == true then
                        v287 = l_KeystoreConstants_0.Experiment;
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v286.id)));
                    else
                        v287 = l_KeystoreConstants_0.Control;
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v286.id)));
                    end;
                    local v288 = l_HttpService_0:JSONEncode({
                        server = tostring(l_ContentProvider_0.BaseUrl), 
                        username = tostring(v280.cvalue), 
                        userId = tostring(v286.id), 
                        password = tostring(v280.password), 
                        experimentGroup = tostring(v287)
                    });
                    if l_GetFFlagKeystoreAutoLoginAvailable_0() then
                        local v290 = l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v289) --[[ Line: 1068 ]]
                            -- upvalues: l_default_0 (ref), v288 (copy), l_KeystoreConstants_0 (ref), v124 (ref)
                            if v289 and v289.keystore and v289.keystore.isAvailable then
                                return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v288, l_KeystoreConstants_0.KeystoreTimeout);
                            else
                                return v124.resolve(nil);
                            end;
                        end);
                        if l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                            return v290;
                        else
                            return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v288, l_KeystoreConstants_0.KeystoreTimeout);
                        end;
                    else
                        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.iosKeychainPassword, v288, l_KeystoreConstants_0.KeystoreTimeout);
                    end;
                end):andThen(function(_) --[[ Line: 1100 ]]
                    -- upvalues: v281 (copy)
                    v281();
                end):catch(function(v292) --[[ Line: 1103 ]]
                    -- upvalues: v282 (copy)
                    v282(v292);
                end);
                return;
            end;
        end);
    end;
    v155.handleLoginResult = function(v293, v294) --[[ Line: 1109 ]]
        -- upvalues: v155 (copy), v29 (ref), v65 (ref), v66 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v58 (ref), v91 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v110 (ref), v149 (ref), v85 (ref)
        v155.props.setBackNavigationDisabled(false);
        local l_setLoginResult_0 = v155.props.setLoginResult;
        local l_launchApp_1 = v155.props.launchApp;
        local l_networking_3 = v155.props.networking;
        local l_appPolicy_1 = v155.props.appPolicy;
        local l_analytics_1 = v155.props.analytics;
        local l_omniRecommendationsRequest_1 = v155.props.omniRecommendationsRequest;
        if v155.passwordRef.current then
            v155.passwordRef.current.Text = "";
        end;
        local l_clearApp_1 = v155.props.clearApp;
        local l_handleLoginCompletionWithAccountSwitching_1 = v155.props.handleLoginCompletionWithAccountSwitching;
        v155.performKeystoreOperations(l_networking_3, v294):finally(function() --[[ Line: 1127 ]]
            -- upvalues: v29 (ref), v293 (copy), l_setLoginResult_0 (copy), v65 (ref), v66 (ref), v155 (ref), v294 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v58 (ref), v91 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v110 (ref), l_handleLoginCompletionWithAccountSwitching_1 (copy), l_networking_3 (copy), l_omniRecommendationsRequest_1 (copy), l_analytics_1 (copy), l_appPolicy_1 (copy), l_clearApp_1 (copy), l_launchApp_1 (copy), v149 (ref), v85 (ref)
            if v29.hasTwoStepData(v293) then
                l_setLoginResult_0(v293);
                v65(v66.FailureTwoStepVerification, 1);
                spawn(function() --[[ Line: 1134 ]]
                    -- upvalues: v155 (ref), v293 (ref), v294 (ref)
                    v155.renderTwoStepChallenge(v293, v294);
                end);
            else
                if v294 then
                    if not l_FFlagDisableMemStorageServicePasswordEvent_0 then
                        l_MemStorageService_0:Fire(v58.AuthenticatedCredentials, v294);
                    end;
                    if v91() and v155.state.isCredentialsProtocolRegisterPasswordAvailable then
                        if l_FFlagPasswordManagerAwaitEnabled_0 then
                            v155.credentialsProtocolRegisterPassword(v294):await();
                        else
                            v155.credentialsProtocolRegisterPassword(v294);
                        end;
                    end;
                end;
                v65(v66.Success, 1);
                if v110 then
                    l_handleLoginCompletionWithAccountSwitching_1(l_networking_3, l_omniRecommendationsRequest_1, l_analytics_1, l_appPolicy_1, v293.accountBlob, l_clearApp_1, l_launchApp_1);
                else
                    l_launchApp_1(l_networking_3, l_omniRecommendationsRequest_1, l_analytics_1, l_appPolicy_1);
                    v149.ClearThemeOverride();
                end;
            end;
            if v85() then
                v155.props.closeCentralOverlay();
            end;
        end);
    end;
    v155.credentialsProtocolRegisterPassword = function(v303) --[[ Line: 1182 ]]
        -- upvalues: l_HttpService_0 (ref), l_default_0 (ref), l_Constants_0 (ref), v114 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), v155 (copy), v68 (ref), l_Logger_0 (ref)
        v303 = l_HttpService_0:JSONDecode(v303);
        if v303.cvalue == nil or v303.password == nil then
            return;
        else
            local v304 = {
                username = v303.cvalue, 
                password = v303.password
            };
            local v305 = l_HttpService_0:JSONEncode(v304);
            return l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v305, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v306) --[[ Line: 1199 ]]
                -- upvalues: v114 (ref), l_HttpService_0 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), v155 (ref), v68 (ref), l_Logger_0 (ref)
                if v114 and v306 then
                    local v307 = l_HttpService_0:JSONDecode(v306);
                    if v307.errorCode == nil then
                        if l_FFlagEnablePWManagerLoginCheck_0 and v155.passwordManagerUsageStore then
                            v155.passwordManagerUsageStore.setSavedPasswordAfterLogin(true);
                        end;
                        v155.props.authAnalytics.reportAuthButtonClick(v68.Context.CMPasswordLogin, v68.Button.SavePassword);
                        l_Logger_0:info("Successfully registered password.");
                        return;
                    else
                        l_Logger_0:warning("Error registering password: " .. tostring(v307.errorMsg));
                        return;
                    end;
                elseif v306.errorCode == nil then
                    v155.props.authAnalytics.reportAuthButtonClick(v68.Context.CMPasswordLogin, v68.Button.SavePassword);
                    l_Logger_0:info("Successfully registered password.");
                    return;
                else
                    l_Logger_0:warning("Error registering password: " .. tostring(v306.errorMsg));
                    return;
                end;
            end, function(v308) --[[ Line: 1227 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Error registering password: " .. tostring(v308));
            end);
        end;
    end;
    v155.logoutAllLoggedInUsersCallback = function() --[[ Line: 1233 ]]
        -- upvalues: v155 (copy), v107 (ref), v121 (ref), v81 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_GuiService_0 (ref)
        local l_networking_4 = v155.props.networking;
        local v310 = v107.getAccountBlob();
        local v311 = v121.fromLocalStorage().userId ~= -1;
        v155:setState({
            errorKey = false, 
            loginButtonDisabled = true, 
            isLoginInProgress = false
        });
        v81(l_networking_4, v310):await();
        if v311 == true then
            v155.props.resetAppState();
            l_AppStorageService_0:SetItem(l_LocalStorageKey_0.CredentialValue, "");
            l_AppStorageService_0:flush();
            v155.props.logoutWithoutShowConfirmation(l_networking_4, l_GuiService_0);
        end;
        v155:setState({
            loginButtonDisabled = false
        });
        v155.props.closeCentralOverlay();
    end;
    v155.handleLoginError = function(v312, v313, v314) --[[ Line: 1262 ]]
        -- upvalues: v155 (copy), v85 (ref), v55 (ref), v78 (ref), v65 (ref), v66 (ref), l_StatusCodes_0 (ref), v110 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v69 (ref), l_isStringEmail_0 (ref), v60 (ref), v125 (ref), v126 (ref), l_AccountLinkingAlertType_0 (ref)
        v155.props.setBackNavigationDisabled(false);
        local l_forceLoginByUsername_0 = v155.state.forceLoginByUsername;
        local v316 = v155.errorHandlingInfoList[v312.errorCode];
        if v316 then
            l_forceLoginByUsername_0 = v316.forceLoginByUsername or l_forceLoginByUsername_0;
        end;
        local v317 = false;
        local v318 = v85() and v312.errorCode == v55.MultipleUsersPerCredential and not v155.props.appPolicy.getAccountDisambiguationDisabled();
        local v319 = v155.props.appPolicy.getLinkedAuthEndpointsEnabled() and (v312.errorCode == v55.AccountLinkingRequired or v312.errorCode == v55.AccountLinkingFailed);
        local v320 = v78() and v312.errorCode == v55.SecurityQuestions;
        if v318 or v320 or v312.errorCode == v55.Captcha then
            v317 = true;
        end;
        v65(v66.Failure, 1);
        if v312.errorCode == v55.Captcha then
            v65(v66.FailureCaptcha, 1);
        elseif v312.errorCode == v55.IncorrectCValueOrPassword then
            v65(v66.FailureCredentials, 1);
        elseif v312.errorCode == v55.AccountLocked then
            v65(v66.FailurePasswordReset, 1);
        elseif v312.errorCode == v55.CTypeNotSupported then
            v65(v66.FailureBadRequest, 1);
        elseif v312.errorCode == v55.CValueAndPasswordRequired then
            v65(v66.FailureBadRequest, 1);
        elseif v320 then
            v65(v66.FailureSecurityQuestions, 1);
        elseif v312.errorCode == v55.MultipleUsersPerCredential then
            v65(v66.FailureMultipleUsersPerCredential, 1);
        elseif v312.HttpError == Enum.HttpError.OK and v312.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS then
            v65(v66.FailureThrottled, 1);
        elseif v312.HttpError == Enum.HttpError.OK and v312.StatusCode == l_StatusCodes_0.REQUEST_TIMEOUT then
            v65(v66.FailureTimeout, 1);
        elseif v312.HttpError == Enum.HttpError.OK and v312.StatusCode == l_StatusCodes_0.BAD_REQUEST then
            v65(v66.FailureBadRequest, 1);
        elseif v312.HttpError == Enum.HttpError.OK and v312.StatusCode == l_StatusCodes_0.NOT_FOUND then
            v65(v66.FailureNotFound, 1);
        elseif v312.HttpError == Enum.HttpError.OK and v312.StatusCode == l_StatusCodes_0.INTERNAL_SERVER_ERROR then
            v65(v66.FailureInternalServerError, 1);
        else
            v65(v66.FailureUnknownError, 1);
        end;
        if v110 == true and v312.errorCode == v55.EmptyAccountSwitchBlobRequired then
            v155:setState({
                errorKey = false
            });
            v155.props.openAccountSwitchingErrorOverlay(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.LogoutConfirmation", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v155.logoutAllLoggedInUsersCallback, v155.props.closeCentralOverlay, v69.Auth.AccountSwitcherLoginEmptyBlobRequiredError, v313 or nil);
        end;
        if v110 == true and v312.errorCode == v55.ParentEmptyAccountSwitchBlobRequired then
            v155:setState({
                errorKey = false
            });
            v155.props.openAccountSwitchingErrorOverlay(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.ParentLogoutConfirmation", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v155.logoutAllLoggedInUsersCallback, v155.props.closeCentralOverlay, v69.Auth.AccountSwitcherParentLoginEmptyBlobRequiredError, v313 or nil);
        end;
        if v312.errorCode == v55.AccountLocked then
            v155.props.openPasswordResetPrompt();
        end;
        if v312.errorCode == v55.AccountNotVerified and l_isStringEmail_0(v313) and v155.canVerifyCredentials(v60.Email, v313, v314) then
            v155.props.openEmailVerificationPrompt(v313, v314, v155.closeVerificationEmailModal);
        end;
        if v125() and v312.errorCode == v55.GlobalAppAccessDeniedVNG and v155.isMounted then
            v155.props.openNewAppAvailableModal(function() --[[ Line: 1384 ]]
                -- upvalues: v126 (ref), v155 (ref)
                local v321 = v126();
                v155.props.linking:openURL(v321);
            end);
        end;
        if v78() and v312.errorCode == v55.SecurityQuestions and v312.securityQuestionsData and v312.securityQuestionsCallback then
            task.spawn(function() --[[ Line: 1393 ]]
                -- upvalues: v155 (ref), v313 (copy), v314 (copy), v312 (copy)
                if v155.isMounted then
                    v155.renderSecurityQuestions(v313, v314, v312.securityQuestionsCallback, v312.securityQuestionsData);
                end;
            end);
        end;
        if v318 then
            if v312.usersData then
                v155.handleMultipleUsersPerCredentialError(v312.usersData);
            end;
        elseif v312.errorCode == v55.MultipleUsersPerCredential then
            v312.errorKey = "Authentication.Login.Response.MoreThanOneUsername";
        end;
        if v312.errorCode == v55.PlatformNotSupported then
            v312.errorKey = "Authentication.Login.Error.PlatformAccountConnectionFailure";
        end;
        if v319 then
            if v312.errorCode == v55.AccountLinkingRequired then
                v155.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.IncompatibleAccounts, v312.userFacingMessage);
            elseif v312.errorCode == v55.AccountLinkingFailed then
                v155.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.RetryLogInConnectionFailure);
            end;
        end;
        spawn(function() --[[ Line: 1426 ]]
            -- upvalues: v155 (ref), v312 (copy), l_forceLoginByUsername_0 (ref)
            if v155.isMounted then
                v155:setState({
                    errorKey = v312.errorKey, 
                    errorCode = v312.errorCode, 
                    forceLoginByUsername = l_forceLoginByUsername_0
                });
            end;
        end);
        v155.updateIsLoginInProgress(v317);
    end;
    v155.onLoginButtonActivated = function() --[[ Line: 1439 ]]
        -- upvalues: v155 (copy), v68 (ref)
        if v155.state.loginButtonDisabled then
            return;
        elseif v155.state.isLoginInProgress then
            return;
        else
            v155.updateIsLoginInProgress(true);
            v155.props.authAnalytics.reportLogInButtonClicked(v68.Context.LoginScreen);
            v155.handleLoginWithFormData();
            return;
        end;
    end;
    v155.onForgetButtonActivated = function() --[[ Line: 1453 ]]
        -- upvalues: v155 (copy), v68 (ref), l_GetFFlagEnableLuafiedRecoveryFlow_0 (ref), l_enrolledInLuafiedRecoveryExperiment_0 (ref), v24 (ref), l_ContentProvider_0 (ref), v54 (ref)
        if v155.state.isLoginInProgress then
            return;
        else
            v155.unfocusTextBoxes();
            v155.props.authAnalytics.reportAuthButtonClick(v68.Context.LoginForm, v68.Button.ForgotPassword);
            v155.props.authAnalytics.reportForgotPasswordButtonClicked(v68.Context.LoginScreen);
            if l_GetFFlagEnableLuafiedRecoveryFlow_0() and l_enrolledInLuafiedRecoveryExperiment_0() then
                v155.props.navigateToPage({
                    name = v24.AccountRecovery, 
                    extraProps = {
                        identifier = v155.cvalueRef and v155.cvalueRef.current and v155.cvalueRef.current.Text or v155.cvalueText and v155.cvalueText:getValue() or "", 
                        recoverPassword = true
                    }
                });
                return;
            elseif v155.props.appPolicy.shouldUseExternalBrowserForDisclaimerLinks() then
                v155.props.linking:openURL(l_ContentProvider_0.BaseUrl .. "login/forgot-password-or-username");
                return;
            else
                v155.props.navigateToPage({
                    name = v24.GenericWebPage, 
                    detail = l_ContentProvider_0.BaseUrl .. "login/forgot-password-or-username", 
                    extraProps = {
                        title = "", 
                        transitionAnimation = v54.SlideInFromRight
                    }
                });
                return;
            end;
        end;
    end;
    v155.onCrossDeviceLoginActivated = function() --[[ Line: 1491 ]]
        -- upvalues: v155 (copy), v68 (ref), v94 (ref), l_RbxAnalyticsService_0 (ref)
        if v155.state.isLoginInProgress then
            return;
        else
            v155.unfocusTextBoxes();
            v155.props.authAnalytics.reportAuthButtonClick(v68.Context.LoginForm, v68.Button.QuickLogin);
            v155.props.authAnalytics.reportButtonClicked(v68.Context.Login, v68.Button.LoginOtherDevice);
            if v155.props.appPolicy.getShowVNGLoginWithExistingAccountQuickLoginButton() then
                if v94() then
                    l_RbxAnalyticsService_0:ReportCounter("CrossAppLoginAttempt", 1);
                end;
                v155.props.openCrossAppLoginPrompt(v155.handleLoginWithCode);
                return;
            else
                v155.props.openCrossDeviceLoginPrompt(v155.handleLoginWithCode);
                return;
            end;
        end;
    end;
    v155.topButtonActivatedTracking = function() --[[ Line: 1516 ]]
        -- upvalues: v110 (ref), v155 (copy), v68 (ref)
        if v110 == true and v155.isAlreadyAuthenticated == true then
            resetDefaultTheme();
        end;
        v155.props.authAnalytics.reportDismissCornerXButtonClicked(v68.Context.LoginScreen);
    end;
    v155.onEmailOtpLoginAbandoned = function() --[[ Line: 1523 ]]
        -- upvalues: v155 (copy)
        v155.state.isLoginByOtp = false;
    end;
    v155.onEmailOtpLoginCompleted = function(v322, v323) --[[ Line: 1527 ]]
        -- upvalues: v155 (copy)
        v155.state.otpSessionToken = v322;
        v155.state.otpCode = v323;
        return v155.handleLoginWithOtp(nil, nil);
    end;
    v155.onEmailOtpLoginActivated = function() --[[ Line: 1533 ]]
        -- upvalues: v155 (copy), v68 (ref)
        if v155.state.isLoginInProgress then
            return;
        else
            v155.unfocusTextBoxes();
            local v324 = {
                origin = "login", 
                codeLength = 6, 
                enterEmailTitleKey = "Authentication.Login.Label.GetOneTimeCode", 
                enterEmailDescriptionKey = "Authentication.Login.Description.GetOneTimeCodeHelp", 
                enterCodeTitleKey = "Authentication.Login.Label.EnterOneTimeCode", 
                enterCodeDescriptionKey = "Authentication.Login.Description.EnterOneTimeCodeHelpV2", 
                onSubmitCode = v155.onEmailOtpLoginCompleted, 
                onModalAbandoned = v155.onEmailOtpLoginAbandoned, 
                screenSize = v155.props.screenSize
            };
            v155.props.openEmailOtp(v324);
            v155.state.isLoginByOtp = true;
            v155.props.authAnalytics.reportAuthButtonClick(v68.Context.LoginForm, v68.Button.EmailOtp);
            v155.props.authAnalytics.reportButtonClicked(v68.Context.Login, v68.Button.OneTimePasscode);
            return;
        end;
    end;
    v155.closeVerificationEmailModal = function(v325) --[[ Line: 1561 ]]
        -- upvalues: v155 (copy)
        if v155.isMounted then
            v155.updateCValueText(v325);
            if v325 ~= "" and v155.passwordRef.current then
                v155.passwordRef.current:CaptureFocus();
            end;
            v155:setState({
                errorCode = -1, 
                errorKey = "", 
                forceLoginByUsername = false
            });
        end;
    end;
    v155.events = {};
    v155.props.authAnalytics.reportScreenLoaded(v68.Context.LoginScreen);
end;
v152.didMount = function(v326) --[[ Line: 1579 ]] --[[ Name: didMount ]]
    -- upvalues: v68 (copy), v92 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), v110 (copy), l_MemStorageService_0 (copy), v58 (copy), v149 (copy), v128 (copy), v130 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy), v139 (copy), l_UiMode_0 (copy), l_UserInputService_0 (copy), v127 (copy), l_GuiService_0 (copy), v24 (copy), l_HttpService_0 (copy), l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0 (copy), v45 (copy), v91 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 (copy), l_Logger_0 (copy), l_LocalizationService_0 (copy), l_TelemetryConfigs_0 (copy)
    v326.isMounted = true;
    v326.props.authAnalytics.reportAuthPageload(v68.Context.LoginForm);
    if v92() then
        local v327 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
        v326.props.authAnalytics.reportAuthPageload(v68.Context.LoginScreen, v327);
    end;
    if v110 == true and v326.isAlreadyAuthenticated == true then
        l_MemStorageService_0:Fire(v58.ThemeUpdate, "dark");
    end;
    v149.SetDarkThemeOverride();
    if v128 and v326.props.appPolicy.getLoginUsernameOnly() then
        v326:setState({
            forceLoginByUsername = true
        });
    end;
    if v130 or l_GetFFlagKeystoreAutoLoginAvailable_0() then
        if v326.props.usernameFromIosKeychain then
            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.autoPopulatedUsername);
            v326.updateCValueText(v326.props.usernameFromIosKeychain);
        end;
        if v326.props.passwordFromIosKeychain then
            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.autoPopulatedPassword);
            v326.updatePasswordText(v326.props.passwordFromIosKeychain);
        end;
        if v139 then
            v326:setState({
                loginButtonDisabled = not (v326.props.usernameFromIosKeychain and v326.props.passwordFromIosKeychain)
            });
        else
            v326:setState({
                loginButtonDisabled = false
            });
        end;
    end;
    local function v333(v328, v329) --[[ Line: 1632 ]] --[[ Name: isWithinBounds ]]
        -- upvalues: v326 (copy), l_UiMode_0 (ref)
        if v326.props.uiModeInfo.uiMode == l_UiMode_0.VR then
            error("Input position is not supported in VR");
        end;
        local l_AbsolutePosition_0 = v329.AbsolutePosition;
        local l_AbsoluteSize_0 = v329.AbsoluteSize;
        local v332 = false;
        if v328.X > l_AbsolutePosition_0.X then
            v332 = false;
            if v328.X < l_AbsolutePosition_0.X + l_AbsoluteSize_0.X then
                v332 = false;
                if v328.Y > l_AbsolutePosition_0.Y then
                    v332 = v328.Y < l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y;
                end;
            end;
        end;
        return v332;
    end;
    local function v335(v334) --[[ Line: 1645 ]] --[[ Name: getNextSelectedObject ]]
        -- upvalues: l_UserInputService_0 (ref), v127 (ref), v326 (copy)
        if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
            if v127 then
                return v326.focusRef and v326.focusRef.current and v326.focusRef.current.NextSelectionUp;
            else
                return v334.NextSelectionUp;
            end;
        elseif v127 then
            return v326.focusRef and v326.focusRef.current and v326.focusRef.current.NextSelectionDown;
        else
            return v334.NextSelectionDown;
        end;
    end;
    local function v337() --[[ Line: 1663 ]] --[[ Name: getNewSelectedObject ]]
        -- upvalues: v127 (ref), v326 (copy), l_GuiService_0 (ref), v335 (copy)
        local v336 = if v127 then v326.focusRef and v326.focusRef.current else l_GuiService_0.SelectedObject;
        v336 = v335(v336);
        if v336 == v326.loginButtonRef.current and v326.state.loginButtonDisabled then
            v336 = v335(v336);
        end;
        if v326.isMounted then
            v326:setState({
                forgotLinkFocused = v336 == v326.forgotLinkRef.current
            });
        end;
        return v336;
    end;
    table.insert(v326.events, l_UserInputService_0.InputBegan:connect(function(v338, _) --[[ Line: 1684 ]]
        -- upvalues: v326 (copy), v24 (ref), v127 (ref), l_GuiService_0 (ref), v337 (copy)
        if v326.props.currentPageName ~= v24.Login then
            return;
        else
            if v338.UserInputType == Enum.UserInputType.Keyboard then
                if v338.KeyCode == Enum.KeyCode.Return then
                    if v326.state.forgotLinkFocused then
                        v326.onForgetButtonActivated();
                        return;
                    else
                        v326.onLoginButtonActivated();
                        return;
                    end;
                elseif v338.KeyCode == Enum.KeyCode.Tab then
                    local v340 = if v127 then v326.focusRef and v326.focusRef.current else l_GuiService_0.SelectedObject;
                    if not v340 then
                        return;
                    else
                        local v341 = v337();
                        if not v341 then
                            return;
                        else
                            if v340:IsA("TextBox") and v340.ManualFocusRelease then
                                v340:ReleaseFocus();
                            end;
                            if v127 then
                                v326.focusRef.current = v341;
                            else
                                l_GuiService_0.SelectedObject = v341;
                            end;
                            if v341:IsA("TextBox") then
                                v341:CaptureFocus();
                            end;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end));
    table.insert(v326.events, l_UserInputService_0.InputEnded:connect(function(v342, _) --[[ Line: 1729 ]]
        -- upvalues: v326 (copy), v24 (ref), l_UiMode_0 (ref), l_UserInputService_0 (ref), v333 (copy)
        if v326.props.currentPageName ~= v24.Login then
            return;
        elseif v326.props.uiModeInfo.uiMode == l_UiMode_0.VR then
            return;
        else
            if v342.UserInputType == Enum.UserInputType.MouseButton1 or v342.UserInputType == Enum.UserInputType.Touch then
                local l_Position_0 = v342.Position;
                local l_l_UserInputService_0_FocusedTextBox_1 = l_UserInputService_0:GetFocusedTextBox();
                if not v326.cvalueRef.current or not v326.passwordRef.current then
                    return;
                elseif not l_l_UserInputService_0_FocusedTextBox_1 then
                    return;
                else
                    local v346 = v333(l_Position_0, v326.cvalueRef.current);
                    local v347 = v333(l_Position_0, v326.passwordRef.current);
                    if l_l_UserInputService_0_FocusedTextBox_1 == v326.cvalueRef.current and v347 then
                        v326.cvalueRef.current:ReleaseFocus();
                        v326.passwordRef.current:CaptureFocus();
                        return;
                    elseif l_l_UserInputService_0_FocusedTextBox_1 == v326.passwordRef.current and v346 then
                        v326.passwordRef.current:ReleaseFocus();
                        v326.cvalueRef.current:CaptureFocus();
                        return;
                    elseif not v346 and not v347 and (l_l_UserInputService_0_FocusedTextBox_1 == v326.cvalueRef.current or l_l_UserInputService_0_FocusedTextBox_1 == v326.passwordRef.current) then
                        l_l_UserInputService_0_FocusedTextBox_1:ReleaseFocus();
                    end;
                end;
            end;
            return;
        end;
    end));
    table.insert(v326.events, l_UserInputService_0.TextBoxFocused:connect(function(v348) --[[ Line: 1771 ]]
        -- upvalues: v326 (copy), v24 (ref), v127 (ref), l_GuiService_0 (ref)
        if v326.props.currentPageName ~= v24.Login then
            return;
        elseif v326.state.isLoginInProgress then
            v348:ReleaseFocus();
            return;
        elseif v127 then
            v326.focusRef.current = v348;
            return;
        else
            l_GuiService_0.SelectedObject = v348;
            return;
        end;
    end));
    table.insert(v326.events, l_UserInputService_0.TextBoxFocusReleased:connect(function(_) --[[ Line: 1790 ]]
        -- upvalues: v326 (copy), v24 (ref), v127 (ref), l_GuiService_0 (ref)
        if v326.props.currentPageName ~= v24.Login then
            return;
        elseif v127 then
            v326.focusRef.current = nil;
            return;
        else
            l_GuiService_0.SelectedObject = nil;
            return;
        end;
    end));
    table.insert(v326.events, l_MemStorageService_0:bind(v58.AutoFillCredentials, function(v350) --[[ Line: 1805 ]]
        -- upvalues: v326 (copy), v24 (ref), l_HttpService_0 (ref)
        if v326.props.currentPageName ~= v24.Login then
            return;
        elseif v326.state.isLoginInProgress then
            return;
        else
            local v351 = l_HttpService_0:JSONDecode(v350);
            if v351 then
                v326.updateCValueText(v351.cvalue);
                v326.updatePasswordText(v351.password);
            end;
            return;
        end;
    end));
    if l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0() then
        v45(v326.props.networking, "PlayerApp.Login", {
            "isDesktopDualLoginEnabled"
        }):andThen(function(v352) --[[ Line: 1822 ]]
            -- upvalues: v326 (copy)
            local v353 = v352 and v352.responseBody;
            if v353 and v326.isMounted then
                local l_isDesktopDualLoginEnabled_0 = v353.isDesktopDualLoginEnabled;
                if l_isDesktopDualLoginEnabled_0 then
                    v326:setState({
                        isDesktopDualLoginEnabled = l_isDesktopDualLoginEnabled_0
                    });
                end;
            end;
        end, function() --[[ Line: 1833 ]]

        end);
    end;
    if v91() then
        local v355 = false;
        local v356 = false;
        local v357 = false;
        do
            local l_v355_0, l_v356_0, l_v357_0 = v355, v356, v357;
            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v361) --[[ Line: 1846 ]]
                -- upvalues: l_v355_0 (ref), l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 (ref), l_v356_0 (ref), l_v357_0 (ref), v326 (copy)
                if v361.FIDO2 ~= nil then
                    l_v355_0 = v361.FIDO2.isAvailable and v361.FIDO2.supportsDeviceBoundOnly;
                    if l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 then
                        l_v356_0 = v361.password and v361.password.isAvailable;
                        l_v357_0 = v361.password ~= nil;
                    else
                        l_v356_0 = v361.password.isAvailable;
                        l_v357_0 = true;
                    end;
                    if v326.isMounted then
                        v326:setState({
                            isCredentialsProtocolRegisterPasswordAvailable = l_v356_0
                        });
                    end;
                else
                    l_v355_0 = v361.isAvailable and v361.supportsDeviceBoundOnly;
                end;
                if l_v357_0 then
                    v326.showGenericCredentialLoginPopup(l_v355_0, l_v356_0);
                    return;
                else
                    if l_v355_0 then
                        v326.showPasskeyLoginPopup();
                    end;
                    return;
                end;
            end):catch(function(v362) --[[ Line: 1877 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Error checking for available credential types. Error: {}", v362);
            end):finally(function() --[[ Line: 1880 ]]
                -- upvalues: v326 (copy), v68 (ref), l_v356_0 (ref), l_v355_0 (ref)
                v326.props.authAnalytics.reportAuthPageload(v68.Context.CMPasswordLogin, (tostring(l_v356_0)));
                v326.props.authAnalytics.reportAuthPageload(v68.Context.PasskeyLogin, if l_v355_0 ~= nil then tostring(l_v355_0) else "timeout");
            end);
        end;
    else
        local v363 = false;
        do
            local l_v363_0 = v363;
            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v365) --[[ Line: 1894 ]]
                -- upvalues: l_v363_0 (ref), v326 (copy)
                l_v363_0 = v365.isAvailable and v365.supportsDeviceBoundOnly;
                if l_v363_0 then
                    v326.showPasskeyLoginPopup();
                end;
            end):catch(function(v366) --[[ Line: 1900 ]]
                warn("Error checking if FIDO2 passkeys is available. Error: ", v366);
            end):finally(function() --[[ Line: 1903 ]]
                -- upvalues: v326 (copy), v68 (ref), l_v363_0 (ref)
                v326.props.authAnalytics.reportAuthPageload(v68.Context.PasskeyLogin, if l_v363_0 ~= nil then tostring(l_v363_0) else "timeout");
            end);
        end;
    end;
    if game:GetFastFlag("EnablePlayerAppLoginPageExperiments") and l_LocalizationService_0.RobloxLocaleId:match("^en") then
        v45(v326.props.networking, "PlayerApp.Login", {
            "CrossDeviceButtonText"
        }):andThen(function(v367) --[[ Line: 1915 ]]
            -- upvalues: v326 (copy)
            local v368 = v367 and v367.responseBody;
            if v368 and v326.isMounted then
                local l_CrossDeviceButtonText_0 = v368.CrossDeviceButtonText;
                if l_CrossDeviceButtonText_0 then
                    v326:setState({
                        quickLoginButtonTextOverride = l_CrossDeviceButtonText_0
                    });
                end;
            end;
        end, function() --[[ Line: 1926 ]]

        end);
    end;
    v326.props.loggingProtocol:logEventOnce("login_view_did_mount");
    v326.props.loggingProtocol:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LoginPageMountTelemetryConfig, 1, {
        version = 1
    });
end;
v152.willUnmount = function(v370) --[[ Line: 1939 ]] --[[ Name: willUnmount ]]
    -- upvalues: v110 (copy)
    if v110 == true and v370.isAlreadyAuthenticated == true then
        resetDefaultTheme();
    end;
    v370.unfocusTextBoxes();
    for _, v372 in ipairs(v370.events) do
        v372:Disconnect();
    end;
    v370.events = {};
    v370.isMounted = false;
end;
v152.didUpdate = function(v373, _, v375) --[[ Line: 1954 ]] --[[ Name: didUpdate ]]
    -- upvalues: v154 (copy)
    if v373.state.errorCode == -1 then
        return;
    else
        local l_isLoginInProgress_1 = v373.state.isLoginInProgress;
        if v375.isLoginInProgress and not l_isLoginInProgress_1 then
            local v377 = v373.errorHandlingInfoList[v373.state.errorCode];
            if not v377 then
                return;
            else
                if v377.textBoxesToClear then
                    for _, v379 in pairs(v377.textBoxesToClear) do
                        if v379 == v154.CValue then
                            v373.updateCValueText("");
                        elseif v379 == v154.Password then
                            v373.updatePasswordText("");
                        end;
                    end;
                end;
                if v377.newFocusedTextBox == v154.CValue and v373.cvalueRef.current then
                    v373.cvalueRef.current:CaptureFocus();
                    return;
                elseif v377.newFocusedTextBox == v154.Password and v373.passwordRef.current then
                    v373.passwordRef.current:CaptureFocus();
                end;
            end;
        end;
        return;
    end;
end;
v152.render = function(v380) --[[ Line: 1986 ]] --[[ Name: render ]]
    -- upvalues: l_UiMode_0 (copy), l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0 (copy), v128 (copy), l_FFlagAuthSecExclusions_0 (copy), v88 (copy), v111 (copy), l_withStyle_0 (copy), v73 (copy), v63 (copy), v47 (copy), v46 (copy), v11 (copy), v56 (copy), v52 (copy), v53 (copy), l_LinkButton_0 (copy), v38 (copy), v153 (copy)
    local v381 = v380.state.errorKey ~= "" and v380.state.errorKey or nil;
    local v382 = v380.state.errorKey == false and v380.state.localizedErrorMessage or nil;
    local v383 = not v380.props.appPolicy.getWebViewSupport() and v380.props.uiModeInfo.uiMode ~= l_UiMode_0.VR;
    local v384 = true;
    if v380.props.uiModeInfo.uiMode ~= l_UiMode_0.TenFoot then
        v384 = v380.props.uiModeInfo.uiMode == l_UiMode_0.VR;
    end;
    local v385 = l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0() and v380.state.isDesktopDualLoginEnabled;
    local v386 = v384 or v380.props.appPolicy.getEnableDualLogin() and v385;
    local v387 = v380.props.appPolicy.getDisableEmailOTPLogin() and (v128 or l_FFlagAuthSecExclusions_0);
    local v388 = v88() and v380.props.isLoginWithOtpEnabled and not v387;
    local v389 = v380.props.appPolicy.getUseVNGUserAgreementPopup();
    local v390 = v111 and v380.props.appPolicy.getUseKoreaKISAUserAgreementPopup();
    local v391 = v128 and v380.props.appPolicy.getDisableLoginForgotButton();
    return l_withStyle_0(function(v392) --[[ Line: 2013 ]]
        -- upvalues: v73 (ref), v386 (copy), l_FFlagAuthSecExclusions_0 (ref), v380 (copy), v383 (ref), v63 (ref), v381 (copy), v384 (copy), v47 (ref), v46 (ref), l_UiMode_0 (ref), v11 (ref), v56 (ref), v52 (ref), v382 (copy), v389 (copy), v390 (copy), v388 (copy), v53 (ref), v391 (copy), l_LinkButton_0 (ref), v38 (ref), v153 (ref)
        local v393 = v73.CrossDeviceLoginRolloutEnabledForDevice() and not v386;
        if l_FFlagAuthSecExclusions_0 and v380.props.appPolicy.getExcludeCrossDeviceSignIn() then
            v393 = false;
        end;
        local v394 = v380.props.appPolicy.getShowVNGLoginWithExistingAccountQuickLoginButton();
        if v380.props.appPolicy.getDisableRegularLogin() == false then
            v383 = false;
        end;
        return v63({
            localizedError = v381, 
            logInText = "Authentication.Login.Action.SignIn", 
            forgotText = "Authentication.Login.Action.ForgotPasswordOrUsernameQuestionCapitalized", 
            cvaluePlaceholder = v380.state.forceLoginByUsername and "Authentication.Login.Label.Username" or "Authentication.Login.Label.UsernameEmailPhone", 
            passwordPlaceholder = "CommonUI.Messages.Label.Password", 
            twoStepHeader = "Authentication.TwoStepVerification.Label.TwoStepVerification", 
            crossDeviceLoginHeader = "Authentication.CrossDevice.Heading.QuickLogin", 
            loginWithExistingAccountButtonText = "Authentication.CrossDevice.Heading.QuickLogin", 
            orText = "CommonUI.Messages.Label.OR"
        })(function(v395) --[[ Line: 2040 ]]
            -- upvalues: v380 (ref), v394 (copy), v384 (ref), v47 (ref), v46 (ref), l_UiMode_0 (ref), v11 (ref), v56 (ref), v386 (ref), v52 (ref), v393 (ref), v382 (ref), v383 (ref), v389 (ref), v390 (ref), v388 (ref), v392 (copy), v53 (ref), v391 (ref), l_LinkButton_0 (ref), v38 (ref), v153 (ref)
            local v396 = v380.state.quickLoginButtonTextOverride ~= "" and v380.state.quickLoginButtonTextOverride or v395.crossDeviceLoginHeader;
            if v394 then
                v396 = v395.loginWithExistingAccountButtonText;
            end;
            local v397 = if v384 then v47 else v46;
            local v398 = v384 and v380.props.uiModeInfo.uiMode ~= l_UiMode_0.VR;
            return v11.createElement(v397, {
                ContentAlign = v56.Top, 
                topButtonActivatedTracking = v380.topButtonActivatedTracking, 
                topButtonEnabled = not v380.state.isLoginInProgress, 
                statusBarHeight = v380.props.statusBarHeight, 
                globalGuiInset = v380.props.globalGuiInset, 
                screenSize = v380.props.screenSize, 
                isDualLayout = v386, 
                navigateBack = if v384 then v380.props.navigateBack else nil, 
                buttonRef = v380.props.containerRef
            }, {
                UIListLayout = v386 and v11.createElement("UIListLayout", {
                    Padding = UDim.new(0, 0), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }) or v11.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 15)
                }), 
                Form = if v386 then v11.createElement("Frame", {
                    Size = UDim2.new(0.5, 0, 1, 0), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1
                }, {
                    FormContent = v11.createElement(v52, {
                        Size = UDim2.new(0, 0, 1, 0), 
                        crossDeviceLoginEnabled = v393, 
                        quickLoginButtonText = v396, 
                        loginWithExistingAccountVariantEnabled = v394, 
                        handleLoginWithFormDataCallback = v380.handleLoginWithFormData, 
                        updateIsLoginInProgress = v380.updateIsLoginInProgress, 
                        cvalueText = v380.cvalueText, 
                        passwordText = v380.passwordText, 
                        onTextBoxesChanged = v380.onTextBoxesChanged, 
                        buttonRef = v380.props.defaultRef, 
                        cvalueRef = v380.cvalueRef, 
                        passwordRef = v380.passwordRef, 
                        loginButtonRef = v380.loginButtonRef, 
                        forgotLinkRef = v380.forgotLinkRef, 
                        crossDeviceButtonRef = v380.crossDeviceButtonRef, 
                        emailOtpRef = v380.emailOtpRef, 
                        localizedError = v395.localizedError, 
                        localizedErrorMessage = v382, 
                        forceLoginByUsername = v380.state.forceLoginByUsername or v384, 
                        onCrossDeviceLoginActivated = v380.onCrossDeviceLoginActivated, 
                        onEmailOtpActivated = v380.onEmailOtpLoginActivated, 
                        loginButtonDisabled = v380.state.loginButtonDisabled, 
                        isLoginInProgress = v380.state.isLoginInProgress, 
                        authAnalytics = v380.props.authAnalytics, 
                        disableRegularLogin = v383, 
                        showLinkAccountText = v398, 
                        showForgotButton = not v383 and not v384, 
                        onForgetButtonActivated = v380.onForgetButtonActivated, 
                        maxSizeX = 1e999, 
                        showDisclaimerLinks = not v384 and not (v389 or v390), 
                        showDisclaimerButtons = v384 and not v389, 
                        showCredentialHeader = not v384, 
                        isDualLayout = true, 
                        isTenFootUiMode = v384, 
                        emailOtpEnabled = v388, 
                        LayoutOrder = 2
                    })
                }) else v11.createElement(v52, {
                    crossDeviceLoginEnabled = v393, 
                    quickLoginButtonText = v396, 
                    loginWithExistingAccountVariantEnabled = v394, 
                    handleLoginWithFormDataCallback = v380.handleLoginWithFormData, 
                    updateIsLoginInProgress = v380.updateIsLoginInProgress, 
                    cvalueText = v380.cvalueText, 
                    passwordText = v380.passwordText, 
                    onTextBoxesChanged = v380.onTextBoxesChanged, 
                    buttonRef = v380.props.defaultRef, 
                    cvalueRef = v380.cvalueRef, 
                    passwordRef = v380.passwordRef, 
                    loginButtonRef = v380.loginButtonRef, 
                    forgotLinkRef = v380.forgotLinkRef, 
                    crossDeviceButtonRef = v380.crossDeviceButtonRef, 
                    emailOtpRef = v380.emailOtpRef, 
                    localizedError = v395.localizedError, 
                    localizedErrorMessage = v382, 
                    forceLoginByUsername = v380.state.forceLoginByUsername or v384, 
                    onCrossDeviceLoginActivated = v380.onCrossDeviceLoginActivated, 
                    onEmailOtpActivated = v380.onEmailOtpLoginActivated, 
                    loginButtonDisabled = v380.state.loginButtonDisabled, 
                    isLoginInProgress = v380.state.isLoginInProgress, 
                    authAnalytics = v380.props.authAnalytics, 
                    disableRegularLogin = v383, 
                    showLinkAccountText = v380.props.appPolicy.getUseSingleSignOn(), 
                    showForgotButton = not v383 and v386 and not v384, 
                    onForgetButtonActivated = v380.onForgetButtonActivated, 
                    maxSizeX = v386 and 1e999 or 360, 
                    showDisclaimerLinks = v386 and not v384 and not (v389 or v390), 
                    showDisclaimerButtons = v386 and v384 and not v389, 
                    showCredentialHeader = v386 and not v384, 
                    isDualLayout = v386, 
                    isTenFootUiMode = v384, 
                    emailOtpEnabled = v388
                }), 
                Divider = v386 and v11.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(0, v392.Tokens.Global.Size_500, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    v11.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v392.Tokens.Global.Size_150)
                    }), 
                    v11.createElement("Frame", {
                        Size = UDim2.new(0, v392.Tokens.Global.Size_25, 0.5, 0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = v392.Tokens.Global.Color.Smoke.Color3, 
                        LayoutOrder = 1
                    }), 
                    v11.createElement("TextLabel", {
                        Text = v395.orText, 
                        TextSize = v392.Tokens.Global.Size_200, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextTransparency = 0, 
                        TextColor3 = v392.Tokens.Global.Color.Smoke.Color3, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }), 
                    v11.createElement("Frame", {
                        Size = UDim2.new(0, v392.Tokens.Global.Size_25, 0.5, 0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = v392.Tokens.Global.Color.Smoke.Color3, 
                        LayoutOrder = 3
                    })
                }) or nil, 
                LoginCode = v386 and v11.createElement("Frame", {
                    Size = UDim2.new(0.5, 0, 1, 0), 
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1
                }, {
                    v11.createElement(v53, {
                        loginCallback = v380.handleLoginWithCode, 
                        isOverlay = false, 
                        hideDeviceCode = not v384, 
                        showLockIcon = not v384, 
                        isDualLayout = true
                    })
                }), 
                Forgot = if not not v383 or v386 or v391 then nil else v11.createElement(l_LinkButton_0, {
                    text = v395.forgotText, 
                    size = UDim2.new(0, 0, 0, 30), 
                    fontStyle = "Footer", 
                    onActivated = v380.onForgetButtonActivated, 
                    colorStyleDefault = "TextDefault", 
                    colorStyleHover = "TextDefault"
                }), 
                DisclaimerLinks = if not not v386 or v389 or v390 then nil else v11.createElement(v38, {
                    fillDirection = Enum.FillDirection.Vertical, 
                    LayoutOrder = 60
                }), 
                Padding = not v386 and v11.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v153), 
                    LayoutOrder = 61
                }) or nil
            });
        end);
    end);
end;
v152 = l_RoactServices_0.connect({
    networking = v13, 
    analytics = v18, 
    authAnalytics = v15, 
    loggingProtocol = l_AppLogging_0, 
    linking = l_AppLinking_0
})(v152);
v152 = v12.connect(function(v399, _) --[[ Line: 2244 ]]
    local v401 = v399.Navigation.history[#v399.Navigation.history];
    return {
        currentPageName = v401[#v401].name, 
        screenSize = v399.ScreenSize, 
        statusBarHeight = v399.TopBar.statusBarHeight, 
        globalGuiInset = v399.GlobalGuiInset
    };
end, function(v402) --[[ Line: 2252 ]]
    -- upvalues: v25 (copy), v26 (copy), v27 (copy), v28 (copy), v30 (copy), v71 (copy), v82 (copy), v124 (copy), v121 (copy), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (copy), l_AccountSwitcherConstants_0 (copy), v69 (copy), v107 (copy), v112 (copy), l_GuiService_0 (copy), v122 (copy), v35 (copy), v32 (copy), v34 (copy), v33 (copy), v36 (copy), v59 (copy), v125 (copy), v37 (copy), v39 (copy), v89 (copy), v41 (copy), v42 (copy), v79 (copy), v31 (copy), v81 (copy), v40 (copy), v109 (copy), v43 (copy)
    return {
        login = function(...) --[[ Line: 2254 ]] --[[ Name: login ]]
            -- upvalues: v402 (copy), v25 (ref)
            return v402(v25(...));
        end, 
        loginByCode = function(...) --[[ Line: 2257 ]] --[[ Name: loginByCode ]]
            -- upvalues: v402 (copy), v26 (ref)
            return v402(v26(...));
        end, 
        loginByPasskey = function(...) --[[ Line: 2260 ]] --[[ Name: loginByPasskey ]]
            -- upvalues: v402 (copy), v27 (ref)
            return v402(v27(...));
        end, 
        loginByOtp = function(...) --[[ Line: 2263 ]] --[[ Name: loginByOtp ]]
            -- upvalues: v402 (copy), v28 (ref)
            return v402(v28(...));
        end, 
        launchApp = function(v403, v404, v405, v406) --[[ Line: 2266 ]] --[[ Name: launchApp ]]
            -- upvalues: v402 (copy), v30 (ref), v71 (ref)
            return v402(v30(v403, v404, v405, v406, v71.Login));
        end, 
        clearApp = function() --[[ Line: 2272 ]] --[[ Name: clearApp ]]
            -- upvalues: v402 (copy), v82 (ref), v124 (ref)
            v402(v82());
            return v124.resolve(true);
        end, 
        handleLoginCompletionWithAccountSwitching = function(v407, v408, v409, v410, v411, v412, v413) --[[ Line: 2277 ]] --[[ Name: handleLoginCompletionWithAccountSwitching ]]
            -- upvalues: v121 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), v69 (ref), v107 (ref), v112 (ref), l_GuiService_0 (ref), v122 (ref)
            if v121.fromLocalStorage().userId ~= -1 then
                v412():andThen(function(_) --[[ Line: 2288 ]]
                    -- upvalues: l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), v69 (ref), v107 (ref), v411 (copy), v112 (ref), l_GuiService_0 (ref), v122 (ref)
                    local v415 = if l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 then l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromLoginStatus else v69.Auth.AccountSwitcherSwitchedStatus;
                    v107.setAccountSwitchStatus(v415);
                    v107.setAccountBlob(v411);
                    v107.flush();
                    if v112 then
                        l_GuiService_0:BroadcastNotification("", v122.DID_SWITCH_ACCOUNT);
                        return;
                    else
                        l_GuiService_0:BroadcastNotification("", v122.DID_LOG_OUT);
                        return;
                    end;
                end, function(_) --[[ Line: 2300 ]]
                    -- upvalues: v107 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), v411 (copy), v413 (copy), v407 (copy), v408 (copy), v409 (copy), v410 (copy)
                    v107.setAccountSwitchStatus(if l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 then l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromLoginStatus else "switched");
                    v107.setAccountBlob(v411);
                    v107.flush();
                    v413(v407, v408, v409, v410);
                end);
                return;
            else
                v107.setAccountBlob(v411);
                v107.flush();
                v413(v407, v408, v409, v410);
                return;
            end;
        end, 
        setBackNavigationDisabled = function(v417) --[[ Line: 2317 ]] --[[ Name: setBackNavigationDisabled ]]
            -- upvalues: v402 (copy), v35 (ref)
            return v402(v35(v417));
        end, 
        navigateToPage = function(v418) --[[ Line: 2320 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v402 (copy), v32 (ref)
            return v402(v32(v418));
        end, 
        setLoginResult = function(v419) --[[ Line: 2323 ]] --[[ Name: setLoginResult ]]
            -- upvalues: v402 (copy), v34 (ref)
            v402(v34(v419));
        end, 
        openPasswordResetPrompt = function() --[[ Line: 2326 ]] --[[ Name: openPasswordResetPrompt ]]
            -- upvalues: v402 (copy), v33 (ref)
            v402(v33());
        end, 
        openEmailVerificationPrompt = function(v420, v421, v422) --[[ Line: 2329 ]] --[[ Name: openEmailVerificationPrompt ]]
            -- upvalues: v402 (copy), v36 (ref), v59 (ref)
            v402(v36(v59.LoginEmailVerificationPrompt, {
                credentialValue = v420, 
                password = v421, 
                onClose = v422
            }));
        end, 
        openNewAppAvailableModal = function(v423) --[[ Line: 2336 ]] --[[ Name: openNewAppAvailableModal ]]
            -- upvalues: v125 (ref), v402 (copy), v36 (ref), v59 (ref)
            if v125() then
                v402(v36(v59.NewAppAvailableModal, {
                    onButtonActivated = v423
                }));
            end;
        end, 
        openCrossDeviceLoginPrompt = function(v424) --[[ Line: 2343 ]] --[[ Name: openCrossDeviceLoginPrompt ]]
            -- upvalues: v402 (copy), v37 (ref)
            v402(v37.OpenLoginCodePrompt({
                loginCallback = v424, 
                isOverlay = true
            }));
        end, 
        openCrossAppLoginPrompt = function(v425) --[[ Line: 2349 ]] --[[ Name: openCrossAppLoginPrompt ]]
            -- upvalues: v402 (copy), v37 (ref)
            v402(v37.OpenLoginCodePrompt({
                loginCallback = v425, 
                isOverlay = true, 
                isCrossApp = true
            }));
        end, 
        openAccountSelector = function(v426) --[[ Line: 2356 ]] --[[ Name: openAccountSelector ]]
            -- upvalues: v402 (copy), v39 (ref), v89 (ref)
            v402(v39(v426, v89(), false));
        end, 
        openEmailOtp = function(v427) --[[ Line: 2361 ]] --[[ Name: openEmailOtp ]]
            -- upvalues: v402 (copy), v41 (ref)
            v402(v41(v427));
        end, 
        closeCentralOverlay = function() --[[ Line: 2364 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v402 (copy), v42 (ref)
            return v402(v42());
        end, 
        resetAppState = function() --[[ Line: 2367 ]] --[[ Name: resetAppState ]]
            -- upvalues: v402 (copy), v82 (ref)
            return v402(v82());
        end, 
        renderChallenge = function(v428, v429) --[[ Line: 2370 ]] --[[ Name: renderChallenge ]]
            -- upvalues: v402 (copy), v79 (ref)
            return v402(v79(v428, v429));
        end, 
        startPasskeyAuthentication = function(v430) --[[ Line: 2373 ]] --[[ Name: startPasskeyAuthentication ]]
            -- upvalues: v402 (copy), v31 (ref)
            return v402(v31(v430));
        end, 
        logoutAllLoggedInUsers = function(v431, v432) --[[ Line: 2376 ]] --[[ Name: logoutAllLoggedInUsers ]]
            -- upvalues: v402 (copy), v81 (ref)
            return v402(v81(v431, v432));
        end, 
        logoutWithoutShowConfirmation = function(v433, v434) --[[ Line: 2379 ]] --[[ Name: logoutWithoutShowConfirmation ]]
            -- upvalues: v402 (copy), v40 (ref)
            return v402(v40(v433, v434));
        end, 
        openAccountSwitchingErrorOverlay = function(v435, v436, v437, v438, v439, v440, v441, v442) --[[ Line: 2382 ]] --[[ Name: openAccountSwitchingErrorOverlay ]]
            -- upvalues: v402 (copy), v109 (ref)
            return v402(v109(v435, v436, v437, v438, v439, v440, v441, v442));
        end, 
        navigateBack = function() --[[ Line: 2405 ]] --[[ Name: navigateBack ]]
            -- upvalues: v402 (copy), v43 (ref)
            return v402(v43());
        end, 
        showAccountLinkingAlert = function(v443, v444) --[[ Line: 2408 ]] --[[ Name: showAccountLinkingAlert ]]
            -- upvalues: v402 (copy), v36 (ref), v59 (ref)
            return v402(v36(v59.AccountLinkingAlert, {
                alertType = v443, 
                userFacingMessage = v444
            }));
        end
    };
end)(v152);
v152 = l_RoactAppPolicy_0.connect(function(v445, _) --[[ Line: 2417 ]]
    return {
        appPolicy = v445
    };
end)(v152);
v152 = v16.connectBrowserTrackerLayer({
    l_AppBtidLayers_0.LoginLayer
}, function(v447, _) --[[ Line: 2425 ]]
    -- upvalues: l_AppBtidLayers_0 (copy), v141 (copy)
    local v449 = v447[l_AppBtidLayers_0.LoginLayer] or {};
    return {
        isLoginWithOtpEnabled = v141 or v449.IsLoginWithOtpEnabled, 
        shouldLoginWithKeystoreCredentials = v449.shouldLoginWithKeystoreCredentials
    };
end)(v152);
v152 = l_withNavigationProps_0(function(_, v451) --[[ Line: 2434 ]]
    return v451;
end)(v152);
return function(v452) --[[ Line: 2438 ]] --[[ Name: LoginViewFn ]]
    -- upvalues: l_useUiModeInfo_0 (copy), v19 (copy), v11 (copy), v152 (ref), v9 (copy)
    local v453 = l_useUiModeInfo_0();
    local v454, v455 = v19.useDefaultFocusBehavior();
    return v11.createElement(v152, v9.Dictionary.join({
        uiModeInfo = v453, 
        defaultRef = v454, 
        containerRef = v455
    }, v452));
end;