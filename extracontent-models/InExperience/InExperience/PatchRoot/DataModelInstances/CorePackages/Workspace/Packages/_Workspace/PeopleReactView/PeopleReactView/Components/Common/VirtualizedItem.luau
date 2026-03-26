local l_Parent_0 = script:FindFirstAncestor("PeopleReactView").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Signals);
local l_View_0 = require(l_Parent_0.Foundation).View;
return v1.memo(function(v4) --[[ Line: 24 ]] --[[ Name: VirtualizedItem ]]
    -- upvalues: v1 (copy), v2 (copy), l_View_0 (copy)
    local v5, v6 = v1.useState(-1);
    local v8 = v1.useMemo(function() --[[ Line: 27 ]]
        -- upvalues: v1 (ref), v4 (copy)
        return v1.joinBindings({
            itemWidth = v4.itemWidth, 
            itemHeight = v4.itemHeight
        }):map(function(v7) --[[ Line: 28 ]]
            return UDim2.fromOffset(v7.itemWidth, v7.itemHeight);
        end);
    end, {});
    local v9 = v1.joinBindings({
        numColumns = v4.numColumns, 
        itemWidth = v4.itemWidth, 
        itemHeight = v4.itemHeight
    });
    local v11 = v1.useMemo(function() --[[ Line: 41 ]]
        -- upvalues: v9 (copy), v5 (copy), v4 (copy)
        return v9:map(function(v10) --[[ Line: 42 ]]
            -- upvalues: v5 (ref), v4 (ref)
            return UDim2.fromOffset((v5 - 1) % v10.numColumns * (v10.itemWidth + v4.gapSize), math.floor((v5 - 1) / v10.numColumns) * (v10.itemHeight + v4.gapSize));
        end);
    end, {
        v5, 
        v4.gapSize
    });
    v1.useEffect(function() --[[ Line: 50 ]]
        -- upvalues: v2 (ref), v4 (copy), v6 (copy)
        local v17 = v2.createEffect(function(v12) --[[ Line: 53 ]]
            -- upvalues: v4 (ref), v6 (ref)
            local v13 = v4.getMinVirtualizedIndex(v12);
            local v14 = v4.getMaxVirtualizedIndex(v12) - v13 + 1;
            local v15 = (v13 - 1) % v14 + 1;
            local v16 = v13 + (v4.relativeIndex - v15) % v14;
            v6(v16);
        end);
        return function() --[[ Line: 62 ]]
            -- upvalues: v17 (copy)
            v17();
        end;
    end, {
        v4.relativeIndex, 
        v4.getMinVirtualizedIndex, 
        v4.getMaxVirtualizedIndex
    });
    return v1.createElement(l_View_0, {
        Size = v8, 
        Position = v11, 
        ZIndex = v5 == 1 and 2 or 1
    }, {
        Item = v4.getElement(v5)
    });
end);