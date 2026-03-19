local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local l_AXTooltip_0 = require(l_Parent_0.AvatarExperienceUIKit).AXTooltipComponents.AXTooltip;
local v3 = require(script.Parent.useAXTooltipViewModel);
return function(v4) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), v1 (copy), l_AXTooltip_0 (copy)
    local v5 = v3(v4);
    return v1.createElement(l_AXTooltip_0, v5);
end;