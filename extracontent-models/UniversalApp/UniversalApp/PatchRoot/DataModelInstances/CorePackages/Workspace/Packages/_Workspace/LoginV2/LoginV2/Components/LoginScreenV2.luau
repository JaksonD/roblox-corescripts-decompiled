local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.AppBlox);
local v6 = require(l_Parent_0.AuthAnalytics);
local v7 = require(l_Parent_0.AuthCommon);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v11 = require(l_script_FirstAncestor_0.Enums.AuthenticationMethodType);
local v12 = require(l_script_FirstAncestor_0.Enums.LoginActionType);
local v13 = require(l_script_FirstAncestor_0.Enums.UserIdentifierType);
local v14 = require(l_Parent_0.UniversalAppPolicy);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_authPageload_0 = v6.Events.authPageload;
local l_authFormInteraction_0 = v6.Events.authFormInteraction;
local l_authButtonClick_0 = v6.Events.authButtonClick;
local l_authClientError_0 = v6.Events.authClientError;
local l_EventStreamConstants_0 = v6.EventStreamConstants;
local l_FullscreenPageWithSafeArea_0 = v5.FullscreenPageWithSafeArea;
local v22 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useStyle_0 = v22.Core.Style.useStyle;
local l_Button_0 = v22.App.Button.Button;
local l_ButtonType_0 = v22.App.Button.Enum.ButtonType;
local l_ButtonStack_0 = v22.App.Button.ButtonStack;
local l_IconButton_0 = v22.App.Button.IconButton;
local l_Images_0 = v22.App.ImageSet.Images;
local l_StandardButtonSize_0 = v22.App.Button.Enum.StandardButtonSize;
local l_StyledTextLabel_0 = v22.App.Text.StyledTextLabel;
local l_TextInput_0 = require(l_Parent_0.Foundation).TextInput;
local v33 = require(l_Parent_0.CredentialsProtocol);
local l_default_0 = v33.CredentialsProtocol.default;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = v33.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v36 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableLastLoginMethodTracking_0 = v36.FFlagEnableLastLoginMethodTracking;
local l_FFlagEnableLoginV2ForcedUsernameOverride_0 = v36.FFlagEnableLoginV2ForcedUsernameOverride;
local l_FFlagAuthSecExclusions_0 = v36.FFlagAuthSecExclusions;
local l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 = v36.FFlagEnableCredentialsV2InterfaceDetectionFix;
local l_FFlagFixLoginV2LandscapeLayout_0 = v36.FFlagFixLoginV2LandscapeLayout;
local l_FFlagEnableNavigateToLoginAfterLogoutAll_0 = v36.FFlagEnableNavigateToLoginAfterLogoutAll;
local v43 = require(l_script_FirstAncestor_0.Components.NeedHelpButton);
local v44 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local v45 = require(l_script_FirstAncestor_0.Context.LoginContext);
local v46 = require(l_script_FirstAncestor_0.Thunks.InitializeLogin);
local v47 = require(l_script_FirstAncestor_0.Components.Constants);
local l_isStringEmail_0 = v7.Utils.isStringEmail;
local l_isStringPhone_0 = v7.Utils.isStringPhone;
local l_CrossDeviceLogin_0 = v7.Thunks.CrossDeviceLogin;
local l_ApiFetchAuthMetaData_0 = v7.Thunks.ApiFetchAuthMetaData;
local l_AppStorageUtilities_0 = v7.Utils.AppStorageUtilities;
local l_LoginMethods_0 = v7.Enums.LoginMethods;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_default_1 = require(l_Parent_0.LoggingProtocol).default;
local l_TelemetryConfigs_0 = require(l_Parent_0.AuthAnalytics).TelemetryConfigs;
local v57 = {
    disableLoginForgotButton = false, 
    excludeUsernamePasswordSignIn = false, 
    excludeEmailPasswordSignIn = false, 
    excludePhoneNumberPasswordSignIn = false, 
    excludePasskeyLogin = false, 
    excludeCrossDeviceSignIn = false
};
getUserIdentifierType = function(v58) --[[ Line: 93 ]] --[[ Name: getUserIdentifierType ]]
    -- upvalues: l_isStringEmail_0 (copy), v13 (copy), l_isStringPhone_0 (copy)
    if l_isStringEmail_0(v58) then
        return v13.Email;
    elseif l_isStringPhone_0(v58) then
        return v13.Phone;
    else
        return v13.Username;
    end;
end;
LoginScreenV2 = function(v59) --[[ Line: 103 ]] --[[ Name: LoginScreenV2 ]]
    -- upvalues: v3 (copy), v45 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_FFlagAuthSecExclusions_0 (copy), v14 (copy), v57 (copy), v12 (copy), v44 (copy), v46 (copy), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (copy), l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (copy), v13 (copy), v4 (copy), v11 (copy), l_Logger_0 (copy), l_HttpService_0 (copy), l_authClientError_0 (copy), l_EventStreamConstants_0 (copy), l_AppStorageUtilities_0 (copy), l_authButtonClick_0 (copy), l_FFlagEnableLastLoginMethodTracking_0 (copy), l_LoginMethods_0 (copy), l_default_1 (copy), l_TelemetryConfigs_0 (copy), l_ApiFetchAuthMetaData_0 (copy), l_authPageload_0 (copy), l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_useLocalization_0 (copy), l_ButtonType_0 (copy), l_CrossDeviceLogin_0 (copy), l_Images_0 (copy), l_StandardButtonSize_0 (copy), v43 (copy), l_FullscreenPageWithSafeArea_0 (copy), l_FFlagFixLoginV2LandscapeLayout_0 (copy), l_IconButton_0 (copy), l_StyledTextLabel_0 (copy), v47 (copy), l_TextInput_0 (copy), l_authFormInteraction_0 (copy), l_Button_0 (copy), l_ButtonStack_0 (copy)
    local v60 = v3.useContext(v45);
    local l_utils_0 = v60.utils;
    local l_state_0 = v60.state;
    local v63 = l_useStyle_0();
    local v64 = l_useDesignTokens_0();
    local v65 = l_useDispatch_0();
    local v66 = l_useRoactService_0(l_RoactNetworking_0);
    if l_FFlagAuthSecExclusions_0 then
        v14.useAppPolicy(function(v67) --[[ Line: 114 ]]
            -- upvalues: v57 (ref)
            v57.disableLoginForgotButton = v67.getDisableLoginForgotButton();
            v57.excludeUsernamePasswordSignIn = v67.getExcludeUsernamePasswordSignIn();
            v57.excludeEmailPasswordSignIn = v67.getExcludeEmailPasswordSignIn();
            v57.excludePhoneNumberPasswordSignIn = v67.getExcludePhoneNumberPasswordSignIn();
            v57.excludePasskeyLogin = v67.getExcludePasskeyLogin();
            v57.excludeCrossDeviceSignIn = v67.getExcludeCrossDeviceSignIn();
        end);
    end;
    local function v69(v68) --[[ Line: 124 ]]
        -- upvalues: v60 (copy), v12 (ref), v44 (ref)
        v60.dispatch({
            type = v12.SetComponentState, 
            data = {
                component = v44.LoginScreenV2, 
                payload = v68
            }
        });
    end;
    local v70, v71 = v3.useState(false);
    local v72 = l_state_0 and l_state_0.componentState[v44.LoginScreenV2].userIdentifier or "";
    local function _(v73) --[[ Line: 140 ]]
        -- upvalues: v69 (copy)
        v69({
            userIdentifier = v73
        });
    end;
    local v75, v76 = v3.useState(v72);
    local v77 = l_state_0 and l_state_0.componentState[v44.LoginScreenV2].errorKey or "";
    local function v79(v78) --[[ Line: 149 ]]
        -- upvalues: v69 (copy)
        v69({
            errorKey = v78
        });
    end;
    local function _(v80) --[[ Line: 155 ]]
        -- upvalues: v65 (copy), v46 (ref), v66 (copy)
        return v65(v46(v66, {
            cvalue = v80, 
            ctype = getUserIdentifierType(v80)
        }));
    end;
    local function v90(v82) --[[ Line: 162 ]]
        -- upvalues: v75 (copy), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), l_state_0 (copy), v60 (copy), v12 (ref), v71 (copy), v69 (copy), v76 (copy), l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (ref), v13 (ref), v65 (copy), v46 (ref), v66 (copy), v4 (ref), v11 (ref), v59 (copy), v44 (ref), l_Logger_0 (ref), l_HttpService_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref)
        local v83 = v82 or v75;
        if l_FFlagEnableLoginV2ForcedUsernameOverride_0 and l_state_0 and l_state_0.extraProps and l_state_0.extraProps.forcedUsernameOverride and l_state_0.extraProps.forcedUsernameOverride ~= "" then
            v83 = l_state_0.extraProps.forcedUsernameOverride;
            v60.dispatch({
                type = v12.ClearForcedUsernameOverride
            });
        end;
        v71(true);
        v69({
            userIdentifier = v83
        });
        v76(v83);
        if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 then
            v60.dispatch({
                type = v12.SetUserIdentifierAndType, 
                data = {
                    userIdentifier = v83, 
                    userIdentifierType = if l_state_0.forceLoginByUsername then v13.Username else getUserIdentifierType(v83)
                }
            });
        end;
        local l_v83_0 = v83;
        v65(v46(v66, {
            cvalue = l_v83_0, 
            ctype = getUserIdentifierType(l_v83_0)
        })):andThen(function(v85) --[[ Line: 197 ]]
            -- upvalues: v4 (ref), v11 (ref), v60 (ref), v12 (ref), v83 (ref), l_state_0 (ref), v13 (ref), v82 (copy), v69 (ref), v71 (ref), v59 (ref), v44 (ref)
            local v87 = v4.List.map(v85.loginMethods, function(v86) --[[ Line: 198 ]]
                -- upvalues: v11 (ref)
                return v11[v86.method];
            end);
            v60.dispatch({
                type = v12.SetUserIdentifierAndType, 
                data = {
                    userIdentifier = v83, 
                    userIdentifierType = if l_state_0.forceLoginByUsername then v13.Username else getUserIdentifierType(v83)
                }
            });
            v60.dispatch({
                type = v12.SetAvailableLoginMethods, 
                data = v87
            });
            if v82 ~= nil then
                v60.dispatch({
                    type = v12.UpdateCredentialsProtocolStatus, 
                    data = {
                        shouldShowAuthScreenCredentialsPopup = true
                    }
                });
            else
                v60.dispatch({
                    type = v12.UpdateCredentialsProtocolStatus, 
                    data = {
                        shouldShowAuthScreenUserSpecificPasskeyPopup = true
                    }
                });
            end;
            v69({
                errorKey = ""
            });
            v71(false);
            v59.navigation.navigate(v44.AuthenticationScreen);
        end, function(v88) --[[ Line: 235 ]]
            -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), v69 (ref), v71 (ref)
            l_Logger_0:warning("Error initializing login: {}", l_HttpService_0:JSONEncode(v88));
            l_authClientError_0(l_EventStreamConstants_0.Context.LoginFormV2Username, v88.errorCode);
            local v89 = v88.errorKey or "Authentication.Login.Response.SomethingWentWrong";
            v69({
                errorKey = v89
            });
            v71(false);
        end);
    end;
    local v91 = {
        setInProgress = v71, 
        setErrorKey = v79, 
        navigation = v59.navigation, 
        isLoginByOtp = false, 
        eventContext = l_EventStreamConstants_0.Context.LoginFormV2Username
    };
    local function _() --[[ Line: 251 ]]
        -- upvalues: l_AppStorageUtilities_0 (ref), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), l_state_0 (copy), v75 (copy)
        local v92 = l_AppStorageUtilities_0.getAccountBlob();
        local v93 = l_AppStorageUtilities_0.getDefaultUsername();
        local v94 = v92 and v92 ~= "";
        local v95 = v93 and v93 ~= "";
        if l_FFlagEnableLoginV2ForcedUsernameOverride_0 and l_state_0.extraProps and l_state_0.extraProps.forcedUsernameOverride then
            if l_state_0.extraProps.forcedUsernameOverride == "" then
                return false;
            else
                return true;
            end;
        else
            return v95 and not (v94 or v75 ~= "");
        end;
    end;
    v3.useEffect(function() --[[ Line: 277 ]]
        -- upvalues: l_state_0 (copy), v44 (ref), l_AppStorageUtilities_0 (ref), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), v75 (copy), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_FFlagEnableLastLoginMethodTracking_0 (ref), l_LoginMethods_0 (ref), v69 (copy), v76 (copy), l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (ref), v60 (copy), v12 (ref), v90 (copy)
        if l_state_0 and l_state_0.componentState[v44.LoginScreenV2].shouldAttemptCredentialPrefill or false then
            local v97 = l_AppStorageUtilities_0.getAccountBlob();
            local v98 = l_AppStorageUtilities_0.getDefaultUsername();
            local v99 = v97 and v97 ~= "";
            local v100 = v98 and v98 ~= "";
            if if l_FFlagEnableLoginV2ForcedUsernameOverride_0 and l_state_0.extraProps and l_state_0.extraProps.forcedUsernameOverride then l_state_0.extraProps.forcedUsernameOverride ~= "" else v100 and not (v99 or v75 ~= "") then
                local v101 = l_AppStorageUtilities_0.getDefaultUsername();
                l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Button.PrefilledNext, nil, nil);
                if l_FFlagEnableLastLoginMethodTracking_0 then
                    if l_AppStorageUtilities_0.getLastSuccessfulSignInMethod() == l_LoginMethods_0.QuickLogin then
                        v69({
                            userIdentifier = v101
                        });
                        v76(v101);
                        if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 then
                            v60.dispatch({
                                type = v12.SetUserIdentifierAndType, 
                                data = {
                                    userIdentifier = v101, 
                                    userIdentifierType = getUserIdentifierType(v101)
                                }
                            });
                            return;
                        end;
                    else
                        v90(v101);
                        return;
                    end;
                else
                    v90(v101);
                end;
                return;
            end;
        end;
    end, {});
    v3.useEffect(function() --[[ Line: 319 ]]
        -- upvalues: l_default_1 (ref), l_TelemetryConfigs_0 (ref), l_utils_0 (copy), l_HttpService_0 (ref), l_ApiFetchAuthMetaData_0 (ref), v66 (copy), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), l_Logger_0 (ref)
        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LoginPageMountTelemetryConfig, 1, {
            version = 2
        });
        local v102 = {
            isAuthenticated = l_utils_0.isUserAuthenticated()
        };
        local v103 = l_HttpService_0:JSONEncode(v102);
        l_ApiFetchAuthMetaData_0(v66):andThen(function(v104) --[[ Line: 331 ]]
            -- upvalues: l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v103 (copy)
            local v105 = v104 and v104.IsAltBrowserTracker;
            l_authPageload_0(l_EventStreamConstants_0.Context.LoginFormV2Username, v103, v105);
        end, function(v106) --[[ Line: 334 ]]
            -- upvalues: l_Logger_0 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v103 (copy)
            l_Logger_0:warning("Error auth metadata: {}", v106);
            l_authPageload_0(l_EventStreamConstants_0.Context.LoginFormV2Username, v103, nil);
        end);
    end, {});
    local l_initialStateUpdated_0 = l_state_0.credentialsProtocolStatus.initialStateUpdated;
    local l_fido2Supported_0 = l_state_0.credentialsProtocolStatus.fido2Supported;
    v3.useEffect(function() --[[ Line: 343 ]]
        -- upvalues: l_initialStateUpdated_0 (copy), l_state_0 (copy), l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 (ref), l_FFlagAuthSecExclusions_0 (ref), v57 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v60 (copy), v12 (ref), l_AppStorageUtilities_0 (ref), l_LoginMethods_0 (ref), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), v75 (copy), l_utils_0 (copy), v91 (copy), l_Logger_0 (ref), l_HttpService_0 (ref), l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref)
        if l_initialStateUpdated_0 or not l_state_0.shouldAutoShowCredentialPopup then
            return;
        else
            local function v118(v109) --[[ Line: 349 ]]
                -- upvalues: l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 (ref), l_FFlagAuthSecExclusions_0 (ref), v57 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v60 (ref), v12 (ref), l_AppStorageUtilities_0 (ref), l_LoginMethods_0 (ref), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), l_state_0 (ref), v75 (ref), l_utils_0 (ref), v91 (ref)
                local v110 = false;
                local v111 = false;
                local v112 = false;
                local v113 = false;
                if v109.FIDO2 ~= nil then
                    v111 = v109.FIDO2.isAvailable and v109.FIDO2.supportsDeviceBoundOnly;
                    if l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 then
                        v112 = v109.password and v109.password.isAvailable;
                        v113 = v109.password ~= nil;
                    else
                        v113 = true;
                    end;
                else
                    v111 = v109.isAvailable and v109.supportsDeviceBoundOnly or false;
                end;
                if l_FFlagAuthSecExclusions_0 and v57.excludePasskeyLogin then
                    v111 = false;
                end;
                if not l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 and v109.password ~= nil then
                    v112 = v109.password.isAvailable;
                end;
                l_authPageload_0(l_EventStreamConstants_0.Context.PasskeyLoginV2, if v111 ~= nil then tostring(v111) else "timeout");
                v60.dispatch({
                    type = v12.UpdateCredentialsProtocolStatus, 
                    data = {
                        fido2Supported = v111, 
                        passwordsSupported = v112, 
                        v2InterfaceSupported = v113
                    }
                });
                v60.dispatch({
                    type = v12.SetCredentialAutoPopupShown
                });
                if l_AppStorageUtilities_0.getLastSuccessfulSignInMethod() ~= l_LoginMethods_0.QuickLogin then
                    local v114 = l_AppStorageUtilities_0.getAccountBlob();
                    local v115 = l_AppStorageUtilities_0.getDefaultUsername();
                    local v116 = v114 and v114 ~= "";
                    local v117 = v115 and v115 ~= "";
                    v110 = if l_FFlagEnableLoginV2ForcedUsernameOverride_0 and l_state_0.extraProps and l_state_0.extraProps.forcedUsernameOverride then l_state_0.extraProps.forcedUsernameOverride ~= "" else v117 and not (v116 or v75 ~= "");
                end;
                if not v110 then
                    if v113 then
                        l_utils_0.showGenericCredentialLoginPopup(v111, v112, false, v91);
                        return;
                    elseif v111 then
                        l_utils_0.showPasskeyLoginPopup(v91, false, true);
                    end;
                end;
                v110 = false;
            end;
            local l_extraProps_0 = l_state_0.extraProps;
            if l_extraProps_0.credProtocolIsAvailableResponse and l_extraProps_0.credProtocolIsAvailableResponse.isAvailable ~= nil then
                l_Logger_0:info("Using prefetched credentials protocol response: {}", l_HttpService_0:JSONEncode(l_extraProps_0.credProtocolIsAvailableResponse));
                l_authPageload_0(l_EventStreamConstants_0.Context.LoginRevampIsAvailableFetch, "0");
                v118(l_extraProps_0.credProtocolIsAvailableResponse);
                return;
            else
                local v120 = os.clock();
                l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v121) --[[ Line: 432 ]]
                    -- upvalues: l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v120 (copy), v118 (copy)
                    l_authPageload_0(l_EventStreamConstants_0.Context.LoginRevampIsAvailableFetch, (tostring(os.clock() - v120)));
                    v118(v121);
                end):catch(function(v122) --[[ Line: 439 ]]
                    -- upvalues: v60 (ref), v12 (ref), l_Logger_0 (ref)
                    v60.dispatch({
                        type = v12.UpdateCredentialsProtocolStatus, 
                        data = {
                            fido2Supported = false, 
                            passwordsSupported = false, 
                            v2InterfaceSupported = false
                        }
                    });
                    l_Logger_0:warning("Error checking for available credential types. Error: {}", v122);
                end);
                return;
            end;
        end;
    end, {});
    local function _() --[[ Line: 454 ]]
        -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v57 (ref)
        if l_FFlagAuthSecExclusions_0 then
            if v57.excludeEmailPasswordSignIn and v57.excludePhoneNumberPasswordSignIn then
                return "Authentication.Login.Label.Username";
            elseif v57.excludeEmailPasswordSignIn and v57.excludeUsernamePasswordSignIn then
                return "Authentication.Login.Label.Phone";
            elseif v57.excludeUsernamePasswordSignIn and v57.excludePhoneNumberPasswordSignIn then
                return "Authentication.Login.Label.Email";
            elseif v57.excludeEmailPasswordSignIn then
                return "Authentication.Login.Label.UsernameOrPhone";
            elseif v57.excludeUsernamePasswordSignIn then
                return "Authentication.Login.Label.EmailOrPhone";
            elseif v57.excludePhoneNumberPasswordSignIn then
                return "Authentication.Login.Label.UsernameOrEmail";
            end;
        end;
        return "Authentication.Login.Label.UsernameEmailOrPhoneNumber";
    end;
    local v124 = l_useLocalization_0({
        signInHeadingText = "Authentication.Login.Heading.SignIn", 
        identifierLabelText = if l_FFlagAuthSecExclusions_0 then v57.excludeEmailPasswordSignIn and v57.excludePhoneNumberPasswordSignIn and "Authentication.Login.Label.Username" or v57.excludeEmailPasswordSignIn and v57.excludeUsernamePasswordSignIn and "Authentication.Login.Label.Phone" or v57.excludeUsernamePasswordSignIn and v57.excludePhoneNumberPasswordSignIn and "Authentication.Login.Label.Email" or v57.excludeEmailPasswordSignIn and "Authentication.Login.Label.UsernameOrPhone" or v57.excludeUsernamePasswordSignIn and "Authentication.Login.Label.EmailOrPhone" or v57.excludePhoneNumberPasswordSignIn and "Authentication.Login.Label.UsernameOrEmail" or "Authentication.Login.Label.UsernameEmailOrPhoneNumber" else "Authentication.Login.Label.UsernameEmailOrPhoneNumber", 
        orText = "Authentication.SignUp.Description.Or", 
        nextActionText = "Authentication.Login.Action.Next", 
        quickSignInActionText = "Authentication.Login.Action.QuickSignIn", 
        usePasskeyActionText = "Authentication.Login.Action.UsePasskey", 
        passkeyIncompatibleText = "Authentication.Login.Label.PasskeyIncompatible", 
        errorText = if v77 ~= "" then v77 else nil
    });
    local v125 = {};
    if not v57.excludeCrossDeviceSignIn then
        table.insert(v125, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = function() --[[ Line: 499 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v65 (copy), l_CrossDeviceLogin_0 (ref), l_utils_0 (copy), v91 (copy)
                    l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Button.QuickLogin, nil, nil);
                    v65(l_CrossDeviceLogin_0.OpenLoginCodePrompt({
                        loginCallback = function(v126, v127, v128, v129) --[[ Line: 507 ]] --[[ Name: loginCallback ]]
                            -- upvalues: l_utils_0 (ref), v91 (ref)
                            l_utils_0.handleLoginWithCode(v126, v127, v128, v129, v91);
                        end, 
                        isOverlay = true
                    }));
                end, 
                text = v124.quickSignInActionText, 
                icon = l_Images_0["icons/menu/scanqr"], 
                standardSize = l_StandardButtonSize_0.Regular, 
                isLoading = v70
            }
        });
    end;
    local v130 = not l_FFlagAuthSecExclusions_0 or not v57.excludeEmailPasswordSignIn or not v57.excludePhoneNumberPasswordSignIn or not v57.excludeUsernamePasswordSignIn or false;
    if (l_fido2Supported_0 or not l_initialStateUpdated_0) and not v57.excludePasskeyLogin then
        table.insert(v125, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = function() --[[ Line: 539 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (ref), v75 (copy), v60 (copy), v12 (ref), l_utils_0 (copy), v91 (copy)
                    l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Button.UsePasskey, nil, nil);
                    if l_FFlagEnableNavigateToLoginAfterLogoutAll_0 and v75 ~= "" then
                        v60.dispatch({
                            type = v12.SetUserIdentifierAndType, 
                            data = {
                                userIdentifier = v75, 
                                userIdentifierType = getUserIdentifierType(v75)
                            }
                        });
                    end;
                    l_utils_0.showPasskeyLoginPopup(v91, false, false);
                end, 
                text = v124.usePasskeyActionText, 
                icon = l_Images_0["icons/menu/passkey"], 
                standardSize = l_StandardButtonSize_0.Regular, 
                isLoading = not l_initialStateUpdated_0 or v70
            }
        });
    end;
    local v131 = if v57.disableLoginForgotButton then nil else v3.createElement(v43, {
        layoutOrder = 10, 
        isDisabled = v70, 
        originPage = l_EventStreamConstants_0.Context.LoginFormV2Username, 
        textKey = "Authentication.Login.Action.ForgotUsername", 
        identifierAutofill = v75
    });
    local v132 = #v125 > 0;
    return v3.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v63.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v64.Global.Space_100), 
            PaddingLeft = UDim.new(0, v64.Global.Space_100), 
            PaddingRight = UDim.new(0, v64.Global.Space_100), 
            PaddingBottom = UDim.new(0, v64.Global.Space_100)
        }), 
        Wrapper = v3.createElement(l_FFlagFixLoginV2LandscapeLayout_0 and "ScrollingFrame" or "Frame", if l_FFlagFixLoginV2LandscapeLayout_0 then {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(0, 0, 0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            BorderSizePixel = 0
        } else {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = if l_FFlagFixLoginV2LandscapeLayout_0 then Enum.HorizontalAlignment.Center else nil
            }), 
            Header = v3.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                BackButton = v3.createElement(l_IconButton_0, {
                    icon = l_Images_0["icons/navigation/close"], 
                    onActivated = function() --[[ Line: 620 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v60 (copy)
                        l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Button.Back);
                        v60.parentNavigation.goBack();
                    end, 
                    size = UDim2.new(0, 36, 0, 36), 
                    isDisabled = v70
                }), 
                SignInHeadingFrame = v3.createElement("Frame", {
                    Size = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AutomaticSize = Enum.AutomaticSize.X
                }, {
                    SignInHeadingText = v3.createElement(l_StyledTextLabel_0, {
                        text = v124.signInHeadingText, 
                        fontStyle = v63.Font.Header1, 
                        colorStyle = v63.Theme.TextEmphasis, 
                        textXAlignment = Enum.TextXAlignment.Center
                    })
                })
            }), 
            Content = v3.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                UISizeConstraint = l_FFlagFixLoginV2LandscapeLayout_0 and v3.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(v47.CONTENT_MAX_WIDTH, 1e999)
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v64.Global.Space_100), 
                    PaddingRight = UDim.new(0, v64.Global.Space_100), 
                    PaddingBottom = if l_FFlagFixLoginV2LandscapeLayout_0 then UDim.new(0, v64.Global.Space_400) else nil
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v64.Global.Space_20)
                }), 
                SignInHeadingSpacing = v130 and v3.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, v64.Global.Space_400), 
                    BackgroundTransparency = 1
                }), 
                IdentifierLabel = v130 and v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 3, 
                    text = v124.identifierLabelText, 
                    fontStyle = v63.Font.Body, 
                    colorStyle = v63.Theme.TextEmphasis, 
                    automaticSize = Enum.AutomaticSize.XY
                }), 
                IdentifierLabelSpacing = v130 and v3.createElement("Frame", {
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, v64.Global.Space_50), 
                    BackgroundTransparency = 1
                }), 
                UserIdentifierTextField = v130 and v3.createElement(l_TextInput_0, {
                    LayoutOrder = 5, 
                    text = v72, 
                    label = "", 
                    width = UDim.new(1, 0), 
                    textInputType = Enum.TextInputType.Username, 
                    onChanged = function(v133) --[[ Line: 690 ]] --[[ Name: onChanged ]]
                        -- upvalues: v77 (copy), v69 (copy), v76 (copy)
                        if v77 ~= "" then
                            v69({
                                errorKey = ""
                            });
                        end;
                        v76(v133);
                    end, 
                    onFocusGained = function() --[[ Line: 697 ]] --[[ Name: onFocusGained ]]
                        -- upvalues: l_authFormInteraction_0 (ref), l_EventStreamConstants_0 (ref), v75 (copy)
                        l_authFormInteraction_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Field.Username, nil, nil, #v75 > 0);
                    end, 
                    isDisabled = v70
                }), 
                ErrorTextSpacing = v130 and v124.errorText and v3.createElement("Frame", {
                    LayoutOrder = 6, 
                    Size = UDim2.new(1, 0, 0, v64.Global.Space_50), 
                    BackgroundTransparency = 1
                }), 
                ErrorTextLabel = v130 and v124.errorText and v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 7, 
                    text = v124.errorText, 
                    fontStyle = v63.Font.BodySmall, 
                    colorStyle = v63.Theme.Alert, 
                    automaticSize = Enum.AutomaticSize.XY, 
                    textWrapped = true
                }), 
                NextButtonSpacing = v130 and v3.createElement("Frame", {
                    LayoutOrder = 8, 
                    Size = UDim2.new(1, 0, 0, v64.Global.Space_200), 
                    BackgroundTransparency = 1
                }), 
                NextButton = v130 and v3.createElement(l_Button_0, {
                    layoutOrder = 9, 
                    standardSize = l_StandardButtonSize_0.Regular, 
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    text = v124.nextActionText, 
                    buttonTextOverride = v47.getButtonTextOverrideConfig(), 
                    onActivated = function() --[[ Line: 736 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v90 (copy)
                        l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Button.Next, nil, nil);
                        v90();
                    end, 
                    isDisabled = v75 == "", 
                    isLoading = v70
                }), 
                HelpButton = v130 and v131, 
                AlternativeLoginDivider = v132 and v130 and v3.createElement("Frame", {
                    LayoutOrder = 11, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    ListLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    DividerText = v3.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 1, 
                        text = v124.orText, 
                        fontStyle = v63.Font.Header2, 
                        colorStyle = v63.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Center
                    })
                }), 
                Spacing = v3.createElement("Frame", {
                    LayoutOrder = 12, 
                    Size = UDim2.new(1, 0, 0, v64.Global.Space_200), 
                    BackgroundTransparency = 1
                }), 
                AlternativeLoginButtonFrame = v3.createElement("Frame", {
                    LayoutOrder = 13, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    AlternativeLoginButtons = v3.createElement(l_ButtonStack_0, {
                        forcedFillDirection = Enum.FillDirection.Vertical, 
                        buttons = v125
                    })
                })
            })
        })
    });
end;
return LoginScreenV2;