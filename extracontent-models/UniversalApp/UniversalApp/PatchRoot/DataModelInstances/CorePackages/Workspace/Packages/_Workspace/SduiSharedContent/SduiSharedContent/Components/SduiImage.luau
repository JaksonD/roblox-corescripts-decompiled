local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local _ = require(l_Parent_0.SduiCompat);
return function(v4) --[[ Line: 39 ]] --[[ Name: SduiImage ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Image, {
        AnchorPoint = v4.anchorPoint, 
        AutomaticSize = v4.automaticSize, 
        ClipsDescendants = v4.clipsDescendants, 
        Image = v4.image, 
        LayoutOrder = v4.layoutOrder, 
        Position = v4.position, 
        ResampleMode = v4.resampleMode, 
        ScaleType = v4.scaleType, 
        Size = v4.size, 
        SizeConstraint = v4.sizeConstraint, 
        TileSize = v4.tileSize, 
        Visible = v4.visible, 
        ZIndex = v4.zIndex, 
        aspectRatio = v4.aspectRatio, 
        backgroundStyle = v4.backgroundStyle, 
        cornerRadius = v4.cornerRadius, 
        cursor = v4.cursorType, 
        imageStyle = v4.imageStyle, 
        onActivated = v4.onActivated, 
        tag = v4.tag, 
        testId = v4.testId
    });
end;