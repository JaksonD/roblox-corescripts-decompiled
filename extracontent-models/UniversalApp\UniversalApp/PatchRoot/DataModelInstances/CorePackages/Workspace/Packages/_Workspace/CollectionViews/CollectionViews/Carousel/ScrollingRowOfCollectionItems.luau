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
local function _(v11, v12, v13) --[[ Line: 81 ]] --[[ Name: getNumToRenderWithVirtualization ]]
    if v12 == 0 then
        return 0;
    else
        return (math.min(v12 + (v13 or 6), v11));
    end;
end;
return v2.memo(function(v15) --[[ Line: 98 ]] --[[ Name: ScrollingRowOfCollectionItems ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), v5 (copy), l_FFlagCollectionViewMathChanges_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v6 (copy)
    local v16 = v2.useRef(nil);
    local v18 = v2.useCallback(function(v17) --[[ Line: 101 ]]
        -- upvalues: v16 (copy), v15 (copy)
        v16.current = v17;
        if v15.onScrollingFrameRefCallback then
            v15.onScrollingFrameRefCallback(v17);
        end;
    end, {
        v15.onScrollingFrameRefCallback
    });
    v4(v16, v15.thresholdFromEnd, v15.onReachedThresholdFromEnd, v15.ScrollingEnabled);
    v3.assert(v15.totalItemsOnCanvas >= 0);
    v3.assert(v15.numColumns >= 1);
    v3.assert(v15.columnGap >= 0);
    local v19 = false;
    if v15.numItemsToRenderOffScreen ~= -1 then
        v19 = v15.ScrollingEnabled and v15.totalItemsOnCanvas > v15.numColumns * 2;
    end;
    local v20;
    if v19 then
        local l_totalItemsOnCanvas_0 = v15.totalItemsOnCanvas;
        local l_numColumns_0 = v15.numColumns;
        local l_numItemsToRenderOffScreen_0 = v15.numItemsToRenderOffScreen;
        v20 = l_numColumns_0 == 0 and 0 or math.min(l_numColumns_0 + (l_numItemsToRenderOffScreen_0 or 6), l_totalItemsOnCanvas_0);
    else
        v20 = math.min(v15.totalItemsOnCanvas, #v15.items);
    end;
    local v24 = math.max(v15.numColumns, v15.totalItemsOnCanvas);
    v3.assert(v20 >= 0);
    local v25 = math.min(v5(v16, if l_FFlagCollectionViewMathChanges_0 then nil else v15.itemSizeBinding, if l_FFlagCollectionViewMathChanges_0 then nil else v15.columnGap, v19, if l_FFlagCollectionViewMathChanges_0 then v15.numColumns else nil, if l_FFlagCollectionViewMathChanges_0 then v15.spacingMetricsBinding else nil), #v15.items);
    local v26 = math.max(0, (math.min(v15.totalItemsOnCanvas, v25 + v20 - 1)));
    local l_assert_0 = v3.assert;
    local v28 = false;
    if v25 >= 0 then
        v28 = v25 <= #v15.items;
    end;
    l_assert_0(v28, (("startingIndex: %* failed check >= 0 and <= %*"):format(v25, #v15.items)));
    l_assert_0 = v3.assert;
    v28 = false;
    if v25 <= v26 then
        v28 = v26 <= #v15.items;
    end;
    l_assert_0(v28, (("endingIndex: %* failed check >= %* and <= %*"):format(v26, v25, #v15.items)));
    v2.useEffect(function() --[[ Line: 165 ]]
        -- upvalues: v15 (copy), v25 (copy), v26 (copy)
        if v15.onViewableItemsChanged then
            v15.onViewableItemsChanged(v25, v26);
        end;
    end, {
        v25, 
        v26, 
        v15.onViewableItemsChanged
    });
    l_assert_0 = nil;
    if l_FFlagCollectionViewMathChanges_0 then
        l_assert_0 = v2.useMemo(function() --[[ Line: 173 ]]
            -- upvalues: v2 (ref), v15 (copy), v24 (copy)
            return v2.joinBindings({
                v15.spacingMetricsBinding, 
                v15.itemSizeBinding
            }):map(function(v29) --[[ Line: 177 ]]
                -- upvalues: v24 (ref), v15 (ref)
                local v30 = v29[1];
                local v31 = v29[2];
                local v32 = nil;
                v32 = if v30.effectiveWidth > 0 then (v24 - v15.numColumns) * v30.stride + v30.containerWidth else 0;
                return UDim2.fromOffset(math.max(0, v32), (math.ceil(v31.Y)));
            end);
        end, {
            v15.spacingMetricsBinding, 
            v15.itemSizeBinding, 
            v15.numColumns, 
            v24
        });
    end;
    return v2.createElement("ScrollingFrame", {
        Size = if l_FFlagLuaAppCompositionSupport_0 and v15.Size then v15.Size else v15.itemSizeBinding:map(function(v33) --[[ Line: 194 ]]
            return UDim2.new(1, 0, 0, v33.Y);
        end), 
        Position = v15.Position, 
        LayoutOrder = v15.LayoutOrder, 
        ScrollBarThickness = 0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        CanvasSize = if l_FFlagCollectionViewMathChanges_0 then l_assert_0 else v15.itemSizeBinding:map(function(v34) --[[ Line: 204 ]]
            -- upvalues: v24 (copy), v15 (copy)
            local v35 = math.max(0, v24 * (v34.X + v15.columnGap) - v15.columnGap);
            return UDim2.new(0, v35, 0, v34.Y);
        end), 
        ScrollingEnabled = v15.ScrollingEnabled and v15.totalItemsOnCanvas > v15.numColumns, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        Selectable = false, 
        [v2.Change.CanvasPosition] = v15.onChangeCanvasPosition, 
        [v2.Change.AbsoluteSize] = if l_FFlagCollectionViewMathChanges_0 then v15.onScrollingFrameAbsoluteSizeChanged else nil, 
        ref = v18, 
        AutomaticSize = v15.AutomaticSize
    }, {
        RowOfCollectionItems = if l_FFlagCollectionViewMathChanges_0 then v2.createElement("Frame", {
            Size = v15.spacingMetricsBinding:map(function(v36) --[[ Line: 222 ]]
                return UDim2.new(0, v36.effectiveWidth, 1, 0);
            end), 
            BackgroundTransparency = 1, 
            ClipsDescendants = false
        }, {
            RowOfCollectionItems = v2.createElement(v6, {
                startingIndex = v25, 
                endingIndex = v26, 
                numToRender = v20, 
                items = v15.items, 
                totalItemsOnCanvas = v15.totalItemsOnCanvas, 
                columnGap = v15.columnGap, 
                renderItem = v15.renderItem, 
                sideMargin = v15.sideMargin, 
                numColumns = v15.numColumns, 
                spacingMetricsBinding = v15.spacingMetricsBinding
            })
        }) else v2.createElement(v6, {
            startingIndex = v25, 
            endingIndex = v26, 
            numToRender = v20, 
            items = v15.items, 
            totalItemsOnCanvas = v15.totalItemsOnCanvas, 
            columnGap = v15.columnGap, 
            renderItem = v15.renderItem, 
            sideMargin = v15.sideMargin, 
            numItemsForSizing = v24
        })
    });
end);