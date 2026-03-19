local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = v1.PureComponent:extend("AppCarousel");
v2.render = function(v3) --[[ Line: 9 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_carouselHeight_0 = v3.props.carouselHeight;
    local l_canvasWidth_0 = v3.props.canvasWidth;
    local l_items_0 = v3.props.items;
    local l_onChangeCanvasPosition_0 = v3.props.onChangeCanvasPosition;
    local l_onRefCallback_0 = v3.props.onRefCallback;
    local l_canvasPosition_0 = v3.props.canvasPosition;
    local v10 = not v3.props.scrollingAnimationActive;
    local l_shouldExpandToFitContentHeight_0 = v3.props.shouldExpandToFitContentHeight;
    return v1.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 0, l_carouselHeight_0), 
        AutomaticSize = if l_shouldExpandToFitContentHeight_0 then Enum.AutomaticSize.Y else nil, 
        ScrollBarThickness = 0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        CanvasSize = UDim2.new(0, l_canvasWidth_0, 0, l_carouselHeight_0), 
        AutomaticCanvasSize = if l_shouldExpandToFitContentHeight_0 then Enum.AutomaticSize.Y else nil, 
        CanvasPosition = l_canvasPosition_0, 
        ScrollingEnabled = v10, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        Selectable = false, 
        [v1.Change.CanvasPosition] = l_onChangeCanvasPosition_0, 
        [v1.Ref] = l_onRefCallback_0
    }, l_items_0);
end;
return v2;