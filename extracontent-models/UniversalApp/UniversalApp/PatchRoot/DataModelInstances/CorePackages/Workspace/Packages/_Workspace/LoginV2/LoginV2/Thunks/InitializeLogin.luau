local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Enums.AuthIdentifierErrorCodes);
local v5 = require(l_script_FirstAncestor_0.Requests.PostInitializeLogin);
local _ = require(l_script_FirstAncestor_0.Common.LoginV2RequestTypes);
local v7 = game:DefineFastFlag("LoginV2EmailCredentialRequiredError", false);
local v8 = game:DefineFastFlag("LoginV2NoLoginMethodsError", false);
return function(v9, v10) --[[ Line: 14 ]]
    -- upvalues: v5 (copy), v3 (copy), l_HttpService_0 (copy), v4 (copy), v7 (copy), v8 (copy)
    return function() --[[ Line: 15 ]]
        -- upvalues: v5 (ref), v9 (copy), v10 (copy), v3 (ref), l_HttpService_0 (ref), v4 (ref), v7 (ref), v8 (ref)
        return v5(v9, v10):andThen(function(v11) --[[ Line: 16 ]]
            -- upvalues: v3 (ref)
            if v11 and v11.responseBody then
                return v11.responseBody;
            else
                return v3.reject();
            end;
        end, function(v12) --[[ Line: 21 ]]
            -- upvalues: l_HttpService_0 (ref), v4 (ref), v7 (ref), v8 (ref), v3 (ref)
            local v13 = 0;
            if v12.Body then
                v13 = l_HttpService_0:JSONDecode(v12.Body).errors[1].code;
            end;
            local v14 = "Authentication.Login.Response.SomethingWentWrong";
            if v13 == v4.InvalidUser then
                v14 = "Authentication.Login.Response.AccountNotFound";
            elseif v7 and v13 == v4.EmailCredentialRequired then
                v14 = "Authentication.Login.Response.EnterEmailForLoginCode";
            elseif v8 and v13 == v4.NoLoginMethods then
                v14 = "Authentication.Login.Response.NoLoginMethods";
            end;
            return v3.reject({
                errorCode = v13, 
                errorKey = v14
            });
        end);
    end;
end;