local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.LoginRequests);
local v5 = require(l_script_FirstAncestor_0.Models.LoginResult);
local v6 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodes);
local v7 = require(l_script_FirstAncestor_0.Enums.LoginMethods);
local v8 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local v9 = require(l_script_FirstAncestor_0.Utils.GetMultipleUsersPerCredentialErrorData);
local l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin;
local l_GetFFlagEnableLoginAccountSelector_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableLoginAccountSelector;
local l_FFlagEnableLastLoginMethodTracking_0 = require(l_Parent_0.SharedFlags).FFlagEnableLastLoginMethodTracking;
local v13 = game:DefineFastFlag("EnableIllegalChildAccountLinkingErrorMessageOnLoginByOtp", false);
return function(v14, v15, v16, v17, v18, v19) --[[ Line: 23 ]] --[[ Name: loginByOtp ]]
    -- upvalues: v4 (copy), v5 (copy), l_FFlagEnableLastLoginMethodTracking_0 (copy), v8 (copy), v7 (copy), l_HttpService_0 (copy), v6 (copy), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (copy), l_GetFFlagEnableLoginAccountSelector_0 (copy), v9 (copy), v3 (copy), v13 (copy)
    return function() --[[ Line: 31 ]]
        -- upvalues: v4 (ref), v14 (copy), v15 (copy), v16 (copy), v18 (copy), v19 (copy), v5 (ref), l_FFlagEnableLastLoginMethodTracking_0 (ref), v8 (ref), v7 (ref), l_HttpService_0 (ref), v6 (ref), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), v9 (ref), v3 (ref), v13 (ref), v17 (copy)
        return v4.logByOtp(v14, v15, v16, v18, v19):andThen(function(v20) --[[ Line: 33 ]]
            -- upvalues: v5 (ref), l_FFlagEnableLastLoginMethodTracking_0 (ref), v8 (ref), v7 (ref)
            assert(v20, "no login attempt result");
            assert(#v20 == 1, "no result or more than one result");
            assert(v5.fromJsonData(v20[1]), "result invalid");
            if l_FFlagEnableLastLoginMethodTracking_0 then
                v8.setLastSuccessfulSignInMethod(v7.EmailOtp);
            end;
            return v5.fromJsonData(v20[1]);
        end, function(v21) --[[ Line: 41 ]]
            -- upvalues: l_HttpService_0 (ref), v6 (ref), l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0 (ref), l_GetFFlagEnableLoginAccountSelector_0 (ref), v9 (ref), v3 (ref), v13 (ref), v17 (ref)
            local v22 = l_HttpService_0:JSONDecode(v21.Body);
            local v23 = nil;
            local l_code_0 = v22.errors[1].code;
            local v25 = nil;
            local v26 = v22 and v22.errors and v22.errors[1] and v22.errors[1].userFacingMessage;
            if l_code_0 == v6.IncorrectCValueOrPassword then
                v23 = "Authentication.Login.Response.IncorrectOtpCode";
            elseif l_GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin_0() and l_code_0 == v6.SecurityQuestions then
                v23 = "Authentication.Login.Response.SomethingWentWrong";
                if v22.errors[1].fieldData then
                    local v27 = l_HttpService_0:JSONDecode(v22.errors[1].fieldData);
                    if v27.sessionId and v27.userId then
                        v25 = v27;
                        v23 = nil;
                    end;
                end;
            elseif l_GetFFlagEnableLoginAccountSelector_0() and l_code_0 == v6.MultipleUsersPerCredential then
                local v28 = v9(v22);
                return v3.reject({
                    errorKey = v23, 
                    errorCode = l_code_0, 
                    usersData = v28
                });
            elseif l_code_0 == v6.ServiceUnavailable then
                v23 = "Authentication.Login.Response.ServiceUnavailable";
            elseif v13 and l_code_0 == v6.IllegalChildAccountLinking then
                v23 = "Authentication.Login.LinkIllegalChildAccountLinking";
            elseif l_code_0 ~= v6.AccountLocked then
                v23 = "Authentication.Login.Response.UnknownErrorLoginWithDifferentMethod";
            end;
            return v3.reject({
                errorKey = v23, 
                errorCode = l_code_0, 
                securityQuestionsData = v25, 
                securityQuestionsCallback = v17, 
                userFacingMessage = v26
            });
        end);
    end;
end;