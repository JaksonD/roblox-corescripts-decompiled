local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.PostResendPhoneCode);
return function(v5) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), v3 (copy), l_HttpService_0 (copy)
    return function() --[[ Line: 15 ]]
        -- upvalues: v4 (ref), v5 (copy), v3 (ref), l_HttpService_0 (ref)
        return v4(v5):andThen(function(_) --[[ Line: 16 ]]
            -- upvalues: v3 (ref)
            return v3.resolve();
        end, function(v7) --[[ Line: 18 ]]
            -- upvalues: l_HttpService_0 (ref), v3 (ref)
            local v8 = 0;
            if v7.Body then
                v8 = l_HttpService_0:JSONDecode(v7.Body).errors[1].code;
            end;
            return v3.reject({
                ErrorCode = v8
            });
        end);
    end;
end;