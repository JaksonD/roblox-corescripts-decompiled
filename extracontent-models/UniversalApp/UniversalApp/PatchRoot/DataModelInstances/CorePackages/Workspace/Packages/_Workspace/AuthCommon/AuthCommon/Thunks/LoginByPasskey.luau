local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.LoginRequests);
local v5 = require(l_script_FirstAncestor_0.Models.LoginResult);
local v6 = require(l_script_FirstAncestor_0.Enums.LoginErrorCodes);
local v7 = require(l_script_FirstAncestor_0.Enums.LoginMethods);
local v8 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local l_FFlagEnableLastLoginMethodTracking_0 = require(l_Parent_0.SharedFlags).FFlagEnableLastLoginMethodTracking;
local l_FFlagEnableRecordLogin_0 = require(l_Parent_0.SharedFlags).FFlagEnableRecordLogin;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v12 = require(l_script_FirstAncestor_0.Utils.recordLogin);
return function(v13, v14, v15) --[[ Line: 19 ]] --[[ Name: loginByPasskey ]]
    -- upvalues: v4 (copy), v5 (copy), l_FFlagEnableLastLoginMethodTracking_0 (copy), v8 (copy), v7 (copy), l_FFlagEnableRecordLogin_0 (copy), v12 (copy), l_Logger_0 (copy), l_HttpService_0 (copy), v6 (copy), v3 (copy)
    return function(_) --[[ Line: 20 ]]
        -- upvalues: v4 (ref), v13 (copy), v14 (copy), v15 (copy), v5 (ref), l_FFlagEnableLastLoginMethodTracking_0 (ref), v8 (ref), v7 (ref), l_FFlagEnableRecordLogin_0 (ref), v12 (ref), l_Logger_0 (ref), l_HttpService_0 (ref), v6 (ref), v3 (ref)
        return v4.logByPasskey(v13, v14, v15):andThen(function(v17) --[[ Line: 21 ]]
            -- upvalues: v5 (ref), l_FFlagEnableLastLoginMethodTracking_0 (ref), v8 (ref), v7 (ref), l_FFlagEnableRecordLogin_0 (ref), v12 (ref)
            assert(v17, "no login attempt result");
            assert(#v17 == 1, "no result or more than one result");
            local v18 = v5.fromJsonData(v17[1]);
            assert(v18, "result invalid");
            if l_FFlagEnableLastLoginMethodTracking_0 then
                v8.setLastSuccessfulSignInMethod(v7.Passkey);
            end;
            if l_FFlagEnableRecordLogin_0 then
                pcall(function() --[[ Line: 30 ]]
                    -- upvalues: v12 (ref), v18 (copy), v7 (ref)
                    v12(v18, v7.Passkey, v18.user.name);
                end);
            end;
            return v18;
        end, function(v19) --[[ Line: 36 ]]
            -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), v6 (ref), v3 (ref)
            l_Logger_0:error("Error logging in by passkey. Error: {}", v19.Body);
            local v20 = l_HttpService_0:JSONDecode(v19.Body);
            local l_code_0 = v20.errors[1].code;
            local v22 = "Authentication.Login.Response.SomethingWentWrong";
            local v23 = v20 and v20.errors and v20.errors[1] and v20.errors[1].userFacingMessage;
            if l_code_0 == v6.IncorrectCValueOrPassword then
                v22 = "Authentication.Login.Response.InvalidPasskeyCredential";
            end;
            return v3.reject({
                errorCode = l_code_0, 
                errorKey = v22, 
                userFacingMessage = v23
            });
        end);
    end;
end;