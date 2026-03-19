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
local l_FFlagEnableCredentialsProtocolLoggingFix_0 = v74.FFlagEnableCredentialsProtocolLoggingFix;
local l_FFlagEnablePasskeyLoginErrorLogging_0 = v74.FFlagEnablePasskeyLoginErrorLogging;
local l_FFlagUseErrorTypeForPasskeyLoginLogging_0 = v74.FFlagUseErrorTypeForPasskeyLoginLogging;
local l_FFlagAuthSecExclusions_0 = v74.FFlagAuthSecExclusions;
local l_FFlagEnablePWManagerLoginCheck_0 = v74.FFlagEnablePWManagerLoginCheck;
local l_FFlagEnableAuthDeepLinkReceiver_0 = v74.FFlagEnableAuthDeepLinkReceiver;
local l_PreAuthDeepLinkUrlStore_0 = v20.Stores.PreAuthDeepLinkUrlStore;
local v122 = require(script.Parent.Parent.Parent.Thunks.Authentication.User);
local v123 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v125 = require(l_CorePackages_0.Packages.Promise);
local v126 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVNGNewAppAvailableModal);
local v127 = require(l_Modules_0.LuaApp.Flags.GetFStringVNGDownloadNowUrl);
local v128 = game:DefineFastFlag("FixLoginSelection", false);
local v129 = require(l_Modules_0.LuaApp.Flags.FFlagEnableVNGDUARSignupCompliance);
local l_GetFFlagEnableAccountSwitcherFoundationDesign_0 = v74.GetFFlagEnableAccountSwitcherFoundationDesign;
local v131 = require(l_Modules_0.LuaApp.Flags.FFlagEnableIosKeychainLoginLua);
local l_GetUserByUsername_0 = v20.Thunks.GetUserByUsername;
local l_withNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).withNavigationProps;
local l_KeystoreConstants_0 = v20.Common.KeystoreConstants;
local l_KeystoreAnalyticsEvents_0 = v20.Analytics.KeystoreAnalyticsEvents;
local l_KeystoreEventConstants_0 = v20.Analytics.KeystoreEventConstants;
local l_AccountLinkingAlertType_0 = v20.Enums.AccountLinkingAlertType;
local l_TwoStepErrorCodes_0 = v20.Enums.TwoStepErrorCodes;
local l_getTwoStepLoginErrorKey_0 = v20.Utils.getTwoStepLoginErrorKey;
local v140 = game:DefineFastFlag("LoginButtonAutoDisabled", false);
local v141 = game:DefineFastFlag("EnableTwoStepLoginChallengeAnalytics", false);
local v142 = game:DefineFastFlag("DebugOTPBypass", false);
local l_GetFFlagBypassKeystoreLoginIxpV2_0 = v74.GetFFlagBypassKeystoreLoginIxpV2;
local l_GetFFlagEnableLuafiedRecoveryFlow_0 = v74.GetFFlagEnableLuafiedRecoveryFlow;
local l_FFlagDisableMemStorageServicePasswordEvent_0 = v74.FFlagDisableMemStorageServicePasswordEvent;
local l_FFlagEnableLoginV1ForcedUsernameOverride_0 = v74.FFlagEnableLoginV1ForcedUsernameOverride;
local l_GetFFlagKeystoreAutoLoginAvailable_0 = v74.GetFFlagKeystoreAutoLoginAvailable;
local l_GetFFlagCheckIsAvailableForKeystoreOperations_0 = v74.GetFFlagCheckIsAvailableForKeystoreOperations;
local l_GetFFlagEnable2SVRecovery_0 = require(l_CorePackages_0.Workspace.Packages.AccountRecovery).Flags.GetFFlagEnable2SVRecovery;
local v150 = require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeFeature);
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local l_PasskeyConstants_0 = v20.Common.PasskeyConstants;
local v153 = v11.PureComponent:extend("LoginView");
local v154 = v87();
local v155 = {
    CValue = 1, 
    Password = 2
};
v153.init = function(v156) --[[ Line: 210 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), v128 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), v110 (copy), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (copy), l_FFlagEnablePWManagerLoginCheck_0 (copy), l_GetPasswordManagerUsageStore_0 (copy), v55 (copy), v155 (copy), v122 (copy), v107 (copy), l_MemStorageService_0 (copy), v58 (copy), l_UserInputService_0 (copy), v44 (copy), v65 (copy), v66 (copy), l_HttpService_0 (copy), v51 (copy), l_default_0 (copy), l_Logger_0 (copy), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (copy), l_CredentialsProtocolErrorCodes_0 (copy), v68 (copy), l_PasskeyConstants_0 (copy), l_FFlagEnablePasskeyLoginErrorLogging_0 (copy), v88 (copy), v75 (copy), v76 (copy), v77 (copy), v141 (copy), v83 (copy), l_GetFFlagEnable2SVRecovery_0 (copy), v80 (copy), v93 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (copy), v91 (copy), l_FFlagPasswordManagerAwaitEnabled_0 (copy), v98 (copy), l_TwoStepErrorCodes_0 (copy), l_getTwoStepLoginErrorKey_0 (copy), l_AccountLinkingAlertType_0 (copy), l_isStringEmail_0 (copy), l_isStringPhone_0 (copy), v113 (copy), v90 (copy), v89 (copy), v125 (copy), v131 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (copy), l_ContentProvider_0 (copy), l_GetUserByUsername_0 (copy), v108 (copy), l_KeystoreConstants_0 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (copy), v29 (copy), v150 (copy), v85 (copy), l_Constants_0 (copy), v114 (copy), l_FFlagEnableCredentialsProtocolLoggingFix_0 (copy), v81 (copy), l_GuiService_0 (copy), v78 (copy), l_StatusCodes_0 (copy), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (copy), v69 (copy), v60 (copy), v126 (copy), v127 (copy), l_GetFFlagEnableLuafiedRecoveryFlow_0 (copy), l_enrolledInLuafiedRecoveryExperiment_0 (copy), v24 (copy), v54 (copy), v94 (copy), l_RbxAnalyticsService_0 (copy)
    v156.cvalueRef = v11.createRef();
    v156.passwordRef = v11.createRef();
    v156.loginButtonRef = v11.createRef();
    v156.forgotLinkRef = v11.createRef();
    v156.crossDeviceButtonRef = v11.createRef();
    v156.emailOtpRef = v11.createRef();
    if v128 then
        v156.focusRef = v11.createRef();
    end;
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(l_LocalStorageKey_0.CredentialValue);
    if v110 then
        local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem(l_LocalStorageKey_0.AccountBlob);
        if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
            l_l_AppStorageService_0_Item_0 = "";
        end;
    end;
    if l_FFlagEnableLoginV1ForcedUsernameOverride_0 and v156.props.forcedUsernameOverride then
        l_l_AppStorageService_0_Item_0 = v156.props.forcedUsernameOverride;
    end;
    local v159, v160 = v11.createBinding(l_l_AppStorageService_0_Item_0);
    v156.cvalueText = v159;
    v156.updateCValueText = v160;
    v159, v160 = v11.createBinding("");
    v156.passwordText = v159;
    v156.updatePasswordText = v160;
    v156.state = {
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
    v156.passwordManagerUsageStore = if l_FFlagEnablePWManagerLoginCheck_0 then l_GetPasswordManagerUsageStore_0(false) else nil;
    if v156.passwordManagerUsageStore then
        v156.passwordManagerUsageStore.setLoggedinUsingSavedPassword(false);
        v156.passwordManagerUsageStore.setSavedPasswordAfterLogin(false);
    end;
    v156.errorHandlingInfoList = {
        [v55.IncorrectCValueOrPassword] = {
            textBoxesToClear = {
                v155.Password
            }, 
            newFocusedTextBox = v155.Password
        }, 
        [v55.CValueAndPasswordRequired] = {
            textBoxesToClear = {
                v155.Password
            }, 
            newFocusedTextBox = v155.Password
        }, 
        [v55.AccountLocked] = {
            textBoxesToClear = {
                v155.Password
            }
        }, 
        [v55.MoreThanOneUsername] = {
            textBoxesToClear = {
                v155.CValue, 
                v155.Password
            }, 
            newFocusedTextBox = v155.CValue, 
            forceLoginByUsername = true
        }, 
        [v55.AccountNotVerified] = {
            textBoxesToClear = {
                v155.CValue, 
                v155.Password
            }, 
            forceLoginByUsername = true
        }, 
        [v55.MultipleUsersPerCredential] = if v156.props.appPolicy.getAccountDisambiguationDisabled() then {
            textBoxesToClear = {
                v155.CValue, 
                v155.Password
            }, 
            newFocusedTextBox = v155.CValue, 
            forceLoginByUsername = true
        } else nil
    };
    v156.isAlreadyAuthenticated = v122.fromLocalStorage().userId ~= -1;
    resetDefaultTheme = function() --[[ Line: 294 ]]
        -- upvalues: v107 (ref), l_MemStorageService_0 (ref), v58 (ref)
        local v161 = v107.getAuthenticatedTheme();
        if v161 ~= "" then
            l_MemStorageService_0:Fire(v58.ThemeUpdate, v161);
        end;
    end;
    v156.updateIsLoginInProgress = function(v162) --[[ Line: 301 ]]
        -- upvalues: v156 (copy)
        spawn(function() --[[ Line: 302 ]]
            -- upvalues: v156 (ref), v162 (copy)
            local l_isLoginInProgress_0 = v156.state.isLoginInProgress;
            if v156.isMounted and l_isLoginInProgress_0 ~= v162 then
                v156:setState({
                    isLoginInProgress = v162
                });
            end;
        end);
    end;
    v156.onTextBoxesChanged = function(v164) --[[ Line: 312 ]]
        -- upvalues: v156 (copy)
        if not v156.cvalueRef.current or not v156.passwordRef.current or not v156.isMounted then
            return;
        else
            local v165 = v164.Text:gsub("\t", "");
            if v164.Text ~= v165 then
                v164.Text = v165;
            end;
            local l_v156_0 = v156;
            local v167 = {};
            local v168 = true;
            if #v156.cvalueRef.current.Text ~= 0 then
                v168 = #v156.passwordRef.current.Text == 0;
            end;
            v167.loginButtonDisabled = v168;
            v167.errorKey = #v164.Text == 0 and v156.state.errorKey or "";
            v167.errorCode = -1;
            l_v156_0:setState(v167);
            return;
        end;
    end;
    v156.unfocusTextBoxes = function() --[[ Line: 330 ]]
        -- upvalues: l_UserInputService_0 (ref), v156 (copy)
        local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
        if l_l_UserInputService_0_FocusedTextBox_0 and (l_l_UserInputService_0_FocusedTextBox_0 == v156.cvalueRef.current or l_l_UserInputService_0_FocusedTextBox_0 == v156.passwordRef.current) then
            l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
        end;
    end;
    v156.handleCaptchaResult = function(v170, v171) --[[ Line: 339 ]]
        -- upvalues: v156 (copy)
        if v170 then
            v156.handleLoginWithFormData(v171);
            return;
        else
            v156.updateIsLoginInProgress(false);
            return;
        end;
    end;
    v156.getCaptchaResultHandlerWithCode = function(v172, v173) --[[ Line: 347 ]]
        -- upvalues: v156 (copy)
        return function(v174, v175) --[[ Line: 348 ]]
            -- upvalues: v156 (ref), v172 (copy), v173 (copy)
            if v174 then
                v156.handleLoginWithCode(v172, v173, v175);
                return;
            else
                v156.updateIsLoginInProgress(false);
                return;
            end;
        end;
    end;
    v156.getSecurityQuestionsLoginWithCodeCallback = function(v176, v177) --[[ Line: 357 ]]
        -- upvalues: v156 (copy)
        return function(v178) --[[ Line: 358 ]]
            -- upvalues: v156 (ref), v176 (copy), v177 (copy)
            v156.handleLoginWithCode(v176, v177, nil, v178);
        end;
    end;
    v156.getSecurityQuestionsLoginWithOtpCallback = function() --[[ Line: 363 ]]
        -- upvalues: v156 (copy)
        return function(v179) --[[ Line: 364 ]]
            -- upvalues: v156 (ref)
            v156.handleLoginWithOtp(v179, nil);
        end;
    end;
    v156.getSecurityQuestionsLoginWithFormDataCallback = function() --[[ Line: 369 ]]
        -- upvalues: v156 (copy)
        return function(v180) --[[ Line: 370 ]]
            -- upvalues: v156 (ref)
            v156.handleLoginWithFormData(nil, v180);
        end;
    end;
    v156.canVerifyCredentials = function(v181, v182, v183) --[[ Line: 375 ]]
        -- upvalues: v44 (ref), v156 (copy)
        return v44(v156.props.networking, v181, v182, v183):andThen(function(v184) --[[ Line: 377 ]]
            return v184 and v184.responseBody and v184.responseBody.canSend;
        end, function() --[[ Line: 380 ]]
            return false;
        end);
    end;
    v156.handleLoginWithCode = function(v185, v186, v187, v188) --[[ Line: 386 ]]
        -- upvalues: v156 (copy), v55 (ref), v65 (ref), v66 (ref)
        v156.updateIsLoginInProgress(true);
        local l_setBackNavigationDisabled_0 = v156.props.setBackNavigationDisabled;
        v156.unfocusTextBoxes();
        l_setBackNavigationDisabled_0(true);
        local l_loginByCode_0 = v156.props.loginByCode;
        local v191 = v156.getCaptchaResultHandlerWithCode(v185, v186);
        local v192 = v156.getSecurityQuestionsLoginWithCodeCallback(v185, v186);
        return l_loginByCode_0(v156.props.networking, v185, v186, v191, v187, v192, v188):andThen(function(v193) --[[ Line: 407 ]]
            -- upvalues: v156 (ref)
            v156.handleLoginResult(v193, nil);
        end, function(v194) --[[ Line: 409 ]]
            -- upvalues: v55 (ref), v65 (ref), v66 (ref), v156 (ref), v185 (copy), v186 (copy)
            if v194.errorCode ~= v55.Captcha then
                v65(v66.FailureAuthCode, 1);
            end;
            v156.handleLoginError(v194, v185, v186);
        end);
    end;
    v156.handleLoginWithPasskey = function(v195, v196) --[[ Line: 417 ]]
        -- upvalues: v156 (copy)
        v156.updateIsLoginInProgress(true);
        local l_setBackNavigationDisabled_1 = v156.props.setBackNavigationDisabled;
        v156.unfocusTextBoxes();
        l_setBackNavigationDisabled_1(true);
        return v156.props.loginByPasskey(v156.props.networking, v195, v196):andThen(function(v198) --[[ Line: 425 ]]
            -- upvalues: v156 (ref)
            v156.handleLoginResult(v198, nil);
        end, function(v199) --[[ Line: 427 ]]
            -- upvalues: v156 (ref), v195 (copy)
            v156.handleLoginError(v199, v195);
        end);
    end;
    v156.showPasskeyLoginPopup = function() --[[ Line: 432 ]]
        -- upvalues: v156 (copy), l_HttpService_0 (ref), l_UserInputService_0 (ref), v51 (ref), l_default_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), v68 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref)
        local l_networking_0 = v156.props.networking;
        return v156.props.startPasskeyAuthentication(l_networking_0):andThen(function(v201) --[[ Line: 435 ]]
            -- upvalues: l_HttpService_0 (ref), l_UserInputService_0 (ref), v51 (ref), l_default_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), v156 (ref), v68 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref)
            local v202 = l_HttpService_0:JSONDecode(v201.authenticationOptions);
            local l_sessionId_0 = v201.sessionId;
            local v204 = tonumber(v202.publicKey.timeout);
            v202.keyType = "platform";
            v202.deviceBoundOnly = true;
            if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                v202.publicKey.challenge = v51.FromUrlSafeBase64(v202.publicKey.challenge);
            end;
            local v205 = l_HttpService_0:JSONEncode(v202);
            l_default_0:getCredentials(l_default_0.CredentialsTypes.FIDO2, v205, v204):andThen(function(v206) --[[ Line: 452 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), v156 (ref), v68 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), v51 (ref), l_sessionId_0 (copy)
                local v207 = l_HttpService_0:JSONDecode(v206);
                if v207 == nil or next(v207) == nil then
                    l_Logger_0:info("Passkey credential signing failed. No result returned.");
                    return;
                else
                    if v207.errorCode ~= nil then
                        l_Logger_0:info("Passkey credential signing failed. Error {} (msg: {}) returned.", v207.errorCode, v207.errorMsg);
                        if l_FFlagUseErrorTypeForPasskeyLoginLogging_0 then
                            local v208 = tonumber(v207.errorCode);
                            local v209 = l_CredentialsProtocolErrorCodes_0.GetCredentialsErrorCodes[v208 or -1] or string.format(l_CredentialsProtocolErrorCodes_0.UNMAPPED_ERROR_CODE, (tostring(v207.errorCode)));
                            v156.props.authAnalytics.reportAuthClientError(v68.Context.PasskeyLoginAttempt, v209, l_PasskeyConstants_0.PASSKEY_FETCH_LOGIN_V1);
                            return;
                        elseif l_FFlagEnablePasskeyLoginErrorLogging_0 and type(v207.errorMsg) == "string" then
                            v156.props.authAnalytics.reportAuthClientError(v68.Context.PasskeyLoginAttempt, v207.errorMsg, l_PasskeyConstants_0.PASSKEY_FETCH_LOGIN_V1);
                            return;
                        end;
                    else
                        l_Logger_0:info("Passkey credential signing completed. Attempting login.");
                        v207.id = v51.ToUrlSafeBase64(v207.id);
                        v207.rawId = v51.ToUrlSafeBase64(v207.rawId);
                        v207.response.signature = v51.ToUrlSafeBase64(v207.response.signature);
                        v207.response.userHandle = v51.ToUrlSafeBase64(v207.response.userHandle);
                        v207.response.authenticatorData = v51.ToUrlSafeBase64(v207.response.authenticatorData);
                        v207.response.clientDataJSON = v51.ToUrlSafeBase64(v207.response.clientDataJSON);
                        v156.handleLoginWithPasskey(v207, l_sessionId_0);
                    end;
                    return;
                end;
            end, function(v210) --[[ Line: 499 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Passkey credential signing failed. Error: {}", v210);
            end);
        end, function(v211) --[[ Line: 503 ]]
            -- upvalues: l_Logger_0 (ref)
            l_Logger_0:warning("Fetching passkey login options failed with error code: {}", v211.errorCode);
        end);
    end;
    v156.showGenericCredentialLoginPopup = function(v212, v213) --[[ Line: 508 ]]
        -- upvalues: v156 (copy), l_HttpService_0 (ref), l_UserInputService_0 (ref), v51 (ref), l_Logger_0 (ref), l_default_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), v68 (ref), l_PasskeyConstants_0 (ref)
        if not v212 and not v213 then
            return;
        else
            local l_networking_1 = v156.props.networking;
            local l_startPasskeyAuthentication_0 = v156.props.startPasskeyAuthentication;
            local v216 = nil;
            local v217 = nil;
            local v218 = nil;
            local v219 = {};
            if v212 then
                l_startPasskeyAuthentication_0(l_networking_1):andThen(function(v220) --[[ Line: 520 ]]
                    -- upvalues: v216 (ref), l_HttpService_0 (ref), v217 (ref), v218 (ref), l_UserInputService_0 (ref), v51 (ref)
                    v216 = l_HttpService_0:JSONDecode(v220.authenticationOptions);
                    v217 = v220.sessionId;
                    v218 = tonumber(v216.publicKey.timeout);
                    v216.keyType = "platform";
                    v216.deviceBoundOnly = true;
                    if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                        v216.publicKey.challenge = v51.FromUrlSafeBase64(v216.publicKey.challenge);
                    end;
                end, function(v221) --[[ Line: 534 ]]
                    -- upvalues: l_Logger_0 (ref)
                    l_Logger_0:warning("Fetching passkey login options failed with error code: {}", v221.errorCode);
                end):await();
                if v216 ~= nil then
                    v219.FIDO2 = v216;
                end;
            end;
            if v213 then
                v219.password = {};
            end;
            local v222 = l_HttpService_0:JSONEncode(v219);
            return l_default_0:getCredentials(l_default_0.CredentialsTypes.all, v222, v218 / 1000):andThen(function(v223) --[[ Line: 551 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), v156 (ref), v68 (ref), l_PasskeyConstants_0 (ref), l_default_0 (ref), v51 (ref), v217 (ref)
                local v224 = l_HttpService_0:JSONDecode(v223);
                if v224 == nil or not v224.response and not v224.errorCode then
                    l_Logger_0:info("Generic credential fetch failed. No result returned.");
                    return;
                else
                    if v224.errorCode ~= nil then
                        l_Logger_0:info("Generic credential fetch failed. Error {} (msg: {}) returned.", v224.errorCode, v224.errorMsg);
                        if l_FFlagEnablePasskeyLoginErrorLogging_0 and type(v224.errorMsg) == "string" then
                            v156.props.authAnalytics.reportAuthClientError(v68.Context.PasskeyLoginAttempt, v224.errorMsg, l_PasskeyConstants_0.GENERIC_CREDENTIAL_FETCH_LOGIN_V1);
                            return;
                        end;
                    elseif v224.credentialType == l_default_0.CredentialsTypes.password then
                        local l_username_0 = v224.response.username;
                        local l_password_0 = v224.response.password;
                        v156.updateCValueText(l_username_0);
                        v156.updatePasswordText(l_password_0);
                        v156.props.authAnalytics.reportAuthButtonClick(v68.Context.CMPasswordLogin, v68.Button.SelectPassword);
                        v156.updateIsLoginInProgress(true);
                        v156.handleLoginWithFormData(nil, nil, nil, true);
                        return;
                    elseif v224.credentialType == l_default_0.CredentialsTypes.FIDO2 then
                        v224.response.id = v51.ToUrlSafeBase64(v224.response.id);
                        v224.response.rawId = v51.ToUrlSafeBase64(v224.response.rawId);
                        v224.response.response.signature = v51.ToUrlSafeBase64(v224.response.response.signature);
                        v224.response.response.userHandle = v51.ToUrlSafeBase64(v224.response.response.userHandle);
                        v224.response.response.authenticatorData = v51.ToUrlSafeBase64(v224.response.response.authenticatorData);
                        v224.response.response.clientDataJSON = v51.ToUrlSafeBase64(v224.response.response.clientDataJSON);
                        v156.handleLoginWithPasskey(v224.response, v217);
                    end;
                    return;
                end;
            end, function(v227) --[[ Line: 599 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Generic credential signing failed. Error: {}", v227);
            end);
        end;
    end;
    v156.handleLoginWithOtp = function(v228, v229) --[[ Line: 604 ]]
        -- upvalues: v88 (ref), v156 (copy)
        if not v88() and v156.props.isLoginWithOtpEnabled then
            return;
        else
            v156.updateIsLoginInProgress(true);
            local l_setBackNavigationDisabled_2 = v156.props.setBackNavigationDisabled;
            v156.unfocusTextBoxes();
            l_setBackNavigationDisabled_2(true);
            local l_loginByOtp_0 = v156.props.loginByOtp;
            local v232 = v156.getSecurityQuestionsLoginWithOtpCallback();
            return l_loginByOtp_0(v156.props.networking, v156.state.otpSessionToken, v156.state.otpCode, v232, v228, v229):andThen(function(v233) --[[ Line: 627 ]]
                -- upvalues: v156 (ref)
                v156.handleLoginResult(v233, nil);
            end, function(v234) --[[ Line: 629 ]]
                -- upvalues: v156 (ref)
                v156.handleLoginError(v234, v156.state.otpSessionToken, v156.state.otpCode);
                return v234.errorKey;
            end);
        end;
    end;
    v156.validateFormCredentials = function(v235) --[[ Line: 635 ]]
        return #v235:gsub("%s+", "") > 0;
    end;
    v156.handleLoginWithFormData = function(v236, v237, v238, v239) --[[ Line: 639 ]]
        -- upvalues: v156 (copy), v55 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), v68 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), l_HttpService_0 (ref)
        if not v156.cvalueRef.current or not v156.passwordRef.current then
            return;
        else
            local l_Text_0 = v156.cvalueRef.current.Text;
            local l_Text_1 = v156.passwordRef.current.Text;
            if game:GetFastFlag("LuaLoginManualCredentialValidation") and not v156.validateFormCredentials(l_Text_0) then
                v156.handleLoginError({
                    errorKey = "Authentication.Login.Response.IncorrectUsernamePassword", 
                    errorCode = v55.IncorrectCValueOrPassword
                }, l_Text_0, l_Text_1);
                v156.updateCValueText("");
                return;
            else
                local l_setBackNavigationDisabled_3 = v156.props.setBackNavigationDisabled;
                v156.unfocusTextBoxes();
                l_setBackNavigationDisabled_3(true);
                local l_login_0 = v156.props.login;
                local l_handleCaptchaResult_0 = v156.handleCaptchaResult;
                return l_login_0(v156.props.networking, l_Text_0, l_Text_1, l_handleCaptchaResult_0, v236, v156.getSecurityQuestionsLoginWithFormDataCallback(), v237, v238, v156.state.forceLoginByUsername):andThen(function(v245) --[[ Line: 678 ]]
                    -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_Text_0 (copy), v239 (copy), v156 (ref), v68 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), l_HttpService_0 (ref), l_Text_1 (copy)
                    l_AppStorageService_0:SetItem(l_LocalStorageKey_0.CredentialValue, l_Text_0);
                    l_AppStorageService_0:flush();
                    if v239 then
                        v156.props.authAnalytics.reportAuthFormInteraction(v68.Context.CMPasswordLogin, nil, "success");
                        if l_FFlagEnablePWManagerLoginCheck_0 and v156.passwordManagerUsageStore then
                            v156.passwordManagerUsageStore.setLoggedinUsingSavedPassword(true);
                        end;
                    end;
                    local v246 = if not v239 then l_HttpService_0:JSONEncode({
                        cvalue = l_Text_0, 
                        password = l_Text_1, 
                        authType = "login"
                    }) else nil;
                    v156.handleLoginResult(v245, v246);
                end, function(v247) --[[ Line: 703 ]]
                    -- upvalues: v239 (copy), v156 (ref), v68 (ref), l_Text_0 (copy), l_Text_1 (copy)
                    if v239 then
                        v156.props.authAnalytics.reportAuthFormInteraction(v68.Context.CMPasswordLogin, nil, "error");
                    end;
                    v156.handleLoginError(v247, l_Text_0, l_Text_1);
                end);
            end;
        end;
    end;
    v156.renderSecurityQuestions = function(_, _, v250, v251) --[[ Line: 716 ]]
        -- upvalues: v156 (copy), v75 (ref)
        v156.props.renderChallenge({
            challengeType = v75.SecurityQuestions, 
            challengeParameters = {
                sessionId = v251.sessionId, 
                userId = v251.userId, 
                onChallengeCompleted = function(v252) --[[ Line: 722 ]] --[[ Name: onChallengeCompleted ]]
                    -- upvalues: v251 (copy), v250 (copy)
                    local v253 = {
                        sessionId = v251.sessionId, 
                        redemptionToken = v252.redemptionToken
                    };
                    v250(v253);
                end, 
                onChallengeInvalidated = function(v254) --[[ Line: 729 ]] --[[ Name: onChallengeInvalidated ]]
                    -- upvalues: v156 (ref)
                    v156.updateIsLoginInProgress(false);
                    if v156.isMounted then
                        if v254.errorCode ~= 0 then
                            v156:setState({
                                errorKey = false, 
                                localizedErrorMessage = v254.errorMessage
                            });
                            return;
                        else
                            v156:setState({
                                errorKey = "Authentication.Login.Response.SomethingWentWrong"
                            });
                        end;
                    end;
                end
            }, 
            onChallengeAbandoned = function() --[[ Line: 747 ]] --[[ Name: onChallengeAbandoned ]]
                -- upvalues: v156 (ref)
                v156.updateIsLoginInProgress(false);
            end, 
            onChallengeLoadFailed = function() --[[ Line: 750 ]] --[[ Name: onChallengeLoadFailed ]]
                -- upvalues: v156 (ref)
                v156.updateIsLoginInProgress(false);
                if v156.isMounted then
                    v156:setState({
                        errorKey = "Authentication.Login.Response.SomethingWentWrong"
                    });
                end;
            end, 
            forceWebViewVisible = true
        });
    end;
    v156.renderTwoStepChallenge = function(v255, v256) --[[ Line: 763 ]]
        -- upvalues: v156 (copy), v76 (ref), v77 (ref), v141 (ref), v68 (ref), v75 (ref), v83 (ref), l_GetFFlagEnable2SVRecovery_0 (ref), v80 (ref), v93 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v58 (ref), v91 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v65 (ref), v66 (ref), v110 (ref), v98 (ref), l_HttpService_0 (ref), l_TwoStepErrorCodes_0 (ref), l_getTwoStepLoginErrorKey_0 (ref), l_AccountLinkingAlertType_0 (ref)
        local l_launchApp_0 = v156.props.launchApp;
        local l_networking_2 = v156.props.networking;
        local l_appPolicy_0 = v156.props.appPolicy;
        local l_analytics_0 = v156.props.analytics;
        local l_omniRecommendationsRequest_0 = v156.props.omniRecommendationsRequest;
        local l_ticket_0 = v255.twoStepVerificationData.ticket;
        local l_id_0 = v255.user.id;
        local l_handleLoginCompletionWithAccountSwitching_0 = v156.props.handleLoginCompletionWithAccountSwitching;
        local l_clearApp_0 = v156.props.clearApp;
        if v76() then
            wait(v77());
        end;
        if v141 then
            v156.props.authAnalytics.reportAuthPageload(v68.Context.TwoStepLoginChallengeRenderInitiated, l_ticket_0);
        end;
        v156.props.renderChallenge({
            challengeType = v75.TwoStepVerification, 
            challengeParameters = {
                actionType = v83.Login, 
                challengeId = l_ticket_0, 
                userId = l_id_0, 
                allowRememberDevice = true, 
                clientSupports2svRecovery = l_GetFFlagEnable2SVRecovery_0() and true or false, 
                onChallengeCompleted = function(v266) --[[ Line: 793 ]] --[[ Name: onChallengeCompleted ]]
                    -- upvalues: v141 (ref), v156 (ref), v68 (ref), l_ticket_0 (copy), v80 (ref), l_networking_2 (copy), l_id_0 (copy), v93 (ref), v256 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v58 (ref), v91 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v65 (ref), v66 (ref), v110 (ref), l_handleLoginCompletionWithAccountSwitching_0 (copy), l_omniRecommendationsRequest_0 (copy), l_analytics_0 (copy), l_appPolicy_0 (copy), l_clearApp_0 (copy), l_launchApp_0 (copy), v98 (ref), l_HttpService_0 (ref), l_TwoStepErrorCodes_0 (ref), l_getTwoStepLoginErrorKey_0 (ref), l_AccountLinkingAlertType_0 (ref)
                    if v141 then
                        v156.props.authAnalytics.reportAuthPageload(v68.Context.TwoStepLoginChallengeCompleted, l_ticket_0);
                    end;
                    v80.login(l_networking_2, l_id_0, l_ticket_0, v266.verificationToken, v266.rememberDevice):andThen(function(v267) --[[ Line: 801 ]]
                        -- upvalues: v93 (ref), v256 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v58 (ref), v91 (ref), v156 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v65 (ref), v66 (ref), v110 (ref), l_handleLoginCompletionWithAccountSwitching_0 (ref), l_networking_2 (ref), l_omniRecommendationsRequest_0 (ref), l_analytics_0 (ref), l_appPolicy_0 (ref), l_clearApp_0 (ref), l_launchApp_0 (ref)
                        if v93() and v256 then
                            if not l_FFlagDisableMemStorageServicePasswordEvent_0 then
                                l_MemStorageService_0:Fire(v58.AuthenticatedCredentials, v256);
                            end;
                            if v91() and v156.state.isCredentialsProtocolRegisterPasswordAvailable then
                                if l_FFlagPasswordManagerAwaitEnabled_0 then
                                    v156.credentialsProtocolRegisterPassword(v256):await();
                                else
                                    v156.credentialsProtocolRegisterPassword(v256);
                                end;
                            end;
                        end;
                        v65(v66.Success, 1);
                        if v110 then
                            l_handleLoginCompletionWithAccountSwitching_0(l_networking_2, l_omniRecommendationsRequest_0, l_analytics_0, l_appPolicy_0, v267.responseBody.accountBlob, l_clearApp_0, l_launchApp_0);
                            return;
                        else
                            l_launchApp_0(l_networking_2, l_omniRecommendationsRequest_0, l_analytics_0, l_appPolicy_0);
                            return;
                        end;
                    end, function(v268) --[[ Line: 837 ]]
                        -- upvalues: l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), v93 (ref), v256 (ref), l_MemStorageService_0 (ref), v58 (ref), v65 (ref), v66 (ref), v98 (ref), l_HttpService_0 (ref), l_TwoStepErrorCodes_0 (ref), l_getTwoStepLoginErrorKey_0 (ref), v156 (ref), l_AccountLinkingAlertType_0 (ref)
                        if not l_FFlagDisableMemStorageServicePasswordEvent_0 and not v93() and v256 then
                            l_MemStorageService_0:Fire(v58.AuthenticatedCredentials, v256);
                        end;
                        v65(v66.Failure, 1);
                        local v269 = "Authentication.Login.Response.SomethingWentWrong";
                        if v98 then
                            local _, l_result_0 = pcall(function() --[[ Line: 852 ]]
                                -- upvalues: l_HttpService_0 (ref), v268 (copy)
                                return l_HttpService_0:JSONDecode(v268.Body).errors[1].code;
                            end);
                            if l_result_0 == l_TwoStepErrorCodes_0.IllegalChildAccountLinking then
                                v65(v66.FailureTwoStepVerification, 1);
                            else
                                v65(v66.FailureUnknownError, 1);
                            end;
                            v269 = l_getTwoStepLoginErrorKey_0(l_result_0);
                        else
                            v65(v66.FailureUnknownError, 1);
                        end;
                        v156.updateIsLoginInProgress(false);
                        if v156.isMounted then
                            v156:setState({
                                errorKey = v269
                            });
                        end;
                        if v268 and v268.Body then
                            local v272 = l_HttpService_0:JSONDecode(v268.Body);
                            local v273 = v272 and v272.errors and v272.errors[1] and v272.errors[1].code;
                            local v274 = v272 and v272.errors and v272.errors[1] and v272.errors[1].userFacingMessage;
                            if v273 == l_TwoStepErrorCodes_0.AccountLinkingRequired then
                                v156.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.IncompatibleAccounts, v274);
                            end;
                            if v273 == l_TwoStepErrorCodes_0.AccountLinkingFailed then
                                v156.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.RetryLogInConnectionFailure);
                            end;
                        end;
                    end);
                end, 
                onChallengeInvalidated = function(v275) --[[ Line: 895 ]] --[[ Name: onChallengeInvalidated ]]
                    -- upvalues: v141 (ref), v156 (ref), v68 (ref), l_ticket_0 (copy)
                    if v141 then
                        v156.props.authAnalytics.reportAuthPageload(v68.Context.TwoStepLoginChallengeInvalidated, l_ticket_0);
                    end;
                    v156.updateIsLoginInProgress(false);
                    if v156.isMounted then
                        if v275.errorCode ~= 0 then
                            v156:setState({
                                errorKey = false, 
                                localizedErrorMessage = v275.errorMessage
                            });
                            return;
                        else
                            v156:setState({
                                errorKey = "Authentication.Login.Response.SomethingWentWrong"
                            });
                        end;
                    end;
                end
            }, 
            onChallengeAbandoned = function() --[[ Line: 919 ]] --[[ Name: onChallengeAbandoned ]]
                -- upvalues: v141 (ref), v156 (ref), v68 (ref), l_ticket_0 (copy)
                if v141 then
                    v156.props.authAnalytics.reportAuthPageload(v68.Context.TwoStepLoginChallengeAbandoned, l_ticket_0);
                end;
                v156.updateIsLoginInProgress(false);
            end, 
            onChallengeLoadFailed = function() --[[ Line: 928 ]] --[[ Name: onChallengeLoadFailed ]]
                -- upvalues: v141 (ref), v156 (ref), v68 (ref), l_ticket_0 (copy)
                if v141 then
                    v156.props.authAnalytics.reportAuthPageload(v68.Context.TwoStepLoginChallengeLoadFailed, l_ticket_0);
                end;
                v156.updateIsLoginInProgress(false);
                if v156.isMounted then
                    v156:setState({
                        errorKey = "Authentication.Login.Response.SomethingWentWrong"
                    });
                end;
            end, 
            forceWebViewVisible = true
        });
    end;
    v156.handleMultipleUsersPerCredentialError = function(v276) --[[ Line: 948 ]]
        -- upvalues: v156 (copy), v68 (ref), l_isStringEmail_0 (ref), l_isStringPhone_0 (ref), v113 (ref), v90 (ref), v89 (ref)
        local v277 = "";
        if v156.state.isLoginByOtp then
            v277 = v68.Context.DisambiguationOTP;
        elseif l_isStringEmail_0(v156.props.cvalue) then
            v277 = v68.Context.DisambiguationEmail;
        elseif l_isStringPhone_0(v156.props.cvalue) then
            v277 = v68.Context.DisambiguationPhone;
        end;
        local v279 = {
            origin = v68.Context.Login, 
            context = v277, 
            users = v276, 
            onAccountSelection = function(v278) --[[ Line: 962 ]] --[[ Name: onAccountSelection ]]
                -- upvalues: v156 (ref), v113 (ref)
                if v156.state.isLoginByOtp then
                    if v113 then
                        v156.handleLoginWithOtp(nil, v278):await();
                        return;
                    else
                        v156.handleLoginWithOtp(nil, v278);
                        return;
                    end;
                elseif v113 then
                    v156.handleLoginWithFormData(nil, nil, v278):await();
                    return;
                else
                    v156.handleLoginWithFormData(nil, nil, v278);
                    return;
                end;
            end, 
            onAccountSelectionAbandoned = function() --[[ Line: 977 ]] --[[ Name: onAccountSelectionAbandoned ]]
                -- upvalues: v156 (ref)
                v156.updateIsLoginInProgress(false);
                v156.state.otpSessionToken = "";
                v156.state.otpCode = "";
                v156.state.isLoginByOtp = false;
                v156.props.closeCentralOverlay();
            end, 
            titleTextKey = "Authentication.Login.Label.AccountSelectorTitle", 
            helpTextKey = "Authentication.Login.Description.AccountSelectorHelp", 
            screenSize = v156.props.screenSize
        };
        if v90() and v89() then
            v156.props.closeCentralOverlay();
        end;
        v156.props.openAccountSelector(v279);
    end;
    v156.performKeystoreOperations = function(v280, v281) --[[ Line: 996 ]]
        -- upvalues: v125 (ref), v131 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v156 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v108 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref)
        return v125.new(function(v282, v283) --[[ Line: 1000 ]]
            -- upvalues: v131 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v281 (ref), v156 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v280 (copy), v108 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), v125 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref)
            if (v131 or l_GetFFlagKeystoreAutoLoginAvailable_0()) == false or v281 == nil then
                v282();
                return;
            else
                local v284 = v156.props.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                local v285 = l_HttpService_0:JSONEncode({
                    server = l_ContentProvider_0.BaseUrl
                });
                v281 = l_HttpService_0:JSONDecode(v281);
                l_GetUserByUsername_0(v280, v281.cvalue)():andThen(function(v286) --[[ Line: 1021 ]]
                    -- upvalues: v283 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v108 (ref), v285 (copy), l_default_0 (ref), l_KeystoreConstants_0 (ref)
                    if not v286 or not v286.id then
                        return v283("Invalid usernameInfo");
                    elseif l_GetFFlagKeystoreAutoLoginAvailable_0() then
                        return v108(v285):andThen(function() --[[ Line: 1027 ]]
                            -- upvalues: v286 (copy)
                            return v286;
                        end);
                    else
                        return l_default_0:deleteAllCredentialsFromiOSKeychain(l_default_0.CredentialsTypes.iosKeychainPassword, v285, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 1035 ]]
                            -- upvalues: v286 (copy)
                            return v286;
                        end);
                    end;
                end):andThen(function(v287) --[[ Line: 1040 ]]
                    -- upvalues: v284 (copy), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v281 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_default_0 (ref), v125 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref)
                    local v288 = nil;
                    if v284 == true then
                        v288 = l_KeystoreConstants_0.Experiment;
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v287.id)));
                    else
                        v288 = l_KeystoreConstants_0.Control;
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v287.id)));
                    end;
                    local v289 = l_HttpService_0:JSONEncode({
                        server = tostring(l_ContentProvider_0.BaseUrl), 
                        username = tostring(v281.cvalue), 
                        userId = tostring(v287.id), 
                        password = tostring(v281.password), 
                        experimentGroup = tostring(v288)
                    });
                    if l_GetFFlagKeystoreAutoLoginAvailable_0() then
                        local v291 = l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v290) --[[ Line: 1069 ]]
                            -- upvalues: l_default_0 (ref), v289 (copy), l_KeystoreConstants_0 (ref), v125 (ref)
                            if v290 and v290.keystore and v290.keystore.isAvailable then
                                return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v289, l_KeystoreConstants_0.KeystoreTimeout);
                            else
                                return v125.resolve(nil);
                            end;
                        end);
                        if l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                            return v291;
                        else
                            return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v289, l_KeystoreConstants_0.KeystoreTimeout);
                        end;
                    else
                        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.iosKeychainPassword, v289, l_KeystoreConstants_0.KeystoreTimeout);
                    end;
                end):andThen(function(_) --[[ Line: 1101 ]]
                    -- upvalues: v282 (copy)
                    v282();
                end):catch(function(v293) --[[ Line: 1104 ]]
                    -- upvalues: v283 (copy)
                    v283(v293);
                end);
                return;
            end;
        end);
    end;
    v156.handleLoginResult = function(v294, v295) --[[ Line: 1110 ]]
        -- upvalues: v156 (copy), v29 (ref), v65 (ref), v66 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v58 (ref), v91 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v110 (ref), v150 (ref), v85 (ref)
        v156.props.setBackNavigationDisabled(false);
        local l_setLoginResult_0 = v156.props.setLoginResult;
        local l_launchApp_1 = v156.props.launchApp;
        local l_networking_3 = v156.props.networking;
        local l_appPolicy_1 = v156.props.appPolicy;
        local l_analytics_1 = v156.props.analytics;
        local l_omniRecommendationsRequest_1 = v156.props.omniRecommendationsRequest;
        if v156.passwordRef.current then
            v156.passwordRef.current.Text = "";
        end;
        local l_clearApp_1 = v156.props.clearApp;
        local l_handleLoginCompletionWithAccountSwitching_1 = v156.props.handleLoginCompletionWithAccountSwitching;
        v156.performKeystoreOperations(l_networking_3, v295):finally(function() --[[ Line: 1128 ]]
            -- upvalues: v29 (ref), v294 (copy), l_setLoginResult_0 (copy), v65 (ref), v66 (ref), v156 (ref), v295 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v58 (ref), v91 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v110 (ref), l_handleLoginCompletionWithAccountSwitching_1 (copy), l_networking_3 (copy), l_omniRecommendationsRequest_1 (copy), l_analytics_1 (copy), l_appPolicy_1 (copy), l_clearApp_1 (copy), l_launchApp_1 (copy), v150 (ref), v85 (ref)
            if v29.hasTwoStepData(v294) then
                l_setLoginResult_0(v294);
                v65(v66.FailureTwoStepVerification, 1);
                spawn(function() --[[ Line: 1135 ]]
                    -- upvalues: v156 (ref), v294 (ref), v295 (ref)
                    v156.renderTwoStepChallenge(v294, v295);
                end);
            else
                if v295 then
                    if not l_FFlagDisableMemStorageServicePasswordEvent_0 then
                        l_MemStorageService_0:Fire(v58.AuthenticatedCredentials, v295);
                    end;
                    if v91() and v156.state.isCredentialsProtocolRegisterPasswordAvailable then
                        if l_FFlagPasswordManagerAwaitEnabled_0 then
                            v156.credentialsProtocolRegisterPassword(v295):await();
                        else
                            v156.credentialsProtocolRegisterPassword(v295);
                        end;
                    end;
                end;
                v65(v66.Success, 1);
                if v110 then
                    l_handleLoginCompletionWithAccountSwitching_1(l_networking_3, l_omniRecommendationsRequest_1, l_analytics_1, l_appPolicy_1, v294.accountBlob, l_clearApp_1, l_launchApp_1);
                else
                    l_launchApp_1(l_networking_3, l_omniRecommendationsRequest_1, l_analytics_1, l_appPolicy_1);
                    v150.ClearThemeOverride();
                end;
            end;
            if v85() then
                v156.props.closeCentralOverlay();
            end;
        end);
    end;
    v156.credentialsProtocolRegisterPassword = function(v304) --[[ Line: 1183 ]]
        -- upvalues: l_HttpService_0 (ref), l_default_0 (ref), l_Constants_0 (ref), v114 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), v156 (copy), v68 (ref), l_Logger_0 (ref), l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref)
        v304 = l_HttpService_0:JSONDecode(v304);
        if v304.cvalue == nil or v304.password == nil then
            return;
        else
            local v305 = {
                username = v304.cvalue, 
                password = v304.password
            };
            local v306 = l_HttpService_0:JSONEncode(v305);
            return l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v306, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v307) --[[ Line: 1200 ]]
                -- upvalues: v114 (ref), l_HttpService_0 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), v156 (ref), v68 (ref), l_Logger_0 (ref), l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref)
                if v114 and v307 then
                    local v308 = l_HttpService_0:JSONDecode(v307);
                    if v308.errorCode == nil then
                        if l_FFlagEnablePWManagerLoginCheck_0 and v156.passwordManagerUsageStore then
                            v156.passwordManagerUsageStore.setSavedPasswordAfterLogin(true);
                        end;
                        v156.props.authAnalytics.reportAuthButtonClick(v68.Context.CMPasswordLogin, v68.Button.SavePassword);
                        l_Logger_0:info("Successfully registered password.");
                        return;
                    elseif l_FFlagEnableCredentialsProtocolLoggingFix_0 then
                        l_Logger_0:warning("Error registering password: " .. tostring(v308.errorMsg));
                        return;
                    else
                        l_Logger_0:warning("Error registering password: ", v308.errorMsg);
                        return;
                    end;
                elseif v307.errorCode == nil then
                    v156.props.authAnalytics.reportAuthButtonClick(v68.Context.CMPasswordLogin, v68.Button.SavePassword);
                    l_Logger_0:info("Successfully registered password.");
                    return;
                elseif l_FFlagEnableCredentialsProtocolLoggingFix_0 then
                    l_Logger_0:warning("Error registering password: " .. tostring(v307.errorMsg));
                    return;
                else
                    l_Logger_0:warning("Error registering password: ", v307.errorMsg);
                    return;
                end;
            end, function(v309) --[[ Line: 1236 ]]
                -- upvalues: l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref), l_Logger_0 (ref)
                if l_FFlagEnableCredentialsProtocolLoggingFix_0 then
                    l_Logger_0:warning("Error registering password: " .. tostring(v309));
                    return;
                else
                    l_Logger_0:warning("Error registering password: ", v309);
                    return;
                end;
            end);
        end;
    end;
    v156.logoutAllLoggedInUsersCallback = function() --[[ Line: 1246 ]]
        -- upvalues: v156 (copy), v107 (ref), v122 (ref), v81 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_GuiService_0 (ref)
        local l_networking_4 = v156.props.networking;
        local v311 = v107.getAccountBlob();
        local v312 = v122.fromLocalStorage().userId ~= -1;
        v156:setState({
            errorKey = false, 
            loginButtonDisabled = true, 
            isLoginInProgress = false
        });
        v81(l_networking_4, v311):await();
        if v312 == true then
            v156.props.resetAppState();
            l_AppStorageService_0:SetItem(l_LocalStorageKey_0.CredentialValue, "");
            l_AppStorageService_0:flush();
            v156.props.logoutWithoutShowConfirmation(l_networking_4, l_GuiService_0);
        end;
        v156:setState({
            loginButtonDisabled = false
        });
        v156.props.closeCentralOverlay();
    end;
    v156.handleLoginError = function(v313, v314, v315) --[[ Line: 1275 ]]
        -- upvalues: v156 (copy), v85 (ref), v55 (ref), v78 (ref), v65 (ref), v66 (ref), l_StatusCodes_0 (ref), v110 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v69 (ref), l_isStringEmail_0 (ref), v60 (ref), v126 (ref), v127 (ref), l_AccountLinkingAlertType_0 (ref)
        v156.props.setBackNavigationDisabled(false);
        local l_forceLoginByUsername_0 = v156.state.forceLoginByUsername;
        local v317 = v156.errorHandlingInfoList[v313.errorCode];
        if v317 then
            l_forceLoginByUsername_0 = v317.forceLoginByUsername or l_forceLoginByUsername_0;
        end;
        local v318 = false;
        local v319 = v85() and v313.errorCode == v55.MultipleUsersPerCredential and not v156.props.appPolicy.getAccountDisambiguationDisabled();
        local v320 = v156.props.appPolicy.getLinkedAuthEndpointsEnabled() and (v313.errorCode == v55.AccountLinkingRequired or v313.errorCode == v55.AccountLinkingFailed);
        local v321 = v78() and v313.errorCode == v55.SecurityQuestions;
        if v319 or v321 or v313.errorCode == v55.Captcha then
            v318 = true;
        end;
        v65(v66.Failure, 1);
        if v313.errorCode == v55.Captcha then
            v65(v66.FailureCaptcha, 1);
        elseif v313.errorCode == v55.IncorrectCValueOrPassword then
            v65(v66.FailureCredentials, 1);
        elseif v313.errorCode == v55.AccountLocked then
            v65(v66.FailurePasswordReset, 1);
        elseif v313.errorCode == v55.CTypeNotSupported then
            v65(v66.FailureBadRequest, 1);
        elseif v313.errorCode == v55.CValueAndPasswordRequired then
            v65(v66.FailureBadRequest, 1);
        elseif v321 then
            v65(v66.FailureSecurityQuestions, 1);
        elseif v313.errorCode == v55.MultipleUsersPerCredential then
            v65(v66.FailureMultipleUsersPerCredential, 1);
        elseif v313.HttpError == Enum.HttpError.OK and v313.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS then
            v65(v66.FailureThrottled, 1);
        elseif v313.HttpError == Enum.HttpError.OK and v313.StatusCode == l_StatusCodes_0.REQUEST_TIMEOUT then
            v65(v66.FailureTimeout, 1);
        elseif v313.HttpError == Enum.HttpError.OK and v313.StatusCode == l_StatusCodes_0.BAD_REQUEST then
            v65(v66.FailureBadRequest, 1);
        elseif v313.HttpError == Enum.HttpError.OK and v313.StatusCode == l_StatusCodes_0.NOT_FOUND then
            v65(v66.FailureNotFound, 1);
        elseif v313.HttpError == Enum.HttpError.OK and v313.StatusCode == l_StatusCodes_0.INTERNAL_SERVER_ERROR then
            v65(v66.FailureInternalServerError, 1);
        else
            v65(v66.FailureUnknownError, 1);
        end;
        if v110 == true and v313.errorCode == v55.EmptyAccountSwitchBlobRequired then
            v156:setState({
                errorKey = false
            });
            v156.props.openAccountSwitchingErrorOverlay(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.LogoutConfirmation", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v156.logoutAllLoggedInUsersCallback, v156.props.closeCentralOverlay, v69.Auth.AccountSwitcherLoginEmptyBlobRequiredError, v314 or nil);
        end;
        if v110 == true and v313.errorCode == v55.ParentEmptyAccountSwitchBlobRequired then
            v156:setState({
                errorKey = false
            });
            v156.props.openAccountSwitchingErrorOverlay(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.ParentLogoutConfirmation", l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v156.logoutAllLoggedInUsersCallback, v156.props.closeCentralOverlay, v69.Auth.AccountSwitcherParentLoginEmptyBlobRequiredError, v314 or nil);
        end;
        if v313.errorCode == v55.AccountLocked then
            v156.props.openPasswordResetPrompt();
        end;
        if v313.errorCode == v55.AccountNotVerified and l_isStringEmail_0(v314) and v156.canVerifyCredentials(v60.Email, v314, v315) then
            v156.props.openEmailVerificationPrompt(v314, v315, v156.closeVerificationEmailModal);
        end;
        if v126() and v313.errorCode == v55.GlobalAppAccessDeniedVNG and v156.isMounted then
            v156.props.openNewAppAvailableModal(function() --[[ Line: 1397 ]]
                -- upvalues: v127 (ref), v156 (ref)
                local v322 = v127();
                v156.props.linking:openURL(v322);
            end);
        end;
        if v78() and v313.errorCode == v55.SecurityQuestions and v313.securityQuestionsData and v313.securityQuestionsCallback then
            task.spawn(function() --[[ Line: 1406 ]]
                -- upvalues: v156 (ref), v314 (copy), v315 (copy), v313 (copy)
                if v156.isMounted then
                    v156.renderSecurityQuestions(v314, v315, v313.securityQuestionsCallback, v313.securityQuestionsData);
                end;
            end);
        end;
        if v319 then
            if v313.usersData then
                v156.handleMultipleUsersPerCredentialError(v313.usersData);
            end;
        elseif v313.errorCode == v55.MultipleUsersPerCredential then
            v313.errorKey = "Authentication.Login.Response.MoreThanOneUsername";
        end;
        if v313.errorCode == v55.PlatformNotSupported then
            v313.errorKey = "Authentication.Login.Error.PlatformAccountConnectionFailure";
        end;
        if v320 then
            if v313.errorCode == v55.AccountLinkingRequired then
                v156.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.IncompatibleAccounts, v313.userFacingMessage);
            elseif v313.errorCode == v55.AccountLinkingFailed then
                v156.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.RetryLogInConnectionFailure);
            end;
        end;
        spawn(function() --[[ Line: 1439 ]]
            -- upvalues: v156 (ref), v313 (copy), l_forceLoginByUsername_0 (ref)
            if v156.isMounted then
                v156:setState({
                    errorKey = v313.errorKey, 
                    errorCode = v313.errorCode, 
                    forceLoginByUsername = l_forceLoginByUsername_0
                });
            end;
        end);
        v156.updateIsLoginInProgress(v318);
    end;
    v156.onLoginButtonActivated = function() --[[ Line: 1452 ]]
        -- upvalues: v156 (copy), v68 (ref)
        if v156.state.loginButtonDisabled then
            return;
        elseif v156.state.isLoginInProgress then
            return;
        else
            v156.updateIsLoginInProgress(true);
            v156.props.authAnalytics.reportLogInButtonClicked(v68.Context.LoginScreen);
            v156.handleLoginWithFormData();
            return;
        end;
    end;
    v156.onForgetButtonActivated = function() --[[ Line: 1466 ]]
        -- upvalues: v156 (copy), v68 (ref), l_GetFFlagEnableLuafiedRecoveryFlow_0 (ref), l_enrolledInLuafiedRecoveryExperiment_0 (ref), v24 (ref), l_ContentProvider_0 (ref), v54 (ref)
        if v156.state.isLoginInProgress then
            return;
        else
            v156.unfocusTextBoxes();
            v156.props.authAnalytics.reportAuthButtonClick(v68.Context.LoginForm, v68.Button.ForgotPassword);
            v156.props.authAnalytics.reportForgotPasswordButtonClicked(v68.Context.LoginScreen);
            if l_GetFFlagEnableLuafiedRecoveryFlow_0() and l_enrolledInLuafiedRecoveryExperiment_0() then
                v156.props.navigateToPage({
                    name = v24.AccountRecovery, 
                    extraProps = {
                        identifier = v156.cvalueRef and v156.cvalueRef.current and v156.cvalueRef.current.Text or v156.cvalueText and v156.cvalueText:getValue() or "", 
                        recoverPassword = true
                    }
                });
                return;
            elseif v156.props.appPolicy.shouldUseExternalBrowserForDisclaimerLinks() then
                v156.props.linking:openURL(l_ContentProvider_0.BaseUrl .. "login/forgot-password-or-username");
                return;
            else
                v156.props.navigateToPage({
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
    v156.onCrossDeviceLoginActivated = function() --[[ Line: 1504 ]]
        -- upvalues: v156 (copy), v68 (ref), v94 (ref), l_RbxAnalyticsService_0 (ref)
        if v156.state.isLoginInProgress then
            return;
        else
            v156.unfocusTextBoxes();
            v156.props.authAnalytics.reportAuthButtonClick(v68.Context.LoginForm, v68.Button.QuickLogin);
            v156.props.authAnalytics.reportButtonClicked(v68.Context.Login, v68.Button.LoginOtherDevice);
            if v156.props.appPolicy.getShowVNGLoginWithExistingAccountQuickLoginButton() then
                if v94() then
                    l_RbxAnalyticsService_0:ReportCounter("CrossAppLoginAttempt", 1);
                end;
                v156.props.openCrossAppLoginPrompt(v156.handleLoginWithCode);
                return;
            else
                v156.props.openCrossDeviceLoginPrompt(v156.handleLoginWithCode);
                return;
            end;
        end;
    end;
    v156.topButtonActivatedTracking = function() --[[ Line: 1529 ]]
        -- upvalues: v110 (ref), v156 (copy), v68 (ref)
        if v110 == true and v156.isAlreadyAuthenticated == true then
            resetDefaultTheme();
        end;
        v156.props.authAnalytics.reportDismissCornerXButtonClicked(v68.Context.LoginScreen);
    end;
    v156.onEmailOtpLoginAbandoned = function() --[[ Line: 1536 ]]
        -- upvalues: v156 (copy)
        v156.state.isLoginByOtp = false;
    end;
    v156.onEmailOtpLoginCompleted = function(v323, v324) --[[ Line: 1540 ]]
        -- upvalues: v156 (copy)
        v156.state.otpSessionToken = v323;
        v156.state.otpCode = v324;
        return v156.handleLoginWithOtp(nil, nil);
    end;
    v156.onEmailOtpLoginActivated = function() --[[ Line: 1546 ]]
        -- upvalues: v156 (copy), v68 (ref)
        if v156.state.isLoginInProgress then
            return;
        else
            v156.unfocusTextBoxes();
            local v325 = {
                origin = "login", 
                codeLength = 6, 
                enterEmailTitleKey = "Authentication.Login.Label.GetOneTimeCode", 
                enterEmailDescriptionKey = "Authentication.Login.Description.GetOneTimeCodeHelp", 
                enterCodeTitleKey = "Authentication.Login.Label.EnterOneTimeCode", 
                enterCodeDescriptionKey = "Authentication.Login.Description.EnterOneTimeCodeHelpV2", 
                onSubmitCode = v156.onEmailOtpLoginCompleted, 
                onModalAbandoned = v156.onEmailOtpLoginAbandoned, 
                screenSize = v156.props.screenSize
            };
            v156.props.openEmailOtp(v325);
            v156.state.isLoginByOtp = true;
            v156.props.authAnalytics.reportAuthButtonClick(v68.Context.LoginForm, v68.Button.EmailOtp);
            v156.props.authAnalytics.reportButtonClicked(v68.Context.Login, v68.Button.OneTimePasscode);
            return;
        end;
    end;
    v156.closeVerificationEmailModal = function(v326) --[[ Line: 1574 ]]
        -- upvalues: v156 (copy)
        if v156.isMounted then
            v156.updateCValueText(v326);
            if v326 ~= "" and v156.passwordRef.current then
                v156.passwordRef.current:CaptureFocus();
            end;
            v156:setState({
                errorCode = -1, 
                errorKey = "", 
                forceLoginByUsername = false
            });
        end;
    end;
    v156.events = {};
    v156.props.authAnalytics.reportScreenLoaded(v68.Context.LoginScreen);
end;
v153.didMount = function(v327) --[[ Line: 1592 ]] --[[ Name: didMount ]]
    -- upvalues: v68 (copy), v92 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), v110 (copy), l_MemStorageService_0 (copy), v58 (copy), v150 (copy), v129 (copy), v131 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy), v140 (copy), l_UiMode_0 (copy), l_UserInputService_0 (copy), v128 (copy), l_GuiService_0 (copy), v24 (copy), l_HttpService_0 (copy), l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0 (copy), v45 (copy), v91 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 (copy), l_Logger_0 (copy), l_LocalizationService_0 (copy), l_TelemetryConfigs_0 (copy)
    v327.isMounted = true;
    v327.props.authAnalytics.reportAuthPageload(v68.Context.LoginForm);
    if v92() then
        local v328 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
        v327.props.authAnalytics.reportAuthPageload(v68.Context.LoginScreen, v328);
    end;
    if v110 == true and v327.isAlreadyAuthenticated == true then
        l_MemStorageService_0:Fire(v58.ThemeUpdate, "dark");
    end;
    v150.SetDarkThemeOverride();
    if v129 and v327.props.appPolicy.getLoginUsernameOnly() then
        v327:setState({
            forceLoginByUsername = true
        });
    end;
    if v131 or l_GetFFlagKeystoreAutoLoginAvailable_0() then
        if v327.props.usernameFromIosKeychain then
            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.autoPopulatedUsername);
            v327.updateCValueText(v327.props.usernameFromIosKeychain);
        end;
        if v327.props.passwordFromIosKeychain then
            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.autoPopulatedPassword);
            v327.updatePasswordText(v327.props.passwordFromIosKeychain);
        end;
        if v140 then
            v327:setState({
                loginButtonDisabled = not (v327.props.usernameFromIosKeychain and v327.props.passwordFromIosKeychain)
            });
        else
            v327:setState({
                loginButtonDisabled = false
            });
        end;
    end;
    local function v334(v329, v330) --[[ Line: 1645 ]] --[[ Name: isWithinBounds ]]
        -- upvalues: v327 (copy), l_UiMode_0 (ref)
        if v327.props.uiModeInfo.uiMode == l_UiMode_0.VR then
            error("Input position is not supported in VR");
        end;
        local l_AbsolutePosition_0 = v330.AbsolutePosition;
        local l_AbsoluteSize_0 = v330.AbsoluteSize;
        local v333 = false;
        if v329.X > l_AbsolutePosition_0.X then
            v333 = false;
            if v329.X < l_AbsolutePosition_0.X + l_AbsoluteSize_0.X then
                v333 = false;
                if v329.Y > l_AbsolutePosition_0.Y then
                    v333 = v329.Y < l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y;
                end;
            end;
        end;
        return v333;
    end;
    local function v336(v335) --[[ Line: 1658 ]] --[[ Name: getNextSelectedObject ]]
        -- upvalues: l_UserInputService_0 (ref), v128 (ref), v327 (copy)
        if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
            if v128 then
                return v327.focusRef and v327.focusRef.current and v327.focusRef.current.NextSelectionUp;
            else
                return v335.NextSelectionUp;
            end;
        elseif v128 then
            return v327.focusRef and v327.focusRef.current and v327.focusRef.current.NextSelectionDown;
        else
            return v335.NextSelectionDown;
        end;
    end;
    local function v338() --[[ Line: 1676 ]] --[[ Name: getNewSelectedObject ]]
        -- upvalues: v128 (ref), v327 (copy), l_GuiService_0 (ref), v336 (copy)
        local v337 = if v128 then v327.focusRef and v327.focusRef.current else l_GuiService_0.SelectedObject;
        v337 = v336(v337);
        if v337 == v327.loginButtonRef.current and v327.state.loginButtonDisabled then
            v337 = v336(v337);
        end;
        if v327.isMounted then
            v327:setState({
                forgotLinkFocused = v337 == v327.forgotLinkRef.current
            });
        end;
        return v337;
    end;
    table.insert(v327.events, l_UserInputService_0.InputBegan:connect(function(v339, _) --[[ Line: 1697 ]]
        -- upvalues: v327 (copy), v24 (ref), v128 (ref), l_GuiService_0 (ref), v338 (copy)
        if v327.props.currentPageName ~= v24.Login then
            return;
        else
            if v339.UserInputType == Enum.UserInputType.Keyboard then
                if v339.KeyCode == Enum.KeyCode.Return then
                    if v327.state.forgotLinkFocused then
                        v327.onForgetButtonActivated();
                        return;
                    else
                        v327.onLoginButtonActivated();
                        return;
                    end;
                elseif v339.KeyCode == Enum.KeyCode.Tab then
                    local v341 = if v128 then v327.focusRef and v327.focusRef.current else l_GuiService_0.SelectedObject;
                    if not v341 then
                        return;
                    else
                        local v342 = v338();
                        if not v342 then
                            return;
                        else
                            if v341:IsA("TextBox") and v341.ManualFocusRelease then
                                v341:ReleaseFocus();
                            end;
                            if v128 then
                                v327.focusRef.current = v342;
                            else
                                l_GuiService_0.SelectedObject = v342;
                            end;
                            if v342:IsA("TextBox") then
                                v342:CaptureFocus();
                            end;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end));
    table.insert(v327.events, l_UserInputService_0.InputEnded:connect(function(v343, _) --[[ Line: 1742 ]]
        -- upvalues: v327 (copy), v24 (ref), l_UiMode_0 (ref), l_UserInputService_0 (ref), v334 (copy)
        if v327.props.currentPageName ~= v24.Login then
            return;
        elseif v327.props.uiModeInfo.uiMode == l_UiMode_0.VR then
            return;
        else
            if v343.UserInputType == Enum.UserInputType.MouseButton1 or v343.UserInputType == Enum.UserInputType.Touch then
                local l_Position_0 = v343.Position;
                local l_l_UserInputService_0_FocusedTextBox_1 = l_UserInputService_0:GetFocusedTextBox();
                if not v327.cvalueRef.current or not v327.passwordRef.current then
                    return;
                elseif not l_l_UserInputService_0_FocusedTextBox_1 then
                    return;
                else
                    local v347 = v334(l_Position_0, v327.cvalueRef.current);
                    local v348 = v334(l_Position_0, v327.passwordRef.current);
                    if l_l_UserInputService_0_FocusedTextBox_1 == v327.cvalueRef.current and v348 then
                        v327.cvalueRef.current:ReleaseFocus();
                        v327.passwordRef.current:CaptureFocus();
                        return;
                    elseif l_l_UserInputService_0_FocusedTextBox_1 == v327.passwordRef.current and v347 then
                        v327.passwordRef.current:ReleaseFocus();
                        v327.cvalueRef.current:CaptureFocus();
                        return;
                    elseif not v347 and not v348 and (l_l_UserInputService_0_FocusedTextBox_1 == v327.cvalueRef.current or l_l_UserInputService_0_FocusedTextBox_1 == v327.passwordRef.current) then
                        l_l_UserInputService_0_FocusedTextBox_1:ReleaseFocus();
                    end;
                end;
            end;
            return;
        end;
    end));
    table.insert(v327.events, l_UserInputService_0.TextBoxFocused:connect(function(v349) --[[ Line: 1784 ]]
        -- upvalues: v327 (copy), v24 (ref), v128 (ref), l_GuiService_0 (ref)
        if v327.props.currentPageName ~= v24.Login then
            return;
        elseif v327.state.isLoginInProgress then
            v349:ReleaseFocus();
            return;
        elseif v128 then
            v327.focusRef.current = v349;
            return;
        else
            l_GuiService_0.SelectedObject = v349;
            return;
        end;
    end));
    table.insert(v327.events, l_UserInputService_0.TextBoxFocusReleased:connect(function(_) --[[ Line: 1803 ]]
        -- upvalues: v327 (copy), v24 (ref), v128 (ref), l_GuiService_0 (ref)
        if v327.props.currentPageName ~= v24.Login then
            return;
        elseif v128 then
            v327.focusRef.current = nil;
            return;
        else
            l_GuiService_0.SelectedObject = nil;
            return;
        end;
    end));
    table.insert(v327.events, l_MemStorageService_0:bind(v58.AutoFillCredentials, function(v351) --[[ Line: 1818 ]]
        -- upvalues: v327 (copy), v24 (ref), l_HttpService_0 (ref)
        if v327.props.currentPageName ~= v24.Login then
            return;
        elseif v327.state.isLoginInProgress then
            return;
        else
            local v352 = l_HttpService_0:JSONDecode(v351);
            if v352 then
                v327.updateCValueText(v352.cvalue);
                v327.updatePasswordText(v352.password);
            end;
            return;
        end;
    end));
    if l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0() then
        v45(v327.props.networking, "PlayerApp.Login", {
            "isDesktopDualLoginEnabled"
        }):andThen(function(v353) --[[ Line: 1835 ]]
            -- upvalues: v327 (copy)
            local v354 = v353 and v353.responseBody;
            if v354 and v327.isMounted then
                local l_isDesktopDualLoginEnabled_0 = v354.isDesktopDualLoginEnabled;
                if l_isDesktopDualLoginEnabled_0 then
                    v327:setState({
                        isDesktopDualLoginEnabled = l_isDesktopDualLoginEnabled_0
                    });
                end;
            end;
        end, function() --[[ Line: 1846 ]]

        end);
    end;
    if v91() then
        local v356 = false;
        local v357 = false;
        local v358 = false;
        do
            local l_v356_0, l_v357_0, l_v358_0 = v356, v357, v358;
            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v362) --[[ Line: 1859 ]]
                -- upvalues: l_v356_0 (ref), l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 (ref), l_v357_0 (ref), l_v358_0 (ref), v327 (copy)
                if v362.FIDO2 ~= nil then
                    l_v356_0 = v362.FIDO2.isAvailable and v362.FIDO2.supportsDeviceBoundOnly;
                    if l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 then
                        l_v357_0 = v362.password and v362.password.isAvailable;
                        l_v358_0 = v362.password ~= nil;
                    else
                        l_v357_0 = v362.password.isAvailable;
                        l_v358_0 = true;
                    end;
                    if v327.isMounted then
                        v327:setState({
                            isCredentialsProtocolRegisterPasswordAvailable = l_v357_0
                        });
                    end;
                else
                    l_v356_0 = v362.isAvailable and v362.supportsDeviceBoundOnly;
                end;
                if l_v358_0 then
                    v327.showGenericCredentialLoginPopup(l_v356_0, l_v357_0);
                    return;
                else
                    if l_v356_0 then
                        v327.showPasskeyLoginPopup();
                    end;
                    return;
                end;
            end):catch(function(v363) --[[ Line: 1890 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Error checking for available credential types. Error: {}", v363);
            end):finally(function() --[[ Line: 1893 ]]
                -- upvalues: v327 (copy), v68 (ref), l_v357_0 (ref), l_v356_0 (ref)
                v327.props.authAnalytics.reportAuthPageload(v68.Context.CMPasswordLogin, (tostring(l_v357_0)));
                v327.props.authAnalytics.reportAuthPageload(v68.Context.PasskeyLogin, if l_v356_0 ~= nil then tostring(l_v356_0) else "timeout");
            end);
        end;
    else
        local v364 = false;
        do
            local l_v364_0 = v364;
            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v366) --[[ Line: 1907 ]]
                -- upvalues: l_v364_0 (ref), v327 (copy)
                l_v364_0 = v366.isAvailable and v366.supportsDeviceBoundOnly;
                if l_v364_0 then
                    v327.showPasskeyLoginPopup();
                end;
            end):catch(function(v367) --[[ Line: 1913 ]]
                warn("Error checking if FIDO2 passkeys is available. Error: ", v367);
            end):finally(function() --[[ Line: 1916 ]]
                -- upvalues: v327 (copy), v68 (ref), l_v364_0 (ref)
                v327.props.authAnalytics.reportAuthPageload(v68.Context.PasskeyLogin, if l_v364_0 ~= nil then tostring(l_v364_0) else "timeout");
            end);
        end;
    end;
    if game:GetFastFlag("EnablePlayerAppLoginPageExperiments") and l_LocalizationService_0.RobloxLocaleId:match("^en") then
        v45(v327.props.networking, "PlayerApp.Login", {
            "CrossDeviceButtonText"
        }):andThen(function(v368) --[[ Line: 1928 ]]
            -- upvalues: v327 (copy)
            local v369 = v368 and v368.responseBody;
            if v369 and v327.isMounted then
                local l_CrossDeviceButtonText_0 = v369.CrossDeviceButtonText;
                if l_CrossDeviceButtonText_0 then
                    v327:setState({
                        quickLoginButtonTextOverride = l_CrossDeviceButtonText_0
                    });
                end;
            end;
        end, function() --[[ Line: 1939 ]]

        end);
    end;
    v327.props.loggingProtocol:logEventOnce("login_view_did_mount");
    v327.props.loggingProtocol:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LoginPageMountTelemetryConfig, 1, {
        version = 1
    });
end;
v153.willUnmount = function(v371) --[[ Line: 1952 ]] --[[ Name: willUnmount ]]
    -- upvalues: v110 (copy)
    if v110 == true and v371.isAlreadyAuthenticated == true then
        resetDefaultTheme();
    end;
    v371.unfocusTextBoxes();
    for _, v373 in ipairs(v371.events) do
        v373:Disconnect();
    end;
    v371.events = {};
    v371.isMounted = false;
end;
v153.didUpdate = function(v374, _, v376) --[[ Line: 1967 ]] --[[ Name: didUpdate ]]
    -- upvalues: v155 (copy)
    if v374.state.errorCode == -1 then
        return;
    else
        local l_isLoginInProgress_1 = v374.state.isLoginInProgress;
        if v376.isLoginInProgress and not l_isLoginInProgress_1 then
            local v378 = v374.errorHandlingInfoList[v374.state.errorCode];
            if not v378 then
                return;
            else
                if v378.textBoxesToClear then
                    for _, v380 in pairs(v378.textBoxesToClear) do
                        if v380 == v155.CValue then
                            v374.updateCValueText("");
                        elseif v380 == v155.Password then
                            v374.updatePasswordText("");
                        end;
                    end;
                end;
                if v378.newFocusedTextBox == v155.CValue and v374.cvalueRef.current then
                    v374.cvalueRef.current:CaptureFocus();
                    return;
                elseif v378.newFocusedTextBox == v155.Password and v374.passwordRef.current then
                    v374.passwordRef.current:CaptureFocus();
                end;
            end;
        end;
        return;
    end;
end;
v153.render = function(v381) --[[ Line: 1999 ]] --[[ Name: render ]]
    -- upvalues: l_UiMode_0 (copy), l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0 (copy), v129 (copy), l_FFlagAuthSecExclusions_0 (copy), v88 (copy), v111 (copy), l_withStyle_0 (copy), v73 (copy), v63 (copy), v47 (copy), v46 (copy), v11 (copy), v56 (copy), v52 (copy), v53 (copy), l_LinkButton_0 (copy), v38 (copy), v154 (copy)
    local v382 = v381.state.errorKey ~= "" and v381.state.errorKey or nil;
    local v383 = v381.state.errorKey == false and v381.state.localizedErrorMessage or nil;
    local v384 = not v381.props.appPolicy.getWebViewSupport() and v381.props.uiModeInfo.uiMode ~= l_UiMode_0.VR;
    local v385 = true;
    if v381.props.uiModeInfo.uiMode ~= l_UiMode_0.TenFoot then
        v385 = v381.props.uiModeInfo.uiMode == l_UiMode_0.VR;
    end;
    local v386 = l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0() and v381.state.isDesktopDualLoginEnabled;
    local v387 = v385 or v381.props.appPolicy.getEnableDualLogin() and v386;
    local v388 = v381.props.appPolicy.getDisableEmailOTPLogin() and (v129 or l_FFlagAuthSecExclusions_0);
    local v389 = v88() and v381.props.isLoginWithOtpEnabled and not v388;
    local v390 = v381.props.appPolicy.getUseVNGUserAgreementPopup();
    local v391 = v111 and v381.props.appPolicy.getUseKoreaKISAUserAgreementPopup();
    local v392 = v129 and v381.props.appPolicy.getDisableLoginForgotButton();
    return l_withStyle_0(function(v393) --[[ Line: 2026 ]]
        -- upvalues: v73 (ref), v387 (copy), l_FFlagAuthSecExclusions_0 (ref), v381 (copy), v384 (ref), v63 (ref), v382 (copy), v385 (copy), v47 (ref), v46 (ref), l_UiMode_0 (ref), v11 (ref), v56 (ref), v52 (ref), v383 (copy), v390 (copy), v391 (copy), v389 (copy), v53 (ref), v392 (copy), l_LinkButton_0 (ref), v38 (ref), v154 (ref)
        local v394 = v73.CrossDeviceLoginRolloutEnabledForDevice() and not v387;
        if l_FFlagAuthSecExclusions_0 and v381.props.appPolicy.getExcludeCrossDeviceSignIn() then
            v394 = false;
        end;
        local v395 = v381.props.appPolicy.getShowVNGLoginWithExistingAccountQuickLoginButton();
        if v381.props.appPolicy.getDisableRegularLogin() == false then
            v384 = false;
        end;
        return v63({
            localizedError = v382, 
            logInText = "Authentication.Login.Action.SignIn", 
            forgotText = "Authentication.Login.Action.ForgotPasswordOrUsernameQuestionCapitalized", 
            cvaluePlaceholder = v381.state.forceLoginByUsername and "Authentication.Login.Label.Username" or "Authentication.Login.Label.UsernameEmailPhone", 
            passwordPlaceholder = "CommonUI.Messages.Label.Password", 
            twoStepHeader = "Authentication.TwoStepVerification.Label.TwoStepVerification", 
            crossDeviceLoginHeader = "Authentication.CrossDevice.Heading.QuickLogin", 
            loginWithExistingAccountButtonText = "Authentication.CrossDevice.Heading.QuickLogin", 
            orText = "CommonUI.Messages.Label.OR"
        })(function(v396) --[[ Line: 2053 ]]
            -- upvalues: v381 (ref), v395 (copy), v385 (ref), v47 (ref), v46 (ref), l_UiMode_0 (ref), v11 (ref), v56 (ref), v387 (ref), v52 (ref), v394 (ref), v383 (ref), v384 (ref), v390 (ref), v391 (ref), v389 (ref), v393 (copy), v53 (ref), v392 (ref), l_LinkButton_0 (ref), v38 (ref), v154 (ref)
            local v397 = v381.state.quickLoginButtonTextOverride ~= "" and v381.state.quickLoginButtonTextOverride or v396.crossDeviceLoginHeader;
            if v395 then
                v397 = v396.loginWithExistingAccountButtonText;
            end;
            local v398 = if v385 then v47 else v46;
            local v399 = v385 and v381.props.uiModeInfo.uiMode ~= l_UiMode_0.VR;
            return v11.createElement(v398, {
                ContentAlign = v56.Top, 
                topButtonActivatedTracking = v381.topButtonActivatedTracking, 
                topButtonEnabled = not v381.state.isLoginInProgress, 
                statusBarHeight = v381.props.statusBarHeight, 
                globalGuiInset = v381.props.globalGuiInset, 
                screenSize = v381.props.screenSize, 
                isDualLayout = v387, 
                navigateBack = if v385 then v381.props.navigateBack else nil, 
                buttonRef = v381.props.containerRef
            }, {
                UIListLayout = v387 and v11.createElement("UIListLayout", {
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
                Form = if v387 then v11.createElement("Frame", {
                    Size = UDim2.new(0.5, 0, 1, 0), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1
                }, {
                    FormContent = v11.createElement(v52, {
                        Size = UDim2.new(0, 0, 1, 0), 
                        crossDeviceLoginEnabled = v394, 
                        quickLoginButtonText = v397, 
                        loginWithExistingAccountVariantEnabled = v395, 
                        handleLoginWithFormDataCallback = v381.handleLoginWithFormData, 
                        updateIsLoginInProgress = v381.updateIsLoginInProgress, 
                        cvalueText = v381.cvalueText, 
                        passwordText = v381.passwordText, 
                        onTextBoxesChanged = v381.onTextBoxesChanged, 
                        buttonRef = v381.props.defaultRef, 
                        cvalueRef = v381.cvalueRef, 
                        passwordRef = v381.passwordRef, 
                        loginButtonRef = v381.loginButtonRef, 
                        forgotLinkRef = v381.forgotLinkRef, 
                        crossDeviceButtonRef = v381.crossDeviceButtonRef, 
                        emailOtpRef = v381.emailOtpRef, 
                        localizedError = v396.localizedError, 
                        localizedErrorMessage = v383, 
                        forceLoginByUsername = v381.state.forceLoginByUsername or v385, 
                        onCrossDeviceLoginActivated = v381.onCrossDeviceLoginActivated, 
                        onEmailOtpActivated = v381.onEmailOtpLoginActivated, 
                        loginButtonDisabled = v381.state.loginButtonDisabled, 
                        isLoginInProgress = v381.state.isLoginInProgress, 
                        authAnalytics = v381.props.authAnalytics, 
                        disableRegularLogin = v384, 
                        showLinkAccountText = v399, 
                        showForgotButton = not v384 and not v385, 
                        onForgetButtonActivated = v381.onForgetButtonActivated, 
                        maxSizeX = 1e999, 
                        showDisclaimerLinks = not v385 and not (v390 or v391), 
                        showDisclaimerButtons = v385 and not v390, 
                        showCredentialHeader = not v385, 
                        isDualLayout = true, 
                        isTenFootUiMode = v385, 
                        emailOtpEnabled = v389, 
                        LayoutOrder = 2
                    })
                }) else v11.createElement(v52, {
                    crossDeviceLoginEnabled = v394, 
                    quickLoginButtonText = v397, 
                    loginWithExistingAccountVariantEnabled = v395, 
                    handleLoginWithFormDataCallback = v381.handleLoginWithFormData, 
                    updateIsLoginInProgress = v381.updateIsLoginInProgress, 
                    cvalueText = v381.cvalueText, 
                    passwordText = v381.passwordText, 
                    onTextBoxesChanged = v381.onTextBoxesChanged, 
                    buttonRef = v381.props.defaultRef, 
                    cvalueRef = v381.cvalueRef, 
                    passwordRef = v381.passwordRef, 
                    loginButtonRef = v381.loginButtonRef, 
                    forgotLinkRef = v381.forgotLinkRef, 
                    crossDeviceButtonRef = v381.crossDeviceButtonRef, 
                    emailOtpRef = v381.emailOtpRef, 
                    localizedError = v396.localizedError, 
                    localizedErrorMessage = v383, 
                    forceLoginByUsername = v381.state.forceLoginByUsername or v385, 
                    onCrossDeviceLoginActivated = v381.onCrossDeviceLoginActivated, 
                    onEmailOtpActivated = v381.onEmailOtpLoginActivated, 
                    loginButtonDisabled = v381.state.loginButtonDisabled, 
                    isLoginInProgress = v381.state.isLoginInProgress, 
                    authAnalytics = v381.props.authAnalytics, 
                    disableRegularLogin = v384, 
                    showLinkAccountText = v381.props.appPolicy.getUseSingleSignOn(), 
                    showForgotButton = not v384 and v387 and not v385, 
                    onForgetButtonActivated = v381.onForgetButtonActivated, 
                    maxSizeX = v387 and 1e999 or 360, 
                    showDisclaimerLinks = v387 and not v385 and not (v390 or v391), 
                    showDisclaimerButtons = v387 and v385 and not v390, 
                    showCredentialHeader = v387 and not v385, 
                    isDualLayout = v387, 
                    isTenFootUiMode = v385, 
                    emailOtpEnabled = v389
                }), 
                Divider = v387 and v11.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(0, v393.Tokens.Global.Size_500, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    v11.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v393.Tokens.Global.Size_150)
                    }), 
                    v11.createElement("Frame", {
                        Size = UDim2.new(0, v393.Tokens.Global.Size_25, 0.5, 0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = v393.Tokens.Global.Color.Smoke.Color3, 
                        LayoutOrder = 1
                    }), 
                    v11.createElement("TextLabel", {
                        Text = v396.orText, 
                        TextSize = v393.Tokens.Global.Size_200, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextTransparency = 0, 
                        TextColor3 = v393.Tokens.Global.Color.Smoke.Color3, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }), 
                    v11.createElement("Frame", {
                        Size = UDim2.new(0, v393.Tokens.Global.Size_25, 0.5, 0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = v393.Tokens.Global.Color.Smoke.Color3, 
                        LayoutOrder = 3
                    })
                }) or nil, 
                LoginCode = v387 and v11.createElement("Frame", {
                    Size = UDim2.new(0.5, 0, 1, 0), 
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1
                }, {
                    v11.createElement(v53, {
                        loginCallback = v381.handleLoginWithCode, 
                        isOverlay = false, 
                        hideDeviceCode = not v385, 
                        showLockIcon = not v385, 
                        isDualLayout = true
                    })
                }), 
                Forgot = if not not v384 or v387 or v392 then nil else v11.createElement(l_LinkButton_0, {
                    text = v396.forgotText, 
                    size = UDim2.new(0, 0, 0, 30), 
                    fontStyle = "Footer", 
                    onActivated = v381.onForgetButtonActivated, 
                    colorStyleDefault = "TextDefault", 
                    colorStyleHover = "TextDefault"
                }), 
                DisclaimerLinks = if not not v387 or v390 or v391 then nil else v11.createElement(v38, {
                    fillDirection = Enum.FillDirection.Vertical, 
                    LayoutOrder = 60
                }), 
                Padding = not v387 and v11.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v154), 
                    LayoutOrder = 61
                }) or nil
            });
        end);
    end);
end;
v153 = l_RoactServices_0.connect({
    networking = v13, 
    analytics = v18, 
    authAnalytics = v15, 
    loggingProtocol = l_AppLogging_0, 
    linking = l_AppLinking_0
})(v153);
v153 = v12.connect(function(v400, _) --[[ Line: 2257 ]]
    local v402 = v400.Navigation.history[#v400.Navigation.history];
    return {
        currentPageName = v402[#v402].name, 
        screenSize = v400.ScreenSize, 
        statusBarHeight = v400.TopBar.statusBarHeight, 
        globalGuiInset = v400.GlobalGuiInset
    };
end, function(v403) --[[ Line: 2265 ]]
    -- upvalues: v25 (copy), v26 (copy), v27 (copy), v28 (copy), v30 (copy), v71 (copy), v82 (copy), v125 (copy), v122 (copy), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (copy), l_AccountSwitcherConstants_0 (copy), v69 (copy), v107 (copy), v112 (copy), l_GuiService_0 (copy), v123 (copy), v35 (copy), v32 (copy), v34 (copy), v33 (copy), v36 (copy), v59 (copy), v126 (copy), v37 (copy), v39 (copy), v89 (copy), v41 (copy), v42 (copy), v79 (copy), v31 (copy), v81 (copy), v40 (copy), v109 (copy), v43 (copy)
    return {
        login = function(...) --[[ Line: 2267 ]] --[[ Name: login ]]
            -- upvalues: v403 (copy), v25 (ref)
            return v403(v25(...));
        end, 
        loginByCode = function(...) --[[ Line: 2270 ]] --[[ Name: loginByCode ]]
            -- upvalues: v403 (copy), v26 (ref)
            return v403(v26(...));
        end, 
        loginByPasskey = function(...) --[[ Line: 2273 ]] --[[ Name: loginByPasskey ]]
            -- upvalues: v403 (copy), v27 (ref)
            return v403(v27(...));
        end, 
        loginByOtp = function(...) --[[ Line: 2276 ]] --[[ Name: loginByOtp ]]
            -- upvalues: v403 (copy), v28 (ref)
            return v403(v28(...));
        end, 
        launchApp = function(v404, v405, v406, v407) --[[ Line: 2279 ]] --[[ Name: launchApp ]]
            -- upvalues: v403 (copy), v30 (ref), v71 (ref)
            return v403(v30(v404, v405, v406, v407, v71.Login));
        end, 
        clearApp = function() --[[ Line: 2285 ]] --[[ Name: clearApp ]]
            -- upvalues: v403 (copy), v82 (ref), v125 (ref)
            v403(v82());
            return v125.resolve(true);
        end, 
        handleLoginCompletionWithAccountSwitching = function(v408, v409, v410, v411, v412, v413, v414) --[[ Line: 2290 ]] --[[ Name: handleLoginCompletionWithAccountSwitching ]]
            -- upvalues: v122 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), v69 (ref), v107 (ref), v112 (ref), l_GuiService_0 (ref), v123 (ref)
            if v122.fromLocalStorage().userId ~= -1 then
                v413():andThen(function(_) --[[ Line: 2301 ]]
                    -- upvalues: l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), v69 (ref), v107 (ref), v412 (copy), v112 (ref), l_GuiService_0 (ref), v123 (ref)
                    local v416 = if l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 then l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromLoginStatus else v69.Auth.AccountSwitcherSwitchedStatus;
                    v107.setAccountSwitchStatus(v416);
                    v107.setAccountBlob(v412);
                    v107.flush();
                    if v112 then
                        l_GuiService_0:BroadcastNotification("", v123.DID_SWITCH_ACCOUNT);
                        return;
                    else
                        l_GuiService_0:BroadcastNotification("", v123.DID_LOG_OUT);
                        return;
                    end;
                end, function(_) --[[ Line: 2313 ]]
                    -- upvalues: v107 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), v412 (copy), v414 (copy), v408 (copy), v409 (copy), v410 (copy), v411 (copy)
                    v107.setAccountSwitchStatus(if l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 then l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromLoginStatus else "switched");
                    v107.setAccountBlob(v412);
                    v107.flush();
                    v414(v408, v409, v410, v411);
                end);
                return;
            else
                v107.setAccountBlob(v412);
                v107.flush();
                v414(v408, v409, v410, v411);
                return;
            end;
        end, 
        setBackNavigationDisabled = function(v418) --[[ Line: 2330 ]] --[[ Name: setBackNavigationDisabled ]]
            -- upvalues: v403 (copy), v35 (ref)
            return v403(v35(v418));
        end, 
        navigateToPage = function(v419) --[[ Line: 2333 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v403 (copy), v32 (ref)
            return v403(v32(v419));
        end, 
        setLoginResult = function(v420) --[[ Line: 2336 ]] --[[ Name: setLoginResult ]]
            -- upvalues: v403 (copy), v34 (ref)
            v403(v34(v420));
        end, 
        openPasswordResetPrompt = function() --[[ Line: 2339 ]] --[[ Name: openPasswordResetPrompt ]]
            -- upvalues: v403 (copy), v33 (ref)
            v403(v33());
        end, 
        openEmailVerificationPrompt = function(v421, v422, v423) --[[ Line: 2342 ]] --[[ Name: openEmailVerificationPrompt ]]
            -- upvalues: v403 (copy), v36 (ref), v59 (ref)
            v403(v36(v59.LoginEmailVerificationPrompt, {
                credentialValue = v421, 
                password = v422, 
                onClose = v423
            }));
        end, 
        openNewAppAvailableModal = function(v424) --[[ Line: 2349 ]] --[[ Name: openNewAppAvailableModal ]]
            -- upvalues: v126 (ref), v403 (copy), v36 (ref), v59 (ref)
            if v126() then
                v403(v36(v59.NewAppAvailableModal, {
                    onButtonActivated = v424
                }));
            end;
        end, 
        openCrossDeviceLoginPrompt = function(v425) --[[ Line: 2356 ]] --[[ Name: openCrossDeviceLoginPrompt ]]
            -- upvalues: v403 (copy), v37 (ref)
            v403(v37.OpenLoginCodePrompt({
                loginCallback = v425, 
                isOverlay = true
            }));
        end, 
        openCrossAppLoginPrompt = function(v426) --[[ Line: 2362 ]] --[[ Name: openCrossAppLoginPrompt ]]
            -- upvalues: v403 (copy), v37 (ref)
            v403(v37.OpenLoginCodePrompt({
                loginCallback = v426, 
                isOverlay = true, 
                isCrossApp = true
            }));
        end, 
        openAccountSelector = function(v427) --[[ Line: 2369 ]] --[[ Name: openAccountSelector ]]
            -- upvalues: v403 (copy), v39 (ref), v89 (ref)
            v403(v39(v427, v89(), false));
        end, 
        openEmailOtp = function(v428) --[[ Line: 2374 ]] --[[ Name: openEmailOtp ]]
            -- upvalues: v403 (copy), v41 (ref)
            v403(v41(v428));
        end, 
        closeCentralOverlay = function() --[[ Line: 2377 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v403 (copy), v42 (ref)
            return v403(v42());
        end, 
        resetAppState = function() --[[ Line: 2380 ]] --[[ Name: resetAppState ]]
            -- upvalues: v403 (copy), v82 (ref)
            return v403(v82());
        end, 
        renderChallenge = function(v429, v430) --[[ Line: 2383 ]] --[[ Name: renderChallenge ]]
            -- upvalues: v403 (copy), v79 (ref)
            return v403(v79(v429, v430));
        end, 
        startPasskeyAuthentication = function(v431) --[[ Line: 2386 ]] --[[ Name: startPasskeyAuthentication ]]
            -- upvalues: v403 (copy), v31 (ref)
            return v403(v31(v431));
        end, 
        logoutAllLoggedInUsers = function(v432, v433) --[[ Line: 2389 ]] --[[ Name: logoutAllLoggedInUsers ]]
            -- upvalues: v403 (copy), v81 (ref)
            return v403(v81(v432, v433));
        end, 
        logoutWithoutShowConfirmation = function(v434, v435) --[[ Line: 2392 ]] --[[ Name: logoutWithoutShowConfirmation ]]
            -- upvalues: v403 (copy), v40 (ref)
            return v403(v40(v434, v435));
        end, 
        openAccountSwitchingErrorOverlay = function(v436, v437, v438, v439, v440, v441, v442, v443) --[[ Line: 2395 ]] --[[ Name: openAccountSwitchingErrorOverlay ]]
            -- upvalues: v403 (copy), v109 (ref)
            return v403(v109(v436, v437, v438, v439, v440, v441, v442, v443));
        end, 
        navigateBack = function() --[[ Line: 2418 ]] --[[ Name: navigateBack ]]
            -- upvalues: v403 (copy), v43 (ref)
            return v403(v43());
        end, 
        showAccountLinkingAlert = function(v444, v445) --[[ Line: 2421 ]] --[[ Name: showAccountLinkingAlert ]]
            -- upvalues: v403 (copy), v36 (ref), v59 (ref)
            return v403(v36(v59.AccountLinkingAlert, {
                alertType = v444, 
                userFacingMessage = v445
            }));
        end
    };
end)(v153);
v153 = l_RoactAppPolicy_0.connect(function(v446, _) --[[ Line: 2430 ]]
    return {
        appPolicy = v446
    };
end)(v153);
v153 = v16.connectBrowserTrackerLayer({
    l_AppBtidLayers_0.LoginLayer
}, function(v448, _) --[[ Line: 2438 ]]
    -- upvalues: l_AppBtidLayers_0 (copy), v142 (copy)
    local v450 = v448[l_AppBtidLayers_0.LoginLayer] or {};
    return {
        isLoginWithOtpEnabled = v142 or v450.IsLoginWithOtpEnabled, 
        shouldLoginWithKeystoreCredentials = v450.shouldLoginWithKeystoreCredentials
    };
end)(v153);
v153 = l_withNavigationProps_0(function(_, v452) --[[ Line: 2447 ]]
    return v452;
end)(v153);
return function(v453) --[[ Line: 2451 ]] --[[ Name: LoginViewFn ]]
    -- upvalues: l_useUiModeInfo_0 (copy), v19 (copy), v11 (copy), v153 (ref), v9 (copy)
    local v454 = l_useUiModeInfo_0();
    local v455, v456 = v19.useDefaultFocusBehavior();
    return v11.createElement(v153, v9.Dictionary.join({
        uiModeInfo = v454, 
        defaultRef = v455, 
        containerRef = v456
    }, v453));
end;