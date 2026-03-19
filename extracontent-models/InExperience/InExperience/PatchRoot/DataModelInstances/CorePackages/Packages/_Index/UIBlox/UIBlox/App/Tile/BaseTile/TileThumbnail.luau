local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Style.withStyle);
local v6 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v7 = require(l_Parent_1.App.Loading.LoadableImage);
local v8 = require(l_Parent_0.TileSelectionOverlay);
local v9 = require(l_Parent_0.TileUnselectedOverlay);
local v10 = v3.PureComponent:extend("TileThumbnail");
v10.validateProps = v4.strictInterface({
    hasRoundedCorners = v4.optional(v4.boolean), 
    cornerRadius = v4.optional(v4.UDim), 
    Image = v4.optional(v4.union(v4.string, v4.table)), 
    imageSize = v4.optional(v4.UDim2), 
    imageColor = v4.optional(v4.Color3), 
    imageTransparency = v4.optional(v4.number), 
    isSelected = v4.optional(v4.boolean), 
    multiSelect = v4.optional(v4.boolean), 
    overlayComponents = v4.optional(v4.table), 
    backgroundImage = v4.optional(v4.union(v4.string, v4.table)), 
    scaleType = v4.optional(v4.enum(Enum.ScaleType)), 
    onThumbnailLoaded = v4.optional(v4.callback)
});
v10.defaultProps = {
    imageSize = UDim2.fromScale(1, 1), 
    imageTransparency = 0, 
    cornerRadius = UDim.new(0, 10), 
    scaleType = Enum.ScaleType.Stretch
};
v10.render = function(v11) --[[ Line: 62 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v3 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    local l_hasRoundedCorners_0 = v11.props.hasRoundedCorners;
    local l_Image_0 = v11.props.Image;
    local l_imageSize_0 = v11.props.imageSize;
    local l_imageColor_0 = v11.props.imageColor;
    local l_imageTransparency_0 = v11.props.imageTransparency;
    local l_isSelected_0 = v11.props.isSelected;
    local l_multiSelect_0 = v11.props.multiSelect;
    local l_overlayComponents_0 = v11.props.overlayComponents;
    local l_backgroundImage_0 = v11.props.backgroundImage;
    local l_cornerRadius_0 = v11.props.cornerRadius;
    local l_scaleType_0 = v11.props.scaleType;
    local v23 = typeof(l_Image_0) == "table";
    return v5(function(v24) --[[ Line: 77 ]]
        -- upvalues: v3 (ref), v6 (ref), l_backgroundImage_0 (copy), v23 (copy), l_Image_0 (copy), l_imageColor_0 (copy), l_imageTransparency_0 (copy), l_imageSize_0 (copy), l_scaleType_0 (copy), l_hasRoundedCorners_0 (copy), l_cornerRadius_0 (copy), v7 (ref), v11 (copy), l_overlayComponents_0 (copy), l_isSelected_0 (copy), v8 (ref), l_multiSelect_0 (copy), v9 (ref)
        local l_Theme_0 = v24.Theme;
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, {
            ImageContainer = v3.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
                BackgroundTransparency = l_Theme_0.PlaceHolder.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 0
            }, {
                BackgroundImage = v3.createElement(v6.Label, {
                    Image = l_backgroundImage_0, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = 0
                }, {
                    ImageSetImage = v23 and v3.createElement(v6.Label, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        Image = l_Image_0, 
                        ImageColor3 = l_imageColor_0 or l_Theme_0.UIEmphasis.Color, 
                        ImageTransparency = l_imageTransparency_0, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Size = l_imageSize_0, 
                        ScaleType = l_scaleType_0
                    }, {
                        UICorner = l_hasRoundedCorners_0 and v3.createElement("UICorner", {
                            CornerRadius = l_cornerRadius_0
                        }) or nil
                    }) or v3.createElement(v7, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
                        BackgroundTransparency = 1, 
                        Image = l_Image_0, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Size = l_imageSize_0, 
                        cornerRadius = l_hasRoundedCorners_0 and l_cornerRadius_0 or nil, 
                        showFailedStateWhenLoadingFailed = true, 
                        useShimmerAnimationWhileLoading = true, 
                        ScaleType = l_scaleType_0, 
                        onLoaded = v11.props.onThumbnailLoaded
                    }), 
                    UICorner = l_hasRoundedCorners_0 and v3.createElement("UICorner", {
                        CornerRadius = l_cornerRadius_0
                    }) or nil
                }), 
                UICorner = l_hasRoundedCorners_0 and v3.createElement("UICorner", {
                    CornerRadius = l_cornerRadius_0
                }) or nil
            }), 
            ComponentsFrame = l_overlayComponents_0 and v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = 1
            }, l_overlayComponents_0), 
            SelectionOverlay = l_isSelected_0 and v3.createElement(v8, {
                ZIndex = 2, 
                cornerRadius = l_hasRoundedCorners_0 and l_cornerRadius_0 or nil
            }), 
            UnselectedOverlay = l_multiSelect_0 and not l_isSelected_0 and v3.createElement(v9, {
                ZIndex = 2
            })
        });
    end);
end;
return v10;