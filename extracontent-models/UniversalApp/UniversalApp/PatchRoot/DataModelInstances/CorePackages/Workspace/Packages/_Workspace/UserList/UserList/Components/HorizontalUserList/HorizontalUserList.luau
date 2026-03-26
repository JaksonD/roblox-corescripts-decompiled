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
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
return function(v20) --[[ Line: 51 ]] --[[ Name: HorizontalUserList ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v2 (copy), l_useIsWideMode_0 (copy), v17 (copy), l_CollectionItemSize_0 (copy), l_usePageSideMargin_0 (copy), l_useCollectionLayoutParams_0 (copy), v6 (copy), v13 (copy), v14 (copy), v15 (copy), v5 (copy), v7 (copy), l_View_0 (copy), l_CollectionCarousel_0 (copy)
    local v21 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v20.appCompositionEnabled;
    local v22, v23 = v2.useState(nil);
    local v24 = v2.useRef(nil);
    local v25 = v20.scrollingFrameRef or v24;
    local v26 = l_useIsWideMode_0();
    local v27 = if v17 then if v26 then l_CollectionItemSize_0.Small else l_CollectionItemSize_0.Medium else l_CollectionItemSize_0.Small;
    local v28 = if not l_FFlagLuaAppCompositionAlways_0 then l_usePageSideMargin_0(v22) else nil;
    local v29 = l_useCollectionLayoutParams_0(v27, v22, true, {
        sideMargin = if v21 then nil else v28
    });
    local v30 = v6();
    local v32 = v2.useCallback(function(_) --[[ Line: 69 ]]
        -- upvalues: v30 (copy)
        return v30;
    end, {
        v30
    });
    local v33 = v13(v20.entities);
    local v34 = v14(v20.onRowSelected);
    local v35 = v15({
        entitiesMap = v33.entitiesMap, 
        onActivated = v34, 
        renderRow = v20.renderRow, 
        layoutMode = v5.LayoutMode.Horizontal, 
        configs = v20.listConfigs
    });
    local v40 = v2.useCallback(function(v36, v37, v38, _) --[[ Line: 84 ]]
        -- upvalues: v35 (copy)
        return v35(v36, v37, v38), v36;
    end, {
        v35
    });
    local v44 = v2.useMemo(function() --[[ Line: 91 ]]
        -- upvalues: v20 (copy)
        local v41 = {};
        for _, v43 in v20.entities do
            table.insert(v41, v43.id);
        end;
        return v41;
    end, {
        v20.entities
    });
    local v45 = v7.Dictionary.join({}, v20.collectionCarouselConfigs or {}, {
        title = v20.header and v20.header.title or nil, 
        onActivateHeader = v20.header and v20.header.onTitleActivated or nil, 
        containerRef = v23, 
        scrollingFrameRef = v25, 
        items = v44, 
        renderItem = v40, 
        getItemHeight = v32, 
        collectionItemSize = if v21 then v27 else nil, 
        numColumns = if v21 then nil else v29.numColumns, 
        fractionalItemAmount = if v21 then nil else v29.fractionalItemAmount, 
        columnGap = if v21 then nil else v29.columnGap, 
        sideMargin = if v21 then nil else v29.sideMargin, 
        maxItemsToShow = v29.maxTilesToShow, 
        scrollingEnabledOverride = v20.scrollEnabled
    });
    return v2.createElement(l_View_0, {
        tag = "size-0-full auto-x row", 
        LayoutOrder = v20.layoutOrder
    }, {
        v2.createElement(l_CollectionCarousel_0, v45)
    });
end;