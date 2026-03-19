local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Requests.FetchDialog);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
return function(v4) --[[ Line: 7 ]]
    -- upvalues: l_PerformFetch_0 (copy), v2 (copy)
    return l_PerformFetch_0.Single("FetchDialog", function(_) --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v4 (copy)
        return v2(v4):andThen(function(v6) --[[ Line: 9 ]]
            return v6.responseBody;
        end);
    end);
end;