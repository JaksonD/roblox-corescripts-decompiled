local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_script_FirstAncestor_0.Utils.Base64);
local v5 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_default_0 = require(l_Parent_0.CredentialsProtocol).CredentialsProtocol.default;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v9 = require(l_script_FirstAncestor_0.Common.PasskeyConstants);
local function _() --[[ Line: 18 ]] --[[ Name: getStartPreauthRegistrationUrl ]]
    -- upvalues: l_Url_0 (copy)
    return string.format("%sv1/passkey/start-preauth-registration", l_Url_0.AUTH_URL);
end;
local function v17(v11, v12) --[[ Line: 22 ]] --[[ Name: startPreauthPasskeyRegistration ]]
    -- upvalues: l_HttpService_0 (copy), l_Url_0 (copy), v5 (copy), v9 (copy)
    local v13 = l_HttpService_0:JSONEncode({
        username = v12
    });
    return v11(string.format("%sv1/passkey/start-preauth-registration", l_Url_0.AUTH_URL), "POST", {
        postBody = v13
    }):andThen(function(v14) --[[ Line: 27 ]]
        -- upvalues: v5 (ref)
        return v5.resolve(v14[1]);
    end, function(v15) --[[ Line: 29 ]]
        -- upvalues: l_HttpService_0 (ref), v5 (ref), v9 (ref)
        local v16 = if type(v15) == "table" then l_HttpService_0:JSONEncode(v15) else nil;
        return v5.reject({
            body = v16, 
            name = v9.BACKEND_CREATION_ERROR_NAME, 
            source = v9.START_STEP
        });
    end);
end;
return function(v18, v19) --[[ Line: 40 ]] --[[ Name: attemptPreauthPasskeyRegistration ]]
    -- upvalues: v17 (copy), l_HttpService_0 (copy), v9 (copy), l_UserInputService_0 (copy), v4 (copy), l_default_0 (copy), v5 (copy), l_Logger_0 (copy)
    return v17(v18, v19):andThen(function(v20) --[[ Line: 41 ]]
        -- upvalues: l_HttpService_0 (ref), v9 (ref), l_UserInputService_0 (ref), v4 (ref), l_default_0 (ref), v5 (ref), l_Logger_0 (ref)
        local v21 = l_HttpService_0:JSONDecode(v20.creationOptions);
        local v22 = tonumber(v21.publicKey.timeout);
        v21.keyType = v9.PLATFORM;
        v21.deviceBoundOnly = true;
        if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
            v21.publicKey.challenge = v4.FromUrlSafeBase64(v21.publicKey.challenge);
            v21.publicKey.user.id = v4.FromUrlSafeBase64(v21.publicKey.user.id);
        end;
        local v23 = l_HttpService_0:JSONEncode(v21);
        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.FIDO2, v23, v22 / v9.PASSKEY_TIMEOUT_DURATION):andThen(function(v24) --[[ Line: 60 ]]
            -- upvalues: l_HttpService_0 (ref), v5 (ref), v9 (ref), l_Logger_0 (ref), v4 (ref), v20 (copy)
            local v25 = l_HttpService_0:JSONDecode(v24);
            if v25 == nil or next(v25) == nil then
                return v5.reject({
                    body = "Null resultTable", 
                    name = v9.USER_OS_DIALOG_ERROR_NAME, 
                    source = v9.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_EMPTY_RESPONSE
                });
            elseif v25.errorCode ~= nil then
                l_Logger_0:warning("Passkey credential signing failed. Error {} ({}) returned.", v25.errorCode, v25.errorMsg);
                return v5.reject({
                    body = v25.errorMsg, 
                    name = v9.USER_OS_DIALOG_ERROR_NAME, 
                    source = v9.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_ERROR_CODE
                });
            else
                v25.id = v4.ToUrlSafeBase64(v25.id);
                v25.rawId = v4.ToUrlSafeBase64(v25.rawId);
                v25.response.attestationObject = v4.ToUrlSafeBase64(v25.response.attestationObject);
                v25.response.clientDataJSON = v4.ToUrlSafeBase64(v25.response.clientDataJSON);
                local v26 = l_HttpService_0:JSONEncode(v25);
                return v5.resolve({
                    result = v26, 
                    sessionId = v20.sessionId
                });
            end;
        end, function(v27) --[[ Line: 88 ]]
            -- upvalues: v5 (ref), v9 (ref)
            return v5.reject({
                body = v27, 
                name = v9.USER_OS_DIALOG_ERROR_NAME, 
                source = v9.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_OTHER_ERR
            });
        end);
    end, function(v28) --[[ Line: 95 ]]
        -- upvalues: v5 (ref), v9 (ref)
        if type(v28) == "table" and v28.name then
            return v5.reject(v28);
        else
            return v5.reject({
                body = v28, 
                name = v9.BACKEND_CREATION_ERROR_NAME, 
                source = v9.UNKNOWN_BACKEND_ERROR
            });
        end;
    end);
end;