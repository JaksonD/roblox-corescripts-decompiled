local l_Parent_0 = script:FindFirstAncestor("UserProfiles").Parent;
local v1 = require(l_Parent_0.VerifiedBadges);
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    if v3.hasVerifiedBadge then
        return (("%*%*"):format(v2, v1.emoji.verified));
    elseif v3.hasPremiumMembership then
        return (("%*%*"):format(v2, v1.emoji.premium));
    else
        return v2;
    end;
end;