local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local v5 = require(l_Parent_2.Cryo);
local v6 = require(l_Parent_2.Otter);
local v7 = require(l_Parent_2.Roact);
local v8 = require(l_Parent_2.t);
local l_Focusable_0 = require(l_Parent_2.RoactGamepad).Focusable;
local v10 = require(l_Parent_2.UIBlox.Core.Style.withStyle);
local v11 = require(l_Parent_1.SelectionCursor.useCursorByType);
local v12 = require(l_Parent_1.SelectionCursor.CursorType);
local v13 = require(l_Parent_2.UIBlox.App.ImageSet.Images);
local v14 = require(l_Parent_0.Enum.ScrollBarType);
local v15 = require(script.Parent.ScrollBar);
local v16 = {
    frequency = 3, 
    dampingRatio = 1.5
};
local v17 = v7.Component:extend("VerticalScrollView");
v17.validateProps = v8.strictInterface({
    size = v8.optional(v8.UDim2), 
    position = v8.optional(v8.UDim2), 
    layoutOrder = v8.optional(v8.number), 
    elasticBehavior = v8.optional(v8.EnumItem), 
    canvasSizeY = v8.optional(v8.UDim), 
    automaticSize = v8.optional(v8.enum(Enum.AutomaticSize)), 
    useAutomaticCanvasSize = v8.optional(v8.boolean), 
    isGamepadFocusable = v8.optional(v8.boolean), 
    scrollingEnabled = v8.optional(v8.boolean), 
    selectable = v8.optional(v8.boolean), 
    [v7.Change.CanvasPosition] = v8.optional(v8.callback), 
    [v7.Change.CanvasSize] = v8.optional(v8.callback), 
    scrollingFrameRef = v8.optional(v8.table), 
    NextSelectionLeft = v8.optional(v8.table), 
    NextSelectionRight = v8.optional(v8.table), 
    NextSelectionUp = v8.optional(v8.table), 
    NextSelectionDown = v8.optional(v8.table), 
    [v7.Children] = v8.optional(v8.table), 
    scrollBarType = v8.optional(v8.string), 
    cursor = v8.table
});
v17.defaultProps = {
    size = UDim2.new(1, 0, 1, 0), 
    canvasSizeY = UDim.new(2, 0), 
    automaticSize = Enum.AutomaticSize.None, 
    useAutomaticCanvasSize = false, 
    isGamepadFocusable = false, 
    selectable = nil, 
    scrollingEnabled = true, 
    scrollBarType = v14.Compact
};
v17.init = function(v18) --[[ Line: 90 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v6 (copy), v16 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy)
    v18.parentFrameRef = v7.createRef();
    v18.mainCanvasRef = v7.createRef();
    local v19, v20 = v7.createBinding(0);
    v18.scrollPosition = v19;
    v18.updateScroll = v20;
    v19, v20 = v7.createBinding(Vector2.new(0, 0));
    v18.mainCanvasSize = v19;
    v18.updateCanvasSize = v20;
    v18:setState({
        scrollingWithTouch = false
    });
    v19, v20 = v7.createBinding(1);
    v18.scrollBarImageTransparency = v19;
    v18.updateScrollBarImageTransparency = v20;
    v18.scrollBarImageTransparencyMotor = v6.createSingleMotor(0);
    v18.scrollBarImageTransparencyMotor:onStep(v18.updateScrollBarImageTransparency);
    v18.lastTimeCanvasPositionChanged = tick();
    v18.waitToHideSidebarConnection = nil;
    v18.waitToHideSidebar = function() --[[ Line: 108 ]]
        -- upvalues: v18 (copy), v6 (ref), v16 (ref)
        if tick() - v18.lastTimeCanvasPositionChanged > 0.7 then
            v18.scrollBarImageTransparencyMotor:setGoal(v6.spring(1, v16));
            v18.disconnectWaitToHideSidebar();
        end;
    end;
    v18.disconnectWaitToHideSidebar = function() --[[ Line: 116 ]]
        -- upvalues: v18 (copy)
        if v18.waitToHideSidebarConnection then
            v18.waitToHideSidebarConnection:Disconnect();
            v18.waitToHideSidebarConnection = nil;
        end;
    end;
    v18.inputBegan = function(_, v22) --[[ Line: 122 ]]
        -- upvalues: v18 (copy), v6 (ref)
        if not v18.props.scrollingEnabled then
            return;
        else
            if v22.UserInputType == Enum.UserInputType.MouseMovement then
                v18.disconnectWaitToHideSidebar();
                v18.scrollBarImageTransparencyMotor:setGoal(v6.instant(0));
            end;
            return;
        end;
    end;
    v18.inputEnded = function(_, v24) --[[ Line: 132 ]]
        -- upvalues: v18 (copy), v6 (ref)
        if not v18.props.scrollingEnabled then
            return;
        else
            if v24.UserInputType == Enum.UserInputType.MouseMovement then
                v18.disconnectWaitToHideSidebar();
                v18.scrollBarImageTransparencyMotor:setGoal(v6.instant(1));
            end;
            return;
        end;
    end;
    v18.canvasPosition = function(v25) --[[ Line: 142 ]]
        -- upvalues: v18 (copy), l_UserInputService_0 (ref), v6 (ref), l_RunService_0 (ref), v7 (ref)
        v18.lastTimeCanvasPositionChanged = tick();
        if not v18.waitToHideSidebarConnection and l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch then
            v18.scrollBarImageTransparencyMotor:setGoal(v6.instant(0));
            v18.waitToHideSidebarConnection = l_RunService_0.Heartbeat:Connect(v18.waitToHideSidebar);
        end;
        v18.updateScroll(v25.CanvasPosition.Y);
        if v18.props[v7.Change.CanvasPosition] then
            v18.props[v7.Change.CanvasPosition](v25);
        end;
    end;
    v18.onGamepadFocused = function() --[[ Line: 156 ]]
        -- upvalues: v18 (copy), v6 (ref)
        v18.scrollBarImageTransparencyMotor:setGoal(v6.instant(0));
    end;
    v18.onGamepadFocusLost = function() --[[ Line: 160 ]]
        -- upvalues: v18 (copy), v6 (ref)
        v18.scrollBarImageTransparencyMotor:setGoal(v6.instant(1));
    end;
    v18.getMainCanvasPosition = function() --[[ Line: 164 ]]
        -- upvalues: v18 (copy)
        return v18.scrollPosition:map(function(v26) --[[ Line: 165 ]]
            return Vector2.new(0, v26);
        end);
    end;
    v18.onMainCanvasSizeChange = function(v27) --[[ Line: 170 ]]
        -- upvalues: v18 (copy)
        v18.updateCanvasSize(v27.AbsoluteCanvasSize);
    end;
    v18.getMainCanvasSize = function() --[[ Line: 174 ]]
        -- upvalues: v18 (copy)
        return v18.mainCanvasSize:map(function(v28) --[[ Line: 175 ]]
            return UDim2.new(0, 2, 0, v28.Y);
        end);
    end;
    v19, v20 = v7.createBinding(Vector2.new(0, 0));
    v18.viewSize = v19;
    v18.updateViewSize = v20;
    v19, v20 = v7.createBinding(Vector2.new(0, 0));
    v18.mainCanvasPosition = v19;
    v18.updateMainCanvasPosition = v20;
    v18.onScrollBarDragging = function(v29) --[[ Line: 183 ]]
        -- upvalues: v18 (copy)
        v18.updateMainCanvasPosition(Vector2.new(0, v29));
    end;
    v18.onViewSizeChange = function(v30) --[[ Line: 187 ]]
        -- upvalues: v18 (copy)
        v18.updateViewSize(v30.AbsoluteSize);
    end;
    v18.onSelectionChanged = function(v31, v32, _, v34) --[[ Line: 191 ]]
        -- upvalues: v18 (copy)
        if not v32 and v34 == nil then
            v18.onGamepadFocusLost();
            return;
        elseif v32 or v34:IsDescendantOf(v31) then
            v18.onGamepadFocused();
            return;
        else
            v18.onGamepadFocusLost();
            return;
        end;
    end;
end;
v17.getScrollBarStyleProps = function(_, v36, v37) --[[ Line: 205 ]] --[[ Name: getScrollBarStyleProps ]]
    -- upvalues: v14 (copy), v13 (copy)
    local l_Tokens_0 = v36.Tokens;
    if v37 == v14.Wide then
        return {
            userInteractionEnabled = true, 
            width = l_Tokens_0.Global.Size_200, 
            handleWidth = l_Tokens_0.Global.Size_100, 
            paddingStartEnd = l_Tokens_0.Global.Space_50, 
            marginRight = 0
        };
    elseif v37 == v14.Gamepad then
        return {
            userInteractionEnabled = false, 
            width = l_Tokens_0.Global.Space_200, 
            handleWidth = l_Tokens_0.Global.Space_100, 
            handleIcon = v13["icons/controls/keys/xboxRSVertical"], 
            handleIconSize = l_Tokens_0.Semantic.Icon.Size.Medium, 
            handleIconColor = {
                Color = l_Tokens_0.Semantic.Color.Icon.Emphasis.Color3, 
                Transparency = l_Tokens_0.Semantic.Color.Icon.Emphasis.Transparency
            }, 
            paddingStartEnd = l_Tokens_0.Global.Space_300, 
            marginRight = l_Tokens_0.Global.Space_300
        };
    else
        return {
            userInteractionEnabled = false, 
            width = l_Tokens_0.Global.Space_150, 
            handleWidth = l_Tokens_0.Global.Size_25, 
            paddingStartEnd = l_Tokens_0.Global.Space_50, 
            marginRight = 0
        };
    end;
end;
v17.renderScrollBar = function(v39, v40) --[[ Line: 242 ]] --[[ Name: renderScrollBar ]]
    -- upvalues: v7 (copy), v15 (copy)
    local l_Tokens_1 = v40.Tokens;
    local v42 = v39:getScrollBarStyleProps(v40, v39.props.scrollBarType);
    return v7.createElement(v15, {
        userInteractionEnabled = v42.userInteractionEnabled, 
        width = v42.width, 
        anchorPoint = Vector2.new(1, 0), 
        position = UDim2.new(1, -v42.marginRight, 0, 0), 
        zIndex = 2, 
        transparency = v39.scrollBarImageTransparency, 
        backgroundColor = v42.backgroundColor, 
        paddingStartEnd = v42.paddingStartEnd, 
        handleWidth = v42.handleWidth, 
        handleColor = {
            Color = l_Tokens_1.Semantic.Color.Ui.Emphasis.Color3, 
            Transparency = l_Tokens_1.Semantic.Color.Ui.Emphasis.Transparency
        }, 
        handleCornerRadius = l_Tokens_1.Semantic.Radius.Circle, 
        handleIcon = v42.handleIcon, 
        handleIconColor = v42.handleIconColor, 
        handleIconSize = v42.handleIconSize, 
        onDragging = v39.onScrollBarDragging, 
        viewSize = v39.viewSize, 
        canvasSize = v39.mainCanvasSize, 
        canvasPosition = v39.getMainCanvasPosition()
    });
end;
v17.renderWithProviders = function(v43, v44, _, v46) --[[ Line: 274 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v7 (copy), l_Focusable_0 (copy)
    local l_position_0 = v43.props.position;
    local l_size_0 = v43.props.size;
    local l_layoutOrder_0 = v43.props.layoutOrder;
    local l_canvasSizeY_0 = v43.props.canvasSizeY;
    local l_automaticSize_0 = v43.props.automaticSize;
    local v52 = v43.props.useAutomaticCanvasSize and Enum.AutomaticSize.Y or nil;
    local l_isGamepadFocusable_0 = v43.props.isGamepadFocusable;
    local l_scrollingEnabled_0 = v43.props.scrollingEnabled;
    return v7.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = l_position_0, 
        Size = l_size_0, 
        AutomaticSize = l_automaticSize_0, 
        LayoutOrder = l_layoutOrder_0, 
        ClipsDescendants = true, 
        [v7.Ref] = v43.parentFrameRef
    }, {
        MainCanvas = v7.createElement(l_isGamepadFocusable_0 and l_Focusable_0.ScrollingFrame or "ScrollingFrame", {
            Active = false, 
            AutomaticSize = l_automaticSize_0, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            ElasticBehavior = v43.props.elasticBehavior, 
            CanvasSize = UDim2.new(UDim.new(1, 0), l_canvasSizeY_0), 
            AutomaticCanvasSize = v52, 
            CanvasPosition = v43.mainCanvasPosition, 
            ScrollingEnabled = l_scrollingEnabled_0, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollBarImageTransparency = 1, 
            ScrollBarThickness = 0, 
            Selectable = v43.props.selectable, 
            SelectionImageObject = v46, 
            onFocusGained = l_isGamepadFocusable_0 and v43.onGamepadFocused or nil, 
            onFocusLost = l_isGamepadFocusable_0 and v43.onGamepadFocusLost or nil, 
            NextSelectionLeft = v43.props.NextSelectionLeft, 
            NextSelectionRight = v43.props.NextSelectionRight, 
            NextSelectionUp = v43.props.NextSelectionUp, 
            NextSelectionDown = v43.props.NextSelectionDown, 
            [v7.Event.InputBegan] = v43.inputBegan, 
            [v7.Event.InputEnded] = v43.inputEnded, 
            [v7.Change.CanvasPosition] = v43.canvasPosition, 
            [v7.Change.AbsoluteCanvasSize] = v43.onMainCanvasSizeChange, 
            [v7.Change.CanvasSize] = v43.props[v7.Change.CanvasSize], 
            [v7.Ref] = v43.props.scrollingFrameRef, 
            [v7.Change.AbsoluteSize] = v43.onViewSizeChange, 
            [v7.Event.SelectionChanged] = if l_isGamepadFocusable_0 then v43.onSelectionChanged else nil
        }, v43.props[v7.Children]), 
        ScrollBar = v43:renderScrollBar(v44)
    });
end;
v17.render = function(v55) --[[ Line: 345 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy)
    return v10(function(v56) --[[ Line: 346 ]]
        -- upvalues: v55 (copy)
        return v55:renderWithProviders(v56, nil, v55.props.cursor);
    end);
end;
v17.willUnmount = function(v57) --[[ Line: 351 ]] --[[ Name: willUnmount ]]
    v57.disconnectWaitToHideSidebar();
end;
return v7.forwardRef(function(v58, v59) --[[ Line: 355 ]]
    -- upvalues: v11 (copy), v12 (copy), v7 (copy), v17 (copy), v5 (copy)
    local v60 = v11(v12.RoundedRect);
    return v7.createElement(v17, v5.Dictionary.join(v58, {
        scrollingFrameRef = v59, 
        cursor = v60
    }));
end);