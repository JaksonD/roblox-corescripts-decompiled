local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_script_FirstAncestor_0.Carousel.useHorizontalScrolledToEndThreshold);
local v5 = require(l_script_FirstAncestor_0.Carousel.useHorizontalWindowStartIndex);
local v6 = require(l_script_FirstAncestor_0.Carousel.RowOfCollectionItems);
local _ = require(l_script_FirstAncestor_0.Carousel.calculateCarouselSpacingMetrics);
local v8 = require(l_Parent_0.SharedFlags);
local l_FFlagCollectionViewMathChanges_0 = v8.FFlagCollectionViewMathChanges;
local l_FFlagLuaAppCompositionSupport_0 = v8.FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppFixCarouselCanvasOverflow_0 = v8.FFlagLuaAppFixCarouselCanvasOverflow;
local function _(v12, v13, v14) --[[ Line: 82 ]] --[[ Name: getNumToRenderWithVirtualization ]]
    if v13 == 0 then
        return 0;
    else
        return (math.min(v13 + (v14 or 6), v12));
    end;
end;
return v2.memo(function(v16) --[[ Line: 99 ]] --[[ Name: ScrollingRowOfCollectionItems ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), v5 (copy), l_FFlagCollectionViewMathChanges_0 (copy), l_FFlagLuaAppFixCarouselCanvasOverflow_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v6 (copy)
    local v17 = v2.useRef(nil);
    local v19 = v2.useCallback(function(v18) --[[ Line: 102 ]]
        -- upvalues: v17 (copy), v16 (copy)
        v17.current = v18;
        if v16.onScrollingFrameRefCallback then
            v16.onScrollingFrameRefCallback(v18);
        end;
    end, {
        v16.onScrollingFrameRefCallback
    });
    v4(v17, v16.thresholdFromEnd, v16.onReachedThresholdFromEnd, v16.ScrollingEnabled);
    v3.assert(v16.totalItemsOnCanvas >= 0);
    v3.assert(v16.numColumns >= 1);
    v3.assert(v16.columnGap >= 0);
    local v20 = false;
    if v16.numItemsToRenderOffScreen ~= -1 then
        v20 = v16.ScrollingEnabled and v16.totalItemsOnCanvas > v16.numColumns * 2;
    end;
    local v21;
    if v20 then
        local l_totalItemsOnCanvas_0 = v16.totalItemsOnCanvas;
        local l_numColumns_0 = v16.numColumns;
        local l_numItemsToRenderOffScreen_0 = v16.numItemsToRenderOffScreen;
        v21 = l_numColumns_0 == 0 and 0 or math.min(l_numColumns_0 + (l_numItemsToRenderOffScreen_0 or 6), l_totalItemsOnCanvas_0);
    else
        v21 = math.min(v16.totalItemsOnCanvas, #v16.items);
    end;
    local v25 = math.max(v16.numColumns, v16.totalItemsOnCanvas);
    v3.assert(v21 >= 0);
    local v26 = math.min(v5(v17, if l_FFlagCollectionViewMathChanges_0 then nil else v16.itemSizeBinding, if l_FFlagCollectionViewMathChanges_0 then nil else v16.columnGap, v20, if l_FFlagCollectionViewMathChanges_0 then v16.numColumns else nil, if l_FFlagCollectionViewMathChanges_0 then v16.spacingMetricsBinding else nil), #v16.items);
    local v27 = math.max(0, (math.min(v16.totalItemsOnCanvas, v26 + v21 - 1)));
    local l_assert_0 = v3.assert;
    local v29 = false;
    if v26 >= 0 then
        v29 = v26 <= #v16.items;
    end;
    l_assert_0(v29, (("startingIndex: %* failed check >= 0 and <= %*"):format(v26, #v16.items)));
    l_assert_0 = v3.assert;
    v29 = false;
    if v26 <= v27 then
        v29 = v27 <= #v16.items;
    end;
    l_assert_0(v29, (("endingIndex: %* failed check >= %* and <= %*"):format(v27, v26, #v16.items)));
    v2.useEffect(function() --[[ Line: 166 ]]
        -- upvalues: v16 (copy), v26 (copy), v27 (copy)
        if v16.onViewableItemsChanged then
            v16.onViewableItemsChanged(v26, v27);
        end;
    end, {
        v26, 
        v27, 
        v16.onViewableItemsChanged
    });
    l_assert_0 = nil;
    if l_FFlagCollectionViewMathChanges_0 then
        l_assert_0 = v2.useMemo(function() --[[ Line: 174 ]]
            -- upvalues: v2 (ref), v16 (copy), l_FFlagLuaAppFixCarouselCanvasOverflow_0 (ref), v25 (copy)
            return v2.joinBindings({
                v16.spacingMetricsBinding, 
                v16.itemSizeBinding
            }):map(function(v30) --[[ Line: 178 ]]
                -- upvalues: l_FFlagLuaAppFixCarouselCanvasOverflow_0 (ref), v25 (ref), v16 (ref)
                local v31 = v30[1];
                local v32 = v30[2];
                local v33 = nil;
                v33 = if v31.effectiveWidth > 0 then if l_FFlagLuaAppFixCarouselCanvasOverflow_0 then (v25 - 1) * v31.stride + v31.renderedItemWidth else (v25 - v16.numColumns) * v31.stride + v31.containerWidth else 0;
                return UDim2.fromOffset(math.max(0, v33), (math.ceil(v32.Y)));
            end);
        end, {
            v16.spacingMetricsBinding, 
            v16.itemSizeBinding, 
            v16.numColumns, 
            v25
        });
    end;
    return v2.createElement("ScrollingFrame", {
        Size = if l_FFlagLuaAppCompositionSupport_0 and v16.Size then v16.Size else v16.itemSizeBinding:map(function(v34) --[[ Line: 197 ]]
            return UDim2.new(1, 0, 0, v34.Y);
        end), 
        Position = v16.Position, 
        LayoutOrder = v16.LayoutOrder, 
        ScrollBarThickness = 0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        CanvasSize = if l_FFlagCollectionViewMathChanges_0 then l_assert_0 else v16.itemSizeBinding:map(function(v35) --[[ Line: 207 ]]
            -- upvalues: v25 (copy), v16 (copy)
            local v36 = math.max(0, v25 * (v35.X + v16.columnGap) - v16.columnGap);
            return UDim2.new(0, v36, 0, v35.Y);
        end), 
        ScrollingEnabled = v16.ScrollingEnabled and v16.totalItemsOnCanvas > v16.numColumns, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        Selectable = false, 
        [v2.Change.CanvasPosition] = v16.onChangeCanvasPosition, 
        [v2.Change.AbsoluteSize] = if l_FFlagCollectionViewMathChanges_0 then v16.onScrollingFrameAbsoluteSizeChanged else nil, 
        ref = v19, 
        AutomaticSize = v16.AutomaticSize
    }, {
        RowOfCollectionItems = if l_FFlagCollectionViewMathChanges_0 then v2.createElement("Frame", {
            Size = v16.spacingMetricsBinding:map(function(v37) --[[ Line: 225 ]]
                return UDim2.new(0, v37.effectiveWidth, 1, 0);
            end), 
            BackgroundTransparency = 1, 
            ClipsDescendants = false
        }, {
            RowOfCollectionItems = v2.createElement(v6, {
                startingIndex = v26, 
                endingIndex = v27, 
                numToRender = v21, 
                items = v16.items, 
                totalItemsOnCanvas = v16.totalItemsOnCanvas, 
                columnGap = v16.columnGap, 
                renderItem = v16.renderItem, 
                sideMargin = v16.sideMargin, 
                numColumns = v16.numColumns, 
                spacingMetricsBinding = v16.spacingMetricsBinding
            })
        }) else v2.createElement(v6, {
            startingIndex = v26, 
            endingIndex = v27, 
            numToRender = v21, 
            items = v16.items, 
            totalItemsOnCanvas = v16.totalItemsOnCanvas, 
            columnGap = v16.columnGap, 
            renderItem = v16.renderItem, 
            sideMargin = v16.sideMargin, 
            numItemsForSizing = v25
        })
    });
end);