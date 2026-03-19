local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local v1 = require(l_script_FirstAncestor_0.calculateSpacePerItem);
return function(v2, v3, v4, v5, v6, v7) --[[ Line: 14 ]] --[[ Name: calculateCarouselSpacingMetrics ]]
    -- upvalues: v1 (copy)
    if v3 <= 0 then
        return {
            containerWidth = v2, 
            effectiveWidth = 0, 
            stride = 0, 
            renderedItemWidth = 0, 
            renderedGap = 0
        };
    else
        local v8 = v2 - v5 - v6 * v7;
        local v9 = v1(v3, v4);
        local v10 = math.floor(v8 / v3 + 0.5) - v9.gapOffsetPerItem;
        local v11 = math.floor(v9.adjustedGap + 0.5);
        return {
            containerWidth = v2, 
            effectiveWidth = v8, 
            stride = v10 + v11, 
            renderedItemWidth = v10, 
            renderedGap = v11
        };
    end;
end;