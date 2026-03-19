local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v5 = require(l_Parent_2.Cryo);
local v6 = require(l_Parent_2.Otter);
local v7 = require(l_Parent_2.Roact);
local v8 = require(l_Parent_2.t);
local l_Focusable_0 = require(l_Parent_2.RoactGamepad).Focusable;
local v10 = require(l_Parent_2.UIBlox.Core.Style.withStyle);
local v11 = require(l_Parent_0.SelectionCursor.useCursorByType);
local v12 = require(l_Parent_0.SelectionCursor.CursorType);
local v13 = require(l_Parent_1.App.Container.getPageMargin);
local v14 = UDim.new(0, 0);
local v15 = {
    frequency = 3, 
    dampingRatio = 1.5
};
local v16 = v7.Component:extend("VerticalScrollView");
v16.validateProps = v8.strictInterface({
    size = v8.optional(v8.UDim2), 
    position = v8.optional(v8.UDim2), 
    elasticBehavior = v8.optional(v8.EnumItem), 
    canvasSizeY = v8.optional(v8.UDim), 
    useAutomaticCanvasSize = v8.optional(v8.boolean), 
    paddingHorizontal = v8.optional(v8.number), 
    paddingTop = v8.optional(v8.number), 
    isGamepadFocusable = v8.optional(v8.boolean), 
    Selectable = v8.optional(v8.boolean), 
    [v7.Change.CanvasPosition] = v8.optional(v8.callback), 
    [v7.Change.CanvasSize] = v8.optional(v8.callback), 
    scrollingFrameRef = v8.optional(v8.table), 
    onSelectionChanged = v8.optional(v8.callback), 
    CanvasPosition = v8.optional(v8.union(v8.table, v8.Vector2)), 
    ScrollingEnabled = v8.optional(v8.boolean), 
    NextSelectionLeft = v8.optional(v8.table), 
    NextSelectionRight = v8.optional(v8.table), 
    NextSelectionUp = v8.optional(v8.table), 
    NextSelectionDown = v8.optional(v8.table), 
    cursor = v8.table, 
    [v7.Children] = v8.optional(v8.table)
});
v16.defaultProps = {
    size = UDim2.new(1, 0, 1, 0), 
    canvasSizeY = UDim.new(2, 0), 
    useAutomaticCanvasSize = false, 
    isGamepadFocusable = false, 
    Selectable = true
};
v16.init = function(v17) --[[ Line: 92 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v6 (copy), v15 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy), v13 (copy)
    v17:setState({
        scrollBarThickness = 0, 
        scrollingWithTouch = false
    });
    local v18, v19 = v7.createBinding(0);
    v17.scrollBarImageTransparency = v18;
    v17.updateScrollBarImageTransparency = v19;
    v17.scrollBarImageTransparencyMotor = v6.createSingleMotor(0);
    v17.scrollBarImageTransparencyMotor:onStep(v17.updateScrollBarImageTransparency);
    v17.lastTimeCanvasPositionChanged = tick();
    v17.waitToHideSidebarConnection = nil;
    v17.waitToHideSidebar = function() --[[ Line: 105 ]]
        -- upvalues: v17 (copy), v6 (ref), v15 (ref)
        if tick() - v17.lastTimeCanvasPositionChanged > 0.7 then
            v17.scrollBarImageTransparencyMotor:setGoal(v6.spring(1, v15));
            v17.disconnectWaitToHideSidebar();
        end;
    end;
    v17.disconnectWaitToHideSidebar = function() --[[ Line: 113 ]]
        -- upvalues: v17 (copy)
        if v17.waitToHideSidebarConnection then
            v17.waitToHideSidebarConnection:Disconnect();
            v17.waitToHideSidebarConnection = nil;
        end;
    end;
    v17.inputBegan = function(_, v21) --[[ Line: 119 ]]
        -- upvalues: v17 (copy), v6 (ref)
        if v21.UserInputType == Enum.UserInputType.MouseMovement then
            v17.disconnectWaitToHideSidebar();
            v17:setState({
                scrollBarThickness = 8
            });
            v17.scrollBarImageTransparencyMotor:setGoal(v6.instant(0));
        end;
    end;
    v17.inputEnded = function(_, v23) --[[ Line: 128 ]]
        -- upvalues: v17 (copy), v6 (ref)
        if v23.UserInputType == Enum.UserInputType.MouseMovement then
            v17.disconnectWaitToHideSidebar();
            v17.scrollBarImageTransparencyMotor:setGoal(v6.instant(1));
        end;
    end;
    v17.canvasPosition = function(v24) --[[ Line: 134 ]]
        -- upvalues: v17 (copy), l_UserInputService_0 (ref), v6 (ref), l_RunService_0 (ref), v7 (ref)
        v17.lastTimeCanvasPositionChanged = tick();
        if not v17.waitToHideSidebarConnection and l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch then
            v17.scrollBarImageTransparencyMotor:setGoal(v6.instant(0));
            v17:setState({
                scrollBarThickness = 2
            });
            v17.waitToHideSidebarConnection = l_RunService_0.Heartbeat:Connect(v17.waitToHideSidebar);
        end;
        if v17.props[v7.Change.CanvasPosition] then
            v17.props[v7.Change.CanvasPosition](v24);
        end;
    end;
    v17.onGamepadFocused = function() --[[ Line: 149 ]]
        -- upvalues: v17 (copy), v6 (ref)
        v17.scrollBarImageTransparencyMotor:setGoal(v6.instant(0));
        v17:setState({
            scrollBarThickness = 2
        });
    end;
    v17.onGamepadFocusLost = function() --[[ Line: 156 ]]
        -- upvalues: v17 (copy), v6 (ref)
        v17.scrollBarImageTransparencyMotor:setGoal(v6.instant(1));
    end;
    v17.parentFrameRef = v7.createRef();
    v18, v19 = v7.createBinding(0);
    v17.paddingBinding = v18;
    v17.updatePaddingBinding = v19;
    v17.getPadding = function(v25) --[[ Line: 163 ]]
        -- upvalues: v17 (copy), v13 (ref)
        v25 = v25 or 0;
        if v17.props.paddingHorizontal then
            local v26 = math.max(0, v17.props.paddingHorizontal - v25);
            return UDim.new(0, v26);
        else
            return v17.paddingBinding:map(function(v27) --[[ Line: 169 ]]
                -- upvalues: v13 (ref), v25 (ref)
                return UDim.new(0, v13(v27) - v25);
            end);
        end;
    end;
end;
v16.renderWithProviders = function(v28, v29, _, v31) --[[ Line: 176 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v7 (copy), v5 (copy), l_Focusable_0 (copy), v14 (copy)
    local l_Theme_0 = v29.Theme;
    local l_canvasSizeY_0 = v28.props.canvasSizeY;
    local v34 = v28.props[v7.Children] or {};
    local l_position_0 = v28.props.position;
    local l_size_0 = v28.props.size;
    local l_isGamepadFocusable_0 = v28.props.isGamepadFocusable;
    local l_scrollBarThickness_0 = v28.state.scrollBarThickness;
    local v39 = v5.Dictionary.join({
        scrollingFrameInnerMargin = v7.createElement("UIPadding", {
            PaddingTop = if v28.props.paddingTop ~= nil then UDim.new(0, v28.props.paddingTop) else nil, 
            PaddingLeft = v28.getPadding(), 
            PaddingRight = v28.getPadding(4)
        })
    }, v34);
    return v7.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = l_position_0, 
        Size = l_size_0, 
        [v7.Change.AbsoluteSize] = function(v40) --[[ Line: 200 ]]
            -- upvalues: v28 (copy)
            v28.updatePaddingBinding(v40.AbsoluteSize.X);
        end, 
        [v7.Ref] = v28.parentFrameRef
    }, {
        scrollingFrameOuterMargins = v7.createElement("UIPadding", {
            PaddingRight = UDim.new(0, 4)
        }), 
        scrollingFrame = v7.createElement(l_isGamepadFocusable_0 and l_Focusable_0.ScrollingFrame or "ScrollingFrame", {
            Active = true, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            ElasticBehavior = v28.props.elasticBehavior, 
            CanvasSize = UDim2.new(v14, l_canvasSizeY_0), 
            AutomaticCanvasSize = v28.props.useAutomaticCanvasSize and Enum.AutomaticSize.Y or nil, 
            ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
            ScrollBarImageTransparency = v28.scrollBarImageTransparency, 
            ScrollBarThickness = l_scrollBarThickness_0, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollingEnabled = v28.props.ScrollingEnabled, 
            CanvasPosition = v28.props.CanvasPosition, 
            SelectionImageObject = v31, 
            onFocusGained = l_isGamepadFocusable_0 and v28.onGamepadFocused or nil, 
            onFocusLost = l_isGamepadFocusable_0 and v28.onGamepadFocusLost or nil, 
            Selectable = v28.props.Selectable, 
            NextSelectionLeft = v28.props.NextSelectionLeft, 
            NextSelectionRight = v28.props.NextSelectionRight, 
            NextSelectionUp = v28.props.NextSelectionUp, 
            NextSelectionDown = v28.props.NextSelectionDown, 
            [v7.Event.InputBegan] = v28.inputBegan, 
            [v7.Event.InputEnded] = v28.inputEnded, 
            [v7.Change.CanvasPosition] = v28.canvasPosition, 
            [v7.Change.CanvasSize] = v28.props[v7.Change.CanvasSize], 
            [v7.Event.SelectionChanged] = v28.props.onSelectionChanged, 
            [v7.Ref] = v28.props.scrollingFrameRef
        }, v39)
    });
end;
v16.render = function(v41) --[[ Line: 251 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy)
    return v10(function(v42) --[[ Line: 252 ]]
        -- upvalues: v41 (copy)
        return v41:renderWithProviders(v42, nil, v41.props.cursor);
    end);
end;
v16.didMount = function(v43) --[[ Line: 257 ]] --[[ Name: didMount ]]
    local v44 = v43.parentFrameRef:getValue();
    if v44 then
        v43.updatePaddingBinding(v44.AbsoluteSize.X);
    end;
end;
v16.willUnmount = function(v45) --[[ Line: 264 ]] --[[ Name: willUnmount ]]
    v45.disconnectWaitToHideSidebar();
end;
return v7.forwardRef(function(v46, v47) --[[ Line: 268 ]]
    -- upvalues: v11 (copy), v12 (copy), v7 (copy), v16 (copy), v5 (copy)
    local v48 = v11(v12.RoundedRect);
    return v7.createElement(v16, v5.Dictionary.join(v46, {
        scrollingFrameRef = v47, 
        cursor = v48
    }));
end);