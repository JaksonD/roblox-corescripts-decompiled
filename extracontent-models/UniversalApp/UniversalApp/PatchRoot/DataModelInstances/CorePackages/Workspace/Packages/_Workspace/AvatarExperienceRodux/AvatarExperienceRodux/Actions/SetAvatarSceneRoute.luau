local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceRodux").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(l_Parent_0.ArgCheck);
local _ = require(l_Parent_0.AvatarExperienceNavigation);
return v1.makeActionCreator(script.Name, function(v4) --[[ Line: 9 ]]
    -- upvalues: v2 (copy)
    v2.isType(v4, "table", "avatarRoute");
    return {
        avatarRoute = v4
    };
end);