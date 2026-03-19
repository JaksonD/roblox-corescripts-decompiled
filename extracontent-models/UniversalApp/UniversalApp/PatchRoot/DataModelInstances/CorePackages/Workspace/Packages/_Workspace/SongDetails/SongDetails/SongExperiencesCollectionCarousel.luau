local l_Parent_0 = script:FindFirstAncestor("SongDetails").Parent;
local v1 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v3 = require(l_Parent_0.RoactServiceTags);
local l_AppEventIngestService_0 = v3.AppEventIngestService;
local l_RoactAnalytics_0 = v3.RoactAnalytics;
local l_RoactAnalyticsCommonGameEvents_0 = v3.RoactAnalyticsCommonGameEvents;
local v7 = require(l_Parent_0.CollectionViews);
local l_CollectionCarousel_0 = v7.CollectionCarousel;
local l_useCollectionImpressionsSignal_0 = v7.useCollectionImpressionsSignal;
local v10 = require(l_Parent_0.DiscoveryAnalytics);
local v11 = require(l_Parent_0.Cryo);
local v12 = require(l_Parent_0.GameCollections);
local l_useGameCollectionLayoutParams_0 = v12.useGameCollectionLayoutParams;
local l_useGetGameTileHeight_0 = v12.useGetGameTileHeight;
local l_useRenderGameCollectionItem_0 = v12.useRenderGameCollectionItem;
local l_FrameBoundsImpressionsTracker_0 = require(l_Parent_0.Impressions).FrameBoundsImpressionsTracker;
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local l_SendItemImpressions_0 = require(l_Parent_0.UnifiedLogging).SendItemImpressions;
local l_ContentType_0 = require(l_Parent_0.UnifiedLogging).ContentType;
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local l_GameTileConstants_0 = require(l_Parent_0.GameTile).GameTileConstants;
local v22 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v22.usePreferredInput;
return v1.memo(function(v24) --[[ Line: 56 ]]
    -- upvalues: v1 (copy), l_useGameCollectionLayoutParams_0 (copy), l_useTextSizeOffset_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_RoactAnalytics_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_flaggedMutedError_0 (copy), v11 (copy), l_SendItemImpressions_0 (copy), l_ContentType_0 (copy), l_usePreferredInput_0 (copy), v22 (copy), l_useGetGameTileHeight_0 (copy), l_GameTileConstants_0 (copy), l_useCollectionImpressionsSignal_0 (copy), l_useRenderGameCollectionItem_0 (copy), v10 (copy), l_CollectionCarousel_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy)
    local v25, v26 = v1.useState(nil);
    local v27 = l_useGameCollectionLayoutParams_0("Narrow", v25, false, {
        fractionalItemAmount = v24.fractionalItemAmount, 
        numColumns = v24.numColumns, 
        sideMargin = v24.sideMargin
    });
    local v28 = l_useTextSizeOffset_0();
    local v29 = l_useRoactService_0(l_AppEventIngestService_0);
    local v30 = l_useRoactService_0(l_RoactAnalytics_0);
    local v31 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v32 = v1.useRef(nil);
    local v42 = v1.useCallback(function(v33) --[[ Line: 73 ]]
        -- upvalues: v24 (copy), v29 (copy), l_flaggedMutedError_0 (ref), v31 (copy)
        local l_items_0 = v24.items;
        if l_items_0 == nil or v29 == nil or v33 == nil then
            return;
        else
            local v35 = l_items_0[v33];
            if not v35 then
                l_flaggedMutedError_0("SongExperiencesCollectionCarouselMissingEntry", "Entry not found for index: " .. tostring(v33));
                return;
            else
                local l_placeId_0 = v35.placeId;
                local l_isSponsored_0 = v35.isSponsored;
                local l_adId_0 = v35.adId;
                local l_universeId_0 = v35.universeId;
                local v40 = #l_items_0;
                local l_songId_0 = v24.songId;
                v31.reportOpenGameDetailFromSongDetail(l_placeId_0, v33, v40, l_isSponsored_0, l_adId_0, l_universeId_0, v24.pageContext, l_songId_0);
                return;
            end;
        end;
    end, {
        v24.items, 
        v29, 
        v30, 
        v31, 
        v24.songId, 
        v24.pageContext
    });
    local v47 = v1.useCallback(function(v43) --[[ Line: 116 ]]
        -- upvalues: v24 (copy), v11 (ref), l_SendItemImpressions_0 (ref), v29 (copy), v30 (copy), l_ContentType_0 (ref)
        if v24.items ~= nil then
            local v44 = {};
            for _, v46 in ipairs(v24.items) do
                table.insert(v44, (v11.Dictionary.union(v46, {
                    id = v46.universeId
                })));
            end;
            l_SendItemImpressions_0.sendFromItemCollection(v29, v30, v43, v44, #v44, v24.pageContext, v24.layoutOrder, l_ContentType_0.Game, #v44, nil, v24.songId);
        end;
    end, {
        v29, 
        v30, 
        v24.items, 
        v24.songId, 
        v24.layoutOrder, 
        v24.pageContext
    });
    local v48 = l_usePreferredInput_0() == v22.Input.Pointer;
    local v49 = l_useGetGameTileHeight_0(v48, "Narrow", v48, false, false, 0, 0, l_GameTileConstants_0.TileTextLines.Narrow.titleTextLines);
    local v50, v51 = l_useCollectionImpressionsSignal_0();
    local v52 = v1.useRef(os.clock());
    v1.useEffect(function() --[[ Line: 154 ]]
        -- upvalues: v52 (copy)
        v52.current = os.clock();
    end, {
        v24.items
    });
    local v53 = l_useRenderGameCollectionItem_0(nil, false, "Narrow", true, false, v24.impressionsTag, false, v42, function() --[[ Line: 167 ]]
        error("Need to implement");
    end, v10.Constants.Context.ExperienceTile, nil, nil, nil, nil, nil, false, nil, nil, false, false, nil, nil, nil, v28, l_GameTileConstants_0.TileTextLines.Narrow.titleTextLines, nil, nil, nil, nil);
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        Size = UDim2.fromScale(1, 1), 
        ref = v26
    }, {
        GameCarousel = v1.createElement(l_CollectionCarousel_0, {
            columnGap = v27.columnGap, 
            fractionalItemAmount = v27.fractionalItemAmount, 
            getItemHeight = v49, 
            items = v24.items, 
            maxItemsToShow = v27.maxTilesToShow, 
            numColumns = v27.numColumns, 
            onViewableItemsChanged = v51, 
            onChangeCanvasPosition = v51, 
            renderItem = v53, 
            scrollingFrameRef = v32, 
            sideMargin = v27.sideMargin, 
            title = v24.title
        }), 
        SongTileImpressionsTracker = v1.createElement(l_FrameBoundsImpressionsTracker_0, {
            parentRef = v32, 
            pageContext = v24.pageContext, 
            impressionsTag = v24.impressionsTag, 
            scrollViewPositionChangedSignal = v50, 
            sendImpressions = v47, 
            dataUpdatedTimestamp = v52.current
        })
    });
end);