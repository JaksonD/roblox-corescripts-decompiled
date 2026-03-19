local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.t);
local v2 = {
    minimumItemsPerRow = 2, 
    minimumItemWidth = 160
};
local v3 = {
    minimumItemsPerRow = 1, 
    minimumItemWidth = 332
};
local function _(v4, v5, v6) --[[ Line: 24 ]] --[[ Name: getItemMetrics ]]
    local v7 = math.floor((v4 + v5) / (v6.minimumItemWidth + v5));
    v7 = math.max(v6.minimumItemsPerRow, v7);
    local v8 = math.floor((v4 - (v7 - 1) * v5) / v7);
    return {
        itemsPerRow = v7, 
        itemWidth = v8
    };
end;
local v10 = {};
local v11 = v1.strictInterface({
    minimumItemsPerRow = v1.intersection(v1.integer, v1.numberMin(1)), 
    minimumItemWidth = v1.numberMin(0)
});
local v12 = v1.tuple(v1.numberMin(0), v1.number);
v10.makeCustomMetricsGetter = function(v13) --[[ Line: 48 ]] --[[ Name: makeCustomMetricsGetter ]]
    -- upvalues: v11 (copy), v12 (copy)
    assert(v11(v13));
    return function(v14, v15) --[[ Line: 51 ]]
        -- upvalues: v12 (ref), v13 (copy)
        assert(v12(v14, v15));
        local l_v13_0 = v13;
        local v17 = math.floor((v14 + v15) / (l_v13_0.minimumItemWidth + v15));
        v17 = math.max(l_v13_0.minimumItemsPerRow, v17);
        local v18 = math.floor((v14 - (v17 - 1) * v15) / v17);
        return {
            itemsPerRow = v17, 
            itemWidth = v18
        };
    end;
end;
v10.getLargeMetrics = v10.makeCustomMetricsGetter(v3);
v10.getMediumMetrics = v10.makeCustomMetricsGetter(v2);
v10.getSmallMetrics = function(v19, v20) --[[ Line: 60 ]] --[[ Name: getSmallMetrics ]]
    -- upvalues: v10 (copy)
    local v21 = v10.getMediumMetrics(v19, v20).itemsPerRow + 1;
    local v22 = math.floor((v19 - (v21 - 1) * v20) / v21);
    return {
        itemsPerRow = v21, 
        itemWidth = v22
    };
end;
v10.getMetricsForFixedColumns = function(v23, v24, v25) --[[ Line: 73 ]] --[[ Name: getMetricsForFixedColumns ]]
    local v26 = math.floor((v23 - (v25 - 1) * v24) / v25);
    return {
        itemsPerRow = v25, 
        itemWidth = v26
    };
end;
return v10;