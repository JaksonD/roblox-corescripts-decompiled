local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.LoginRequests);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v7 = require(l_script_FirstAncestor_0.Models.LoginResult);
local v8 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodes);
local v9 = require(l_Parent_0.LoggingProtocol);
local v10 = require(l_script_FirstAncestor_0.Utils.LoginByUsernameSSOErrorsTelemetry);
local v11 = require(l_script_FirstAncestor_0.Utils.GetLoginByUsernameErrorMessage);
local v12 = require(l_script_FirstAncestor_0.Enums.LoginMethods);
local v13 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local v14 = require(l_script_FirstAncestor_0.Utils.recordLogin);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local v16 = require(l_script_FirstAncestor_0.Utils.GetDxBlob);
local v17 = require(l_script_FirstAncestor_0.Utils.GetCaptchaDataJson);
local l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin;
local l_FFlagEnableLastLoginMethodTracking_0 = require(l_Parent_0.SharedFlags).FFlagEnableLastLoginMethodTracking;
local l_FFlagEnableRecordLogin_0 = require(l_Parent_0.SharedFlags).FFlagEnableRecordLogin;
local v21 = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnLoginByCode", false);
local function _(v22, v23, v24, v25, v26) --[[ Line: 31 ]] --[[ Name: loginRequest ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy), v4 (copy)
    if l_getAppFeaturePolicies_0().getUseSingleSignOn() then
        return v4.singleSignOnConnectWithCode(v22, v23, v24);
    else
        return v4.loginWithCode(v22, v23, v24, v25, v26);
    end;
end;
return function(v28, v29, v30, v31, v32, v33, v34) --[[ Line: 40 ]] --[[ Name: loginByCode ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy), v4 (copy), v7 (copy), l_FFlagEnableLastLoginMethodTracking_0 (copy), v13 (copy), v12 (copy), l_FFlagEnableRecordLogin_0 (copy), v14 (copy), l_HttpService_0 (copy), v8 (copy), v16 (copy), v17 (copy), l_AppPage_0 (copy), l_NavigateDown_0 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (copy), v21 (copy), v11 (copy), v9 (copy), v10 (copy), v3 (copy)
    return function(v35) --[[ Line: 49 ]]
        -- upvalues: l_getAppFeaturePolicies_0 (ref), v28 (copy), v29 (copy), v30 (copy), v32 (copy), v34 (copy), v4 (ref), v7 (ref), l_FFlagEnableLastLoginMethodTracking_0 (ref), v13 (ref), v12 (ref), l_FFlagEnableRecordLogin_0 (ref), v14 (ref), l_HttpService_0 (ref), v8 (ref), v16 (ref), v17 (ref), l_AppPage_0 (ref), v31 (copy), l_NavigateDown_0 (ref), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), v21 (ref), v11 (ref), v9 (ref), v10 (ref), v3 (ref), v33 (copy)
        local v36 = l_getAppFeaturePolicies_0().getUseSingleSignOn();
        local l_v28_0 = v28;
        local l_v29_0 = v29;
        local l_v30_0 = v30;
        local l_v32_0 = v32;
        local l_v34_0 = v34;
        return (if l_getAppFeaturePolicies_0().getUseSingleSignOn() then v4.singleSignOnConnectWithCode(l_v28_0, l_v29_0, l_v30_0) else v4.loginWithCode(l_v28_0, l_v29_0, l_v30_0, l_v32_0, l_v34_0)):andThen(function(v42) --[[ Line: 52 ]]
            -- upvalues: v7 (ref), l_FFlagEnableLastLoginMethodTracking_0 (ref), v13 (ref), v12 (ref), l_FFlagEnableRecordLogin_0 (ref), v14 (ref)
            assert(v42, "no login attempt result");
            assert(#v42 == 1, "no result or more than one result");
            assert(v7.fromJsonData(v42[1]), "result invalid");
            if l_FFlagEnableLastLoginMethodTracking_0 then
                v13.setLastSuccessfulSignInMethod(v12.QuickLogin);
            end;
            local v43 = v7.fromJsonData(v42[1]);
            if l_FFlagEnableRecordLogin_0 then
                pcall(function() --[[ Line: 61 ]]
                    -- upvalues: v14 (ref), v43 (copy), v12 (ref)
                    v14(v43, v12.QuickLogin, v43.user.name);
                end);
            end;
            return v43;
        end, function(v44) --[[ Line: 67 ]]
            -- upvalues: l_HttpService_0 (ref), v8 (ref), v16 (ref), v17 (ref), l_AppPage_0 (ref), v31 (ref), v29 (ref), v35 (copy), l_NavigateDown_0 (ref), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), v21 (ref), v36 (copy), v11 (ref), v9 (ref), v10 (ref), v3 (ref), v33 (ref)
            local v45 = l_HttpService_0:JSONDecode(v44.Body);
            local v46 = v45 and v45.errors and v45.errors[1] and v45.errors[1].code;
            local v47 = nil;
            local v48 = nil;
            local v49 = v45 and v45.errors and v45.errors[1] and v45.errors[1].userFacingMessage;
            if v46 == v8.Captcha then
                local _ = v16(v45);
                local _ = nil;
                local v52, v53 = v17(v45);
                v52 = {
                    name = l_AppPage_0.CaptchaNative, 
                    detail = "", 
                    extraProps = {
                        captchaCallback = v31, 
                        captchaType = "login", 
                        cvalueType = "authToken", 
                        captchaId = v52, 
                        cvalue = v29, 
                        dxBlob = v53, 
                        backNavigationDisabledWhileLoading = true
                    }
                };
                v35:dispatch(l_NavigateDown_0(v52));
            elseif l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and v46 == v8.SecurityQuestions then
                v48 = "Authentication.Login.Response.SomethingWentWrong";
                if v45.errors[1].fieldData then
                    local v54 = l_HttpService_0:JSONDecode(v45.errors[1].fieldData);
                    if v54.sessionId and v54.userId then
                        v47 = v54;
                        v48 = nil;
                    end;
                end;
            elseif v21 and v46 == v8.IllegalChildAccountLinking then
                v48 = "Authentication.Login.LinkIllegalChildAccountLinking";
            end;
            if v36 then
                warn("Login ErrorCode:", v46);
                v48 = v11(v46);
                local v55 = if v48[1] then v48[1] else v48;
                v9.default:logRobloxTelemetryEvent(v10, nil, {
                    ssoErrorCode = v46, 
                    msgShown = v55
                });
            end;
            return v3.reject({
                errorKey = v48, 
                errorCode = v46, 
                securityQuestionsData = v47, 
                securityQuestionsCallback = v33, 
                userFacingMessage = v49
            });
        end);
    end;
end;