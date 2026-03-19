local l_Parent_0 = script:FindFirstAncestor("SocialUpsell").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = {};
return function(v3, v4) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.Dictionary.join(v3 or v2, {
        isInExperience = if v4 then v4.isInExperience else false
    });
end;