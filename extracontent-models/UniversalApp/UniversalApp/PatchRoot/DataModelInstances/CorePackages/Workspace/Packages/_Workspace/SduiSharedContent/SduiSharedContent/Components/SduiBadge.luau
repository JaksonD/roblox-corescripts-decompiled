local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local _ = require(l_Parent_0.SduiCompat);
local l_Badge_0 = v2.Badge;
return v1.memo(function(v5) --[[ Line: 28 ]] --[[ Name: SduiBadge ]]
    -- upvalues: v1 (copy), l_Badge_0 (copy)
    return v1.createElement(l_Badge_0, {
        text = v5.text, 
        icon = v5.icon, 
        variant = v5.variant, 
        testId = v5.testId, 
        onAbsoluteSizeChanged = v5.onAbsoluteSizeChanged, 
        onAbsolutePositionChanged = v5.onAbsolutePositionChanged, 
        AnchorPoint = v5.anchorPoint, 
        LayoutOrder = v5.layoutOrder, 
        Position = v5.position, 
        Visible = v5.visible, 
        ZIndex = v5.zIndex
    });
end);