local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceLoadingScript");
local v1 = require(l_script_FirstAncestor_0.createNetworking);
local v2 = require(script.Parent.buildPlayerLocalizationChoiceUrl);
return function(v3) --[[ Line: 6 ]] --[[ Name: fetchPlayerLocalizationChoice ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2(v3);
    return v1(v4, "GET");
end;