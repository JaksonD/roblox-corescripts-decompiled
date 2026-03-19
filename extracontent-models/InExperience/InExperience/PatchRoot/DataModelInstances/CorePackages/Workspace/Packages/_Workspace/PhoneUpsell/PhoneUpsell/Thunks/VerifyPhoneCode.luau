local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.PostVerifyPhoneCode);
return function(v5, v6) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), v3 (copy), l_HttpService_0 (copy)
    return function() --[[ Line: 15 ]]
        -- upvalues: v4 (ref), v5 (copy), v6 (copy), v3 (ref), l_HttpService_0 (ref)
        return v4(v5, v6):andThen(function(_) --[[ Line: 16 ]]
            -- upvalues: v3 (ref)
            return v3.resolve();
        end, function(v8) --[[ Line: 18 ]]
            -- upvalues: l_HttpService_0 (ref), v3 (ref)
            local v9 = 0;
            if v8.Body then
                v9 = l_HttpService_0:JSONDecode(v8.Body).errors[1].code;
            end;
            return v3.reject({
                ErrorCode = v9
            });
        end);
    end;
end;