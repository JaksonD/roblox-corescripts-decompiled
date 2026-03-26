local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.CollectionViews);
local v4 = require(l_Parent_0.Localization);
local l_CollectionCarousel_0 = v3.CollectionCarousel;
local l_useCollectionLayoutParams_0 = v3.useCollectionLayoutParams;
local l_useCollectionLayout_0 = v3.useCollectionLayout;
local l_CollectionViewTypes_0 = v3.CollectionViewTypes;
local l_usePageSideMargin_0 = v3.usePageSideMargin;
local l_CollectionItemSize_0 = l_CollectionViewTypes_0.CollectionItemSize;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local v12 = require(l_script_FirstAncestor_0.Common.TileComponents);
local v13 = require(l_script_FirstAncestor_0.Common.Constants);
local v14 = require(l_script_FirstAncestor_0.Contexts.useSocialCarouselContext);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v16 = require(l_script_FirstAncestor_0.Analytics.useTilesSeenCollection);
local v17 = game:DefineFastFlag("FixCarouselTileSizeScaling", false);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagFlyoutHideFriendsHeader);
local l_FlyoutSidePanelIXP_0 = require(l_Parent_0.SharedExperimentDefinition).FlyoutSidePanelIXP;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local l_FFlagRemoveFriendsRenameInfoModal_0 = require(l_Parent_0.SharedFlags).FFlagRemoveFriendsRenameInfoModal;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
return function(v24) --[[ Line: 37 ]] --[[ Name: Carousel ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v17 (copy), l_useTokens_0 (copy), v14 (copy), v16 (copy), v2 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v13 (copy), l_useLocalization_0 (copy), l_FFlagRemoveFriendsRenameInfoModal_0 (copy), l_usePageSideMargin_0 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_useCollectionLayout_0 (copy), v12 (copy), l_CollectionCarousel_0 (copy), v18 (copy), l_FlyoutSidePanelIXP_0 (copy)
    local v25 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v24.appCompositionEnabled;
    local v26 = if v17 then l_useTokens_0() else nil;
    local v27 = v14();
    local v28 = v16();
    local v29, v30 = v2.useState(nil);
    local v31 = v2.useRef(nil);
    local v32 = v2.useRef({
        startIndex = 1, 
        endIndex = 1
    });
    local v33 = v2.useRef(false);
    local v34 = v2.useRef(nil);
    local v35 = v2.useRef(nil);
    local v36 = nil;
    v36 = if not l_FFlagConnectionsToFriendsRename_0 then if v27.friendCount == 0 then v13.LOCALIZATION.CONNECTIONS_LABEL else {
        v13.LOCALIZATION.CONNECTIONS_LABEL_WITH_COUNT; 
        connectionCount = v27.friendCount
    } else if v27.friendCount == 0 then v13.LOCALIZATION.FRIENDS_LABEL else {
        v13.LOCALIZATION.FRIENDS_LABEL_WITH_COUNT; 
        friendCount = v27.friendCount
    };
    local v37 = l_useLocalization_0({
        friendsLabel = v36, 
        friendsAreNowConnections = if l_FFlagRemoveFriendsRenameInfoModal_0 then nil else v13.LOCALIZATION.FRIENDS_ARE_NOW_CONNECTIONS
    });
    local v38 = if not l_FFlagLuaAppCompositionAlways_0 then l_usePageSideMargin_0(v29) else nil;
    local v39 = l_useCollectionLayoutParams_0(l_CollectionItemSize_0.XSmall, v29, true, {
        sideMargin = if v25 then nil else v38
    });
    local v40 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v40 = l_useCollectionLayout_0(l_CollectionItemSize_0.XSmall).itemsPerRow;
    end;
    local v41 = if v25 then v40 else v39.numColumns;
    v2.useEffect(function() --[[ Line: 85 ]]
        -- upvalues: v41 (copy), v34 (copy), v33 (copy), v35 (copy)
        if v41 ~= v34.current then
            v34.current = v41;
            v33.current = false;
            if v35.current then
                pcall(task.cancel, v35.current);
            end;
            v35.current = task.delay(0.2, function() --[[ Line: 94 ]]
                -- upvalues: v33 (ref), v35 (ref)
                v33.current = true;
                v35.current = nil;
            end);
        end;
    end, {
        if l_FFlagLuaAppCompositionSupport_0 then v41 else v39.numColumns
    });
    v2.useEffect(function() --[[ Line: 101 ]]
        -- upvalues: v35 (copy)
        return function() --[[ Line: 102 ]]
            -- upvalues: v35 (ref)
            if v35.current then
                pcall(task.cancel, v35.current);
            end;
        end;
    end, {});
    local v43 = v2.useCallback(function(v42) --[[ Line: 109 ]]
        -- upvalues: v17 (ref), v13 (ref), v26 (copy)
        return v42 + if v17 then v13.TILE_TEXT_HEIGHT * v26.Config.UI.Scale else v13.TILE_TEXT_HEIGHT;
    end, {});
    local l_selectionOrderBase_0 = v27.selectionOrderBase;
    local v51 = v2.useCallback(function(v45, v46, v47) --[[ Line: 119 ]]
        -- upvalues: l_selectionOrderBase_0 (copy), v12 (ref), v24 (copy)
        local v48 = if l_selectionOrderBase_0 then l_selectionOrderBase_0 + v46 else nil;
        return v12[v45.tileType](v45, v46, v47, v48, function(v49, v50) --[[ Line: 126 ]]
            -- upvalues: v24 (ref), v45 (copy)
            if v24.onTileContentChanged then
                v24.onTileContentChanged(v49, v50, v45);
            end;
        end), v45.tileType;
    end, {
        l_selectionOrderBase_0, 
        v24.onTileContentChanged
    });
    local v64 = v2.useCallback(function(v52, v53) --[[ Line: 141 ]]
        -- upvalues: v27 (copy), v29 (copy), v31 (copy), v33 (copy), v41 (copy), v32 (copy), v28 (copy)
        if v27.unifiedLogging then
            v27.unifiedLogging.onCollectionViewabilityChanged(v52, v53);
        end;
        if v27.tiles and v29 and v31.current and v33.current then
            local l_current_0 = v31.current;
            local l_AbsoluteSize_0 = v29.AbsoluteSize;
            local l_CanvasPosition_0 = l_current_0.CanvasPosition;
            local v57 = l_AbsoluteSize_0.X / v41;
            local l_X_0 = l_CanvasPosition_0.X;
            local l_X_1 = l_AbsoluteSize_0.X;
            local v60 = math.max(1, math.floor(l_X_0 / v57) + 1);
            local v61 = math.min(#v27.tiles, (math.ceil((l_X_0 + l_X_1) / v57)));
            v32.current = {
                startIndex = v60, 
                endIndex = v61
            };
            for v62 = v60, v61 do
                local v63 = v27.tiles[v62];
                if v63 and v63.id then
                    v28.addTileToCollection(v63.id, v62, v63);
                end;
            end;
        end;
    end, {
        v24.onViewableItemsChanged, 
        v27.tiles, 
        v29, 
        v31, 
        if l_FFlagLuaAppCompositionSupport_0 then v41 else v39, 
        v28
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 0), 
            PaddingRight = UDim.new(0, 0)
        }), 
        CollectionCarousel = v2.createElement(l_CollectionCarousel_0, {
            tooltipInfoText = if l_FFlagRemoveFriendsRenameInfoModal_0 then nil else v37.friendsAreNowConnections, 
            onActivateInfoIcon = if l_FFlagRemoveFriendsRenameInfoModal_0 then nil else if l_FFlagConnectionsToFriendsRename_0 then nil else v24.onActivateInfoIcon, 
            containerRef = v30, 
            scrollingFrameRef = v31, 
            LayoutOrder = 1, 
            title = v37.friendsLabel, 
            items = v27.tiles, 
            renderItem = v51, 
            getItemHeight = v43, 
            collectionItemSize = if v25 then l_CollectionItemSize_0.XSmall else nil, 
            numColumns = if v25 then nil else v39.numColumns, 
            fractionalItemAmount = if v25 then nil else v39.fractionalItemAmount, 
            columnGap = if v25 then nil else v39.columnGap, 
            sideMargin = if v25 then nil else v39.sideMargin, 
            maxItemsToShow = v39.maxTilesToShow, 
            thresholdFromEnd = v39.loadMoreThreshold, 
            onViewableItemsChanged = v64, 
            onChangeCanvasPosition = if v27.unifiedLogging then v27.unifiedLogging.onCollectionViewabilityChanged else nil, 
            onActivateHeader = v24.onActivateHeader, 
            headerComponent = if not not v27.hideCarouselHeader or v18 and l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() then v2.createElement(v2.Fragment, nil, {}) else nil
        }), 
        ScreenSizeImpressionsTracker = if v27.unifiedLogging then v27.unifiedLogging.renderImpressionsTrackerComponent(v31) else nil
    });
end;