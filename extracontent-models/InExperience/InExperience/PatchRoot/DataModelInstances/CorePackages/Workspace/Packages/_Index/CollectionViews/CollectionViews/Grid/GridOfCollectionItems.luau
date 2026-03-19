local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_script_FirstAncestor_0.Grid.calculateRelativeColumnGap);
local v6 = require(l_script_FirstAncestor_0.calculateSpacePerItem);
local l_FFlagCollectionViewMathChanges_0 = require(l_Parent_0.SharedFlags).FFlagCollectionViewMathChanges;
local v8 = {
    maxNumRows = 1e999, 
    numColumns = 1, 
    bufferRowsBelowScreen = 4, 
    bufferRowsAboveScreen = 4, 
    columnGap = 0, 
    sideMargin = 0, 
    verticalPadding = 0, 
    thresholdRowsFromBottom = 0
};
return v2.memo(function(v9) --[[ Line: 82 ]] --[[ Name: GridOfCollectionItems ]]
    -- upvalues: v3 (copy), v8 (copy), v2 (copy), v4 (copy), l_FFlagCollectionViewMathChanges_0 (copy), v6 (copy), v5 (copy)
    local v10 = v3.Dictionary.join(v8, v9);
    local v11 = v2.useRef(nil);
    local v12 = math.min(math.ceil(#v10.items / v10.numColumns), v10.maxNumRows);
    local v14 = v10.itemSizeBinding:map(function(v13) --[[ Line: 90 ]]
        -- upvalues: v12 (copy), v10 (copy)
        return v12 * (v13.Y + v10.verticalPadding) - v10.verticalPadding;
    end);
    local v15, v16 = v2.useState(-1);
    local v17, v18 = v2.useState(-1);
    local v19, v20 = v2.useState(v10.bufferRowsBelowScreen + v10.bufferRowsAboveScreen);
    v2.useEffect(function() --[[ Line: 103 ]]
        -- upvalues: v10 (copy), v11 (copy), v12 (copy), v16 (copy), v18 (copy), v20 (copy)
        local v21 = {};
        if v10.verticalScrollingFrameRef and v10.verticalScrollingFrameRef.current and v11.current then
            local l_current_0 = v11.current;
            local l_current_1 = v10.verticalScrollingFrameRef.current;
            local l_Y_0 = v10.itemSizeBinding:getValue().Y;
            local l_Y_1 = l_current_1.AbsolutePosition.Y;
            local l_Y_2 = l_current_1.AbsoluteWindowSize.Y;
            local v27 = math.ceil(l_Y_2 / math.max(1, l_Y_0 + v10.verticalPadding)) + 1;
            do
                local l_l_Y_1_0, l_l_Y_2_0, l_v27_0 = l_Y_1, l_Y_2, v27;
                local function _() --[[ Line: 120 ]] --[[ Name: calculateOffsetOfGrid ]]
                    -- upvalues: l_current_0 (copy), l_current_1 (copy), l_l_Y_1_0 (ref)
                    return l_current_0.AbsolutePosition.Y + l_current_1.CanvasPosition.Y - l_l_Y_1_0;
                end;
                local v32 = l_current_0.AbsolutePosition.Y + l_current_1.CanvasPosition.Y - l_l_Y_1_0;
                local function v44() --[[ Line: 127 ]] --[[ Name: updateRowsToRender ]]
                    -- upvalues: l_current_1 (copy), v10 (ref), v12 (ref), v32 (ref), l_l_Y_2_0 (ref), l_v27_0 (ref), v16 (ref), v18 (ref)
                    local l_Y_3 = l_current_1.CanvasPosition.Y;
                    local l_Y_4 = v10.itemSizeBinding:getValue().Y;
                    local v35 = math.max(1, l_Y_4 + v10.verticalPadding);
                    local v36 = v12 * (l_Y_4 + v10.verticalPadding) - v10.verticalPadding;
                    local v37 = v32 - l_Y_3;
                    local v38 = v10.bufferRowsAboveScreen * v35;
                    local v39 = v10.bufferRowsBelowScreen * v35;
                    local v40 = nil;
                    local v41 = nil;
                    if l_l_Y_2_0 + v39 < v37 or v37 + v36 < -v38 then
                        v40 = -1;
                        v41 = -1;
                    else
                        local v42 = math.floor(-v37 / v35);
                        v40 = math.max(1, v42 + 1 - v10.bufferRowsAboveScreen);
                        local v43 = l_v27_0 + v10.bufferRowsBelowScreen;
                        v43 = math.max(1, if v42 <= 0 then v43 + v42 else v43 + math.min(v42, v10.bufferRowsAboveScreen));
                        v41 = math.min(v12, v40 + v43 - 1);
                    end;
                    v16(v40);
                    v18(v41);
                end;
                local function v46() --[[ Line: 172 ]] --[[ Name: updateWindowParams ]]
                    -- upvalues: v10 (ref), l_l_Y_1_0 (ref), l_current_1 (copy), l_l_Y_2_0 (ref), v32 (ref), l_current_0 (copy), l_v27_0 (ref), v20 (ref), v12 (ref), v44 (copy)
                    local v45 = math.max(1, v10.itemSizeBinding:getValue().Y + v10.verticalPadding);
                    l_l_Y_1_0 = l_current_1.AbsolutePosition.Y;
                    l_l_Y_2_0 = l_current_1.AbsoluteWindowSize.Y;
                    v32 = l_current_0.AbsolutePosition.Y + l_current_1.CanvasPosition.Y - l_l_Y_1_0;
                    l_v27_0 = math.ceil(l_l_Y_2_0 / v45) + 1;
                    v20((math.min(v12, l_v27_0 + v10.bufferRowsBelowScreen + v10.bufferRowsAboveScreen)));
                    v44();
                end;
                table.insert(v21, l_current_1:GetPropertyChangedSignal("AbsolutePosition"):Connect(v46));
                table.insert(v21, l_current_1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(v46));
                table.insert(v21, l_current_1:GetPropertyChangedSignal("CanvasSize"):Connect(v46));
                table.insert(v21, l_current_1:GetPropertyChangedSignal("CanvasPosition"):Connect(v44));
                v46();
            end;
        else
            v16(1);
            v18(v12);
            v20(v12);
        end;
        return function() --[[ Line: 213 ]]
            -- upvalues: v21 (copy)
            for _, v48 in v21 do
                v48:Disconnect();
            end;
        end;
    end, {
        v11, 
        v12, 
        v10.itemSizeBinding, 
        v10.verticalScrollingFrameRef, 
        v10.verticalPadding, 
        v10.bufferRowsAboveScreen, 
        v10.bufferRowsBelowScreen, 
        v10.onViewableItemsChanged
    });
    v17 = math.min(v17, v12);
    local v49 = math.max(-1, (v15 - 1) * v10.numColumns + 1);
    local v50 = math.max(-1, (math.min(#v10.items, v17 * v10.numColumns)));
    v2.useEffect(function() --[[ Line: 238 ]]
        -- upvalues: v10 (copy), v49 (copy), v50 (copy)
        if v10.onViewableItemsChanged then
            v10.onViewableItemsChanged(v49, v50);
        end;
    end, {
        v49, 
        v50, 
        v10.onViewableItemsChanged
    });
    local v51 = v2.useRef(nil);
    v2.useEffect(function() --[[ Line: 246 ]]
        -- upvalues: v17 (ref), v12 (copy), v10 (copy), v51 (copy)
        if v17 >= v12 - v10.thresholdRowsFromBottom and v51.current ~= v10.items and v10.onReachedThresholdFromEnd then
            v10.onReachedThresholdFromEnd();
            v51.current = v10.items;
        end;
    end, {
        v17, 
        v12, 
        v10.thresholdRowsFromBottom, 
        v10.onReachedThresholdFromEnd, 
        v10.items
    });
    local v73 = v2.useMemo(function() --[[ Line: 265 ]]
        -- upvalues: v15 (copy), v17 (ref), v49 (copy), v50 (copy), v10 (copy), v12 (copy), v4 (ref), v2 (ref), l_FFlagCollectionViewMathChanges_0 (ref), v6 (ref), v5 (ref), v19 (copy)
        local v52 = {};
        if v15 <= 0 or v17 < v15 then
            return nil;
        elseif v49 <= 0 or v50 < v49 then
            return nil;
        elseif v10.numColumns <= 0 or v12 - v15 < 0 then
            return nil;
        else
            v4.assert(v15 >= 1);
            local l_assert_0 = v4.assert;
            local v54 = false;
            if v15 <= v17 then
                v54 = v17 <= v12;
            end;
            l_assert_0(v54);
            if v15 > 1 then
                l_assert_0 = v15 - 1;
                local l_l_assert_0_0 = l_assert_0 --[[ copy: 1 -> 11 ]];
                v52.Padding = v2.createElement("UIPadding", {
                    PaddingTop = v10.itemSizeBinding:map(function(v56) --[[ Line: 283 ]]
                        -- upvalues: l_l_assert_0_0 (copy), v10 (ref)
                        return UDim.new(0, l_l_assert_0_0 * (v56.Y + v10.verticalPadding));
                    end)
                });
            end;
            l_assert_0 = v12 - v15 + 1;
            v4.assert(l_assert_0 >= 1);
            v4.assert(v10.numColumns >= 1);
            v54 = nil;
            local v57 = nil;
            if l_FFlagCollectionViewMathChanges_0 then
                local v58 = v6(v10.numColumns, v10.columnGap);
                local v59 = v6(l_assert_0, v10.verticalPadding);
                v54 = UDim2.new(1 / v10.numColumns, -v58.gapOffsetPerItem, 1 / l_assert_0, -v59.gapOffsetPerItem);
                v57 = UDim2.new(0, v58.adjustedGap, 0, v59.adjustedGap);
            else
                local v60 = v10.numColumns - 1;
                local v61 = l_assert_0 - 1;
                v54 = UDim2.new(1 / v10.numColumns, math.floor(-(v60 / v10.numColumns) * v10.columnGap), 1 / l_assert_0, (math.floor(-(v61 / l_assert_0) * v10.verticalPadding)));
                local v62 = math.floor(v60 / v10.numColumns * v10.columnGap) * v10.numColumns - v10.columnGap * v60;
                local v63 = v10.columnGap + v62 / v60;
                v57 = if v10.disableRelativeGap then UDim2.new(0, v63, 0, v10.verticalPadding) else v10.itemSizeBinding:map(function(v64) --[[ Line: 321 ]]
                    -- upvalues: v5 (ref), v10 (ref)
                    local v65 = v5(v10.numColumns, v10.columnGap, v64.X, v10.sideMargin);
                    return UDim2.new(v65, 0, 0, v10.verticalPadding);
                end);
            end;
            v52.Layout = v2.createElement("UIGridLayout", {
                FillDirectionMaxCells = v10.numColumns, 
                CellPadding = v57, 
                CellSize = v54, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            });
            v4.assert(v49 >= 1);
            local l_assert_1 = v4.assert;
            local v67 = false;
            if v49 <= v50 then
                v67 = v50 <= #v10.items;
            end;
            l_assert_1(v67);
            for v68 = v49, v50 do
                if v68 <= #v10.items then
                    local v69 = math.ceil(v68 / v10.numColumns);
                    local v70 = v10.items[v68];
                    local v71, v72 = v10.renderItem(v70, v68, UDim2.fromScale(1, 1), v69);
                    v52[("%*%*"):format(v72, v68 % (v19 * v10.numColumns))] = v71;
                end;
            end;
            return v52;
        end;
    end, {
        v10.columnGap, 
        v10.numColumns, 
        v10.itemSizeBinding, 
        v15, 
        v17, 
        v10.items, 
        v10.renderItem, 
        v10.verticalPadding, 
        v19, 
        v12, 
        if not l_FFlagCollectionViewMathChanges_0 then v10.sideMargin else nil, 
        v49, 
        v50, 
        if not l_FFlagCollectionViewMathChanges_0 then v10.disableRelativeGap else nil
    });
    return v2.createElement("Frame", {
        ref = v11, 
        Size = v14:map(function(v74) --[[ Line: 371 ]]
            return UDim2.new(1, 0, 0, v74);
        end), 
        BackgroundTransparency = 1, 
        LayoutOrder = v10.LayoutOrder, 
        Position = v10.Position
    }, v73);
end);