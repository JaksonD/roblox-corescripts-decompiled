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
local v10 = game:DefineFastFlag("FlowQueryParamEnabledStartRegistration", false);
local function _() --[[ Line: 17 ]] --[[ Name: getFinishRegistrationUrl ]]
    -- upvalues: l_Url_0 (copy)
    return string.format("%sv1/passkey/FinishRegistration", l_Url_0.AUTH_URL);
end;
local function v17(v12, v13) --[[ Line: 21 ]] --[[ Name: finishPasskeyRegistration ]]
    -- upvalues: l_Url_0 (copy), v5 (copy), l_HttpService_0 (copy), v9 (copy)
    return v12(string.format("%sv1/passkey/FinishRegistration", l_Url_0.AUTH_URL), "POST", {
        postBody = v13
    }):andThen(function(v14) --[[ Line: 22 ]]
        -- upvalues: v5 (ref)
        return v5.resolve(v14);
    end, function(v15) --[[ Line: 24 ]]
        -- upvalues: l_HttpService_0 (ref), v5 (ref), v9 (ref)
        local v16 = if type(v15) == "table" then l_HttpService_0:JSONEncode(v15) else nil;
        return v5.reject({
            body = v16, 
            name = v9.BACKEND_CREATION_ERROR_NAME, 
            source = v9.FINISH_STEP
        });
    end);
end;
local function _(v18) --[[ Line: 35 ]] --[[ Name: getStartRegistrationUrl ]]
    -- upvalues: l_Url_0 (copy), v10 (copy)
    local v19 = string.format("%sv1/passkey/StartRegistration", l_Url_0.AUTH_URL);
    if v10 and v18 then
        return string.format("%s?flow=%s", v19, v18);
    else
        return v19;
    end;
end;
local function v30(v21, v22, v23) --[[ Line: 50 ]] --[[ Name: startPasskeyRegistration ]]
    -- upvalues: l_HttpService_0 (copy), l_Url_0 (copy), v10 (copy), v5 (copy), v9 (copy)
    local v24 = {
        postBody = l_HttpService_0:JSONEncode({
            isSilentUpgrade = v23
        })
    };
    local l_v21_0 = v21;
    local v26 = string.format("%sv1/passkey/StartRegistration", l_Url_0.AUTH_URL);
    return l_v21_0(if v10 and v22 then string.format("%s?flow=%s", v26, v22) else v26, "POST", v24, v23):andThen(function(v27) --[[ Line: 58 ]]
        -- upvalues: v5 (ref)
        return v5.resolve(v27[1]);
    end, function(v28) --[[ Line: 61 ]]
        -- upvalues: l_HttpService_0 (ref), v5 (ref), v9 (ref)
        local v29 = if type(v28) == "table" then l_HttpService_0:JSONEncode(v28) else nil;
        return v5.reject({
            body = v29, 
            name = v9.BACKEND_CREATION_ERROR_NAME, 
            source = v9.START_STEP
        });
    end);
end;
return function(v31, v32, v33) --[[ Line: 73 ]] --[[ Name: attemptPasskeyRegistration ]]
    -- upvalues: v30 (copy), l_HttpService_0 (copy), l_UserInputService_0 (copy), v4 (copy), l_default_0 (copy), v5 (copy), v9 (copy), l_Logger_0 (copy), v17 (copy)
    return v30(v31, v32, v33):andThen(function(v34) --[[ Line: 74 ]]
        -- upvalues: l_HttpService_0 (ref), v33 (copy), l_UserInputService_0 (ref), v4 (ref), l_default_0 (ref), v5 (ref), v9 (ref), l_Logger_0 (ref), v17 (ref), v31 (copy)
        local v35 = l_HttpService_0:JSONDecode(v34.creationOptions);
        local l_sessionId_0 = v34.sessionId;
        local v37 = tonumber(v35.publicKey.timeout);
        v35.keyType = "platform";
        v35.deviceBoundOnly = true;
        v35.isSilentPasskeyUpgrade = v33;
        if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
            v35.publicKey.challenge = v4.FromUrlSafeBase64(v35.publicKey.challenge);
            v35.publicKey.user.id = v4.FromUrlSafeBase64(v35.publicKey.user.id);
        end;
        local v38 = l_HttpService_0:JSONEncode(v35);
        return l_default_0:registerCredentials(l_default_0.CredentialsTypes.FIDO2, v38, v37 / 1000):andThen(function(v39) --[[ Line: 93 ]]
            -- upvalues: l_HttpService_0 (ref), v5 (ref), v9 (ref), l_Logger_0 (ref), v4 (ref), l_sessionId_0 (copy), v17 (ref), v31 (ref)
            local v40 = l_HttpService_0:JSONDecode(v39);
            if v40 == nil or next(v40) == nil then
                return v5.reject({
                    body = "Null resultTable", 
                    name = v9.USER_OS_DIALOG_ERROR_NAME, 
                    source = v9.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_EMPTY_RESPONSE
                });
            elseif v40.errorCode ~= nil then
                l_Logger_0:warning("Passkey credential signing failed. Error {} ({}) returned.", v40.errorCode, v40.errorMsg);
                return v5.reject({
                    body = v40.errorMsg, 
                    name = v9.USER_OS_DIALOG_ERROR_NAME, 
                    source = v9.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_ERROR_CODE
                });
            else
                v40.id = v4.ToUrlSafeBase64(v40.id);
                v40.rawId = v4.ToUrlSafeBase64(v40.rawId);
                v40.response.attestationObject = v4.ToUrlSafeBase64(v40.response.attestationObject);
                v40.response.clientDataJSON = v4.ToUrlSafeBase64(v40.response.clientDataJSON);
                local v41 = l_HttpService_0:JSONEncode(v40);
                local v42 = {
                    sessionId = l_sessionId_0, 
                    credentialNickname = "Passkey", 
                    attestationResponse = v41
                };
                local v43 = l_HttpService_0:JSONEncode(v42);
                return v17(v31, v43);
            end;
        end, function(v44) --[[ Line: 128 ]]
            -- upvalues: v5 (ref), v9 (ref)
            return v5.reject({
                body = v44, 
                name = v9.USER_OS_DIALOG_ERROR_NAME, 
                source = v9.CREDENTIALS_PROTOCOL_REGISTER_CREDENTIALS_OTHER_ERR
            });
        end);
    end, function(v45) --[[ Line: 135 ]]
        -- upvalues: v5 (ref), v9 (ref)
        if type(v45) == "table" and v45.name then
            return v5.reject(v45);
        else
            return v5.reject({
                body = v45, 
                name = v9.BACKEND_CREATION_ERROR_NAME, 
                source = v9.UNKNOWN_BACKEND_ERROR
            });
        end;
    end);
end;