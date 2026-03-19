local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.ImageSet.ImageSetComponent);
local v5 = require(l_Parent_0.ImageSet.Validator.validateImage);
local v6 = require(l_Parent_0.Style.withStyle);
local v7 = v2.PureComponent:extend("HoverButtonBackground");
v7.validateProps = v3.strictInterface({
    sidePadding = v3.optional(v3.number), 
    image = v3.optional(v5), 
    sliceCenter = v3.optional(v3.Rect)
});
v7.render = function(v8) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v2 (copy), v4 (copy)
    local v9 = if v8.props.sidePadding then UDim2.new(v8.props.sidePadding, UDim.new()) + UDim2.new(v8.props.sidePadding, UDim.new()) else UDim2.new();
    return v6(function(v10) --[[ Line: 37 ]]
        -- upvalues: v2 (ref), v4 (ref), v9 (copy), v8 (copy)
        local l_BackgroundOnHover_0 = v10.Theme.BackgroundOnHover;
        return v2.createElement(v4.Label, {
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
            corner = if v8.props.image then nil else v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        });
    end);
end;
return v7;