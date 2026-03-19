local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceLoadingScript");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.CachedPolicyService);
local v3 = require(l_script_FirstAncestor_0.Actions.SetIsSubjectToChinaPolicies);
return function() --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return function(v4) --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v3 (ref)
        coroutine.wrap(function() --[[ Line: 9 ]]
            -- upvalues: v2 (ref), v4 (copy), v3 (ref)
            local v5 = v2:IsSubjectToChinaPolicies();
            v4:dispatch(v3(v5));
        end)();
    end;
end;