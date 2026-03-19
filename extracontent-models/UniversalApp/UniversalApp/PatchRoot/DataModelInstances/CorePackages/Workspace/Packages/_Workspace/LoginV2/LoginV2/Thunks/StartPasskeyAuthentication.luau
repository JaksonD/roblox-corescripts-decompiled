local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Requests.PostStartPasskeyAuthentication);
return function(v5) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), v3 (copy), l_HttpService_0 (copy)
    return function() --[[ Line: 11 ]]
        -- upvalues: v4 (ref), v5 (copy), v3 (ref), l_HttpService_0 (ref)
        return v4(v5):andThen(function(v6) --[[ Line: 12 ]]
            -- upvalues: v3 (ref)
            if v6 and v6.responseBody then
                return v6.responseBody;
            else
                return v3.reject();
            end;
        end, function(v7) --[[ Line: 17 ]]
            -- upvalues: l_HttpService_0 (ref), v3 (ref)
            local v8 = 0;
            if v7.Body then
                v8 = l_HttpService_0:JSONDecode(v7.Body).errors[1].code;
            end;
            return v3.reject({
                errorCode = v8
            });
        end);
    end;
end;