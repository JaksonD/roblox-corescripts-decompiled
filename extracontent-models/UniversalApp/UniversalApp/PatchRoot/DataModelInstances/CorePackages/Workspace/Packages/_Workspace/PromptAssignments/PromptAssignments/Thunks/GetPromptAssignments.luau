local l_script_FirstAncestor_0 = script:FindFirstAncestor("PromptAssignments");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v3 = require(l_script_FirstAncestor_0.Requests.GetPromptAssignments);
return function(v4) --[[ Line: 6 ]]
    -- upvalues: l_PerformFetch_0 (copy), v3 (copy)
    return l_PerformFetch_0.Single("GetPromptAssignments", function(_) --[[ Line: 7 ]]
        -- upvalues: v3 (ref), v4 (copy)
        return v3(v4):andThen(function(v6) --[[ Line: 8 ]]
            return v6.responseBody;
        end);
    end);
end;