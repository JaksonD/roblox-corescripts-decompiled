local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_script_FirstAncestor_0.calculateSpacePerItem);
local _ = require(l_script_FirstAncestor_0.Carousel.calculateCarouselSpacingMetrics);
local l_FFlagCollectionViewMathChanges_0 = require(l_Parent_0.SharedFlags).FFlagCollectionViewMathChanges;
return v2.memo(function(v7) --[[ Line: 52 ]] --[[ Name: RowOfCollectionItems ]]
    -- upvalues: v2 (copy), l_FFlagCollectionViewMathChanges_0 (copy), v4 (copy), v3 (copy)
    local v26 = v2.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: v7 (copy), l_FFlagCollectionViewMathChanges_0 (ref), v4 (ref), v2 (ref), v3 (ref)
        if v7.numToRender == 0 or if l_FFlagCollectionViewMathChanges_0 then v7.numColumns == 0 else v7.numItemsForSizing == 0 then
            return nil;
        else
            local v8 = v7.startingIndex - 1;
            local v9 = {};
            local v10 = nil;
            local v11 = nil;
            if l_FFlagCollectionViewMathChanges_0 then
                local l_numColumns_0 = v7.numColumns;
                local v13 = v4(l_numColumns_0, v7.columnGap);
                v10 = UDim2.new(1 / l_numColumns_0, -v13.gapOffsetPerItem, 1, 0);
                v11 = v13.adjustedGap;
            else
                local l_numItemsForSizing_0 = v7.numItemsForSizing;
                local v15 = l_numItemsForSizing_0 - 1;
                local v16 = math.floor(v15 / l_numItemsForSizing_0 * v7.columnGap);
                v10 = UDim2.new(1 / l_numItemsForSizing_0, -v16, 1, 0);
                local v17 = v16 * l_numItemsForSizing_0 - v7.columnGap * v15;
                v11 = v7.columnGap + v17 / v15;
            end;
            v9.Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, v11), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            });
            if v8 > 0 then
                v9.Padding = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = if l_FFlagCollectionViewMathChanges_0 then v7.spacingMetricsBinding:map(function(v18) --[[ Line: 100 ]]
                        -- upvalues: v8 (copy)
                        local v19 = v8 * v18.stride - v18.renderedGap;
                        return UDim2.fromOffset(math.max(0, v19), 0);
                    end) else UDim2.new(v8 * v10.X.Scale, (v8 - 1) * v11 + v8 * v10.X.Offset, 0, 0), 
                    LayoutOrder = 0
                });
            end;
            local l_assert_0 = v3.assert;
            local v21 = false;
            if v7.startingIndex >= 1 then
                v21 = v7.startingIndex <= #v7.items;
            end;
            l_assert_0(v21);
            l_assert_0 = v3.assert;
            v21 = false;
            if v7.endingIndex >= v7.startingIndex then
                v21 = v7.endingIndex <= #v7.items;
            end;
            l_assert_0(v21);
            for v22 = v7.startingIndex, v7.endingIndex do
                if v22 >= 1 and v22 <= #v7.items then
                    local v23 = v7.items[v22];
                    local v24, v25 = v7.renderItem(v23, v22, v10);
                    v9[v25 .. tostring(v22 % v7.numToRender + 1)] = v24;
                end;
            end;
            return v9;
        end;
    end, {
        v7.columnGap, 
        v7.startingIndex, 
        v7.endingIndex, 
        v7.items, 
        v7.numToRender, 
        v7.renderItem, 
        v7.sideMargin, 
        v7.totalItemsOnCanvas, 
        if l_FFlagCollectionViewMathChanges_0 then v7.numColumns else v7.numItemsForSizing, 
        if l_FFlagCollectionViewMathChanges_0 then v7.spacingMetricsBinding else nil
    });
    return v2.createElement(v2.Fragment, nil, v26);
end);