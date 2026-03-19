local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v2 = require(l_Parent_0.t);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagLuaAppGameImpressionsMobileAdsId_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameImpressionsMobileAdsId;
local l_FFlagLuaAppGameTileWideVideoThumbnail_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileWideVideoThumbnail;
local l_FFlagEnableInGameExitModalNextUpUi_0 = require(l_Parent_0.SharedFlags).FFlagEnableInGameExitModalNextUpUi;
local l_FFlagTraversalHistoryDiscoveryTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry;
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
local l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local l_FFlagLuaAppMigrateGameEventsTelemetryService_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameEventsTelemetryService;
local l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameEventsTelemetryServiceShadowTraffic;
local v16 = game:DefineFastInt("LuaAppGameImpressionsEventThrottlingHundredthsPercent", 10000);
local v17 = game:DefineFastInt("LuaAppGameImpressionsShadowThrottlingHundredthsPercent", 10000);
local v18 = nil;
if l_FFlagLuaAppMigrateGameEventsTelemetryService_0 then
    v18 = {
        eventName = "gameImpressions", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v16, 
        lastUpdated = {
            26, 
            2, 
            4
        }, 
        description = "Fires when game tiles become visible to the user"
    };
end;
local v19 = nil;
if l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 then
    v19 = {
        eventName = "gameImpressionsShadow", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v17, 
        lastUpdated = {
            26, 
            3, 
            4
        }, 
        description = "Shadow traffic for gameImpressions event recovery percentage"
    };
end;
local v20 = v2.strictInterface({
    absPositions = v2.string, 
    topicDataPositions = v2.string, 
    rootPlaceIds = v2.string, 
    universeIds = v2.string, 
    gameSetTypeId = v2.string, 
    sortPos = v2.number, 
    locale = v2.string, 
    thumbnailAssetIds = v2.optional(v2.string), 
    thumbnailListIds = v2.optional(v2.string), 
    videoThumbnailAssetIds = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v2.optional(v2.string) else nil, 
    componentType = v2.optional(v2.string), 
    gameSetTargetId = v2.optional(v2.number), 
    pageId = v2.optional(v2.string), 
    adFlags = v2.optional(v2.string), 
    adIds = v2.optional(v2.string), 
    rows = v2.optional(v2.string), 
    rowsOnPage = v2.optional(v2.string), 
    positionsInRows = v2.optional(v2.string), 
    tileBadgeContexts = v2.optional(v2.string), 
    appliedFilters = v2.optional(v2.string), 
    mobileAdvertisingId = if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then v2.optional(v2.string) else nil, 
    footerTextLiterals = v2.optional(v2.string), 
    footerLocalizationKeys = v2.optional(v2.string), 
    loadSource = v2.optional(v2.string), 
    tileTypes = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v2.optional(v2.string) else nil, 
    sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v2.optional(v2.string) else nil
});
local v21 = v2.strictInterface({
    absPositions = v2.string, 
    topicDataPositions = v2.string, 
    rootPlaceIds = v2.string, 
    universeIds = v2.string, 
    gameSetTypeId = v2.string, 
    locale = v2.string, 
    seeAllFlag = v2.number, 
    gameSetTargetId = v2.optional(v2.number), 
    pageId = v2.optional(v2.string), 
    adFlags = v2.optional(v2.string), 
    adIds = v2.optional(v2.string), 
    thumbnailAssetIds = v2.optional(v2.string), 
    thumbnailListIds = v2.optional(v2.string), 
    videoThumbnailAssetIds = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v2.optional(v2.string) else nil, 
    tileBadgeContexts = v2.optional(v2.string), 
    mobileAdvertisingId = if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then v2.optional(v2.string) else nil, 
    appliedFilters = v2.optional(v2.string), 
    footerTextLiterals = v2.optional(v2.string), 
    footerLocalizationKeys = v2.optional(v2.string), 
    tileTypes = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v2.optional(v2.string) else nil
});
local v22 = v2.strictInterface({
    absPositions = v2.string, 
    topicDataPositions = v2.string, 
    rootPlaceIds = v2.string, 
    universeIds = v2.string, 
    searchUuid = v2.string, 
    emphasisFlag = v2.number, 
    seeAllFlag = v2.number, 
    sortPos = v2.optional(v2.number), 
    gameSetTypeId = v2.optional(v2.string), 
    locale = v2.optional(v2.string), 
    adFlags = v2.optional(v2.string), 
    adIds = v2.optional(v2.string), 
    rows = v2.optional(v2.string), 
    rowsOnPage = v2.optional(v2.string), 
    positionsInRows = v2.optional(v2.string), 
    mobileAdvertisingId = if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then v2.optional(v2.string) else nil, 
    thumbnailAssetIds = if l_FFlagLuaAppSearchGridTiles_0 then v2.optional(v2.string) else nil, 
    thumbnailListIds = if l_FFlagLuaAppSearchGridTiles_0 then v2.optional(v2.string) else nil, 
    footerTextLiterals = if l_FFlagLuaAppSearchGridTiles_0 then v2.optional(v2.string) else nil, 
    footerLocalizationKeys = if l_FFlagLuaAppSearchGridTiles_0 then v2.optional(v2.string) else nil, 
    tileBadgeContexts = if l_FFlagLuaAppSearchGridTiles_0 then v2.optional(v2.string) else nil, 
    componentType = if l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 then v2.optional(v2.string) else nil, 
    tileTypes = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v2.optional(v2.string) else nil
});
local v23 = v2.strictInterface({
    absPositions = v2.string, 
    topicDataPositions = v2.string, 
    rootPlaceIds = v2.string, 
    universeIds = v2.string, 
    refId = v2.string, 
    adFlags = v2.optional(v2.string), 
    adIds = v2.optional(v2.string), 
    locale = v2.optional(v2.string), 
    mobileAdvertisingId = if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then v2.optional(v2.string) else nil
});
local v24 = if l_FFlagSearchOmniAutocompletePage_0 then v2.strictInterface({
    absPositions = v2.string, 
    topicDataPositions = v2.string, 
    rootPlaceIds = v2.string, 
    universeIds = v2.string, 
    sortPos = v2.number, 
    gameSetTypeId = v2.optional(v2.string), 
    locale = v2.optional(v2.string), 
    thumbnailAssetIds = v2.optional(v2.string), 
    videoThumbnailAssetIds = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v2.optional(v2.string) else nil, 
    componentType = v2.optional(v2.string), 
    rowsOnPage = v2.optional(v2.string), 
    positionsInRows = v2.optional(v2.string), 
    mobileAdvertisingId = if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then v2.optional(v2.string) else nil, 
    gameSetTargetId = v2.optional(v2.number), 
    adFlags = v2.optional(v2.string), 
    adIds = v2.optional(v2.string), 
    tileBadgeContexts = v2.optional(v2.string), 
    thumbnailListIds = v2.optional(v2.string), 
    tileTypes = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v2.optional(v2.string) else nil
}) else nil;
local v25 = if l_FFlagEnableInGameExitModalNextUpUi_0 then v2.strictInterface({
    absPositions = v2.string, 
    topicDataPositions = v2.string, 
    rootPlaceIds = v2.string, 
    universeIds = v2.string, 
    gameSetTypeId = v2.string, 
    locale = v2.optional(v2.string)
}) else nil;
local v26 = if l_FFlagTraversalHistoryDiscoveryTelemetry_0 then v2.strictInterface({
    absPositions = v2.string, 
    positionsInRows = v2.optional(v2.string), 
    rootPlaceIds = v2.string, 
    rows = v2.string, 
    rowsOnPage = v2.string, 
    topicDataPositions = v2.string, 
    universeIds = v2.string, 
    locale = v2.optional(v2.string)
}) else nil;
local v27 = {
    [l_AppPage_0.Home] = v20, 
    [l_AppPage_0.Games] = v20, 
    [l_AppPage_0.SearchPage] = v22, 
    [l_AppPage_0.SearchLandingPage] = if l_FFlagSearchOmniAutocompletePage_0 then v24 else nil, 
    recommended = v23, 
    Deeplink = v21, 
    InExpHistoryPage = v26, 
    InGameExitPage = if l_FFlagEnableInGameExitModalNextUpUi_0 then v25 else nil
};
return function(v28, v29, v30) --[[ Line: 205 ]]
    -- upvalues: l_AppPage_0 (copy), v21 (copy), v27 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_FFlagLuaAppMigrateGameEventsTelemetryService_0 (copy), l_TelemetryService_0 (copy), v18 (ref), l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 (copy), v19 (ref)
    local v31 = nil;
    v31 = if v30.seeAllFlag and (not (v29 ~= l_AppPage_0.Home) or v29 == l_AppPage_0.Games) then v21 else v27[v29];
    if v31 then
        local v32, v33 = v31(v30);
        if not v32 then
            l_DiscoveryEventErrorLogger_0.reportError("GameImpressionsEventInvalidInterface", v33);
        end;
    else
        l_DiscoveryEventErrorLogger_0.reportError("GameImpressionsEventMissingInterface", ("Missing interface for eventContext %* to type check gameImpressions event parameters"):format(v29), {
            eventContext = v29
        });
    end;
    if l_FFlagLuaAppMigrateGameEventsTelemetryService_0 then
        l_TelemetryService_0:LogEvent(v18, {
            eventContext = v29, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v30
        });
    else
        v28:sendEventDeferred(v29, "gameImpressions", v30);
    end;
    if l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 then
        l_TelemetryService_0:LogEvent(v19, {
            eventContext = v29, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v30
        });
    end;
end;