local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local v1 = require(l_script_FirstAncestor_0.Utils.getFoundationMappedStyleTokens);
return function(v2) --[[ Line: 16 ]] --[[ Name: getHeadShapeListHeight ]]
    -- upvalues: v1 (copy)
    local l_tokens_0 = v2.tokens;
    local v4 = v1(l_tokens_0);
    local l_itemCount_0 = v2.itemCount;
    local l_availableViewportHeight_0 = v2.availableViewportHeight;
    local l_containerPaddingTop_0 = v4.containerPaddingTop;
    local l_containerPaddingBottom_0 = v4.containerPaddingBottom;
    local l_largeTileContainerSize_0 = v4.largeTileContainerSize;
    local l_tileListPaddingTop_0 = v4.tileListPaddingTop;
    local l_tileListPaddingBottom_0 = v4.tileListPaddingBottom;
    local l_tileListPaddingBetweenItems_0 = v4.tileListPaddingBetweenItems;
    local l_Size_1000_0 = l_tokens_0.Size.Size_1000;
    local v14 = l_tokens_0.Size.Size_800 * 2;
    local function _(v15) --[[ Line: 33 ]] --[[ Name: calculateHeightForRows ]]
        -- upvalues: l_largeTileContainerSize_0 (copy), l_tileListPaddingBetweenItems_0 (copy), l_tileListPaddingTop_0 (copy), l_tileListPaddingBottom_0 (copy)
        return l_largeTileContainerSize_0 * v15 + (if v15 > 1 then (v15 - 1) * l_tileListPaddingBetweenItems_0 else 0) + l_tileListPaddingTop_0 + l_tileListPaddingBottom_0;
    end;
    local v17 = l_largeTileContainerSize_0 * 1 + 0 + l_tileListPaddingTop_0 + l_tileListPaddingBottom_0;
    local v18 = l_largeTileContainerSize_0 * 7 + 6 * l_tileListPaddingBetweenItems_0 + l_tileListPaddingTop_0 + l_tileListPaddingBottom_0;
    local v19 = if l_itemCount_0 and l_itemCount_0 > 0 then math.ceil(l_itemCount_0 / 4) else 1;
    return (math.clamp(math.min(l_largeTileContainerSize_0 * v19 + (if v19 > 1 then (v19 - 1) * l_tileListPaddingBetweenItems_0 else 0) + l_tileListPaddingTop_0 + l_tileListPaddingBottom_0, l_availableViewportHeight_0 - (l_containerPaddingTop_0 + l_containerPaddingBottom_0 + l_Size_1000_0 + v14)), v17, v18));
end;