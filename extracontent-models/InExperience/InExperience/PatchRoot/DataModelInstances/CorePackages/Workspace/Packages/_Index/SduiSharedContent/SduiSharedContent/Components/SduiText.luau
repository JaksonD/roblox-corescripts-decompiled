local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local _ = require(l_Parent_0.SduiCompat);
return function(v4) --[[ Line: 52 ]] --[[ Name: SduiText ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Text, {
        AnchorPoint = v4.anchorPoint, 
        AutomaticSize = v4.automaticSize, 
        LayoutOrder = v4.layoutOrder, 
        Position = v4.position, 
        RichText = v4.richText, 
        Rotation = v4.rotation, 
        Size = v4.size, 
        SizeConstraint = v4.sizeConstraint, 
        Text = v4.text, 
        TextTruncate = v4.textTruncate, 
        TextWrapped = v4.textWrapped, 
        TextXAlignment = v4.textXAlignment, 
        TextYAlignment = v4.textYAlignment, 
        Visible = v4.visible, 
        ZIndex = v4.zIndex, 
        aspectRatio = v4.aspectRatio, 
        backgroundStyle = v4.backgroundStyle, 
        cornerRadius = v4.cornerRadius, 
        cursor = v4.cursorType, 
        fontStyle = v4.fontStyle, 
        isDisabled = v4.isDisabled, 
        onActivated = v4.onActivated, 
        onSecondaryActivated = v4.onSecondaryActivated, 
        padding = v4.padding, 
        scale = v4.scale, 
        selection = if v4.selectable ~= nil then {
            Selectable = v4.selectable
        } else nil, 
        tag = v4.tag, 
        testId = v4.testId, 
        textStyle = v4.textStyle
    }, v4.children);
end;