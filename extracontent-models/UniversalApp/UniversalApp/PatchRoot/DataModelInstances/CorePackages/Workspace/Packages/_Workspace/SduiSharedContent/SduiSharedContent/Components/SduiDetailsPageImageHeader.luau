local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local _ = require(l_Parent_0.SduiCompat);
local l_View_0 = v2.View;
local l_Image_0 = v2.Image;
return v1.memo(function(v6) --[[ Line: 42 ]] --[[ Name: SduiDetailsPageImageHeader ]]
    -- upvalues: v1 (copy), l_View_0 (copy), l_Image_0 (copy)
    return v1.createElement(l_View_0, {
        tag = "col align-x-center align-y-center", 
        Size = v6.size, 
        Position = v6.position, 
        AnchorPoint = v6.anchorPoint, 
        LayoutOrder = v6.layoutOrder, 
        Visible = v6.visible, 
        ZIndex = v6.zIndex, 
        backgroundStyle = v6.backgroundStyle, 
        AutomaticSize = v6.automaticSize, 
        testId = v6.testId
    }, {
        Image = v1.createElement(l_Image_0, {
            Image = v6.image, 
            Size = v6.imageSize, 
            TileSize = v6.tileSize, 
            ScaleType = v6.scaleType, 
            ResampleMode = v6.resampleMode, 
            imageStyle = v6.imageStyle, 
            tag = v6.imageTag, 
            SizeConstraint = v6.imageSizeConstraint
        })
    });
end);