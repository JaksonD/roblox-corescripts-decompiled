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
local l_GetFFlagEnableAccountSwitcherFoundationDesign_0 = v43.GetFFlagEnableAccountSwitcherFoundationDesign;
local l_GetFFlagEnableAccountSwitcherRedesignIXP_0 = v43.GetFFlagEnableAccountSwitcherRedesignIXP;
local l_GetFFlagEnable2SVRecovery_0 = require(l_Parent_0.AccountRecovery).Flags.GetFFlagEnable2SVRecovery;
local v61 = game:DefineFastFlag("LoginV2AwaitPasswordRegistration", false);
local v62 = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOn2SVLoginV2", false);
local v63 = require(l_script_FirstAncestor_0.Context.LoginContext);
local v64 = require(l_script_FirstAncestor_0.Reducers.LoginStateReducer);
local v65 = require(l_script_FirstAncestor_0.Thunks.StartAuthenticationByUser);
local v66 = require(l_script_FirstAncestor_0.Thunks.StartPasskeyAuthentication);
local v67 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local v68 = require(l_script_FirstAncestor_0.Enums.LoginActionType);
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
return function(v111) --[[ Line: 153 ]]
    -- upvalues: l_useNavigationProps_0 (copy), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (copy), l_UserIdentifierType_0 (copy), v11 (copy), v64 (copy), v33 (copy), l_AppBtidLayers_0 (copy), l_GetFFlagEnableAccountSwitcherRedesignIXP_0 (copy), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_RoactAnalytics_0 (copy), l_AppLinking_0 (copy), l_useAppPolicy_0 (copy), v66 (copy), v65 (copy), l_SetLoginResult_0 (copy), l_SetBackNavigationDisabled_0 (copy), l_LaunchContext_0 (copy), v12 (copy), v68 (copy), v67 (copy), l_FFlagEnablePWManagerLoginCheck_0 (copy), l_GetPasswordManagerUsageStore_0 (copy), l_LoginByPasskey_0 (copy), l_LoginByCode_0 (copy), l_LoginByOtp_0 (copy), l_CloseCentralOverlay_0 (copy), l_Login_0 (copy), l_OpenAccountSelector_0 (copy), l_User_0 (copy), l_RenderChallenge_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (copy), l_AccountSwitcherConstants_0 (copy), l_AppStorageUtilities_0 (copy), l_FFlagLuaEnableDidSwitchAccount_0 (copy), l_GuiService_0 (copy), l_NotificationType_0 (copy), l_default_1 (copy), l_TelemetryConfigs_0 (copy), l_HttpService_0 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (copy), l_MemStorageService_0 (copy), l_AuthMemStorageKeys_0 (copy), l_default_0 (copy), l_Constants_0 (copy), l_Logger_0 (copy), l_authButtonClick_0 (copy), l_EventStreamConstants_0 (copy), l_getTwoStepLoginErrorKey_0 (copy), l_TwoStepErrorCodes_0 (copy), l_reportEphemeralCounter_0 (copy), l_AppLoginCounterNames_0 (copy), l_ChallengeType_0 (copy), l_TwoStepVerificationActionType_0 (copy), l_GetFFlagEnable2SVRecovery_0 (copy), l_TwoStepRequests_0 (copy), v61 (copy), l_FFlagEnableRecordLogin_0 (copy), l_record2svCompletion_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), v62 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (copy), l_ContentProvider_0 (copy), l_GetUserByUsername_0 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (copy), l_KeystoreConstants_0 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy), l_LoginResult_0 (copy), l_GetFFlagEnableLoginAccountSelector_0 (copy), l_AppStorageService_0 (copy), l_AuthLocalStorageKeys_0 (copy), l_recordLogin_0 (copy), l_LoginMethods_0 (copy), l_Constants_1 (copy), l_SendCode_0 (copy), l_ResendCode_0 (copy), l_UserInputService_0 (copy), l_Base64_0 (copy), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (copy), l_CredentialsProtocolErrorCodes_0 (copy), l_authClientError_0 (copy), l_PasskeyConstants_0 (copy), l_FFlagEnablePasskeyLoginErrorLogging_0 (copy), l_OpenAccountSwitchingErrorOverlay_0 (copy), l_OpenCentralOverlayForLoginPasswordResetPrompt_0 (copy), l_LogoutAllLoggedInUsers_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_GetFStringVNGDownloadNowUrl_0 (copy), l_LoginErrorCodes_0 (copy), l_StatusCodes_0 (copy), l_FFlagAddReasonToEveryLogout_0 (copy), l_LogoutReasonNames_0 (copy), v63 (copy)
    local v114 = l_useNavigationProps_0(function(_, v113) --[[ Line: 154 ]]
        -- upvalues: l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref)
        return {
            credProtocolIsAvailableResponse = v113.credProtocolIsAvailableResponse, 
            forcedUsernameOverride = if l_FFlagEnableLoginV2ForcedUsernameOverride_0 then v113.forcedUsernameOverride else nil
        };
    end);
    local v115 = {
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
        monoDeps = v111.monoDeps, 
        extraProps = v114
    };
    local v116, v117 = v11.useReducer(v64, v115);
    local v119 = v33.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.LoginLayer
    }, function(v118) --[[ Line: 202 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return {
            shouldLoginWithKeystoreCredentials = (v118[l_AppBtidLayers_0.LoginLayer] or {}).shouldLoginWithKeystoreCredentials or false
        };
    end);
    local v121 = not l_GetFFlagEnableAccountSwitcherRedesignIXP_0() or v33.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.AccountSwitcherLayer
    }, function(v120) --[[ Line: 213 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return (v120[l_AppBtidLayers_0.AccountSwitcherLayer] or {}).enableAccountSwitcherFoundationDesign == true;
    end);
    local v122 = l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and v121;
    local v123 = l_useDispatch_0();
    local v124 = l_useRoactService_0(l_RoactNetworking_0);
    local v125 = l_useRoactService_0(l_RoactAnalytics_0);
    local v126 = l_useRoactService_0(l_AppLinking_0);
    local v128 = l_useAppPolicy_0(function(v127) --[[ Line: 225 ]]
        return v127;
    end);
    local l_LaunchApp_0 = v116.monoDeps.LaunchApp;
    local l_ResetAppState_0 = v116.monoDeps.ResetAppState;
    local l_Logout_0 = v116.monoDeps.Logout;
    local function v132() --[[ Line: 234 ]]
        -- upvalues: v123 (copy), v66 (ref), v124 (copy)
        return v123(v66(v124));
    end;
    local function v134(v133) --[[ Line: 238 ]]
        -- upvalues: v123 (copy), v65 (ref), v124 (copy)
        return v123(v65(v124, v133));
    end;
    local function _(v135) --[[ Line: 242 ]]
        -- upvalues: v123 (copy), l_SetLoginResult_0 (ref)
        return v123(l_SetLoginResult_0(v135));
    end;
    local function _(v137) --[[ Line: 246 ]]
        -- upvalues: v123 (copy), l_SetBackNavigationDisabled_0 (ref)
        return v123(l_SetBackNavigationDisabled_0(v137));
    end;
    local function _() --[[ Line: 250 ]]
        -- upvalues: v123 (copy), l_LaunchApp_0 (copy), v124 (copy), v125 (copy), v128 (copy), l_LaunchContext_0 (ref)
        return v123(l_LaunchApp_0(v124, nil, v125, v128, l_LaunchContext_0.Login));
    end;
    local function v140() --[[ Line: 254 ]]
        -- upvalues: v123 (copy), l_ResetAppState_0 (copy), v12 (ref)
        v123(l_ResetAppState_0());
        return v12.resolve();
    end;
    local function v141() --[[ Line: 259 ]]
        -- upvalues: v117 (copy), v68 (ref), v67 (ref), l_UserIdentifierType_0 (ref)
        v117({
            type = v68.SetComponentState, 
            data = {
                component = v67.AuthenticationScreen, 
                payload = {
                    errorKey = "", 
                    errorType = nil, 
                    password = ""
                }
            }
        });
        v117({
            type = v68.SetComponentState, 
            data = {
                component = v67.LoginScreenV2, 
                payload = {
                    errorKey = "", 
                    userIdentifier = ""
                }
            }
        });
        v117({
            type = v68.SetUserIdentifierAndType, 
            data = {
                userIdentifier = "", 
                userIdentifierType = l_UserIdentifierType_0.Unknown
            }
        });
    end;
    local v142 = if l_FFlagEnablePWManagerLoginCheck_0 then l_GetPasswordManagerUsageStore_0(false) else nil;
    if v142 then
        v142.setLoggedinUsingSavedPassword(false);
        v142.setSavedPasswordAfterLogin(false);
    end;
    local function _(v143, v144) --[[ Line: 298 ]]
        -- upvalues: v123 (copy), l_LoginByPasskey_0 (ref), v124 (copy)
        return v123(l_LoginByPasskey_0(v124, v143, v144));
    end;
    local function _(v146, v147, v148, v149, v150, v151) --[[ Line: 302 ]]
        -- upvalues: v123 (copy), l_LoginByCode_0 (ref), v124 (copy)
        return v123(l_LoginByCode_0(v124, v146, v147, v148, v149, v150, v151));
    end;
    local function _(v153, v154, v155, v156, v157) --[[ Line: 323 ]]
        -- upvalues: v123 (copy), l_LoginByOtp_0 (ref), v124 (copy)
        return v123(l_LoginByOtp_0(v124, v153, v154, v155, v156, v157));
    end;
    local function v159() --[[ Line: 342 ]]
        -- upvalues: v123 (copy), l_CloseCentralOverlay_0 (ref)
        return v123(l_CloseCentralOverlay_0());
    end;
    local function v160(...) --[[ Line: 346 ]]
        -- upvalues: v123 (copy), l_Login_0 (ref)
        return v123(l_Login_0(...));
    end;
    local function _(v161) --[[ Line: 350 ]]
        -- upvalues: v123 (copy), l_OpenAccountSelector_0 (ref)
        return v123(l_OpenAccountSelector_0(v161, true, false));
    end;
    local function v163() --[[ Line: 354 ]]
        -- upvalues: l_User_0 (ref)
        return l_User_0.fromLocalStorage().userId ~= -1;
    end;
    local function _(v164) --[[ Line: 358 ]]
        -- upvalues: l_RenderChallenge_0 (ref)
        return l_RenderChallenge_0(v164);
    end;
    local function v167(v166) --[[ Line: 362 ]]
        -- upvalues: v123 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v123(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = v166, 
            extraProps = {
                title = "", 
                transitionAnimation = "SlideInFromBottom"
            }
        }));
    end;
    local function v169(v168) --[[ Line: 373 ]]
        -- upvalues: v123 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v123(l_NavigateDown_0({
            name = l_AppPage_0.AccountRecovery, 
            extraProps = {
                identifier = v168, 
                recoverPassword = true
            }
        }));
    end;
    local function v176(v170) --[[ Line: 383 ]]
        -- upvalues: l_User_0 (ref), v123 (copy), l_ResetAppState_0 (copy), v12 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), l_AppStorageUtilities_0 (ref), l_FFlagLuaEnableDidSwitchAccount_0 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref), l_LaunchApp_0 (copy), v124 (copy), v125 (copy), v128 (copy), l_LaunchContext_0 (ref)
        if l_User_0.fromLocalStorage().userId ~= -1 then
            v123(l_ResetAppState_0());
            v12.resolve():andThen(function(_) --[[ Line: 385 ]]
                -- upvalues: l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_AccountSwitcherConstants_0 (ref), l_AppStorageUtilities_0 (ref), v170 (copy), l_FFlagLuaEnableDidSwitchAccount_0 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref)
                local v172 = if l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 then l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromLoginStatus else l_AccountSwitcherConstants_0.AccountSwitcherSwitchedStatus;
                l_AppStorageUtilities_0.setAccountSwitchStatus(v172);
                l_AppStorageUtilities_0.setAccountBlob(v170);
                l_AppStorageUtilities_0.flush();
                if l_FFlagLuaEnableDidSwitchAccount_0 then
                    l_GuiService_0:BroadcastNotification("", l_NotificationType_0.DID_SWITCH_ACCOUNT);
                    return;
                else
                    l_GuiService_0:BroadcastNotification("", l_NotificationType_0.DID_LOG_OUT);
                    return;
                end;
            end, function(_) --[[ Line: 397 ]]
                -- upvalues: l_AppStorageUtilities_0 (ref), v170 (copy), v123 (ref), l_LaunchApp_0 (ref), v124 (ref), v125 (ref), v128 (ref), l_LaunchContext_0 (ref)
                l_AppStorageUtilities_0.setAccountSwitchStatus("switched");
                l_AppStorageUtilities_0.setAccountBlob(v170);
                l_AppStorageUtilities_0.flush();
                local _ = v123(l_LaunchApp_0(v124, nil, v125, v128, l_LaunchContext_0.Login));
            end);
            return;
        else
            l_AppStorageUtilities_0.setAccountBlob(v170);
            l_AppStorageUtilities_0.flush();
            local _ = v123(l_LaunchApp_0(v124, nil, v125, v128, l_LaunchContext_0.Login));
            return;
        end;
    end;
    local function v184(v177) --[[ Line: 410 ]]
        -- upvalues: l_default_1 (ref), l_TelemetryConfigs_0 (ref), l_HttpService_0 (ref), v116 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), l_AuthMemStorageKeys_0 (ref), l_default_0 (ref), l_Constants_0 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), v142 (copy), l_Logger_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref)
        if v177 == nil then
            l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginPasswordSaveSkippedConfig, 1, {
                reason = "missingCredentialsJson"
            });
            return nil;
        else
            local v178 = l_HttpService_0:JSONDecode(v177);
            if v178.cvalue == nil or v178.password == nil then
                l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginPasswordSaveSkippedConfig, 1, {
                    reason = "missingUsernameOrPassword"
                });
                return nil;
            elseif not v116.credentialsProtocolStatus.passwordsSupported then
                if not l_FFlagDisableMemStorageServicePasswordEvent_0 then
                    l_MemStorageService_0:Fire(l_AuthMemStorageKeys_0.AuthenticatedCredentials, v177);
                end;
                l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginPasswordSaveSkippedConfig, 1, {
                    reason = "passwordsNotSupported"
                });
                return nil;
            else
                local v179 = {
                    username = v178.cvalue, 
                    password = v178.password
                };
                local v180 = l_HttpService_0:JSONEncode(v179);
                l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginPasswordSaveAttemptedConfig, 1);
                return l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v180, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v181) --[[ Line: 458 ]]
                    -- upvalues: l_HttpService_0 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), v142 (ref), l_Logger_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_default_1 (ref), l_TelemetryConfigs_0 (ref)
                    if v181 then
                        local v182 = l_HttpService_0:JSONDecode(v181);
                        if v182.errorCode == nil then
                            if l_FFlagEnablePWManagerLoginCheck_0 and v142 then
                                v142.setSavedPasswordAfterLogin(true);
                            end;
                            l_Logger_0:info("Successfully registered password.");
                            l_authButtonClick_0(l_EventStreamConstants_0.Context.CMPasswordLogin, l_EventStreamConstants_0.Button.SavePassword);
                            l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginPasswordSaveSuccessConfig, 1);
                            return;
                        else
                            l_Logger_0:warning("Error registering password: {}", v182.errorMsg);
                            l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginPasswordSaveFailureConfig, 1, {
                                errorCode = tostring(v182.errorCode)
                            });
                        end;
                    end;
                end, function(v183) --[[ Line: 484 ]]
                    -- upvalues: l_Logger_0 (ref), l_default_1 (ref), l_TelemetryConfigs_0 (ref)
                    l_Logger_0:warning("Error registering password: {}", v183);
                    l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginPasswordSaveFailureConfig, 1, {
                        error = tostring(v183)
                    });
                end);
            end;
        end;
    end;
    local function v188(v185, v186) --[[ Line: 494 ]]
        -- upvalues: l_getTwoStepLoginErrorKey_0 (ref), l_TwoStepErrorCodes_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref)
        local v187 = l_getTwoStepLoginErrorKey_0(v185);
        if v185 and v185 == l_TwoStepErrorCodes_0.IllegalChildAccountLinking then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTwoStepVerification, 1);
        else
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureUnknownError, 1);
        end;
        v186.setInProgress(false);
        v186.setErrorKey(v187);
    end;
    local function v202(v189, v190, v191) --[[ Line: 507 ]]
        -- upvalues: l_ChallengeType_0 (ref), l_TwoStepVerificationActionType_0 (ref), l_GetFFlagEnable2SVRecovery_0 (ref), l_TwoStepRequests_0 (ref), v124 (copy), v123 (copy), l_SetBackNavigationDisabled_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v61 (ref), v184 (copy), l_FFlagEnableRecordLogin_0 (ref), l_record2svCompletion_0 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (copy), l_LaunchApp_0 (copy), v125 (copy), v128 (copy), l_LaunchContext_0 (ref), v62 (ref), l_HttpService_0 (ref), v188 (copy), l_RenderChallenge_0 (ref)
        local l_ticket_0 = v189.twoStepVerificationData.ticket;
        local l_id_0 = v189.user.id;
        local v200 = {
            title = "Authentication.Login.Label.TwoStepVerification", 
            challengeType = l_ChallengeType_0.TwoStepVerification, 
            challengeParameters = {
                actionType = l_TwoStepVerificationActionType_0.Login, 
                challengeId = l_ticket_0, 
                userId = l_id_0, 
                allowRememberDevice = true, 
                clientSupports2svRecovery = l_GetFFlagEnable2SVRecovery_0() and true or false
            }, 
            callbacks = {
                OnChallengeCompleted = function(v194) --[[ Line: 522 ]] --[[ Name: OnChallengeCompleted ]]
                    -- upvalues: l_TwoStepRequests_0 (ref), v124 (ref), l_id_0 (copy), l_ticket_0 (copy), v123 (ref), l_SetBackNavigationDisabled_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v61 (ref), v184 (ref), v190 (copy), l_FFlagEnableRecordLogin_0 (ref), l_record2svCompletion_0 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (ref), l_LaunchApp_0 (ref), v125 (ref), v128 (ref), l_LaunchContext_0 (ref), v62 (ref), l_HttpService_0 (ref), v188 (ref), v191 (copy)
                    l_TwoStepRequests_0.login(v124, l_id_0, l_ticket_0, v194.data.verificationToken, v194.data.rememberDevice):andThen(function(v195) --[[ Line: 530 ]]
                        -- upvalues: v123 (ref), l_SetBackNavigationDisabled_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v61 (ref), v184 (ref), v190 (ref), l_FFlagEnableRecordLogin_0 (ref), l_record2svCompletion_0 (ref), l_id_0 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (ref), l_LaunchApp_0 (ref), v124 (ref), v125 (ref), v128 (ref), l_LaunchContext_0 (ref)
                        local v196 = v123(l_SetBackNavigationDisabled_0(false));
                        l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Success, 1);
                        if v61 then
                            v196 = v184(v190);
                            if v196 then
                                v196:await();
                            end;
                        end;
                        if l_FFlagEnableRecordLogin_0 then
                            pcall(function() --[[ Line: 542 ]]
                                -- upvalues: l_record2svCompletion_0 (ref), l_id_0 (ref)
                                l_record2svCompletion_0(l_id_0);
                            end);
                        end;
                        if l_FFlagEnableLuaAccountSwitch_0 then
                            v176(v195.responseBody and v195.responseBody.accountBlob);
                            return;
                        else
                            v196 = v123(l_LaunchApp_0(v124, nil, v125, v128, l_LaunchContext_0.Login));
                            return;
                        end;
                    end, function(v197) --[[ Line: 554 ]]
                        -- upvalues: l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v62 (ref), l_HttpService_0 (ref), v188 (ref), v191 (ref)
                        l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Failure, 1);
                        if v62 then
                            local l_status_0, l_result_0 = pcall(function() --[[ Line: 558 ]]
                                -- upvalues: l_HttpService_0 (ref), v197 (copy)
                                return l_HttpService_0:JSONDecode(v197.Body).errors[1].code;
                            end);
                            v188(if l_status_0 then l_result_0 else nil, v191);
                            return;
                        else
                            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureUnknownError, 1);
                            v191.setInProgress(false);
                            v191.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                            return;
                        end;
                    end):finally(function() --[[ Line: 569 ]]
                        -- upvalues: v61 (ref), v184 (ref), v190 (ref)
                        if not v61 then
                            v184(v190);
                        end;
                    end);
                end, 
                OnChallengeAbandoned = function() --[[ Line: 575 ]] --[[ Name: OnChallengeAbandoned ]]
                    -- upvalues: v191 (copy)
                    v191.setInProgress(false);
                end, 
                OnChallengeInvalidated = function() --[[ Line: 578 ]] --[[ Name: OnChallengeInvalidated ]]
                    -- upvalues: v191 (copy)
                    v191.setInProgress(false);
                    v191.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                end, 
                OnChallengeLoadFailed = function() --[[ Line: 582 ]] --[[ Name: OnChallengeLoadFailed ]]
                    -- upvalues: v191 (copy)
                    v191.setInProgress(false);
                    v191.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                end
            }
        };
        local _ = l_RenderChallenge_0(v200);
    end;
    local function v212(_, _, v205, v206, v207) --[[ Line: 590 ]]
        -- upvalues: l_ChallengeType_0 (ref), l_RenderChallenge_0 (ref)
        local v210 = {
            challengeType = l_ChallengeType_0.SecurityQuestions, 
            challengeParameters = {
                sessionId = v205.sessionId, 
                userId = v205.userId
            }, 
            callbacks = {
                OnChallengeCompleted = function(v208) --[[ Line: 604 ]] --[[ Name: OnChallengeCompleted ]]
                    -- upvalues: v205 (copy), v206 (copy)
                    local v209 = {
                        sessionId = v205.sessionId, 
                        redemptionToken = v208.data.redemptionToken
                    };
                    v206(v209);
                end, 
                OnChallengeAbandoned = function() --[[ Line: 611 ]] --[[ Name: OnChallengeAbandoned ]]
                    -- upvalues: v207 (copy)
                    v207.setInProgress(false);
                end, 
                OnChallengeInvalidated = function() --[[ Line: 614 ]] --[[ Name: OnChallengeInvalidated ]]
                    -- upvalues: v207 (copy)
                    v207.setInProgress(false);
                    v207.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                end, 
                OnChallengeLoadFailed = function() --[[ Line: 618 ]] --[[ Name: OnChallengeLoadFailed ]]
                    -- upvalues: v207 (copy)
                    v207.setInProgress(false);
                    v207.setErrorKey("Authentication.Login.Response.SomethingWentWrong");
                end
            }
        };
        local _ = l_RenderChallenge_0(v210);
    end;
    local _ = function(v213) --[[ Line: 626 ]]
        -- upvalues: v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v119 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v124 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref)
        return v12.new(function(v214, v215) --[[ Line: 629 ]]
            -- upvalues: l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v213 (copy), v119 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v124 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v12 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref)
            if l_GetFFlagKeystoreAutoLoginAvailable_0() == false or v213 == nil then
                v214();
                return;
            else
                local v216 = v119.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                local v217 = l_HttpService_0:JSONEncode({
                    server = l_ContentProvider_0.BaseUrl
                });
                local v218 = l_HttpService_0:JSONDecode(v213);
                l_GetUserByUsername_0(v124, v218.cvalue)():andThen(function(v219) --[[ Line: 650 ]]
                    -- upvalues: v215 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v217 (copy), v12 (ref)
                    if not v219 or not v219.id then
                        return v215("Invalid usernameInfo");
                    elseif l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                        return l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v220) --[[ Line: 660 ]]
                            -- upvalues: l_default_0 (ref), v217 (ref), l_KeystoreConstants_0 (ref), v12 (ref)
                            if v220 and v220.keystore and v220.keystore.isAvailable then
                                return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v217, l_KeystoreConstants_0.KeystoreTimeout);
                            else
                                return v12.resolve(nil);
                            end;
                        end):andThen(function() --[[ Line: 675 ]]
                            -- upvalues: v219 (copy)
                            return v219;
                        end);
                    else
                        return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v217, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 683 ]]
                            -- upvalues: v219 (copy)
                            return v219;
                        end);
                    end;
                end):andThen(function(v221) --[[ Line: 688 ]]
                    -- upvalues: v216 (copy), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v218 (copy), l_default_0 (ref)
                    local v222 = nil;
                    if v216 == true then
                        v222 = l_KeystoreConstants_0.Experiment;
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v221.id)));
                    else
                        v222 = l_KeystoreConstants_0.Control;
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v221.id)));
                    end;
                    local v223 = l_HttpService_0:JSONEncode({
                        server = tostring(l_ContentProvider_0.BaseUrl), 
                        username = tostring(v218.cvalue), 
                        userId = tostring(v221.id), 
                        password = tostring(v218.password), 
                        experimentGroup = tostring(v222)
                    });
                    return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v223, l_KeystoreConstants_0.KeystoreTimeout);
                end):andThen(function(_) --[[ Line: 719 ]]
                    -- upvalues: v214 (copy)
                    v214();
                end):catch(function(v225) --[[ Line: 722 ]]
                    -- upvalues: v215 (copy)
                    v215(v225);
                end);
                return;
            end;
        end);
    end;
    local function v247(v227, v228, v229) --[[ Line: 728 ]]
        -- upvalues: v123 (copy), l_SetBackNavigationDisabled_0 (ref), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v119 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v124 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v202 (copy), v61 (ref), v184 (copy), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (copy), l_LaunchApp_0 (copy), v125 (copy), v128 (copy), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
        local _ = v123(l_SetBackNavigationDisabled_0(false));
        v12.new(function(v231, v232) --[[ Line: 629 ]]
            -- upvalues: l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v228 (copy), v119 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v124 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v12 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref)
            if l_GetFFlagKeystoreAutoLoginAvailable_0() == false or v228 == nil then
                v231();
                return;
            else
                local v233 = v119.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                local v234 = l_HttpService_0:JSONEncode({
                    server = l_ContentProvider_0.BaseUrl
                });
                local v235 = l_HttpService_0:JSONDecode(v228);
                l_GetUserByUsername_0(v124, v235.cvalue)():andThen(function(v236) --[[ Line: 650 ]]
                    -- upvalues: v232 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v234 (copy), v12 (ref)
                    if not v236 or not v236.id then
                        return v232("Invalid usernameInfo");
                    elseif l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                        return l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v237) --[[ Line: 660 ]]
                            -- upvalues: l_default_0 (ref), v234 (ref), l_KeystoreConstants_0 (ref), v12 (ref)
                            if v237 and v237.keystore and v237.keystore.isAvailable then
                                return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v234, l_KeystoreConstants_0.KeystoreTimeout);
                            else
                                return v12.resolve(nil);
                            end;
                        end):andThen(function() --[[ Line: 675 ]]
                            -- upvalues: v236 (copy)
                            return v236;
                        end);
                    else
                        return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v234, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 683 ]]
                            -- upvalues: v236 (copy)
                            return v236;
                        end);
                    end;
                end):andThen(function(v238) --[[ Line: 688 ]]
                    -- upvalues: v233 (copy), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v235 (copy), l_default_0 (ref)
                    local v239 = nil;
                    if v233 == true then
                        v239 = l_KeystoreConstants_0.Experiment;
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v238.id)));
                    else
                        v239 = l_KeystoreConstants_0.Control;
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v238.id)));
                    end;
                    local v240 = l_HttpService_0:JSONEncode({
                        server = tostring(l_ContentProvider_0.BaseUrl), 
                        username = tostring(v235.cvalue), 
                        userId = tostring(v238.id), 
                        password = tostring(v235.password), 
                        experimentGroup = tostring(v239)
                    });
                    return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v240, l_KeystoreConstants_0.KeystoreTimeout);
                end):andThen(function(_) --[[ Line: 719 ]]
                    -- upvalues: v231 (copy)
                    v231();
                end):catch(function(v242) --[[ Line: 722 ]]
                    -- upvalues: v232 (copy)
                    v232(v242);
                end);
                return;
            end;
        end):finally(function() --[[ Line: 731 ]]
            -- upvalues: l_LoginResult_0 (ref), v227 (copy), v123 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v202 (ref), v228 (copy), v229 (copy), v61 (ref), v184 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (ref), l_LaunchApp_0 (ref), v124 (ref), v125 (ref), v128 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
            if l_LoginResult_0.hasTwoStepData(v227) then
                local _ = v123(l_SetLoginResult_0(v227));
                l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTwoStepVerification, 1);
                spawn(function() --[[ Line: 738 ]]
                    -- upvalues: v202 (ref), v227 (ref), v228 (ref), v229 (ref)
                    v202(v227, v228, v229);
                end);
            else
                l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Success, 1);
                if v228 then
                    if v61 then
                        local v244 = v184(v228);
                        if v244 then
                            v244:await();
                        end;
                    else
                        v184(v228);
                    end;
                end;
                if l_FFlagEnableLuaAccountSwitch_0 then
                    v176(v227.accountBlob);
                else
                    local _ = v123(l_LaunchApp_0(v124, nil, v125, v128, l_LaunchContext_0.Login));
                end;
            end;
            if l_GetFFlagEnableLoginAccountSelector_0() then
                local _ = v123(l_CloseCentralOverlay_0());
            end;
        end);
    end;
    local v248 = nil;
    local function v249(v250, v251, v252, v253, v254, v255, v256) --[[ Line: 772 ]] --[[ Name: handleLoginWithFormData ]]
        -- upvalues: v248 (ref), v116 (copy), v123 (copy), l_SetBackNavigationDisabled_0 (ref), v249 (copy), v160 (copy), v124 (copy), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_FFlagEnablePWManagerLoginCheck_0 (ref), v142 (copy), l_HttpService_0 (ref), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v119 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v202 (copy), v61 (ref), v184 (copy), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (copy), l_LaunchApp_0 (copy), v125 (copy), v128 (copy), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
        local v257 = v248(v256);
        local v258 = v250 or v116.userIdentifier;
        local _ = v123(l_SetBackNavigationDisabled_0(true));
        return v160(v124, v258, v251, function(v260, v261) --[[ Line: 787 ]]
            -- upvalues: v249 (ref), v250 (copy), v251 (copy), v253 (copy), v254 (copy), v255 (copy), v256 (copy)
            if v260 then
                v249(v250, v251, v261, v253, v254, v255, v256);
            end;
        end, v252, function(v262) --[[ Line: 801 ]]
            -- upvalues: v249 (ref), v250 (copy), v251 (copy), v252 (copy), v254 (copy), v255 (copy), v256 (copy)
            v249(v250, v251, v252, v262, v254, v255, v256);
        end, v253, v254, v116.forceLoginByUsername):andThen(function(v263) --[[ Line: 823 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), v258 (copy), l_FFlagEnablePWManagerLoginCheck_0 (ref), v142 (ref), v255 (copy), l_HttpService_0 (ref), v251 (copy), v256 (copy), v123 (ref), l_SetBackNavigationDisabled_0 (ref), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v119 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v124 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v202 (ref), v61 (ref), v184 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (ref), l_LaunchApp_0 (ref), v125 (ref), v128 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
            l_AppStorageService_0:SetItem(l_AuthLocalStorageKeys_0.CredentialValue, v258);
            l_AppStorageService_0:Flush();
            if l_FFlagEnablePWManagerLoginCheck_0 and v142 then
                v142.setLoggedinUsingSavedPassword(true);
            end;
            local v264 = if not v255 then l_HttpService_0:JSONEncode({
                cvalue = v258, 
                password = v251, 
                authType = "login"
            }) else nil;
            local l_v256_0 = v256;
            local _ = v123(l_SetBackNavigationDisabled_0(false));
            v12.new(function(v267, v268) --[[ Line: 629 ]]
                -- upvalues: l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v264 (copy), v119 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v124 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v12 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref)
                if l_GetFFlagKeystoreAutoLoginAvailable_0() == false or v264 == nil then
                    v267();
                    return;
                else
                    local v269 = v119.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                    local v270 = l_HttpService_0:JSONEncode({
                        server = l_ContentProvider_0.BaseUrl
                    });
                    local v271 = l_HttpService_0:JSONDecode(v264);
                    l_GetUserByUsername_0(v124, v271.cvalue)():andThen(function(v272) --[[ Line: 650 ]]
                        -- upvalues: v268 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v270 (copy), v12 (ref)
                        if not v272 or not v272.id then
                            return v268("Invalid usernameInfo");
                        elseif l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                            return l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v273) --[[ Line: 660 ]]
                                -- upvalues: l_default_0 (ref), v270 (ref), l_KeystoreConstants_0 (ref), v12 (ref)
                                if v273 and v273.keystore and v273.keystore.isAvailable then
                                    return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v270, l_KeystoreConstants_0.KeystoreTimeout);
                                else
                                    return v12.resolve(nil);
                                end;
                            end):andThen(function() --[[ Line: 675 ]]
                                -- upvalues: v272 (copy)
                                return v272;
                            end);
                        else
                            return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v270, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 683 ]]
                                -- upvalues: v272 (copy)
                                return v272;
                            end);
                        end;
                    end):andThen(function(v274) --[[ Line: 688 ]]
                        -- upvalues: v269 (copy), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v271 (copy), l_default_0 (ref)
                        local v275 = nil;
                        if v269 == true then
                            v275 = l_KeystoreConstants_0.Experiment;
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v274.id)));
                        else
                            v275 = l_KeystoreConstants_0.Control;
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v274.id)));
                        end;
                        local v276 = l_HttpService_0:JSONEncode({
                            server = tostring(l_ContentProvider_0.BaseUrl), 
                            username = tostring(v271.cvalue), 
                            userId = tostring(v274.id), 
                            password = tostring(v271.password), 
                            experimentGroup = tostring(v275)
                        });
                        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v276, l_KeystoreConstants_0.KeystoreTimeout);
                    end):andThen(function(_) --[[ Line: 719 ]]
                        -- upvalues: v267 (copy)
                        v267();
                    end):catch(function(v278) --[[ Line: 722 ]]
                        -- upvalues: v268 (copy)
                        v268(v278);
                    end);
                    return;
                end;
            end):finally(function() --[[ Line: 731 ]]
                -- upvalues: l_LoginResult_0 (ref), v263 (copy), v123 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v202 (ref), v264 (copy), l_v256_0 (copy), v61 (ref), v184 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (ref), l_LaunchApp_0 (ref), v124 (ref), v125 (ref), v128 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
                if l_LoginResult_0.hasTwoStepData(v263) then
                    local _ = v123(l_SetLoginResult_0(v263));
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTwoStepVerification, 1);
                    spawn(function() --[[ Line: 738 ]]
                        -- upvalues: v202 (ref), v263 (ref), v264 (ref), l_v256_0 (ref)
                        v202(v263, v264, l_v256_0);
                    end);
                else
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Success, 1);
                    if v264 then
                        if v61 then
                            local v280 = v184(v264);
                            if v280 then
                                v280:await();
                            end;
                        else
                            v184(v264);
                        end;
                    end;
                    if l_FFlagEnableLuaAccountSwitch_0 then
                        v176(v263.accountBlob);
                    else
                        local _ = v123(l_LaunchApp_0(v124, nil, v125, v128, l_LaunchContext_0.Login));
                    end;
                end;
                if l_GetFFlagEnableLoginAccountSelector_0() then
                    local _ = v123(l_CloseCentralOverlay_0());
                end;
            end);
        end, function(v283) --[[ Line: 840 ]]
            -- upvalues: v257 (copy), v258 (copy), v251 (copy)
            v257(v283, v258, v251);
        end);
    end;
    local function v311(v284, v285, v286) --[[ Line: 845 ]]
        -- upvalues: v248 (ref), v123 (copy), l_SetBackNavigationDisabled_0 (ref), l_LoginByPasskey_0 (ref), v124 (copy), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v119 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v202 (copy), v61 (ref), v184 (copy), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (copy), l_LaunchApp_0 (copy), v125 (copy), v128 (copy), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
        local v287 = v248(v286);
        local _ = v123(l_SetBackNavigationDisabled_0(true));
        return v123(l_LoginByPasskey_0(v124, v284, v285)):andThen(function(v289) --[[ Line: 850 ]]
            -- upvalues: v286 (copy), v123 (ref), l_SetBackNavigationDisabled_0 (ref), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v119 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v124 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v202 (ref), v61 (ref), v184 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (ref), l_LaunchApp_0 (ref), v125 (ref), v128 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
            local l_v286_0 = v286;
            local v291 = v123(l_SetBackNavigationDisabled_0(false));
            v291 = v12.new;
            local v292 = nil;
            v291 = v291(function(v293, v294) --[[ Line: 629 ]]
                -- upvalues: l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v292 (copy), v119 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v124 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v12 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref)
                if l_GetFFlagKeystoreAutoLoginAvailable_0() == false or v292 == nil then
                    v293();
                    return;
                else
                    local v295 = v119.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                    local v296 = l_HttpService_0:JSONEncode({
                        server = l_ContentProvider_0.BaseUrl
                    });
                    local v297 = l_HttpService_0:JSONDecode(v292);
                    l_GetUserByUsername_0(v124, v297.cvalue)():andThen(function(v298) --[[ Line: 650 ]]
                        -- upvalues: v294 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v296 (copy), v12 (ref)
                        if not v298 or not v298.id then
                            return v294("Invalid usernameInfo");
                        elseif l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                            return l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v299) --[[ Line: 660 ]]
                                -- upvalues: l_default_0 (ref), v296 (ref), l_KeystoreConstants_0 (ref), v12 (ref)
                                if v299 and v299.keystore and v299.keystore.isAvailable then
                                    return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v296, l_KeystoreConstants_0.KeystoreTimeout);
                                else
                                    return v12.resolve(nil);
                                end;
                            end):andThen(function() --[[ Line: 675 ]]
                                -- upvalues: v298 (copy)
                                return v298;
                            end);
                        else
                            return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v296, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 683 ]]
                                -- upvalues: v298 (copy)
                                return v298;
                            end);
                        end;
                    end):andThen(function(v300) --[[ Line: 688 ]]
                        -- upvalues: v295 (copy), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v297 (copy), l_default_0 (ref)
                        local v301 = nil;
                        if v295 == true then
                            v301 = l_KeystoreConstants_0.Experiment;
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v300.id)));
                        else
                            v301 = l_KeystoreConstants_0.Control;
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v300.id)));
                        end;
                        local v302 = l_HttpService_0:JSONEncode({
                            server = tostring(l_ContentProvider_0.BaseUrl), 
                            username = tostring(v297.cvalue), 
                            userId = tostring(v300.id), 
                            password = tostring(v297.password), 
                            experimentGroup = tostring(v301)
                        });
                        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v302, l_KeystoreConstants_0.KeystoreTimeout);
                    end):andThen(function(_) --[[ Line: 719 ]]
                        -- upvalues: v293 (copy)
                        v293();
                    end):catch(function(v304) --[[ Line: 722 ]]
                        -- upvalues: v294 (copy)
                        v294(v304);
                    end);
                    return;
                end;
            end);
            local v305 = nil;
            v291:finally(function() --[[ Line: 731 ]]
                -- upvalues: l_LoginResult_0 (ref), v289 (copy), v123 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v202 (ref), v305 (copy), l_v286_0 (copy), v61 (ref), v184 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (ref), l_LaunchApp_0 (ref), v124 (ref), v125 (ref), v128 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
                if l_LoginResult_0.hasTwoStepData(v289) then
                    local _ = v123(l_SetLoginResult_0(v289));
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTwoStepVerification, 1);
                    spawn(function() --[[ Line: 738 ]]
                        -- upvalues: v202 (ref), v289 (ref), v305 (ref), l_v286_0 (ref)
                        v202(v289, v305, l_v286_0);
                    end);
                else
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Success, 1);
                    if v305 then
                        if v61 then
                            local v307 = v184(v305);
                            if v307 then
                                v307:await();
                            end;
                        else
                            v184(v305);
                        end;
                    end;
                    if l_FFlagEnableLuaAccountSwitch_0 then
                        v176(v289.accountBlob);
                    else
                        local _ = v123(l_LaunchApp_0(v124, nil, v125, v128, l_LaunchContext_0.Login));
                    end;
                end;
                if l_GetFFlagEnableLoginAccountSelector_0() then
                    local _ = v123(l_CloseCentralOverlay_0());
                end;
            end);
        end, function(v310) --[[ Line: 852 ]]
            -- upvalues: v287 (copy), v284 (copy)
            v287(v310, v284, nil);
        end);
    end;
    local function v312(v313, v314, v315, v316, v317) --[[ Line: 857 ]] --[[ Name: handleLoginWithCode ]]
        -- upvalues: v248 (ref), v123 (copy), l_SetBackNavigationDisabled_0 (ref), v312 (copy), l_LoginByCode_0 (ref), v124 (copy), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v119 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v202 (copy), v61 (ref), v184 (copy), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (copy), l_LaunchApp_0 (copy), v125 (copy), v128 (copy), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
        local v318 = v248(v317);
        local _ = v123(l_SetBackNavigationDisabled_0(true));
        return v123(l_LoginByCode_0(v124, v313, v314, function(v320, v321) --[[ Line: 868 ]]
            -- upvalues: v312 (ref), v313 (copy), v314 (copy), v317 (copy)
            if v320 then
                v312(v313, v314, v321, nil, v317);
            end;
        end, v315, function(v322) --[[ Line: 874 ]]
            -- upvalues: v312 (ref), v313 (copy), v314 (copy), v317 (copy)
            v312(v313, v314, nil, v322, v317);
        end, v316)):andThen(function(v323) --[[ Line: 885 ]]
            -- upvalues: v317 (copy), v123 (ref), l_SetBackNavigationDisabled_0 (ref), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v119 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v124 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v202 (ref), v61 (ref), v184 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (ref), l_LaunchApp_0 (ref), v125 (ref), v128 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
            local l_v317_0 = v317;
            local v325 = v123(l_SetBackNavigationDisabled_0(false));
            v325 = v12.new;
            local v326 = nil;
            v325 = v325(function(v327, v328) --[[ Line: 629 ]]
                -- upvalues: l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v326 (copy), v119 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v124 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v12 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref)
                if l_GetFFlagKeystoreAutoLoginAvailable_0() == false or v326 == nil then
                    v327();
                    return;
                else
                    local v329 = v119.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                    local v330 = l_HttpService_0:JSONEncode({
                        server = l_ContentProvider_0.BaseUrl
                    });
                    local v331 = l_HttpService_0:JSONDecode(v326);
                    l_GetUserByUsername_0(v124, v331.cvalue)():andThen(function(v332) --[[ Line: 650 ]]
                        -- upvalues: v328 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v330 (copy), v12 (ref)
                        if not v332 or not v332.id then
                            return v328("Invalid usernameInfo");
                        elseif l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                            return l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v333) --[[ Line: 660 ]]
                                -- upvalues: l_default_0 (ref), v330 (ref), l_KeystoreConstants_0 (ref), v12 (ref)
                                if v333 and v333.keystore and v333.keystore.isAvailable then
                                    return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v330, l_KeystoreConstants_0.KeystoreTimeout);
                                else
                                    return v12.resolve(nil);
                                end;
                            end):andThen(function() --[[ Line: 675 ]]
                                -- upvalues: v332 (copy)
                                return v332;
                            end);
                        else
                            return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v330, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 683 ]]
                                -- upvalues: v332 (copy)
                                return v332;
                            end);
                        end;
                    end):andThen(function(v334) --[[ Line: 688 ]]
                        -- upvalues: v329 (copy), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v331 (copy), l_default_0 (ref)
                        local v335 = nil;
                        if v329 == true then
                            v335 = l_KeystoreConstants_0.Experiment;
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v334.id)));
                        else
                            v335 = l_KeystoreConstants_0.Control;
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v334.id)));
                        end;
                        local v336 = l_HttpService_0:JSONEncode({
                            server = tostring(l_ContentProvider_0.BaseUrl), 
                            username = tostring(v331.cvalue), 
                            userId = tostring(v334.id), 
                            password = tostring(v331.password), 
                            experimentGroup = tostring(v335)
                        });
                        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v336, l_KeystoreConstants_0.KeystoreTimeout);
                    end):andThen(function(_) --[[ Line: 719 ]]
                        -- upvalues: v327 (copy)
                        v327();
                    end):catch(function(v338) --[[ Line: 722 ]]
                        -- upvalues: v328 (copy)
                        v328(v338);
                    end);
                    return;
                end;
            end);
            local v339 = nil;
            v325:finally(function() --[[ Line: 731 ]]
                -- upvalues: l_LoginResult_0 (ref), v323 (copy), v123 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v202 (ref), v339 (copy), l_v317_0 (copy), v61 (ref), v184 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (ref), l_LaunchApp_0 (ref), v124 (ref), v125 (ref), v128 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
                if l_LoginResult_0.hasTwoStepData(v323) then
                    local _ = v123(l_SetLoginResult_0(v323));
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTwoStepVerification, 1);
                    spawn(function() --[[ Line: 738 ]]
                        -- upvalues: v202 (ref), v323 (ref), v339 (ref), l_v317_0 (ref)
                        v202(v323, v339, l_v317_0);
                    end);
                else
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Success, 1);
                    if v339 then
                        if v61 then
                            local v341 = v184(v339);
                            if v341 then
                                v341:await();
                            end;
                        else
                            v184(v339);
                        end;
                    end;
                    if l_FFlagEnableLuaAccountSwitch_0 then
                        v176(v323.accountBlob);
                    else
                        local _ = v123(l_LaunchApp_0(v124, nil, v125, v128, l_LaunchContext_0.Login));
                    end;
                end;
                if l_GetFFlagEnableLoginAccountSelector_0() then
                    local _ = v123(l_CloseCentralOverlay_0());
                end;
            end);
        end, function(v344) --[[ Line: 887 ]]
            -- upvalues: l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v318 (copy), v313 (copy), v314 (copy)
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureAuthCode, 1);
            v318(v344, v313, v314);
        end);
    end;
    local function v345(v346, v347, v348, v349, v350) --[[ Line: 893 ]] --[[ Name: handleLoginWithOtp ]]
        -- upvalues: v248 (ref), v123 (copy), l_SetBackNavigationDisabled_0 (ref), v345 (copy), l_LoginByOtp_0 (ref), v124 (copy), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), v116 (copy), l_FFlagEnableRecordLogin_0 (ref), l_recordLogin_0 (ref), l_LoginMethods_0 (ref), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v119 (copy), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v202 (copy), v61 (ref), v184 (copy), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (copy), l_LaunchApp_0 (copy), v125 (copy), v128 (copy), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
        local v351 = v248(v350);
        local _ = v123(l_SetBackNavigationDisabled_0(true));
        return v123(l_LoginByOtp_0(v124, v346, v347, function(v353) --[[ Line: 904 ]]
            -- upvalues: v345 (ref), v346 (copy), v347 (copy), v349 (copy), v350 (copy)
            v345(v346, v347, v353, v349, v350);
        end, v348, v349)):andThen(function(v354) --[[ Line: 909 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), v116 (ref), l_FFlagEnableRecordLogin_0 (ref), l_recordLogin_0 (ref), l_LoginMethods_0 (ref), v350 (copy), v123 (ref), l_SetBackNavigationDisabled_0 (ref), v12 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v119 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v124 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_LoginResult_0 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v202 (ref), v61 (ref), v184 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (ref), l_LaunchApp_0 (ref), v125 (ref), v128 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
            l_AppStorageService_0:SetItem(l_AuthLocalStorageKeys_0.CredentialValue, v116.userIdentifier);
            if l_FFlagEnableRecordLogin_0 then
                pcall(function() --[[ Line: 912 ]]
                    -- upvalues: l_recordLogin_0 (ref), v354 (copy), l_LoginMethods_0 (ref), v116 (ref)
                    l_recordLogin_0(v354, l_LoginMethods_0.EmailOtp, v116.userIdentifier);
                end);
            end;
            local l_v350_0 = v350;
            local v356 = v123(l_SetBackNavigationDisabled_0(false));
            v356 = v12.new;
            local v357 = nil;
            v356 = v356(function(v358, v359) --[[ Line: 629 ]]
                -- upvalues: l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v357 (copy), v119 (ref), l_GetFFlagBypassKeystoreLoginIxpV2_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_GetUserByUsername_0 (ref), v124 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v12 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref)
                if l_GetFFlagKeystoreAutoLoginAvailable_0() == false or v357 == nil then
                    v358();
                    return;
                else
                    local v360 = v119.shouldLoginWithKeystoreCredentials or l_GetFFlagBypassKeystoreLoginIxpV2_0();
                    local v361 = l_HttpService_0:JSONEncode({
                        server = l_ContentProvider_0.BaseUrl
                    });
                    local v362 = l_HttpService_0:JSONDecode(v357);
                    l_GetUserByUsername_0(v124, v362.cvalue)():andThen(function(v363) --[[ Line: 650 ]]
                        -- upvalues: v359 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v361 (copy), v12 (ref)
                        if not v363 or not v363.id then
                            return v359("Invalid usernameInfo");
                        elseif l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                            return l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v364) --[[ Line: 660 ]]
                                -- upvalues: l_default_0 (ref), v361 (ref), l_KeystoreConstants_0 (ref), v12 (ref)
                                if v364 and v364.keystore and v364.keystore.isAvailable then
                                    return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v361, l_KeystoreConstants_0.KeystoreTimeout);
                                else
                                    return v12.resolve(nil);
                                end;
                            end):andThen(function() --[[ Line: 675 ]]
                                -- upvalues: v363 (copy)
                                return v363;
                            end);
                        else
                            return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v361, l_KeystoreConstants_0.KeystoreTimeout):andThen(function() --[[ Line: 683 ]]
                                -- upvalues: v363 (copy)
                                return v363;
                            end);
                        end;
                    end):andThen(function(v365) --[[ Line: 688 ]]
                        -- upvalues: v360 (copy), l_KeystoreConstants_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), v362 (copy), l_default_0 (ref)
                        local v366 = nil;
                        if v360 == true then
                            v366 = l_KeystoreConstants_0.Experiment;
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsExperimentGroup, (tostring(v365.id)));
                        else
                            v366 = l_KeystoreConstants_0.Control;
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.saveCredentialsControlGroup, (tostring(v365.id)));
                        end;
                        local v367 = l_HttpService_0:JSONEncode({
                            server = tostring(l_ContentProvider_0.BaseUrl), 
                            username = tostring(v362.cvalue), 
                            userId = tostring(v365.id), 
                            password = tostring(v362.password), 
                            experimentGroup = tostring(v366)
                        });
                        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.keystore, v367, l_KeystoreConstants_0.KeystoreTimeout);
                    end):andThen(function(_) --[[ Line: 719 ]]
                        -- upvalues: v358 (copy)
                        v358();
                    end):catch(function(v369) --[[ Line: 722 ]]
                        -- upvalues: v359 (copy)
                        v359(v369);
                    end);
                    return;
                end;
            end);
            local v370 = nil;
            v356:finally(function() --[[ Line: 731 ]]
                -- upvalues: l_LoginResult_0 (ref), v354 (copy), v123 (ref), l_SetLoginResult_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v202 (ref), v370 (copy), l_v350_0 (copy), v61 (ref), v184 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v176 (ref), l_LaunchApp_0 (ref), v124 (ref), v125 (ref), v128 (ref), l_LaunchContext_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), l_CloseCentralOverlay_0 (ref)
                if l_LoginResult_0.hasTwoStepData(v354) then
                    local _ = v123(l_SetLoginResult_0(v354));
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTwoStepVerification, 1);
                    spawn(function() --[[ Line: 738 ]]
                        -- upvalues: v202 (ref), v354 (ref), v370 (ref), l_v350_0 (ref)
                        v202(v354, v370, l_v350_0);
                    end);
                else
                    l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Success, 1);
                    if v370 then
                        if v61 then
                            local v372 = v184(v370);
                            if v372 then
                                v372:await();
                            end;
                        else
                            v184(v370);
                        end;
                    end;
                    if l_FFlagEnableLuaAccountSwitch_0 then
                        v176(v354.accountBlob);
                    else
                        local _ = v123(l_LaunchApp_0(v124, nil, v125, v128, l_LaunchContext_0.Login));
                    end;
                end;
                if l_GetFFlagEnableLoginAccountSelector_0() then
                    local _ = v123(l_CloseCentralOverlay_0());
                end;
            end);
        end, function(v375) --[[ Line: 918 ]]
            -- upvalues: v351 (copy), v346 (copy), v347 (copy)
            v351(v375, v346, v347);
        end);
    end;
    local function v384(v376, v377) --[[ Line: 924 ]]
        -- upvalues: v123 (copy), l_SetBackNavigationDisabled_0 (ref), l_Constants_1 (ref), v116 (copy), l_SendCode_0 (ref), v124 (copy)
        local v378 = v123(l_SetBackNavigationDisabled_0(true));
        v378 = {
            origin = l_Constants_1.otpServiceOrigin, 
            contactType = l_Constants_1.otpServiceContactType, 
            contactValue = v116.userIdentifier
        };
        return v123(l_SendCode_0(v124, v378)):andThen(function(v379) --[[ Line: 935 ]]
            -- upvalues: v376 (copy)
            v376(v379.otpSessionToken);
        end, function(v380) --[[ Line: 938 ]]
            -- upvalues: v377 (copy), l_Constants_1 (ref)
            v377.setInProgress(false);
            local v381 = tonumber(v380) or 0;
            local v382 = l_Constants_1.statusCodeMap[v381] or "Unknown";
            local v383 = l_Constants_1.errorMessageKeys[v382] or l_Constants_1.errorMessageKeys.Unknown;
            v377.setErrorKey(v383);
        end);
    end;
    local function v394(v385, v386, v387) --[[ Line: 947 ]]
        -- upvalues: v123 (copy), l_SetBackNavigationDisabled_0 (ref), l_Constants_1 (ref), l_ResendCode_0 (ref), v124 (copy)
        local v388 = v123(l_SetBackNavigationDisabled_0(true));
        v388 = {
            origin = l_Constants_1.otpServiceOrigin, 
            contactType = l_Constants_1.otpServiceContactType, 
            otpSessionToken = v385
        };
        return v123(l_ResendCode_0(v124, v388)):andThen(function(v389) --[[ Line: 959 ]]
            -- upvalues: v386 (copy)
            v386(v389.otpSessionToken);
        end, function(v390) --[[ Line: 962 ]]
            -- upvalues: v387 (copy), l_Constants_1 (ref)
            v387.setInProgress(false);
            local v391 = tonumber(v390) or 0;
            local v392 = l_Constants_1.statusCodeMap[v391] or "Unknown";
            local v393 = l_Constants_1.errorMessageKeys[v392] or l_Constants_1.errorMessageKeys.Unknown;
            v387.setErrorKey(v393);
        end);
    end;
    local function v414(v395, v396, v397) --[[ Line: 971 ]]
        -- upvalues: v134 (copy), v116 (copy), v132 (copy), l_HttpService_0 (ref), l_Constants_0 (ref), l_UserInputService_0 (ref), l_Base64_0 (ref), l_default_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), v311 (copy)
        local v398 = v396 and function() --[[ Line: 978 ]]
            -- upvalues: v134 (ref), v116 (ref)
            return v134({
                cvalue = v116.userIdentifier, 
                ctype = v116.userIdentifierType
            });
        end or function() --[[ Line: 984 ]]
            -- upvalues: v132 (ref)
            return v132();
        end;
        local v399 = false;
        return v398():andThen(function(v400) --[[ Line: 991 ]]
            -- upvalues: l_HttpService_0 (ref), l_Constants_0 (ref), v397 (copy), l_UserInputService_0 (ref), l_Base64_0 (ref), l_default_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), v395 (copy), v399 (ref), v311 (ref)
            local v401 = l_HttpService_0:JSONDecode(v400.authenticationOptions);
            local l_sessionId_0 = v400.sessionId;
            local v403 = tonumber(v401.publicKey.timeout);
            local v404 = if v403 then v403 / 1000 else l_Constants_0.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT;
            v401.keyType = "platform";
            v401.deviceBoundOnly = v397;
            if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                v401.publicKey.challenge = l_Base64_0.FromUrlSafeBase64(v401.publicKey.challenge);
                if v401.publicKey.allowCredentials then
                    for _, v406 in ipairs(v401.publicKey.allowCredentials) do
                        v406.id = l_Base64_0.FromUrlSafeBase64(v406.id);
                    end;
                end;
            end;
            local v407 = l_HttpService_0:JSONEncode(v401);
            l_default_0:getCredentials(l_default_0.CredentialsTypes.FIDO2, v407, v404):andThen(function(v408) --[[ Line: 1017 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_FFlagUseErrorTypeForPasskeyLoginLogging_0 (ref), l_CredentialsProtocolErrorCodes_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), l_PasskeyConstants_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), l_Base64_0 (ref), v395 (ref), v399 (ref), v311 (ref), l_sessionId_0 (copy)
                if v408 ~= nil then
                    local v409 = l_HttpService_0:JSONDecode(v408);
                    if v409 == nil or next(v409) == nil then
                        l_Logger_0:info("Passkey credential signing failed. No result returned.");
                        return;
                    elseif v409.errorCode ~= nil then
                        l_Logger_0:info("Passkey credential signing failed. Error {} (msg: {}) returned.", v409.errorCode, v409.errorMsg);
                        if l_FFlagUseErrorTypeForPasskeyLoginLogging_0 then
                            local v410 = tonumber(v409.errorCode);
                            local v411 = l_CredentialsProtocolErrorCodes_0.GetCredentialsErrorCodes[v410 or -1] or string.format(l_CredentialsProtocolErrorCodes_0.UNMAPPED_ERROR_CODE, (tostring(v409.errorCode)));
                            l_authClientError_0(l_EventStreamConstants_0.Context.PasskeyLoginAttempt, v411, l_PasskeyConstants_0.PASSKEY_FETCH_LOGIN_V2);
                            return;
                        elseif l_FFlagEnablePasskeyLoginErrorLogging_0 and type(v409.errorMsg) == "string" then
                            l_authClientError_0(l_EventStreamConstants_0.Context.PasskeyLoginAttempt, v409.errorMsg, l_PasskeyConstants_0.PASSKEY_FETCH_LOGIN_V2);
                            return;
                        end;
                    else
                        l_Logger_0:info("Passkey credential signing completed. Attempting login.");
                        v409.id = l_Base64_0.ToUrlSafeBase64(v409.id);
                        v409.rawId = l_Base64_0.ToUrlSafeBase64(v409.rawId);
                        v409.response.signature = l_Base64_0.ToUrlSafeBase64(v409.response.signature);
                        v409.response.userHandle = l_Base64_0.ToUrlSafeBase64(v409.response.userHandle);
                        v409.response.authenticatorData = l_Base64_0.ToUrlSafeBase64(v409.response.authenticatorData);
                        v409.response.clientDataJSON = l_Base64_0.ToUrlSafeBase64(v409.response.clientDataJSON);
                        v395.setInProgress(true);
                        v399 = true;
                        v311(v409, l_sessionId_0, v395);
                    end;
                end;
            end, function(v412) --[[ Line: 1067 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Passkey credential signing failed. Error: {}", v412);
            end):await();
        end, function(v413) --[[ Line: 1071 ]]
            -- upvalues: l_Logger_0 (ref), v396 (copy), v397 (copy), v395 (copy)
            l_Logger_0:warning("Fetching passkey login options failed with error code: {}", v413.errorCode);
            if v396 and not v397 then
                v395.setErrorKey("Authentication.Login.Response.UnableToSignIn");
            end;
        end):finally(function() --[[ Line: 1078 ]]
            -- upvalues: v395 (copy), v399 (ref)
            if v395.onCredentialsPopupAbandoned and not v399 then
                v395.onCredentialsPopupAbandoned();
            end;
        end);
    end;
    local function v436(v415, v416, v417, v418) --[[ Line: 1085 ]]
        -- upvalues: v134 (copy), v116 (copy), v132 (copy), l_HttpService_0 (ref), l_Constants_0 (ref), l_UserInputService_0 (ref), l_Base64_0 (ref), l_Logger_0 (ref), l_default_1 (ref), l_TelemetryConfigs_0 (ref), l_default_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), l_PasskeyConstants_0 (ref), v249 (copy), v311 (copy)
        if not v415 and not v416 then
            return;
        else
            local v419 = v417 and function() --[[ Line: 1097 ]]
                -- upvalues: v134 (ref), v116 (ref)
                return v134({
                    cvalue = v116.userIdentifier, 
                    ctype = v116.userIdentifierType
                });
            end or function() --[[ Line: 1103 ]]
                -- upvalues: v132 (ref)
                return v132();
            end;
            local v420 = nil;
            local v421 = nil;
            local v422 = nil;
            local v423 = {};
            if v415 then
                v419():andThen(function(v424) --[[ Line: 1113 ]]
                    -- upvalues: v420 (ref), l_HttpService_0 (ref), v421 (ref), v422 (ref), l_Constants_0 (ref), l_UserInputService_0 (ref), l_Base64_0 (ref)
                    v420 = l_HttpService_0:JSONDecode(v424.authenticationOptions);
                    v421 = v424.sessionId;
                    v422 = tonumber(v420.publicKey.timeout) or l_Constants_0.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT;
                    v420.keyType = "platform";
                    v420.deviceBoundOnly = true;
                    if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
                        v420.publicKey.challenge = l_Base64_0.FromUrlSafeBase64(v420.publicKey.challenge);
                        if v420.publicKey.allowCredentials then
                            for _, v426 in ipairs(v420.publicKey.allowCredentials) do
                                v426.id = l_Base64_0.FromUrlSafeBase64(v426.id);
                            end;
                        end;
                    end;
                end, function(v427) --[[ Line: 1134 ]]
                    -- upvalues: l_Logger_0 (ref)
                    l_Logger_0:warning("Fetching passkey login options failed with error code: {}", v427.errorCode);
                end):await();
                if v420 ~= nil then
                    v423.FIDO2 = v420;
                end;
            end;
            if v416 then
                v423.password = {};
                if v417 then
                    v423.password.username = v116.userIdentifier;
                end;
            end;
            local v428 = if v422 then v422 / 1000 else l_Constants_0.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT;
            local v429 = false;
            local v430 = l_HttpService_0:JSONEncode(v423);
            l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginCredentialSheetShownConfig, 1);
            return l_default_0:getCredentials(l_default_0.CredentialsTypes.all, v430, v428):andThen(function(v431) --[[ Line: 1164 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_default_1 (ref), l_TelemetryConfigs_0 (ref), l_FFlagEnablePasskeyLoginErrorLogging_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), l_PasskeyConstants_0 (ref), l_default_0 (ref), v418 (copy), v429 (ref), v249 (ref), l_Base64_0 (ref), v311 (ref), v421 (ref)
                if v431 ~= nil then
                    local v432 = l_HttpService_0:JSONDecode(v431);
                    if v432 == nil or not v432.response and not v432.errorCode then
                        l_Logger_0:info("Generic credential fetch failed. No result returned.");
                        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginCredentialSheetDismissedConfig, 1);
                        return;
                    elseif v432.errorCode ~= nil then
                        l_Logger_0:info("Generic credential fetch failed. Error {} (msg: {}) returned.", v432.errorCode, v432.errorMsg);
                        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginCredentialSheetErrorConfig, 1, {
                            errorCode = tostring(v432.errorCode)
                        });
                        if l_FFlagEnablePasskeyLoginErrorLogging_0 and type(v432.errorMsg) == "string" then
                            l_authClientError_0(l_EventStreamConstants_0.Context.PasskeyLoginAttempt, v432.errorMsg, l_PasskeyConstants_0.GENERIC_CREDENTIAL_FETCH_LOGIN_V2);
                            return;
                        end;
                    elseif v432.credentialType == l_default_0.CredentialsTypes.password then
                        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginCredentialSheetPasswordSelectedConfig, 1);
                        v418.setInProgress(true);
                        v429 = true;
                        v249(v432.response.username, v432.response.password, nil, nil, nil, true, v418);
                        return;
                    elseif v432.credentialType == l_default_0.CredentialsTypes.FIDO2 then
                        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginCredentialSheetPasskeySelectedConfig, 1);
                        v432.response.id = l_Base64_0.ToUrlSafeBase64(v432.response.id);
                        v432.response.rawId = l_Base64_0.ToUrlSafeBase64(v432.response.rawId);
                        v432.response.response.signature = l_Base64_0.ToUrlSafeBase64(v432.response.response.signature);
                        v432.response.response.userHandle = l_Base64_0.ToUrlSafeBase64(v432.response.response.userHandle);
                        v432.response.response.authenticatorData = l_Base64_0.ToUrlSafeBase64(v432.response.response.authenticatorData);
                        v432.response.response.clientDataJSON = l_Base64_0.ToUrlSafeBase64(v432.response.response.clientDataJSON);
                        v418.setInProgress(true);
                        v429 = true;
                        v311(v432.response, v421, v418);
                    end;
                end;
            end, function(v433) --[[ Line: 1229 ]]
                -- upvalues: l_Logger_0 (ref), l_default_1 (ref), l_TelemetryConfigs_0 (ref)
                l_Logger_0:warning("Generic credential signing failed. Error: {}", v433);
                l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.IosAuthServiceLoginCredentialSheetDismissedConfig, 1);
            end):andThen(function(_) --[[ Line: 1238 ]]
                -- upvalues: v418 (copy), v429 (ref)
                if v418.onCredentialsPopupAbandoned and not v429 then
                    v418.onCredentialsPopupAbandoned();
                end;
            end):catch(function(_) --[[ Line: 1244 ]]
                -- upvalues: v418 (copy), v429 (ref)
                if v418.onCredentialsPopupAbandoned and not v429 then
                    v418.onCredentialsPopupAbandoned();
                end;
            end);
        end;
    end;
    local function v445(v437, v438, v439, v440, v441, v442, v443, v444) --[[ Line: 1251 ]]
        -- upvalues: v123 (copy), l_OpenAccountSwitchingErrorOverlay_0 (ref)
        return v123(l_OpenAccountSwitchingErrorOverlay_0(v437, v438, v439, v440, v441, v442, v443, v444));
    end;
    local function v446() --[[ Line: 1275 ]]
        -- upvalues: v123 (copy), l_OpenCentralOverlayForLoginPasswordResetPrompt_0 (ref)
        return v123(l_OpenCentralOverlayForLoginPasswordResetPrompt_0());
    end;
    local function v449(v447, v448) --[[ Line: 1279 ]]
        -- upvalues: l_LogoutAllLoggedInUsers_0 (ref)
        return l_LogoutAllLoggedInUsers_0(v447, v448);
    end;
    local function v453(v450, v451, v452) --[[ Line: 1283 ]]
        -- upvalues: v123 (copy), l_Logout_0 (copy)
        return v123(l_Logout_0(v450, v451, v452));
    end;
    local function v454() --[[ Line: 1287 ]]
        -- upvalues: v123 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v126 (copy), l_GetFStringVNGDownloadNowUrl_0 (ref)
        return v123(l_SetCentralOverlay_0(l_CentralOverlayType_0.NewAppAvailableModal, {
            onButtonActivated = function() --[[ Line: 1289 ]] --[[ Name: onButtonActivated ]]
                -- upvalues: v126 (ref), l_GetFStringVNGDownloadNowUrl_0 (ref)
                v126:openURL(l_GetFStringVNGDownloadNowUrl_0());
            end
        }));
    end;
    local function v464(v455, v456, v457, v458) --[[ Line: 1296 ]]
        -- upvalues: l_EventStreamConstants_0 (ref), v116 (copy), l_UserIdentifierType_0 (ref), v345 (copy), v249 (copy), v123 (copy), l_CloseCentralOverlay_0 (ref), l_OpenAccountSelector_0 (ref)
        local v459 = "";
        if v458.isLoginByOtp then
            v459 = l_EventStreamConstants_0.Context.DisambiguationOTP;
        elseif v116.userIdentifierType == l_UserIdentifierType_0.Email then
            v459 = l_EventStreamConstants_0.Context.DisambiguationEmail;
        elseif v116.userIdentifierType == l_UserIdentifierType_0.Phone then
            v459 = l_EventStreamConstants_0.Context.DisambiguationPhone;
        end;
        local v462 = {
            origin = l_EventStreamConstants_0.Context.Login, 
            context = v459, 
            users = v455, 
            onAccountSelection = function(v460) --[[ Line: 1315 ]] --[[ Name: onAccountSelection ]]
                -- upvalues: v458 (copy), v345 (ref), v456 (copy), v457 (copy), v249 (ref)
                if v458.isLoginByOtp then
                    v345(v456, v457, nil, v460, v458);
                    return;
                else
                    v249(v456, v457, nil, nil, v460, false, v458):await();
                    return;
                end;
            end, 
            onAccountSelectionAbandoned = function() --[[ Line: 1322 ]] --[[ Name: onAccountSelectionAbandoned ]]
                -- upvalues: v458 (copy), v123 (ref), l_CloseCentralOverlay_0 (ref)
                v458.setInProgress(false);
                local _ = v123(l_CloseCentralOverlay_0());
            end, 
            titleTextKey = "Authentication.Login.Label.AccountSelectorTitle"
        };
        local _ = v123(l_OpenAccountSelector_0(v462, true, false));
    end;
    local function v466(v465) --[[ Line: 1332 ]]
        -- upvalues: v141 (copy), v117 (copy), v68 (ref), v67 (ref)
        v141();
        v117({
            type = v68.SetComponentState, 
            data = {
                component = v67.LoginScreenV2, 
                payload = {
                    errorKey = v465.errorKey
                }
            }
        });
        v117({
            type = v68.ForceLoginByUsername
        });
    end;
    local function v468(v467) --[[ Line: 1348 ]]
        -- upvalues: l_LoginErrorCodes_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), l_StatusCodes_0 (ref)
        if v467.errorCode == l_LoginErrorCodes_0.IncorrectCValueOrPassword then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureCredentials, 1);
            return;
        elseif v467.errorCode == l_LoginErrorCodes_0.AccountLocked then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailurePasswordReset, 1);
            return;
        elseif v467.errorCode == l_LoginErrorCodes_0.CTypeNotSupported then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureBadRequest, 1);
            return;
        elseif v467.errorCode == l_LoginErrorCodes_0.CValueAndPasswordRequired then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureBadRequest, 1);
            return;
        elseif v467.errorCode == l_LoginErrorCodes_0.SecurityQuestions then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureSecurityQuestions, 1);
            return;
        elseif v467.errorCode == l_LoginErrorCodes_0.MultipleUsersPerCredential then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureMultipleUsersPerCredential, 1);
            return;
        elseif v467.HttpError == Enum.HttpError.OK and v467.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureThrottled, 1);
            return;
        elseif v467.HttpError == Enum.HttpError.OK and v467.StatusCode == l_StatusCodes_0.REQUEST_TIMEOUT then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureTimeout, 1);
            return;
        elseif v467.HttpError == Enum.HttpError.OK and v467.StatusCode == l_StatusCodes_0.BAD_REQUEST then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureBadRequest, 1);
            return;
        elseif v467.HttpError == Enum.HttpError.OK and v467.StatusCode == l_StatusCodes_0.NOT_FOUND then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureNotFound, 1);
            return;
        elseif v467.HttpError == Enum.HttpError.OK and v467.StatusCode == l_StatusCodes_0.INTERNAL_SERVER_ERROR then
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureInternalServerError, 1);
            return;
        else
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.FailureUnknownError, 1);
            return;
        end;
    end;
    v248 = function(v469) --[[ Line: 1376 ]]
        -- upvalues: l_LoginErrorCodes_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v468 (copy), l_authClientError_0 (ref), v123 (copy), l_CloseCentralOverlay_0 (ref), l_AppStorageUtilities_0 (ref), l_User_0 (ref), v124 (copy), l_LogoutAllLoggedInUsers_0 (ref), l_ResetAppState_0 (copy), v12 (ref), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), l_GuiService_0 (ref), l_LogoutReasonNames_0 (ref), l_Logout_0 (copy), l_FFlagEnableLuaAccountSwitch_0 (ref), v122 (copy), l_AccountSwitcherConstants_0 (ref), l_OpenAccountSwitchingErrorOverlay_0 (ref), v466 (copy), v67 (ref), l_OpenCentralOverlayForLoginPasswordResetPrompt_0 (ref), v454 (copy), v212 (copy), v464 (copy)
        return function(v470, v471, v472) --[[ Line: 1377 ]] --[[ Name: handleLoginError ]]
            -- upvalues: l_LoginErrorCodes_0 (ref), l_reportEphemeralCounter_0 (ref), l_AppLoginCounterNames_0 (ref), v468 (ref), l_authClientError_0 (ref), v469 (copy), v123 (ref), l_CloseCentralOverlay_0 (ref), l_AppStorageUtilities_0 (ref), l_User_0 (ref), v124 (ref), l_LogoutAllLoggedInUsers_0 (ref), l_ResetAppState_0 (ref), v12 (ref), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), l_GuiService_0 (ref), l_LogoutReasonNames_0 (ref), l_Logout_0 (ref), l_FFlagEnableLuaAccountSwitch_0 (ref), v122 (ref), l_AccountSwitcherConstants_0 (ref), l_OpenAccountSwitchingErrorOverlay_0 (ref), v466 (ref), v67 (ref), l_OpenCentralOverlayForLoginPasswordResetPrompt_0 (ref), v454 (ref), v212 (ref), v464 (ref)
            local v473 = false;
            local v474 = v470.errorCode == l_LoginErrorCodes_0.MultipleUsersPerCredential;
            local v475 = v470.errorCode == l_LoginErrorCodes_0.SecurityQuestions;
            if v474 or v475 then
                v473 = true;
            end;
            l_reportEphemeralCounter_0(l_AppLoginCounterNames_0.Failure, 1);
            v468(v470);
            l_authClientError_0(v469.eventContext, v470.errorCode);
            local function v477() --[[ Line: 1395 ]]
                -- upvalues: v469 (ref), v473 (ref), v123 (ref), l_CloseCentralOverlay_0 (ref)
                v469.setInProgress(v473);
                local _ = v123(l_CloseCentralOverlay_0());
            end;
            local function v486() --[[ Line: 1400 ]]
                -- upvalues: l_AppStorageUtilities_0 (ref), l_User_0 (ref), v469 (ref), v124 (ref), l_LogoutAllLoggedInUsers_0 (ref), v123 (ref), l_ResetAppState_0 (ref), v12 (ref), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), l_GuiService_0 (ref), l_LogoutReasonNames_0 (ref), l_Logout_0 (ref), l_CloseCentralOverlay_0 (ref)
                local v478 = l_AppStorageUtilities_0.getAccountBlob();
                local v479 = l_User_0.fromLocalStorage().userId ~= -1;
                v469.setInProgress(true);
                l_LogoutAllLoggedInUsers_0(v124, v478):await();
                if v479 == true then
                    v123(l_ResetAppState_0());
                    local v480 = v12.resolve();
                    l_AppStorageService_0:SetItem(l_AuthLocalStorageKeys_0.CredentialValue, "");
                    l_AppStorageService_0:Flush();
                    if l_FFlagAddReasonToEveryLogout_0 then
                        v480 = v124;
                        local l_l_GuiService_0_0 = l_GuiService_0;
                        local l_LoginContextAccountSwitchingErrorOverlay_0 = l_LogoutReasonNames_0.LoginContextAccountSwitchingErrorOverlay;
                        local _ = v123(l_Logout_0(v480, l_l_GuiService_0_0, l_LoginContextAccountSwitchingErrorOverlay_0));
                    else
                        local _ = v123(l_Logout_0(v124, l_GuiService_0, nil));
                    end;
                end;
                v469.setInProgress(false);
                local _ = v123(l_CloseCentralOverlay_0());
            end;
            if l_FFlagEnableLuaAccountSwitch_0 and v470.errorCode == l_LoginErrorCodes_0.EmptyAccountSwitchBlobRequired then
                v469.setErrorKey("");
                local v487 = v122 and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts";
                local v488 = v122 and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.LogoutConfirmation";
                local v489 = v122 and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts";
                local l_AccountSwitcherLoginEmptyBlobRequiredError_0 = l_AccountSwitcherConstants_0.AccountSwitcherLoginEmptyBlobRequiredError;
                local v491 = v471 or nil;
                local _ = v123(l_OpenAccountSwitchingErrorOverlay_0(v487, v488, v489, "Authentication.CrossDevice.Action.CancelLogin", v486, v477, l_AccountSwitcherLoginEmptyBlobRequiredError_0, v491));
                return;
            elseif l_FFlagEnableLuaAccountSwitch_0 and v470.errorCode == l_LoginErrorCodes_0.ParentEmptyAccountSwitchBlobRequired then
                v469.setErrorKey("");
                local v493 = v122 and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts";
                local v494 = v122 and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or "Authentication.AccountSwitch.Description.ParentLogoutConfirmation";
                local v495 = v122 and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts";
                local l_AccountSwitcherParentLoginEmptyBlobRequiredError_0 = l_AccountSwitcherConstants_0.AccountSwitcherParentLoginEmptyBlobRequiredError;
                local v497 = v471 or nil;
                local _ = v123(l_OpenAccountSwitchingErrorOverlay_0(v493, v494, v495, "Authentication.CrossDevice.Action.CancelLogin", v486, v477, l_AccountSwitcherParentLoginEmptyBlobRequiredError_0, v497));
                return;
            elseif v470.errorCode == l_LoginErrorCodes_0.MoreThanOneUsername then
                v466(v470);
                v469.navigation.navigate(v67.LoginScreenV2);
                return;
            else
                if v470.errorCode == l_LoginErrorCodes_0.AccountLocked then
                    local _ = v123(l_OpenCentralOverlayForLoginPasswordResetPrompt_0());
                end;
                if v470.errorCode == l_LoginErrorCodes_0.GlobalAppAccessDeniedVNG then
                    v454();
                end;
                if v475 and v470.securityQuestionsData and v470.securityQuestionsCallback then
                    spawn(function() --[[ Line: 1488 ]]
                        -- upvalues: v212 (ref), v471 (copy), v472 (copy), v470 (copy), v469 (ref)
                        v212(v471, v472, v470.securityQuestionsData, v470.securityQuestionsCallback, v469);
                    end);
                    return;
                elseif v474 and v470.usersData and v471 and v472 then
                    v464(v470.usersData, v471, v472, v469);
                    return;
                else
                    v469.setErrorKey(v470.errorKey or "Authentication.Login.Response.SomethingWentWrong");
                    v469.setInProgress(v473);
                    return;
                end;
            end;
        end;
    end;
    return v11.createElement(v63.Provider, {
        value = {
            state = v116, 
            dispatch = v117, 
            parentNavigation = v111.parentNavigation, 
            utils = {
                handleLoginCompletionWithAccountSwitching = v176, 
                handleLoginResult = v247, 
                showPasskeyLoginPopup = v414, 
                showGenericCredentialLoginPopup = v436, 
                handleLoginWithCode = v312, 
                handleLoginWithFormData = v249, 
                handleLoginWithOtp = v345, 
                handleSendEmailOtp = v384, 
                handleResendEmailOtp = v394, 
                openAccountSwitchingErrorOverlay = v445, 
                openPasswordResetPrompt = v446, 
                openWebView = v167, 
                openAccountRecovery = v169, 
                logoutAllLoggedInUsers = v449, 
                logoutWithoutShowConfirmation = v453, 
                openNewAppAvailableModal = v454, 
                closeCentralOverlay = v159, 
                clearApp = v140, 
                openAccountSelector = v464, 
                handleCredentialsCollision = v466, 
                registerPassword = v184, 
                isUserAuthenticated = v163
            }
        }
    }, v111.children);
end;