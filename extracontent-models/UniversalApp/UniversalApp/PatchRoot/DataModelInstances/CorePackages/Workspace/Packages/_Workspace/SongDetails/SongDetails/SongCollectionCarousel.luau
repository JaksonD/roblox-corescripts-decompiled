local l_Parent_0 = script:FindFirstAncestor("SongDetails").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.CollectionViews);
local l_CollectionCarousel_0 = v2.CollectionCarousel;
local l_useCollectionImpressionsSignal_0 = v2.useCollectionImpressionsSignal;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v6 = require(l_Parent_0.RoactServiceTags);
local l_AppEventIngestService_0 = v6.AppEventIngestService;
local l_RoactAnalytics_0 = v6.RoactAnalytics;
local v9 = require(l_Parent_0.GameCollections);
local l_useGameCollectionLayoutParams_0 = v9.useGameCollectionLayoutParams;
local l_useGetGameTileHeight_0 = v9.useGetGameTileHeight;
local l_FrameBoundsImpressionsTracker_0 = require(l_Parent_0.Impressions).FrameBoundsImpressionsTracker;
local l_SendItemImpressions_0 = require(l_Parent_0.UnifiedLogging).SendItemImpressions;
local l_SendItemActionEvent_0 = require(l_Parent_0.UnifiedLogging).SendItemActionEvent;
local l_ContentType_0 = require(l_Parent_0.UnifiedLogging).ContentType;
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local v17 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v17.usePreferredInput;
local l_SongTile_0 = require(l_Parent_0.SongTile).SongTile;
local l_FFlagSongEdpCarouselIxp_0 = require(l_Parent_0.SharedFlags).FFlagSongEdpCarouselIxp;
local l_FFlagSongCarouselPropUpdate_0 = require(l_Parent_0.SharedFlags).FFlagSongCarouselPropUpdate;
local l_FFlagUpdateSongCarouselClipDefault_0 = require(l_Parent_0.SharedFlags).FFlagUpdateSongCarouselClipDefault;
local l_GameTileConstants_0 = require(l_Parent_0.GameTile).GameTileConstants;
return v1.memo(function(v24) --[[ Line: 56 ]]
    -- upvalues: l_useTextSizeOffset_0 (copy), l_usePreferredInput_0 (copy), v17 (copy), l_useGetGameTileHeight_0 (copy), l_GameTileConstants_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_RoactAnalytics_0 (copy), v1 (copy), l_useGameCollectionLayoutParams_0 (copy), l_FFlagSongEdpCarouselIxp_0 (copy), l_SendItemActionEvent_0 (copy), l_FFlagSongCarouselPropUpdate_0 (copy), l_ContentType_0 (copy), l_SongTile_0 (copy), l_useCollectionImpressionsSignal_0 (copy), l_SendItemImpressions_0 (copy), l_FFlagUpdateSongCarouselClipDefault_0 (copy), l_CollectionCarousel_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy)
    local v25 = l_useTextSizeOffset_0();
    local v26 = l_usePreferredInput_0() == v17.Input.Pointer;
    local v27 = l_useGetGameTileHeight_0(v26, "Narrow", v26, false, false, v25, nil, l_GameTileConstants_0.TileTextLines.Narrow.titleTextLines);
    local v28 = l_useRoactService_0(l_AppEventIngestService_0);
    local v29 = l_useRoactService_0(l_RoactAnalytics_0);
    local v30, v31 = v1.useState(nil);
    local v32 = l_useGameCollectionLayoutParams_0("Narrow", v30, false, {
        numColumns = v24.numColumns, 
        sideMargin = l_FFlagSongEdpCarouselIxp_0 and 0 or nil, 
        columnGap = if l_FFlagSongEdpCarouselIxp_0 then v24.columnGap else nil, 
        fractionalItemAmount = v24.fractionalItemAmount
    });
    local v35 = v1.useCallback(function(v33, v34) --[[ Line: 81 ]]
        -- upvalues: l_SendItemActionEvent_0 (ref), v28 (copy), v29 (copy), v24 (copy), l_FFlagSongCarouselPropUpdate_0 (ref), l_ContentType_0 (ref)
        l_SendItemActionEvent_0.sendFromItemCollection(v28, v29, {
            id = v33
        }, 1, v34, v24.pageContext, if l_FFlagSongCarouselPropUpdate_0 then v24.collectionOrder else v24.layoutOrder, v24.referralId, #v24.songIds, l_ContentType_0.Song, "OpenSongDetails");
    end, {
        v28, 
        v29, 
        if l_FFlagSongCarouselPropUpdate_0 then v24.collectionOrder else v24.layoutOrder, 
        v24.title, 
        v24.songIds, 
        v24.pageContext, 
        v24.referralId
    });
    local v40 = v1.useCallback(function(v36, v37, v38, _) --[[ Line: 107 ]]
        -- upvalues: v1 (ref), l_SongTile_0 (ref), v26 (copy), v24 (copy), v35 (copy)
        return v1.createElement(l_SongTile_0, {
            contentId = v36, 
            hasBackground = v26, 
            impressionsTag = v24.impressionsTag, 
            layoutOrder = v37, 
            size = v38, 
            zIndex = -v37, 
            useLargerFooterFont = v26, 
            reportTileOpened = function() --[[ Line: 116 ]] --[[ Name: reportTileOpened ]]
                -- upvalues: v35 (ref), v36 (copy), v37 (copy)
                v35(v36, v37);
            end
        }), "SongTile";
    end, {
        v26, 
        v24.impressionsTag, 
        v35
    });
    local v41 = v1.useRef(nil);
    local v42, v43 = l_useCollectionImpressionsSignal_0();
    local v44 = v1.useRef(os.clock());
    v1.useEffect(function() --[[ Line: 127 ]]
        -- upvalues: v44 (copy)
        v44.current = os.clock();
    end, {
        v24.songIds
    });
    local v49 = v1.useCallback(function(v45) --[[ Line: 131 ]]
        -- upvalues: v24 (copy), l_SendItemImpressions_0 (ref), v28 (copy), v29 (copy), l_FFlagSongCarouselPropUpdate_0 (ref), l_ContentType_0 (ref)
        if not v24.songIds then
            return;
        else
            local v46 = {};
            for _, v48 in ipairs(v24.songIds) do
                table.insert(v46, {
                    id = v48
                });
            end;
            l_SendItemImpressions_0.sendFromItemCollection(v28, v29, v45, v46, #v46, v24.pageContext, if l_FFlagSongCarouselPropUpdate_0 then v24.collectionOrder else v24.layoutOrder, l_ContentType_0.Song, #v46, nil, v24.referralId);
            return;
        end;
    end, {
        v28, 
        v29, 
        v24.songIds, 
        v24.title, 
        if l_FFlagSongCarouselPropUpdate_0 then v24.collectionOrder else v24.layoutOrder, 
        v24.pageContext
    });
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = not l_FFlagSongEdpCarouselIxp_0 and not l_FFlagUpdateSongCarouselClipDefault_0 or v24.clipsDescendants or false, 
        Size = UDim2.fromScale(1, 1), 
        ref = v31
    }, {
        Carousel = v1.createElement(l_CollectionCarousel_0, {
            columnGap = v32.columnGap, 
            fractionalItemAmount = v32.fractionalItemAmount, 
            getItemHeight = v27, 
            items = v24.songIds, 
            maxItemsToShow = v32.maxTilesToShow, 
            numColumns = v32.numColumns, 
            onViewableItemsChanged = v43, 
            onChangeCanvasPosition = v43, 
            renderItem = v40, 
            scrollingFrameRef = v41, 
            title = v24.title
        }), 
        SongTileImpressionsTracker = v1.createElement(l_FrameBoundsImpressionsTracker_0, {
            parentRef = v41, 
            pageContext = v24.pageContext, 
            impressionsTag = v24.impressionsTag, 
            scrollViewPositionChangedSignal = v42, 
            sendImpressions = v49, 
            dataUpdatedTimestamp = v44.current
        })
    });
end);