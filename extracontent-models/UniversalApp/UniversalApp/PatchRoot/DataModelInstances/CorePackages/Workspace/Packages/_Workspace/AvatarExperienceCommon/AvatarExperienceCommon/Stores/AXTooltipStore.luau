local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(script.createAXTooltipStore);
return v1.createComputed(v2);