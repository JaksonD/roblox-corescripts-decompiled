local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v8 = require(l_script_FirstAncestor_0.Enums);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_UserIdentifierType_0 = v8.UserIdentifierType;
local v11 = require(l_Parent_0.React);
local v12 = require(l_Parent_0.Promise);
local v13 = require(l_Parent_0.AuthCommon);
local v14 = require(l_Parent_0.OtpLogin);
local _ = require(l_Parent_0.LuauPolyfill);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_LaunchContext_0 = require(l_Parent_0.AppStartup).Enums.LaunchContext;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_OpenAccountSwitchingErrorOverlay_0 = require(l_Parent_0.AccountSwitcher).OpenAccountSwitchingErrorOverlay;
local l_RenderChallenge_0 = require(l_Parent_0.GenericChallenges).Middleware.RenderChallenge;
local l_ChallengeType_0 = require(l_Parent_0.GenericChallenges).Types.ChallengeType;
local l_TwoStepVerificationActionType_0 = require(l_Parent_0.GenericChallenges).Types.TwoStepVerificationActionType;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v30 = require(l_Parent_0.AuthAnalytics);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local l_EventStreamConstants_0 = require(l_Parent_0.AuthAnalytics).EventStreamConstants;
local v33 = require(l_Parent_0.RoactAppExperiment);
local l_AppBtidLayers_0 = require(l_Parent_0.ExperimentLayers).AppBtidLayers;
local v35 = require(l_Parent_0.RoactServiceTags);
local l_RoactNetworking_0 = v35.RoactNetworking;
local l_RoactAnalytics_0 = v35.RoactAnalytics;
local l_AppLinking_0 = v35.AppLinking;
local v39 = require(l_Parent_0.CredentialsProtocol);
local l_Constants_0 = v39.Constants;
local l_default_0 = v39.CredentialsProtocol.default;
local l_CredentialsProtocolErrorCodes_0 = v39.CredentialsProtocolErrorCodes;
local v43 = require(l_Parent_0.SharedFlags);
local l_GetFFlagEnableLoginAccountSelector_0 = v43.GetFFlagEnableLoginAccountSelector;
local l_FFlagEnableLuaAccountSwitch_0 = v43.FFlagEnableLuaAccountSwitch;
local l_FFlagLuaEnableDidSwitchAccount_0 = v43.FFlagLuaEnableDidSwitchAccount;
local l_GetFStringVNGDownloadNowUrl_0 = v43.GetFStringVNGDownloadNowUrl;
local l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 = v43.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues;
local l_FFlagAddReasonToEveryLogout_0 = v43.FFlagAddReasonToEveryLogout;
local l_FFlagEnablePasskeyLoginErrorLogging_0 = v43.FFlagEnablePasskeyLoginErrorLogging;
local l_FFlagUseErrorTypeForPasskeyLoginLogging_0 = v43.FFlagUseErrorTypeForPasskeyLoginLogging;
local l_FFlagDisableMemStorageServicePasswordEvent_0 = v43.FFlagDisableMemStorageServicePasswordEvent;
local l_FFlagEnableLoginV2ForcedUsernameOverride_0 = v43.FFlagEnableLoginV2ForcedUsernameOverride;
local l_FFlagEnablePWManagerLoginCheck_0 = v43.FFlagEnablePWManagerLoginCheck;
local l_GetFFlagKeystoreAutoLoginAvailable_0 = v43.GetFFlagKeystoreAutoLoginAvailable;
local l_GetFFlagBypassKeystoreLoginIxpV2_0 = v43.GetFFlagBypassKeystoreLoginIxpV2;
local l_GetFFlagCheckIsAvailableForKeystoreOperations_0 = v43.GetFFlagCheckIsAvailableForKeystoreOperations;
local l_GetFFlagRemoveKeystoreIxpLogic_0 = v43.GetFFlagRemoveKeystoreIxpLogic;
local l_GetFFlagEnableAccountSwitcherFoundationDesign_0 = v43.GetFFlagEnableAccountSwitcherFoundationDesign;
local l_GetFFlagEnableAccountSwitcherRedesignIXP_0 = v43.GetFFlagEnableAccountSwitcherRedesignIXP;
local l_FFlagEnableNavigateToLoginAfterLogoutAll_0 = v43.FFlagEnableNavigateToLoginAfterLogoutAll;
local l_FFlagEnable2SVRecovery_0 = v43.FFlagEnable2SVRecovery;
local v63 = game:DefineFastFlag("LoginV2AwaitPasswordRegistration", false);
local v64 = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV2", false);
local v65 = require(l_script_FirstAncestor_0.Context.LoginContext);
local v66 = require(l_script_FirstAncestor_0.Reducers.LoginStateReducer);
local v67 = require(l_script_FirstAncestor_0.Thunks.StartAuthenticationByUser);
local v68 = require(l_script_FirstAncestor_0.Thunks.StartPasskeyAuthentication);
local v69 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local v70 = require(l_script_FirstAncestor_0.Enums.LoginActionType);
local l_Base64_0 = v13.Utils.Base64;
local l_AccountSwitcherConstants_0 = v13.Common.AccountSwitcherConstants;
local l_LoginResult_0 = v13.Models.LoginResult;
local l_SetLoginResult_0 = v13.Actions.SetLoginResult;
local l_SetBackNavigationDisabled_0 = v13.Actions.SetBackNavigationDisabled;
local l_authClientError_0 = v30.Events.authClientError;
local l_authButtonClick_0 = v30.Events.authButtonClick;
local l_reportEphemeralCounter_0 = v13.Analytics.reportEphemeralCounter;
local l_AppStorageUtilities_0 = v13.Utils.AppStorageUtilities;
local l_LoginByPasskey_0 = v13.Thunks.LoginByPasskey;
local l_LoginByCode_0 = v13.Thunks.LoginByCode;
local l_LoginByOtp_0 = v13.Thunks.LoginByOtp;
local l_Login_0 = v13.Thunks.Login;
local l_User_0 = v13.Thunks.User;
local l_AppLoginCounterNames_0 = v13.Enums.AppLoginCounterNames;
local l_LoginErrorCodes_0 = v13.Enums.LoginErrorCodes;
local l_getTwoStepLoginErrorKey_0 = v13.Utils.getTwoStepLoginErrorKey;
local l_OpenCentralOverlayForLoginPasswordResetPrompt_0 = v13.Thunks.OpenCentralOverlayForLoginPasswordResetPrompt;
local l_LogoutAllLoggedInUsers_0 = v13.Thunks.LogoutAllLoggedInUsers;
local l_AuthLocalStorageKeys_0 = v13.Enums.AuthLocalStorageKeys;
local l_OpenAccountSelector_0 = v13.Thunks.OpenAccountSelector;
local l_AuthMemStorageKeys_0 = v13.Enums.AuthMemStorageKeys;
local l_TwoStepRequests_0 = v13.Http.Requests.TwoStepRequests;
local l_LogoutReasonNames_0 = v13.Enums.LogoutReasonNames;
local l_PasskeyConstants_0 = v13.Common.PasskeyConstants;
local l_record2svCompletion_0 = v13.Utils.record2svCompletion;
local l_recordLogin_0 = v13.Utils.recordLogin;
local l_TwoStepErrorCodes_0 = v13.Enums.TwoStepErrorCodes;
local l_GetUserByUsername_0 = v13.Thunks.GetUserByUsername;
local l_KeystoreConstants_0 = v13.Common.KeystoreConstants;
local l_KeystoreAnalyticsEvents_0 = v13.Analytics.KeystoreAnalyticsEvents;
local l_KeystoreEventConstants_0 = v13.Analytics.KeystoreEventConstants;
local l_FFlagEnableRecordLogin_0 = require(l_Parent_0.SharedFlags).FFlagEnableRecordLogin;
local l_LoginMethods_0 = v13.Enums.LoginMethods;
local l_GetPasswordManagerUsageStore_0 = v13.Stores.GetPasswordManagerUsageStore;
local l_SendCode_0 = v14.Thunks.SendCode;
local l_ResendCode_0 = v14.Thunks.ResendCode;
local l_Constants_1 = v14.Constants;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_default_1 = require(l_Parent_0.LoggingProtocol).default;
local l_TelemetryConfigs_0 = require(l_Parent_0.AuthAnalytics).TelemetryConfigs;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
return function(v113) --[[ Line: 155 ]]
    -- upvalues: l_useNavigationProps_0 (copy), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (copy), l_UserIdentifierType_0 (copy), v11 (copy), v66 (copy), l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (copy), v33 (copy), l_AppBtidLayers_0 (copy), l_GetFFlagEnableAccountSwitcherRedesignIXP_0 (copy), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_RoactAnalytics_0 (copy), l_AppLinking_0 (copy), l_useAppPolicy_0 (copy), v68 (copy), v67 (copy), l_SetLoginResult_0 (copy), l_SetBackNavigationDisabled_0 (copy), l_LaunchContext_0 (copy), v12 (copy), v70 (copy), v69 (copy), l_FFlagEnablePWManagerLoginCheck_0 (copy), l_GetPasswordManagerUsageStore_0 (copy), l_LoginByPasskey_0 (copy), l_LoginByCode_0 (copy), l_LoginByOtp_0 (copy), l_CloseCentralOverlay_0 (copy), l_Login_0 (copy), l_OpenAccountSelector_0 (copy), l_User_0 (copy), l_RenderChallenge_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (copy), l_AccountSwitcherConstants_0 (copy), l_AppStorageUtilities_0 (copy), l_FFlagLuaEnableDidSwitchAccount_0 (copy), l_GuiService_0 (copy), l_NotificationType_0 (copy), l_default_1 (copy), l_TelemetryConfigs_0 (copy), l_HttpService_0 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (copy), l_MemStorageService_0 (copy), l_AuthMemStorageKeys_0 (copy), l_default_0 (copy), l_Constants_0 (copy), l_Logger_0 (copy), l_authButtonClick_0 (copy), l_EventStreamConstants_0 (copy), l_getTwoStepLoginErrorKey_0 (copy), l_TwoStepErrorCodes_0 (copy), l_reportEphemeralCounter_0 (copy), l_AppLoginCounterNames_0 (copy), l_ChallengeType_0 (copy), l_TwoStepVerificationActionType_0 (copy), l_FFlagEnable2SVRecovery_0 (copy), l_TwoStepRequests_0 (copy), v63 (copy), l_FFlagEnableRecordLogin_0 (copy), l_record2svCompletion_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), v64 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), l_GetFFlagRemoveKeystoreIxpLogic_0 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (copy), l_ContentProvider_0 (copy), l_GetUserByUsername_0 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (copy), l_KeystoreConstants_0 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy), l_LoginResult_0 (copy), l_GetFFlagEnableLoginAccountSelector_0 (copy), l_AppStorageService_0 (copy), l_AuthLocalStorageKeys_0 (copy), l_recordLogin_0 (copy), l_LoginMethods_0 (copy), l_Constants_1 (copy), l_SendCode_0 (copy), l_ResendCode_0 (copy), l_UserInputService_0 (copy), l_Base64_0 (copy), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (copy), l_CredentialsProtocolErrorCodes_0 (copy), l_authClientError_0 (copy), l_PasskeyConstants_0 (copy), l_FFlagEnablePasskeyLoginErrorLogging_0 (copy), l_OpenAccountSwitchingErrorOverlay_0 (copy), l_OpenCentralOverlayForLoginPasswordResetPrompt_0 (copy), l_LogoutAllLoggedInUsers_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_GetFStringVNGDownloadNowUrl_0 (copy), l_LoginErrorCodes_0 (copy), l_StatusCodes_0 (copy), l_FFlagAddReasonToEveryLogout_0 (copy), l_LogoutReasonNames_0 (copy), v65 (copy)
    local v116 = l_useNavigationProps_0(function(_, v115) --[[ Line: 156 ]]
        -- upvalues: l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref)
        return {
            credProtocolIsAvailableResponse = v115.credProtocolIsAvailableResponse, 
            forcedUsernameOverride = if l_FFlagEnableLoginV2ForcedUsernameOverride_0 then v115.forcedUsernameOverride else nil
        };
    end);
    local v117 = {
        userIdentifier = "", 
        userIdentifierType = l_UserIdentifierType_0.Unknown, 
        numLoginAttempts = 0, 
        forceLoginByUsername = false, 
        availableLoginMethods = {}, 
        credentialsProtocolStatus = {
            fido2Supported = false, 
            passwordsSupported = false, 
            v2InterfaceSupported = false, 
            shouldShowAuthScreenCredentialsPopup = false, 
            shouldShowAuthScreenUserSpecificPasskeyPopup = false, 
            initialStateUpdated = false
        }, 
        shouldAutoShowCredentialPopup = true, 
        componentState = {
            LoginScreenV2 = {
                errorKey = "", 
                userIdentifier = "", 
                shouldAttemptCredentialPrefill = true
            }, 
            AuthenticationScreen = {
                errorKey = "", 
                errorType = nil, 
                password = ""
            }, 
            EmailOtpScreen = {
                errorKey = "", 
                emailOtp = "", 
                sessionToken = ""
            }
        }, 
        monoDeps = v113.monoDeps, 
        extraProps = v116
    };
    local v118, v119 = v11.useReducer(v66, v117);
    local v120 = nil;
    if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 then
        v120 = v11.useRef(v118.userIdentifier);
        v120.current = v118.userIdentifier;
    end;
    local v122 = v33.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.LoginLayer
    }, function(v121) --[[ Line: 211 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return {
            shouldLoginWithKeystoreCredentials = (v121[l_AppBtidLayers_0.LoginLayer] or {}).shouldLoginWithKeystoreCredentials or false
        };
    end);
    local v124 = not l_GetFFlagEnableAccountSwitcherRedesignIXP_0() or v33.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.AccountSwitcherLayer
    }, function(v123) --[[ Line: 222 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return (v123[l_AppBtidLayers_0.AccountSwitcherLayer] or {}).enableAccountSwitcherFoundationDesign == true;
    end);
    local v125 = l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and v124;
    local v126 = l_useDispatch_0();
    local v127 = l_useRoactService_0(l_RoactNetworking_0);
    local v128 = l_useRoactService_0(l_RoactAnalytics_0);
    local v129 = l_useRoactService_0(l_AppLinking_0);
    local v131 = l_useAppPolicy_0(function(v130) --[[ Line: 234 ]]
        return v130;
    end);
    local l_LaunchApp_0 = v118.monoDeps.LaunchApp;
    local l_ResetAppState_0 = v118.monoDeps.ResetAppState;
    local l_Logout_0 = v118.monoDeps.Logout;
    local function v135() --[[ Line: 243 ]]
        -- upvalues: v126 (copy), v68 (ref), v127 (copy)
        return v126(v68(v127));
    end;
    local function v137(v136) --[[ Line: 247 ]]
        -- upvalues: v126 (copy), v67 (ref), v127 (copy)
        return v126(v67(v127, v136));
    end;
    local function _(v138) --[[ Line: 251 ]]
        -- upvalues: v126 (copy), l_SetLoginResult_0 (ref)
        return v126(l_SetLoginResult_0(v138));
    end;
    local function _(v140) --[[ Line: 255 ]]
        -- upvalues: v126 (copy), l_SetBackNavigationDisabled_0 (ref)
        return v126(l_SetBackNavigationDisabled_0(v140));
    end;
    local function _() --[[ Line: 259 ]]
        -- upvalues: v126 (copy), l_LaunchApp_0 (copy), v127 (copy), v128 (copy), v131 (copy), l_LaunchContext_0 (ref)
        return v126(l_LaunchApp_0(v127, nil, v128, v131, l_LaunchContext_0.Login));
    end;
    local function v143() --[[ Line: 263 ]]
        -- upvalues: v126 (copy), l_ResetAppState_0 (copy), v12 (ref)
        v126(l_ResetAppState_0());
        return v12.resolve();
    end;
    local function v144() --[[ Line: 268 ]]
        -- upvalues: v119 (copy), v70 (ref), v69 (ref), l_UserIdentifierType_0 (ref)
        v119({
            type = v70.SetComponentState, 
            data = {
                component = v69.AuthenticationScreen, 
                payload = {
                    errorKey = "", 
                    errorType = nil, 
                    password = ""
                }
            }
        });
        v119({
            type = v70.SetComponentState, 
            data = {
                component = v69.LoginScreenV2, 
                payload = {
                    errorKey = "", 
                    userIdentifier = ""
                }
            }
        });
        v119({
            type = v70.SetUserIdentifierAndType, 
            data = {
                userIdentifier = "", 
                userIdentifierType = l_UserIdentifierType_0.Unknown
            }
        });
    end;
    local v145 = if l_FFlagEnablePWManagerLoginCheck_0 then l_GetPasswordManagerUsageStore_0(false) else nil;
    if v145 then
        v145.setLoggedinUsingSavedPassword(false);
        v145.setSavedPasswordAfterLogin(false);
    end;
    local function _(v146, v147) --[[ Line: 307 ]]
        -- upvalues: v126 (copy), l_LoginByPasskey_0 (ref), v127 (copy)
        return v126(l_LoginByPasskey_0(v127, v146, v147));
    end;
    local function _(v149, v150, v151, v152, v153, v154) --[[ Line: 311 ]]
        -- upvalues: v126 (copy), l_LoginByCode_0 (ref), v127 (copy)
        return v126(l_LoginByCode_0(v127, v149, v150, v151, v152, v153, v154));
    end;
    local function _(v156, v157, v158, v159, v160) --[[ Line: 332 ]]
        -- upvalues: v126 (copy), l_LoginByOtp_0 (ref), v127 (copy)
        return v126(l_LoginByOtp_0(v127, v156, v157, v158, v159, v160));
    end;
    local function v162() --[[ Line: 351 ]]
        -- upvalues: v126 (copy), l_CloseCentralOverlay_0 (ref)
        return v126(l_CloseCentralOverlay_0());
    end;
    local function v163(...) --[[ Line: 355 ]]
        -- upvalues: v126 (copy), l_Login_0 (ref)
        return v126(l_Login_0(...));
    end;
    local function _(v164) --[[ Line: 359 ]]
        -- upvalues: v126 (copy), l_OpenAccountSelector_0 (ref)
        return v126(l_OpenAccountSelector_0(v164, true, false));
    end;
    local function v166() --[[ Line: 363 ]]
        -- upvalues: l_User_0 (ref)
        return l_User_0.fromLocalStorage().userId ~= -1;
    end;
    local function _(v167) --[[ Line: 367 ]]
        -- upvalues: l_RenderChallenge_0 (ref)
        return l_RenderChallenge_0(v167);
    end;
    local function v170(v169) --[[ Line: 371 ]]
        -- upvalues: v126 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v126(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = v169, 
            extraProps = {
                title = "", 
                transitionAnimation = "SlideInFromBottom"
            }
        }));
    end;
    local function v172(v171) --[[ Line: 382 ]]
        -- upvalues: v126 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v126(l_NavigateDown_0({
            name = l_AppPage_0.AccountRecovery, 
            extraProps = {
                identifier = v171, 
                recoverPassword = true
            }
        }));
    end;
    local function v179(v173) --[[ Line: 392 ]]
        -- upvalues: l_User_0 (ref), v126 (copy), l_ResetAppState_0 (copy), v12 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), l_AppStorageUtilities_0 (ref), l_FFlagLuaEnableDidSwitchAccount_0 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref), l_LaunchApp_0 (copy), v127 (copy), v128 (copy), v131 (copy), l_LaunchContext_0 (ref)
        if l_User_0.fromLocalStorage().userId ~= -1 then
            v126(l_ResetAppState_0());
            v12.resolve():andThen(function(_) --[[ Line: 394 ]]
                -- upvalues: l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), l_AppStorageUtilities_0 (ref), v173 (copy), l_FFlagLuaEnableDidSwitchAccount_0 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref)
                local v175 = if l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 then l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromLoginStatus else l_AccountSwitcherConstants_0.AccountSwitcherSwitchedStatus;
                l_AppStorageUtilities_0.setAccountSwitchStatus(v175);
                l_AppStorageUtilities_0.setAccountBlob(v173);
                l_AppStorageUtilities_0.flush();
                if l_FFlagLuaEnableDidSwitchAccount_0 then
                    l_GuiService_0:BroadcastNotification("", l_NotificationType_0.DID_SWITCH_ACCOUNT);
                    return;
                else
                    l_GuiService_0:BroadcastNotification("", l_NotificationType_0.DID_LOG_OUT);
                    return;
                end;
            end, function(_) --[[ Line: 406 ]]
                -- upvalues: l_AppStorageUtilities_0 (ref), v173 (copy), v126 (ref), l_LaunchApp_0 (ref), v127 (ref), v128 (ref), v131 (ref), l_LaunchContext_0 (ref)
                l_AppStorageUtilities_0.setAccountSwitchStatus("switched");
                l_AppStorageUtilities_0.setAccountBlob(v173);
                l_AppStorageUtilities_0.flush();
                local _ = v126(l_LaunchApp_0(v127, nil, v128, v131, l_LaunchContext_0.Login));
            end);
            return;
        else
            l_AppStorageUtilities_0.setAccountBlob(v173);
            l_AppStorageUtilities_0.flush();
            local _ = v126(l_LaunchApp_0(v127, nil, v128, v131, l_LaunchContext_0.Login));
            return;
        end;
    end;
    local function v187(v180) --[[ Line: 419 ]]
        -- upvalues: l_default_1 (ref), l_TelemetryConfigs_0 (ref), l_HttpService_0 (ref), v118 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), l_AuthMemStorageKeys_0 (ref), l_default_0 (ref), l_Constants_0 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), v145 (copy), l_Logger_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref)
        if v180 == nil then
            l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginPasswordSaveSkippedConfig, 1, {
                reason = "missingCredentialsJson"
            });
            return nil;
        else
            local v181 = l_HttpService_0:JSONDecode(v180);
            if v181.cvalue == nil or v181.password == nil then
                l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginPasswordSaveSkippedConfig, 1, {
                    reason = "missingUsernameOrPassword"
                });
                return nil;
            elseif not v118.credentialsProtocolStatus.passwordsSupported then
                if not l_FFlagDisableMemStorageServicePasswordEvent_0 then
                    l_MemStorageService_0:Fire(l_AuthMemStorageKeys_0.AuthenticatedCredentials, v180);
                end;
                l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginPasswordSaveSkippedConfig, 1, {
                    reason = "passwordsNotSupported"
                });
                return nil;
            else
                local v182 = {
                    username = v181.cvalue, 
                    password = v181.password
                };
                local v183 = l_HttpService_0:JSONEncode(v182);
                l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginPasswordSaveAttemptedConfig, 1);
                return l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v183, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v184) --[[ Line: 467 ]]
                    -- upvalues: l_HttpService_0 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), v145 (ref), l_Logger_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_default_1 (ref), l_TelemetryConfigs_0 (ref)
                    if v184 then
                        local v185 = l_HttpService_0:JSONDecode(v184);
                        if v185.errorCode == nil then
                            if l_FFlagEnablePWManagerLoginCheck_0 and v145 then
                                v145.setSavedPasswordAfterLogin(true);
                            end;
                            l_Logger_0:info("Successfully registered password.");
                            l_authButtonClick_0(l_EventStreamConstants_0.Context.CMPasswordLogin, l_EventStreamConstants_0.Button.SavePassword);
                            l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginPasswordSaveSuccessConfig, 1);
                            return;
                        else
                            l_Logger_0:warning("Error registering password: {}", v185.errorMsg);
                            l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginPasswordSaveFailureConfig, 1, {
                                errorCode = tostring(v185.errorCode)
                            });
                        end;
                    end;
                end, function(v186) --[[ Line: 493 ]]
                    -- upvalues: l_Logger_0 (ref), l_default_1 (ref), l_TelemetryConfigs_0 (ref)
                    l_Logger_0:warning("Error registering password: {}", v186);
                    l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginPasswordSaveFailureConfig, 1, {
                        error = tostring(v186)
                    });
                end);
            end;
        end;
    end;
    local function v191(v188, v189) --[[ Line: 503 ]]
        -- upvalues: l_getTwoStepLoginErrorKey_0 (ref), l_TwoStepErrorCodes_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref)
        local v190 = l_getTwoStepLoginErrorKey_0(v188);
        if v188 and v188 == l_TwoStepErrorCodes_0.IllegalChildAccountLinking then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTwoStepVerification, 1);
        else
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureUnknownError, 1);
        end;
        v189.setInProgress(false);
        v189.setErrorKey(v190);
    end;
    local function v205(v192, v193, v194) --[[ Line: 516 ]]
        -- upvalues: l_ChallengeType_0 (ref), l_TwoStepVerificationActionType_0 (ref), l_FFlagEnable2SVRecovery_0 (ref), l_TwoStepRequests_0 (ref), v127 (copy), v126 (copy), l_SetBackNavigationDisabled_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v63 (ref), v187 (copy), l_FFlagEnableRecordLogin_0 (ref), l_record2svCompletion_0 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (copy), l_LaunchApp_0 (copy), v128 (copy), v131 (copy), l_LaunchContext_0 (ref), v64 (ref), l_HttpService_0 (ref), v191 (copy), l_RenderChallenge_0 (ref)
        local l_ticket_0 = v192.twoStepVerificationData.ticket;
        local l_id_0 = v192.user.id;
        local v203 = {
            title = "Authentication.Login.Label.TwoStepVerification", 
            challengeType = l_ChallengeType_0.TwoStepVerification, 
            challengeParameters = {
                actionType = l_TwoStepVerificationActionType_0.Login, 
                challengeId = l_ticket_0, 
                userId = l_id_0, 
                allowRememberDevice = true, 
                clientSupports2svRecovery = l_FFlagEnable2SVRecovery_0 and true or false
            }, 
            callbacks = {
                OnChallengeCompleted = function(v197) --[[ Line: 531 ]] --[[ Name: OnChallengeCompleted ]]
                    -- upvalues: l_TwoStepRequests_0 (ref), v127 (ref), l_id_0 (copy), l_ticket_0 (copy), v126 (ref), l_SetBackNavigationDisabled_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v63 (ref), v187 (ref), v193 (copy), l_FFlagEnableRecordLogin_0 (ref), l_record2svCompletion_0 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (ref), l_LaunchApp_0 (ref), v128 (ref), v131 (ref), l_LaunchContext_0 (ref), v64 (ref), l_HttpService_0 (ref), v191 (ref), v194 (copy)
                    l_TwoStepRequests_0.login(v127, l_id_0, l_ticket_0, v197.data.verificationToken, v197.data.rememberDevice):andThen(function(v198) --[[ Line: 539 ]]
                        -- upvalues: v126 (ref), l_SetBackNavigationDisabled_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v63 (ref), v187 (ref), v193 (ref), l_FFlagEnableRecordLogin_0 (ref), l_record2svCompletion_0 (ref), l_id_0 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (ref), l_LaunchApp_0 (ref), v127 (ref), v128 (ref), v131 (ref), l_LaunchContext_0 (ref)
                        local v199 = v126(l_SetBackNavigationDisabled_0(false));
                        l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Success, 1);
                        if v63 then
                            v199 = v187(v193);
                            if v199 then
                                v199:await();
                            end;
                        end;
                        if l_FFlagEnableRecordLogin_0 then
                            pcall(function() --[[ Line: 551 ]]
                                -- upvalues: l_record2svCompletion_0 (ref), l_id_0 (ref)
                                l_record2svCompletion_0(l_id_0);
                            end);
                        end;
                        if l_FFlagEnableLuaAccountSwitch_0 then
                            v179(v198.responseBody and v198.responseBody.accountBlob);
                            return;
                        else
                            v199 = v126(l_LaunchApp_0(v127, nil, v128, v131, l_LaunchContext_0.Login));
                            return;
                        end;
                    end, function(v200) --[[ Line: 563 ]]
                        -- upvalues: l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v64 (ref), l_HttpService_0 (ref), v191 (ref), v194 (ref)
                        l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Failure, 1);
                        if v64 then
                            local l_status_0, l_result_0 = pcall(function() --[[ Line: 567 ]]
                                -- upvalues: l_HttpService_0 (ref), v200 (copy)
                                return l_HttpService_0:JSONDecode(v200.Body).errors[1].code;
                            end);
                            v191(if l_status_0 then l_result_0 else nil, v194);
                            return;
                        else
                            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureUnknownError, 1);
                            v194.setInProgress(false);
                            v194.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                            return;
                        end;
                    end):finally(function() --[[ Line: 578 ]]
                        -- upvalues: v63 (ref), v187 (ref), v193 (ref)
                        if not v63 then
                            v187(v193);
                        end;
                    end);
                end, 
                OnChallengeAbandoned = function() --[[ Line: 584 ]] --[[ Name: OnChallengeAbandoned ]]
                    -- upvalues: v194 (copy)
                    v194.setInProgress(false);
                end, 
                OnChallengeInvalidated = function() --[[ Line: 587 ]] --[[ Name: OnChallengeInvalidated ]]
                    -- upvalues: v194 (copy)
                    v194.setInProgress(false);
                    v194.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                end, 
                OnChallengeLoadFailed = function() --[[ Line: 591 ]] --[[ Name: OnChallengeLoadFailed ]]
                    -- upvalues: v194 (copy)
                    v194.setInProgress(false);
                    v194.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                end
            }
        };
        local _ = l_RenderChallenge_0(v203);
    end;
    local function v215(_, _, v208, v209, v210) --[[ Line: 599 ]]
        -- upvalues: l_ChallengeType_0 (ref), l_RenderChallenge_0 (ref)
        local v213 = {
            challengeType = l_ChallengeType_0.SecurityQuestions, 
            challengeParameters = {
                sessionId = v208.sessionId, 
                userId = v208.userId
            }, 
            callbacks = {
                OnChallengeCompleted = function(v211) --[[ Line: 613 ]] --[[ Name: OnChallengeCompleted ]]
                    -- upvalues: v208 (copy), v209 (copy)
                    local v212 = {
                        sessionId = v208.sessionId, 
                        redemptionToken = v211.data.redemptionToken
                    };
                    v209(v212);
                end, 
                OnChallengeAbandoned = function() --[[ Line: 620 ]] --[[ Name: OnChallengeAbandoned ]]
                    -- upvalues: v210 (copy)
                    v210.setInProgress(false);
                end, 
                OnChallengeInvalidated = function() --[[ Line: 623 ]] --[[ Name: OnChallengeInvalidated ]]
                    -- upvalues: v210 (copy)
                    v210.setInProgress(false);
                    v210.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                end, 
                OnChallengeLoadFailed = function() --[[ Line: 627 ]] --[[ Name: OnChallengeLoadFailed ]]
                    -- upvalues: v210 (copy)
                    v210.setInProgress(false);
                    v210.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                end
            }
        };
        local _ = l_RenderChallenge_0(v213);
    end;
    local _ = function(v216) --[[ Line: 635 ]]
        -- upvalues: v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v127 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref)
        return v12.new(function(v217, v218) --[[ Line: 638 ]]
            -- upvalues: l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v216 (copy), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v127 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v12 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref)
            if l_GetFFlagKeystoreAutoLoginAvailable_0() == false or v216 == nil then
                v217();
                return;
            else
                local v219 = l_GetFFlagRemoveKeystoreIxpLogic_0() and true or v122.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                local v220 = l_HttpService_0:JSONEncode({
                    server = l_ContentProvider_0.BaseUrl
                });
                local v221 = l_HttpService_0:JSONDecode(v216);
                l_GetUserByUsername_0(v127, v221.cvalue)():andThen(function(v222) --[[ Line: 660 ]]
                    -- upvalues: v218 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v220 (copy), v12 (ref)
                    if not v222 or not v222.id then
                        return v218("Invalid usernameInfo");
                    elseif l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                        return l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v223) --[[ Line: 670 ]]
                            -- upvalues: l_default_0 (ref), v220 (ref), l_KeystoreConstants_0 (ref), v12 (ref)
                            if v223 and v223.keystore and v223.keystore.isAvailable then
                                return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v220, l_KeystoreConstants_0.KeystoreTimeout);
                            else
                                return v12.resolve(nil);
                            end;
                        end):andThen(function() --[[ Line: 685 ]]
                            -- upvalues: v222 (copy)
                            return v222;
                        end);
                    else
                        return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v220, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 693 ]]
                            -- upvalues: v222 (copy)
                            return v222;
                        end);
                    end;
                end):andThen(function(v224) --[[ Line: 698 ]]
                    -- upvalues: l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v221 (copy), v219 (copy), l_KeystoreConstants_0 (ref), l_default_0 (ref)
                    local v225 = nil;
                    if l_GetFFlagRemoveKeystoreIxpLogic_0() then
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentials, (tostring(v224.id)));
                        v225 = l_HttpService_0:JSONEncode({
                            server = tostring(l_ContentProvider_0.BaseUrl), 
                            username = tostring(v221.cvalue), 
                            userId = tostring(v224.id), 
                            password = tostring(v221.password)
                        });
                    else
                        local v226 = nil;
                        if v219 == true then
                            v226 = l_KeystoreConstants_0.Experiment;
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v224.id)));
                        else
                            v226 = l_KeystoreConstants_0.Control;
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v224.id)));
                        end;
                        v225 = l_HttpService_0:JSONEncode({
                            server = tostring(l_ContentProvider_0.BaseUrl), 
                            username = tostring(v221.cvalue), 
                            userId = tostring(v224.id), 
                            password = tostring(v221.password), 
                            experimentGroup = tostring(v226)
                        });
                    end;
                    return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v225, l_KeystoreConstants_0.KeystoreTimeout);
                end):andThen(function(_) --[[ Line: 743 ]]
                    -- upvalues: v217 (copy)
                    v217();
                end):catch(function(v228) --[[ Line: 746 ]]
                    -- upvalues: v218 (copy)
                    v218(v228);
                end);
                return;
            end;
        end);
    end;
    local function v250(v230, v231, v232) --[[ Line: 752 ]]
        -- upvalues: v126 (copy), l_SetBackNavigationDisabled_0 (ref), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v127 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (copy), v63 (ref), v187 (copy), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (copy), l_LaunchApp_0 (copy), v128 (copy), v131 (copy), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
        local _ = v126(l_SetBackNavigationDisabled_0(false));
        v12.new(function(v234, v235) --[[ Line: 638 ]]
            -- upvalues: l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v231 (copy), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v127 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v12 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref)
            if l_GetFFlagKeystoreAutoLoginAvailable_0() == false or v231 == nil then
                v234();
                return;
            else
                local v236 = l_GetFFlagRemoveKeystoreIxpLogic_0() and true or v122.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                local v237 = l_HttpService_0:JSONEncode({
                    server = l_ContentProvider_0.BaseUrl
                });
                local v238 = l_HttpService_0:JSONDecode(v231);
                l_GetUserByUsername_0(v127, v238.cvalue)():andThen(function(v239) --[[ Line: 660 ]]
                    -- upvalues: v235 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v237 (copy), v12 (ref)
                    if not v239 or not v239.id then
                        return v235("Invalid usernameInfo");
                    elseif l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                        return l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v240) --[[ Line: 670 ]]
                            -- upvalues: l_default_0 (ref), v237 (ref), l_KeystoreConstants_0 (ref), v12 (ref)
                            if v240 and v240.keystore and v240.keystore.isAvailable then
                                return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v237, l_KeystoreConstants_0.KeystoreTimeout);
                            else
                                return v12.resolve(nil);
                            end;
                        end):andThen(function() --[[ Line: 685 ]]
                            -- upvalues: v239 (copy)
                            return v239;
                        end);
                    else
                        return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v237, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 693 ]]
                            -- upvalues: v239 (copy)
                            return v239;
                        end);
                    end;
                end):andThen(function(v241) --[[ Line: 698 ]]
                    -- upvalues: l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v238 (copy), v236 (copy), l_KeystoreConstants_0 (ref), l_default_0 (ref)
                    local v242 = nil;
                    if l_GetFFlagRemoveKeystoreIxpLogic_0() then
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentials, (tostring(v241.id)));
                        v242 = l_HttpService_0:JSONEncode({
                            server = tostring(l_ContentProvider_0.BaseUrl), 
                            username = tostring(v238.cvalue), 
                            userId = tostring(v241.id), 
                            password = tostring(v238.password)
                        });
                    else
                        local v243 = nil;
                        if v236 == true then
                            v243 = l_KeystoreConstants_0.Experiment;
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v241.id)));
                        else
                            v243 = l_KeystoreConstants_0.Control;
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v241.id)));
                        end;
                        v242 = l_HttpService_0:JSONEncode({
                            server = tostring(l_ContentProvider_0.BaseUrl), 
                            username = tostring(v238.cvalue), 
                            userId = tostring(v241.id), 
                            password = tostring(v238.password), 
                            experimentGroup = tostring(v243)
                        });
                    end;
                    return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v242, l_KeystoreConstants_0.KeystoreTimeout);
                end):andThen(function(_) --[[ Line: 743 ]]
                    -- upvalues: v234 (copy)
                    v234();
                end):catch(function(v245) --[[ Line: 746 ]]
                    -- upvalues: v235 (copy)
                    v235(v245);
                end);
                return;
            end;
        end):finally(function() --[[ Line: 755 ]]
            -- upvalues: l_LoginResult_0 (ref), v230 (copy), v126 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (ref), v231 (copy), v232 (copy), v63 (ref), v187 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (ref), l_LaunchApp_0 (ref), v127 (ref), v128 (ref), v131 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
            if l_LoginResult_0.hasTwoStepData(v230) then
                local _ = v126(l_SetLoginResult_0(v230));
                l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTwoStepVerification, 1);
                spawn(function() --[[ Line: 762 ]]
                    -- upvalues: v205 (ref), v230 (ref), v231 (ref), v232 (ref)
                    v205(v230, v231, v232);
                end);
            else
                l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Success, 1);
                if v231 then
                    if v63 then
                        local v247 = v187(v231);
                        if v247 then
                            v247:await();
                        end;
                    else
                        v187(v231);
                    end;
                end;
                if l_FFlagEnableLuaAccountSwitch_0 then
                    v179(v230.accountBlob);
                else
                    local _ = v126(l_LaunchApp_0(v127, nil, v128, v131, l_LaunchContext_0.Login));
                end;
            end;
            if l_GetFFlagEnableLoginAccountSelector_0() then
                local _ = v126(l_CloseCentralOverlay_0());
            end;
        end);
    end;
    local v251 = nil;
    local function v252(v253, v254, v255, v256, v257, v258, v259) --[[ Line: 796 ]] --[[ Name: handleLoginWithFormData ]]
        -- upvalues: v251 (ref), v118 (copy), v126 (copy), l_SetBackNavigationDisabled_0 (ref), v252 (copy), v163 (copy), v127 (copy), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), v145 (copy), l_HttpService_0 (ref), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (copy), v63 (ref), v187 (copy), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (copy), l_LaunchApp_0 (copy), v128 (copy), v131 (copy), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref), l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (ref)
        local v260 = v251(v259);
        local v261 = v253 or v118.userIdentifier;
        local _ = v126(l_SetBackNavigationDisabled_0(true));
        return v163(v127, v261, v254, function(v263, v264) --[[ Line: 811 ]]
            -- upvalues: v252 (ref), v253 (copy), v254 (copy), v256 (copy), v257 (copy), v258 (copy), v259 (copy)
            if v263 then
                v252(v253, v254, v264, v256, v257, v258, v259);
            end;
        end, v255, function(v265) --[[ Line: 825 ]]
            -- upvalues: v252 (ref), v253 (copy), v254 (copy), v255 (copy), v257 (copy), v258 (copy), v259 (copy)
            v252(v253, v254, v255, v265, v257, v258, v259);
        end, v256, v257, v118.forceLoginByUsername):andThen(function(v266) --[[ Line: 847 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), v261 (copy), l_FFlagEnablePWManagerLoginCheck_0 (ref), v145 (ref), v258 (copy), l_HttpService_0 (ref), v254 (copy), v259 (copy), v126 (ref), l_SetBackNavigationDisabled_0 (ref), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v127 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (ref), v63 (ref), v187 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (ref), l_LaunchApp_0 (ref), v128 (ref), v131 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
            l_AppStorageService_0:SetItem(l_AuthLocalStorageKeys_0.CredentialValue, v261);
            l_AppStorageService_0:Flush();
            if l_FFlagEnablePWManagerLoginCheck_0 and v145 then
                v145.setLoggedinUsingSavedPassword(true);
            end;
            local v267 = if not v258 then l_HttpService_0:JSONEncode({
                cvalue = v261, 
                password = v254, 
                authType = "login"
            }) else nil;
            local l_v259_0 = v259;
            local _ = v126(l_SetBackNavigationDisabled_0(false));
            v12.new(function(v270, v271) --[[ Line: 638 ]]
                -- upvalues: l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v267 (copy), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v127 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v12 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref)
                if l_GetFFlagKeystoreAutoLoginAvailable_0() == false or v267 == nil then
                    v270();
                    return;
                else
                    local v272 = l_GetFFlagRemoveKeystoreIxpLogic_0() and true or v122.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                    local v273 = l_HttpService_0:JSONEncode({
                        server = l_ContentProvider_0.BaseUrl
                    });
                    local v274 = l_HttpService_0:JSONDecode(v267);
                    l_GetUserByUsername_0(v127, v274.cvalue)():andThen(function(v275) --[[ Line: 660 ]]
                        -- upvalues: v271 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v273 (copy), v12 (ref)
                        if not v275 or not v275.id then
                            return v271("Invalid usernameInfo");
                        elseif l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                            return l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v276) --[[ Line: 670 ]]
                                -- upvalues: l_default_0 (ref), v273 (ref), l_KeystoreConstants_0 (ref), v12 (ref)
                                if v276 and v276.keystore and v276.keystore.isAvailable then
                                    return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v273, l_KeystoreConstants_0.KeystoreTimeout);
                                else
                                    return v12.resolve(nil);
                                end;
                            end):andThen(function() --[[ Line: 685 ]]
                                -- upvalues: v275 (copy)
                                return v275;
                            end);
                        else
                            return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v273, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 693 ]]
                                -- upvalues: v275 (copy)
                                return v275;
                            end);
                        end;
                    end):andThen(function(v277) --[[ Line: 698 ]]
                        -- upvalues: l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v274 (copy), v272 (copy), l_KeystoreConstants_0 (ref), l_default_0 (ref)
                        local v278 = nil;
                        if l_GetFFlagRemoveKeystoreIxpLogic_0() then
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentials, (tostring(v277.id)));
                            v278 = l_HttpService_0:JSONEncode({
                                server = tostring(l_ContentProvider_0.BaseUrl), 
                                username = tostring(v274.cvalue), 
                                userId = tostring(v277.id), 
                                password = tostring(v274.password)
                            });
                        else
                            local v279 = nil;
                            if v272 == true then
                                v279 = l_KeystoreConstants_0.Experiment;
                                l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v277.id)));
                            else
                                v279 = l_KeystoreConstants_0.Control;
                                l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v277.id)));
                            end;
                            v278 = l_HttpService_0:JSONEncode({
                                server = tostring(l_ContentProvider_0.BaseUrl), 
                                username = tostring(v274.cvalue), 
                                userId = tostring(v277.id), 
                                password = tostring(v274.password), 
                                experimentGroup = tostring(v279)
                            });
                        end;
                        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v278, l_KeystoreConstants_0.KeystoreTimeout);
                    end):andThen(function(_) --[[ Line: 743 ]]
                        -- upvalues: v270 (copy)
                        v270();
                    end):catch(function(v281) --[[ Line: 746 ]]
                        -- upvalues: v271 (copy)
                        v271(v281);
                    end);
                    return;
                end;
            end):finally(function() --[[ Line: 755 ]]
                -- upvalues: l_LoginResult_0 (ref), v266 (copy), v126 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (ref), v267 (copy), l_v259_0 (copy), v63 (ref), v187 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (ref), l_LaunchApp_0 (ref), v127 (ref), v128 (ref), v131 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
                if l_LoginResult_0.hasTwoStepData(v266) then
                    local _ = v126(l_SetLoginResult_0(v266));
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTwoStepVerification, 1);
                    spawn(function() --[[ Line: 762 ]]
                        -- upvalues: v205 (ref), v266 (ref), v267 (ref), l_v259_0 (ref)
                        v205(v266, v267, l_v259_0);
                    end);
                else
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Success, 1);
                    if v267 then
                        if v63 then
                            local v283 = v187(v267);
                            if v283 then
                                v283:await();
                            end;
                        else
                            v187(v267);
                        end;
                    end;
                    if l_FFlagEnableLuaAccountSwitch_0 then
                        v179(v266.accountBlob);
                    else
                        local _ = v126(l_LaunchApp_0(v127, nil, v128, v131, l_LaunchContext_0.Login));
                    end;
                end;
                if l_GetFFlagEnableLoginAccountSelector_0() then
                    local _ = v126(l_CloseCentralOverlay_0());
                end;
            end);
        end, function(v286) --[[ Line: 864 ]]
            -- upvalues: v260 (copy), v261 (copy), v254 (copy), l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (ref)
            v260(v286, v261, v254, l_FFlagEnableNavigateToLoginAfterLogoutAll_0 and true or nil);
        end);
    end;
    local function v314(v287, v288, v289) --[[ Line: 869 ]]
        -- upvalues: v251 (ref), v126 (copy), l_SetBackNavigationDisabled_0 (ref), l_LoginByPasskey_0 (ref), v127 (copy), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (copy), v63 (ref), v187 (copy), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (copy), l_LaunchApp_0 (copy), v128 (copy), v131 (copy), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
        local v290 = v251(v289);
        local _ = v126(l_SetBackNavigationDisabled_0(true));
        return v126(l_LoginByPasskey_0(v127, v287, v288)):andThen(function(v292) --[[ Line: 874 ]]
            -- upvalues: v289 (copy), v126 (ref), l_SetBackNavigationDisabled_0 (ref), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v127 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (ref), v63 (ref), v187 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (ref), l_LaunchApp_0 (ref), v128 (ref), v131 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
            local l_v289_0 = v289;
            local v294 = v126(l_SetBackNavigationDisabled_0(false));
            v294 = v12.new;
            local v295 = nil;
            v294 = v294(function(v296, v297) --[[ Line: 638 ]]
                -- upvalues: l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v295 (copy), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v127 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v12 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref)
                if l_GetFFlagKeystoreAutoLoginAvailable_0() == false or v295 == nil then
                    v296();
                    return;
                else
                    local v298 = l_GetFFlagRemoveKeystoreIxpLogic_0() and true or v122.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                    local v299 = l_HttpService_0:JSONEncode({
                        server = l_ContentProvider_0.BaseUrl
                    });
                    local v300 = l_HttpService_0:JSONDecode(v295);
                    l_GetUserByUsername_0(v127, v300.cvalue)():andThen(function(v301) --[[ Line: 660 ]]
                        -- upvalues: v297 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v299 (copy), v12 (ref)
                        if not v301 or not v301.id then
                            return v297("Invalid usernameInfo");
                        elseif l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                            return l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v302) --[[ Line: 670 ]]
                                -- upvalues: l_default_0 (ref), v299 (ref), l_KeystoreConstants_0 (ref), v12 (ref)
                                if v302 and v302.keystore and v302.keystore.isAvailable then
                                    return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v299, l_KeystoreConstants_0.KeystoreTimeout);
                                else
                                    return v12.resolve(nil);
                                end;
                            end):andThen(function() --[[ Line: 685 ]]
                                -- upvalues: v301 (copy)
                                return v301;
                            end);
                        else
                            return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v299, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 693 ]]
                                -- upvalues: v301 (copy)
                                return v301;
                            end);
                        end;
                    end):andThen(function(v303) --[[ Line: 698 ]]
                        -- upvalues: l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v300 (copy), v298 (copy), l_KeystoreConstants_0 (ref), l_default_0 (ref)
                        local v304 = nil;
                        if l_GetFFlagRemoveKeystoreIxpLogic_0() then
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentials, (tostring(v303.id)));
                            v304 = l_HttpService_0:JSONEncode({
                                server = tostring(l_ContentProvider_0.BaseUrl), 
                                username = tostring(v300.cvalue), 
                                userId = tostring(v303.id), 
                                password = tostring(v300.password)
                            });
                        else
                            local v305 = nil;
                            if v298 == true then
                                v305 = l_KeystoreConstants_0.Experiment;
                                l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v303.id)));
                            else
                                v305 = l_KeystoreConstants_0.Control;
                                l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v303.id)));
                            end;
                            v304 = l_HttpService_0:JSONEncode({
                                server = tostring(l_ContentProvider_0.BaseUrl), 
                                username = tostring(v300.cvalue), 
                                userId = tostring(v303.id), 
                                password = tostring(v300.password), 
                                experimentGroup = tostring(v305)
                            });
                        end;
                        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v304, l_KeystoreConstants_0.KeystoreTimeout);
                    end):andThen(function(_) --[[ Line: 743 ]]
                        -- upvalues: v296 (copy)
                        v296();
                    end):catch(function(v307) --[[ Line: 746 ]]
                        -- upvalues: v297 (copy)
                        v297(v307);
                    end);
                    return;
                end;
            end);
            local v308 = nil;
            v294:finally(function() --[[ Line: 755 ]]
                -- upvalues: l_LoginResult_0 (ref), v292 (copy), v126 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (ref), v308 (copy), l_v289_0 (copy), v63 (ref), v187 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (ref), l_LaunchApp_0 (ref), v127 (ref), v128 (ref), v131 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
                if l_LoginResult_0.hasTwoStepData(v292) then
                    local _ = v126(l_SetLoginResult_0(v292));
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTwoStepVerification, 1);
                    spawn(function() --[[ Line: 762 ]]
                        -- upvalues: v205 (ref), v292 (ref), v308 (ref), l_v289_0 (ref)
                        v205(v292, v308, l_v289_0);
                    end);
                else
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Success, 1);
                    if v308 then
                        if v63 then
                            local v310 = v187(v308);
                            if v310 then
                                v310:await();
                            end;
                        else
                            v187(v308);
                        end;
                    end;
                    if l_FFlagEnableLuaAccountSwitch_0 then
                        v179(v292.accountBlob);
                    else
                        local _ = v126(l_LaunchApp_0(v127, nil, v128, v131, l_LaunchContext_0.Login));
                    end;
                end;
                if l_GetFFlagEnableLoginAccountSelector_0() then
                    local _ = v126(l_CloseCentralOverlay_0());
                end;
            end);
        end, function(v313) --[[ Line: 876 ]]
            -- upvalues: v290 (copy), v287 (copy)
            v290(v313, v287, nil);
        end);
    end;
    local function v315(v316, v317, v318, v319, v320) --[[ Line: 881 ]] --[[ Name: handleLoginWithCode ]]
        -- upvalues: v251 (ref), v126 (copy), l_SetBackNavigationDisabled_0 (ref), v315 (copy), l_LoginByCode_0 (ref), v127 (copy), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (copy), v63 (ref), v187 (copy), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (copy), l_LaunchApp_0 (copy), v128 (copy), v131 (copy), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
        local v321 = v251(v320);
        local _ = v126(l_SetBackNavigationDisabled_0(true));
        return v126(l_LoginByCode_0(v127, v316, v317, function(v323, v324) --[[ Line: 892 ]]
            -- upvalues: v315 (ref), v316 (copy), v317 (copy), v320 (copy)
            if v323 then
                v315(v316, v317, v324, nil, v320);
            end;
        end, v318, function(v325) --[[ Line: 898 ]]
            -- upvalues: v315 (ref), v316 (copy), v317 (copy), v320 (copy)
            v315(v316, v317, nil, v325, v320);
        end, v319)):andThen(function(v326) --[[ Line: 909 ]]
            -- upvalues: v320 (copy), v126 (ref), l_SetBackNavigationDisabled_0 (ref), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v127 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (ref), v63 (ref), v187 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (ref), l_LaunchApp_0 (ref), v128 (ref), v131 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
            local l_v320_0 = v320;
            local v328 = v126(l_SetBackNavigationDisabled_0(false));
            v328 = v12.new;
            local v329 = nil;
            v328 = v328(function(v330, v331) --[[ Line: 638 ]]
                -- upvalues: l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v329 (copy), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v127 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v12 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref)
                if l_GetFFlagKeystoreAutoLoginAvailable_0() == false or v329 == nil then
                    v330();
                    return;
                else
                    local v332 = l_GetFFlagRemoveKeystoreIxpLogic_0() and true or v122.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                    local v333 = l_HttpService_0:JSONEncode({
                        server = l_ContentProvider_0.BaseUrl
                    });
                    local v334 = l_HttpService_0:JSONDecode(v329);
                    l_GetUserByUsername_0(v127, v334.cvalue)():andThen(function(v335) --[[ Line: 660 ]]
                        -- upvalues: v331 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v333 (copy), v12 (ref)
                        if not v335 or not v335.id then
                            return v331("Invalid usernameInfo");
                        elseif l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                            return l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v336) --[[ Line: 670 ]]
                                -- upvalues: l_default_0 (ref), v333 (ref), l_KeystoreConstants_0 (ref), v12 (ref)
                                if v336 and v336.keystore and v336.keystore.isAvailable then
                                    return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v333, l_KeystoreConstants_0.KeystoreTimeout);
                                else
                                    return v12.resolve(nil);
                                end;
                            end):andThen(function() --[[ Line: 685 ]]
                                -- upvalues: v335 (copy)
                                return v335;
                            end);
                        else
                            return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v333, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 693 ]]
                                -- upvalues: v335 (copy)
                                return v335;
                            end);
                        end;
                    end):andThen(function(v337) --[[ Line: 698 ]]
                        -- upvalues: l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v334 (copy), v332 (copy), l_KeystoreConstants_0 (ref), l_default_0 (ref)
                        local v338 = nil;
                        if l_GetFFlagRemoveKeystoreIxpLogic_0() then
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentials, (tostring(v337.id)));
                            v338 = l_HttpService_0:JSONEncode({
                                server = tostring(l_ContentProvider_0.BaseUrl), 
                                username = tostring(v334.cvalue), 
                                userId = tostring(v337.id), 
                                password = tostring(v334.password)
                            });
                        else
                            local v339 = nil;
                            if v332 == true then
                                v339 = l_KeystoreConstants_0.Experiment;
                                l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v337.id)));
                            else
                                v339 = l_KeystoreConstants_0.Control;
                                l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v337.id)));
                            end;
                            v338 = l_HttpService_0:JSONEncode({
                                server = tostring(l_ContentProvider_0.BaseUrl), 
                                username = tostring(v334.cvalue), 
                                userId = tostring(v337.id), 
                                password = tostring(v334.password), 
                                experimentGroup = tostring(v339)
                            });
                        end;
                        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v338, l_KeystoreConstants_0.KeystoreTimeout);
                    end):andThen(function(_) --[[ Line: 743 ]]
                        -- upvalues: v330 (copy)
                        v330();
                    end):catch(function(v341) --[[ Line: 746 ]]
                        -- upvalues: v331 (copy)
                        v331(v341);
                    end);
                    return;
                end;
            end);
            local v342 = nil;
            v328:finally(function() --[[ Line: 755 ]]
                -- upvalues: l_LoginResult_0 (ref), v326 (copy), v126 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (ref), v342 (copy), l_v320_0 (copy), v63 (ref), v187 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (ref), l_LaunchApp_0 (ref), v127 (ref), v128 (ref), v131 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
                if l_LoginResult_0.hasTwoStepData(v326) then
                    local _ = v126(l_SetLoginResult_0(v326));
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTwoStepVerification, 1);
                    spawn(function() --[[ Line: 762 ]]
                        -- upvalues: v205 (ref), v326 (ref), v342 (ref), l_v320_0 (ref)
                        v205(v326, v342, l_v320_0);
                    end);
                else
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Success, 1);
                    if v342 then
                        if v63 then
                            local v344 = v187(v342);
                            if v344 then
                                v344:await();
                            end;
                        else
                            v187(v342);
                        end;
                    end;
                    if l_FFlagEnableLuaAccountSwitch_0 then
                        v179(v326.accountBlob);
                    else
                        local _ = v126(l_LaunchApp_0(v127, nil, v128, v131, l_LaunchContext_0.Login));
                    end;
                end;
                if l_GetFFlagEnableLoginAccountSelector_0() then
                    local _ = v126(l_CloseCentralOverlay_0());
                end;
            end);
        end, function(v347) --[[ Line: 911 ]]
            -- upvalues: l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v321 (copy), v316 (copy), v317 (copy)
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureAuthCode, 1);
            v321(v347, v316, v317);
        end);
    end;
    local function v348(v349, v350, v351, v352, v353) --[[ Line: 917 ]] --[[ Name: handleLoginWithOtp ]]
        -- upvalues: v251 (ref), v126 (copy), l_SetBackNavigationDisabled_0 (ref), v348 (copy), l_LoginByOtp_0 (ref), v127 (copy), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), v118 (copy), l_FFlagEnableRecordLogin_0 (ref), l_recordLogin_0 (ref), l_LoginMethods_0 (ref), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (copy), v63 (ref), v187 (copy), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (copy), l_LaunchApp_0 (copy), v128 (copy), v131 (copy), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
        local v354 = v251(v353);
        local _ = v126(l_SetBackNavigationDisabled_0(true));
        return v126(l_LoginByOtp_0(v127, v349, v350, function(v356) --[[ Line: 928 ]]
            -- upvalues: v348 (ref), v349 (copy), v350 (copy), v352 (copy), v353 (copy)
            v348(v349, v350, v356, v352, v353);
        end, v351, v352)):andThen(function(v357) --[[ Line: 933 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), v118 (ref), l_FFlagEnableRecordLogin_0 (ref), l_recordLogin_0 (ref), l_LoginMethods_0 (ref), v353 (copy), v126 (ref), l_SetBackNavigationDisabled_0 (ref), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v127 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (ref), v63 (ref), v187 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (ref), l_LaunchApp_0 (ref), v128 (ref), v131 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
            l_AppStorageService_0:SetItem(l_AuthLocalStorageKeys_0.CredentialValue, v118.userIdentifier);
            if l_FFlagEnableRecordLogin_0 then
                pcall(function() --[[ Line: 936 ]]
                    -- upvalues: l_recordLogin_0 (ref), v357 (copy), l_LoginMethods_0 (ref), v118 (ref)
                    l_recordLogin_0(v357, l_LoginMethods_0.EmailOtp, v118.userIdentifier);
                end);
            end;
            local l_v353_0 = v353;
            local v359 = v126(l_SetBackNavigationDisabled_0(false));
            v359 = v12.new;
            local v360 = nil;
            v359 = v359(function(v361, v362) --[[ Line: 638 ]]
                -- upvalues: l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v360 (copy), l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), v122 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v127 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v12 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref)
                if l_GetFFlagKeystoreAutoLoginAvailable_0() == false or v360 == nil then
                    v361();
                    return;
                else
                    local v363 = l_GetFFlagRemoveKeystoreIxpLogic_0() and true or v122.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                    local v364 = l_HttpService_0:JSONEncode({
                        server = l_ContentProvider_0.BaseUrl
                    });
                    local v365 = l_HttpService_0:JSONDecode(v360);
                    l_GetUserByUsername_0(v127, v365.cvalue)():andThen(function(v366) --[[ Line: 660 ]]
                        -- upvalues: v362 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v364 (copy), v12 (ref)
                        if not v366 or not v366.id then
                            return v362("Invalid usernameInfo");
                        elseif l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                            return l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v367) --[[ Line: 670 ]]
                                -- upvalues: l_default_0 (ref), v364 (ref), l_KeystoreConstants_0 (ref), v12 (ref)
                                if v367 and v367.keystore and v367.keystore.isAvailable then
                                    return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v364, l_KeystoreConstants_0.KeystoreTimeout);
                                else
                                    return v12.resolve(nil);
                                end;
                            end):andThen(function() --[[ Line: 685 ]]
                                -- upvalues: v366 (copy)
                                return v366;
                            end);
                        else
                            return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v364, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 693 ]]
                                -- upvalues: v366 (copy)
                                return v366;
                            end);
                        end;
                    end):andThen(function(v368) --[[ Line: 698 ]]
                        -- upvalues: l_GetFFlagRemoveKeystoreIxpLogic_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v365 (copy), v363 (copy), l_KeystoreConstants_0 (ref), l_default_0 (ref)
                        local v369 = nil;
                        if l_GetFFlagRemoveKeystoreIxpLogic_0() then
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentials, (tostring(v368.id)));
                            v369 = l_HttpService_0:JSONEncode({
                                server = tostring(l_ContentProvider_0.BaseUrl), 
                                username = tostring(v365.cvalue), 
                                userId = tostring(v368.id), 
                                password = tostring(v365.password)
                            });
                        else
                            local v370 = nil;
                            if v363 == true then
                                v370 = l_KeystoreConstants_0.Experiment;
                                l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v368.id)));
                            else
                                v370 = l_KeystoreConstants_0.Control;
                                l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v368.id)));
                            end;
                            v369 = l_HttpService_0:JSONEncode({
                                server = tostring(l_ContentProvider_0.BaseUrl), 
                                username = tostring(v365.cvalue), 
                                userId = tostring(v368.id), 
                                password = tostring(v365.password), 
                                experimentGroup = tostring(v370)
                            });
                        end;
                        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v369, l_KeystoreConstants_0.KeystoreTimeout);
                    end):andThen(function(_) --[[ Line: 743 ]]
                        -- upvalues: v361 (copy)
                        v361();
                    end):catch(function(v372) --[[ Line: 746 ]]
                        -- upvalues: v362 (copy)
                        v362(v372);
                    end);
                    return;
                end;
            end);
            local v373 = nil;
            v359:finally(function() --[[ Line: 755 ]]
                -- upvalues: l_LoginResult_0 (ref), v357 (copy), v126 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v205 (ref), v373 (copy), l_v353_0 (copy), v63 (ref), v187 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (ref), l_LaunchApp_0 (ref), v127 (ref), v128 (ref), v131 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
                if l_LoginResult_0.hasTwoStepData(v357) then
                    local _ = v126(l_SetLoginResult_0(v357));
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTwoStepVerification, 1);
                    spawn(function() --[[ Line: 762 ]]
                        -- upvalues: v205 (ref), v357 (ref), v373 (ref), l_v353_0 (ref)
                        v205(v357, v373, l_v353_0);
                    end);
                else
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Success, 1);
                    if v373 then
                        if v63 then
                            local v375 = v187(v373);
                            if v375 then
                                v375:await();
                            end;
                        else
                            v187(v373);
                        end;
                    end;
                    if l_FFlagEnableLuaAccountSwitch_0 then
                        v179(v357.accountBlob);
                    else
                        local _ = v126(l_LaunchApp_0(v127, nil, v128, v131, l_LaunchContext_0.Login));
                    end;
                end;
                if l_GetFFlagEnableLoginAccountSelector_0() then
                    local _ = v126(l_CloseCentralOverlay_0());
                end;
            end);
        end, function(v378) --[[ Line: 942 ]]
            -- upvalues: v354 (copy), v349 (copy), v350 (copy)
            v354(v378, v349, v350);
        end);
    end;
    local function v387(v379, v380) --[[ Line: 948 ]]
        -- upvalues: v126 (copy), l_SetBackNavigationDisabled_0 (ref), l_Constants_1 (ref), v118 (copy), l_SendCode_0 (ref), v127 (copy)
        local v381 = v126(l_SetBackNavigationDisabled_0(true));
        v381 = {
            origin = l_Constants_1.otpServiceOrigin, 
            contactType = l_Constants_1.otpServiceContactType, 
            contactValue = v118.userIdentifier
        };
        return v126(l_SendCode_0(v127, v381)):andThen(function(v382) --[[ Line: 959 ]]
            -- upvalues: v379 (copy)
            v379(v382.otpSessionToken);
        end, function(v383) --[[ Line: 962 ]]
            -- upvalues: v380 (copy), l_Constants_1 (ref)
            v380.setInProgress(false);
            local v384 = tonumber(v383) or 0;
            local v385 = l_Constants_1.statusCodeMap[v384] or "Unknown";
            local v386 = l_Constants_1.errorMessageKeys[v385] or l_Constants_1.errorMessageKeys.Unknown;
            v380.setErrorKey(v386);
        end);
    end;
    local function v397(v388, v389, v390) --[[ Line: 971 ]]
        -- upvalues: v126 (copy), l_SetBackNavigationDisabled_0 (ref), l_Constants_1 (ref), l_ResendCode_0 (ref), v127 (copy)
        local v391 = v126(l_SetBackNavigationDisabled_0(true));
        v391 = {
            origin = l_Constants_1.otpServiceOrigin, 
            contactType = l_Constants_1.otpServiceContactType, 
            otpSessionToken = v388
        };
        return v126(l_ResendCode_0(v127, v391)):andThen(function(v392) --[[ Line: 983 ]]
            -- upvalues: v389 (copy)
            v389(v392.otpSessionToken);
        end, function(v393) --[[ Line: 986 ]]
            -- upvalues: v390 (copy), l_Constants_1 (ref)
            v390.setInProgress(false);
            local v394 = tonumber(v393) or 0;
            local v395 = l_Constants_1.statusCodeMap[v394] or "Unknown";
            local v396 = l_Constants_1.errorMessageKeys[v395] or l_Constants_1.errorMessageKeys.Unknown;
            v390.setErrorKey(v396);
        end);
    end;
    local function v417(v398, v399, v400) --[[ Line: 995 ]]
        -- upvalues: v137 (copy), v118 (copy), v135 (copy), l_HttpService_0 (ref), l_Constants_0 (ref), l_UserInputService_0 (ref), l_Base64_0 (ref), l_default_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), v314 (copy)
        local v401 = v399 and function() --[[ Line: 1002 ]]
            -- upvalues: v137 (ref), v118 (ref)
            return v137({
                cvalue = v118.userIdentifier, 
                ctype = v118.userIdentifierType
            });
        end or function() --[[ Line: 1008 ]]
            -- upvalues: v135 (ref)
            return v135();
        end;
        local v402 = false;
        return v401():andThen(function(v403) --[[ Line: 1015 ]]
            -- upvalues: l_HttpService_0 (ref), l_Constants_0 (ref), v400 (copy), l_UserInputService_0 (ref), l_Base64_0 (ref), l_default_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), v398 (copy), v402 (ref), v314 (ref)
            local v404 = l_HttpService_0:JSONDecode(v403.authenticationOptions);
            local l_sessionId_0 = v403.sessionId;
            local v406 = tonumber(v404.publicKey.timeout);
            local v407 = if v406 then v406 / 1000 else l_Constants_0.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT;
            v404.keyType = "platform";
            v404.deviceBoundOnly = v400;
            if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                v404.publicKey.challenge = l_Base64_0.FromUrlSafeBase64(v404.publicKey.challenge);
                if v404.publicKey.allowCredentials then
                    for _, v409 in ipairs(v404.publicKey.allowCredentials) do
                        v409.id = l_Base64_0.FromUrlSafeBase64(v409.id);
                    end;
                end;
            end;
            local v410 = l_HttpService_0:JSONEncode(v404);
            l_default_0:getCredentials(l_default_0.CredentialsTypes.FIDO2, v410, v407):andThen(function(v411) --[[ Line: 1041 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), l_Base64_0 (ref), v398 (ref), v402 (ref), v314 (ref), l_sessionId_0 (copy)
                if v411 ~= nil then
                    local v412 = l_HttpService_0:JSONDecode(v411);
                    if v412 == nil or next(v412) == nil then
                        l_Logger_0:info("Passkey credential signing failed. No result returned.");
                        return;
                    elseif v412.errorCode ~= nil then
                        l_Logger_0:info("Passkey credential signing failed. Error {} (msg: {}) returned.", v412.errorCode, v412.errorMsg);
                        if l_FFlagUseErrorTypeForPasskeyLoginLogging_0 then
                            local v413 = tonumber(v412.errorCode);
                            local v414 = l_CredentialsProtocolErrorCodes_0.GetCredentialsErrorCodes[v413 or -1] or string.format(l_CredentialsProtocolErrorCodes_0.UNMAPPED_ERROR_CODE, (tostring(v412.errorCode)));
                            l_authClientError_0(l_EventStreamConstants_0.Context.PasskeyLoginAttempt, v414, l_PasskeyConstants_0.PASSKEY_FETCH_LOGIN_V2);
                            return;
                        elseif l_FFlagEnablePasskeyLoginErrorLogging_0 and type(v412.errorMsg) == "string" then
                            l_authClientError_0(l_EventStreamConstants_0.Context.PasskeyLoginAttempt, v412.errorMsg, l_PasskeyConstants_0.PASSKEY_FETCH_LOGIN_V2);
                            return;
                        end;
                    else
                        l_Logger_0:info("Passkey credential signing completed. Attempting login.");
                        v412.id = l_Base64_0.ToUrlSafeBase64(v412.id);
                        v412.rawId = l_Base64_0.ToUrlSafeBase64(v412.rawId);
                        v412.response.signature = l_Base64_0.ToUrlSafeBase64(v412.response.signature);
                        v412.response.userHandle = l_Base64_0.ToUrlSafeBase64(v412.response.userHandle);
                        v412.response.authenticatorData = l_Base64_0.ToUrlSafeBase64(v412.response.authenticatorData);
                        v412.response.clientDataJSON = l_Base64_0.ToUrlSafeBase64(v412.response.clientDataJSON);
                        v398.setInProgress(true);
                        v402 = true;
                        v314(v412, l_sessionId_0, v398);
                    end;
                end;
            end, function(v415) --[[ Line: 1091 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Passkey credential signing failed. Error: {}", v415);
            end):await();
        end, function(v416) --[[ Line: 1095 ]]
            -- upvalues: l_Logger_0 (ref), v399 (copy), v400 (copy), v398 (copy)
            l_Logger_0:warning("Fetching passkey login options failed with error code: {}", v416.errorCode);
            if v399 and not v400 then
                v398.setErrorKey("Authentication.Login.Response.UnableToSignIn");
            end;
        end):finally(function() --[[ Line: 1102 ]]
            -- upvalues: v398 (copy), v402 (ref)
            if v398.onCredentialsPopupAbandoned and not v402 then
                v398.onCredentialsPopupAbandoned();
            end;
        end);
    end;
    local function v439(v418, v419, v420, v421) --[[ Line: 1109 ]]
        -- upvalues: v137 (copy), v118 (copy), v135 (copy), l_HttpService_0 (ref), l_Constants_0 (ref), l_UserInputService_0 (ref), l_Base64_0 (ref), l_Logger_0 (ref), l_default_1 (ref), l_TelemetryConfigs_0 (ref), l_default_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), l_PasskeyConstants_0 (ref), v252 (copy), v314 (copy)
        if not v418 and not v419 then
            return;
        else
            local v422 = v420 and function() --[[ Line: 1121 ]]
                -- upvalues: v137 (ref), v118 (ref)
                return v137({
                    cvalue = v118.userIdentifier, 
                    ctype = v118.userIdentifierType
                });
            end or function() --[[ Line: 1127 ]]
                -- upvalues: v135 (ref)
                return v135();
            end;
            local v423 = nil;
            local v424 = nil;
            local v425 = nil;
            local v426 = {};
            if v418 then
                v422():andThen(function(v427) --[[ Line: 1137 ]]
                    -- upvalues: v423 (ref), l_HttpService_0 (ref), v424 (ref), v425 (ref), l_Constants_0 (ref), l_UserInputService_0 (ref), l_Base64_0 (ref)
                    v423 = l_HttpService_0:JSONDecode(v427.authenticationOptions);
                    v424 = v427.sessionId;
                    v425 = tonumber(v423.publicKey.timeout) or l_Constants_0.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT;
                    v423.keyType = "platform";
                    v423.deviceBoundOnly = true;
                    if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                        v423.publicKey.challenge = l_Base64_0.FromUrlSafeBase64(v423.publicKey.challenge);
                        if v423.publicKey.allowCredentials then
                            for _, v429 in ipairs(v423.publicKey.allowCredentials) do
                                v429.id = l_Base64_0.FromUrlSafeBase64(v429.id);
                            end;
                        end;
                    end;
                end, function(v430) --[[ Line: 1158 ]]
                    -- upvalues: l_Logger_0 (ref)
                    l_Logger_0:warning("Fetching passkey login options failed with error code: {}", v430.errorCode);
                end):await();
                if v423 ~= nil then
                    v426.FIDO2 = v423;
                end;
            end;
            if v419 then
                v426.password = {};
                if v420 then
                    v426.password.username = v118.userIdentifier;
                end;
            end;
            local v431 = if v425 then v425 / 1000 else l_Constants_0.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT;
            local v432 = false;
            local v433 = l_HttpService_0:JSONEncode(v426);
            l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginCredentialSheetShownConfig, 1);
            return l_default_0:getCredentials(l_default_0.CredentialsTypes.all, v433, v431):andThen(function(v434) --[[ Line: 1188 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_default_1 (ref), l_TelemetryConfigs_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), l_PasskeyConstants_0 (ref), l_default_0 (ref), v421 (copy), v432 (ref), v252 (ref), l_Base64_0 (ref), v314 (ref), v424 (ref)
                if v434 ~= nil then
                    local v435 = l_HttpService_0:JSONDecode(v434);
                    if v435 == nil or not v435.response and not v435.errorCode then
                        l_Logger_0:info("Generic credential fetch failed. No result returned.");
                        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginCredentialSheetDismissedConfig, 1);
                        return;
                    elseif v435.errorCode ~= nil then
                        l_Logger_0:info("Generic credential fetch failed. Error {} (msg: {}) returned.", v435.errorCode, v435.errorMsg);
                        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginCredentialSheetErrorConfig, 1, {
                            errorCode = tostring(v435.errorCode)
                        });
                        if l_FFlagEnablePasskeyLoginErrorLogging_0 and type(v435.errorMsg) == "string" then
                            l_authClientError_0(l_EventStreamConstants_0.Context.PasskeyLoginAttempt, v435.errorMsg, l_PasskeyConstants_0.GENERIC_CREDENTIAL_FETCH_LOGIN_V2);
                            return;
                        end;
                    elseif v435.credentialType == l_default_0.CredentialsTypes.password then
                        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginCredentialSheetPasswordSelectedConfig, 1);
                        v421.setInProgress(true);
                        v432 = true;
                        v252(v435.response.username, v435.response.password, nil, nil, nil, true, v421);
                        return;
                    elseif v435.credentialType == l_default_0.CredentialsTypes.FIDO2 then
                        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginCredentialSheetPasskeySelectedConfig, 1);
                        v435.response.id = l_Base64_0.ToUrlSafeBase64(v435.response.id);
                        v435.response.rawId = l_Base64_0.ToUrlSafeBase64(v435.response.rawId);
                        v435.response.response.signature = l_Base64_0.ToUrlSafeBase64(v435.response.response.signature);
                        v435.response.response.userHandle = l_Base64_0.ToUrlSafeBase64(v435.response.response.userHandle);
                        v435.response.response.authenticatorData = l_Base64_0.ToUrlSafeBase64(v435.response.response.authenticatorData);
                        v435.response.response.clientDataJSON = l_Base64_0.ToUrlSafeBase64(v435.response.response.clientDataJSON);
                        v421.setInProgress(true);
                        v432 = true;
                        v314(v435.response, v424, v421);
                    end;
                end;
            end, function(v436) --[[ Line: 1253 ]]
                -- upvalues: l_Logger_0 (ref), l_default_1 (ref), l_TelemetryConfigs_0 (ref)
                l_Logger_0:warning("Generic credential signing failed. Error: {}", v436);
                l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginCredentialSheetDismissedConfig, 1);
            end):andThen(function(_) --[[ Line: 1262 ]]
                -- upvalues: v421 (copy), v432 (ref)
                if v421.onCredentialsPopupAbandoned and not v432 then
                    v421.onCredentialsPopupAbandoned();
                end;
            end):catch(function(_) --[[ Line: 1268 ]]
                -- upvalues: v421 (copy), v432 (ref)
                if v421.onCredentialsPopupAbandoned and not v432 then
                    v421.onCredentialsPopupAbandoned();
                end;
            end);
        end;
    end;
    local function v448(v440, v441, v442, v443, v444, v445, v446, v447) --[[ Line: 1275 ]]
        -- upvalues: v126 (copy), l_OpenAccountSwitchingErrorOverlay_0 (ref)
        return v126(l_OpenAccountSwitchingErrorOverlay_0(v440, v441, v442, v443, v444, v445, v446, v447));
    end;
    local function v449() --[[ Line: 1299 ]]
        -- upvalues: v126 (copy), l_OpenCentralOverlayForLoginPasswordResetPrompt_0 (ref)
        return v126(l_OpenCentralOverlayForLoginPasswordResetPrompt_0());
    end;
    local function v452(v450, v451) --[[ Line: 1303 ]]
        -- upvalues: l_LogoutAllLoggedInUsers_0 (ref)
        return l_LogoutAllLoggedInUsers_0(v450, v451);
    end;
    local function v456(v453, v454, v455) --[[ Line: 1307 ]]
        -- upvalues: v126 (copy), l_Logout_0 (copy)
        return v126(l_Logout_0(v453, v454, v455));
    end;
    local function v457() --[[ Line: 1311 ]]
        -- upvalues: v126 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v129 (copy), l_GetFStringVNGDownloadNowUrl_0 (ref)
        return v126(l_SetCentralOverlay_0(l_CentralOverlayType_0.NewAppAvailableModal, {
            onButtonActivated = function() --[[ Line: 1313 ]] --[[ Name: onButtonActivated ]]
                -- upvalues: v129 (ref), l_GetFStringVNGDownloadNowUrl_0 (ref)
                v129:openURL(l_GetFStringVNGDownloadNowUrl_0());
            end
        }));
    end;
    local function v467(v458, v459, v460, v461) --[[ Line: 1320 ]]
        -- upvalues: l_EventStreamConstants_0 (ref), v118 (copy), l_UserIdentifierType_0 (ref), v348 (copy), v252 (copy), v126 (copy), l_CloseCentralOverlay_0 (ref), l_OpenAccountSelector_0 (ref)
        local v462 = "";
        if v461.isLoginByOtp then
            v462 = l_EventStreamConstants_0.Context.DisambiguationOTP;
        elseif v118.userIdentifierType == l_UserIdentifierType_0.Email then
            v462 = l_EventStreamConstants_0.Context.DisambiguationEmail;
        elseif v118.userIdentifierType == l_UserIdentifierType_0.Phone then
            v462 = l_EventStreamConstants_0.Context.DisambiguationPhone;
        end;
        local v465 = {
            origin = l_EventStreamConstants_0.Context.Login, 
            context = v462, 
            users = v458, 
            onAccountSelection = function(v463) --[[ Line: 1339 ]] --[[ Name: onAccountSelection ]]
                -- upvalues: v461 (copy), v348 (ref), v459 (copy), v460 (copy), v252 (ref)
                if v461.isLoginByOtp then
                    v348(v459, v460, nil, v463, v461);
                    return;
                else
                    v252(v459, v460, nil, nil, v463, false, v461):await();
                    return;
                end;
            end, 
            onAccountSelectionAbandoned = function() --[[ Line: 1346 ]] --[[ Name: onAccountSelectionAbandoned ]]
                -- upvalues: v461 (copy), v126 (ref), l_CloseCentralOverlay_0 (ref)
                v461.setInProgress(false);
                local _ = v126(l_CloseCentralOverlay_0());
            end, 
            titleTextKey = "Authentication.Login.Label.AccountSelectorTitle"
        };
        local _ = v126(l_OpenAccountSelector_0(v465, true, false));
    end;
    local function v469(v468) --[[ Line: 1356 ]]
        -- upvalues: v144 (copy), v119 (copy), v70 (ref), v69 (ref)
        v144();
        v119({
            type = v70.SetComponentState, 
            data = {
                component = v69.LoginScreenV2, 
                payload = {
                    errorKey = v468.errorKey
                }
            }
        });
        v119({
            type = v70.ForceLoginByUsername
        });
    end;
    local function v471(v470) --[[ Line: 1372 ]]
        -- upvalues: l_LoginErrorCodes_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), l_StatusCodes_0 (ref)
        if v470.errorCode == l_LoginErrorCodes_0.IncorrectCValueOrPassword then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureCredentials, 1);
            return;
        elseif v470.errorCode == l_LoginErrorCodes_0.AccountLocked then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailurePasswordReset, 1);
            return;
        elseif v470.errorCode == l_LoginErrorCodes_0.CTypeNotSupported then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureBadRequest, 1);
            return;
        elseif v470.errorCode == l_LoginErrorCodes_0.CValueAndPasswordRequired then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureBadRequest, 1);
            return;
        elseif v470.errorCode == l_LoginErrorCodes_0.SecurityQuestions then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureSecurityQuestions, 1);
            return;
        elseif v470.errorCode == l_LoginErrorCodes_0.MultipleUsersPerCredential then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureMultipleUsersPerCredential, 1);
            return;
        elseif v470.HttpError == Enum.HttpError.OK and v470.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureThrottled, 1);
            return;
        elseif v470.HttpError == Enum.HttpError.OK and v470.StatusCode == l_StatusCodes_0.REQUEST_TIMEOUT then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTimeout, 1);
            return;
        elseif v470.HttpError == Enum.HttpError.OK and v470.StatusCode == l_StatusCodes_0.BAD_REQUEST then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureBadRequest, 1);
            return;
        elseif v470.HttpError == Enum.HttpError.OK and v470.StatusCode == l_StatusCodes_0.NOT_FOUND then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureNotFound, 1);
            return;
        elseif v470.HttpError == Enum.HttpError.OK and v470.StatusCode == l_StatusCodes_0.INTERNAL_SERVER_ERROR then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureInternalServerError, 1);
            return;
        else
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureUnknownError, 1);
            return;
        end;
    end;
    v251 = function(v472) --[[ Line: 1400 ]]
        -- upvalues: l_LoginErrorCodes_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v471 (copy), l_authClientError_0 (ref), v126 (copy), l_CloseCentralOverlay_0 (ref), l_AppStorageUtilities_0 (ref), l_User_0 (ref), v127 (copy), l_LogoutAllLoggedInUsers_0 (ref), l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (ref), v163 (copy), l_LoginResult_0 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (copy), l_LaunchApp_0 (copy), v128 (copy), v131 (copy), l_LaunchContext_0 (ref), l_ResetAppState_0 (copy), v12 (ref), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_AccountSwitcherConstants_0 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), l_GuiService_0 (ref), l_LogoutReasonNames_0 (ref), l_Logout_0 (copy), v120 (ref), v125 (copy), l_OpenAccountSwitchingErrorOverlay_0 (ref), v469 (copy), v69 (ref), l_OpenCentralOverlayForLoginPasswordResetPrompt_0 (ref), v457 (copy), v215 (copy), v467 (copy)
        return function(v473, v474, v475, v476) --[[ Line: 1401 ]] --[[ Name: handleLoginError ]]
            -- upvalues: l_LoginErrorCodes_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v471 (ref), l_authClientError_0 (ref), v472 (copy), v126 (ref), l_CloseCentralOverlay_0 (ref), l_AppStorageUtilities_0 (ref), l_User_0 (ref), v127 (ref), l_LogoutAllLoggedInUsers_0 (ref), l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (ref), v163 (ref), l_LoginResult_0 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (ref), l_LaunchApp_0 (ref), v128 (ref), v131 (ref), l_LaunchContext_0 (ref), l_ResetAppState_0 (ref), v12 (ref), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_AccountSwitcherConstants_0 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), l_GuiService_0 (ref), l_LogoutReasonNames_0 (ref), l_Logout_0 (ref), v120 (ref), v125 (ref), l_OpenAccountSwitchingErrorOverlay_0 (ref), v469 (ref), v69 (ref), l_OpenCentralOverlayForLoginPasswordResetPrompt_0 (ref), v457 (ref), v215 (ref), v467 (ref)
            local v477 = false;
            local v478 = v473.errorCode == l_LoginErrorCodes_0.MultipleUsersPerCredential;
            local v479 = v473.errorCode == l_LoginErrorCodes_0.SecurityQuestions;
            if v478 or v479 then
                v477 = true;
            end;
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Failure, 1);
            v471(v473);
            l_authClientError_0(v472.eventContext, v473.errorCode);
            local function v481() --[[ Line: 1419 ]]
                -- upvalues: v472 (ref), v477 (ref), v126 (ref), l_CloseCentralOverlay_0 (ref)
                v472.setInProgress(v477);
                local _ = v126(l_CloseCentralOverlay_0());
            end;
            local function v494() --[[ Line: 1424 ]]
                -- upvalues: l_AppStorageUtilities_0 (ref), l_User_0 (ref), v472 (ref), v127 (ref), l_LogoutAllLoggedInUsers_0 (ref), l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (ref), v476 (copy), v163 (ref), v474 (copy), v475 (copy), l_LoginResult_0 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v179 (ref), v126 (ref), l_LaunchApp_0 (ref), v128 (ref), v131 (ref), l_LaunchContext_0 (ref), l_ResetAppState_0 (ref), v12 (ref), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_AccountSwitcherConstants_0 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), l_GuiService_0 (ref), l_LogoutReasonNames_0 (ref), l_Logout_0 (ref), l_CloseCentralOverlay_0 (ref)
                local v482 = l_AppStorageUtilities_0.getAccountBlob();
                local v483 = l_User_0.fromLocalStorage().userId ~= -1;
                v472.setInProgress(true);
                l_LogoutAllLoggedInUsers_0(v127, v482):await();
                local v484 = false;
                if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 then
                    if v476 then
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 1433 ]]
                            -- upvalues: v163 (ref), v127 (ref), v474 (ref), v475 (ref)
                            return v163(v127, v474, v475):expect();
                        end);
                        if l_status_1 and l_result_1 and not l_LoginResult_0.hasTwoStepData(l_result_1) then
                            if l_FFlagEnableLuaAccountSwitch_0 then
                                v179(l_result_1.accountBlob);
                                return;
                            else
                                local _ = v126(l_LaunchApp_0(v127, nil, v128, v131, l_LaunchContext_0.Login));
                                return;
                            end;
                        end;
                    elseif type(v474) ~= "string" then
                        v484 = true;
                    end;
                end;
                if v483 == true then
                    v126(l_ResetAppState_0());
                    local v488 = v12.resolve();
                    l_AppStorageService_0:SetItem(l_AuthLocalStorageKeys_0.CredentialValue, "");
                    l_AppStorageService_0:Flush();
                    if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 then
                        v488 = if v484 then l_AccountSwitcherConstants_0.AccountSwitcherPendingPasskeyLoginV2AfterLogoutAll else l_AccountSwitcherConstants_0.AccountSwitcherPendingLoginV2AfterLogoutAll;
                        l_AppStorageUtilities_0.setAccountSwitchStatus(v488);
                        l_AppStorageUtilities_0.flush();
                    end;
                    if l_FFlagAddReasonToEveryLogout_0 then
                        v488 = v127;
                        local l_l_GuiService_0_0 = l_GuiService_0;
                        local l_LoginContextAccountSwitchingErrorOverlay_0 = l_LogoutReasonNames_0.LoginContextAccountSwitchingErrorOverlay;
                        local _ = v126(l_Logout_0(v488, l_l_GuiService_0_0, l_LoginContextAccountSwitchingErrorOverlay_0));
                    else
                        local _ = v126(l_Logout_0(v127, l_GuiService_0, nil));
                    end;
                end;
                v472.setInProgress(false);
                local _ = v126(l_CloseCentralOverlay_0());
            end;
            if l_FFlagEnableLuaAccountSwitch_0 and v473.errorCode == l_LoginErrorCodes_0.EmptyAccountSwitchBlobRequired then
                v472.setErrorKey("");
                local v495 = if not l_FFlagEnableNavigateToLoginAfterLogoutAll_0 or v476 then v474 else v120.current;
                if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 then
                    l_AppStorageUtilities_0.setAccountSwitchTargetUsername(v495);
                end;
                local v496 = v125 and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts";
                local v497 = v125 and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.LogoutConfirmation";
                local v498 = v125 and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts";
                local l_AccountSwitcherLoginEmptyBlobRequiredError_0 = l_AccountSwitcherConstants_0.AccountSwitcherLoginEmptyBlobRequiredError;
                local v500 = v495 or nil;
                local _ = v126(l_OpenAccountSwitchingErrorOverlay_0(v496, v497, v498, "Authentication.CrossDevice.Action.CancelLogin", v494, v481, l_AccountSwitcherLoginEmptyBlobRequiredError_0, v500));
                return;
            elseif l_FFlagEnableLuaAccountSwitch_0 and v473.errorCode == l_LoginErrorCodes_0.ParentEmptyAccountSwitchBlobRequired then
                v472.setErrorKey("");
                local v502 = if not l_FFlagEnableNavigateToLoginAfterLogoutAll_0 or v476 then v474 else v120.current;
                if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 then
                    l_AppStorageUtilities_0.setAccountSwitchTargetUsername(v502);
                end;
                local v503 = v125 and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts";
                local v504 = v125 and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.ParentLogoutConfirmation";
                local v505 = v125 and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts";
                local l_AccountSwitcherParentLoginEmptyBlobRequiredError_0 = l_AccountSwitcherConstants_0.AccountSwitcherParentLoginEmptyBlobRequiredError;
                local v507 = v502 or nil;
                local _ = v126(l_OpenAccountSwitchingErrorOverlay_0(v503, v504, v505, "Authentication.CrossDevice.Action.CancelLogin", v494, v481, l_AccountSwitcherParentLoginEmptyBlobRequiredError_0, v507));
                return;
            elseif v473.errorCode == l_LoginErrorCodes_0.MoreThanOneUsername then
                v469(v473);
                v472.navigation.navigate(v69.LoginScreenV2);
                return;
            else
                if v473.errorCode == l_LoginErrorCodes_0.AccountLocked then
                    local _ = v126(l_OpenCentralOverlayForLoginPasswordResetPrompt_0());
                end;
                if v473.errorCode == l_LoginErrorCodes_0.GlobalAppAccessDeniedVNG then
                    v457();
                end;
                if v479 and v473.securityQuestionsData and v473.securityQuestionsCallback then
                    spawn(function() --[[ Line: 1551 ]]
                        -- upvalues: v215 (ref), v474 (copy), v475 (copy), v473 (copy), v472 (ref)
                        v215(v474, v475, v473.securityQuestionsData, v473.securityQuestionsCallback, v472);
                    end);
                    return;
                elseif v478 and v473.usersData and v474 and v475 then
                    v467(v473.usersData, v474, v475, v472);
                    return;
                else
                    v472.setErrorKey(v473.errorKey or "Authentication.Login.Response.SomethingWentWrong");
                    v472.setInProgress(v477);
                    return;
                end;
            end;
        end;
    end;
    return v11.createElement(v65.Provider, {
        value = {
            state = v118, 
            dispatch = v119, 
            parentNavigation = v113.parentNavigation, 
            utils = {
                handleLoginCompletionWithAccountSwitching = v179, 
                handleLoginResult = v250, 
                showPasskeyLoginPopup = v417, 
                showGenericCredentialLoginPopup = v439, 
                handleLoginWithCode = v315, 
                handleLoginWithFormData = v252, 
                handleLoginWithPasskey = v314, 
                handleLoginWithOtp = v348, 
                handleSendEmailOtp = v387, 
                handleResendEmailOtp = v397, 
                openAccountSwitchingErrorOverlay = v448, 
                openPasswordResetPrompt = v449, 
                openWebView = v170, 
                openAccountRecovery = v172, 
                logoutAllLoggedInUsers = v452, 
                logoutWithoutShowConfirmation = v456, 
                openNewAppAvailableModal = v457, 
                closeCentralOverlay = v162, 
                clearApp = v143, 
                openAccountSelector = v467, 
                handleCredentialsCollision = v469, 
                registerPassword = v187, 
                isUserAuthenticated = v166
            }
        }
    }, v113.children);
end;