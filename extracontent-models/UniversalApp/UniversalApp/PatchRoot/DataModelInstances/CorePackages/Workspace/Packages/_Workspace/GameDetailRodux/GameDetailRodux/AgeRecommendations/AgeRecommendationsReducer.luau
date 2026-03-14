local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.AgeRecommendations.SetAgeRecommendation);
return function(v4, v5) --[[ Line: 7 ]]
    -- upvalues: v3 (copy), v2 (copy)
    v4 = v4 or {};
    if v5.type == v3.name then
        local l_ageRecommendationDetails_0 = v5.ageRecommendationDetails;
        v4 = v2.Dictionary.join(v4, {
            [v5.universeId] = l_ageRecommendationDetails_0
        });
    end;
    return v4;
end;