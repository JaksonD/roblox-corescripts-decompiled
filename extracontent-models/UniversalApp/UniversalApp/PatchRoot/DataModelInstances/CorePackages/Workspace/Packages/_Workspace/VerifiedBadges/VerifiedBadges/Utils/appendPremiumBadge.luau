local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedBadges");
local v1 = require(l_script_FirstAncestor_0.constants);
return function(v2) --[[ Line: 9 ]] --[[ Name: appendPremiumBadge ]]
    -- upvalues: v1 (copy)
    return v2 .. v1.PREMIUM_EMOJI;
end;