local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Otter);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.t);
local v7 = require(l_Parent_0.ArgCheck);
local v8 = require(script.Parent.AppCarousel);
local v9 = require(script.Parent.ScrollButton);
local l_Images_0 = v3.App.ImageSet.Images;
local l_FFlagAXScrollingCarouselWidgetIndexBugfix_0 = require(l_Parent_0.SharedFlags).FFlagAXScrollingCarouselWidgetIndexBugfix;
local v12 = l_Images_0["icons/actions/cycleLeft"];
local v13 = l_Images_0["icons/actions/cycleRight"];
local v14 = {
    frequency = 2, 
    dampingRatio = 0.9, 
    restingPositionLimit = 0.5, 
    restingVelocityLimit = 0.1
};
local v15 = v2.PureComponent:extend("ScrollingAppCarousel");
v15.defaultProps = {
    carouselMargin = 0
};
v15.validateProps = v6.strictInterface({
    items = v6.table, 
    index = v6.numberMin(1), 
    itemCount = v6.number, 
    itemWidth = v6.numberMin(1), 
    itemPadding = v6.number, 
    carouselMargin = v6.number, 
    carouselHeight = v6.number, 
    canvasWidth = v6.number, 
    styleProps = v6.optional(v6.table), 
    isScrollingDisabled = v6.optional(v6.boolean), 
    onChangeCanvasPosition = v6.callback, 
    onRefCallback = v6.optional(v6.callback), 
    shouldExpandToFitContentHeight = v6.optional(v6.boolean)
});
v15.getScrollState = function(v16, v17, v18) --[[ Line: 77 ]] --[[ Name: getScrollState ]]
    local v19 = v16 + v17;
    return {
        maxNumOfItemsVisible = math.floor((v18 + v17) / v19)
    };
end;
v15.handleMouseEvent = function(v20, v21, v22) --[[ Line: 86 ]] --[[ Name: handleMouseEvent ]]
    if v21.UserInputType == Enum.UserInputType.MouseMovement then
        v20:setState({
            hoveringCarousel = v22
        });
    end;
end;
v15.handleScroll = function(v23, v24) --[[ Line: 94 ]] --[[ Name: handleScroll ]]
    if v23.state.animationActive then
        return;
    else
        local l_index_0 = v23.props.index;
        local l_maxNumOfItemsVisible_0 = v23.state.maxNumOfItemsVisible;
        v23:scrollToIndex(l_index_0, l_index_0 + (v24 and l_maxNumOfItemsVisible_0 or -l_maxNumOfItemsVisible_0));
        return;
    end;
end;
v15.handleResize = function(v27, v28) --[[ Line: 105 ]] --[[ Name: handleResize ]]
    -- upvalues: v5 (copy)
    if v27._isMounted then
        local l_carouselMargin_0 = v27.props.carouselMargin;
        local v30 = v28.AbsoluteSize.X - 2 * l_carouselMargin_0;
        v27:setState(v5.Dictionary.join({
            absoluteWidth = v28.AbsoluteSize.X, 
            carouselWidth = v30
        }, v27.getScrollState(v27.props.itemWidth, v27.props.itemPadding, v30)));
    end;
end;
v15.scrollToIndex = function(v31, v32, v33) --[[ Line: 116 ]] --[[ Name: scrollToIndex ]]
    -- upvalues: v7 (copy), l_UserGameSettings_0 (copy), v4 (copy), v14 (copy)
    v7.assert(not v31.props.isScrollingDisabled, "scrolling should be disabled");
    local l_itemCount_0 = v31.props.itemCount;
    local v35 = v31.props.itemWidth + v31.props.itemPadding;
    v33 = math.max(math.min(v33, l_itemCount_0 - v31.state.maxNumOfItemsVisible + 1), 1);
    local v36 = (v32 - 1) * v35;
    local v37 = (v33 - 1) * v35;
    v31:destroyMotor();
    v31:createMotor(v36);
    if l_UserGameSettings_0.ReducedMotion then
        v31.carouselMotor:setGoal(v4.instant(v37));
        return;
    else
        v31.carouselMotor:setGoal(v4.spring(v37, v14));
        return;
    end;
end;
v15.createMotor = function(v38, v39) --[[ Line: 138 ]] --[[ Name: createMotor ]]
    -- upvalues: v4 (copy)
    v38.carouselMotor = v4.createSingleMotor(v39);
    v38.carouselMotor:onStep(function(v40) --[[ Line: 140 ]]
        -- upvalues: v38 (copy)
        v38:setState({
            animationActive = true, 
            canvasPosition = Vector2.new(v40, 0)
        });
    end);
    v38.carouselMotor:onComplete(function() --[[ Line: 146 ]]
        -- upvalues: v38 (copy)
        v38:destroyMotor();
        v38:setState({
            animationActive = false
        });
    end);
end;
v15.destroyMotor = function(v41) --[[ Line: 154 ]] --[[ Name: destroyMotor ]]
    if v41.carouselMotor then
        v41.carouselMotor:destroy();
        v41.carouselMotor = nil;
    end;
end;
v15.init = function(v42) --[[ Line: 161 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v42:setState({
        carouselWidth = 0, 
        hoveringCarousel = false, 
        animationActive = false, 
        canvasPosition = Vector2.new(0, 0), 
        maxNumOfItemsVisible = 0, 
        absoluteWidth = 0
    });
    v42.carouselMotor = nil;
    v42.onMouseEnter = function(_, v44) --[[ Line: 173 ]]
        -- upvalues: v42 (copy)
        if v42._isMounted then
            v42:handleMouseEvent(v44, true);
        end;
    end;
    v42.onMouseLeave = function(_, v46) --[[ Line: 179 ]]
        -- upvalues: v42 (copy)
        if v42._isMounted then
            v42:handleMouseEvent(v46, false);
        end;
    end;
    v42.frameRef = v2.createRef();
    v42.onResize = function(v47) --[[ Line: 187 ]]
        -- upvalues: v42 (copy)
        if v42._isMounted then
            v42:handleResize(v47);
            if v42.props.onResize then
                v42.props.onResize(v47);
            end;
        end;
    end;
    v42.scrollLeft = function() --[[ Line: 196 ]]
        -- upvalues: v42 (copy)
        if v42._isMounted then
            v42:handleScroll(false);
        end;
    end;
    v42.scrollRight = function() --[[ Line: 202 ]]
        -- upvalues: v42 (copy)
        if v42._isMounted then
            v42:handleScroll(true);
        end;
    end;
end;
v15.getDerivedStateFromProps = function(v48, v49) --[[ Line: 209 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v5 (copy), v15 (copy)
    local v50 = math.max(0, v49.absoluteWidth - 2 * v48.carouselMargin);
    return v5.Dictionary.join({
        carouselWidth = v50
    }, v15.getScrollState(v48.itemWidth, v48.itemPadding, v50));
end;
v15.didMount = function(v51) --[[ Line: 216 ]] --[[ Name: didMount ]]
    v51._isMounted = true;
    v51:handleResize((v51.frameRef:getValue()));
end;
v15.didUpdate = function(v52, v53, v54) --[[ Line: 222 ]] --[[ Name: didUpdate ]]
    local v55 = v52.props.itemCount < v53.itemCount;
    local v56 = v52.props.itemWidth ~= v53.itemWidth;
    local v57 = v52.props.itemPadding ~= v53.itemPadding;
    local v58 = v52.state.maxNumOfItemsVisible ~= v54.maxNumOfItemsVisible;
    if not v52.props.isScrollingDisabled and (v55 or v56 or v57 or v58) then
        v52:scrollToIndex(v52.props.index, v53.index);
    end;
end;
v15.willUnmount = function(v59) --[[ Line: 234 ]] --[[ Name: willUnmount ]]
    v59._isMounted = false;
    v59:destroyMotor();
end;
v15.render = function(v60) --[[ Line: 239 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAXScrollingCarouselWidgetIndexBugfix_0 (copy), v2 (copy), v9 (copy), v12 (copy), v13 (copy), v8 (copy)
    local l_carouselMargin_1 = v60.props.carouselMargin;
    local l_carouselHeight_0 = v60.props.carouselHeight;
    local v63 = nil;
    local v64 = nil;
    if v60.state.hoveringCarousel then
        local l_isScrollingDisabled_0 = v60.props.isScrollingDisabled;
        local v66 = false;
        if v60.props.index > 1 then
            v66 = not l_isScrollingDisabled_0;
        end;
        local v67 = if l_FFlagAXScrollingCarouselWidgetIndexBugfix_0 then v60.props.index + v60.state.maxNumOfItemsVisible < v60.props.itemCount else v60.props.index + v60.state.maxNumOfItemsVisible <= v60.props.itemCount and not l_isScrollingDisabled_0;
        if v66 then
            v63 = v2.createElement(v9, {
                icon = v12, 
                callback = v60.scrollLeft
            });
        end;
        if v67 then
            v64 = v2.createElement(v9, {
                icon = v13, 
                callback = v60.scrollRight
            });
        end;
    end;
    local v68 = if v60.props.styleProps and v60.props.styleProps.leftPosition then UDim2.new(0, v60.props.styleProps.leftPosition, 0, 0) else UDim2.fromScale(0, 0);
    local v69 = if v60.props.styleProps and v60.props.styleProps.rightPosition then UDim2.new(1, v60.props.styleProps.rightPosition, 0, 0) else UDim2.fromScale(1, 0);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, l_carouselMargin_1, 0, l_carouselHeight_0), 
        AutomaticSize = if v60.props.shouldExpandToFitContentHeight then Enum.AutomaticSize.Y else nil, 
        Position = UDim2.fromOffset(-l_carouselMargin_1, 0), 
        BackgroundTransparency = 1, 
        [v2.Event.InputBegan] = v60.onMouseEnter, 
        [v2.Event.InputEnded] = v60.onMouseLeave, 
        [v2.Change.AbsoluteSize] = v60.onResize, 
        [v2.Ref] = v60.frameRef
    }, {
        LeftMargin = v2.createElement("Frame", {
            Position = v68, 
            AnchorPoint = Vector2.new(0, 0), 
            Size = UDim2.new(0, l_carouselMargin_1, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            ScrollLeftButton = v63
        }), 
        Carousel = v2.createElement("Frame", {
            Size = UDim2.new(1, -2 * l_carouselMargin_1, 1, 0), 
            AutomaticSize = if v60.props.shouldExpandToFitContentHeight then Enum.AutomaticSize.Y else nil, 
            Position = UDim2.fromOffset(l_carouselMargin_1, 0), 
            BackgroundTransparency = 1
        }, {
            InnerCarouselContent = v2.createElement(v8, {
                carouselHeight = l_carouselHeight_0, 
                canvasWidth = v60.props.canvasWidth, 
                items = v60.props.items, 
                onChangeCanvasPosition = v60.props.onChangeCanvasPosition, 
                onRefCallback = v60.props.onRefCallback, 
                canvasPosition = v60.state.canvasPosition, 
                scrollingAnimationActive = v60.props.isScrollingDisabled and true or v60.state.animationActive, 
                shouldExpandToFitContentHeight = v60.props.shouldExpandToFitContentHeight
            })
        }), 
        RightMargin = v2.createElement("Frame", {
            Position = v69, 
            AnchorPoint = Vector2.new(1, 0), 
            Size = UDim2.new(0, l_carouselMargin_1, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            ScrollRightButton = v64
        })
    });
end;
return v15;