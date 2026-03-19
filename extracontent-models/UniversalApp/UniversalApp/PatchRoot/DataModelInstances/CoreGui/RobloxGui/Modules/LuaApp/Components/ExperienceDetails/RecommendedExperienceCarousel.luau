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
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_SendGameImpressions_0 = require(l_CorePackages_0.Workspace.Packages.GameCollections).SendGameImpressions;
local l_FrameBoundsImpressionsTracker_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).FrameBoundsImpressionsTracker;
local v24 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics);
local l_gamePlayIntent_0 = v24.Events.gamePlayIntent;
local l_Context_0 = v24.Constants.Context;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v29 = require(script.Parent.Hooks.useRecommendedGames);
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v31 = game:DefineFastFlag("LuaAppFixEmptyRecommendedGames", false);
local v32 = game:DefineFastFlag("LuaAppChangeRecommendedGamesTitle", false);
local v33 = game:DefineFastFlag("LuaAppChangeRecommendedGamesTitleLogExposure", false);
return (v2.memo(function(v34) --[[ Line: 74 ]]
    -- upvalues: v2 (copy), l_useGameCollectionLayoutParams_0 (copy), v29 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_useTextSizeOffset_0 (copy), l_useGetGameTileHeight_0 (copy), l_GameTileConstants_0 (copy), l_useLocalization_0 (copy), v32 (copy), v33 (copy), l_IXPServiceWrapper_0 (copy), l_AppUserLayers_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_RoactAnalytics_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_HttpService_0 (copy), l_gamePlayIntent_0 (copy), l_Context_0 (copy), l_SendGameImpressions_0 (copy), l_useCollectionImpressionsSignal_0 (copy), l_useRenderGameCollectionItem_0 (copy), v31 (copy), l_CollectionCarousel_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_AppPage_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy)
    local v35, v36 = v2.useState(nil);
    local v37 = l_useGameCollectionLayoutParams_0("Narrow", v35, false, {
        sideMargin = 0
    });
    local v38 = v29(v34.universeId, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v34.shouldHydrateLegacyIxp else nil);
    local l_recommendedGames_0 = v38.recommendedGames;
    local v40 = l_useTextSizeOffset_0();
    local v41 = l_useGetGameTileHeight_0(true, "Narrow", nil, false, false, 0, 0, l_GameTileConstants_0.TileTextLines.Narrow.titleTextLines);
    local v42 = l_useLocalization_0({
        title = v32 and "Common.GameSorts.Label.BlendedSerpPeopleAlsoJoin" or "Feature.GameDetails.Heading.Recommended"
    });
    if v33 then
        v2.useEffect(function() --[[ Line: 103 ]]
            -- upvalues: l_IXPServiceWrapper_0 (ref), l_AppUserLayers_0 (ref)
            l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.ExperienceDetailsPageExposureLayer);
        end, {});
    end;
    local v43 = l_useRoactService_0(l_AppEventIngestService_0);
    local v44 = l_useRoactService_0(l_RoactAnalytics_0);
    local v45 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v46 = v2.useRef(l_HttpService_0:GenerateGUID());
    local v47 = "GameDetails_" .. tostring(v34.universeId) .. tostring(v46.current);
    local v48 = v2.useRef(nil);
    local v57 = v2.useCallback(function(v49) --[[ Line: 116 ]]
        -- upvalues: l_recommendedGames_0 (copy), v34 (copy), v45 (copy)
        if #l_recommendedGames_0 == 0 then
            return;
        else
            local v50 = l_recommendedGames_0[v49];
            if not v50 then
                return;
            else
                local l_placeId_0 = v50.placeId;
                local l_isSponsored_0 = v50.isSponsored;
                local l_adId_0 = v50.adId;
                local l_universeId_0 = v50.universeId;
                local v55 = #l_recommendedGames_0;
                local l_universeId_1 = v34.universeId;
                v45.reportOpenGameDetailFromGameDetail(l_placeId_0, v49, v55, l_isSponsored_0, l_adId_0, l_universeId_0, v34.pageContext, l_universeId_1);
                return;
            end;
        end;
    end, {
        v45, 
        l_recommendedGames_0, 
        v34.universeId, 
        v34.pageContext
    });
    local v59 = v2.useCallback(function(v58) --[[ Line: 149 ]]
        -- upvalues: l_gamePlayIntent_0 (ref), v43 (copy), l_Context_0 (ref), v34 (copy)
        if not v58 then
            return;
        else
            l_gamePlayIntent_0(v43, l_Context_0.ExperienceTile, {
                placeId = v58.placeId, 
                rootPlaceId = tonumber(v58.placeId), 
                universeId = v58.universeId, 
                sortIndex = tostring(0), 
                sortEntryIndex = tostring(v58.index), 
                pageName = v34.pageContext
            });
            return;
        end;
    end, {
        v43, 
        v34.pageContext
    });
    local v61 = v2.useCallback(function(v60) --[[ Line: 166 ]]
        -- upvalues: l_recommendedGames_0 (copy), l_SendGameImpressions_0 (ref), v43 (copy), v44 (copy), v34 (copy)
        if #l_recommendedGames_0 == 0 then
            return;
        else
            l_SendGameImpressions_0.sendFromGameDetails(v43, v44, v60, l_recommendedGames_0, v34.universeId);
            return;
        end;
    end, {
        v43, 
        v44, 
        l_recommendedGames_0, 
        v34.universeId
    });
    local v62, v63 = l_useCollectionImpressionsSignal_0();
    local l_Footer_0 = l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v65 = l_useRenderGameCollectionItem_0(l_Footer_0, false, "Narrow", true, false, v47, true, v57, v59, nil, nil, nil, nil, nil, nil, false, nil, nil, false, false, nil, nil, nil, v40, l_GameTileConstants_0.TileTextLines.Narrow.titleTextLines, nil, nil, nil, v34.onPeekViewClosed, nil);
    local v66 = v2.useCallback(function() --[[ Line: 220 ]]
        -- upvalues: v31 (ref), l_recommendedGames_0 (copy), v2 (ref), v36 (copy), v34 (copy), l_CollectionCarousel_0 (ref), v48 (copy), v37 (copy), v41 (copy), v63 (copy), v65 (copy), v42 (copy), l_FrameBoundsImpressionsTracker_0 (ref), l_AppPage_0 (ref), v47 (copy), v62 (copy), v61 (copy)
        if v31 and #l_recommendedGames_0 == 0 then
            return nil;
        else
            return v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClipsDescendants = false, 
                Size = UDim2.fromScale(1, 0), 
                ref = v36
            }, {
                UIPadding = v34.padding and v2.createElement("UIPadding", v34.padding), 
                GameCarousel = v2.createElement(l_CollectionCarousel_0, {
                    scrollingFrameRef = v48, 
                    columnGap = v37.columnGap, 
                    fractionalItemAmount = v37.fractionalItemAmount, 
                    getItemHeight = v41, 
                    items = l_recommendedGames_0, 
                    maxItemsToShow = v37.maxTilesToShow, 
                    onViewableItemsChanged = v63, 
                    onChangeCanvasPosition = v63, 
                    numColumns = v37.numColumns, 
                    renderItem = v65, 
                    sideMargin = v37.sideMargin, 
                    title = v42.title, 
                    scrollingEnabledOverride = v34.scrollingEnabled or false
                }), 
                GameSortImpressionsDetector = v2.createElement(l_FrameBoundsImpressionsTracker_0, {
                    parentRef = v48, 
                    pageContext = {
                        l_AppPage_0.GameDetail, 
                        l_AppPage_0.ExperienceDetail
                    }, 
                    impressionsTag = v47, 
                    scrollViewPositionChangedSignal = v62, 
                    sendImpressions = v61
                })
            });
        end;
    end, {
        v36, 
        v37.columnGap, 
        v37.fractionalItemAmount, 
        v37.maxTilesToShow, 
        v37.numColumns, 
        v37.sideMargin, 
        v41, 
        l_recommendedGames_0, 
        v63, 
        v65, 
        v48, 
        v42.title, 
        v47, 
        v62, 
        v61, 
        v34.scrollingEnabled, 
        v34.padding
    });
    return v2.createElement(l_LoadingStateContainer_0, {
        dataStatus = l_RetrievalStatus_0.fromRawValue(v38.fetchStatus), 
        renderOnFailed = function() --[[ Line: 284 ]] --[[ Name: renderOnFailed ]]
            return nil;
        end, 
        renderOnLoaded = v66
    });
end));