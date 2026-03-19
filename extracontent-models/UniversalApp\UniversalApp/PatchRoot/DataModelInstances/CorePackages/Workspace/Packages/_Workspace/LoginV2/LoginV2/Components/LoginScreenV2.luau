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
local v41 = require(l_script_FirstAncestor_0.Components.NeedHelpButton);
local v42 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local v43 = require(l_script_FirstAncestor_0.Context.LoginContext);
local v44 = require(l_script_FirstAncestor_0.Thunks.InitializeLogin);
local v45 = require(l_script_FirstAncestor_0.Components.Constants);
local l_isStringEmail_0 = v7.Utils.isStringEmail;
local l_isStringPhone_0 = v7.Utils.isStringPhone;
local l_CrossDeviceLogin_0 = v7.Thunks.CrossDeviceLogin;
local l_ApiFetchAuthMetaData_0 = v7.Thunks.ApiFetchAuthMetaData;
local l_AppStorageUtilities_0 = v7.Utils.AppStorageUtilities;
local l_LoginMethods_0 = v7.Enums.LoginMethods;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_default_1 = require(l_Parent_0.LoggingProtocol).default;
local l_TelemetryConfigs_0 = require(l_Parent_0.AuthAnalytics).TelemetryConfigs;
local v55 = {
    disableLoginForgotButton = false, 
    excludeUsernamePasswordSignIn = false, 
    excludeEmailPasswordSignIn = false, 
    excludePhoneNumberPasswordSignIn = false, 
    excludePasskeyLogin = false, 
    excludeCrossDeviceSignIn = false
};
getUserIdentifierType = function(v56) --[[ Line: 91 ]] --[[ Name: getUserIdentifierType ]]
    -- upvalues: l_isStringEmail_0 (copy), v13 (copy), l_isStringPhone_0 (copy)
    if l_isStringEmail_0(v56) then
        return v13.Email;
    elseif l_isStringPhone_0(v56) then
        return v13.Phone;
    else
        return v13.Username;
    end;
end;
LoginScreenV2 = function(v57) --[[ Line: 101 ]] --[[ Name: LoginScreenV2 ]]
    -- upvalues: v3 (copy), v43 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_FFlagAuthSecExclusions_0 (copy), v14 (copy), v55 (copy), v12 (copy), v42 (copy), v44 (copy), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (copy), v4 (copy), v11 (copy), v13 (copy), l_Logger_0 (copy), l_HttpService_0 (copy), l_authClientError_0 (copy), l_EventStreamConstants_0 (copy), l_AppStorageUtilities_0 (copy), l_authButtonClick_0 (copy), l_FFlagEnableLastLoginMethodTracking_0 (copy), l_LoginMethods_0 (copy), l_default_1 (copy), l_TelemetryConfigs_0 (copy), l_ApiFetchAuthMetaData_0 (copy), l_authPageload_0 (copy), l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_useLocalization_0 (copy), l_ButtonType_0 (copy), l_CrossDeviceLogin_0 (copy), l_Images_0 (copy), l_StandardButtonSize_0 (copy), v41 (copy), l_FullscreenPageWithSafeArea_0 (copy), l_IconButton_0 (copy), l_StyledTextLabel_0 (copy), l_TextInput_0 (copy), l_authFormInteraction_0 (copy), l_Button_0 (copy), v45 (copy), l_ButtonStack_0 (copy)
    local v58 = v3.useContext(v43);
    local l_utils_0 = v58.utils;
    local l_state_0 = v58.state;
    local v61 = l_useStyle_0();
    local v62 = l_useDesignTokens_0();
    local v63 = l_useDispatch_0();
    local v64 = l_useRoactService_0(l_RoactNetworking_0);
    if l_FFlagAuthSecExclusions_0 then
        v14.useAppPolicy(function(v65) --[[ Line: 112 ]]
            -- upvalues: v55 (ref)
            v55.disableLoginForgotButton = v65.getDisableLoginForgotButton();
            v55.excludeUsernamePasswordSignIn = v65.getExcludeUsernamePasswordSignIn();
            v55.excludeEmailPasswordSignIn = v65.getExcludeEmailPasswordSignIn();
            v55.excludePhoneNumberPasswordSignIn = v65.getExcludePhoneNumberPasswordSignIn();
            v55.excludePasskeyLogin = v65.getExcludePasskeyLogin();
            v55.excludeCrossDeviceSignIn = v65.getExcludeCrossDeviceSignIn();
        end);
    end;
    local function v67(v66) --[[ Line: 122 ]]
        -- upvalues: v58 (copy), v12 (ref), v42 (ref)
        v58.dispatch({
            type = v12.SetComponentState, 
            data = {
                component = v42.LoginScreenV2, 
                payload = v66
            }
        });
    end;
    local v68, v69 = v3.useState(false);
    local v70 = l_state_0 and l_state_0.componentState[v42.LoginScreenV2].userIdentifier or "";
    local function _(v71) --[[ Line: 138 ]]
        -- upvalues: v67 (copy)
        v67({
            userIdentifier = v71
        });
    end;
    local v73, v74 = v3.useState(v70);
    local v75 = l_state_0 and l_state_0.componentState[v42.LoginScreenV2].errorKey or "";
    local function v77(v76) --[[ Line: 147 ]]
        -- upvalues: v67 (copy)
        v67({
            errorKey = v76
        });
    end;
    local function _(v78) --[[ Line: 153 ]]
        -- upvalues: v63 (copy), v44 (ref), v64 (copy)
        return v63(v44(v64, {
            cvalue = v78, 
            ctype = getUserIdentifierType(v78)
        }));
    end;
    local function v88(v80) --[[ Line: 160 ]]
        -- upvalues: v73 (copy), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), l_state_0 (copy), v58 (copy), v12 (ref), v69 (copy), v67 (copy), v74 (copy), v63 (copy), v44 (ref), v64 (copy), v4 (ref), v11 (ref), v13 (ref), v57 (copy), v42 (ref), l_Logger_0 (ref), l_HttpService_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref)
        local v81 = v80 or v73;
        if l_FFlagEnableLoginV2ForcedUsernameOverride_0 and l_state_0 and l_state_0.extraProps and l_state_0.extraProps.forcedUsernameOverride and l_state_0.extraProps.forcedUsernameOverride ~= "" then
            v81 = l_state_0.extraProps.forcedUsernameOverride;
            v58.dispatch({
                type = v12.ClearForcedUsernameOverride
            });
        end;
        v69(true);
        v67({
            userIdentifier = v81
        });
        v74(v81);
        local l_v81_0 = v81;
        v63(v44(v64, {
            cvalue = l_v81_0, 
            ctype = getUserIdentifierType(l_v81_0)
        })):andThen(function(v83) --[[ Line: 184 ]]
            -- upvalues: v4 (ref), v11 (ref), v58 (ref), v12 (ref), v81 (ref), l_state_0 (ref), v13 (ref), v80 (copy), v67 (ref), v69 (ref), v57 (ref), v42 (ref)
            local v85 = v4.List.map(v83.loginMethods, function(v84) --[[ Line: 185 ]]
                -- upvalues: v11 (ref)
                return v11[v84.method];
            end);
            v58.dispatch({
                type = v12.SetUserIdentifierAndType, 
                data = {
                    userIdentifier = v81, 
                    userIdentifierType = if l_state_0.forceLoginByUsername then v13.Username else getUserIdentifierType(v81)
                }
            });
            v58.dispatch({
                type = v12.SetAvailableLoginMethods, 
                data = v85
            });
            if v80 ~= nil then
                v58.dispatch({
                    type = v12.UpdateCredentialsProtocolStatus, 
                    data = {
                        shouldShowAuthScreenCredentialsPopup = true
                    }
                });
            else
                v58.dispatch({
                    type = v12.UpdateCredentialsProtocolStatus, 
                    data = {
                        shouldShowAuthScreenUserSpecificPasskeyPopup = true
                    }
                });
            end;
            v67({
                errorKey = ""
            });
            v69(false);
            v57.navigation.navigate(v42.AuthenticationScreen);
        end, function(v86) --[[ Line: 222 ]]
            -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), l_authClientError_0 (ref), l_EventStreamConstants_0 (ref), v67 (ref), v69 (ref)
            l_Logger_0:warning("Error initializing login: {}", l_HttpService_0:JSONEncode(v86));
            l_authClientError_0(l_EventStreamConstants_0.Context.LoginFormV2Username, v86.errorCode);
            local v87 = v86.errorKey or "Authentication.Login.Response.SomethingWentWrong";
            v67({
                errorKey = v87
            });
            v69(false);
        end);
    end;
    local v89 = {
        setInProgress = v69, 
        setErrorKey = v77, 
        navigation = v57.navigation, 
        isLoginByOtp = false, 
        eventContext = l_EventStreamConstants_0.Context.LoginFormV2Username
    };
    local function _() --[[ Line: 238 ]]
        -- upvalues: l_AppStorageUtilities_0 (ref), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), l_state_0 (copy), v73 (copy)
        local v90 = l_AppStorageUtilities_0.getAccountBlob();
        local v91 = l_AppStorageUtilities_0.getDefaultUsername();
        local v92 = v90 and v90 ~= "";
        local v93 = v91 and v91 ~= "";
        if l_FFlagEnableLoginV2ForcedUsernameOverride_0 and l_state_0.extraProps and l_state_0.extraProps.forcedUsernameOverride then
            if l_state_0.extraProps.forcedUsernameOverride == "" then
                return false;
            else
                return true;
            end;
        else
            return v93 and not (v92 or v73 ~= "");
        end;
    end;
    v3.useEffect(function() --[[ Line: 261 ]]
        -- upvalues: l_state_0 (copy), v42 (ref), l_AppStorageUtilities_0 (ref), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), v73 (copy), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_FFlagEnableLastLoginMethodTracking_0 (ref), l_LoginMethods_0 (ref), v67 (copy), v74 (copy), v88 (copy)
        if l_state_0 and l_state_0.componentState[v42.LoginScreenV2].shouldAttemptCredentialPrefill or false then
            local v95 = l_AppStorageUtilities_0.getAccountBlob();
            local v96 = l_AppStorageUtilities_0.getDefaultUsername();
            local v97 = v95 and v95 ~= "";
            local v98 = v96 and v96 ~= "";
            if if l_FFlagEnableLoginV2ForcedUsernameOverride_0 and l_state_0.extraProps and l_state_0.extraProps.forcedUsernameOverride then l_state_0.extraProps.forcedUsernameOverride ~= "" else v98 and not (v97 or v73 ~= "") then
                local v99 = l_AppStorageUtilities_0.getDefaultUsername();
                l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Button.PrefilledNext, nil, nil);
                if l_FFlagEnableLastLoginMethodTracking_0 then
                    if l_AppStorageUtilities_0.getLastSuccessfulSignInMethod() == l_LoginMethods_0.QuickLogin then
                        v67({
                            userIdentifier = v99
                        });
                        v74(v99);
                        return;
                    else
                        v88(v99);
                        return;
                    end;
                else
                    v88(v99);
                    return;
                end;
            end;
        end;
    end, {});
    v3.useEffect(function() --[[ Line: 294 ]]
        -- upvalues: l_default_1 (ref), l_TelemetryConfigs_0 (ref), l_utils_0 (copy), l_HttpService_0 (ref), l_ApiFetchAuthMetaData_0 (ref), v64 (copy), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), l_Logger_0 (ref)
        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LoginPageMountTelemetryConfig, 1, {
            version = 2
        });
        local v100 = {
            isAuthenticated = l_utils_0.isUserAuthenticated()
        };
        local v101 = l_HttpService_0:JSONEncode(v100);
        l_ApiFetchAuthMetaData_0(v64):andThen(function(v102) --[[ Line: 306 ]]
            -- upvalues: l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v101 (copy)
            local v103 = v102 and v102.IsAltBrowserTracker;
            l_authPageload_0(l_EventStreamConstants_0.Context.LoginFormV2Username, v101, v103);
        end, function(v104) --[[ Line: 309 ]]
            -- upvalues: l_Logger_0 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v101 (copy)
            l_Logger_0:warning("Error auth metadata: {}", v104);
            l_authPageload_0(l_EventStreamConstants_0.Context.LoginFormV2Username, v101, nil);
        end);
    end, {});
    local l_initialStateUpdated_0 = l_state_0.credentialsProtocolStatus.initialStateUpdated;
    local l_fido2Supported_0 = l_state_0.credentialsProtocolStatus.fido2Supported;
    v3.useEffect(function() --[[ Line: 318 ]]
        -- upvalues: l_initialStateUpdated_0 (copy), l_state_0 (copy), l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 (ref), l_FFlagAuthSecExclusions_0 (ref), v55 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v58 (copy), v12 (ref), l_AppStorageUtilities_0 (ref), l_LoginMethods_0 (ref), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), v73 (copy), l_utils_0 (copy), v89 (copy), l_Logger_0 (ref), l_HttpService_0 (ref), l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref)
        if l_initialStateUpdated_0 or not l_state_0.shouldAutoShowCredentialPopup then
            return;
        else
            local function v116(v107) --[[ Line: 324 ]]
                -- upvalues: l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 (ref), l_FFlagAuthSecExclusions_0 (ref), v55 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v58 (ref), v12 (ref), l_AppStorageUtilities_0 (ref), l_LoginMethods_0 (ref), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), l_state_0 (ref), v73 (ref), l_utils_0 (ref), v89 (ref)
                local v108 = false;
                local v109 = false;
                local v110 = false;
                local v111 = false;
                if v107.FIDO2 ~= nil then
                    v109 = v107.FIDO2.isAvailable and v107.FIDO2.supportsDeviceBoundOnly;
                    if l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 then
                        v110 = v107.password and v107.password.isAvailable;
                        v111 = v107.password ~= nil;
                    else
                        v111 = true;
                    end;
                else
                    v109 = v107.isAvailable and v107.supportsDeviceBoundOnly or false;
                end;
                if l_FFlagAuthSecExclusions_0 and v55.excludePasskeyLogin then
                    v109 = false;
                end;
                if not l_FFlagEnableCredentialsV2InterfaceDetectionFix_0 and v107.password ~= nil then
                    v110 = v107.password.isAvailable;
                end;
                l_authPageload_0(l_EventStreamConstants_0.Context.PasskeyLoginV2, if v109 ~= nil then tostring(v109) else "timeout");
                v58.dispatch({
                    type = v12.UpdateCredentialsProtocolStatus, 
                    data = {
                        fido2Supported = v109, 
                        passwordsSupported = v110, 
                        v2InterfaceSupported = v111
                    }
                });
                v58.dispatch({
                    type = v12.SetCredentialAutoPopupShown
                });
                if l_AppStorageUtilities_0.getLastSuccessfulSignInMethod() ~= l_LoginMethods_0.QuickLogin then
                    local v112 = l_AppStorageUtilities_0.getAccountBlob();
                    local v113 = l_AppStorageUtilities_0.getDefaultUsername();
                    local v114 = v112 and v112 ~= "";
                    local v115 = v113 and v113 ~= "";
                    v108 = if l_FFlagEnableLoginV2ForcedUsernameOverride_0 and l_state_0.extraProps and l_state_0.extraProps.forcedUsernameOverride then l_state_0.extraProps.forcedUsernameOverride ~= "" else v115 and not (v114 or v73 ~= "");
                end;
                if not v108 then
                    if v111 then
                        l_utils_0.showGenericCredentialLoginPopup(v109, v110, false, v89);
                        return;
                    elseif v109 then
                        l_utils_0.showPasskeyLoginPopup(v89, false, true);
                    end;
                end;
                v108 = false;
            end;
            local l_extraProps_0 = l_state_0.extraProps;
            if l_extraProps_0.credProtocolIsAvailableResponse and l_extraProps_0.credProtocolIsAvailableResponse.isAvailable ~= nil then
                l_Logger_0:info("Using prefetched credentials protocol response: {}", l_HttpService_0:JSONEncode(l_extraProps_0.credProtocolIsAvailableResponse));
                l_authPageload_0(l_EventStreamConstants_0.Context.LoginRevampIsAvailableFetch, "0");
                v116(l_extraProps_0.credProtocolIsAvailableResponse);
                return;
            else
                local v118 = os.clock();
                l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v119) --[[ Line: 407 ]]
                    -- upvalues: l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), v118 (copy), v116 (copy)
                    l_authPageload_0(l_EventStreamConstants_0.Context.LoginRevampIsAvailableFetch, (tostring(os.clock() - v118)));
                    v116(v119);
                end):catch(function(v120) --[[ Line: 414 ]]
                    -- upvalues: v58 (ref), v12 (ref), l_Logger_0 (ref)
                    v58.dispatch({
                        type = v12.UpdateCredentialsProtocolStatus, 
                        data = {
                            fido2Supported = false, 
                            passwordsSupported = false, 
                            v2InterfaceSupported = false
                        }
                    });
                    l_Logger_0:warning("Error checking for available credential types. Error: {}", v120);
                end);
                return;
            end;
        end;
    end, {});
    local function _() --[[ Line: 429 ]]
        -- upvalues: l_FFlagAuthSecExclusions_0 (ref), v55 (ref)
        if l_FFlagAuthSecExclusions_0 then
            if v55.excludeEmailPasswordSignIn and v55.excludePhoneNumberPasswordSignIn then
                return "Authentication.Login.Label.Username";
            elseif v55.excludeEmailPasswordSignIn and v55.excludeUsernamePasswordSignIn then
                return "Authentication.Login.Label.Phone";
            elseif v55.excludeUsernamePasswordSignIn and v55.excludePhoneNumberPasswordSignIn then
                return "Authentication.Login.Label.Email";
            elseif v55.excludeEmailPasswordSignIn then
                return "Authentication.Login.Label.UsernameOrPhone";
            elseif v55.excludeUsernamePasswordSignIn then
                return "Authentication.Login.Label.EmailOrPhone";
            elseif v55.excludePhoneNumberPasswordSignIn then
                return "Authentication.Login.Label.UsernameOrEmail";
            end;
        end;
        return "Authentication.Login.Label.UsernameEmailOrPhoneNumber";
    end;
    local v122 = l_useLocalization_0({
        signInHeadingText = "Authentication.Login.Heading.SignIn", 
        identifierLabelText = if l_FFlagAuthSecExclusions_0 then v55.excludeEmailPasswordSignIn and v55.excludePhoneNumberPasswordSignIn and "Authentication.Login.Label.Username" or v55.excludeEmailPasswordSignIn and v55.excludeUsernamePasswordSignIn and "Authentication.Login.Label.Phone" or v55.excludeUsernamePasswordSignIn and v55.excludePhoneNumberPasswordSignIn and "Authentication.Login.Label.Email" or v55.excludeEmailPasswordSignIn and "Authentication.Login.Label.UsernameOrPhone" or v55.excludeUsernamePasswordSignIn and "Authentication.Login.Label.EmailOrPhone" or v55.excludePhoneNumberPasswordSignIn and "Authentication.Login.Label.UsernameOrEmail" or "Authentication.Login.Label.UsernameEmailOrPhoneNumber" else "Authentication.Login.Label.UsernameEmailOrPhoneNumber", 
        orText = "Authentication.SignUp.Description.Or", 
        nextActionText = "Authentication.Login.Action.Next", 
        quickSignInActionText = "Authentication.Login.Action.QuickSignIn", 
        usePasskeyActionText = "Authentication.Login.Action.UsePasskey", 
        passkeyIncompatibleText = "Authentication.Login.Label.PasskeyIncompatible", 
        errorText = if v75 ~= "" then v75 else nil
    });
    local v123 = {};
    if not v55.excludeCrossDeviceSignIn then
        table.insert(v123, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = function() --[[ Line: 474 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v63 (copy), l_CrossDeviceLogin_0 (ref), l_utils_0 (copy), v89 (copy)
                    l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Button.QuickLogin, nil, nil);
                    v63(l_CrossDeviceLogin_0.OpenLoginCodePrompt({
                        loginCallback = function(v124, v125, v126, v127) --[[ Line: 482 ]] --[[ Name: loginCallback ]]
                            -- upvalues: l_utils_0 (ref), v89 (ref)
                            l_utils_0.handleLoginWithCode(v124, v125, v126, v127, v89);
                        end, 
                        isOverlay = true
                    }));
                end, 
                text = v122.quickSignInActionText, 
                icon = l_Images_0["icons/menu/scanqr"], 
                standardSize = l_StandardButtonSize_0.Regular, 
                isLoading = v68
            }
        });
    end;
    local v128 = not l_FFlagAuthSecExclusions_0 or not v55.excludeEmailPasswordSignIn or not v55.excludePhoneNumberPasswordSignIn or not v55.excludeUsernamePasswordSignIn or false;
    if (l_fido2Supported_0 or not l_initialStateUpdated_0) and not v55.excludePasskeyLogin then
        table.insert(v123, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = function() --[[ Line: 514 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), l_utils_0 (copy), v89 (copy)
                    l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Button.UsePasskey, nil, nil);
                    l_utils_0.showPasskeyLoginPopup(v89, false, false);
                end, 
                text = v122.usePasskeyActionText, 
                icon = l_Images_0["icons/menu/passkey"], 
                standardSize = l_StandardButtonSize_0.Regular, 
                isLoading = not l_initialStateUpdated_0 or v68
            }
        });
    end;
    local v129 = if v55.disableLoginForgotButton then nil else v3.createElement(v41, {
        layoutOrder = 10, 
        isDisabled = v68, 
        originPage = l_EventStreamConstants_0.Context.LoginFormV2Username, 
        textKey = "Authentication.Login.Action.ForgotUsername", 
        identifierAutofill = v73
    });
    local v130 = #v123 > 0;
    return v3.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v61.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v62.Global.Space_100), 
            PaddingLeft = UDim.new(0, v62.Global.Space_100), 
            PaddingRight = UDim.new(0, v62.Global.Space_100), 
            PaddingBottom = UDim.new(0, v62.Global.Space_100)
        }), 
        Wrapper = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            Header = v3.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                BackButton = v3.createElement(l_IconButton_0, {
                    icon = l_Images_0["icons/navigation/close"], 
                    onActivated = function() --[[ Line: 570 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v58 (copy)
                        l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Button.Back);
                        v58.parentNavigation.goBack();
                    end, 
                    size = UDim2.new(0, 36, 0, 36), 
                    isDisabled = v68
                }), 
                SignInHeadingFrame = v3.createElement("Frame", {
                    Size = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AutomaticSize = Enum.AutomaticSize.X
                }, {
                    SignInHeadingText = v3.createElement(l_StyledTextLabel_0, {
                        text = v122.signInHeadingText, 
                        fontStyle = v61.Font.Header1, 
                        colorStyle = v61.Theme.TextEmphasis, 
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
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v62.Global.Space_100), 
                    PaddingRight = UDim.new(0, v62.Global.Space_100)
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v62.Global.Space_20)
                }), 
                SignInHeadingSpacing = v128 and v3.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, v62.Global.Space_400), 
                    BackgroundTransparency = 1
                }), 
                IdentifierLabel = v128 and v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 3, 
                    text = v122.identifierLabelText, 
                    fontStyle = v61.Font.Body, 
                    colorStyle = v61.Theme.TextEmphasis, 
                    automaticSize = Enum.AutomaticSize.XY
                }), 
                IdentifierLabelSpacing = v128 and v3.createElement("Frame", {
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, v62.Global.Space_50), 
                    BackgroundTransparency = 1
                }), 
                UserIdentifierTextField = v128 and v3.createElement(l_TextInput_0, {
                    LayoutOrder = 5, 
                    text = v70, 
                    label = "", 
                    width = UDim.new(1, 0), 
                    textInputType = Enum.TextInputType.Username, 
                    onChanged = function(v131) --[[ Line: 634 ]] --[[ Name: onChanged ]]
                        -- upvalues: v75 (copy), v67 (copy), v74 (copy)
                        if v75 ~= "" then
                            v67({
                                errorKey = ""
                            });
                        end;
                        v74(v131);
                    end, 
                    onFocusGained = function() --[[ Line: 641 ]] --[[ Name: onFocusGained ]]
                        -- upvalues: l_authFormInteraction_0 (ref), l_EventStreamConstants_0 (ref), v73 (copy)
                        l_authFormInteraction_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Field.Username, nil, nil, #v73 > 0);
                    end, 
                    isDisabled = v68
                }), 
                ErrorTextSpacing = v128 and v122.errorText and v3.createElement("Frame", {
                    LayoutOrder = 6, 
                    Size = UDim2.new(1, 0, 0, v62.Global.Space_50), 
                    BackgroundTransparency = 1
                }), 
                ErrorTextLabel = v128 and v122.errorText and v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 7, 
                    text = v122.errorText, 
                    fontStyle = v61.Font.BodySmall, 
                    colorStyle = v61.Theme.Alert, 
                    automaticSize = Enum.AutomaticSize.XY, 
                    textWrapped = true
                }), 
                NextButtonSpacing = v128 and v3.createElement("Frame", {
                    LayoutOrder = 8, 
                    Size = UDim2.new(1, 0, 0, v62.Global.Space_200), 
                    BackgroundTransparency = 1
                }), 
                NextButton = v128 and v3.createElement(l_Button_0, {
                    layoutOrder = 9, 
                    standardSize = l_StandardButtonSize_0.Regular, 
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    text = v122.nextActionText, 
                    buttonTextOverride = v45.getButtonTextOverrideConfig(), 
                    onActivated = function() --[[ Line: 678 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v88 (copy)
                        l_authButtonClick_0(l_EventStreamConstants_0.Context.LoginFormV2Username, l_EventStreamConstants_0.Button.Next, nil, nil);
                        v88();
                    end, 
                    isDisabled = v73 == "", 
                    isLoading = v68
                }), 
                HelpButton = v128 and v129, 
                AlternativeLoginDivider = v130 and v128 and v3.createElement("Frame", {
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
                        text = v122.orText, 
                        fontStyle = v61.Font.Header2, 
                        colorStyle = v61.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Center
                    })
                }), 
                Spacing = v3.createElement("Frame", {
                    LayoutOrder = 12, 
                    Size = UDim2.new(1, 0, 0, v62.Global.Space_200), 
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
                        buttons = v123
                    })
                })
            })
        })
    });
end;
return LoginScreenV2;