local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Utils.Base64);
local v4 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v6 = require(l_script_FirstAncestor_0.Common.PasskeyConstants);
local function _() --[[ Line: 14 ]] --[[ Name: getFinishRegistrationUrl ]]
    -- upvalues: l_Url_0 (copy)
    return string.format("%sv1/passkey/finish-preauth-registration", l_Url_0.AUTH_URL);
end;
local function v13(v8, v9) --[[ Line: 18 ]] --[[ Name: finishPreauthPasskeyRegistration ]]
    -- upvalues: l_Url_0 (copy), v4 (copy), l_HttpService_0 (copy), v6 (copy)
    return v8(string.format("%sv1/passkey/finish-preauth-registration", l_Url_0.AUTH_URL), "POST", {
        postBody = v9
    }):andThen(function(v10) --[[ Line: 19 ]]
        -- upvalues: v4 (ref)
        return v4.resolve(v10);
    end, function(v11) --[[ Line: 21 ]]
        -- upvalues: l_HttpService_0 (ref), v4 (ref), v6 (ref)
        local v12 = if type(v11) == "table" then l_HttpService_0:JSONEncode(v11) else nil;
        return v4.reject({
            body = v12, 
            name = v6.BACKEND_CREATION_ERROR_NAME
        });
    end);
end;
return function(v14, v15, v16) --[[ Line: 27 ]] --[[ Name: attemptFinishPreauthPasskeyRegistration ]]
    -- upvalues: l_HttpService_0 (copy), v3 (copy), v13 (copy)
    local v17 = l_HttpService_0:JSONDecode(v16);
    v17.id = v3.ToUrlSafeBase64(v17.id);
    v17.rawId = v3.ToUrlSafeBase64(v17.rawId);
    v17.response.attestationObject = v3.ToUrlSafeBase64(v17.response.attestationObject);
    v17.response.clientDataJSON = v3.ToUrlSafeBase64(v17.response.clientDataJSON);
    local v18 = l_HttpService_0:JSONEncode(v17);
    local v19 = {
        sessionId = v15, 
        registrationResponse = v18
    };
    local v20 = l_HttpService_0:JSONEncode(v19);
    return v13(v14, v20);
end;