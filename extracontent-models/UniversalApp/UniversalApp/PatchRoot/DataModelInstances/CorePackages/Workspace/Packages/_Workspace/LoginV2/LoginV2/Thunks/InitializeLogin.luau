local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Enums.AuthIdentifierErrorCodes);
local v5 = require(l_script_FirstAncestor_0.Requests.PostInitializeLogin);
local _ = require(l_script_FirstAncestor_0.Common.LoginV2RequestTypes);
return function(v7, v8) --[[ Line: 11 ]]
    -- upvalues: v5 (copy), v3 (copy), l_HttpService_0 (copy), v4 (copy)
    return function() --[[ Line: 12 ]]
        -- upvalues: v5 (ref), v7 (copy), v8 (copy), v3 (ref), l_HttpService_0 (ref), v4 (ref)
        return v5(v7, v8):andThen(function(v9) --[[ Line: 13 ]]
            -- upvalues: v3 (ref)
            if v9 and v9.responseBody then
                return v9.responseBody;
            else
                return v3.reject();
            end;
        end, function(v10) --[[ Line: 18 ]]
            -- upvalues: l_HttpService_0 (ref), v4 (ref), v3 (ref)
            local v11 = 0;
            if v10.Body then
                v11 = l_HttpService_0:JSONDecode(v10.Body).errors[1].code;
            end;
            local v12 = "Authentication.Login.Response.SomethingWentWrong";
            if v11 == v4.InvalidUser then
                v12 = "Authentication.Login.Response.AccountNotFound";
            end;
            return v3.reject({
                errorCode = v11, 
                errorKey = v12
            });
        end);
    end;
end;