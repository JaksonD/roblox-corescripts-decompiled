local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagOverridePlayerVerifiedBadge);
local v2 = require(l_script_FirstAncestor_0.Flags.getFStringWhitelistVerifiedUserId);
return function(v3) --[[ Line: 16 ]] --[[ Name: isPlayerVerified ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v1() then
        return true;
    elseif tostring(v3.UserId) == v2() then
        return true;
    else
        return v3.HasVerifiedBadge;
    end;
end;