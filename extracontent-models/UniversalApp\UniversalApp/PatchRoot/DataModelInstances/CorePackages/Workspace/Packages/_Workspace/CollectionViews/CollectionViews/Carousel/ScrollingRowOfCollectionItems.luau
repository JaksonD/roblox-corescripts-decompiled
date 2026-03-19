local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_script_FirstAncestor_0.Carousel.useHorizontalScrolledToEndThreshold);
local v5 = require(l_script_FirstAncestor_0.Carousel.useHorizontalWindowStartIndex);
local v6 = require(l_script_FirstAncestor_0.Carousel.RowOfCollectionItems);
local function _(v7, v8, v9) --[[ Line: 64 ]] --[[ Name: getNumToRenderWithVirtualization ]]
    if v8 == 0 then
        return 0;
    else
        return (math.min(v8 + (v9 or 6), v7));
    end;
end;
return v2.memo(function(v11) --[[ Line: 81 ]] --[[ Name: ScrollingRowOfCollectionItems ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), v5 (copy), v6 (copy)
    local v12 = v2.useRef(nil);
    local v14 = v2.useCallback(function(v13) --[[ Line: 84 ]]
        -- upvalues: v12 (copy), v11 (copy)
        v12.current = v13;
        if v11.onScrollingFrameRefCallback then
            v11.onScrollingFrameRefCallback(v13);
        end;
    end, {
        v11.onScrollingFrameRefCallback
    });
    v4(v12, v11.thresholdFromEnd, v11.onReachedThresholdFromEnd, v11.ScrollingEnabled);
    v3.assert(v11.totalItemsOnCanvas >= 0);
    v3.assert(v11.numColumns >= 1);
    v3.assert(v11.columnGap >= 0);
    local v15 = false;
    if v11.numItemsToRenderOffScreen ~= -1 then
        v15 = v11.ScrollingEnabled and v11.totalItemsOnCanvas > v11.numColumns * 2;
    end;
    local v16;
    if v15 then
        local l_totalItemsOnCanvas_0 = v11.totalItemsOnCanvas;
        local l_numColumns_0 = v11.numColumns;
        local l_numItemsToRenderOffScreen_0 = v11.numItemsToRenderOffScreen;
        v16 = l_numColumns_0 == 0 and 0 or math.min(l_numColumns_0 + (l_numItemsToRenderOffScreen_0 or 6), l_totalItemsOnCanvas_0);
    else
        v16 = math.min(v11.totalItemsOnCanvas, #v11.items);
    end;
    local v20 = math.max(v11.numColumns, v11.totalItemsOnCanvas);
    v3.assert(v16 >= 0);
    local v21 = math.min(v5(v12, v11.itemSizeBinding, v11.columnGap, v15), #v11.items);
    local v22 = math.max(0, (math.min(v11.totalItemsOnCanvas, v21 + v16 - 1)));
    local l_assert_0 = v3.assert;
    local v24 = false;
    if v21 >= 0 then
        v24 = v21 <= #v11.items;
    end;
    l_assert_0(v24, (("startingIndex: %* failed check >= 0 and <= %*"):format(v21, #v11.items)));
    l_assert_0 = v3.assert;
    v24 = false;
    if v21 <= v22 then
        v24 = v22 <= #v11.items;
    end;
    l_assert_0(v24, (("endingIndex: %* failed check >= %* and <= %*"):format(v22, v21, #v11.items)));
    v2.useEffect(function() --[[ Line: 146 ]]
        -- upvalues: v11 (copy), v21 (copy), v22 (copy)
        if v11.onViewableItemsChanged then
            v11.onViewableItemsChanged(v21, v22);
        end;
    end, {
        v21, 
        v22, 
        v11.onViewableItemsChanged
    });
    return v2.createElement("ScrollingFrame", {
        Size = v11.itemSizeBinding:map(function(v25) --[[ Line: 153 ]]
            return UDim2.new(1, 0, 0, v25.Y);
        end), 
        Position = v11.Position, 
        LayoutOrder = v11.LayoutOrder, 
        ScrollBarThickness = 0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        CanvasSize = v11.itemSizeBinding:map(function(v26) --[[ Line: 161 ]]
            -- upvalues: v20 (copy), v11 (copy)
            local v27 = math.max(0, v20 * (v26.X + v11.columnGap) - v11.columnGap);
            return UDim2.new(0, v27, 0, v26.Y);
        end), 
        ScrollingEnabled = v11.ScrollingEnabled and v11.totalItemsOnCanvas > v11.numColumns, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        Selectable = false, 
        [v2.Change.CanvasPosition] = v11.onChangeCanvasPosition, 
        ref = v14, 
        AutomaticSize = v11.AutomaticSize
    }, {
        RowOfCollectionItems = v2.createElement(v6, {
            startingIndex = v21, 
            endingIndex = v22, 
            numToRender = v16, 
            items = v11.items, 
            totalItemsOnCanvas = v11.totalItemsOnCanvas, 
            columnGap = v11.columnGap, 
            renderItem = v11.renderItem, 
            sideMargin = v11.sideMargin, 
            numItemsForSizing = v20
        })
    });
end);