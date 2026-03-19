local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v5 = require(l_script_FirstAncestor_0.Common.Enums);
local v6 = require(l_script_FirstAncestor_0.Common.useCompactTileHeight);
local v7 = require(l_Parent_0.Cryo);
local v8 = require(l_Parent_0.CollectionViews);
local l_CollectionCarousel_0 = v8.CollectionCarousel;
local l_useCollectionLayoutParams_0 = v8.useCollectionLayoutParams;
local l_usePageSideMargin_0 = v8.usePageSideMargin;
local l_CollectionItemSize_0 = v8.CollectionViewTypes.CollectionItemSize;
local v13 = require(l_script_FirstAncestor_0.Hooks.useEntities);
local v14 = require(l_script_FirstAncestor_0.Hooks.useEntitySelectionHandler);
local v15 = require(l_script_FirstAncestor_0.Hooks.useRenderEntity);
local l_useIsWideMode_0 = require(l_Parent_0.SocialCommon).Hooks.useIsWideMode;
local v17 = game:DefineFastFlag("AdjustHorizontalUserListSizeForMobile", false);
return function(v18) --[[ Line: 48 ]] --[[ Name: HorizontalUserList ]]
    -- upvalues: v2 (copy), l_useIsWideMode_0 (copy), v17 (copy), l_CollectionItemSize_0 (copy), l_usePageSideMargin_0 (copy), l_useCollectionLayoutParams_0 (copy), v6 (copy), v13 (copy), v14 (copy), v15 (copy), v5 (copy), v7 (copy), l_View_0 (copy), l_CollectionCarousel_0 (copy)
    local v19, v20 = v2.useState(nil);
    local v21 = v2.useRef(nil);
    local v22 = v18.scrollingFrameRef or v21;
    local v23 = l_useIsWideMode_0();
    local v24 = if v17 then if v23 then l_CollectionItemSize_0.Small else l_CollectionItemSize_0.Medium else l_CollectionItemSize_0.Small;
    local v25 = l_usePageSideMargin_0(v19);
    local v26 = l_useCollectionLayoutParams_0(v24, v19, true, {
        sideMargin = v25
    });
    local v27 = v6();
    local v29 = v2.useCallback(function(_) --[[ Line: 63 ]]
        -- upvalues: v27 (copy)
        return v27;
    end, {
        v27
    });
    local v30 = v13(v18.entities);
    local v31 = v14(v18.onRowSelected);
    local v32 = v15({
        entitiesMap = v30.entitiesMap, 
        onActivated = v31, 
        renderRow = v18.renderRow, 
        layoutMode = v5.LayoutMode.Horizontal, 
        configs = v18.listConfigs
    });
    local v37 = v2.useCallback(function(v33, v34, v35, _) --[[ Line: 78 ]]
        -- upvalues: v32 (copy)
        return v32(v33, v34, v35), v33;
    end, {
        v32
    });
    local v41 = v2.useMemo(function() --[[ Line: 85 ]]
        -- upvalues: v18 (copy)
        local v38 = {};
        for _, v40 in v18.entities do
            table.insert(v38, v40.id);
        end;
        return v38;
    end, {
        v18.entities
    });
    local v42 = v7.Dictionary.join({}, v18.collectionCarouselConfigs or {}, {
        title = v18.header and v18.header.title or nil, 
        onActivateHeader = v18.header and v18.header.onTitleActivated or nil, 
        containerRef = v20, 
        scrollingFrameRef = v22, 
        items = v41, 
        renderItem = v37, 
        getItemHeight = v29, 
        numColumns = v26.numColumns, 
        fractionalItemAmount = v26.fractionalItemAmount, 
        columnGap = v26.columnGap, 
        sideMargin = v26.sideMargin, 
        maxItemsToShow = v26.maxTilesToShow, 
        scrollingEnabledOverride = v18.scrollEnabled
    });
    return v2.createElement(l_View_0, {
        tag = "size-0-full auto-x row", 
        LayoutOrder = v18.layoutOrder
    }, {
        v2.createElement(l_CollectionCarousel_0, v42)
    });
end;