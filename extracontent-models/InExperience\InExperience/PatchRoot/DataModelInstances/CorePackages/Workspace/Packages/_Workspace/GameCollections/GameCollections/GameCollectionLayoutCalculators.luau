local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.CollectionViews);
local l_GameTileViewConfig_0 = require(l_Parent_0.GameTile).GameTileViewConfig;
local l_CollectionLayoutCalculators_0 = v1.CollectionLayoutCalculators;
local _ = require(l_Parent_0.Style);
return {
    calculateNumColumns = l_CollectionLayoutCalculators_0.calculateNumColumns, 
    calculateTileHeightFromWidth = function(v5, _, v7, v8, v9, v10, v11, v12, v13, v14, v15) --[[ Line: 15 ]] --[[ Name: calculateTileHeightFromWidth ]]
        -- upvalues: l_GameTileViewConfig_0 (copy)
        return l_GameTileViewConfig_0.getTileHeight(v8, v5, v7, v9, v10, v11, v12, v13, v14, v15);
    end, 
    calculateSideMargin = l_CollectionLayoutCalculators_0.calculateSideMargin, 
    calculateColumnGap = l_CollectionLayoutCalculators_0.calculateColumnGap, 
    calculateVerticalPadding = l_CollectionLayoutCalculators_0.calculateVerticalPadding, 
    calculateFractionalItemAmount = l_CollectionLayoutCalculators_0.calculateFractionalItemAmount, 
    calculateMaxTilesToShow = l_CollectionLayoutCalculators_0.calculateMaxTilesToShow, 
    calculateLoadMoreThreshold = l_CollectionLayoutCalculators_0.calculateLoadMoreThreshold
};