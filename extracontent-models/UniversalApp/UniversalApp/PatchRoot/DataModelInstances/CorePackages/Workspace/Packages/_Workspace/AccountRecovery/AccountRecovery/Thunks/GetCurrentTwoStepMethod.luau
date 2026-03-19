local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_Parent_0.Http);
local v4 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryErrorCodes);
local v5 = require(l_script_FirstAncestor_0.Requests.GetCurrentTwoStepMethod);
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
local v7 = require(l_script_FirstAncestor_0.Components.Constants);
return function(v8, v9) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), v7 (copy), l_HttpService_0 (copy), v4 (copy)
    return function() --[[ Line: 14 ]]
        -- upvalues: v5 (ref), v8 (copy), v9 (copy), v7 (ref), l_HttpService_0 (ref), v4 (ref)
        return v5(v8, v9):andThen(function(v10) --[[ Line: 15 ]]
            -- upvalues: v7 (ref)
            if v10 and v10.responseBody and v10.responseBody ~= "" then
                return {
                    isError = false, 
                    data = v10.responseBody
                };
            else
                return {
                    isError = true, 
                    errorCode = 0, 
                    errorKey = v7.UnknownErrorKey
                };
            end;
        end, function(v11) --[[ Line: 27 ]]
            -- upvalues: l_HttpService_0 (ref), v7 (ref), v4 (ref)
            local v12 = 0;
            if v11.Body and v11.Body ~= "" then
                local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v11.Body);
                if l_status_0 then
                    local v15 = l_result_0.errors and l_result_0.errors[1];
                    if v15 then
                        v12 = v15.code;
                    end;
                end;
            end;
            local l_UnknownErrorKey_0 = v7.UnknownErrorKey;
            if v12 == v4.IdentifierInvalid then
                l_UnknownErrorKey_0 = "Authentication.AccountRecovery.Message.Error.AccountNotFound";
            end;
            return {
                isError = true, 
                errorCode = v12, 
                errorKey = l_UnknownErrorKey_0
            };
        end);
    end;
end;