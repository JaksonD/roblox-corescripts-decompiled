local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local v6 = require(l_Parent_1.ImageSet.Images);
local v7 = require(l_Parent_0.ScrollButton);
local v8 = require(l_Parent_2.Utility.isCallable);
local l_BidirectionalFlatList_0 = require(l_Parent_3.VirtualizedList).BidirectionalFlatList;
local v10 = require(l_Parent_3.Promise);
local v11 = require(l_Parent_3.LuauPolyfill);
local v12 = v6["icons/actions/cycleLeft"];
local v13 = v6["icons/actions/cycleRight"];
local v14 = v4.PureComponent:extend("HorizontalCarousel");
v14.validateProps = v5.strictInterface({
    itemList = v5.array(v5.any), 
    renderItem = v5.callback, 
    identifier = v5.optional(v5.callback), 
    itemSize = v5.optional(v5.Vector2), 
    itemPadding = v5.optional(v5.number), 
    carouselMargin = v5.optional(v5.number), 
    layoutOrder = v5.optional(v5.integer), 
    loadNext = v5.optional(v5.callback), 
    loadPrevious = v5.optional(v5.callback), 
    animateScrolling = v5.optional(v5.boolean), 
    maxNumOfItemsVisible = v5.optional(v5.integer), 
    onContentSizeChange = v5.optional(v5.callback), 
    viewabilityConfigCallbackPairs = v5.optional(v5.array(v5.strictInterface({
        viewabilityConfig = v5.strictInterface({
            minimumViewTime = v5.optional(v5.number), 
            viewAreaCoveragePercentThreshold = v5.optional(v5.number), 
            itemVisiblePercentThreshold = v5.optional(v5.number), 
            waitForInteraction = v5.optional(v5.boolean)
        }), 
        onViewableItemsChanged = v8
    })))
});
v14.defaultProps = {
    itemSize = Vector2.new(1, 1), 
    itemPadding = 12, 
    maxNumOfItemsVisible = 0
};
local function v22(v15, v16, v17, _) --[[ Line: 119 ]] --[[ Name: updateScrollState ]]
    if v15 == nil then
        return {};
    elseif v17 == nil or v17 == 0 then
        return {
            showLeftButton = false, 
            showRightButton = false
        };
    else
        local l_v15_0 = v15;
        local v20 = true;
        local v21 = true;
        if l_v15_0 <= 1 then
            l_v15_0 = 1;
            v20 = false;
        elseif v17 < l_v15_0 then
            l_v15_0 = v17;
            v21 = false;
        end;
        if v17 < l_v15_0 + v16 then
            v21 = false;
        end;
        return {
            index = l_v15_0, 
            showLeftButton = v20, 
            showRightButton = v21, 
            numOfItems = v17
        };
    end;
end;
local function _(v23) --[[ Line: 165 ]]
    -- upvalues: v10 (copy)
    if not v23 then
        return nil;
    else
        return v10.is(v23) and v23 or v10.promisify(v23);
    end;
end;
v14.getDerivedStateFromProps = function(v25, v26) --[[ Line: 172 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v22 (copy)
    local v27 = #v25.itemList;
    if v26.numOfItems ~= v27 then
        return (v22(v26.index, v26.maxNumOfItemsVisible, v27));
    else
        return nil;
    end;
end;
v14.init = function(v28) --[[ Line: 180 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v11 (copy), v22 (copy)
    v28.frameRef = v4.createRef();
    v28.listRef = v4.createRef();
    local v29 = {
        anchorIndex = 1
    };
    v28:setState({
        index = 1, 
        hovering = false, 
        showLeftButton = false, 
        showRightButton = false, 
        maxNumOfItemsVisible = v28.props.maxNumOfItemsVisible, 
        numOfItems = 0
    });
    v28.onMouseEnter = function(_, v31) --[[ Line: 197 ]]
        -- upvalues: v28 (copy), v29 (ref), v11 (ref), v22 (ref)
        if v31.UserInputType == Enum.UserInputType.MouseMovement then
            v28:setState(function(v32) --[[ Line: 199 ]]
                -- upvalues: v29 (ref), v11 (ref), v22 (ref)
                local l_anchorIndex_0 = v29.anchorIndex;
                return v11.Object.assign(v22(l_anchorIndex_0, v32.maxNumOfItemsVisible, v32.numOfItems), {
                    hovering = true
                });
            end);
        end;
    end;
    v28.onMouseLeave = function(_, v35) --[[ Line: 209 ]]
        -- upvalues: v28 (copy)
        if v35.UserInputType == Enum.UserInputType.MouseMovement then
            v28:setState({
                hovering = false
            });
        end;
    end;
    v28.onResize = function(v36) --[[ Line: 217 ]]
        -- upvalues: v28 (copy)
        local l_X_0 = v36.AbsoluteSize.X;
        v28:setState(function(_, v39) --[[ Line: 219 ]]
            -- upvalues: l_X_0 (copy)
            return {
                maxNumOfItemsVisible = math.floor(l_X_0 / (v39.itemSize.X + v39.itemPadding))
            };
        end);
    end;
    v28.onScrollUpdate = function(v40) --[[ Line: 225 ]]
        -- upvalues: v28 (copy), v29 (ref)
        local v41 = v28.props.itemSize.X + v28.props.itemPadding;
        v29 = {
            anchorIndex = math.floor((v40.CanvasPosition.X > 0 and v40.CanvasPosition.X or 0) / v41) + 1, 
            animationActive = false
        };
    end;
    v28.scrollLeft = function() --[[ Line: 237 ]]
        -- upvalues: v29 (ref), v28 (copy), v22 (ref)
        if v29.animationActive then
            return;
        else
            v28:setState(function(v42, v43) --[[ Line: 241 ]]
                -- upvalues: v29 (ref), v28 (ref), v22 (ref)
                local v44 = v29.anchorIndex - v42.maxNumOfItemsVisible;
                if v28.listRef then
                    v28.listRef.current:scrollToIndex({
                        animated = true, 
                        index = v44 > 1 and v44 or 1, 
                        viewOffset = v43.itemSize.X + v43.itemPadding
                    });
                end;
                return (v22(v44, v42.maxNumOfItemsVisible, v42.numOfItems));
            end);
            return;
        end;
    end;
    v28.scrollRight = function() --[[ Line: 254 ]]
        -- upvalues: v29 (ref), v28 (copy), v22 (ref)
        if v29.animationActive then
            return;
        else
            v28:setState(function(v45, v46) --[[ Line: 258 ]]
                -- upvalues: v29 (ref), v28 (ref), v22 (ref)
                local v47 = v29.anchorIndex + v45.maxNumOfItemsVisible;
                if v28.listRef then
                    v28.listRef.current:scrollToIndex({
                        animated = true, 
                        index = v47, 
                        viewOffset = v46.itemSize.X + v46.itemPadding
                    });
                end;
                return (v22(v47, v45.maxNumOfItemsVisible, v45.numOfItems));
            end);
            return;
        end;
    end;
    v28.proxyKeyExtractor = function(v48, v49) --[[ Line: 271 ]]
        -- upvalues: v28 (copy)
        local l_props_0 = v28.props;
        if l_props_0.identifier then
            return (l_props_0.identifier(v48, v49));
        else
            return nil;
        end;
    end;
    v28.proxyRenderItem = function(v51) --[[ Line: 276 ]]
        -- upvalues: v28 (copy)
        return v28.props.renderItem(v51.item);
    end;
    v28.getItemLayout = function(v52, v53) --[[ Line: 281 ]]
        -- upvalues: v28 (copy)
        local l_props_1 = v28.props;
        local v55 = l_props_1.itemSize.X + (l_props_1.itemPadding or 0);
        local v56 = v55 * (v53 - 1) + (l_props_1.carouselMargin or 0);
        return {
            length = if v53 == #v52 then l_props_1.itemSize.X else v55, 
            offset = v56, 
            index = v53
        };
    end;
end;
v14.render = function(v57) --[[ Line: 295 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v7 (copy), v12 (copy), v13 (copy), l_BidirectionalFlatList_0 (copy), v10 (copy)
    local l_props_2 = v57.props;
    local l_state_0 = v57.state;
    local l_itemList_0 = l_props_2.itemList;
    local l_itemSize_0 = l_props_2.itemSize;
    local l_itemPadding_0 = l_props_2.itemPadding;
    local l_carouselMargin_0 = l_props_2.carouselMargin;
    local l_layoutOrder_0 = l_props_2.layoutOrder;
    local l_loadNext_0 = l_props_2.loadNext;
    local l_loadPrevious_0 = l_props_2.loadPrevious;
    local v67 = nil;
    if l_state_0.hovering and l_state_0.showLeftButton then
        v67 = v4.createElement(v7, {
            icon = v12, 
            callback = v57.scrollLeft
        });
    end;
    local v68 = nil;
    if l_state_0.hovering and l_state_0.showRightButton then
        v68 = v4.createElement(v7, {
            icon = v13, 
            callback = v57.scrollRight
        });
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_itemSize_0.Y), 
        LayoutOrder = l_layoutOrder_0, 
        BackgroundTransparency = 1, 
        [v4.Ref] = v57.frameRef, 
        [v4.Event.InputBegan] = v57.onMouseEnter, 
        [v4.Event.InputEnded] = v57.onMouseLeave, 
        [v4.Change.AbsoluteSize] = v57.onResize
    }, {
        LeftMargin = v4.createElement("Frame", {
            Position = UDim2.fromScale(0, 0), 
            AnchorPoint = Vector2.new(0, 0), 
            Size = UDim2.new(0, l_carouselMargin_0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            ScrollLeftButton = v67
        }), 
        ScrollerCarousel = l_state_0.maxNumOfItemsVisible > 0 and v4.createElement(l_BidirectionalFlatList_0, {
            [v4.Ref] = v57.listRef, 
            data = l_itemList_0, 
            renderItem = v57.proxyRenderItem, 
            keyExtractor = v57.proxyKeyExtractor, 
            horizontal = true, 
            initialScrollIndex = 1, 
            initialNumToRender = 10, 
            windowSize = 5, 
            onScroll = v57.onScrollUpdate, 
            onStartReachedThreshold = 1, 
            onStartReached = if not l_loadPrevious_0 then nil else v10.is(l_loadPrevious_0) and l_loadPrevious_0 or v10.promisify(l_loadPrevious_0), 
            onEndReachedThreshold = 1, 
            onEndReached = if not l_loadNext_0 then nil else v10.is(l_loadNext_0) and l_loadNext_0 or v10.promisify(l_loadNext_0), 
            overrideAutomaticCanvasSize = true, 
            getItemLayout = v57.getItemLayout, 
            viewabilityConfigCallbackPairs = l_props_2.viewabilityConfigCallbackPairs, 
            ItemSeparatorComponent = l_itemPadding_0 and function() --[[ Line: 368 ]]
                -- upvalues: v4 (ref), l_itemPadding_0 (copy)
                return v4.createFragment({
                    ItemPadding = v4.createElement("UIPadding", {
                        PaddingRight = UDim.new(0, l_itemPadding_0)
                    })
                });
            end or nil, 
            showDefaultLoadingIndicators = false, 
            ListHeaderComponent = l_carouselMargin_0 and function() --[[ Line: 379 ]]
                -- upvalues: v4 (ref), l_carouselMargin_0 (copy)
                return v4.createFragment({
                    LeftCarouselMargin = v4.createElement("Frame", {
                        Position = UDim2.fromScale(0, 0), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, l_carouselMargin_0, 1, 0)
                    })
                });
            end or nil, 
            ListFooterComponent = l_carouselMargin_0 and function() --[[ Line: 392 ]]
                -- upvalues: v4 (ref), l_carouselMargin_0 (copy)
                return v4.createFragment({
                    RightCarouselMargin = v4.createElement("Frame", {
                        Position = UDim2.fromScale(0, 0), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, l_carouselMargin_0, 1, 0)
                    })
                });
            end or nil, 
            contentContainerStyle = {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0, 1), 
                ClipsDescendants = false
            }, 
            style = {
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0
            }, 
            onContentSizeChange = l_props_2.onContentSizeChange
        }) or nil, 
        RightMargin = v4.createElement("Frame", {
            Position = UDim2.fromScale(1, 0), 
            AnchorPoint = Vector2.new(1, 0), 
            Size = UDim2.new(0, l_carouselMargin_0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            ScrollRightButton = v68
        })
    });
end;
return v14;