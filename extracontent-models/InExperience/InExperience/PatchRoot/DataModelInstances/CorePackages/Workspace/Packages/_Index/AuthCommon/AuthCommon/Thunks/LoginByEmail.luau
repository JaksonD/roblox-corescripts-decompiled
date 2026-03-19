local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.LoginRequests);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v7 = require(l_script_FirstAncestor_0.Models.LoginResult);
local v8 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodes);
local v9 = require(l_script_FirstAncestor_0.Enums.LoginMethods);
local v10 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local v11 = require(l_script_FirstAncestor_0.Utils.GetMultipleUsersPerCredentialErrorData);
local v12 = require(l_script_FirstAncestor_0.Utils.GetDxBlob);
local v13 = require(l_script_FirstAncestor_0.Utils.GetCaptchaDataJson);
local l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin;
local l_GetFFlagEnableLoginAccountSelector_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableLoginAccountSelector;
local l_FFlagEnableLastLoginMethodTracking_0 = require(l_Parent_0.SharedFlags).FFlagEnableLastLoginMethodTracking;
local v17 = require(l_script_FirstAncestor_0.Utils.recordLogin);
local l_FFlagEnableRecordLogin_0 = require(l_Parent_0.SharedFlags).FFlagEnableRecordLogin;
local v19 = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnLoginByEmail", false);
return function(v20, v21, v22, v23, v24, v25, v26, v27) --[[ Line: 28 ]] --[[ Name: loginByEmail ]]
    -- upvalues: v4 (copy), v7 (copy), l_FFlagEnableLastLoginMethodTracking_0 (copy), v10 (copy), v9 (copy), l_FFlagEnableRecordLogin_0 (copy), v17 (copy), l_HttpService_0 (copy), v8 (copy), v12 (copy), v13 (copy), l_AppPage_0 (copy), l_NavigateDown_0 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (copy), l_GetFFlagEnableLoginAccountSelector_0 (copy), v11 (copy), v3 (copy), v19 (copy)
    return function(v28) --[[ Line: 38 ]]
        -- upvalues: v4 (ref), v20 (copy), v21 (copy), v22 (copy), v24 (copy), v26 (copy), v27 (copy), v7 (ref), l_FFlagEnableLastLoginMethodTracking_0 (ref), v10 (ref), v9 (ref), l_FFlagEnableRecordLogin_0 (ref), v17 (ref), l_HttpService_0 (ref), v8 (ref), v12 (ref), v13 (ref), l_AppPage_0 (ref), v23 (copy), l_NavigateDown_0 (ref), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), v11 (ref), v3 (ref), v19 (ref), v25 (copy)
        return v4.logByEmail(v20, v21, v22, v24, v26, v27):andThen(function(v29) --[[ Line: 47 ]]
            -- upvalues: v7 (ref), l_FFlagEnableLastLoginMethodTracking_0 (ref), v10 (ref), v9 (ref), l_FFlagEnableRecordLogin_0 (ref), v17 (ref), v21 (ref)
            assert(v29, "no login attempt result");
            assert(#v29 == 1, "no result or more than one result");
            assert(v7.fromJsonData(v29[1]), "result invalid");
            if l_FFlagEnableLastLoginMethodTracking_0 then
                v10.setLastSuccessfulSignInMethod(v9.Email);
            end;
            local v30 = v7.fromJsonData(v29[1]);
            if l_FFlagEnableRecordLogin_0 then
                pcall(function() --[[ Line: 56 ]]
                    -- upvalues: v17 (ref), v30 (copy), v9 (ref), v21 (ref)
                    v17(v30, v9.Email, v21);
                end);
            end;
            return v30;
        end, function(v31) --[[ Line: 61 ]]
            -- upvalues: l_HttpService_0 (ref), v8 (ref), v12 (ref), v13 (ref), l_AppPage_0 (ref), v23 (ref), v21 (ref), v28 (copy), l_NavigateDown_0 (ref), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), v11 (ref), v3 (ref), v19 (ref), v25 (ref)
            local v32 = l_HttpService_0:JSONDecode(v31.Body);
            local v33 = nil;
            local l_code_0 = v32.errors[1].code;
            local v35 = nil;
            local v36 = v32 and v32.errors and v32.errors[1] and v32.errors[1].userFacingMessage;
            if l_code_0 == v8.IncorrectCValueOrPassword then
                v33 = "Authentication.Login.Response.IncorrectEmailOrPassword";
            elseif l_code_0 == v8.Captcha then
                local _ = v12(v32);
                local _ = nil;
                local v39, v40 = v13(v32);
                v39 = {
                    name = l_AppPage_0.CaptchaNative, 
                    detail = "", 
                    extraProps = {
                        captchaCallback = v23, 
                        captchaType = "login", 
                        cvalueType = "email", 
                        captchaId = v39, 
                        cvalue = v21, 
                        dxBlob = v40, 
                        backNavigationDisabledWhileLoading = true
                    }
                };
                v28:dispatch(l_NavigateDown_0(v39));
            elseif l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and l_code_0 == v8.SecurityQuestions then
                v33 = "Authentication.Login.Response.SomethingWentWrong";
                if v32.errors[1].fieldData then
                    local v41 = l_HttpService_0:JSONDecode(v32.errors[1].fieldData);
                    if v41.sessionId and v41.userId then
                        v35 = v41;
                        v33 = nil;
                    end;
                end;
            elseif l_GetFFlagEnableLoginAccountSelector_0() and l_code_0 == v8.MultipleUsersPerCredential then
                local v42 = v11(v32);
                return v3.reject({
                    errorKey = v33, 
                    errorCode = l_code_0, 
                    usersData = v42
                });
            elseif l_code_0 == v8.MoreThanOneUsername then
                v33 = "Authentication.Login.Response.MoreThanOneUsername";
            elseif l_code_0 == v8.ServiceUnavailable then
                v33 = "Authentication.Login.Response.ServiceUnavailable";
            elseif l_code_0 == v8.AccountNotVerified then
                v33 = "Authentication.Login.Response.UnverifiedEmailLoginWithUsername";
            elseif v19 and l_code_0 == v8.IllegalChildAccountLinking then
                v33 = "Authentication.Login.LinkIllegalChildAccountLinking";
            elseif l_code_0 ~= v8.AccountLocked then
                v33 = "Authentication.Login.Response.UnknownErrorLoginWithDifferentMethod";
            end;
            return v3.reject({
                errorKey = v33, 
                errorCode = l_code_0, 
                securityQuestionsData = v35, 
                securityQuestionsCallback = v25, 
                userFacingMessage = v36
            });
        end);
    end;
end;