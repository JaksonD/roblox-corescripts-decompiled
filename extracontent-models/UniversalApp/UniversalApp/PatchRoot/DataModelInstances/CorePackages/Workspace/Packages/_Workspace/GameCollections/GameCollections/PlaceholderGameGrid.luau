local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_GameTileConstants_0 = require(l_Parent_0.GameTile).GameTileConstants;
local v4 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v4.usePreferredInput;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v7 = require(l_Parent_0.CollectionViews);
local l_CollectionGrid_0 = v7.CollectionGrid;
local l_useCollectionLayout_0 = v7.useCollectionLayout;
local v10 = require(l_script_FirstAncestor_0.useGetGameTileHeight);
local v11 = require(l_script_FirstAncestor_0.useGameCollectionLayoutParams);
local l_getGameTileCollectionItemSize_0 = require(l_Parent_0.GameTile).getGameTileCollectionItemSize;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local v15 = {};
local function v20(_, _, _, _) --[[ Line: 41 ]] --[[ Name: renderItem ]]
    return nil, "placeholder";
end;
return v2.memo(function(v21) --[[ Line: 48 ]] --[[ Name: PlaceholderGameGrid ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_usePreferredInput_0 (copy), v4 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_getGameTileCollectionItemSize_0 (copy), v2 (copy), v11 (copy), l_useCollectionLayout_0 (copy), l_GameTileConstants_0 (copy), v10 (copy), v15 (copy), l_CollectionGrid_0 (copy), v20 (copy)
    local v23 = l_useAppPolicy_0(function(v22) --[[ Line: 50 ]]
        return v22.useGridPageLayout();
    end);
    local v24 = l_usePreferredInput_0();
    local v25 = v21.isHoverSupportEnabled and v23 and v24 == v4.Input.Pointer;
    local v26 = v21.gameTileLayoutType or "Narrow";
    local v27 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v21.appCompositionEnabled;
    local v28 = if v27 then l_getGameTileCollectionItemSize_0(v26) else nil;
    local v29, v30 = v2.useState(nil);
    v2.useRef(v29).current = v29;
    local v31 = if v23 then nil else {
        sideMargin = v21.sideMargin
    };
    local v32 = v11(v26, v29, false, v31);
    local v33 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v33 = l_useCollectionLayout_0(v28).itemsPerRow;
    end;
    local v34 = if v27 then v33 else v32.numColumns;
    local v35 = v21.shouldHideTileTitle or false;
    local v36 = v21.shouldHideTileMetadata or false;
    local v37 = v21.containedTile or false;
    local v38 = l_GameTileConstants_0.TileTextLines[v26] and l_GameTileConstants_0.TileTextLines[v26].titleTextLines;
    local v39 = v10(v25, v26, v37, v36, v35, nil, nil, v38);
    if not l_FFlagLuaAppCompositionAlways_0 then
        local v40 = v2.useRef(0);
        local l_v40_0 = v40 --[[ copy: 19 -> 21 ]];
        v2.useEffect(function() --[[ Line: 105 ]]
            -- upvalues: v27 (copy), v32 (copy), l_v40_0 (copy), v21 (copy)
            if not v27 and v32.numColumns ~= l_v40_0.current then
                l_v40_0.current = v32.numColumns;
                if v21.onItemsPerRowChanged then
                    v21.onItemsPerRowChanged(v32.numColumns);
                end;
            end;
        end, {
            v32.numColumns, 
            v21.onItemsPerRowChanged, 
            v40, 
            if l_FFlagLuaAppCompositionSupport_0 then v27 else nil
        });
    end;
    local v42 = math.clamp(v21.numRows, 0, 4);
    local v45 = v2.useMemo(function() --[[ Line: 128 ]]
        -- upvalues: v34 (copy), v42 (copy), v15 (ref)
        local v43 = {};
        for _ = 1, v34 * v42 do
            table.insert(v43, v15);
        end;
        return v43;
    end, {
        if l_FFlagLuaAppCompositionSupport_0 then v34 else v32.numColumns, 
        v42
    });
    return v2.createElement(v2.Fragment, nil, {
        GameGrid = v2.createElement(l_CollectionGrid_0, {
            collectionItemSize = if v27 then v28 else nil, 
            title = if v42 > 0 then v21.title else nil, 
            containerRef = v30, 
            verticalScrollingFrameRef = v21.verticalScrollingFrameRef, 
            hideHeaderButton = true, 
            items = v45, 
            renderItem = v20, 
            getItemHeight = v39, 
            numColumns = if v27 then nil else v32.numColumns, 
            columnGap = if v27 then nil else v32.columnGap, 
            sideMargin = if v27 then nil else v32.sideMargin
        })
    });
end);