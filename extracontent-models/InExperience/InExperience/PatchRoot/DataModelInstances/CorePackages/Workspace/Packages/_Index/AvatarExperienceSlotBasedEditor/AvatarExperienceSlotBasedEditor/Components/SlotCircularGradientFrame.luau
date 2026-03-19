local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local l_ColorGradientCircle_0 = require(l_Parent_0.AXCommon).Components.ColorGradientCircle;
local v2 = require(l_Parent_0.React);
return function(v3) --[[ Line: 18 ]] --[[ Name: SlotCircularGradientFrame ]]
    -- upvalues: v2 (copy), l_ColorGradientCircle_0 (copy)
    return v2.createElement(l_ColorGradientCircle_0, {
        hasBorder = true, 
        Colors = v3.Colors, 
        Size = UDim2.fromScale(0.4, 0.4), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Rotation = v3.Rotation, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Transparency = v3.Transparency, 
        Offset = v3.Offset
    });
end;