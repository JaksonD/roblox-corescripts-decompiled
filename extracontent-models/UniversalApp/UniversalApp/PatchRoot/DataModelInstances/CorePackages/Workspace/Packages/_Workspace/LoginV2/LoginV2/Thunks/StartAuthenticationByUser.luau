local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Requests.PostStartAuthenticationByUser);
local _ = require(l_script_FirstAncestor_0.Common.LoginV2RequestTypes);
return function(v6, v7) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), v3 (copy), l_HttpService_0 (copy)
    return function() --[[ Line: 11 ]]
        -- upvalues: v4 (ref), v6 (copy), v7 (copy), v3 (ref), l_HttpService_0 (ref)
        return v4(v6, v7):andThen(function(v8) --[[ Line: 12 ]]
            -- upvalues: v3 (ref)
            if v8 and v8.responseBody then
                return v8.responseBody;
            else
                return v3.reject();
            end;
        end, function(v9) --[[ Line: 17 ]]
            -- upvalues: l_HttpService_0 (ref), v3 (ref)
            local v10 = 0;
            if v9.Body then
                v10 = l_HttpService_0:JSONDecode(v9.Body).errors[1].code;
            end;
            return v3.reject({
                errorCode = v10
            });
        end);
    end;
end;