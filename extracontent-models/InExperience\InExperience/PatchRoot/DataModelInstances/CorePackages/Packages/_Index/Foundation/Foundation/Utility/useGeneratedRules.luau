local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.Device);
local _ = require(l_script_FirstAncestor_0.Enums.Theme);
local v5 = require(l_script_FirstAncestor_0.Utility.getGeneratedRules);
return function(v6, v7) --[[ Line: 11 ]] --[[ Name: useGeneratedRules ]]
    -- upvalues: v2 (copy), v5 (copy)
    return v2.useMemo(function() --[[ Line: 12 ]]
        -- upvalues: v5 (ref), v6 (copy), v7 (copy)
        return v5(v6, v7);
    end, {
        v6, 
        v7
    });
end;