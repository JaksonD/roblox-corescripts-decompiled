local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedBadges");
local v1 = require(l_script_FirstAncestor_0.constants);
return function(v2) --[[ Line: 10 ]] --[[ Name: appendVerifiedBadge ]]
    -- upvalues: v1 (copy)
    return v2 .. v1.VERIFIED_EMOJI;
end;