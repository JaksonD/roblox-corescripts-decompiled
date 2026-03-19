local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v5 = require(l_Parent_0.RoactServiceTags);
local l_AppEventIngestService_0 = v5.AppEventIngestService;
local l_RoactAnalytics_0 = v5.RoactAnalytics;
local l_RoactAnalyticsCommonGameEvents_0 = v5.RoactAnalyticsCommonGameEvents;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_SongTile_0 = require(l_Parent_0.SongTile).SongTile;
local v12 = require(l_Parent_0.t);
local l_CollectionCarousel_0 = require(l_Parent_0.CollectionViews).CollectionCarousel;
local l_validateProps_0 = require(l_Parent_0.DiscoveryUtils).validateProps;
local v15 = require(l_Parent_0.GameTile);
local v16 = require(l_Parent_0.CollectionViews);
local l_usePageSideMargin_0 = v16.usePageSideMargin;
local l_useCollectionImpressionsSignal_0 = v16.useCollectionImpressionsSignal;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v22 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local l_GameSortGroups_0 = require(l_Parent_0.DiscoveryTypes).GameSortGroups;
local v24 = require(l_Parent_0.TopicInfosRodux);
local l_TopicInfosReducer_0 = v24.TopicInfosReducer;
local l_TopicInfoModel_0 = v24.TopicInfoModel;
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local v28 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v28.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v28.FetchStatusNamespace;
local v31 = require(l_Parent_0.GameCollections);
local l_useGameCollectionLayoutParams_0 = v31.useGameCollectionLayoutParams;
local l_useGameSortTooltipParams_0 = v31.useGameSortTooltipParams;
local l_useGetGameTileHeight_0 = v31.useGetGameTileHeight;
local l_ScreenSizeImpressionsTracker_0 = require(l_Parent_0.Impressions).ScreenSizeImpressionsTracker;
local v36 = require(l_Parent_0.UnifiedLogging);
local l_SendItemImpressions_0 = v36.SendItemImpressions;
local l_SendItemActionEvent_0 = v36.SendItemActionEvent;
local l_ContentType_0 = v36.ContentType;
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local l_OpenSongList_0 = require(l_Parent_0.DiscoveryRouting).OpenSongList;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local l_GameTileConstants_0 = v15.GameTileConstants;
local v45 = v12.strictInterface({
    [v22.key] = v22.interface, 
    sortIndex = v12.number, 
    isOmni = v12.optional(v12.boolean), 
    topicLayoutData = v12.optional(v12.table)
});
return function(v46) --[[ Line: 86 ]] --[[ Name: SongCarouselFeedItem ]]
    -- upvalues: l_validateProps_0 (copy), v45 (copy), v22 (copy), l_FFlagEnableTopSongsSort_0 (copy), l_useSelector_0 (copy), l_GameSortGroups_0 (copy), l_TopicInfosReducer_0 (copy), l_TopicContentsReducer_0 (copy), l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_RetrievalStatus_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_RoactAnalytics_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), v2 (copy), l_SendItemActionEvent_0 (copy), l_ContentType_0 (copy), l_SongTile_0 (copy), l_usePageSideMargin_0 (copy), l_useTextSizeOffset_0 (copy), l_useGetGameTileHeight_0 (copy), l_GameTileConstants_0 (copy), l_useGameCollectionLayoutParams_0 (copy), l_useDispatch_0 (copy), l_OpenSongList_0 (copy), l_useGameSortTooltipParams_0 (copy), l_TopicInfoModel_0 (copy), l_useCollectionImpressionsSignal_0 (copy), l_SendItemImpressions_0 (copy), l_AppPage_0 (copy), l_mutedError_0 (copy), l_CollectionCarousel_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    l_validateProps_0(v45, v46);
    local l_appPage_0 = v46[v22.key].appPage;
    assert(l_FFlagEnableTopSongsSort_0, "SongCarouselFeedItem should only be used when FFlagEnableTopSongsSort is enabled");
    local v49 = l_useSelector_0(function(v48) --[[ Line: 94 ]]
        -- upvalues: l_GameSortGroups_0 (ref)
        return v48.GameSortGroups[l_GameSortGroups_0.Games];
    end).sorts[v46.sortIndex];
    local v50 = ("TOPSONGS_CAROUSEL_$%*"):format(v49);
    local v52 = l_useSelector_0(function(v51) --[[ Line: 100 ]]
        -- upvalues: l_TopicInfosReducer_0 (ref), v49 (copy)
        return v51.Personalization[l_TopicInfosReducer_0.key][v49];
    end);
    local v54 = l_useSelector_0(function(v53) --[[ Line: 103 ]]
        -- upvalues: l_TopicContentsReducer_0 (ref), v49 (copy)
        return v53.Personalization[l_TopicContentsReducer_0.key][v49];
    end);
    local v56 = l_useSelector_0(function(v55) --[[ Line: 106 ]]
        -- upvalues: l_FetchStatusReducer_0 (ref), l_FetchStatusNamespace_0 (ref), v49 (copy), l_RetrievalStatus_0 (ref)
        return v55.Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.GameSorts][v49] or l_RetrievalStatus_0.NotStarted;
    end);
    local v58 = l_useSelector_0(function(v57) --[[ Line: 111 ]]
        -- upvalues: v49 (copy), l_TopicContentsReducer_0 (ref)
        if v49 then
            return v57.Personalization and v57.Personalization[l_TopicContentsReducer_0.key] and v57.Personalization[l_TopicContentsReducer_0.key][v49] and v57.Personalization[l_TopicContentsReducer_0.key][v49].updatedTimestamp;
        else
            return nil;
        end;
    end);
    local v59 = l_useRoactService_0(l_AppEventIngestService_0);
    local v60 = l_useRoactService_0(l_RoactAnalytics_0);
    local v61 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v62 = v54 and v54.entries or nil;
    local v65 = v2.useCallback(function(v63, v64) --[[ Line: 128 ]]
        -- upvalues: v62 (copy), l_SendItemActionEvent_0 (ref), v59 (copy), v60 (copy), l_appPage_0 (copy), v46 (copy), v49 (copy), l_ContentType_0 (ref)
        if not v62 then
            return;
        else
            l_SendItemActionEvent_0.sendFromItemCollection(v59, v60, {
                id = v63
            }, 1, v64, l_appPage_0, v46.sortIndex, v49, #v62, l_ContentType_0.Song, "OpenSongDetails");
            return;
        end;
    end, {
        v59, 
        v60, 
        v49, 
        v62, 
        v46.sortIndex, 
        l_appPage_0
    });
    local v70 = v2.useCallback(function(v66, v67, v68, _) --[[ Line: 138 ]]
        -- upvalues: v2 (ref), l_SongTile_0 (ref), v50 (copy), v65 (copy)
        return v2.createElement(l_SongTile_0, {
            contentId = v66.contentId, 
            zIndex = -v67, 
            size = v68, 
            layoutOrder = v67, 
            impressionsTag = v50, 
            reportTileOpened = function() --[[ Line: 145 ]] --[[ Name: reportTileOpened ]]
                -- upvalues: v65 (ref), v66 (copy), v67 (copy)
                v65(v66.contentId, v67);
            end
        }), "SongTile";
    end, {
        v65, 
        v50
    });
    local v71, v72 = v2.useState(nil);
    local v73 = l_usePageSideMargin_0(v71);
    local v74 = v2.useRef(nil);
    local v75 = l_useTextSizeOffset_0();
    local v76 = l_useGetGameTileHeight_0(false, "Narrow", false, false, false, v75, nil, l_GameTileConstants_0.TileTextLines.Narrow.titleTextLines);
    local v77 = l_useGameCollectionLayoutParams_0("Narrow", v71, false, {
        sideMargin = v73
    });
    local v78 = l_useDispatch_0();
    local v79 = v2.useCallback(function() --[[ Line: 176 ]]
        -- upvalues: v78 (copy), l_OpenSongList_0 (ref), v49 (copy), l_appPage_0 (copy), v61 (copy), v46 (copy)
        v78(l_OpenSongList_0(v49, l_appPage_0));
        v61.reportSeeAllWithId(v49, nil, v46.sortIndex);
    end, {
        v78, 
        v49, 
        l_appPage_0, 
        v61, 
        v46.sortIndex
    });
    local v80, v81 = l_useGameSortTooltipParams_0(v52 or l_TopicInfoModel_0.new(), false, v52 and v52.topicLayoutData and v52.topicLayoutData.infoText or nil);
    local v82 = v81 and v81 ~= "";
    local l_scrollViewPositionChangedSignal_0 = v46[v22.key].scrollViewPositionChangedSignal;
    local v84, v85 = l_useCollectionImpressionsSignal_0(l_scrollViewPositionChangedSignal_0);
    local v90 = v2.useCallback(function(v86) --[[ Line: 192 ]]
        -- upvalues: v62 (copy), l_SendItemImpressions_0 (ref), v59 (copy), v60 (copy), l_appPage_0 (copy), v46 (copy), l_ContentType_0 (ref), v49 (copy)
        if v62 ~= nil then
            local v87 = {};
            for _, v89 in ipairs(v62) do
                table.insert(v87, {
                    id = v89.contentId
                });
            end;
            l_SendItemImpressions_0.sendFromItemCollection(v59, v60, v86, v87, #v87, l_appPage_0, v46.sortIndex, l_ContentType_0.Song, #v87, nil, v49);
        end;
    end, {
        v59, 
        v60, 
        v62, 
        v49, 
        v46.sortIndex
    });
    if l_appPage_0 ~= l_AppPage_0.Games then
        l_mutedError_0("SongCarouselFeedItem should only be used on AppPage.Games");
        return nil;
    elseif not v52 or v56 ~= l_RetrievalStatus_0.Done or not v62 or #v62 == 0 then
        return nil;
    else
        return v2.createElement(v2.Fragment, nil, {
            SongCarousel = v2.createElement(l_CollectionCarousel_0, {
                columnGap = v77.columnGap, 
                containerRef = v72, 
                fractionalItemAmount = v77.fractionalItemAmount, 
                onViewableItemsChanged = v85, 
                onChangeCanvasPosition = v85, 
                getItemHeight = v76, 
                items = v62, 
                maxItemsToShow = v77.maxTilesToShow, 
                numColumns = v77.numColumns, 
                onActivateHeader = v79, 
                onActivateInfoIcon = v82 and v80 or nil, 
                renderItem = v70, 
                scrollingFrameRef = v74, 
                sideMargin = v77.sideMargin, 
                subtitle = v52.subtitle, 
                thresholdFromEnd = v77.loadMoreThreshold, 
                title = v52.displayName, 
                tooltipInfoText = v82 and v81 or nil
            }), 
            SongCarouselImpressionDetector = v2.createElement(l_ScreenSizeImpressionsTracker_0, {
                parentRef = v74, 
                pageContext = l_appPage_0, 
                impressionsTag = v50, 
                scrollViewPositionChangedSignal = v84, 
                sendImpressions = v90, 
                dataUpdatedTimestamp = v58
            })
        });
    end;
end;