local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_1.Parent.t);
local v5 = require(l_Parent_0.Enum.SlidingDirection);
local v6 = require(l_Parent_1.Utility.SpringAnimatedItem);
local v7 = {
    dampingRatio = 1, 
    frequency = 4
};
local v8 = v3.PureComponent:extend("SlidingContainer");
local v9 = {
    [v5.Up] = UDim2.new(0, 0, 1, 0), 
    [v5.Down] = UDim2.new(0, 0, -1, 0), 
    [v5.Left] = UDim2.new(1, 0, 0, 0), 
    [v5.Right] = UDim2.new(-1, 0, 0, 0)
};
v8.validateProps = v4.strictInterface({
    layoutOrder = v4.optional(v4.integer), 
    onComplete = v4.optional(v4.callback), 
    show = v4.optional(v4.boolean), 
    slidingDirection = v5.isEnumValue, 
    springOptions = v4.optional(v4.table), 
    [v3.Children] = v4.optional(v4.table)
});
v8.defaultProps = {
    springOptions = v7
};
v8.render = function(v10) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v6 (copy), v9 (copy)
    local l_show_0 = v10.props.show;
    local l_slidingDirection_0 = v10.props.slidingDirection;
    return v3.createElement(v6.AnimatedFrame, {
        springOptions = v10.props.springOptions, 
        animatedValues = {
            step = l_show_0 and 0 or 1
        }, 
        mapValuesToProps = function(v13) --[[ Line: 54 ]] --[[ Name: mapValuesToProps ]]
            -- upvalues: v9 (ref), l_slidingDirection_0 (copy)
            local v14 = v9[l_slidingDirection_0];
            return {
                Position = UDim2.new(v14.X.Scale * v13.step, 0, v14.Y.Scale * v13.step, 0)
            };
        end, 
        regularProps = {
            BackgroundTransparency = 1, 
            LayoutOrder = v10.props.layoutOrder, 
            Position = l_show_0 and v9[l_slidingDirection_0] or UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        }, 
        onComplete = v10.props.onComplete, 
        [v3.Children] = v10.props[v3.Children]
    });
end;
return v8;