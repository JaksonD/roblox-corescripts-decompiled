local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local _ = require(l_Parent_0.SduiCompat);
return v1.memo(function(v4) --[[ Line: 46 ]] --[[ Name: SduiView ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.View, {
        AnchorPoint = v4.anchorPoint, 
        AutomaticSize = v4.automaticSize, 
        ClipsDescendants = v4.clipsDescendants, 
        GroupTransparency = v4.groupTransparency, 
        LayoutOrder = v4.layoutOrder, 
        Position = v4.position, 
        Rotation = v4.rotation, 
        Size = v4.size, 
        SizeConstraint = v4.sizeConstraint, 
        Visible = v4.visible, 
        ZIndex = v4.zIndex, 
        aspectRatio = v4.aspectRatio, 
        backgroundStyle = v4.backgroundStyle, 
        cornerRadius = v4.cornerRadius, 
        cursor = v4.cursorType, 
        isDisabled = v4.isDisabled, 
        onActivated = v4.onActivated, 
        onSecondaryActivated = v4.onSecondaryActivated, 
        padding = v4.padding, 
        scale = v4.scale, 
        selection = if v4.selectable ~= nil then {
            Selectable = v4.selectable
        } else nil, 
        selectionGroup = v4.selectionGroup, 
        tag = v4.tag, 
        testId = v4.testId
    }, v4.children);
end);