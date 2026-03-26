local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local _ = require(l_Parent_0.SduiCompat);
return v1.memo(function(v4) --[[ Line: 32 ]] --[[ Name: SduiIcon ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Icon, {
        name = v4.name, 
        style = v4.style, 
        size = v4.size, 
        variant = v4.variant, 
        Rotation = v4.rotation, 
        AnchorPoint = v4.anchorPoint, 
        LayoutOrder = v4.layoutOrder, 
        Position = v4.position, 
        Visible = v4.visible, 
        ZIndex = v4.zIndex, 
        testId = v4.testId
    }, v4.children);
end);