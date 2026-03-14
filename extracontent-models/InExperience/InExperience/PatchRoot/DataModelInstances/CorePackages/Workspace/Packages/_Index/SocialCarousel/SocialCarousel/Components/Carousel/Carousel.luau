local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.CollectionViews);
local v4 = require(l_Parent_0.Localization);
local l_CollectionCarousel_0 = v3.CollectionCarousel;
local l_useCollectionLayoutParams_0 = v3.useCollectionLayoutParams;
local l_CollectionViewTypes_0 = v3.CollectionViewTypes;
local l_usePageSideMargin_0 = v3.usePageSideMargin;
local l_CollectionItemSize_0 = l_CollectionViewTypes_0.CollectionItemSize;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local v11 = require(l_script_FirstAncestor_0.Common.TileComponents);
local v12 = require(l_script_FirstAncestor_0.Common.Constants);
local v13 = require(l_script_FirstAncestor_0.Contexts.useSocialCarouselContext);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v16 = require(l_script_FirstAncestor_0.Analytics.useTilesSeenCollection);
local v17 = game:DefineFastFlag("FixCarouselTileSizeScaling", false);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagFlyoutHideFriendsHeader);
local l_FlyoutSidePanelIXP_0 = require(l_Parent_0.SharedExperimentDefinition).FlyoutSidePanelIXP;
local l_FFlagRemoveFriendsRenameInfoModal_0 = require(l_Parent_0.SharedFlags).FFlagRemoveFriendsRenameInfoModal;
return function(v21) --[[ Line: 32 ]] --[[ Name: Carousel ]]
    -- upvalues: v17 (copy), l_useTokens_0 (copy), v13 (copy), v16 (copy), v2 (copy), l_useAppPolicy_0 (copy), v12 (copy), l_useLocalization_0 (copy), l_FFlagRemoveFriendsRenameInfoModal_0 (copy), l_usePageSideMargin_0 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), v11 (copy), l_CollectionCarousel_0 (copy), v18 (copy), l_FlyoutSidePanelIXP_0 (copy)
    local v22 = if v17 then l_useTokens_0() else nil;
    local v23 = v13();
    local v24 = v16();
    local v25, v26 = v2.useState(nil);
    local v27 = v2.useRef(nil);
    local v28 = v2.useRef({
        startIndex = 1, 
        endIndex = 1
    });
    local v29 = v2.useRef(false);
    local v30 = v2.useRef(nil);
    local v31 = v2.useRef(nil);
    local v33 = l_useAppPolicy_0(function(v32) --[[ Line: 42 ]]
        return v32.getRenameFriendsToConnections();
    end);
    local v34 = nil;
    v34 = if v33 then if v23.friendCount == 0 then v12.LOCALIZATION.CONNECTIONS_LABEL else {
        v12.LOCALIZATION.CONNECTIONS_LABEL_WITH_COUNT; 
        connectionCount = v23.friendCount
    } else if v23.friendCount == 0 then v12.LOCALIZATION.FRIENDS_LABEL else {
        v12.LOCALIZATION.FRIENDS_LABEL_WITH_COUNT; 
        friendCount = v23.friendCount
    };
    local v35 = l_useLocalization_0({
        friendsLabel = v34, 
        friendsAreNowConnections = if l_FFlagRemoveFriendsRenameInfoModal_0 then nil else v12.LOCALIZATION.FRIENDS_ARE_NOW_CONNECTIONS
    });
    local v36 = l_usePageSideMargin_0(v25);
    local v37 = l_useCollectionLayoutParams_0(l_CollectionItemSize_0.XSmall, v25, true, {
        sideMargin = v36
    });
    v2.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v37 (copy), v30 (copy), v29 (copy), v31 (copy)
        if v37.numColumns ~= v30.current then
            v30.current = v37.numColumns;
            v29.current = false;
            if v31.current then
                pcall(task.cancel, v31.current);
            end;
            v31.current = task.delay(0.2, function() --[[ Line: 81 ]]
                -- upvalues: v29 (ref), v31 (ref)
                v29.current = true;
                v31.current = nil;
            end);
        end;
    end, {
        v37.numColumns
    });
    v2.useEffect(function() --[[ Line: 88 ]]
        -- upvalues: v31 (copy)
        return function() --[[ Line: 89 ]]
            -- upvalues: v31 (ref)
            if v31.current then
                pcall(task.cancel, v31.current);
            end;
        end;
    end, {});
    local v39 = v2.useCallback(function(v38) --[[ Line: 96 ]]
        -- upvalues: v17 (ref), v12 (ref), v22 (copy)
        return v38 + if v17 then v12.TILE_TEXT_HEIGHT * v22.Config.UI.Scale else v12.TILE_TEXT_HEIGHT;
    end, {});
    local l_selectionOrderBase_0 = v23.selectionOrderBase;
    local v47 = v2.useCallback(function(v41, v42, v43) --[[ Line: 106 ]]
        -- upvalues: l_selectionOrderBase_0 (copy), v11 (ref), v21 (copy)
        local v44 = if l_selectionOrderBase_0 then l_selectionOrderBase_0 + v42 else nil;
        return v11[v41.tileType](v41, v42, v43, v44, function(v45, v46) --[[ Line: 113 ]]
            -- upvalues: v21 (ref), v41 (copy)
            if v21.onTileContentChanged then
                v21.onTileContentChanged(v45, v46, v41);
            end;
        end), v41.tileType;
    end, {
        l_selectionOrderBase_0, 
        v21.onTileContentChanged
    });
    local v60 = v2.useCallback(function(v48, v49) --[[ Line: 128 ]]
        -- upvalues: v23 (copy), v25 (copy), v27 (copy), v29 (copy), v37 (copy), v28 (copy), v24 (copy)
        if v23.unifiedLogging then
            v23.unifiedLogging.onCollectionViewabilityChanged(v48, v49);
        end;
        if v23.tiles and v25 and v27.current and v29.current then
            local l_current_0 = v27.current;
            local l_AbsoluteSize_0 = v25.AbsoluteSize;
            local l_CanvasPosition_0 = l_current_0.CanvasPosition;
            local v53 = l_AbsoluteSize_0.X / v37.numColumns;
            local l_X_0 = l_CanvasPosition_0.X;
            local l_X_1 = l_AbsoluteSize_0.X;
            local v56 = math.max(1, math.floor(l_X_0 / v53) + 1);
            local v57 = math.min(#v23.tiles, (math.ceil((l_X_0 + l_X_1) / v53)));
            v28.current = {
                startIndex = v56, 
                endIndex = v57
            };
            for v58 = v56, v57 do
                local v59 = v23.tiles[v58];
                if v59 and v59.id then
                    v24.addTileToCollection(v59.id, v58, v59);
                end;
            end;
        end;
    end, {
        v21.onViewableItemsChanged, 
        v23.tiles, 
        v25, 
        v27, 
        v37, 
        v24
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
            tooltipInfoText = if l_FFlagRemoveFriendsRenameInfoModal_0 then nil else v35.friendsAreNowConnections, 
            onActivateInfoIcon = if l_FFlagRemoveFriendsRenameInfoModal_0 then nil else if v33 then v21.onActivateInfoIcon else nil, 
            containerRef = v26, 
            scrollingFrameRef = v27, 
            LayoutOrder = 1, 
            title = v35.friendsLabel, 
            items = v23.tiles, 
            renderItem = v47, 
            getItemHeight = v39, 
            numColumns = v37.numColumns, 
            fractionalItemAmount = v37.fractionalItemAmount, 
            columnGap = v37.columnGap, 
            sideMargin = v37.sideMargin, 
            maxItemsToShow = v37.maxTilesToShow, 
            thresholdFromEnd = v37.loadMoreThreshold, 
            onViewableItemsChanged = v60, 
            onChangeCanvasPosition = if v23.unifiedLogging then v23.unifiedLogging.onCollectionViewabilityChanged else nil, 
            onActivateHeader = v21.onActivateHeader, 
            headerComponent = if not not v23.hideCarouselHeader or v18 and l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() then v2.createElement(v2.Fragment, nil, {}) else nil
        }), 
        ScreenSizeImpressionsTracker = if v23.unifiedLogging then v23.unifiedLogging.renderImpressionsTrackerComponent(v27) else nil
    });
end;