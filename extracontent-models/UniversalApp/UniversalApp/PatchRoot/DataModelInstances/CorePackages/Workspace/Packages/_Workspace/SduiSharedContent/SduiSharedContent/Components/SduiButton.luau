local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local _ = require(l_Parent_0.SduiCompat);
return function(v4) --[[ Line: 42 ]] --[[ Name: SduiButton ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Button, {
        AnchorPoint = v4.anchorPoint, 
        LayoutOrder = v4.layoutOrder, 
        Position = v4.position, 
        Selectable = v4.selectable, 
        Visible = v4.visible, 
        ZIndex = v4.zIndex, 
        cursor = v4.cursorType, 
        fillBehavior = v4.fillBehavior, 
        icon = v4.icon, 
        inputDelay = v4.inputDelay, 
        isDisabled = v4.isDisabled, 
        isLoading = v4.isLoading, 
        onActivated = v4.onActivated, 
        size = v4.size, 
        tag = v4.tag, 
        testId = v4.testId, 
        text = v4.text, 
        variant = v4.variant, 
        width = v4.width
    });
end;