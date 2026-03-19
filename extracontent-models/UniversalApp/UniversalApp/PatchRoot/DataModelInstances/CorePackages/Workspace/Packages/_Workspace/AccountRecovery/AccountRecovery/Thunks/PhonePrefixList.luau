local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_Parent_0.Http);
local v4 = require(l_script_FirstAncestor_0.Requests.GetPhonePrefixList);
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
local v6 = require(l_script_FirstAncestor_0.Components.Constants);
return function(v7) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), v6 (copy), l_HttpService_0 (copy)
    return function() --[[ Line: 13 ]]
        -- upvalues: v4 (ref), v7 (copy), v6 (ref), l_HttpService_0 (ref)
        return v4(v7):andThen(function(v8) --[[ Line: 14 ]]
            -- upvalues: v6 (ref)
            if v8 and v8.responseBody and v8.responseBody ~= "" then
                local l_responseBody_0 = v8.responseBody;
                local v10 = nil;
                for v11, v12 in ipairs(l_responseBody_0) do
                    if v12.isDefault == true then
                        v10 = v11;
                        break;
                    end;
                end;
                if v10 and v10 ~= 1 then
                    local v13 = l_responseBody_0[v10];
                    table.remove(l_responseBody_0, v10);
                    table.insert(l_responseBody_0, 1, v13);
                end;
                return {
                    isError = false, 
                    data = l_responseBody_0
                };
            else
                return {
                    isError = true, 
                    errorCode = 0, 
                    errorKey = v6.UnknownErrorKey
                };
            end;
        end, function(v14) --[[ Line: 41 ]]
            -- upvalues: l_HttpService_0 (ref), v6 (ref)
            local v15 = 0;
            if v14.Body then
                v15 = l_HttpService_0:JSONDecode(v14.Body).errors[1].code;
            end;
            local l_UnknownErrorKey_0 = v6.UnknownErrorKey;
            return {
                isError = true, 
                errorCode = v15, 
                errorKey = l_UnknownErrorKey_0
            };
        end);
    end;
end;