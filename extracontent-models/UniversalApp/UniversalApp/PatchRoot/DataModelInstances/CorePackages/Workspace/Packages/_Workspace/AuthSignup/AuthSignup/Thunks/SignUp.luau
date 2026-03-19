local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Requests.SignUpRequests);
local v6 = require(l_script_FirstAncestor_0.Enums.SignUpV2ErrorCodes);
local v7 = require(l_script_FirstAncestor_0.Enums.AppSignupCounterNames);
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local v9 = require(l_Parent_0.AuthCommon);
local l_AuthMemStorageKeys_0 = v9.Enums.AuthMemStorageKeys;
local l_reportEphemeralCounter_0 = v9.Analytics.reportEphemeralCounter;
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v14 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableSignupUnavailableInRegionError_0 = v14.FFlagEnableSignupUnavailableInRegionError;
local l_FFlagEnableCredentialsProtocolLoggingFix_0 = v14.FFlagEnableCredentialsProtocolLoggingFix;
local l_FFlagDisableMemStorageServicePasswordEvent_0 = v14.FFlagDisableMemStorageServicePasswordEvent;
local v18 = require(l_Parent_0.CredentialsProtocol);
local l_Constants_0 = v18.Constants;
local l_default_0 = v18.CredentialsProtocol.default;
local function _(v21, v22) --[[ Line: 32 ]] --[[ Name: signUpRequest ]]
    -- upvalues: v5 (copy)
    return v5.signUpV2(v21, v22, {});
end;
return function(v24, _, v26, _, _, v29, v30, _, _) --[[ Line: 37 ]]
    -- upvalues: v5 (copy), l_NotificationType_0 (copy), l_reportEphemeralCounter_0 (copy), v7 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (copy), l_MemStorageService_0 (copy), l_AuthMemStorageKeys_0 (copy), l_HttpService_0 (copy), l_default_0 (copy), l_Constants_0 (copy), l_Logger_0 (copy), l_FFlagEnableCredentialsProtocolLoggingFix_0 (copy), v4 (copy), v6 (copy), l_FFlagEnableSignupUnavailableInRegionError_0 (copy), l_StatusCodes_0 (copy)
    return v5.signUpV2(v24, v29, {}):andThen(function(v33) --[[ Line: 48 ]]
        -- upvalues: v26 (copy), l_NotificationType_0 (ref), l_reportEphemeralCounter_0 (ref), v7 (ref), v29 (copy), l_FFlagDisableMemStorageServicePasswordEvent_0 (ref), l_MemStorageService_0 (ref), l_AuthMemStorageKeys_0 (ref), l_HttpService_0 (ref), v30 (copy), l_default_0 (ref), l_Constants_0 (ref), l_Logger_0 (ref), l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref), v4 (ref)
        v26:BroadcastNotification("", l_NotificationType_0.DID_SIGN_UP);
        l_reportEphemeralCounter_0(v7.Success, 1);
        local v34 = v29.username and v29.password and string.len(v29.password) > 0;
        if not l_FFlagDisableMemStorageServicePasswordEvent_0 and v34 then
            l_MemStorageService_0:Fire(l_AuthMemStorageKeys_0.AuthenticatedCredentials, l_HttpService_0:JSONEncode({
                cvalue = v29.username, 
                password = v29.password, 
                authType = "signup"
            }));
        end;
        if v30 and v29.password and #v29.password > 0 then
            local v35 = {
                username = v29.username, 
                password = v29.password
            };
            local v36 = l_HttpService_0:JSONEncode(v35);
            l_default_0:registerCredentials(l_default_0.CredentialsTypes.password, v36, l_Constants_0.Defaults.PASSWORD_REGISTRATION_CREDENTIALSPROTOCOL_TIMEOUT):andThen(function(v37) --[[ Line: 81 ]]
                -- upvalues: l_HttpService_0 (ref), l_Logger_0 (ref), l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref)
                local v38 = if v37 then l_HttpService_0:JSONDecode(v37) else {};
                if v38 and v38.errorCode == nil then
                    l_Logger_0:info("Successfully registered password.");
                    return;
                elseif l_FFlagEnableCredentialsProtocolLoggingFix_0 then
                    l_Logger_0:warning("Error registering password: " .. tostring(v38.errorMsg));
                    return;
                else
                    l_Logger_0:warning("Error registering password: ", v38.errorMsg);
                    return;
                end;
            end, function(v39) --[[ Line: 93 ]]
                -- upvalues: l_FFlagEnableCredentialsProtocolLoggingFix_0 (ref), l_Logger_0 (ref)
                if l_FFlagEnableCredentialsProtocolLoggingFix_0 then
                    l_Logger_0:warning("Error registering password: " .. tostring(v39));
                    return;
                else
                    l_Logger_0:warning("Error registering password: ", v39);
                    return;
                end;
            end):await();
        end;
        return v4.resolve(v33);
    end, function(v40) --[[ Line: 104 ]]
        -- upvalues: l_HttpService_0 (ref), l_reportEphemeralCounter_0 (ref), v7 (ref), v6 (ref), l_FFlagEnableSignupUnavailableInRegionError_0 (ref), l_StatusCodes_0 (ref), v4 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 105 ]]
            -- upvalues: l_HttpService_0 (ref), v40 (copy)
            return l_HttpService_0:JSONDecode(v40.Body);
        end);
        if l_status_0 then
            local v43 = l_result_0.errors and l_result_0.errors[1] and l_result_0.errors[1].code;
            l_reportEphemeralCounter_0(v7.Failure, 1);
            if v43 == v6.Captcha then
                l_reportEphemeralCounter_0(v7.FailureCaptcha, 1);
            elseif v43 == v6.TooManyAttempts then
                l_reportEphemeralCounter_0(v7.FailureThrottled, 1);
            elseif v43 == v6.InvalidBirthdate then
                l_reportEphemeralCounter_0(v7.FailureBirthdayInvalid, 1);
            elseif v43 == v6.InvalidUsername then
                l_reportEphemeralCounter_0(v7.FailureUsernameInvalid, 1);
            elseif v43 == v6.UsernameAlreadyTaken then
                l_reportEphemeralCounter_0(v7.FailureUsernameTaken, 1);
            elseif v43 == v6.InvalidPassword then
                l_reportEphemeralCounter_0(v7.FailurePasswordInvalid, 1);
            elseif v43 == v6.UsernameAndPasswordTheSame then
                l_reportEphemeralCounter_0(v7.FailurePasswordMatchesUsername, 1);
            elseif l_FFlagEnableSignupUnavailableInRegionError_0 and v43 == v6.UnavailableInRegion then
                l_reportEphemeralCounter_0(v7.FailureUnavailableInRegion, 1);
            elseif v43 == v6.PasswordTooSimple then
                l_reportEphemeralCounter_0(v7.FailurePasswordTooSimple, 1);
            elseif v40.HttpError == Enum.HttpError.OK and v40.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS then
                l_reportEphemeralCounter_0(v7.FailureThrottled, 1);
            elseif v40.HttpError == Enum.HttpError.OK and v40.StatusCode == l_StatusCodes_0.INTERNAL_SERVER_ERROR then
                l_reportEphemeralCounter_0(v7.FailureInternalServerError, 1);
            elseif v40.HttpError == Enum.HttpError.OK and v40.StatusCode == l_StatusCodes_0.BAD_REQUEST then
                l_reportEphemeralCounter_0(v7.FailureBadRequest, 1);
            elseif v40.HttpError == Enum.HttpError.OK and v40.StatusCode == l_StatusCodes_0.NOT_FOUND then
                l_reportEphemeralCounter_0(v7.FailureNotFound, 1);
            else
                l_reportEphemeralCounter_0(v7.FailureUnknownError, 1);
            end;
            return v4.reject(v43);
        else
            return v4.reject();
        end;
    end);
end;