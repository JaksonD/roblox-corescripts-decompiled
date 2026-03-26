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
local v13 = require(l_Parent_0.CollectionViews);
local l_CollectionCarousel_0 = v13.CollectionCarousel;
local l_CollectionItemSize_0 = v13.CollectionViewTypes.CollectionItemSize;
local l_usePageSideMargin_0 = v13.usePageSideMargin;
local l_useCollectionImpressionsSignal_0 = v13.useCollectionImpressionsSignal;
local l_validateProps_0 = require(l_Parent_0.DiscoveryUtils).validateProps;
local v19 = require(l_Parent_0.GameTile);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v23 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local l_GameSortGroups_0 = require(l_Parent_0.DiscoveryTypes).GameSortGroups;
local v25 = require(l_Parent_0.TopicInfosRodux);
local l_TopicInfosReducer_0 = v25.TopicInfosReducer;
local l_TopicInfoModel_0 = v25.TopicInfoModel;
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local v29 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v29.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v29.FetchStatusNamespace;
local v32 = require(l_Parent_0.GameCollections);
local l_useGameCollectionLayoutParams_0 = v32.useGameCollectionLayoutParams;
local l_useGameSortTooltipParams_0 = v32.useGameSortTooltipParams;
local l_useGetGameTileHeight_0 = v32.useGetGameTileHeight;
local v36 = require(l_Parent_0.Impressions);
local l_ScreenSizeImpressionsTracker_0 = v36.ScreenSizeImpressionsTracker;
local l_FrameBoundsImpressionsTracker_0 = v36.FrameBoundsImpressionsTracker;
local v39 = require(l_Parent_0.UnifiedLogging);
local l_SendItemImpressions_0 = v39.SendItemImpressions;
local l_SendItemActionEvent_0 = v39.SendItemActionEvent;
local l_ContentType_0 = v39.ContentType;
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local l_OpenSongList_0 = require(l_Parent_0.DiscoveryRouting).OpenSongList;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local l_FFlagLuaAppUseFrameBoundsImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions;
local l_GameTileConstants_0 = v19.GameTileConstants;
local v51 = v12.strictInterface({
    [v23.key] = v23.interface, 
    sortIndex = v12.number, 
    isOmni = v12.optional(v12.boolean), 
    topicLayoutData = v12.optional(v12.table)
});
return function(v52) --[[ Line: 92 ]] --[[ Name: SongCarouselFeedItem ]]
    -- upvalues: l_validateProps_0 (copy), v51 (copy), v23 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagEnableTopSongsSort_0 (copy), l_useSelector_0 (copy), l_GameSortGroups_0 (copy), l_TopicInfosReducer_0 (copy), l_TopicContentsReducer_0 (copy), l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_RetrievalStatus_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_RoactAnalytics_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), v2 (copy), l_SendItemActionEvent_0 (copy), l_ContentType_0 (copy), l_SongTile_0 (copy), l_usePageSideMargin_0 (copy), l_useTextSizeOffset_0 (copy), l_useGetGameTileHeight_0 (copy), l_GameTileConstants_0 (copy), l_useGameCollectionLayoutParams_0 (copy), l_useDispatch_0 (copy), l_OpenSongList_0 (copy), l_useGameSortTooltipParams_0 (copy), l_TopicInfoModel_0 (copy), l_useCollectionImpressionsSignal_0 (copy), l_SendItemImpressions_0 (copy), l_AppPage_0 (copy), l_mutedError_0 (copy), l_CollectionCarousel_0 (copy), l_CollectionItemSize_0 (copy), l_FFlagLuaAppUseFrameBoundsImpressions_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    l_validateProps_0(v51, v52);
    local v53 = v52[v23.key];
    local l_appPage_0 = v53.appPage;
    local v55 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v53.appCompositionEnabled else nil;
    assert(l_FFlagEnableTopSongsSort_0, "SongCarouselFeedItem should only be used when FFlagEnableTopSongsSort is enabled");
    local v57 = l_useSelector_0(function(v56) --[[ Line: 104 ]]
        -- upvalues: l_GameSortGroups_0 (ref)
        return v56.GameSortGroups[l_GameSortGroups_0.Games];
    end).sorts[v52.sortIndex];
    local v58 = ("TOPSONGS_CAROUSEL_$%*"):format(v57);
    local v60 = l_useSelector_0(function(v59) --[[ Line: 110 ]]
        -- upvalues: l_TopicInfosReducer_0 (ref), v57 (copy)
        return v59.Personalization[l_TopicInfosReducer_0.key][v57];
    end);
    local v62 = l_useSelector_0(function(v61) --[[ Line: 113 ]]
        -- upvalues: l_TopicContentsReducer_0 (ref), v57 (copy)
        return v61.Personalization[l_TopicContentsReducer_0.key][v57];
    end);
    local v64 = l_useSelector_0(function(v63) --[[ Line: 116 ]]
        -- upvalues: l_FetchStatusReducer_0 (ref), l_FetchStatusNamespace_0 (ref), v57 (copy), l_RetrievalStatus_0 (ref)
        return v63.Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.GameSorts][v57] or l_RetrievalStatus_0.NotStarted;
    end);
    local v66 = l_useSelector_0(function(v65) --[[ Line: 121 ]]
        -- upvalues: v57 (copy), l_TopicContentsReducer_0 (ref)
        if v57 then
            return v65.Personalization and v65.Personalization[l_TopicContentsReducer_0.key] and v65.Personalization[l_TopicContentsReducer_0.key][v57] and v65.Personalization[l_TopicContentsReducer_0.key][v57].updatedTimestamp;
        else
            return nil;
        end;
    end);
    local v67 = l_useRoactService_0(l_AppEventIngestService_0);
    local v68 = l_useRoactService_0(l_RoactAnalytics_0);
    local v69 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v70 = v62 and v62.entries or nil;
    local v73 = v2.useCallback(function(v71, v72) --[[ Line: 138 ]]
        -- upvalues: v70 (copy), l_SendItemActionEvent_0 (ref), v67 (copy), v68 (copy), l_appPage_0 (copy), v52 (copy), v57 (copy), l_ContentType_0 (ref)
        if not v70 then
            return;
        else
            l_SendItemActionEvent_0.sendFromItemCollection(v67, v68, {
                id = v71
            }, 1, v72, l_appPage_0, v52.sortIndex, v57, #v70, l_ContentType_0.Song, "OpenSongDetails");
            return;
        end;
    end, {
        v67, 
        v68, 
        v57, 
        v70, 
        v52.sortIndex, 
        l_appPage_0
    });
    local v78 = v2.useCallback(function(v74, v75, v76, _) --[[ Line: 148 ]]
        -- upvalues: v2 (ref), l_SongTile_0 (ref), v58 (copy), v73 (copy)
        return v2.createElement(l_SongTile_0, {
            contentId = v74.contentId, 
            zIndex = -v75, 
            size = v76, 
            layoutOrder = v75, 
            impressionsTag = v58, 
            reportTileOpened = function() --[[ Line: 155 ]] --[[ Name: reportTileOpened ]]
                -- upvalues: v73 (ref), v74 (copy), v75 (copy)
                v73(v74.contentId, v75);
            end
        }), "SongTile";
    end, {
        v73, 
        v58
    });
    local v79, v80 = v2.useState(nil);
    local v81 = if not l_FFlagLuaAppCompositionAlways_0 then l_usePageSideMargin_0(v79) else nil;
    local v82 = v2.useRef(nil);
    local v83 = l_useTextSizeOffset_0();
    local v84 = l_useGetGameTileHeight_0(false, "Narrow", false, false, false, v83, nil, l_GameTileConstants_0.TileTextLines.Narrow.titleTextLines);
    local v85 = l_useGameCollectionLayoutParams_0("Narrow", v79, false, {
        sideMargin = v81
    });
    local v86 = l_useDispatch_0();
    local v87 = v2.useCallback(function() --[[ Line: 186 ]]
        -- upvalues: v86 (copy), l_OpenSongList_0 (ref), v57 (copy), l_appPage_0 (copy), v69 (copy), v52 (copy)
        v86(l_OpenSongList_0(v57, l_appPage_0));
        v69.reportSeeAllWithId(v57, nil, v52.sortIndex);
    end, {
        v86, 
        v57, 
        l_appPage_0, 
        v69, 
        v52.sortIndex
    });
    local v88, v89 = l_useGameSortTooltipParams_0(v60 or l_TopicInfoModel_0.new(), false, v60 and v60.topicLayoutData and v60.topicLayoutData.infoText or nil);
    local v90 = v89 and v89 ~= "";
    local l_scrollViewPositionChangedSignal_0 = v52[v23.key].scrollViewPositionChangedSignal;
    local v92, v93 = l_useCollectionImpressionsSignal_0(l_scrollViewPositionChangedSignal_0);
    local v98 = v2.useCallback(function(v94) --[[ Line: 202 ]]
        -- upvalues: v70 (copy), l_SendItemImpressions_0 (ref), v67 (copy), v68 (copy), l_appPage_0 (copy), v52 (copy), l_ContentType_0 (ref), v57 (copy)
        if v70 ~= nil then
            local v95 = {};
            for _, v97 in ipairs(v70) do
                table.insert(v95, {
                    id = v97.contentId
                });
            end;
            l_SendItemImpressions_0.sendFromItemCollection(v67, v68, v94, v95, #v95, l_appPage_0, v52.sortIndex, l_ContentType_0.Song, #v95, nil, v57);
        end;
    end, {
        v67, 
        v68, 
        v70, 
        v57, 
        v52.sortIndex
    });
    if l_appPage_0 ~= l_AppPage_0.Games then
        l_mutedError_0("SongCarouselFeedItem should only be used on AppPage.Games");
        return nil;
    elseif not v60 or v64 ~= l_RetrievalStatus_0.Done or not v70 or #v70 == 0 then
        return nil;
    else
        return v2.createElement(v2.Fragment, nil, {
            SongCarousel = v2.createElement(l_CollectionCarousel_0, {
                collectionItemSize = if v55 then l_CollectionItemSize_0.Small else nil, 
                columnGap = if v55 then nil else v85.columnGap, 
                containerRef = v80, 
                fractionalItemAmount = if v55 then nil else v85.fractionalItemAmount, 
                onViewableItemsChanged = v93, 
                onChangeCanvasPosition = v93, 
                getItemHeight = v84, 
                items = v70, 
                maxItemsToShow = v85.maxTilesToShow, 
                numColumns = if v55 then nil else v85.numColumns, 
                onActivateHeader = v87, 
                onActivateInfoIcon = v90 and v88 or nil, 
                renderItem = v78, 
                scrollingFrameRef = v82, 
                sideMargin = if v55 then nil else v85.sideMargin, 
                subtitle = v60.subtitle, 
                thresholdFromEnd = v85.loadMoreThreshold, 
                title = v60.displayName, 
                tooltipInfoText = v90 and v89 or nil
            }), 
            SongCarouselImpressionDetector = v2.createElement(if l_FFlagLuaAppUseFrameBoundsImpressions_0 then l_FrameBoundsImpressionsTracker_0 else l_ScreenSizeImpressionsTracker_0, {
                parentRef = v82, 
                pageContext = l_appPage_0, 
                impressionsTag = v58, 
                scrollViewPositionChangedSignal = v92, 
                sendImpressions = v98, 
                dataUpdatedTimestamp = v66
            })
        });
    end;
end;