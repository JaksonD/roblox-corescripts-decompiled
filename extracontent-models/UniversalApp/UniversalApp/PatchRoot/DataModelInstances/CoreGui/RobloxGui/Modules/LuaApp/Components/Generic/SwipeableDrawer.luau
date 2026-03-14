local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_Modules_0.LuaApp.FitChildren);
local v4 = v2.PureComponent:extend("SwipeableDrawer");
v4.init = function(v5) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v5.frameRef = nil;
    v5.onFrameRef = function(v6) --[[ Line: 30 ]]
        -- upvalues: v5 (copy)
        if v6 then
            local l_startPosition_0 = v5.props.startPosition;
            v5.frameRef = v6;
            v5.frameRef.Position = UDim2.new(0, 0, 0, l_startPosition_0);
        end;
    end;
    v5.scrollingFrameRef = v2.createRef();
    v5.recalculateDrawerPosition = function() --[[ Line: 41 ]]
        -- upvalues: v5 (copy)
        if v5.frameRef and v5.scrollingFrameRef.current then
            local l_startPosition_1 = v5.props.startPosition;
            local l_Offset_0 = v5.scrollingFrameRef.current.CanvasSize.Y.Offset;
            local v10 = math.max(0, v5.props.containerHeight - l_Offset_0);
            local l_Offset_1 = v5.frameRef.Position.Y.Offset;
            local l_Y_0 = v5.scrollingFrameRef.current.CanvasPosition.Y;
            if l_Offset_1 == v10 and l_Y_0 > 0 or l_Offset_1 == l_startPosition_1 and l_Y_0 < 0 then
                return;
            else
                local v13 = math.min(math.max(l_Offset_1 - l_Y_0, v10), l_startPosition_1);
                v5.frameRef.Position = UDim2.new(0, 0, 0, v13);
                v5.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, 0);
            end;
        end;
    end;
end;
v4.render = function(v14) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l_Size_0 = v14.props.Size;
    local l_AnchorPoint_0 = v14.props.AnchorPoint;
    local v17 = v14.props[v2.Children];
    return v2.createElement("Frame", {
        Size = l_Size_0, 
        AnchorPoint = l_AnchorPoint_0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        [v2.Ref] = v14.onFrameRef
    }, {
        ScrollingFrame = v2.createElement(v3.FitScrollingFrame, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ScrollBarThickness = 0, 
            ClipsDescendants = false, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            fitFields = {
                CanvasSize = v3.FitAxis.Height
            }, 
            [v2.Ref] = v14.scrollingFrameRef, 
            [v2.Change.CanvasSize] = v14.recalculateDrawerPosition, 
            [v2.Change.CanvasPosition] = v14.recalculateDrawerPosition
        }, v17)
    });
end;
v4.didUpdate = function(v18, v19) --[[ Line: 99 ]] --[[ Name: didUpdate ]]
    if v19.startPosition ~= v18.props.startPosition or v19.containerHeight ~= v18.props.containerHeight then
        v18.recalculateDrawerPosition();
    end;
end;
return v4;