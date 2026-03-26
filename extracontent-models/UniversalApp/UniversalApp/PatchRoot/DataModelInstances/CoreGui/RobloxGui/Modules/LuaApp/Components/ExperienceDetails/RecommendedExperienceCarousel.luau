local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.CollectionViews);
local l_CollectionCarousel_0 = v3.CollectionCarousel;
local l_useCollectionImpressionsSignal_0 = v3.useCollectionImpressionsSignal;
local v6 = require(l_CorePackages_0.Workspace.Packages.GameCollections);
local l_useGameCollectionLayoutParams_0 = v6.useGameCollectionLayoutParams;
local l_useGetGameTileHeight_0 = v6.useGetGameTileHeight;
local l_useRenderGameCollectionItem_0 = v6.useRenderGameCollectionItem;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local v11 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_AppEventIngestService_0 = v11.AppEventIngestService;
local l_RoactAnalytics_0 = v11.RoactAnalytics;
local l_RoactAnalyticsCommonGameEvents_0 = v11.RoactAnalyticsCommonGameEvents;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v16 = require(l_CorePackages_0.Packages.UIBlox);
local l_useTextSizeOffset_0 = v16.Core.Style.useTextSizeOffset;
local l_LoadingStateContainer_0 = v16.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v16.App.Loading.Enum.RetrievalStatus;
local l_GameTileConstants_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).GameTileConstants;
local l_GameCollectionItemTypes_0 = require(l_CorePackages_0.Workspace.Packages.GameCollections).GameCollectionItemTypes;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_SendGameImpressions_0 = require(l_CorePackages_0.Workspace.Packages.GameCollections).SendGameImpressions;
local l_FrameBoundsImpressionsTracker_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).FrameBoundsImpressionsTracker;
local v25 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics);
local l_gamePlayIntent_0 = v25.Events.gamePlayIntent;
local l_Context_0 = v25.Constants.Context;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v30 = require(script.Parent.Hooks.useRecommendedGames);
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix;
local v33 = game:DefineFastFlag("LuaAppFixEmptyRecommendedGames", false);
local v34 = game:DefineFastFlag("LuaAppChangeRecommendedGamesTitle", false);
local v35 = game:DefineFastFlag("LuaAppChangeRecommendedGamesTitleLogExposure", false);
return (v2.memo(function(v36) --[[ Line: 78 ]]
    -- upvalues: v2 (copy), l_useGameCollectionLayoutParams_0 (copy), v30 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_useTextSizeOffset_0 (copy), l_useGetGameTileHeight_0 (copy), l_GameTileConstants_0 (copy), l_useLocalization_0 (copy), v34 (copy), v35 (copy), l_IXPServiceWrapper_0 (copy), l_AppUserLayers_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_RoactAnalytics_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_HttpService_0 (copy), l_gamePlayIntent_0 (copy), l_Context_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_GameCollectionItemTypes_0 (copy), l_SendGameImpressions_0 (copy), l_useCollectionImpressionsSignal_0 (copy), l_useRenderGameCollectionItem_0 (copy), v33 (copy), l_CollectionCarousel_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_AppPage_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy)
    local v37, v38 = v2.useState(nil);
    local v39 = l_useGameCollectionLayoutParams_0("Narrow", v37, false, {
        sideMargin = 0
    });
    local v40 = v30(v36.universeId, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v36.shouldHydrateLegacyIxp else nil);
    local l_recommendedGames_0 = v40.recommendedGames;
    local v42 = l_useTextSizeOffset_0();
    local v43 = l_useGetGameTileHeight_0(true, "Narrow", nil, false, false, 0, 0, l_GameTileConstants_0.TileTextLines.Narrow.titleTextLines);
    local v44 = l_useLocalization_0({
        title = v34 and "Common.GameSorts.Label.BlendedSerpPeopleAlsoJoin" or "Feature.GameDetails.Heading.Recommended"
    });
    if v35 then
        v2.useEffect(function() --[[ Line: 107 ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref), l_AppUserLayers_0 (ref)
            l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.ExperienceDetailsPageExposureLayer);
        end, {});
    end;
    local v45 = l_useRoactService_0(l_AppEventIngestService_0);
    local v46 = l_useRoactService_0(l_RoactAnalytics_0);
    local v47 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v48 = v2.useRef(l_HttpService_0:GenerateGUID());
    local v49 = "GameDetails_" .. tostring(v36.universeId) .. tostring(v48.current);
    local v50 = v2.useRef(nil);
    local v59 = v2.useCallback(function(v51) --[[ Line: 120 ]]
        -- upvalues: l_recommendedGames_0 (copy), v36 (copy), v47 (copy)
        if #l_recommendedGames_0 == 0 then
            return;
        else
            local v52 = l_recommendedGames_0[v51];
            if not v52 then
                return;
            else
                local l_placeId_0 = v52.placeId;
                local l_isSponsored_0 = v52.isSponsored;
                local l_adId_0 = v52.adId;
                local l_universeId_0 = v52.universeId;
                local v57 = #l_recommendedGames_0;
                local l_universeId_1 = v36.universeId;
                v47.reportOpenGameDetailFromGameDetail(l_placeId_0, v51, v57, l_isSponsored_0, l_adId_0, l_universeId_0, v36.pageContext, l_universeId_1);
                return;
            end;
        end;
    end, {
        v47, 
        l_recommendedGames_0, 
        v36.universeId, 
        v36.pageContext
    });
    local v61 = v2.useCallback(function(v60) --[[ Line: 153 ]]
        -- upvalues: l_gamePlayIntent_0 (ref), v45 (copy), l_Context_0 (ref), v36 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref)
        if not v60 then
            return;
        else
            l_gamePlayIntent_0(v45, l_Context_0.ExperienceTile, {
                placeId = v60.placeId, 
                rootPlaceId = tonumber(v60.placeId), 
                universeId = v60.universeId, 
                sortIndex = tostring(0), 
                sortEntryIndex = tostring(v60.index), 
                pageName = v36.pageContext, 
                tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile else nil
            });
            return;
        end;
    end, {
        v45, 
        v36.pageContext
    });
    local v63 = v2.useCallback(function(v62) --[[ Line: 173 ]]
        -- upvalues: l_recommendedGames_0 (copy), l_SendGameImpressions_0 (ref), v45 (copy), v46 (copy), v36 (copy)
        if #l_recommendedGames_0 == 0 then
            return;
        else
            l_SendGameImpressions_0.sendFromGameDetails(v45, v46, v62, l_recommendedGames_0, v36.universeId);
            return;
        end;
    end, {
        v45, 
        v46, 
        l_recommendedGames_0, 
        v36.universeId
    });
    local v64, v65 = l_useCollectionImpressionsSignal_0();
    local l_Footer_0 = l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v67 = l_useRenderGameCollectionItem_0(l_Footer_0, false, "Narrow", true, false, v49, true, v59, v61, nil, nil, nil, nil, nil, nil, false, nil, nil, false, false, nil, nil, nil, v42, l_GameTileConstants_0.TileTextLines.Narrow.titleTextLines, nil, nil, nil, v36.onPeekViewClosed, nil);
    local v68 = v2.useCallback(function() --[[ Line: 227 ]]
        -- upvalues: v33 (ref), l_recommendedGames_0 (copy), v2 (ref), v38 (copy), v36 (copy), l_CollectionCarousel_0 (ref), v50 (copy), v39 (copy), v43 (copy), v65 (copy), v67 (copy), v44 (copy), l_FrameBoundsImpressionsTracker_0 (ref), l_AppPage_0 (ref), v49 (copy), v64 (copy), v63 (copy)
        if v33 and #l_recommendedGames_0 == 0 then
            return nil;
        else
            return v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClipsDescendants = false, 
                Size = UDim2.fromScale(1, 0), 
                ref = v38
            }, {
                UIPadding = v36.padding and v2.createElement("UIPadding", v36.padding), 
                GameCarousel = v2.createElement(l_CollectionCarousel_0, {
                    scrollingFrameRef = v50, 
                    columnGap = v39.columnGap, 
                    fractionalItemAmount = v39.fractionalItemAmount, 
                    getItemHeight = v43, 
                    items = l_recommendedGames_0, 
                    maxItemsToShow = v39.maxTilesToShow, 
                    onViewableItemsChanged = v65, 
                    onChangeCanvasPosition = v65, 
                    numColumns = v39.numColumns, 
                    renderItem = v67, 
                    sideMargin = v39.sideMargin, 
                    title = v44.title, 
                    scrollingEnabledOverride = v36.scrollingEnabled or false
                }), 
                GameSortImpressionsDetector = v2.createElement(l_FrameBoundsImpressionsTracker_0, {
                    parentRef = v50, 
                    pageContext = {
                        l_AppPage_0.GameDetail, 
                        l_AppPage_0.ExperienceDetail
                    }, 
                    impressionsTag = v49, 
                    scrollViewPositionChangedSignal = v64, 
                    sendImpressions = v63
                })
            });
        end;
    end, {
        v38, 
        v39.columnGap, 
        v39.fractionalItemAmount, 
        v39.maxTilesToShow, 
        v39.numColumns, 
        v39.sideMargin, 
        v43, 
        l_recommendedGames_0, 
        v65, 
        v67, 
        v50, 
        v44.title, 
        v49, 
        v64, 
        v63, 
        v36.scrollingEnabled, 
        v36.padding
    });
    return v2.createElement(l_LoadingStateContainer_0, {
        dataStatus = l_RetrievalStatus_0.fromRawValue(v40.fetchStatus), 
        renderOnFailed = function() --[[ Line: 291 ]] --[[ Name: renderOnFailed ]]
            return nil;
        end, 
        renderOnLoaded = v68
    });
end));