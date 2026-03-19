local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION_0 = require(l_script_FirstAncestor_0.Constants).BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION;
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: l_BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION_0 (copy)
    if v3 then
        for v4, v5 in v3 do
            v2[l_BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION_0[v4]] = v5;
        end;
    end;
end;