local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_validateImage_0 = v2.Core.ImageSet.Validator.validateImage;
local l_withStyle_0 = v2.Core.Style.withStyle;
local v6 = require(l_Parent_0.t);
local v7 = v1.PureComponent:extend("HoverButtonBackground");
v7.validateProps = v6.strictInterface({
    sidePadding = v6.optional(v6.number), 
    image = v6.optional(l_validateImage_0), 
    sliceCenter = v6.optional(v6.Rect)
});
v7.render = function(v8) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy)
    local v9 = if v8.props.sidePadding then UDim2.new(v8.props.sidePadding, UDim.new()) + UDim2.new(v8.props.sidePadding, UDim.new()) else UDim2.new();
    return l_withStyle_0(function(v10) --[[ Line: 36 ]]
        -- upvalues: v1 (ref), l_ImageSetLabel_0 (ref), v9 (copy), v8 (copy)
        local l_BackgroundOnHover_0 = v10.Theme.BackgroundOnHover;
        return v1.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromScale(1, 1) + v9, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundColor3 = if v8.props.image then nil else l_BackgroundOnHover_0.Color, 
            BackgroundTransparency = v8.props.image and 1 or l_BackgroundOnHover_0.Transparency, 
            Image = v8.props.image, 
            ImageColor3 = l_BackgroundOnHover_0.Color, 
            ImageTransparency = l_BackgroundOnHover_0.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v8.props.sliceCenter
        }, {
            corner = if v8.props.image then nil else v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        });
    end);
end;
return v7;