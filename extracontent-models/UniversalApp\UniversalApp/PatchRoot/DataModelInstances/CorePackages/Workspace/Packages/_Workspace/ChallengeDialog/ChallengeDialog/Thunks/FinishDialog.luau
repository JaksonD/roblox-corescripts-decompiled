local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogAction);
local v5 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogError);
local v6 = require(l_script_FirstAncestor_0.Requests.PostFinishDialog);
return function(v7, v8, v9) --[[ Line: 11 ]]
    -- upvalues: v6 (copy), v4 (copy), v3 (copy), v5 (copy), l_HttpService_0 (copy)
    return function(_) --[[ Line: 12 ]]
        -- upvalues: v6 (ref), v7 (copy), v8 (copy), v4 (ref), v9 (copy), v3 (ref), v5 (ref), l_HttpService_0 (ref)
        return v6(v7, v8, v4.toRawValue(v9)):andThen(function(v11) --[[ Line: 14 ]]
            return v11.responseBody;
        end):catch(function(v12) --[[ Line: 17 ]]
            -- upvalues: v3 (ref), v5 (ref), l_HttpService_0 (ref)
            if not v12.Body then
                return v3.reject(v5.Unknown);
            else
                local l_code_0 = l_HttpService_0:JSONDecode(v12.Body).errors[1].code;
                local v14 = v5.fromRawValue(l_code_0);
                return v3.reject(v14 or v5.Unknown);
            end;
        end);
    end;
end;