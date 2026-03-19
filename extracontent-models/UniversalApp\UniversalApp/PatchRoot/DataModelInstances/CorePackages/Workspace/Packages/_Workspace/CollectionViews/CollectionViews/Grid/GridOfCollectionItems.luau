local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_script_FirstAncestor_0.Grid.calculateRelativeColumnGap);
local l_FFlagSduiV2PaginationSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiV2PaginationSupport;
local v7 = {
    maxNumRows = 1e999, 
    numColumns = 1, 
    bufferRowsBelowScreen = 4, 
    bufferRowsAboveScreen = 4, 
    columnGap = 0, 
    sideMargin = 0, 
    verticalPadding = 0, 
    thresholdRowsFromBottom = l_FFlagSduiV2PaginationSupport_0 and 0 or nil
};
return v2.memo(function(v8) --[[ Line: 80 ]] --[[ Name: GridOfCollectionItems ]]
    -- upvalues: v3 (copy), v7 (copy), v2 (copy), l_FFlagSduiV2PaginationSupport_0 (copy), v4 (copy), v5 (copy)
    local v9 = v3.Dictionary.join(v7, v8);
    local v10 = v2.useRef(nil);
    local v11 = math.min(math.ceil(#v9.items / v9.numColumns), v9.maxNumRows);
    local v13 = v9.itemSizeBinding:map(function(v12) --[[ Line: 88 ]]
        -- upvalues: v11 (copy), v9 (copy)
        return v11 * (v12.Y + v9.verticalPadding) - v9.verticalPadding;
    end);
    local v14, v15 = v2.useState(-1);
    local v16, v17 = v2.useState(-1);
    local v18, v19 = v2.useState(v9.bufferRowsBelowScreen + v9.bufferRowsAboveScreen);
    v2.useEffect(function() --[[ Line: 101 ]]
        -- upvalues: v9 (copy), v10 (copy), v11 (copy), v15 (copy), v17 (copy), v19 (copy)
        local v20 = {};
        if v9.verticalScrollingFrameRef and v9.verticalScrollingFrameRef.current and v10.current then
            local l_current_0 = v10.current;
            local l_current_1 = v9.verticalScrollingFrameRef.current;
            local l_Y_0 = v9.itemSizeBinding:getValue().Y;
            local l_Y_1 = l_current_1.AbsolutePosition.Y;
            local l_Y_2 = l_current_1.AbsoluteWindowSize.Y;
            local v26 = math.ceil(l_Y_2 / math.max(1, l_Y_0 + v9.verticalPadding)) + 1;
            do
                local l_l_Y_1_0, l_l_Y_2_0, l_v26_0 = l_Y_1, l_Y_2, v26;
                local function _() --[[ Line: 118 ]] --[[ Name: calculateOffsetOfGrid ]]
                    -- upvalues: l_current_0 (copy), l_current_1 (copy), l_l_Y_1_0 (ref)
                    return l_current_0.AbsolutePosition.Y + l_current_1.CanvasPosition.Y - l_l_Y_1_0;
                end;
                local v31 = l_current_0.AbsolutePosition.Y + l_current_1.CanvasPosition.Y - l_l_Y_1_0;
                local function v43() --[[ Line: 125 ]] --[[ Name: updateRowsToRender ]]
                    -- upvalues: l_current_1 (copy), v9 (ref), v11 (ref), v31 (ref), l_l_Y_2_0 (ref), l_v26_0 (ref), v15 (ref), v17 (ref)
                    local l_Y_3 = l_current_1.CanvasPosition.Y;
                    local l_Y_4 = v9.itemSizeBinding:getValue().Y;
                    local v34 = math.max(1, l_Y_4 + v9.verticalPadding);
                    local v35 = v11 * (l_Y_4 + v9.verticalPadding) - v9.verticalPadding;
                    local v36 = v31 - l_Y_3;
                    local v37 = v9.bufferRowsAboveScreen * v34;
                    local v38 = v9.bufferRowsBelowScreen * v34;
                    local v39 = nil;
                    local v40 = nil;
                    if l_l_Y_2_0 + v38 < v36 or v36 + v35 < -v37 then
                        v39 = -1;
                        v40 = -1;
                    else
                        local v41 = math.floor(-v36 / v34);
                        v39 = math.max(1, v41 + 1 - v9.bufferRowsAboveScreen);
                        local v42 = l_v26_0 + v9.bufferRowsBelowScreen;
                        v42 = math.max(1, if v41 <= 0 then v42 + v41 else v42 + math.min(v41, v9.bufferRowsAboveScreen));
                        v40 = math.min(v11, v39 + v42 - 1);
                    end;
                    v15(v39);
                    v17(v40);
                end;
                local function v45() --[[ Line: 170 ]] --[[ Name: updateWindowParams ]]
                    -- upvalues: v9 (ref), l_l_Y_1_0 (ref), l_current_1 (copy), l_l_Y_2_0 (ref), v31 (ref), l_current_0 (copy), l_v26_0 (ref), v19 (ref), v11 (ref), v43 (copy)
                    local v44 = math.max(1, v9.itemSizeBinding:getValue().Y + v9.verticalPadding);
                    l_l_Y_1_0 = l_current_1.AbsolutePosition.Y;
                    l_l_Y_2_0 = l_current_1.AbsoluteWindowSize.Y;
                    v31 = l_current_0.AbsolutePosition.Y + l_current_1.CanvasPosition.Y - l_l_Y_1_0;
                    l_v26_0 = math.ceil(l_l_Y_2_0 / v44) + 1;
                    v19((math.min(v11, l_v26_0 + v9.bufferRowsBelowScreen + v9.bufferRowsAboveScreen)));
                    v43();
                end;
                table.insert(v20, l_current_1:GetPropertyChangedSignal("AbsolutePosition"):Connect(v45));
                table.insert(v20, l_current_1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(v45));
                table.insert(v20, l_current_1:GetPropertyChangedSignal("CanvasSize"):Connect(v45));
                table.insert(v20, l_current_1:GetPropertyChangedSignal("CanvasPosition"):Connect(v43));
                v45();
            end;
        else
            v15(1);
            v17(v11);
            v19(v11);
        end;
        return function() --[[ Line: 211 ]]
            -- upvalues: v20 (copy)
            for _, v47 in v20 do
                v47:Disconnect();
            end;
        end;
    end, {
        v10, 
        v11, 
        v9.itemSizeBinding, 
        v9.verticalScrollingFrameRef, 
        v9.verticalPadding, 
        v9.bufferRowsAboveScreen, 
        v9.bufferRowsBelowScreen, 
        v9.onViewableItemsChanged
    });
    v16 = math.min(v16, v11);
    local v48 = math.max(-1, (v14 - 1) * v9.numColumns + 1);
    local v49 = math.max(-1, (math.min(#v9.items, v16 * v9.numColumns)));
    v2.useEffect(function() --[[ Line: 236 ]]
        -- upvalues: v9 (copy), v48 (copy), v49 (copy)
        if v9.onViewableItemsChanged then
            v9.onViewableItemsChanged(v48, v49);
        end;
    end, {
        v48, 
        v49, 
        v9.onViewableItemsChanged
    });
    if l_FFlagSduiV2PaginationSupport_0 then
        local v50 = v2.useRef(nil);
        local l_v50_0 = v50 --[[ copy: 13 -> 14 ]];
        v2.useEffect(function() --[[ Line: 245 ]]
            -- upvalues: v16 (ref), v11 (copy), v9 (copy), l_v50_0 (copy)
            if v16 >= v11 - v9.thresholdRowsFromBottom and l_v50_0.current ~= v9.items and v9.onReachedThresholdFromEnd then
                v9.onReachedThresholdFromEnd();
                l_v50_0.current = v9.items;
            end;
        end, {
            v16, 
            v11, 
            v9.thresholdRowsFromBottom, 
            v9.onReachedThresholdFromEnd, 
            v9.items
        });
    end;
    local v70 = v2.useMemo(function() --[[ Line: 265 ]]
        -- upvalues: v14 (copy), v16 (ref), v48 (copy), v49 (copy), v9 (copy), v11 (copy), v4 (ref), v2 (ref), v5 (ref), v18 (copy)
        local v52 = {};
        if v14 <= 0 or v16 < v14 then
            return nil;
        elseif v48 <= 0 or v49 < v48 then
            return nil;
        elseif v9.numColumns <= 0 or v11 - v14 < 0 then
            return nil;
        else
            v4.assert(v14 >= 1);
            local l_assert_0 = v4.assert;
            local v54 = false;
            if v14 <= v16 then
                v54 = v16 <= v11;
            end;
            l_assert_0(v54);
            if v14 > 1 then
                l_assert_0 = v14 - 1;
                local l_l_assert_0_0 = l_assert_0 --[[ copy: 1 -> 15 ]];
                v52.Padding = v2.createElement("UIPadding", {
                    PaddingTop = v9.itemSizeBinding:map(function(v56) --[[ Line: 283 ]]
                        -- upvalues: l_l_assert_0_0 (copy), v9 (ref)
                        return UDim.new(0, l_l_assert_0_0 * (v56.Y + v9.verticalPadding));
                    end)
                });
            end;
            l_assert_0 = v11 - v14 + 1;
            v54 = v9.numColumns - 1;
            local v57 = l_assert_0 - 1;
            v4.assert(l_assert_0 >= 1);
            v4.assert(v9.numColumns >= 1);
            local v58 = UDim2.new(1 / v9.numColumns, math.floor(-(v54 / v9.numColumns) * v9.columnGap), 1 / l_assert_0, (math.floor(-(v57 / l_assert_0) * v9.verticalPadding)));
            local v59 = math.floor(v54 / v9.numColumns * v9.columnGap) * v9.numColumns - v9.columnGap * v54;
            local v60 = v9.columnGap + v59 / v54;
            v52.Layout = v2.createElement("UIGridLayout", {
                FillDirectionMaxCells = v9.numColumns, 
                CellPadding = if v9.disableRelativeGap then UDim2.new(0, v60, 0, v9.verticalPadding) else v9.itemSizeBinding:map(function(v61) --[[ Line: 313 ]]
                    -- upvalues: v5 (ref), v9 (ref)
                    local v62 = v5(v9.numColumns, v9.columnGap, v61.X, v9.sideMargin);
                    return UDim2.new(v62, 0, 0, v9.verticalPadding);
                end), 
                CellSize = v58, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            });
            v4.assert(v48 >= 1);
            local l_assert_1 = v4.assert;
            local v64 = false;
            if v48 <= v49 then
                v64 = v49 <= #v9.items;
            end;
            l_assert_1(v64);
            for v65 = v48, v49 do
                if v65 <= #v9.items then
                    local v66 = math.ceil(v65 / v9.numColumns);
                    local v67 = v9.items[v65];
                    local v68, v69 = v9.renderItem(v67, v65, UDim2.fromScale(1, 1), v66);
                    v52[("%*%*"):format(v69, v65 % (v18 * v9.numColumns))] = v68;
                end;
            end;
            return v52;
        end;
    end, {
        v9.columnGap, 
        v9.numColumns, 
        v9.itemSizeBinding, 
        v14, 
        v16, 
        v9.items, 
        v9.renderItem, 
        v9.verticalPadding, 
        v18, 
        v11, 
        v9.sideMargin, 
        v48, 
        v49, 
        v9.disableRelativeGap
    });
    return v2.createElement("Frame", {
        ref = v10, 
        Size = v13:map(function(v71) --[[ Line: 358 ]]
            return UDim2.new(1, 0, 0, v71);
        end), 
        BackgroundTransparency = 1, 
        LayoutOrder = v9.LayoutOrder, 
        Position = v9.Position
    }, v70);
end);