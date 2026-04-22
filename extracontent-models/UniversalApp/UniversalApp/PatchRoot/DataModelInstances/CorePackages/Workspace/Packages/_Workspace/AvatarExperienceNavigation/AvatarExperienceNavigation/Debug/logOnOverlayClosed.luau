local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceNavigation").Parent;
local v1 = require(l_Parent_0.AppDebug).LogTree.logger("ax.rn.overlay");
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    v1:info("onOverlayClosed {}, captureFocus: {}", v2, v3);
end;