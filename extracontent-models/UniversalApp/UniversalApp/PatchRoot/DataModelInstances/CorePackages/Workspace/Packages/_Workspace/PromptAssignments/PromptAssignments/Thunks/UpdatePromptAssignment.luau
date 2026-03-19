local l_script_FirstAncestor_0 = script:FindFirstAncestor("PromptAssignments");
local v1 = require(l_script_FirstAncestor_0.Requests.PostUpdatePromptAssignments);
local v2 = require(l_script_FirstAncestor_0.Enum.PromptType);
local v3 = require(l_script_FirstAncestor_0.Enum.PromptAssignmentAction);
return function(v4, v5, v6) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    return function(_) --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v5 (copy), v1 (ref), v4 (copy), v3 (ref), v6 (copy)
        local v8 = v2.toRawValue(v5);
        if v8 == nil then
            v8 = v5;
        end;
        return v1(v4, v8, v3.toRawValue(v6)):andThen(function(v9) --[[ Line: 16 ]]
            return v9.responseBody;
        end);
    end;
end;