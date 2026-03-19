local l_Parent_0 = script:FindFirstAncestor("UserLib").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_getFFlagOverridePlayerVerifiedBadge_0 = v1.getFFlagOverridePlayerVerifiedBadge;
local l_getFStringWhitelistVerifiedUserId_0 = v1.getFStringWhitelistVerifiedUserId;
return function(v4) --[[ Line: 27 ]] --[[ Name: isPlayerVerified ]]
    -- upvalues: l_getFFlagOverridePlayerVerifiedBadge_0 (copy), l_getFStringWhitelistVerifiedUserId_0 (copy)
    if l_getFFlagOverridePlayerVerifiedBadge_0() then
        return true;
    elseif tostring(v4.UserId) == l_getFStringWhitelistVerifiedUserId_0() then
        return true;
    elseif v4.HasVerifiedBadge ~= nil then
        return v4.HasVerifiedBadge;
    else
        return false;
    end;
end;