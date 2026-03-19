local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_0.Parent.t);
local l_Label_0 = require(l_Parent_0.Core.ImageSet.ImageSetComponent).Label;
local v6 = v3.PureComponent:extend("SpinningImage");
v6.validateProps = v4.strictInterface({
    image = v4.table, 
    size = v4.optional(v4.UDim2), 
    anchorPoint = v4.optional(v4.Vector2), 
    position = v4.optional(v4.union(v4.UDim2, v4.table)), 
    rotationRate = v4.optional(v4.number)
});
v6.defaultProps = {
    rotationRate = 360
};
v6.init = function(v7) --[[ Line: 25 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    local v8, v9 = v3.createBinding(0);
    v7.angle = v8;
    v7.updateAngle = v9;
end;
v6.didMount = function(v10) --[[ Line: 29 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy)
    v10.heartbeatConnection = l_RunService_0.Heartbeat:Connect(function(v11) --[[ Line: 30 ]]
        -- upvalues: v10 (copy)
        local v12 = v10.angle:getValue() + v10.props.rotationRate * v11;
        if v12 > 360 then
            v12 = v12 - 360;
        elseif v12 < 0 then
            v12 = v12 + 360;
        end;
        v10.updateAngle(v12);
    end);
end;
v6.willUnmount = function(v13) --[[ Line: 41 ]] --[[ Name: willUnmount ]]
    v13.heartbeatConnection:Disconnect();
end;
v6.getDerivedStateFromProps = function(v14, _) --[[ Line: 45 ]] --[[ Name: getDerivedStateFromProps ]]
    local l_ImageRectSize_0 = v14.image.ImageRectSize;
    return {
        size = v14.size or UDim2.fromOffset(l_ImageRectSize_0.X, l_ImageRectSize_0.Y)
    };
end;
v6.render = function(v17) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_Label_0 (copy)
    return v3.createElement("Frame", {
        Size = v17.state.size, 
        AnchorPoint = v17.props.anchorPoint, 
        Position = v17.props.position, 
        BackgroundTransparency = 1
    }, {
        inner = v3.createElement(l_Label_0, {
            Size = v17.state.size, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Image = v17.props.image, 
            Rotation = v17.angle, 
            BackgroundTransparency = 1
        })
    });
end;
return v6;