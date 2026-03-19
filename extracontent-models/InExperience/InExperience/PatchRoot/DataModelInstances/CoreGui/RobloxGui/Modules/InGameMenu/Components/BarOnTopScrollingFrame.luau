local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local v4 = l_Roact_0.PureComponent:extend("BarOnTopScrollingFrame");
v4.validateProps = l_t_0.strictInterface({
    Size = l_t_0.UDim2, 
    Position = l_t_0.optional(l_t_0.UDim2), 
    CanvasSize = l_t_0.UDim2, 
    ScrollingEnabled = l_t_0.optional(l_t_0.boolean), 
    [l_Roact_0.Children] = l_t_0.table, 
    onCanvasPositionChanged = l_t_0.optional(l_t_0.callback), 
    scrollingFrameRef = l_t_0.optional(l_t_0.table)
});
v4.defaultProps = {
    ScrollingEnabled = true
};
v4.init = function(v5) --[[ Line: 26 ]] --[[ Name: init ]]
    v5.state = {
        CanvasPosition = Vector2.new(0, 0)
    };
end;
v4.render = function(v6) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy)
    return l_Roact_0.createElement("Frame", {
        Size = v6.props.Size, 
        Position = v6.props.Position, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        DisplayScrollingFrame = l_Roact_0.createElement("ScrollingFrame", {
            CanvasPosition = v6.state.CanvasPosition, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 8, 1, 0), 
            CanvasSize = v6.props.CanvasSize - UDim2.new(0, 8, 0, 0), 
            ScrollBarThickness = 8, 
            BorderSizePixel = 0, 
            ZIndex = 2, 
            Position = UDim2.new(1, -8, 0, 0), 
            ScrollingEnabled = v6.props.ScrollingEnabled, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Selectable = false, 
            [l_Roact_0.Ref] = v6.props.scrollingFrameRef, 
            [l_Roact_0.Change.CanvasPosition] = function(v7) --[[ Line: 52 ]]
                -- upvalues: v6 (copy)
                v6:setState({
                    CanvasPosition = v7.CanvasPosition
                });
                if v6.props.onCanvasPositionChanged then
                    v6.props.onCanvasPositionChanged(v7);
                end;
            end
        }), 
        ContentsScrollingFrame = l_Roact_0.createElement("ScrollingFrame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -8, 1, 0), 
            CanvasSize = v6.props.CanvasSize - UDim2.new(0, 8, 0, 0), 
            CanvasPosition = v6.state.CanvasPosition, 
            ScrollBarThickness = 0, 
            BorderSizePixel = 0, 
            ClipsDescendants = false, 
            ScrollingEnabled = v6.props.ScrollingEnabled, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Selectable = false, 
            [l_Roact_0.Change.CanvasPosition] = function(v8) --[[ Line: 73 ]]
                -- upvalues: v6 (copy)
                v6:setState({
                    CanvasPosition = v8.CanvasPosition
                });
            end
        }, {
            l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 8, 1, 0)
            }, v6.props[l_Roact_0.Children])
        })
    });
end;
return v4;