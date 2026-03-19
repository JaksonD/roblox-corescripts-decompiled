local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Skeleton_0 = require(l_Parent_2.Foundation).Skeleton;
local v4 = require(l_Parent_0.getClosestRadius);
local v5 = require(l_Parent_2.Roact);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_1.Core.Style.withStyle);
local v8 = v5.PureComponent:extend("ShimmerPanel");
v8.validateProps = v6.strictInterface({
    AnchorPoint = v6.optional(v6.Vector2), 
    LayoutOrder = v6.optional(v6.integer), 
    Position = v6.optional(v6.UDim2), 
    Size = v6.UDim2, 
    cornerRadius = v6.optional(v6.UDim), 
    Image = v6.optional(v6.string), 
    imageDimensions = v6.optional(v6.Vector2), 
    imageScale = v6.optional(v6.number), 
    shimmerSpeed = v6.optional(v6.number)
});
v8.defaultProps = {
    cornerRadius = UDim.new(0, 0), 
    Image = "rbxasset://textures/ui/LuaApp/graphic/shimmer.png", 
    imageDimensions = Vector2.new(219, 250), 
    imageScale = 2.5, 
    shimmerSpeed = 4
};
v8.init = function(v9) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v9.state = {
        lerpValue = 0
    };
    v9.frameRef = v5.createRef();
    v9.lerpValue = 0;
end;
v8.render = function(v10) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v4 (copy), v5 (copy), l_Skeleton_0 (copy)
    local l_AnchorPoint_0 = v10.props.AnchorPoint;
    local l_LayoutOrder_0 = v10.props.LayoutOrder;
    local l_Position_0 = v10.props.Position;
    local l_cornerRadius_0 = v10.props.cornerRadius;
    local l_Size_0 = v10.props.Size;
    return v7(function(v16) --[[ Line: 64 ]]
        -- upvalues: v4 (ref), l_cornerRadius_0 (copy), v5 (ref), l_Skeleton_0 (ref), l_AnchorPoint_0 (copy), l_Position_0 (copy), l_Size_0 (copy), l_LayoutOrder_0 (copy)
        local l_Tokens_0 = v16.Tokens;
        local v18 = v4(l_Tokens_0.Semantic.Radius, l_cornerRadius_0);
        return v5.createElement(l_Skeleton_0, {
            radius = v18, 
            AnchorPoint = l_AnchorPoint_0, 
            Position = l_Position_0, 
            Size = l_Size_0, 
            LayoutOrder = l_LayoutOrder_0
        });
    end);
end;
return v8;