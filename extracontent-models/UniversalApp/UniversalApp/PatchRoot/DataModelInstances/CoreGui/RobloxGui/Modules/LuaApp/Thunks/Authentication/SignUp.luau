local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v5 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v6 = require(l_Modules_0.LuaApp.Promise);
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_Modules_0.LuaApp.Enum.SignUpErrorCodes);
local v9 = require(l_Modules_0.LuaApp.Thunks.Authentication.SignUpRedirectToLandingPage);
local v10 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v11 = require(l_Modules_0.LuaApp.Http.Requests.SignUpRequests);
local v12 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v13 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v14 = require(l_Modules_0.LuaApp.Actions.Authentication.ClearSignUpInfo);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v16 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v17 = require(l_Modules_0.LuaApp.Analytics.Events.AppSignupCounterNames);
local v18 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v19 = require(l_Modules_0.LuaApp.Thunks.Captcha.GetDxBlob);
local v20 = require(l_Modules_0.LuaApp.Thunks.Captcha.GetCaptchaData);
local v21 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v22 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v23 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v24 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local l_FFlagDisableMemStorageServicePasswordEvent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagDisableMemStorageServicePasswordEvent;
return function(v26, v27, v28, v29, v30, v31, v32) --[[ Line: 37 ]]
    -- upvalues: v11 (copy), v12 (copy), v16 (copy), v17 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (copy), l_MemStorageService_0 (copy), v13 (copy), l_HttpService_0 (copy), v24 (copy), v23 (copy), v14 (copy), v4 (copy), v18 (copy), v6 (copy), v8 (copy), l_StatusCodes_0 (copy), v19 (copy), v20 (copy), v7 (copy), v10 (copy), v5 (copy), v9 (copy), v21 (copy), v22 (copy)
    return function(v33) --[[ Line: 38 ]]
        -- upvalues: v11 (ref), v26 (copy), v30 (copy), v28 (copy), v12 (ref), v16 (ref), v17 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v13 (ref), l_HttpService_0 (ref), v24 (ref), v23 (ref), v14 (ref), v4 (ref), v27 (copy), v31 (copy), v32 (copy), v18 (ref), v6 (ref), v8 (ref), l_StatusCodes_0 (ref), v19 (ref), v20 (ref), v7 (ref), v29 (copy), v10 (ref), v5 (ref), v9 (ref), v21 (ref), v22 (ref)
        local l_SignUpInfo_0 = v33:getState().SignUpInfo;
        local l_SignUpUsername_0 = l_SignUpInfo_0.SignUpUsername;
        local l_SignUpPassword_0 = l_SignUpInfo_0.SignUpPassword;
        local v37 = l_SignUpInfo_0.SignUpBirthday:FormatForEndpoint();
        local l_SignUpSelectedBundleId_0 = l_SignUpInfo_0.SignUpSelectedBundleId;
        return v11.signUp(v26, l_SignUpUsername_0, l_SignUpPassword_0, v37, l_SignUpSelectedBundleId_0, v30):andThen(function(v39) --[[ Line: 47 ]]
            -- upvalues: v28 (ref), v12 (ref), v16 (ref), v17 (ref), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), v13 (ref), l_HttpService_0 (ref), l_SignUpUsername_0 (copy), l_SignUpPassword_0 (copy), v24 (ref), v23 (ref), v33 (copy), v14 (ref), v4 (ref), v26 (ref), v27 (ref), v31 (ref), v32 (ref), v18 (ref), v6 (ref)
            v28:BroadcastNotification("", v12.DID_SIGN_UP);
            v16(v17.Success, 1);
            if not l_FFlagDisableMemStorageServicePasswordEvent_0 then
                l_MemStorageService_0:Fire(v13.AuthenticatedCredentials, l_HttpService_0:JSONEncode({
                    cvalue = l_SignUpUsername_0, 
                    password = l_SignUpPassword_0, 
                    authType = "signup"
                }));
            end;
            if v24 then
                v23.setAccountBlob(v39.responseBody.accountBlob);
                v23.flush();
            end;
            v33:dispatch(v14());
            v33:dispatch(v4(v26, v27, v31, v32, v18.SignUp));
            return v6.resolve();
        end, function(v40) --[[ Line: 74 ]]
            -- upvalues: l_HttpService_0 (ref), v16 (ref), v17 (ref), v8 (ref), l_StatusCodes_0 (ref), v19 (ref), v20 (ref), v7 (ref), v29 (ref), v33 (copy), v10 (ref), v5 (ref), v9 (ref), v21 (ref), v22 (ref), v6 (ref)
            local v41 = l_HttpService_0:JSONDecode(v40.Body);
            local v42 = v41.errors and v41.errors[1] and v41.errors[1].code;
            v16(v17.Failure, 1);
            if v42 == v8.Captcha then
                v16(v17.FailureCaptcha, 1);
            elseif v42 == v8.InvalidBirthdate then
                v16(v17.FailureBirthdayInvalid, 1);
            elseif v42 == v8.InvalidPassword then
                v16(v17.FailurePasswordInvalid, 1);
            elseif v42 == v8.InvalidUsername then
                v16(v17.FailureUsernameInvalid, 1);
            elseif v42 == v8.UsernameAndPasswordTheSame then
                v16(v17.FailurePasswordMatchesUsername, 1);
            elseif v42 == v8.UsernameAlreadyTaken then
                v16(v17.FailureUsernameTaken, 1);
            elseif v42 == v8.TokenValidationFailed then
                v16(v17.FailureTokenValidationFailed, 1);
            elseif v40.HttpError == Enum.HttpError.OK and v40.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS then
                v16(v17.FailureThrottled, 1);
            elseif v40.HttpError == Enum.HttpError.OK and v40.StatusCode == l_StatusCodes_0.INTERNAL_SERVER_ERROR then
                v16(v17.FailureInternalServerError, 1);
            elseif v40.HttpError == Enum.HttpError.OK and v40.StatusCode == l_StatusCodes_0.BAD_REQUEST then
                v16(v17.FailureBadRequest, 1);
            elseif v40.HttpError == Enum.HttpError.OK and v40.StatusCode == l_StatusCodes_0.NOT_FOUND then
                v16(v17.FailureNotFound, 1);
            else
                v16(v17.FailureUnknownError, 1);
            end;
            if v42 == v8.Captcha then
                local _ = v19(v41);
                local _ = "";
                local v45, v46 = v20(v41);
                v45 = {
                    name = v7.CaptchaNative, 
                    detail = "", 
                    extraProps = {
                        captchaCallback = v29, 
                        captchaType = "signup", 
                        captchaId = v45, 
                        dxBlob = v46, 
                        backNavigationDisabledWhileLoading = true
                    }
                };
                v33:dispatch(v10(v45));
            elseif v42 == v8.UsernameAlreadyTaken or v42 == v8.BundleIdNotValid then
                v33:dispatch(v5({
                    HttpError = Enum.HttpError.OK
                }));
                v33:dispatch(v9());
            elseif v42 == v8.InvalidPassword then
                v33:dispatch(v21({
                    toastType = v22.NetworkingError, 
                    toastMessage = "Authentication.SignUp.Response.PasswordComplexity"
                }));
            else
                v33:dispatch(v5({
                    HttpError = Enum.HttpError.OK
                }));
            end;
            return v6.reject(v42);
        end);
    end;
end;