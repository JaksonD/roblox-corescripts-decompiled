local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ArgCheck);
return v1.memo(function(v3) --[[ Line: 36 ]] --[[ Name: RowOfCollectionItems ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v18 = v1.useMemo(function() --[[ Line: 38 ]]
        -- upvalues: v3 (copy), v1 (ref), v2 (ref)
        if v3.numToRender == 0 or v3.numItemsForSizing == 0 then
            return nil;
        else
            local v4 = v3.startingIndex - 1;
            local v5 = {};
            local l_numItemsForSizing_0 = v3.numItemsForSizing;
            local v7 = l_numItemsForSizing_0 - 1;
            local v8 = math.floor(v7 / l_numItemsForSizing_0 * v3.columnGap);
            local v9 = UDim2.new(1 / l_numItemsForSizing_0, -v8, 1, 0);
            local v10 = v8 * l_numItemsForSizing_0 - v3.columnGap * v7;
            local v11 = v3.columnGap + v10 / v7;
            v5.Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, v11), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            });
            if v4 > 0 then
                v5.Padding = v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(v4 * v9.X.Scale, (v4 - 1) * v11 + v4 * v9.X.Offset, 0, 0), 
                    LayoutOrder = 0
                });
            end;
            local l_assert_0 = v2.assert;
            local v13 = false;
            if v3.startingIndex >= 1 then
                v13 = v3.startingIndex <= #v3.items;
            end;
            l_assert_0(v13);
            l_assert_0 = v2.assert;
            v13 = false;
            if v3.endingIndex >= v3.startingIndex then
                v13 = v3.endingIndex <= #v3.items;
            end;
            l_assert_0(v13);
            for v14 = v3.startingIndex, v3.endingIndex do
                if v14 >= 1 and v14 <= #v3.items then
                    local v15 = v3.items[v14];
                    local v16, v17 = v3.renderItem(v15, v14, v9);
                    v5[v17 .. tostring(v14 % v3.numToRender + 1)] = v16;
                end;
            end;
            return v5;
        end;
    end, {
        v3.columnGap, 
        v3.startingIndex, 
        v3.endingIndex, 
        v3.items, 
        v3.numToRender, 
        v3.renderItem, 
        v3.sideMargin, 
        v3.totalItemsOnCanvas, 
        v3.numItemsForSizing
    });
    return v1.createElement(v1.Fragment, nil, v18);
end);