local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_GameTileConstants_0 = require(l_Parent_0.GameTile).GameTileConstants;
local v4 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v4.usePreferredInput;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_CollectionGrid_0 = require(l_Parent_0.CollectionViews).CollectionGrid;
local v8 = require(l_script_FirstAncestor_0.useGetGameTileHeight);
local v9 = require(l_script_FirstAncestor_0.useGameCollectionLayoutParams);
local v10 = {};
local function v15(_, _, _, _) --[[ Line: 33 ]] --[[ Name: renderItem ]]
    return nil, "placeholder";
end;
return v2.memo(function(v16) --[[ Line: 40 ]] --[[ Name: PlaceholderGameGrid ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_usePreferredInput_0 (copy), v4 (copy), v2 (copy), v9 (copy), l_GameTileConstants_0 (copy), v8 (copy), v10 (copy), l_CollectionGrid_0 (copy), v15 (copy)
    local v18 = l_useAppPolicy_0(function(v17) --[[ Line: 42 ]]
        return v17.useGridPageLayout();
    end);
    local v19 = l_usePreferredInput_0();
    local v20 = v16.isHoverSupportEnabled and v18 and v19 == v4.Input.Pointer;
    local v21 = v16.gameTileLayoutType or "Narrow";
    local v22, v23 = v2.useState(nil);
    v2.useRef(v22).current = v22;
    local v24 = if v18 then nil else {
        sideMargin = v16.sideMargin
    };
    local v25 = v9(v21, v22, false, v24);
    local v26 = v16.shouldHideTileTitle or false;
    local v27 = v16.shouldHideTileMetadata or false;
    local v28 = v16.containedTile or false;
    local v29 = l_GameTileConstants_0.TileTextLines[v21] and l_GameTileConstants_0.TileTextLines[v21].titleTextLines;
    local v30 = v8(v20, v21, v28, v27, v26, nil, nil, v29);
    local v31 = v2.useRef(0);
    v2.useEffect(function() --[[ Line: 82 ]]
        -- upvalues: v25 (copy), v31 (copy), v16 (copy)
        if v25.numColumns ~= v31.current then
            v31.current = v25.numColumns;
            if v16.onItemsPerRowChanged then
                v16.onItemsPerRowChanged(v25.numColumns);
            end;
        end;
    end, {
        v25.numColumns, 
        v16.onItemsPerRowChanged, 
        v31
    });
    local v32 = math.clamp(v16.numRows, 0, 4);
    local v35 = v2.useMemo(function() --[[ Line: 95 ]]
        -- upvalues: v25 (copy), v32 (copy), v10 (ref)
        local v33 = {};
        for _ = 1, v25.numColumns * v32 do
            table.insert(v33, v10);
        end;
        return v33;
    end, {
        v25.numColumns, 
        v32
    });
    return v2.createElement(v2.Fragment, nil, {
        GameGrid = v2.createElement(l_CollectionGrid_0, {
            title = if v32 > 0 then v16.title else nil, 
            containerRef = v23, 
            verticalScrollingFrameRef = v16.verticalScrollingFrameRef, 
            hideHeaderButton = true, 
            items = v35, 
            renderItem = v15, 
            getItemHeight = v30, 
            numColumns = v25.numColumns, 
            columnGap = v25.columnGap, 
            sideMargin = v25.sideMargin
        })
    });
end);