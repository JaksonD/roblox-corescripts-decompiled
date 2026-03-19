local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.SceneUnderstanding);
return function(v3) --[[ Line: 6 ]] --[[ Name: sortByAudibleVolume ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v1.List.filter(v3, v2.isAudible);
    return v1.List.sort(v4, function(v5, v6) --[[ Line: 9 ]]
        -- upvalues: v2 (ref)
        return v2.calculatePotentialAudibility(v5) > v2.calculatePotentialAudibility(v6);
    end);
end;