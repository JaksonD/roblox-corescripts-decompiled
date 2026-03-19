local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Http.Requests.PostSetPhone);
local l_isStringPhone_0 = require(l_Parent_0.AuthCommon).Utils.isStringPhone;
return function(v6, v7, v8, v9, v10) --[[ Line: 16 ]]
    -- upvalues: l_isStringPhone_0 (copy), v3 (copy), v4 (copy), l_HttpService_0 (copy)
    return function() --[[ Line: 17 ]]
        -- upvalues: l_isStringPhone_0 (ref), v8 (copy), v9 (copy), v3 (ref), v4 (ref), v6 (copy), v7 (copy), v10 (copy), l_HttpService_0 (ref)
        if not l_isStringPhone_0(v8 .. v9) then
            return v3.reject({
                PhoneRegexFailed = true
            });
        else
            return v4(v6, v7, v8, v9, v10):andThen(function(_) --[[ Line: 23 ]]
                -- upvalues: v3 (ref)
                return v3.resolve();
            end, function(v12) --[[ Line: 25 ]]
                -- upvalues: l_HttpService_0 (ref), v3 (ref)
                local v13 = 0;
                if v12.Body then
                    v13 = l_HttpService_0:JSONDecode(v12.Body).errors[1].code;
                end;
                return v3.reject({
                    ErrorCode = v13, 
                    PhoneRegexFailed = false
                });
            end);
        end;
    end;
end;