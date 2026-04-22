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
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Common_0 = l_Modules_0.Common;
local v13 = require(l_Common_0.Roact);
local v14 = require(l_Common_0.RoactRodux);
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v17 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v18 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v20 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v21 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v22 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_GetPasswordManagerUsageStore_0 = v22.Stores.GetPasswordManagerUsageStore;
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v26 = require(l_Modules_0.LuaApp.AppPage);
local v27 = require(l_Modules_0.LuaApp.Thunks.Authentication.Login);
local v28 = require(l_Modules_0.LuaApp.Thunks.Authentication.LoginByCode);
local v29 = require(l_Modules_0.LuaApp.Thunks.Authentication.LoginByPasskey);
local v30 = require(l_Modules_0.LuaApp.Thunks.Authentication.LoginByOtp);
local v31 = require(l_Modules_0.LuaApp.Models.Authentication.LoginResult);
local v32 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v33 = require(l_Modules_0.LuaApp.Thunks.Authentication.StartPasskeyAuthentication);
local v34 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v35 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLoginPasswordResetPrompt);
local v36 = require(l_Modules_0.LuaApp.Actions.Authentication.SetLoginResult);
local v37 = require(l_Modules_0.LuaApp.Actions.SetBackNavigationDisabled);
local v38 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v39 = require(l_Modules_0.LuaApp.Thunks.Authentication.CrossDeviceLogin);
local v40 = require(l_Modules_0.LuaApp.Components.Authentication.DisclaimerLinks);
local v41 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSelector);
local v42 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v43 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenEmailOtp);
local v44 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v45 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v46 = require(l_Modules_0.LuaApp.Http.Requests.AuthCanVerifyCredentials);
local v47 = require(l_Modules_0.LuaApp.Http.Requests.GetIXPLayerParameters);
local v48 = require(l_Modules_0.LuaApp.Components.Authentication.LogoWithContentsLayout);
local v49 = require(l_Modules_0.LuaApp.Components.Authentication.DualLoginWithContentsLayout);
local l_isStringEmail_0 = v22.Utils.isStringEmail;
local l_isStringPhone_0 = v22.Utils.isStringPhone;
local l_enrolledInLuafiedRecoveryExperiment_0 = v22.Experiments.enrolledInLuafiedRecoveryExperiment;
local v53 = require(l_Modules_0.LuaApp.Util.Base64);
local v54 = require(l_Modules_0.LuaApp.Components.Authentication.CredentialLoginContainer);
local v55 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodePrompt);
local v56 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v57 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodes);
local v58 = require(l_Modules_0.LuaApp.Enum.Alignment);
local l_LocalStorageKey_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey;
local v60 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v61 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v62 = require(l_Modules_0.LuaApp.Enum.CredentialType);
local v63 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v63.Style.withStyle;
local v65 = require(l_Modules_0.LuaApp.withLocalization);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v67 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v68 = require(l_Modules_0.LuaApp.Analytics.Events.AppLoginCounterNames);
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local v70 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v71 = require(l_Modules_0.LuaApp.Constants);
local l_AccountSwitcherConstants_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Common.AccountSwitcherConstants;
local v73 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local l_LinkButton_0 = v63.App.Button.LinkButton;
local v75 = require(l_Modules_0.LuaApp.FlagSettings);
local v76 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v77 = require(l_Modules_0.LuaApp.Enum.Challenge.Type);
local v78 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppWaitBeforeTwoStepRenderDev);
local v79 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDev);
local v80 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin);
local v81 = require(l_Modules_0.LuaApp.Thunks.Challenge.RenderChallenge);
local v82 = require(l_Modules_0.LuaApp.Http.Requests.TwoStepRequests);
local v83 = require(l_Modules_0.LuaApp.Thunks.Authentication.AccountSwitcher.LogoutAllLoggedInUsers);
local v84 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetAppState);
local v85 = require(l_Modules_0.LuaApp.Enum.Challenge.TwoStepVerification.ActionType);
local l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0 = v76.GetFFlagLuaAppEnableDesktopDualLoginABTest;
local v87 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLoginAccountSelector);
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v89 = require(l_Modules_0.LuaApp.Flags.GetFIntLoginViewBottomPaddingPx);
local v90 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableOtpEmailLogin);
local v91 = require(l_Modules_0.LuaApp.Flags.GetFFlagShouldUsePeekViewForLoginDisambiguation);
local v92 = require(l_Modules_0.LuaApp.Flags.GetFFlagShouldEnableOtpDisambiguationPeekViewFix);
local v93 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCredentialsProtocolPasswords);
local v94 = require(l_Modules_0.LuaApp.Flags.GetFFlagAuthIntentLoggingAtLoginEnabled);
local v95 = require(l_Modules_0.LuaApp.Flags.GetFFlagAlwaysSaveCredentialsAfter2Sv);
local v96 = require(l_Modules_0.LuaApp.Flags.GetFFlagReportCrossAppLoginAttempt);
local l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 = v76.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues;
local l_FFlagPasswordManagerAwaitEnabled_0 = v76.FFlagPasswordManagerAwaitEnabled;
local l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 = v76.FFlagEnableCredentialsV2InterfaceDetectionFix;
local v100 = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV1", false);
local v101 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol);
local l_Constants_0 = v101.Constants;
local l_default_0 = v101.CredentialsProtocol.default;
local l_CredentialsProtocolErrorCodes_0 = v101.CredentialsProtocolErrorCodes;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v109 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v110 = require(l_Modules_0.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore);
local v111 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSwitchingErrorOverlay);
local v112 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v113 = require(l_Modules_0.LuaApp.Flags.FFlagEnableKoreaKISACompliance);
local v114 = require(l_Modules_0.LuaApp.Flags.FFlagLuaEnableDidSwitchAccount);
local v115 = game:DefineFastFlag("AwaitLoginCompletionForDisambiguationFlow", false);
game:DefineFastFlag("LuaLoginManualCredentialValidation", false);
game:DefineFastFlag("EnablePlayerAppLoginPageExperiments", false);
local v116 = game:DefineFastFlag("EnableLoginV1RegisterCredentialsFix", false);
local l_FFlagEnablePasskeyLoginErrorLogging_0 = v76.FFlagEnablePasskeyLoginErrorLogging;
local l_FFlagUseErrorTypeForPasskeyLoginLogging_0 = v76.FFlagUseErrorTypeForPasskeyLoginLogging;
local l_FFlagAuthSecExclusions_0 = v76.FFlagAuthSecExclusions;
local l_FFlagEnablePWManagerLoginCheck_0 = v76.FFlagEnablePWManagerLoginCheck;
local l_FFlagEnableAuthDeepLinkReceiver_0 = v76.FFlagEnableAuthDeepLinkReceiver;
local l_FFlagEnableNavigateToLoginAfterLogoutAll_0 = v76.FFlagEnableNavigateToLoginAfterLogoutAll;
local l_PreAuthDeepLinkUrlStore_0 = v22.Stores.PreAuthDeepLinkUrlStore;
local v124 = require(script.Parent.Parent.Parent.Thunks.Authentication.User);
local v125 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v127 = require(l_CorePackages_0.Packages.Promise);
local v128 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVNGNewAppAvailableModal);
local v129 = require(l_Modules_0.LuaApp.Flags.GetFStringVNGDownloadNowUrl);
local v130 = game:DefineFastFlag("FixLoginSelection", false);
local v131 = require(l_Modules_0.LuaApp.Flags.FFlagEnableVNGDUARSignupCompliance);
local l_GetFFlagEnableAccountSwitcherFoundationDesign_0 = v76.GetFFlagEnableAccountSwitcherFoundationDesign;
local l_GetFFlagEnableAccountSwitcherRedesignIXP_0 = v76.GetFFlagEnableAccountSwitcherRedesignIXP;
local l_GetFFlagEnableAccountSwitcherIXPTextGatingFix_0 = v76.GetFFlagEnableAccountSwitcherIXPTextGatingFix;
local v135 = require(l_Modules_0.LuaApp.Flags.FFlagEnableIosKeychainLoginLua);
local l_GetUserByUsername_0 = v22.Thunks.GetUserByUsername;
local l_withNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).withNavigationProps;
local l_KeystoreConstants_0 = v22.Common.KeystoreConstants;
local l_KeystoreAnalyticsEvents_0 = v22.Analytics.KeystoreAnalyticsEvents;
local l_KeystoreEventConstants_0 = v22.Analytics.KeystoreEventConstants;
local l_AccountLinkingAlertType_0 = v22.Enums.AccountLinkingAlertType;
local l_TwoStepErrorCodes_0 = v22.Enums.TwoStepErrorCodes;
local l_getTwoStepLoginErrorKey_0 = v22.Utils.getTwoStepLoginErrorKey;
local v144 = game:DefineFastFlag("LoginButtonAutoDisabled", false);
local v145 = game:DefineFastFlag("EnableTwoStepLoginChallengeAnalytics", false);
local v146 = game:DefineFastFlag("DebugOTPBypass", false);
local l_GetFFlagBypassKeystoreLoginIxpV2_0 = v76.GetFFlagBypassKeystoreLoginIxpV2;
local l_GetFFlagRemoveKeystoreIxpLogic_0 = v76.GetFFlagRemoveKeystoreIxpLogic;
local l_GetFFlagEnableLuafiedRecoveryFlow_0 = v76.GetFFlagEnableLuafiedRecoveryFlow;
local l_FFlagDisableMemStorageServicePasswordEvent_0 = v76.FFlagDisableMemStorageServicePasswordEvent;
local l_FFlagEnableLoginV1ForcedUsernameOverride_0 = v76.FFlagEnableLoginV1ForcedUsernameOverride;
local l_GetFFlagKeystoreAutoLoginAvailable_0 = v76.GetFFlagKeystoreAutoLoginAvailable;
local l_GetFFlagCheckIsAvailableForKeystoreOperations_0 = v76.GetFFlagCheckIsAvailableForKeystoreOperations;
local l_GetFFlagEnable2SVRecovery_0 = require(l_CorePackages_0.Workspace.Packages.AccountRecovery).Flags.GetFFlagEnable2SVRecovery;
local v155 = require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeFeature);
local v156 = game:DefineFastFlag("EnableAccountSwitchSignInThemeFix", false);
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local l_PasskeyConstants_0 = v22.Common.PasskeyConstants;
local v159 = v13.PureComponent:extend("LoginView");
local v160 = v89();
local v161 = {
    CValue = 1, 
    Password = 2
};
v159.init = function(v162) --[[ Line: 217 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), v130 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), v112 (copy), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (copy), l_FFlagEnablePWManagerLoginCheck_0 (copy), l_GetPasswordManagerUsageStore_0 (copy), v57 (copy), v161 (copy), v124 (copy), v109 (copy), l_MemStorageService_0 (copy), v60 (copy), v156 (copy), v155 (copy), l_UserInputService_0 (copy), v46 (copy), v67 (copy), v68 (copy), l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (copy), l_HttpService_0 (copy), v53 (copy), l_default_0 (copy), l_Logger_0 (copy), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (copy), l_CredentialsProtocolErrorCodes_0 (copy), v70 (copy), l_PasskeyConstants_0 (copy), l_FFlagEnablePasskeyLoginErrorLogging_0 (copy), v90 (copy), v77 (copy), v78 (copy), v79 (copy), v145 (copy), v85 (copy), l_GetFFlagEnable2SVRecovery_0 (copy), v82 (copy), v95 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (copy), v93 (copy), l_FFlagPasswordManagerAwaitEnabled_0 (copy), v100 (copy), l_TwoStepErrorCodes_0 (copy), l_getTwoStepLoginErrorKey_0 (copy), l_AccountLinkingAlertType_0 (copy), l_isStringEmail_0 (copy), l_isStringPhone_0 (copy), v115 (copy), v92 (copy), v91 (copy), v127 (copy), v135 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), l_GetFFlagRemoveKeystoreIxpLogic_0 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (copy), l_ContentProvider_0 (copy), l_GetUserByUsername_0 (copy), v110 (copy), l_KeystoreConstants_0 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (copy), v31 (copy), v87 (copy), l_Constants_0 (copy), v116 (copy), v83 (copy), l_AccountSwitcherConstants_0 (copy), l_GuiService_0 (copy), v80 (copy), l_StatusCodes_0 (copy), v71 (copy), v62 (copy), v128 (copy), v129 (copy), l_GetFFlagEnableLuafiedRecoveryFlow_0 (copy), l_enrolledInLuafiedRecoveryExperiment_0 (copy), v26 (copy), v56 (copy), v96 (copy), l_RbxAnalyticsService_0 (copy)
    local v163 = false;
    v162.cvalueRef = v13.createRef();
    v162.passwordRef = v13.createRef();
    v162.loginButtonRef = v13.createRef();
    v162.forgotLinkRef = v13.createRef();
    v162.crossDeviceButtonRef = v13.createRef();
    v162.emailOtpRef = v13.createRef();
    if v130 then
        v162.focusRef = v13.createRef();
    end;
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(l_LocalStorageKey_0.CredentialValue);
    if v112 then
        local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem(l_LocalStorageKey_0.AccountBlob);
        if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
            l_l_AppStorageService_0_Item_0 = "";
        end;
    end;
    if l_FFlagEnableLoginV1ForcedUsernameOverride_0 and v162.props.forcedUsernameOverride then
        l_l_AppStorageService_0_Item_0 = v162.props.forcedUsernameOverride;
    end;
    local v166, v167 = v13.createBinding(l_l_AppStorageService_0_Item_0);
    v162.cvalueText = v166;
    v162.updateCValueText = v167;
    v166, v167 = v13.createBinding("");
    v162.passwordText = v166;
    v162.updatePasswordText = v167;
    v162.state = {
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
    v162.passwordManagerUsageStore = if l_FFlagEnablePWManagerLoginCheck_0 then l_GetPasswordManagerUsageStore_0(false) else nil;
    if v162.passwordManagerUsageStore then
        v162.passwordManagerUsageStore.setLoggedinUsingSavedPassword(false);
        v162.passwordManagerUsageStore.setSavedPasswordAfterLogin(false);
    end;
    v162.errorHandlingInfoList = {
        [v57.IncorrectCValueOrPassword] = {
            textBoxesToClear = {
                v161.Password
            }, 
            newFocusedTextBox = v161.Password
        }, 
        [v57.CValueAndPasswordRequired] = {
            textBoxesToClear = {
                v161.Password
            }, 
            newFocusedTextBox = v161.Password
        }, 
        [v57.AccountLocked] = {
            textBoxesToClear = {
                v161.Password
            }
        }, 
        [v57.MoreThanOneUsername] = {
            textBoxesToClear = {
                v161.CValue, 
                v161.Password
            }, 
            newFocusedTextBox = v161.CValue, 
            forceLoginByUsername = true
        }, 
        [v57.AccountNotVerified] = {
            textBoxesToClear = {
                v161.CValue, 
                v161.Password
            }, 
            forceLoginByUsername = true
        }, 
        [v57.MultipleUsersPerCredential] = if v162.props.appPolicy.getAccountDisambiguationDisabled() then {
            textBoxesToClear = {
                v161.CValue, 
                v161.Password
            }, 
            newFocusedTextBox = v161.CValue, 
            forceLoginByUsername = true
        } else nil
    };
    v162.isAlreadyAuthenticated = v124.fromLocalStorage().userId ~= -1;
    resetDefaultTheme = function() --[[ Line: 303 ]]
        -- upvalues: v109 (ref), l_MemStorageService_0 (ref), v60 (ref), v156 (ref), v155 (ref)
        local v168 = v109.getAuthenticatedTheme();
        if v168 ~= "" then
            l_MemStorageService_0:Fire(v60.ThemeUpdate, v168);
        end;
        if v156 then
            v155.ClearThemeOverride();
        end;
    end;
    v162.updateIsLoginInProgress = function(v169) --[[ Line: 313 ]]
        -- upvalues: v162 (copy)
        spawn(function() --[[ Line: 314 ]]
            -- upvalues: v162 (ref), v169 (copy)
            local l_isLoginInProgress_0 = v162.state.isLoginInProgress;
            if v162.isMounted and l_isLoginInProgress_0 ~= v169 then
                v162:setState({
                    isLoginInProgress = v169
                });
            end;
        end);
    end;
    v162.onTextBoxesChanged = function(v171) --[[ Line: 324 ]]
        -- upvalues: v162 (copy)
        if not v162.cvalueRef.current or not v162.passwordRef.current or not v162.isMounted then
            return;
        else
            local v172 = v171.Text:gsub("\t", "");
            if v171.Text ~= v172 then
                v171.Text = v172;
            end;
            local l_v162_0 = v162;
            local v174 = {};
            local v175 = true;
            if #v162.cvalueRef.current.Text ~= 0 then
                v175 = #v162.passwordRef.current.Text == 0;
            end;
            v174.loginButtonDisabled = v175;
            v174.errorKey = #v171.Text == 0 and v162.state.errorKey or "";
            v174.errorCode = -1;
            l_v162_0:setState(v174);
            return;
        end;
    end;
    v162.unfocusTextBoxes = function() --[[ Line: 342 ]]
        -- upvalues: l_UserInputService_0 (ref), v162 (copy)
        local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
        if l_l_UserInputService_0_FocusedTextBox_0 and (l_l_UserInputService_0_FocusedTextBox_0 == v162.cvalueRef.current or l_l_UserInputService_0_FocusedTextBox_0 == v162.passwordRef.current) then
            l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
        end;
    end;
    v162.handleCaptchaResult = function(v177, v178) --[[ Line: 351 ]]
        -- upvalues: v162 (copy)
        if v177 then
            v162.handleLoginWithFormData(v178);
            return;
        else
            v162.updateIsLoginInProgress(false);
            return;
        end;
    end;
    v162.getCaptchaResultHandlerWithCode = function(v179, v180) --[[ Line: 359 ]]
        -- upvalues: v162 (copy)
        return function(v181, v182) --[[ Line: 360 ]]
            -- upvalues: v162 (ref), v179 (copy), v180 (copy)
            if v181 then
                v162.handleLoginWithCode(v179, v180, v182);
                return;
            else
                v162.updateIsLoginInProgress(false);
                return;
            end;
        end;
    end;
    v162.getSecurityQuestionsLoginWithCodeCallback = function(v183, v184) --[[ Line: 369 ]]
        -- upvalues: v162 (copy)
        return function(v185) --[[ Line: 370 ]]
            -- upvalues: v162 (ref), v183 (copy), v184 (copy)
            v162.handleLoginWithCode(v183, v184, nil, v185);
        end;
    end;
    v162.getSecurityQuestionsLoginWithOtpCallback = function() --[[ Line: 375 ]]
        -- upvalues: v162 (copy)
        return function(v186) --[[ Line: 376 ]]
            -- upvalues: v162 (ref)
            v162.handleLoginWithOtp(v186, nil);
        end;
    end;
    v162.getSecurityQuestionsLoginWithFormDataCallback = function() --[[ Line: 381 ]]
        -- upvalues: v162 (copy)
        return function(v187) --[[ Line: 382 ]]
            -- upvalues: v162 (ref)
            v162.handleLoginWithFormData(nil, v187);
        end;
    end;
    v162.canVerifyCredentials = function(v188, v189, v190) --[[ Line: 387 ]]
        -- upvalues: v46 (ref), v162 (copy)
        return v46(v162.props.networking, v188, v189, v190):andThen(function(v191) --[[ Line: 389 ]]
            return v191 and v191.responseBody and v191.responseBody.canSend;
        end, function() --[[ Line: 392 ]]
            return false;
        end);
    end;
    v162.handleLoginWithCode = function(v192, v193, v194, v195) --[[ Line: 398 ]]
        -- upvalues: v162 (copy), v57 (ref), v67 (ref), v68 (ref)
        v162.updateIsLoginInProgress(true);
        local l_setBackNavigationDisabled_0 = v162.props.setBackNavigationDisabled;
        v162.unfocusTextBoxes();
        l_setBackNavigationDisabled_0(true);
        local l_loginByCode_0 = v162.props.loginByCode;
        local v198 = v162.getCaptchaResultHandlerWithCode(v192, v193);
        local v199 = v162.getSecurityQuestionsLoginWithCodeCallback(v192, v193);
        return l_loginByCode_0(v162.props.networking, v192, v193, v198, v194, v199, v195):andThen(function(v200) --[[ Line: 419 ]]
            -- upvalues: v162 (ref)
            v162.handleLoginResult(v200, nil);
        end, function(v201) --[[ Line: 421 ]]
            -- upvalues: v57 (ref), v67 (ref), v68 (ref), v162 (ref), v192 (copy), v193 (copy)
            if v201.errorCode ~= v57.Captcha then
                v67(v68.FailureAuthCode, 1);
            end;
            v162.handleLoginError(v201, v192, v193);
        end);
    end;
    v162.handleLoginWithPasskey = function(v202, v203) --[[ Line: 429 ]]
        -- upvalues: l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (ref), v163 (ref), v162 (copy)
        if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 then
            v163 = false;
        end;
        v162.updateIsLoginInProgress(true);
        local l_setBackNavigationDisabled_1 = v162.props.setBackNavigationDisabled;
        v162.unfocusTextBoxes();
        l_setBackNavigationDisabled_1(true);
        return v162.props.loginByPasskey(v162.props.networking, v202, v203):andThen(function(v205) --[[ Line: 440 ]]
            -- upvalues: v162 (ref)
            v162.handleLoginResult(v205, nil);
        end, function(v206) --[[ Line: 442 ]]
            -- upvalues: v162 (ref), v202 (copy)
            v162.handleLoginError(v206, v202);
        end);
    end;
    v162.showPasskeyLoginPopup = function() --[[ Line: 447 ]]
        -- upvalues: v162 (copy), l_HttpService_0 (ref), l_UserInputService_0 (ref), v53 (ref), l_default_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), v70 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref)
        local l_networking_0 = v162.props.networking;
        return v162.props.startPasskeyAuthentication(l_networking_0):andThen(function(v208) --[[ Line: 450 ]]
            -- upvalues: l_HttpService_0 (ref), l_UserInputService_0 (ref), v53 (ref), l_default_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), v162 (ref), v70 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref)
            local v209 = l_HttpService_0:JSONDecode(v208.authenticationOptions);
            local l_sessionId_0 = v208.sessionId;
            local v211 = tonumber(v209.publicKey.timeout);
            v209.keyType = "platform";
            v209.deviceBoundOnly = true;
            if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                v209.publicKey.challenge = v53.FromUrlSafeBase64(v209.publicKey.challenge);
            end;
            local v212 = l_HttpService_0:JSONEncode(v209);
            l_default_0:getCredentials(l_default_0.CredentialsTypes.FIDO2, v212, v211):andThen(function(v213) --[[ Line: 467 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), v162 (ref), v70 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), v53 (ref), l_sessionId_0 (copy)
                local v214 = l_HttpService_0:JSONDecode(v213);
                if v214 == nil or next(v214) == nil then
                    l_Logger_0:info("Passkey credential signing failed. No result returned.");
                    return;
                else
                    if v214.errorCode ~= nil then
                        l_Logger_0:info("Passkey credential signing failed. Error {} (msg: {}) returned.", v214.errorCode, v214.errorMsg);
                        if l_FFlagUseErrorTypeForPasskeyLoginLogging_0 then
                            local v215 = tonumber(v214.errorCode);
                            local v216 = l_CredentialsProtocolErrorCodes_0.GetCredentialsErrorCodes[v215 or -1] or string.format(l_CredentialsProtocolErrorCodes_0.UNMAPPED_ERROR_CODE, (tostring(v214.errorCode)));
                            v162.props.authAnalytics.reportAuthClientError(v70.Context.PasskeyLoginAttempt, v216, l_PasskeyConstants_0.PASSKEY_FETCH_LOGIN_V1);
                            return;
                        elseif l_FFlagEnablePasskeyLoginErrorLogging_0 and type(v214.errorMsg) == "string" then
                            v162.props.authAnalytics.reportAuthClientError(v70.Context.PasskeyLoginAttempt, v214.errorMsg, l_PasskeyConstants_0.PASSKEY_FETCH_LOGIN_V1);
                            return;
                        end;
                    else
                        l_Logger_0:info("Passkey credential signing completed. Attempting login.");
                        v214.id = v53.ToUrlSafeBase64(v214.id);
                        v214.rawId = v53.ToUrlSafeBase64(v214.rawId);
                        v214.response.signature = v53.ToUrlSafeBase64(v214.response.signature);
                        v214.response.userHandle = v53.ToUrlSafeBase64(v214.response.userHandle);
                        v214.response.authenticatorData = v53.ToUrlSafeBase64(v214.response.authenticatorData);
                        v214.response.clientDataJSON = v53.ToUrlSafeBase64(v214.response.clientDataJSON);
                        v162.handleLoginWithPasskey(v214, l_sessionId_0);
                    end;
                    return;
                end;
            end, function(v217) --[[ Line: 514 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Passkey credential signing failed. Error: {}", v217);
            end);
        end, function(v218) --[[ Line: 518 ]]
            -- upvalues: l_Logger_0 (ref)
            l_Logger_0:warning("Fetching passkey login options failed with error code: {}", v218.errorCode);
        end);
    end;
    v162.showGenericCredentialLoginPopup = function(v219, v220) --[[ Line: 523 ]]
        -- upvalues: v162 (copy), l_HttpService_0 (ref), l_UserInputService_0 (ref), v53 (ref), l_Logger_0 (ref), l_default_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), v70 (ref), l_PasskeyConstants_0 (ref)
        if not v219 and not v220 then
            return;
        else
            local l_networking_1 = v162.props.networking;
            local l_startPasskeyAuthentication_0 = v162.props.startPasskeyAuthentication;
            local v223 = nil;
            local v224 = nil;
            local v225 = nil;
            local v226 = {};
            if v219 then
                l_startPasskeyAuthentication_0(l_networking_1):andThen(function(v227) --[[ Line: 535 ]]
                    -- upvalues: v223 (ref), l_HttpService_0 (ref), v224 (ref), v225 (ref), l_UserInputService_0 (ref), v53 (ref)
                    v223 = l_HttpService_0:JSONDecode(v227.authenticationOptions);
                    v224 = v227.sessionId;
                    v225 = tonumber(v223.publicKey.timeout);
                    v223.keyType = "platform";
                    v223.deviceBoundOnly = true;
                    if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                        v223.publicKey.challenge = v53.FromUrlSafeBase64(v223.publicKey.challenge);
                    end;
                end, function(v228) --[[ Line: 549 ]]
                    -- upvalues: l_Logger_0 (ref)
                    l_Logger_0:warning("Fetching passkey login options failed with error code: {}", v228.errorCode);
                end):await();
                if v223 ~= nil then
                    v226.FIDO2 = v223;
                end;
            end;
            if v220 then
                v226.password = {};
            end;
            local v229 = l_HttpService_0:JSONEncode(v226);
            return l_default_0:getCredentials(l_default_0.CredentialsTypes.all, v229, v225 / 1000):andThen(function(v230) --[[ Line: 566 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), v162 (ref), v70 (ref), l_PasskeyConstants_0 (ref), l_default_0 (ref), v53 (ref), v224 (ref)
                local v231 = l_HttpService_0:JSONDecode(v230);
                if v231 == nil or not v231.response and not v231.errorCode then
                    l_Logger_0:info("Generic credential fetch failed. No result returned.");
                    return;
                else
                    if v231.errorCode ~= nil then
                        l_Logger_0:info("Generic credential fetch failed. Error {} (msg: {}) returned.", v231.errorCode, v231.errorMsg);
                        if l_FFlagEnablePasskeyLoginErrorLogging_0 and type(v231.errorMsg) == "string" then
                            v162.props.authAnalytics.reportAuthClientError(v70.Context.PasskeyLoginAttempt, v231.errorMsg, l_PasskeyConstants_0.GENERIC_CREDENTIAL_FETCH_LOGIN_V1);
                            return;
                        end;
                    elseif v231.credentialType == l_default_0.CredentialsTypes.password then
                        local l_username_0 = v231.response.username;
                        local l_password_0 = v231.response.password;
                        v162.updateCValueText(l_username_0);
                        v162.updatePasswordText(l_password_0);
                        v162.props.authAnalytics.reportAuthButtonClick(v70.Context.CMPasswordLogin, v70.Button.SelectPassword);
                        v162.updateIsLoginInProgress(true);
                        v162.handleLoginWithFormData(nil, nil, nil, true);
                        return;
                    elseif v231.credentialType == l_default_0.CredentialsTypes.FIDO2 then
                        v231.response.id = v53.ToUrlSafeBase64(v231.response.id);
                        v231.response.rawId = v53.ToUrlSafeBase64(v231.response.rawId);
                        v231.response.response.signature = v53.ToUrlSafeBase64(v231.response.response.signature);
                        v231.response.response.userHandle = v53.ToUrlSafeBase64(v231.response.response.userHandle);
                        v231.response.response.authenticatorData = v53.ToUrlSafeBase64(v231.response.response.authenticatorData);
                        v231.response.response.clientDataJSON = v53.ToUrlSafeBase64(v231.response.response.clientDataJSON);
                        v162.handleLoginWithPasskey(v231.response, v224);
                    end;
                    return;
                end;
            end, function(v234) --[[ Line: 614 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Generic credential signing failed. Error: {}", v234);
            end);
        end;
    end;
    v162.handleLoginWithOtp = function(v235, v236) --[[ Line: 619 ]]
        -- upvalues: v90 (ref), v162 (copy)
        if not v90() and v162.props.isLoginWithOtpEnabled then
            return;
        else
            v162.updateIsLoginInProgress(true);
            local l_setBackNavigationDisabled_2 = v162.props.setBackNavigationDisabled;
            v162.unfocusTextBoxes();
            l_setBackNavigationDisabled_2(true);
            local l_loginByOtp_0 = v162.props.loginByOtp;
            local v239 = v162.getSecurityQuestionsLoginWithOtpCallback();
            return l_loginByOtp_0(v162.props.networking, v162.state.otpSessionToken, v162.state.otpCode, v239, v235, v236):andThen(function(v240) --[[ Line: 642 ]]
                -- upvalues: v162 (ref)
                v162.handleLoginResult(v240, nil);
            end, function(v241) --[[ Line: 644 ]]
                -- upvalues: v162 (ref)
                v162.handleLoginError(v241, v162.state.otpSessionToken, v162.state.otpCode);
                return v241.errorKey;
            end);
        end;
    end;
    v162.validateFormCredentials = function(v242) --[[ Line: 650 ]]
        return #v242:gsub("%s+", "") > 0;
    end;
    v162.handleLoginWithFormData = function(v243, v244, v245, v246) --[[ Line: 654 ]]
        -- upvalues: v162 (copy), v57 (ref), l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (ref), v163 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), v70 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), l_HttpService_0 (ref)
        if not v162.cvalueRef.current or not v162.passwordRef.current then
            return;
        else
            local l_Text_0 = v162.cvalueRef.current.Text;
            local l_Text_1 = v162.passwordRef.current.Text;
            if game:GetFastFlag("LuaLoginManualCredentialValidation") and not v162.validateFormCredentials(l_Text_0) then
                v162.handleLoginError({
                    errorKey = "Authentication.Login.Response.IncorrectUsernamePassword", 
                    errorCode = v57.IncorrectCValueOrPassword
                }, l_Text_0, l_Text_1);
                v162.updateCValueText("");
                return;
            else
                local l_setBackNavigationDisabled_3 = v162.props.setBackNavigationDisabled;
                v162.unfocusTextBoxes();
                l_setBackNavigationDisabled_3(true);
                local l_login_0 = v162.props.login;
                local l_handleCaptchaResult_0 = v162.handleCaptchaResult;
                local l_networking_2 = v162.props.networking;
                local v253 = v162.getSecurityQuestionsLoginWithFormDataCallback();
                local l_forceLoginByUsername_0 = v162.state.forceLoginByUsername;
                if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 then
                    v163 = true;
                end;
                return l_login_0(l_networking_2, l_Text_0, l_Text_1, l_handleCaptchaResult_0, v243, v253, v244, v245, l_forceLoginByUsername_0):andThen(function(v255) --[[ Line: 697 ]]
                    -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_Text_0 (copy), v246 (copy), v162 (ref), v70 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), l_HttpService_0 (ref), l_Text_1 (copy)
                    l_AppStorageService_0:SetItem(l_LocalStorageKey_0.CredentialValue, l_Text_0);
                    l_AppStorageService_0:flush();
                    if v246 then
                        v162.props.authAnalytics.reportAuthFormInteraction(v70.Context.CMPasswordLogin, nil, "success");
                        if l_FFlagEnablePWManagerLoginCheck_0 and v162.passwordManagerUsageStore then
                            v162.passwordManagerUsageStore.setLoggedinUsingSavedPassword(true);
                        end;
                    end;
                    local v256 = if not v246 then l_HttpService_0:JSONEncode({
                        cvalue = l_Text_0, 
                        password = l_Text_1, 
                        authType = "login"
                    }) else nil;
                    v162.handleLoginResult(v255, v256);
                end, function(v257) --[[ Line: 722 ]]
                    -- upvalues: v246 (copy), v162 (ref), v70 (ref), l_Text_0 (copy), l_Text_1 (copy)
                    if v246 then
                        v162.props.authAnalytics.reportAuthFormInteraction(v70.Context.CMPasswordLogin, nil, "error");
                    end;
                    v162.handleLoginError(v257, l_Text_0, l_Text_1);
                end);
            end;
        end;
    end;
    v162.renderSecurityQuestions = function(_, _, v260, v261) --[[ Line: 735 ]]
        -- upvalues: v162 (copy), v77 (ref)
        v162.props.renderChallenge({
            challengeType = v77.SecurityQuestions, 
            challengeParameters = {
                sessionId = v261.sessionId, 
                userId = v261.userId, 
                onChallengeCompleted = function(v262) --[[ Line: 741 ]] --[[ Name: onChallengeCompleted ]]
                    -- upvalues: v261 (copy), v260 (copy)
                    local v263 = {
                        sessionId = v261.sessionId, 
                        redemptionToken = v262.redemptionToken
                    };
                    v260(v263);
                end, 
                onChallengeInvalidated = function(v264) --[[ Line: 748 ]] --[[ Name: onChallengeInvalidated ]]
                    -- upvalues: v162 (ref)
                    v162.updateIsLoginInProgress(false);
                    if v162.isMounted then
                        if v264.errorCode ~= 0 then
                            v162:setState({
                                errorKey = false, 
                                localizedErrorMessage = v264.errorMessage
                            });
                            return;
                        else
                            v162:setState({
                                errorKey = "Authentication.Login.Response.SomethingWentWrong"
                            });
                        end;
                    end;
                end
            }, 
            onChallengeAbandoned = function() --[[ Line: 766 ]] --[[ Name: onChallengeAbandoned ]]
                -- upvalues: v162 (ref)
                v162.updateIsLoginInProgress(false);
            end, 
            onChallengeLoadFailed = function() --[[ Line: 769 ]] --[[ Name: onChallengeLoadFailed ]]
                -- upvalues: v162 (ref)
                v162.updateIsLoginInProgress(false);
                if v162.isMounted then
                    v162:setState({
                        errorKey = "Authentication.Login.Response.SomethingWentWrong"
                    });
                end;
            end, 
            forceWebViewVisible = true
        });
    end;
    v162.renderTwoStepChallenge = function(v265, v266) --[[ Line: 782 ]]
        -- upvalues: v162 (copy), v78 (ref), v79 (ref), v145 (ref), v70 (ref), v77 (ref), v85 (ref), l_GetFFlagEnable2SVRecovery_0 (ref), v82 (ref), v95 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v60 (ref), v93 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v67 (ref), v68 (ref), v112 (ref), v100 (ref), l_HttpService_0 (ref), l_TwoStepErrorCodes_0 (ref), l_getTwoStepLoginErrorKey_0 (ref), l_AccountLinkingAlertType_0 (ref)
        local l_launchApp_0 = v162.props.launchApp;
        local l_networking_3 = v162.props.networking;
        local l_appPolicy_0 = v162.props.appPolicy;
        local l_analytics_0 = v162.props.analytics;
        local l_omniRecommendationsRequest_0 = v162.props.omniRecommendationsRequest;
        local l_ticket_0 = v265.twoStepVerificationData.ticket;
        local l_id_0 = v265.user.id;
        local l_handleLoginCompletionWithAccountSwitching_0 = v162.props.handleLoginCompletionWithAccountSwitching;
        local l_clearApp_0 = v162.props.clearApp;
        if v78() then
            wait(v79());
        end;
        if v145 then
            v162.props.authAnalytics.reportAuthPageload(v70.Context.TwoStepLoginChallengeRenderInitiated, l_ticket_0);
        end;
        v162.props.renderChallenge({
            challengeType = v77.TwoStepVerification, 
            challengeParameters = {
                actionType = v85.Login, 
                challengeId = l_ticket_0, 
                userId = l_id_0, 
                allowRememberDevice = true, 
                clientSupports2svRecovery = l_GetFFlagEnable2SVRecovery_0() and true or false, 
                onChallengeCompleted = function(v276) --[[ Line: 812 ]] --[[ Name: onChallengeCompleted ]]
                    -- upvalues: v145 (ref), v162 (ref), v70 (ref), l_ticket_0 (copy), v82 (ref), l_networking_3 (copy), l_id_0 (copy), v95 (ref), v266 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v60 (ref), v93 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v67 (ref), v68 (ref), v112 (ref), l_handleLoginCompletionWithAccountSwitching_0 (copy), l_omniRecommendationsRequest_0 (copy), l_analytics_0 (copy), l_appPolicy_0 (copy), l_clearApp_0 (copy), l_launchApp_0 (copy), v100 (ref), l_HttpService_0 (ref), l_TwoStepErrorCodes_0 (ref), l_getTwoStepLoginErrorKey_0 (ref), l_AccountLinkingAlertType_0 (ref)
                    if v145 then
                        v162.props.authAnalytics.reportAuthPageload(v70.Context.TwoStepLoginChallengeCompleted, l_ticket_0);
                    end;
                    v82.login(l_networking_3, l_id_0, l_ticket_0, v276.verificationToken, v276.rememberDevice):andThen(function(v277) --[[ Line: 820 ]]
                        -- upvalues: v95 (ref), v266 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v60 (ref), v93 (ref), v162 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v67 (ref), v68 (ref), v112 (ref), l_handleLoginCompletionWithAccountSwitching_0 (ref), l_networking_3 (ref), l_omniRecommendationsRequest_0 (ref), l_analytics_0 (ref), l_appPolicy_0 (ref), l_clearApp_0 (ref), l_launchApp_0 (ref)
                        if v95() and v266 then
                            if not l_FFlagDisableMemStorageServicePasswordEvent_0 then
                                l_MemStorageService_0:Fire(v60.AuthenticatedCredentials, v266);
                            end;
                            if v93() and v162.state.isCredentialsProtocolRegisterPasswordAvailable then
                                if l_FFlagPasswordManagerAwaitEnabled_0 then
                                    v162.credentialsProtocolRegisterPassword(v266):await();
                                else
                                    v162.credentialsProtocolRegisterPassword(v266);
                                end;
                            end;
                        end;
                        v67(v68.Success, 1);
                        if v112 then
                            l_handleLoginCompletionWithAccountSwitching_0(l_networking_3, l_omniRecommendationsRequest_0, l_analytics_0, l_appPolicy_0, v277.responseBody.accountBlob, l_clearApp_0, l_launchApp_0);
                            return;
                        else
                            l_launchApp_0(l_networking_3, l_omniRecommendationsRequest_0, l_analytics_0, l_appPolicy_0);
                            return;
                        end;
                    end, function(v278) --[[ Line: 856 ]]
                        -- upvalues: l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), v95 (ref), v266 (ref), l_MemStorageService_0 (ref), v60 (ref), v67 (ref), v68 (ref), v100 (ref), l_HttpService_0 (ref), l_TwoStepErrorCodes_0 (ref), l_getTwoStepLoginErrorKey_0 (ref), v162 (ref), l_AccountLinkingAlertType_0 (ref)
                        if not l_FFlagDisableMemStorageServicePasswordEvent_0 and not v95() and v266 then
                            l_MemStorageService_0:Fire(v60.AuthenticatedCredentials, v266);
                        end;
                        v67(v68.Failure, 1);
                        local v279 = "Authentication.Login.Response.SomethingWentWrong";
                        if v100 then
                            local _, l_result_0 = pcall(function() --[[ Line: 871 ]]
                                -- upvalues: l_HttpService_0 (ref), v278 (copy)
                                return l_HttpService_0:JSONDecode(v278.Body).errors[1].code;
                            end);
                            if l_result_0 == l_TwoStepErrorCodes_0.IllegalChildAccountLinking then
                                v67(v68.FailureTwoStepVerification, 1);
                            else
                                v67(v68.FailureUnknownError, 1);
                            end;
                            v279 = l_getTwoStepLoginErrorKey_0(l_result_0);
                        else
                            v67(v68.FailureUnknownError, 1);
                        end;
                        v162.updateIsLoginInProgress(false);
                        if v162.isMounted then
                            v162:setState({
                                errorKey = v279
                            });
                        end;
                        if v278 and v278.Body then
                            local v282 = l_HttpService_0:JSONDecode(v278.Body);
                            local v283 = v282 and v282.errors and v282.errors[1] and v282.errors[1].code;
                            local v284 = v282 and v282.errors and v282.errors[1] and v282.errors[1].userFacingMessage;
                            if v283 == l_TwoStepErrorCodes_0.AccountLinkingRequired then
                                v162.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.IncompatibleAccounts, v284);
                            end;
                            if v283 == l_TwoStepErrorCodes_0.AccountLinkingFailed then
                                v162.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.RetryLogInConnectionFailure);
                            end;
                        end;
                    end);
                end, 
                onChallengeInvalidated = function(v285) --[[ Line: 914 ]] --[[ Name: onChallengeInvalidated ]]
                    -- upvalues: v145 (ref), v162 (ref), v70 (ref), l_ticket_0 (copy)
                    if v145 then
                        v162.props.authAnalytics.reportAuthPageload(v70.Context.TwoStepLoginChallengeInvalidated, l_ticket_0);
                    end;
                    v162.updateIsLoginInProgress(false);
                    if v162.isMounted then
                        if v285.errorCode ~= 0 then
                            v162:setState({
                                errorKey = false, 
                                localizedErrorMessage = v285.errorMessage
                            });
                            return;
                        else
                            v162:setState({
                                errorKey = "Authentication.Login.Response.SomethingWentWrong"
                            });
                        end;
                    end;
                end
            }, 
            onChallengeAbandoned = function() --[[ Line: 938 ]] --[[ Name: onChallengeAbandoned ]]
                -- upvalues: v145 (ref), v162 (ref), v70 (ref), l_ticket_0 (copy)
                if v145 then
                    v162.props.authAnalytics.reportAuthPageload(v70.Context.TwoStepLoginChallengeAbandoned, l_ticket_0);
                end;
                v162.updateIsLoginInProgress(false);
            end, 
            onChallengeLoadFailed = function() --[[ Line: 947 ]] --[[ Name: onChallengeLoadFailed ]]
                -- upvalues: v145 (ref), v162 (ref), v70 (ref), l_ticket_0 (copy)
                if v145 then
                    v162.props.authAnalytics.reportAuthPageload(v70.Context.TwoStepLoginChallengeLoadFailed, l_ticket_0);
                end;
                v162.updateIsLoginInProgress(false);
                if v162.isMounted then
                    v162:setState({
                        errorKey = "Authentication.Login.Response.SomethingWentWrong"
                    });
                end;
            end, 
            forceWebViewVisible = true
        });
    end;
    v162.handleMultipleUsersPerCredentialError = function(v286) --[[ Line: 967 ]]
        -- upvalues: v162 (copy), v70 (ref), l_isStringEmail_0 (ref), l_isStringPhone_0 (ref), v115 (ref), v92 (ref), v91 (ref)
        local v287 = "";
        if v162.state.isLoginByOtp then
            v287 = v70.Context.DisambiguationOTP;
        elseif l_isStringEmail_0(v162.props.cvalue) then
            v287 = v70.Context.DisambiguationEmail;
        elseif l_isStringPhone_0(v162.props.cvalue) then
            v287 = v70.Context.DisambiguationPhone;
        end;
        local v289 = {
            origin = v70.Context.Login, 
            context = v287, 
            users = v286, 
            onAccountSelection = function(v288) --[[ Line: 981 ]] --[[ Name: onAccountSelection ]]
                -- upvalues: v162 (ref), v115 (ref)
                if v162.state.isLoginByOtp then
                    if v115 then
                        v162.handleLoginWithOtp(nil, v288):await();
                        return;
                    else
                        v162.handleLoginWithOtp(nil, v288);
                        return;
                    end;
                elseif v115 then
                    v162.handleLoginWithFormData(nil, nil, v288):await();
                    return;
                else
                    v162.handleLoginWithFormData(nil, nil, v288);
                    return;
                end;
            end, 
            onAccountSelectionAbandoned = function() --[[ Line: 996 ]] --[[ Name: onAccountSelectionAbandoned ]]
                -- upvalues: v162 (ref)
                v162.updateIsLoginInProgress(false);
                v162.state.otpSessionToken = "";
                v162.state.otpCode = "";
                v162.state.isLoginByOtp = false;
                v162.props.closeCentralOverlay();
            end, 
            titleTextKey = "Authentication.Login.Label.AccountSelectorTitle", 
            helpTextKey = "Authentication.Login.Description.AccountSelectorHelp", 
            screenSize = v162.props.screenSize
        };
        if v92() and v91() then
            v162.props.closeCentralOverlay();
        end;
        v162.props.openAccountSelector(v289);
    end;
    v162.performKeystoreOperations = function(v290, v291) --[[ Line: 1015 ]]
        -- upvalues: v127 (ref), v135 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v162 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v110 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref)
        return v127.new(function(v292, v293) --[[ Line: 1019 ]]
            -- upvalues: v135 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v291 (ref), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v162 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v290 (copy), v110 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), v127 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref)
            if (v135 or l_GetFFlagKeystoreAutoLoginAvailable_0()) == false or v291 == nil then
                v292();
                return;
            else
                local v294 = l_GetFFlagRemoveKeystoreIxpLogic_0() and true or v162.props.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                local v295 = l_HttpService_0:JSONEncode({
                    server = l_ContentProvider_0.BaseUrl
                });
                v291 = l_HttpService_0:JSONDecode(v291);
                l_GetUserByUsername_0(v290, v291.cvalue)():andThen(function(v296) --[[ Line: 1041 ]]
                    -- upvalues: v293 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v110 (ref), v295 (copy), l_default_0 (ref), l_KeystoreConstants_0 (ref)
                    if not v296 or not v296.id then
                        return v293("Invalid usernameInfo");
                    elseif l_GetFFlagKeystoreAutoLoginAvailable_0() then
                        return v110(v295):andThen(function() --[[ Line: 1047 ]]
                            -- upvalues: v296 (copy)
                            return v296;
                        end);
                    else
                        return l_default_0:deleteAllCredentialsFromiOSKeychain(l_default_0.CredentialsTypes.iosKeychainPassword, v295, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 1055 ]]
                            -- upvalues: v296 (copy)
                            return v296;
                        end);
                    end;
                end):andThen(function(v297) --[[ Line: 1060 ]]
                    -- upvalues: l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v291 (ref), v294 (copy), l_KeystoreConstants_0 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_default_0 (ref), v127 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref)
                    local v298 = nil;
                    if l_GetFFlagRemoveKeystoreIxpLogic_0() then
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentials, (tostring(v297.id)));
                        v298 = l_HttpService_0:JSONEncode({
                            server = tostring(l_ContentProvider_0.BaseUrl), 
                            username = tostring(v291.cvalue), 
                            userId = tostring(v297.id), 
                            password = tostring(v291.password)
                        });
                    else
                        local v299 = nil;
                        if v294 == true then
                            v299 = l_KeystoreConstants_0.Experiment;
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v297.id)));
                        else
                            v299 = l_KeystoreConstants_0.Control;
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v297.id)));
                        end;
                        v298 = l_HttpService_0:JSONEncode({
                            server = tostring(l_ContentProvider_0.BaseUrl), 
                            username = tostring(v291.cvalue), 
                            userId = tostring(v297.id), 
                            password = tostring(v291.password), 
                            experimentGroup = tostring(v299)
                        });
                    end;
                    if l_GetFFlagKeystoreAutoLoginAvailable_0() then
                        local v301 = l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v300) --[[ Line: 1104 ]]
                            -- upvalues: l_default_0 (ref), v298 (ref), l_KeystoreConstants_0 (ref), v127 (ref)
                            if v300 and v300.keystore and v300.keystore.isAvailable then
                                return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v298, l_KeystoreConstants_0.KeystoreTimeout);
                            else
                                return v127.resolve(nil);
                            end;
                        end);
                        if l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                            return v301;
                        else
                            return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v298, l_KeystoreConstants_0.KeystoreTimeout);
                        end;
                    else
                        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.iosKeychainPassword, v298, l_KeystoreConstants_0.KeystoreTimeout);
                    end;
                end):andThen(function(_) --[[ Line: 1136 ]]
                    -- upvalues: v292 (copy)
                    v292();
                end):catch(function(v303) --[[ Line: 1139 ]]
                    -- upvalues: v293 (copy)
                    v293(v303);
                end);
                return;
            end;
        end);
    end;
    v162.handleLoginResult = function(v304, v305) --[[ Line: 1145 ]]
        -- upvalues: v162 (copy), v31 (ref), v67 (ref), v68 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v60 (ref), v93 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v112 (ref), v155 (ref), v87 (ref)
        v162.props.setBackNavigationDisabled(false);
        local l_setLoginResult_0 = v162.props.setLoginResult;
        local l_launchApp_1 = v162.props.launchApp;
        local l_networking_4 = v162.props.networking;
        local l_appPolicy_1 = v162.props.appPolicy;
        local l_analytics_1 = v162.props.analytics;
        local l_omniRecommendationsRequest_1 = v162.props.omniRecommendationsRequest;
        if v162.passwordRef.current then
            v162.passwordRef.current.Text = "";
        end;
        local l_clearApp_1 = v162.props.clearApp;
        local l_handleLoginCompletionWithAccountSwitching_1 = v162.props.handleLoginCompletionWithAccountSwitching;
        v162.performKeystoreOperations(l_networking_4, v305):finally(function() --[[ Line: 1163 ]]
            -- upvalues: v31 (ref), v304 (copy), l_setLoginResult_0 (copy), v67 (ref), v68 (ref), v162 (ref), v305 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v60 (ref), v93 (ref), l_FFlagPasswordManagerAwaitEnabled_0 (ref), v112 (ref), l_handleLoginCompletionWithAccountSwitching_1 (copy), l_networking_4 (copy), l_omniRecommendationsRequest_1 (copy), l_analytics_1 (copy), l_appPolicy_1 (copy), l_clearApp_1 (copy), l_launchApp_1 (copy), v155 (ref), v87 (ref)
            if v31.hasTwoStepData(v304) then
                l_setLoginResult_0(v304);
                v67(v68.FailureTwoStepVerification, 1);
                spawn(function() --[[ Line: 1170 ]]
                    -- upvalues: v162 (ref), v304 (ref), v305 (ref)
                    v162.renderTwoStepChallenge(v304, v305);
                end);
            else
                if v305 then
                    if not l_FFlagDisableMemStorageServicePasswordEvent_0 then
                        l_MemStorageService_0:Fire(v60.AuthenticatedCredentials, v305);
                    end;
                    if v93() and v162.state.isCredentialsProtocolRegisterPasswordAvailable then
                        if l_FFlagPasswordManagerAwaitEnabled_0 then
                            v162.credentialsProtocolRegisterPassword(v305):await();
                        else
                            v162.credentialsProtocolRegisterPassword(v305);
                        end;
                    end;
                end;
                v67(v68.Success, 1);
                if v112 then
                    l_handleLoginCompletionWithAccountSwitching_1(l_networking_4, l_omniRecommendationsRequest_1, l_analytics_1, l_appPolicy_1, v304.accountBlob, l_clearApp_1, l_launchApp_1);
                else
                    l_launchApp_1(l_networking_4, l_omniRecommendationsRequest_1, l_analytics_1, l_appPolicy_1);
                    v155.ClearThemeOverride();
                end;
            end;
            if v87() then
                v162.props.closeCentralOverlay();
            end;
        end);
    end;
    v162.credentialsProtocolRegisterPassword = function(v314) --[[ Line: 1218 ]]
        -- upvalues: l_HttpService_0 (ref), l_default_0 (ref), l_Constants_0 (ref), v116 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), v162 (copy), v70 (ref), l_Logger_0 (ref)
        v314 = l_HttpService_0:JSONDecode(v314);
        if v314.cvalue == nil or v314.password == nil then
            return;
        else
            local v315 = {
                username = v314.cvalue, 
                password = v314.password
            };
            local v316 = l_HttpService_0:JSONEncode(v315);
            return l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v316, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v317) --[[ Line: 1235 ]]
                -- upvalues: v116 (ref), l_HttpService_0 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), v162 (ref), v70 (ref), l_Logger_0 (ref)
                if v116 and v317 then
                    local v318 = l_HttpService_0:JSONDecode(v317);
                    if v318.errorCode == nil then
                        if l_FFlagEnablePWManagerLoginCheck_0 and v162.passwordManagerUsageStore then
                            v162.passwordManagerUsageStore.setSavedPasswordAfterLogin(true);
                        end;
                        v162.props.authAnalytics.reportAuthButtonClick(v70.Context.CMPasswordLogin, v70.Button.SavePassword);
                        l_Logger_0:info("Successfully registered password.");
                        return;
                    else
                        l_Logger_0:warning("Error registering password: " .. tostring(v318.errorMsg));
                        return;
                    end;
                elseif v317.errorCode == nil then
                    v162.props.authAnalytics.reportAuthButtonClick(v70.Context.CMPasswordLogin, v70.Button.SavePassword);
                    l_Logger_0:info("Successfully registered password.");
                    return;
                else
                    l_Logger_0:warning("Error registering password: " .. tostring(v317.errorMsg));
                    return;
                end;
            end, function(v319) --[[ Line: 1263 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Error registering password: " .. tostring(v319));
            end);
        end;
    end;
    v162.logoutAllLoggedInUsersCallback = function() --[[ Line: 1269 ]]
        -- upvalues: v162 (copy), v109 (ref), v124 (ref), v83 (ref), l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (ref), v31 (ref), v112 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_AccountSwitcherConstants_0 (ref), l_GuiService_0 (ref)
        local l_networking_5 = v162.props.networking;
        local v321 = v109.getAccountBlob();
        local v322 = v124.fromLocalStorage().userId ~= -1;
        v162:setState({
            errorKey = false, 
            loginButtonDisabled = true, 
            isLoginInProgress = false
        });
        v83(l_networking_5, v321):await();
        local v323 = false;
        if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 and v162.pendingLoginRetryCredentials then
            local l_pendingLoginRetryCredentials_0 = v162.pendingLoginRetryCredentials;
            v162.pendingLoginRetryCredentials = nil;
            if l_pendingLoginRetryCredentials_0.isPasswordLogin then
                local l_l_pendingLoginRetryCredentials_0_0 = l_pendingLoginRetryCredentials_0 --[[ copy: 4 -> 7 ]];
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 1289 ]]
                    -- upvalues: v162 (ref), l_networking_5 (copy), l_l_pendingLoginRetryCredentials_0_0 (copy)
                    return v162.props.login(l_networking_5, l_l_pendingLoginRetryCredentials_0_0.cvalue, l_l_pendingLoginRetryCredentials_0_0.password):expect();
                end);
                if l_status_1 and l_result_1 and not v31.hasTwoStepData(l_result_1) then
                    if v112 then
                        v162.props.handleLoginCompletionWithAccountSwitching(l_networking_5, v162.props.omniRecommendationsRequest, v162.props.analytics, v162.props.appPolicy, l_result_1.accountBlob, v162.props.clearApp, v162.props.launchApp);
                        return;
                    else
                        v162.props.launchApp(l_networking_5, v162.props.omniRecommendationsRequest, v162.props.analytics, v162.props.appPolicy);
                        return;
                    end;
                end;
            elseif type(l_pendingLoginRetryCredentials_0.cvalue) == "table" then
                v323 = true;
            end;
        end;
        if v322 == true then
            v162.props.resetAppState();
            l_AppStorageService_0:SetItem(l_LocalStorageKey_0.CredentialValue, "");
            l_AppStorageService_0:flush();
            if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 then
                local v328 = if v323 then l_AccountSwitcherConstants_0.AccountSwitcherPendingPasskeyLoginV1AfterLogoutAll else l_AccountSwitcherConstants_0.AccountSwitcherPendingLoginAfterLogoutAll;
                v109.setAccountSwitchStatus(v328);
                v109.flush();
            end;
            v162.props.logoutWithoutShowConfirmation(l_networking_5, l_GuiService_0);
        end;
        v162:setState({
            loginButtonDisabled = false
        });
        v162.props.closeCentralOverlay();
    end;
    v162.handleLoginError = function(v329, v330, v331) --[[ Line: 1341 ]]
        -- upvalues: l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (ref), v163 (ref), v162 (copy), v87 (ref), v57 (ref), v80 (ref), v67 (ref), v68 (ref), l_StatusCodes_0 (ref), v112 (ref), v109 (ref), v71 (ref), l_isStringEmail_0 (ref), v62 (ref), v128 (ref), v129 (ref), l_AccountLinkingAlertType_0 (ref)
        local v332 = false;
        if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 then
            v332 = v163;
            v163 = false;
        end;
        local v333 = if v332 then if type(v330) == "string" then v330 else "" else (if v162.cvalueRef and v162.cvalueRef.current then v162.cvalueRef.current.Text else "") or "";
        v162.props.setBackNavigationDisabled(false);
        local l_forceLoginByUsername_1 = v162.state.forceLoginByUsername;
        local v335 = v162.errorHandlingInfoList[v329.errorCode];
        if v335 then
            l_forceLoginByUsername_1 = v335.forceLoginByUsername or l_forceLoginByUsername_1;
        end;
        local v336 = false;
        local v337 = v87() and v329.errorCode == v57.MultipleUsersPerCredential and not v162.props.appPolicy.getAccountDisambiguationDisabled();
        local v338 = v162.props.appPolicy.getLinkedAuthEndpointsEnabled() and (v329.errorCode == v57.AccountLinkingRequired or v329.errorCode == v57.AccountLinkingFailed);
        local v339 = v80() and v329.errorCode == v57.SecurityQuestions;
        if v337 or v339 or v329.errorCode == v57.Captcha then
            v336 = true;
        end;
        v67(v68.Failure, 1);
        if v329.errorCode == v57.Captcha then
            v67(v68.FailureCaptcha, 1);
        elseif v329.errorCode == v57.IncorrectCValueOrPassword then
            v67(v68.FailureCredentials, 1);
        elseif v329.errorCode == v57.AccountLocked then
            v67(v68.FailurePasswordReset, 1);
        elseif v329.errorCode == v57.CTypeNotSupported then
            v67(v68.FailureBadRequest, 1);
        elseif v329.errorCode == v57.CValueAndPasswordRequired then
            v67(v68.FailureBadRequest, 1);
        elseif v339 then
            v67(v68.FailureSecurityQuestions, 1);
        elseif v329.errorCode == v57.MultipleUsersPerCredential then
            v67(v68.FailureMultipleUsersPerCredential, 1);
        elseif v329.HttpError == Enum.HttpError.OK and v329.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS then
            v67(v68.FailureThrottled, 1);
        elseif v329.HttpError == Enum.HttpError.OK and v329.StatusCode == l_StatusCodes_0.REQUEST_TIMEOUT then
            v67(v68.FailureTimeout, 1);
        elseif v329.HttpError == Enum.HttpError.OK and v329.StatusCode == l_StatusCodes_0.BAD_REQUEST then
            v67(v68.FailureBadRequest, 1);
        elseif v329.HttpError == Enum.HttpError.OK and v329.StatusCode == l_StatusCodes_0.NOT_FOUND then
            v67(v68.FailureNotFound, 1);
        elseif v329.HttpError == Enum.HttpError.OK and v329.StatusCode == l_StatusCodes_0.INTERNAL_SERVER_ERROR then
            v67(v68.FailureInternalServerError, 1);
        else
            v67(v68.FailureUnknownError, 1);
        end;
        if v112 == true and v329.errorCode == v57.EmptyAccountSwitchBlobRequired then
            v162:setState({
                errorKey = false
            });
            if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 then
                v162.pendingLoginRetryCredentials = {
                    cvalue = v330, 
                    password = v331, 
                    isPasswordLogin = v332
                };
                v109.setAccountSwitchTargetUsername(v333);
            end;
            v162.props.openAccountSwitchingErrorOverlay(v162.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts", v162.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.LogoutConfirmation", v162.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v162.logoutAllLoggedInUsersCallback, v162.props.closeCentralOverlay, v71.Auth.AccountSwitcherLoginEmptyBlobRequiredError, v330 or nil);
        end;
        if v112 == true and v329.errorCode == v57.ParentEmptyAccountSwitchBlobRequired then
            v162:setState({
                errorKey = false
            });
            if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 then
                v162.pendingLoginRetryCredentials = {
                    cvalue = v330, 
                    password = v331, 
                    isPasswordLogin = v332
                };
                v109.setAccountSwitchTargetUsername(v333);
            end;
            v162.props.openAccountSwitchingErrorOverlay(v162.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts", v162.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.ParentLogoutConfirmation", v162.props.showAccountSwitcherFoundationDesign and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts", "Authentication.CrossDevice.Action.CancelLogin", v162.logoutAllLoggedInUsersCallback, v162.props.closeCentralOverlay, v71.Auth.AccountSwitcherParentLoginEmptyBlobRequiredError, v330 or nil);
        end;
        if v329.errorCode == v57.AccountLocked then
            v162.props.openPasswordResetPrompt();
        end;
        if v329.errorCode == v57.AccountNotVerified and l_isStringEmail_0(v330) and v162.canVerifyCredentials(v62.Email, v330, v331) then
            v162.props.openEmailVerificationPrompt(v330, v331, v162.closeVerificationEmailModal);
        end;
        if v128() and v329.errorCode == v57.GlobalAppAccessDeniedVNG and v162.isMounted then
            v162.props.openNewAppAvailableModal(function() --[[ Line: 1487 ]]
                -- upvalues: v129 (ref), v162 (ref)
                local v340 = v129();
                v162.props.linking:openURL(v340);
            end);
        end;
        if v80() and v329.errorCode == v57.SecurityQuestions and v329.securityQuestionsData and v329.securityQuestionsCallback then
            task.spawn(function() --[[ Line: 1496 ]]
                -- upvalues: v162 (ref), v330 (copy), v331 (copy), v329 (copy)
                if v162.isMounted then
                    v162.renderSecurityQuestions(v330, v331, v329.securityQuestionsCallback, v329.securityQuestionsData);
                end;
            end);
        end;
        if v337 then
            if v329.usersData then
                v162.handleMultipleUsersPerCredentialError(v329.usersData);
            end;
        elseif v329.errorCode == v57.MultipleUsersPerCredential then
            v329.errorKey = "Authentication.Login.Response.MoreThanOneUsername";
        end;
        if v329.errorCode == v57.PlatformNotSupported then
            v329.errorKey = "Authentication.Login.Error.PlatformAccountConnectionFailure";
        end;
        if v338 then
            if v329.errorCode == v57.AccountLinkingRequired then
                v162.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.IncompatibleAccounts, v329.userFacingMessage);
            elseif v329.errorCode == v57.AccountLinkingFailed then
                v162.props.showAccountLinkingAlert(l_AccountLinkingAlertType_0.RetryLogInConnectionFailure);
            end;
        end;
        spawn(function() --[[ Line: 1529 ]]
            -- upvalues: v162 (ref), v329 (copy), l_forceLoginByUsername_1 (ref)
            if v162.isMounted then
                v162:setState({
                    errorKey = v329.errorKey, 
                    errorCode = v329.errorCode, 
                    forceLoginByUsername = l_forceLoginByUsername_1
                });
            end;
        end);
        v162.updateIsLoginInProgress(v336);
    end;
    v162.onLoginButtonActivated = function() --[[ Line: 1542 ]]
        -- upvalues: v162 (copy), v70 (ref)
        if v162.state.loginButtonDisabled then
            return;
        elseif v162.state.isLoginInProgress then
            return;
        else
            v162.updateIsLoginInProgress(true);
            v162.props.authAnalytics.reportLogInButtonClicked(v70.Context.LoginScreen);
            v162.handleLoginWithFormData();
            return;
        end;
    end;
    v162.onForgetButtonActivated = function() --[[ Line: 1556 ]]
        -- upvalues: v162 (copy), v70 (ref), l_GetFFlagEnableLuafiedRecoveryFlow_0 (ref), l_enrolledInLuafiedRecoveryExperiment_0 (ref), v26 (ref), l_ContentProvider_0 (ref), v56 (ref)
        if v162.state.isLoginInProgress then
            return;
        else
            v162.unfocusTextBoxes();
            v162.props.authAnalytics.reportAuthButtonClick(v70.Context.LoginForm, v70.Button.ForgotPassword);
            v162.props.authAnalytics.reportForgotPasswordButtonClicked(v70.Context.LoginScreen);
            if l_GetFFlagEnableLuafiedRecoveryFlow_0() and l_enrolledInLuafiedRecoveryExperiment_0() then
                v162.props.navigateToPage({
                    name = v26.AccountRecovery, 
                    extraProps = {
                        identifier = v162.cvalueRef and v162.cvalueRef.current and v162.cvalueRef.current.Text or v162.cvalueText and v162.cvalueText:getValue() or "", 
                        recoverPassword = true
                    }
                });
                return;
            elseif v162.props.appPolicy.shouldUseExternalBrowserForDisclaimerLinks() then
                v162.props.linking:openURL(l_ContentProvider_0.BaseUrl .. "login/forgot-password-or-username");
                return;
            else
                v162.props.navigateToPage({
                    name = v26.GenericWebPage, 
                    detail = l_ContentProvider_0.BaseUrl .. "login/forgot-password-or-username", 
                    extraProps = {
                        title = "", 
                        transitionAnimation = v56.SlideInFromRight
                    }
                });
                return;
            end;
        end;
    end;
    v162.onCrossDeviceLoginActivated = function() --[[ Line: 1594 ]]
        -- upvalues: v162 (copy), v70 (ref), v96 (ref), l_RbxAnalyticsService_0 (ref)
        if v162.state.isLoginInProgress then
            return;
        else
            v162.unfocusTextBoxes();
            v162.props.authAnalytics.reportAuthButtonClick(v70.Context.LoginForm, v70.Button.QuickLogin);
            v162.props.authAnalytics.reportButtonClicked(v70.Context.Login, v70.Button.LoginOtherDevice);
            if v162.props.appPolicy.getShowVNGLoginWithExistingAccountQuickLoginButton() then
                if v96() then
                    l_RbxAnalyticsService_0:ReportCounter("CrossAppLoginAttempt", 1);
                end;
                v162.props.openCrossAppLoginPrompt(v162.handleLoginWithCode);
                return;
            else
                v162.props.openCrossDeviceLoginPrompt(v162.handleLoginWithCode);
                return;
            end;
        end;
    end;
    v162.topButtonActivatedTracking = function() --[[ Line: 1619 ]]
        -- upvalues: v112 (ref), v162 (copy), v70 (ref)
        if v112 == true and v162.isAlreadyAuthenticated == true then
            resetDefaultTheme();
        end;
        v162.props.authAnalytics.reportDismissCornerXButtonClicked(v70.Context.LoginScreen);
    end;
    v162.onEmailOtpLoginAbandoned = function() --[[ Line: 1626 ]]
        -- upvalues: v162 (copy)
        v162.state.isLoginByOtp = false;
    end;
    v162.onEmailOtpLoginCompleted = function(v341, v342) --[[ Line: 1630 ]]
        -- upvalues: v162 (copy)
        v162.state.otpSessionToken = v341;
        v162.state.otpCode = v342;
        return v162.handleLoginWithOtp(nil, nil);
    end;
    v162.onEmailOtpLoginActivated = function() --[[ Line: 1636 ]]
        -- upvalues: v162 (copy), v70 (ref)
        if v162.state.isLoginInProgress then
            return;
        else
            v162.unfocusTextBoxes();
            local v343 = {
                origin = "login", 
                codeLength = 6, 
                enterEmailTitleKey = "Authentication.Login.Label.GetOneTimeCode", 
                enterEmailDescriptionKey = "Authentication.Login.Description.GetOneTimeCodeHelp", 
                enterCodeTitleKey = "Authentication.Login.Label.EnterOneTimeCode", 
                enterCodeDescriptionKey = "Authentication.Login.Description.EnterOneTimeCodeHelpV2", 
                onSubmitCode = v162.onEmailOtpLoginCompleted, 
                onModalAbandoned = v162.onEmailOtpLoginAbandoned, 
                screenSize = v162.props.screenSize
            };
            v162.props.openEmailOtp(v343);
            v162.state.isLoginByOtp = true;
            v162.props.authAnalytics.reportAuthButtonClick(v70.Context.LoginForm, v70.Button.EmailOtp);
            v162.props.authAnalytics.reportButtonClicked(v70.Context.Login, v70.Button.OneTimePasscode);
            return;
        end;
    end;
    v162.closeVerificationEmailModal = function(v344) --[[ Line: 1664 ]]
        -- upvalues: v162 (copy)
        if v162.isMounted then
            v162.updateCValueText(v344);
            if v344 ~= "" and v162.passwordRef.current then
                v162.passwordRef.current:CaptureFocus();
            end;
            v162:setState({
                errorCode = -1, 
                errorKey = "", 
                forceLoginByUsername = false
            });
        end;
    end;
    v162.events = {};
    v162.props.authAnalytics.reportScreenLoaded(v70.Context.LoginScreen);
end;
v159.didMount = function(v345) --[[ Line: 1682 ]] --[[ Name: didMount ]]
    -- upvalues: v70 (copy), v94 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), l_PreAuthDeepLinkUrlStore_0 (copy), l_LinkingProtocol_0 (copy), v112 (copy), l_MemStorageService_0 (copy), v60 (copy), v155 (copy), v131 (copy), v135 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy), v144 (copy), l_UiMode_0 (copy), l_UserInputService_0 (copy), v130 (copy), l_GuiService_0 (copy), v26 (copy), l_HttpService_0 (copy), l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0 (copy), v47 (copy), v93 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 (copy), l_Logger_0 (copy), l_LocalizationService_0 (copy), l_TelemetryConfigs_0 (copy)
    v345.isMounted = true;
    v345.props.authAnalytics.reportAuthPageload(v70.Context.LoginForm);
    if v94() then
        local v346 = if l_FFlagEnableAuthDeepLinkReceiver_0 then l_PreAuthDeepLinkUrlStore_0.getUrl() else l_LinkingProtocol_0:getLastLuaURL();
        v345.props.authAnalytics.reportAuthPageload(v70.Context.LoginScreen, v346);
    end;
    if v112 == true and v345.isAlreadyAuthenticated == true then
        l_MemStorageService_0:Fire(v60.ThemeUpdate, "dark");
    end;
    v155.SetDarkThemeOverride();
    if v131 and v345.props.appPolicy.getLoginUsernameOnly() then
        v345:setState({
            forceLoginByUsername = true
        });
    end;
    if v135 or l_GetFFlagKeystoreAutoLoginAvailable_0() then
        if v345.props.usernameFromIosKeychain then
            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.autoPopulatedUsername);
            v345.updateCValueText(v345.props.usernameFromIosKeychain);
        end;
        if v345.props.passwordFromIosKeychain then
            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.autoPopulatedPassword);
            v345.updatePasswordText(v345.props.passwordFromIosKeychain);
        end;
        if v144 then
            v345:setState({
                loginButtonDisabled = not (v345.props.usernameFromIosKeychain and v345.props.passwordFromIosKeychain)
            });
        else
            v345:setState({
                loginButtonDisabled = false
            });
        end;
    end;
    local function v352(v347, v348) --[[ Line: 1735 ]] --[[ Name: isWithinBounds ]]
        -- upvalues: v345 (copy), l_UiMode_0 (ref)
        if v345.props.uiModeInfo.uiMode == l_UiMode_0.VR then
            error("Input position is not supported in VR");
        end;
        local l_AbsolutePosition_0 = v348.AbsolutePosition;
        local l_AbsoluteSize_0 = v348.AbsoluteSize;
        local v351 = false;
        if v347.X > l_AbsolutePosition_0.X then
            v351 = false;
            if v347.X < l_AbsolutePosition_0.X + l_AbsoluteSize_0.X then
                v351 = false;
                if v347.Y > l_AbsolutePosition_0.Y then
                    v351 = v347.Y < l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y;
                end;
            end;
        end;
        return v351;
    end;
    local function v354(v353) --[[ Line: 1748 ]] --[[ Name: getNextSelectedObject ]]
        -- upvalues: l_UserInputService_0 (ref), v130 (ref), v345 (copy)
        if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
            if v130 then
                return v345.focusRef and v345.focusRef.current and v345.focusRef.current.NextSelectionUp;
            else
                return v353.NextSelectionUp;
            end;
        elseif v130 then
            return v345.focusRef and v345.focusRef.current and v345.focusRef.current.NextSelectionDown;
        else
            return v353.NextSelectionDown;
        end;
    end;
    local function v356() --[[ Line: 1766 ]] --[[ Name: getNewSelectedObject ]]
        -- upvalues: v130 (ref), v345 (copy), l_GuiService_0 (ref), v354 (copy)
        local v355 = if v130 then v345.focusRef and v345.focusRef.current else l_GuiService_0.SelectedObject;
        v355 = v354(v355);
        if v355 == v345.loginButtonRef.current and v345.state.loginButtonDisabled then
            v355 = v354(v355);
        end;
        if v345.isMounted then
            v345:setState({
                forgotLinkFocused = v355 == v345.forgotLinkRef.current
            });
        end;
        return v355;
    end;
    table.insert(v345.events, l_UserInputService_0.InputBegan:connect(function(v357, _) --[[ Line: 1787 ]]
        -- upvalues: v345 (copy), v26 (ref), v130 (ref), l_GuiService_0 (ref), v356 (copy)
        if v345.props.currentPageName ~= v26.Login then
            return;
        else
            if v357.UserInputType == Enum.UserInputType.Keyboard then
                if v357.KeyCode == Enum.KeyCode.Return then
                    if v345.state.forgotLinkFocused then
                        v345.onForgetButtonActivated();
                        return;
                    else
                        v345.onLoginButtonActivated();
                        return;
                    end;
                elseif v357.KeyCode == Enum.KeyCode.Tab then
                    local v359 = if v130 then v345.focusRef and v345.focusRef.current else l_GuiService_0.SelectedObject;
                    if not v359 then
                        return;
                    else
                        local v360 = v356();
                        if not v360 then
                            return;
                        else
                            if v359:IsA("TextBox") and v359.ManualFocusRelease then
                                v359:ReleaseFocus();
                            end;
                            if v130 then
                                v345.focusRef.current = v360;
                            else
                                l_GuiService_0.SelectedObject = v360;
                            end;
                            if v360:IsA("TextBox") then
                                v360:CaptureFocus();
                            end;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end));
    table.insert(v345.events, l_UserInputService_0.InputEnded:connect(function(v361, _) --[[ Line: 1832 ]]
        -- upvalues: v345 (copy), v26 (ref), l_UiMode_0 (ref), l_UserInputService_0 (ref), v352 (copy)
        if v345.props.currentPageName ~= v26.Login then
            return;
        elseif v345.props.uiModeInfo.uiMode == l_UiMode_0.VR then
            return;
        else
            if v361.UserInputType == Enum.UserInputType.MouseButton1 or v361.UserInputType == Enum.UserInputType.Touch then
                local l_Position_0 = v361.Position;
                local l_l_UserInputService_0_FocusedTextBox_1 = l_UserInputService_0:GetFocusedTextBox();
                if not v345.cvalueRef.current or not v345.passwordRef.current then
                    return;
                elseif not l_l_UserInputService_0_FocusedTextBox_1 then
                    return;
                else
                    local v365 = v352(l_Position_0, v345.cvalueRef.current);
                    local v366 = v352(l_Position_0, v345.passwordRef.current);
                    if l_l_UserInputService_0_FocusedTextBox_1 == v345.cvalueRef.current and v366 then
                        v345.cvalueRef.current:ReleaseFocus();
                        v345.passwordRef.current:CaptureFocus();
                        return;
                    elseif l_l_UserInputService_0_FocusedTextBox_1 == v345.passwordRef.current and v365 then
                        v345.passwordRef.current:ReleaseFocus();
                        v345.cvalueRef.current:CaptureFocus();
                        return;
                    elseif not v365 and not v366 and (l_l_UserInputService_0_FocusedTextBox_1 == v345.cvalueRef.current or l_l_UserInputService_0_FocusedTextBox_1 == v345.passwordRef.current) then
                        l_l_UserInputService_0_FocusedTextBox_1:ReleaseFocus();
                    end;
                end;
            end;
            return;
        end;
    end));
    table.insert(v345.events, l_UserInputService_0.TextBoxFocused:connect(function(v367) --[[ Line: 1874 ]]
        -- upvalues: v345 (copy), v26 (ref), v130 (ref), l_GuiService_0 (ref)
        if v345.props.currentPageName ~= v26.Login then
            return;
        elseif v345.state.isLoginInProgress then
            v367:ReleaseFocus();
            return;
        elseif v130 then
            v345.focusRef.current = v367;
            return;
        else
            l_GuiService_0.SelectedObject = v367;
            return;
        end;
    end));
    table.insert(v345.events, l_UserInputService_0.TextBoxFocusReleased:connect(function(_) --[[ Line: 1893 ]]
        -- upvalues: v345 (copy), v26 (ref), v130 (ref), l_GuiService_0 (ref)
        if v345.props.currentPageName ~= v26.Login then
            return;
        elseif v130 then
            v345.focusRef.current = nil;
            return;
        else
            l_GuiService_0.SelectedObject = nil;
            return;
        end;
    end));
    table.insert(v345.events, l_MemStorageService_0:bind(v60.AutoFillCredentials, function(v369) --[[ Line: 1908 ]]
        -- upvalues: v345 (copy), v26 (ref), l_HttpService_0 (ref)
        if v345.props.currentPageName ~= v26.Login then
            return;
        elseif v345.state.isLoginInProgress then
            return;
        else
            local v370 = l_HttpService_0:JSONDecode(v369);
            if v370 then
                v345.updateCValueText(v370.cvalue);
                v345.updatePasswordText(v370.password);
            end;
            return;
        end;
    end));
    if l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0() then
        v47(v345.props.networking, "PlayerApp.Login", {
            "isDesktopDualLoginEnabled"
        }):andThen(function(v371) --[[ Line: 1925 ]]
            -- upvalues: v345 (copy)
            local v372 = v371 and v371.responseBody;
            if v372 and v345.isMounted then
                local l_isDesktopDualLoginEnabled_0 = v372.isDesktopDualLoginEnabled;
                if l_isDesktopDualLoginEnabled_0 then
                    v345:setState({
                        isDesktopDualLoginEnabled = l_isDesktopDualLoginEnabled_0
                    });
                end;
            end;
        end, function() --[[ Line: 1936 ]]

        end);
    end;
    if v93() then
        local v374 = false;
        local v375 = false;
        local v376 = false;
        do
            local l_v374_0, l_v375_0, l_v376_0 = v374, v375, v376;
            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v380) --[[ Line: 1949 ]]
                -- upvalues: l_v374_0 (ref), l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 (ref), l_v375_0 (ref), l_v376_0 (ref), v345 (copy)
                if v380.FIDO2 ~= nil then
                    l_v374_0 = v380.FIDO2.isAvailable and v380.FIDO2.supportsDeviceBoundOnly;
                    if l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 then
                        l_v375_0 = v380.password and v380.password.isAvailable;
                        l_v376_0 = v380.password ~= nil;
                    else
                        l_v375_0 = v380.password.isAvailable;
                        l_v376_0 = true;
                    end;
                    if v345.isMounted then
                        v345:setState({
                            isCredentialsProtocolRegisterPasswordAvailable = l_v375_0
                        });
                    end;
                else
                    l_v374_0 = v380.isAvailable and v380.supportsDeviceBoundOnly;
                end;
                if l_v376_0 then
                    v345.showGenericCredentialLoginPopup(l_v374_0, l_v375_0);
                    return;
                else
                    if l_v374_0 then
                        v345.showPasskeyLoginPopup();
                    end;
                    return;
                end;
            end):catch(function(v381) --[[ Line: 1980 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Error checking for available credential types. Error: {}", v381);
            end):finally(function() --[[ Line: 1983 ]]
                -- upvalues: v345 (copy), v70 (ref), l_v375_0 (ref), l_v374_0 (ref)
                v345.props.authAnalytics.reportAuthPageload(v70.Context.CMPasswordLogin, (tostring(l_v375_0)));
                v345.props.authAnalytics.reportAuthPageload(v70.Context.PasskeyLogin, if l_v374_0 ~= nil then tostring(l_v374_0) else "timeout");
            end);
        end;
    else
        local v382 = false;
        do
            local l_v382_0 = v382;
            l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v384) --[[ Line: 1997 ]]
                -- upvalues: l_v382_0 (ref), v345 (copy)
                l_v382_0 = v384.isAvailable and v384.supportsDeviceBoundOnly;
                if l_v382_0 then
                    v345.showPasskeyLoginPopup();
                end;
            end):catch(function(v385) --[[ Line: 2003 ]]
                warn("Error checking if FIDO2 passkeys is available. Error: ", v385);
            end):finally(function() --[[ Line: 2006 ]]
                -- upvalues: v345 (copy), v70 (ref), l_v382_0 (ref)
                v345.props.authAnalytics.reportAuthPageload(v70.Context.PasskeyLogin, if l_v382_0 ~= nil then tostring(l_v382_0) else "timeout");
            end);
        end;
    end;
    if game:GetFastFlag("EnablePlayerAppLoginPageExperiments") and l_LocalizationService_0.RobloxLocaleId:match("^en") then
        v47(v345.props.networking, "PlayerApp.Login", {
            "CrossDeviceButtonText"
        }):andThen(function(v386) --[[ Line: 2018 ]]
            -- upvalues: v345 (copy)
            local v387 = v386 and v386.responseBody;
            if v387 and v345.isMounted then
                local l_CrossDeviceButtonText_0 = v387.CrossDeviceButtonText;
                if l_CrossDeviceButtonText_0 then
                    v345:setState({
                        quickLoginButtonTextOverride = l_CrossDeviceButtonText_0
                    });
                end;
            end;
        end, function() --[[ Line: 2029 ]]

        end);
    end;
    v345.props.loggingProtocol:logEventOnce("login_view_did_mount");
    v345.props.loggingProtocol:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LoginPageMountTelemetryConfig, 1, {
        version = 1
    });
end;
v159.willUnmount = function(v389) --[[ Line: 2042 ]] --[[ Name: willUnmount ]]
    -- upvalues: v112 (copy)
    if v112 == true and v389.isAlreadyAuthenticated == true then
        resetDefaultTheme();
    end;
    v389.unfocusTextBoxes();
    for _, v391 in ipairs(v389.events) do
        v391:Disconnect();
    end;
    v389.events = {};
    v389.isMounted = false;
end;
v159.didUpdate = function(v392, _, v394) --[[ Line: 2057 ]] --[[ Name: didUpdate ]]
    -- upvalues: v161 (copy)
    if v392.state.errorCode == -1 then
        return;
    else
        local l_isLoginInProgress_1 = v392.state.isLoginInProgress;
        if v394.isLoginInProgress and not l_isLoginInProgress_1 then
            local v396 = v392.errorHandlingInfoList[v392.state.errorCode];
            if not v396 then
                return;
            else
                if v396.textBoxesToClear then
                    for _, v398 in pairs(v396.textBoxesToClear) do
                        if v398 == v161.CValue then
                            v392.updateCValueText("");
                        elseif v398 == v161.Password then
                            v392.updatePasswordText("");
                        end;
                    end;
                end;
                if v396.newFocusedTextBox == v161.CValue and v392.cvalueRef.current then
                    v392.cvalueRef.current:CaptureFocus();
                    return;
                elseif v396.newFocusedTextBox == v161.Password and v392.passwordRef.current then
                    v392.passwordRef.current:CaptureFocus();
                end;
            end;
        end;
        return;
    end;
end;
v159.render = function(v399) --[[ Line: 2089 ]] --[[ Name: render ]]
    -- upvalues: l_UiMode_0 (copy), l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0 (copy), v131 (copy), l_FFlagAuthSecExclusions_0 (copy), v90 (copy), v113 (copy), l_withStyle_0 (copy), v75 (copy), v65 (copy), v49 (copy), v48 (copy), v13 (copy), v58 (copy), v54 (copy), v55 (copy), l_LinkButton_0 (copy), v40 (copy), v160 (copy)
    local v400 = v399.state.errorKey ~= "" and v399.state.errorKey or nil;
    local v401 = v399.state.errorKey == false and v399.state.localizedErrorMessage or nil;
    local v402 = not v399.props.appPolicy.getWebViewSupport() and v399.props.uiModeInfo.uiMode ~= l_UiMode_0.VR;
    local v403 = true;
    if v399.props.uiModeInfo.uiMode ~= l_UiMode_0.TenFoot then
        v403 = v399.props.uiModeInfo.uiMode == l_UiMode_0.VR;
    end;
    local v404 = l_GetFFlagLuaAppEnableDesktopDualLoginABTest_0() and v399.state.isDesktopDualLoginEnabled;
    local v405 = v403 or v399.props.appPolicy.getEnableDualLogin() and v404;
    local v406 = v399.props.appPolicy.getDisableEmailOTPLogin() and (v131 or l_FFlagAuthSecExclusions_0);
    local v407 = v90() and v399.props.isLoginWithOtpEnabled and not v406;
    local v408 = v399.props.appPolicy.getUseVNGUserAgreementPopup();
    local v409 = v113 and v399.props.appPolicy.getUseKoreaKISAUserAgreementPopup();
    local v410 = v131 and v399.props.appPolicy.getDisableLoginForgotButton();
    return l_withStyle_0(function(v411) --[[ Line: 2116 ]]
        -- upvalues: v75 (ref), v405 (copy), l_FFlagAuthSecExclusions_0 (ref), v399 (copy), v402 (ref), v65 (ref), v400 (copy), v403 (copy), v49 (ref), v48 (ref), l_UiMode_0 (ref), v13 (ref), v58 (ref), v54 (ref), v401 (copy), v408 (copy), v409 (copy), v407 (copy), v55 (ref), v410 (copy), l_LinkButton_0 (ref), v40 (ref), v160 (ref)
        local v412 = v75.CrossDeviceLoginRolloutEnabledForDevice() and not v405;
        if l_FFlagAuthSecExclusions_0 and v399.props.appPolicy.getExcludeCrossDeviceSignIn() then
            v412 = false;
        end;
        local v413 = v399.props.appPolicy.getShowVNGLoginWithExistingAccountQuickLoginButton();
        if v399.props.appPolicy.getDisableRegularLogin() == false then
            v402 = false;
        end;
        return v65({
            localizedError = v400, 
            logInText = "Authentication.Login.Action.SignIn", 
            forgotText = "Authentication.Login.Action.ForgotPasswordOrUsernameQuestionCapitalized", 
            cvaluePlaceholder = v399.state.forceLoginByUsername and "Authentication.Login.Label.Username" or "Authentication.Login.Label.UsernameEmailPhone", 
            passwordPlaceholder = "CommonUI.Messages.Label.Password", 
            twoStepHeader = "Authentication.TwoStepVerification.Label.TwoStepVerification", 
            crossDeviceLoginHeader = "Authentication.CrossDevice.Heading.QuickLogin", 
            loginWithExistingAccountButtonText = "Authentication.CrossDevice.Heading.QuickLogin", 
            orText = "CommonUI.Messages.Label.OR"
        })(function(v414) --[[ Line: 2143 ]]
            -- upvalues: v399 (ref), v413 (copy), v403 (ref), v49 (ref), v48 (ref), l_UiMode_0 (ref), v13 (ref), v58 (ref), v405 (ref), v54 (ref), v412 (ref), v401 (ref), v402 (ref), v408 (ref), v409 (ref), v407 (ref), v411 (copy), v55 (ref), v410 (ref), l_LinkButton_0 (ref), v40 (ref), v160 (ref)
            local v415 = v399.state.quickLoginButtonTextOverride ~= "" and v399.state.quickLoginButtonTextOverride or v414.crossDeviceLoginHeader;
            if v413 then
                v415 = v414.loginWithExistingAccountButtonText;
            end;
            local v416 = if v403 then v49 else v48;
            local v417 = v403 and v399.props.uiModeInfo.uiMode ~= l_UiMode_0.VR;
            return v13.createElement(v416, {
                ContentAlign = v58.Top, 
                topButtonActivatedTracking = v399.topButtonActivatedTracking, 
                topButtonEnabled = not v399.state.isLoginInProgress, 
                statusBarHeight = v399.props.statusBarHeight, 
                globalGuiInset = v399.props.globalGuiInset, 
                screenSize = v399.props.screenSize, 
                isDualLayout = v405, 
                navigateBack = if v403 then v399.props.navigateBack else nil, 
                buttonRef = v399.props.containerRef
            }, {
                UIListLayout = v405 and v13.createElement("UIListLayout", {
                    Padding = UDim.new(0, 0), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }) or v13.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 15)
                }), 
                Form = if v405 then v13.createElement("Frame", {
                    Size = UDim2.new(0.5, 0, 1, 0), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1
                }, {
                    FormContent = v13.createElement(v54, {
                        Size = UDim2.new(0, 0, 1, 0), 
                        crossDeviceLoginEnabled = v412, 
                        quickLoginButtonText = v415, 
                        loginWithExistingAccountVariantEnabled = v413, 
                        handleLoginWithFormDataCallback = v399.handleLoginWithFormData, 
                        updateIsLoginInProgress = v399.updateIsLoginInProgress, 
                        cvalueText = v399.cvalueText, 
                        passwordText = v399.passwordText, 
                        onTextBoxesChanged = v399.onTextBoxesChanged, 
                        buttonRef = v399.props.defaultRef, 
                        cvalueRef = v399.cvalueRef, 
                        passwordRef = v399.passwordRef, 
                        loginButtonRef = v399.loginButtonRef, 
                        forgotLinkRef = v399.forgotLinkRef, 
                        crossDeviceButtonRef = v399.crossDeviceButtonRef, 
                        emailOtpRef = v399.emailOtpRef, 
                        localizedError = v414.localizedError, 
                        localizedErrorMessage = v401, 
                        forceLoginByUsername = v399.state.forceLoginByUsername or v403, 
                        onCrossDeviceLoginActivated = v399.onCrossDeviceLoginActivated, 
                        onEmailOtpActivated = v399.onEmailOtpLoginActivated, 
                        loginButtonDisabled = v399.state.loginButtonDisabled, 
                        isLoginInProgress = v399.state.isLoginInProgress, 
                        authAnalytics = v399.props.authAnalytics, 
                        disableRegularLogin = v402, 
                        showLinkAccountText = v417, 
                        showForgotButton = not v402 and not v403, 
                        onForgetButtonActivated = v399.onForgetButtonActivated, 
                        maxSizeX = 1e999, 
                        showDisclaimerLinks = not v403 and not (v408 or v409), 
                        showDisclaimerButtons = v403 and not v408, 
                        showCredentialHeader = not v403, 
                        isDualLayout = true, 
                        isTenFootUiMode = v403, 
                        emailOtpEnabled = v407, 
                        LayoutOrder = 2
                    })
                }) else v13.createElement(v54, {
                    crossDeviceLoginEnabled = v412, 
                    quickLoginButtonText = v415, 
                    loginWithExistingAccountVariantEnabled = v413, 
                    handleLoginWithFormDataCallback = v399.handleLoginWithFormData, 
                    updateIsLoginInProgress = v399.updateIsLoginInProgress, 
                    cvalueText = v399.cvalueText, 
                    passwordText = v399.passwordText, 
                    onTextBoxesChanged = v399.onTextBoxesChanged, 
                    buttonRef = v399.props.defaultRef, 
                    cvalueRef = v399.cvalueRef, 
                    passwordRef = v399.passwordRef, 
                    loginButtonRef = v399.loginButtonRef, 
                    forgotLinkRef = v399.forgotLinkRef, 
                    crossDeviceButtonRef = v399.crossDeviceButtonRef, 
                    emailOtpRef = v399.emailOtpRef, 
                    localizedError = v414.localizedError, 
                    localizedErrorMessage = v401, 
                    forceLoginByUsername = v399.state.forceLoginByUsername or v403, 
                    onCrossDeviceLoginActivated = v399.onCrossDeviceLoginActivated, 
                    onEmailOtpActivated = v399.onEmailOtpLoginActivated, 
                    loginButtonDisabled = v399.state.loginButtonDisabled, 
                    isLoginInProgress = v399.state.isLoginInProgress, 
                    authAnalytics = v399.props.authAnalytics, 
                    disableRegularLogin = v402, 
                    showLinkAccountText = v399.props.appPolicy.getUseSingleSignOn(), 
                    showForgotButton = not v402 and v405 and not v403, 
                    onForgetButtonActivated = v399.onForgetButtonActivated, 
                    maxSizeX = v405 and 1e999 or 360, 
                    showDisclaimerLinks = v405 and not v403 and not (v408 or v409), 
                    showDisclaimerButtons = v405 and v403 and not v408, 
                    showCredentialHeader = v405 and not v403, 
                    isDualLayout = v405, 
                    isTenFootUiMode = v403, 
                    emailOtpEnabled = v407
                }), 
                Divider = v405 and v13.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(0, v411.Tokens.Global.Size_500, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    v13.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v411.Tokens.Global.Size_150)
                    }), 
                    v13.createElement("Frame", {
                        Size = UDim2.new(0, v411.Tokens.Global.Size_25, 0.5, 0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = v411.Tokens.Global.Color.Smoke.Color3, 
                        LayoutOrder = 1
                    }), 
                    v13.createElement("TextLabel", {
                        Text = v414.orText, 
                        TextSize = v411.Tokens.Global.Size_200, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextTransparency = 0, 
                        TextColor3 = v411.Tokens.Global.Color.Smoke.Color3, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }), 
                    v13.createElement("Frame", {
                        Size = UDim2.new(0, v411.Tokens.Global.Size_25, 0.5, 0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = v411.Tokens.Global.Color.Smoke.Color3, 
                        LayoutOrder = 3
                    })
                }) or nil, 
                LoginCode = v405 and v13.createElement("Frame", {
                    Size = UDim2.new(0.5, 0, 1, 0), 
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1
                }, {
                    v13.createElement(v55, {
                        loginCallback = v399.handleLoginWithCode, 
                        isOverlay = false, 
                        hideDeviceCode = not v403, 
                        showLockIcon = not v403, 
                        isDualLayout = true
                    })
                }), 
                Forgot = if not not v402 or v405 or v410 then nil else v13.createElement(l_LinkButton_0, {
                    text = v414.forgotText, 
                    size = UDim2.new(0, 0, 0, 30), 
                    fontStyle = "Footer", 
                    onActivated = v399.onForgetButtonActivated, 
                    colorStyleDefault = "TextDefault", 
                    colorStyleHover = "TextDefault"
                }), 
                DisclaimerLinks = if not not v405 or v408 or v409 then nil else v13.createElement(v40, {
                    fillDirection = Enum.FillDirection.Vertical, 
                    LayoutOrder = 60
                }), 
                Padding = not v405 and v13.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v160), 
                    LayoutOrder = 61
                }) or nil
            });
        end);
    end);
end;
v159 = l_RoactServices_0.connect({
    networking = v15, 
    analytics = v20, 
    authAnalytics = v17, 
    loggingProtocol = l_AppLogging_0, 
    linking = l_AppLinking_0
})(v159);
v159 = v14.connect(function(v418, _) --[[ Line: 2347 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    local v420 = nil;
    if l_FFlagUseNavigationSelectors_0 then
        v420 = l_Selectors_0.selectCurrentPageName(v418);
    else
        local v421 = v418.Navigation.history[#v418.Navigation.history];
        v420 = v421[#v421].name;
    end;
    return {
        currentPageName = v420, 
        screenSize = v418.ScreenSize, 
        statusBarHeight = v418.TopBar.statusBarHeight, 
        globalGuiInset = v418.GlobalGuiInset
    };
end, function(v422) --[[ Line: 2361 ]]
    -- upvalues: v27 (copy), v28 (copy), v29 (copy), v30 (copy), v32 (copy), v73 (copy), v84 (copy), v127 (copy), v124 (copy), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (copy), l_AccountSwitcherConstants_0 (copy), v71 (copy), v109 (copy), v114 (copy), l_GuiService_0 (copy), v125 (copy), v37 (copy), v34 (copy), v36 (copy), v35 (copy), v38 (copy), v61 (copy), v128 (copy), v39 (copy), v41 (copy), v91 (copy), v43 (copy), v44 (copy), v81 (copy), v33 (copy), v83 (copy), v42 (copy), v111 (copy), v45 (copy)
    return {
        login = function(...) --[[ Line: 2363 ]] --[[ Name: login ]]
            -- upvalues: v422 (copy), v27 (ref)
            return v422(v27(...));
        end, 
        loginByCode = function(...) --[[ Line: 2366 ]] --[[ Name: loginByCode ]]
            -- upvalues: v422 (copy), v28 (ref)
            return v422(v28(...));
        end, 
        loginByPasskey = function(...) --[[ Line: 2369 ]] --[[ Name: loginByPasskey ]]
            -- upvalues: v422 (copy), v29 (ref)
            return v422(v29(...));
        end, 
        loginByOtp = function(...) --[[ Line: 2372 ]] --[[ Name: loginByOtp ]]
            -- upvalues: v422 (copy), v30 (ref)
            return v422(v30(...));
        end, 
        launchApp = function(v423, v424, v425, v426) --[[ Line: 2375 ]] --[[ Name: launchApp ]]
            -- upvalues: v422 (copy), v32 (ref), v73 (ref)
            return v422(v32(v423, v424, v425, v426, v73.Login));
        end, 
        clearApp = function() --[[ Line: 2381 ]] --[[ Name: clearApp ]]
            -- upvalues: v422 (copy), v84 (ref), v127 (ref)
            v422(v84());
            return v127.resolve(true);
        end, 
        handleLoginCompletionWithAccountSwitching = function(v427, v428, v429, v430, v431, v432, v433) --[[ Line: 2386 ]] --[[ Name: handleLoginCompletionWithAccountSwitching ]]
            -- upvalues: v124 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), v71 (ref), v109 (ref), v114 (ref), l_GuiService_0 (ref), v125 (ref)
            if v124.fromLocalStorage().userId ~= -1 then
                v432():andThen(function(_) --[[ Line: 2397 ]]
                    -- upvalues: l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), v71 (ref), v109 (ref), v431 (copy), v114 (ref), l_GuiService_0 (ref), v125 (ref)
                    local v435 = if l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 then l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromLoginStatus else v71.Auth.AccountSwitcherSwitchedStatus;
                    v109.setAccountSwitchStatus(v435);
                    v109.setAccountBlob(v431);
                    v109.flush();
                    if v114 then
                        l_GuiService_0:BroadcastNotification("", v125.DID_SWITCH_ACCOUNT);
                        return;
                    else
                        l_GuiService_0:BroadcastNotification("", v125.DID_LOG_OUT);
                        return;
                    end;
                end, function(_) --[[ Line: 2409 ]]
                    -- upvalues: v109 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), v431 (copy), v433 (copy), v427 (copy), v428 (copy), v429 (copy), v430 (copy)
                    v109.setAccountSwitchStatus(if l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 then l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromLoginStatus else "switched");
                    v109.setAccountBlob(v431);
                    v109.flush();
                    v433(v427, v428, v429, v430);
                end);
                return;
            else
                v109.setAccountBlob(v431);
                v109.flush();
                v433(v427, v428, v429, v430);
                return;
            end;
        end, 
        setBackNavigationDisabled = function(v437) --[[ Line: 2426 ]] --[[ Name: setBackNavigationDisabled ]]
            -- upvalues: v422 (copy), v37 (ref)
            return v422(v37(v437));
        end, 
        navigateToPage = function(v438) --[[ Line: 2429 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v422 (copy), v34 (ref)
            return v422(v34(v438));
        end, 
        setLoginResult = function(v439) --[[ Line: 2432 ]] --[[ Name: setLoginResult ]]
            -- upvalues: v422 (copy), v36 (ref)
            v422(v36(v439));
        end, 
        openPasswordResetPrompt = function() --[[ Line: 2435 ]] --[[ Name: openPasswordResetPrompt ]]
            -- upvalues: v422 (copy), v35 (ref)
            v422(v35());
        end, 
        openEmailVerificationPrompt = function(v440, v441, v442) --[[ Line: 2438 ]] --[[ Name: openEmailVerificationPrompt ]]
            -- upvalues: v422 (copy), v38 (ref), v61 (ref)
            v422(v38(v61.LoginEmailVerificationPrompt, {
                credentialValue = v440, 
                password = v441, 
                onClose = v442
            }));
        end, 
        openNewAppAvailableModal = function(v443) --[[ Line: 2445 ]] --[[ Name: openNewAppAvailableModal ]]
            -- upvalues: v128 (ref), v422 (copy), v38 (ref), v61 (ref)
            if v128() then
                v422(v38(v61.NewAppAvailableModal, {
                    onButtonActivated = v443
                }));
            end;
        end, 
        openCrossDeviceLoginPrompt = function(v444) --[[ Line: 2452 ]] --[[ Name: openCrossDeviceLoginPrompt ]]
            -- upvalues: v422 (copy), v39 (ref)
            v422(v39.OpenLoginCodePrompt({
                loginCallback = v444, 
                isOverlay = true
            }));
        end, 
        openCrossAppLoginPrompt = function(v445) --[[ Line: 2458 ]] --[[ Name: openCrossAppLoginPrompt ]]
            -- upvalues: v422 (copy), v39 (ref)
            v422(v39.OpenLoginCodePrompt({
                loginCallback = v445, 
                isOverlay = true, 
                isCrossApp = true
            }));
        end, 
        openAccountSelector = function(v446) --[[ Line: 2465 ]] --[[ Name: openAccountSelector ]]
            -- upvalues: v422 (copy), v41 (ref), v91 (ref)
            v422(v41(v446, v91(), false));
        end, 
        openEmailOtp = function(v447) --[[ Line: 2470 ]] --[[ Name: openEmailOtp ]]
            -- upvalues: v422 (copy), v43 (ref)
            v422(v43(v447));
        end, 
        closeCentralOverlay = function() --[[ Line: 2473 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v422 (copy), v44 (ref)
            return v422(v44());
        end, 
        resetAppState = function() --[[ Line: 2476 ]] --[[ Name: resetAppState ]]
            -- upvalues: v422 (copy), v84 (ref)
            return v422(v84());
        end, 
        renderChallenge = function(v448, v449) --[[ Line: 2479 ]] --[[ Name: renderChallenge ]]
            -- upvalues: v422 (copy), v81 (ref)
            return v422(v81(v448, v449));
        end, 
        startPasskeyAuthentication = function(v450) --[[ Line: 2482 ]] --[[ Name: startPasskeyAuthentication ]]
            -- upvalues: v422 (copy), v33 (ref)
            return v422(v33(v450));
        end, 
        logoutAllLoggedInUsers = function(v451, v452) --[[ Line: 2485 ]] --[[ Name: logoutAllLoggedInUsers ]]
            -- upvalues: v422 (copy), v83 (ref)
            return v422(v83(v451, v452));
        end, 
        logoutWithoutShowConfirmation = function(v453, v454) --[[ Line: 2488 ]] --[[ Name: logoutWithoutShowConfirmation ]]
            -- upvalues: v422 (copy), v42 (ref)
            return v422(v42(v453, v454));
        end, 
        openAccountSwitchingErrorOverlay = function(v455, v456, v457, v458, v459, v460, v461, v462) --[[ Line: 2491 ]] --[[ Name: openAccountSwitchingErrorOverlay ]]
            -- upvalues: v422 (copy), v111 (ref)
            return v422(v111(v455, v456, v457, v458, v459, v460, v461, v462));
        end, 
        navigateBack = function() --[[ Line: 2514 ]] --[[ Name: navigateBack ]]
            -- upvalues: v422 (copy), v45 (ref)
            return v422(v45());
        end, 
        showAccountLinkingAlert = function(v463, v464) --[[ Line: 2517 ]] --[[ Name: showAccountLinkingAlert ]]
            -- upvalues: v422 (copy), v38 (ref), v61 (ref)
            return v422(v38(v61.AccountLinkingAlert, {
                alertType = v463, 
                userFacingMessage = v464
            }));
        end
    };
end)(v159);
v159 = l_RoactAppPolicy_0.connect(function(v465, _) --[[ Line: 2526 ]]
    return {
        appPolicy = v465
    };
end)(v159);
v159 = v18.connectBrowserTrackerLayer({
    l_AppBtidLayers_0.LoginLayer, 
    l_AppBtidLayers_0.AccountSwitcherLayer
}, function(v467, _) --[[ Line: 2535 ]]
    -- upvalues: l_AppBtidLayers_0 (copy), l_GetFFlagEnableAccountSwitcherIXPTextGatingFix_0 (copy), l_GetFFlagEnableAccountSwitcherRedesignIXP_0 (copy), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (copy), v146 (copy)
    local v469 = v467[l_AppBtidLayers_0.LoginLayer] or {};
    local v470 = nil;
    if l_GetFFlagEnableAccountSwitcherIXPTextGatingFix_0() then
        local v471 = v467[l_AppBtidLayers_0.AccountSwitcherLayer] or {};
        local v472 = not l_GetFFlagEnableAccountSwitcherRedesignIXP_0() or v471.enableAccountSwitcherFoundationDesign == true;
        v470 = l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and v472;
    else
        v470 = l_GetFFlagEnableAccountSwitcherFoundationDesign_0();
    end;
    return {
        isLoginWithOtpEnabled = v146 or v469.IsLoginWithOtpEnabled, 
        shouldLoginWithKeystoreCredentials = v469.shouldLoginWithKeystoreCredentials, 
        showAccountSwitcherFoundationDesign = v470
    };
end)(v159);
v159 = l_withNavigationProps_0(function(_, v474) --[[ Line: 2556 ]]
    return v474;
end)(v159);
return function(v475) --[[ Line: 2560 ]] --[[ Name: LoginViewFn ]]
    -- upvalues: l_useUiModeInfo_0 (copy), v21 (copy), v13 (copy), v159 (ref), v9 (copy)
    local v476 = l_useUiModeInfo_0();
    local v477, v478 = v21.useDefaultFocusBehavior();
    return v13.createElement(v159, v9.Dictionary.join({
        uiModeInfo = v476, 
        defaultRef = v477, 
        containerRef = v478
    }, v475));
end;