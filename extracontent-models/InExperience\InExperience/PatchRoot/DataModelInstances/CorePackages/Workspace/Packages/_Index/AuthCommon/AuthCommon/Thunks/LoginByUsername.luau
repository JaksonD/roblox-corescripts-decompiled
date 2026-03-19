local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.LoginRequests);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v7 = require(l_script_FirstAncestor_0.Models.LoginResult);
local v8 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodes);
local v9 = require(l_script_FirstAncestor_0.Utils.LoginByUsernameSSOErrorsTelemetry);
local v10 = require(l_script_FirstAncestor_0.Utils.GetLoginByUsernameErrorMessage);
local v11 = require(l_script_FirstAncestor_0.Enums.LoginMethods);
local v12 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local v13 = require(l_script_FirstAncestor_0.Utils.recordLogin);
local v14 = require(l_Parent_0.LoggingProtocol);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local v16 = require(l_script_FirstAncestor_0.Utils.GetDxBlob);
local v17 = require(l_script_FirstAncestor_0.Utils.GetCaptchaDataJson);
local l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin;
local l_GetFFlagEnableGenericTwoFAMessage_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableGenericTwoFAMessage;
local l_FFlagEnableLastLoginMethodTracking_0 = require(l_Parent_0.SharedFlags).FFlagEnableLastLoginMethodTracking;
local v21 = game:DefineFastFlag("EnablePasskeyOnlyUserErrorMessage", false);
local l_FFlagEnableRecordLogin_0 = require(l_Parent_0.SharedFlags).FFlagEnableRecordLogin;
local v23 = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnLoginByUsername", false);
local function _(v24, v25, v26, v27, v28) --[[ Line: 34 ]] --[[ Name: loginRequest ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy), v4 (copy)
    if l_getAppFeaturePolicies_0().getUseSingleSignOn() then
        return v4.singleSignOnConnectWithCredential(v24, v25, v26, "Username");
    else
        return v4.logByUsername(v24, v25, v26, v27, v28);
    end;
end;
return function(v30, v31, v32, v33, v34, v35, v36) --[[ Line: 44 ]] --[[ Name: loginByUsername ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy), v4 (copy), v7 (copy), v3 (copy), v8 (copy), l_GetFFlagEnableGenericTwoFAMessage_0 (copy), l_FFlagEnableLastLoginMethodTracking_0 (copy), v12 (copy), v11 (copy), l_FFlagEnableRecordLogin_0 (copy), v13 (copy), l_HttpService_0 (copy), v16 (copy), v17 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (copy), v23 (copy), v21 (copy), v10 (copy), v14 (copy), v9 (copy)
    return function(v37) --[[ Line: 53 ]]
        -- upvalues: l_getAppFeaturePolicies_0 (ref), v30 (copy), v31 (copy), v32 (copy), v34 (copy), v36 (copy), v4 (ref), v7 (ref), v3 (ref), v8 (ref), l_GetFFlagEnableGenericTwoFAMessage_0 (ref), l_FFlagEnableLastLoginMethodTracking_0 (ref), v12 (ref), v11 (ref), l_FFlagEnableRecordLogin_0 (ref), v13 (ref), l_HttpService_0 (ref), v16 (ref), v17 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v33 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), v23 (ref), v21 (ref), v10 (ref), v14 (ref), v9 (ref), v35 (copy)
        local v38 = l_getAppFeaturePolicies_0().getUseSingleSignOn();
        local l_v30_0 = v30;
        local l_v31_0 = v31;
        local l_v32_0 = v32;
        local l_v34_0 = v34;
        local l_v36_0 = v36;
        return (if l_getAppFeaturePolicies_0().getUseSingleSignOn() then v4.singleSignOnConnectWithCredential(l_v30_0, l_v31_0, l_v32_0, "Username") else v4.logByUsername(l_v30_0, l_v31_0, l_v32_0, l_v34_0, l_v36_0)):andThen(function(v44) --[[ Line: 55 ]]
            -- upvalues: v7 (ref), l_getAppFeaturePolicies_0 (ref), v38 (copy), v3 (ref), v8 (ref), l_GetFFlagEnableGenericTwoFAMessage_0 (ref), l_FFlagEnableLastLoginMethodTracking_0 (ref), v12 (ref), v11 (ref), l_FFlagEnableRecordLogin_0 (ref), v13 (ref), v31 (ref)
            assert(v44, "no login attempt result");
            assert(#v44 == 1, "no result or more than one result");
            local v45 = v7.fromJsonData(v44[1]);
            assert(v45, "result invalid");
            local v46 = l_getAppFeaturePolicies_0();
            if (v38 and not v46.getLinkedAuthEndpointsEnabled() or not v46.getWebViewSupport()) and v45 and v7.hasTwoStepData(v45) then
                return v3.reject({
                    errorCode = v8.ServiceUnavailable, 
                    errorKey = l_GetFFlagEnableGenericTwoFAMessage_0() and "Authentication.Login.Response.Require2FAGeneric" or "Authentication.Login.Response.Require2FA"
                });
            else
                if l_FFlagEnableLastLoginMethodTracking_0 then
                    v12.setLastSuccessfulSignInMethod(v11.Username);
                end;
                if l_FFlagEnableRecordLogin_0 then
                    pcall(function() --[[ Line: 81 ]]
                        -- upvalues: v13 (ref), v45 (copy), v11 (ref), v31 (ref)
                        v13(v45, v11.Username, v31);
                    end);
                end;
                return v45;
            end;
        end, function(v47) --[[ Line: 87 ]]
            -- upvalues: l_HttpService_0 (ref), v8 (ref), v16 (ref), v17 (ref), v37 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v33 (ref), v31 (ref), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), v23 (ref), v21 (ref), v38 (copy), v10 (ref), v14 (ref), v9 (ref), v3 (ref), v35 (ref)
            local v48 = l_HttpService_0:JSONDecode(v47.Body);
            local v49 = nil;
            local l_code_0 = v48.errors[1].code;
            local v51 = nil;
            local v52 = v48 and v48.errors and v48.errors[1] and v48.errors[1].userFacingMessage;
            if l_code_0 == v8.IncorrectCValueOrPassword then
                v49 = "Authentication.Login.Response.IncorrectUsernamePassword";
            elseif l_code_0 == v8.Captcha then
                local _ = v16(v48);
                local _ = nil;
                local v55, v56 = v17(v48);
                v37:dispatch(l_NavigateDown_0({
                    name = l_AppPage_0.CaptchaNative, 
                    detail = "", 
                    extraProps = {
                        captchaCallback = v33, 
                        captchaType = "login", 
                        captchaId = v55, 
                        cvalueType = "username", 
                        cvalue = v31, 
                        dxBlob = v56, 
                        backNavigationDisabledWhileLoading = true
                    }
                }));
            elseif l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and l_code_0 == v8.SecurityQuestions then
                v49 = "Authentication.Login.Response.SomethingWentWrong";
                if v48.errors[1].fieldData then
                    local v57 = l_HttpService_0:JSONDecode(v48.errors[1].fieldData);
                    if v57.sessionId and v57.userId then
                        v51 = v57;
                        v49 = nil;
                    end;
                end;
            elseif l_code_0 == v8.ServiceUnavailable then
                v49 = "Authentication.Login.Response.ServiceUnavailable";
            elseif v23 and l_code_0 == v8.IllegalChildAccountLinking then
                v49 = "Authentication.Login.LinkIllegalChildAccountLinking";
            elseif v21 and l_code_0 == v8.PasskeyOnlyUser then
                v49 = "Authentication.Login.Error.PasskeyOnlyAccount";
            elseif l_code_0 ~= v8.AccountLocked then
                v49 = "Authentication.Login.Response.SomethingWentWrong";
            end;
            if v38 then
                warn("Login ErrorCode:", l_code_0);
                v49 = v10(l_code_0);
                local v58 = if v49[1] then v49[1] else v49;
                v14.default:logRobloxTelemetryEvent(v9, nil, {
                    ssoErrorCode = l_code_0, 
                    msgShown = v58
                });
            end;
            return v3.reject({
                errorKey = v49, 
                errorCode = l_code_0, 
                securityQuestionsData = v51, 
                securityQuestionsCallback = v35, 
                userFacingMessage = v52
            });
        end);
    end;
end;