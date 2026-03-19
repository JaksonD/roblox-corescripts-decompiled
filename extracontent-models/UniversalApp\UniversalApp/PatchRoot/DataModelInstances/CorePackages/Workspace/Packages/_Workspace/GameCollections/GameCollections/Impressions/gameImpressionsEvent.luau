local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagLuaAppGameImpressionsMobileAdsId_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameImpressionsMobileAdsId;
local l_FFlagLuaAppGameTileWideVideoThumbnail_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileWideVideoThumbnail;
local l_FFlagEnableInGameExitModalNextUpUi_0 = require(l_Parent_0.SharedFlags).FFlagEnableInGameExitModalNextUpUi;
local l_FFlagTraversalHistoryDiscoveryTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry;
local l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local l_FFlagLuaAppLogOmniAnalyticsData_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogOmniAnalyticsData;
local l_FFlagLuaAppMigrateGameEventsTelemetryService_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameEventsTelemetryService;
local l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameEventsTelemetryServiceShadowTraffic;
local v17 = game:DefineFastInt("LuaAppGameImpressionsEventThrottlingHundredthsPercent", 10000);
local v18 = game:DefineFastInt("LuaAppGameImpressionsShadowThrottlingHundredthsPercent", 10000);
local v19 = nil;
if l_FFlagLuaAppMigrateGameEventsTelemetryService_0 then
    v19 = {
        eventName = "gameImpressions", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v17, 
        lastUpdated = {
            26, 
            2, 
            4
        }, 
        description = "Fires when game tiles become visible to the user"
    };
end;
local v20 = nil;
if l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 then
    v20 = {
        eventName = "gameImpressionsShadow", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v18, 
        lastUpdated = {
            26, 
            3, 
            4
        }, 
        description = "Shadow traffic for gameImpressions event recovery percentage"
    };
end;
local v21 = v3.strictInterface({
    absPositions = v3.string, 
    topicDataPositions = v3.string, 
    rootPlaceIds = v3.string, 
    universeIds = v3.string, 
    gameSetTypeId = v3.string, 
    sortPos = v3.number, 
    locale = v3.string, 
    thumbnailAssetIds = v3.optional(v3.string), 
    thumbnailListIds = v3.optional(v3.string), 
    videoThumbnailAssetIds = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v3.optional(v3.string) else nil, 
    componentType = v3.optional(v3.string), 
    gameSetTargetId = v3.optional(v3.number), 
    pageId = v3.optional(v3.string), 
    adFlags = v3.optional(v3.string), 
    adIds = v3.optional(v3.string), 
    rows = v3.optional(v3.string), 
    rowsOnPage = v3.optional(v3.string), 
    positionsInRows = v3.optional(v3.string), 
    tileBadgeContexts = v3.optional(v3.string), 
    appliedFilters = v3.optional(v3.string), 
    mobileAdvertisingId = if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then v3.optional(v3.string) else nil, 
    footerTextLiterals = v3.optional(v3.string), 
    footerLocalizationKeys = v3.optional(v3.string), 
    loadSource = v3.optional(v3.string), 
    tileTypes = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v3.optional(v3.string) else nil, 
    sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v3.optional(v3.string) else nil, 
    analyticsData = if l_FFlagLuaAppLogOmniAnalyticsData_0 then v3.optional(v3.table) else nil
});
local v22 = v3.strictInterface({
    absPositions = v3.string, 
    topicDataPositions = v3.string, 
    rootPlaceIds = v3.string, 
    universeIds = v3.string, 
    gameSetTypeId = v3.string, 
    locale = v3.string, 
    seeAllFlag = v3.number, 
    gameSetTargetId = v3.optional(v3.number), 
    pageId = v3.optional(v3.string), 
    adFlags = v3.optional(v3.string), 
    adIds = v3.optional(v3.string), 
    thumbnailAssetIds = v3.optional(v3.string), 
    thumbnailListIds = v3.optional(v3.string), 
    videoThumbnailAssetIds = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v3.optional(v3.string) else nil, 
    tileBadgeContexts = v3.optional(v3.string), 
    mobileAdvertisingId = if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then v3.optional(v3.string) else nil, 
    appliedFilters = v3.optional(v3.string), 
    footerTextLiterals = v3.optional(v3.string), 
    footerLocalizationKeys = v3.optional(v3.string), 
    tileTypes = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v3.optional(v3.string) else nil
});
local v23 = v3.strictInterface({
    absPositions = v3.string, 
    topicDataPositions = v3.string, 
    rootPlaceIds = v3.string, 
    universeIds = v3.string, 
    searchUuid = v3.string, 
    emphasisFlag = v3.number, 
    seeAllFlag = v3.number, 
    sortPos = v3.optional(v3.number), 
    gameSetTypeId = v3.optional(v3.string), 
    locale = v3.optional(v3.string), 
    adFlags = v3.optional(v3.string), 
    adIds = v3.optional(v3.string), 
    rows = v3.optional(v3.string), 
    rowsOnPage = v3.optional(v3.string), 
    positionsInRows = v3.optional(v3.string), 
    mobileAdvertisingId = if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then v3.optional(v3.string) else nil, 
    thumbnailAssetIds = v3.optional(v3.string), 
    thumbnailListIds = v3.optional(v3.string), 
    footerTextLiterals = v3.optional(v3.string), 
    footerLocalizationKeys = v3.optional(v3.string), 
    tileBadgeContexts = v3.optional(v3.string), 
    componentType = if l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 then v3.optional(v3.string) else nil, 
    tileTypes = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v3.optional(v3.string) else nil
});
local v24 = v3.strictInterface({
    absPositions = v3.string, 
    topicDataPositions = v3.string, 
    rootPlaceIds = v3.string, 
    universeIds = v3.string, 
    refId = v3.string, 
    adFlags = v3.optional(v3.string), 
    adIds = v3.optional(v3.string), 
    locale = v3.optional(v3.string), 
    mobileAdvertisingId = if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then v3.optional(v3.string) else nil
});
local v25 = if l_FFlagSearchOmniAutocompletePage_0 then v3.strictInterface({
    absPositions = v3.string, 
    topicDataPositions = v3.string, 
    rootPlaceIds = v3.string, 
    universeIds = v3.string, 
    sortPos = v3.number, 
    gameSetTypeId = v3.optional(v3.string), 
    locale = v3.optional(v3.string), 
    thumbnailAssetIds = v3.optional(v3.string), 
    videoThumbnailAssetIds = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v3.optional(v3.string) else nil, 
    componentType = v3.optional(v3.string), 
    rowsOnPage = v3.optional(v3.string), 
    positionsInRows = v3.optional(v3.string), 
    mobileAdvertisingId = if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then v3.optional(v3.string) else nil, 
    gameSetTargetId = v3.optional(v3.number), 
    adFlags = v3.optional(v3.string), 
    adIds = v3.optional(v3.string), 
    tileBadgeContexts = v3.optional(v3.string), 
    thumbnailListIds = v3.optional(v3.string), 
    tileTypes = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v3.optional(v3.string) else nil
}) else nil;
local v26 = if l_FFlagEnableInGameExitModalNextUpUi_0 then v3.strictInterface({
    absPositions = v3.string, 
    topicDataPositions = v3.string, 
    rootPlaceIds = v3.string, 
    universeIds = v3.string, 
    gameSetTypeId = v3.string, 
    locale = v3.optional(v3.string)
}) else nil;
local v27 = if l_FFlagTraversalHistoryDiscoveryTelemetry_0 then v3.strictInterface({
    absPositions = v3.string, 
    positionsInRows = v3.optional(v3.string), 
    rootPlaceIds = v3.string, 
    rows = v3.string, 
    rowsOnPage = v3.string, 
    topicDataPositions = v3.string, 
    universeIds = v3.string, 
    locale = v3.optional(v3.string)
}) else nil;
local v28 = {
    [l_AppPage_0.Home] = v21, 
    [l_AppPage_0.Games] = v21, 
    [l_AppPage_0.SearchPage] = v23, 
    [l_AppPage_0.SearchLandingPage] = if l_FFlagSearchOmniAutocompletePage_0 then v25 else nil, 
    recommended = v24, 
    Deeplink = v22, 
    InExpHistoryPage = v27, 
    InGameExitPage = if l_FFlagEnableInGameExitModalNextUpUi_0 then v26 else nil
};
return function(v29, v30, v31) --[[ Line: 207 ]]
    -- upvalues: l_AppPage_0 (copy), v22 (copy), v28 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), v2 (copy), l_FFlagLuaAppMigrateGameEventsTelemetryService_0 (copy), l_TelemetryService_0 (copy), v19 (ref), l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 (copy), v20 (ref)
    local v32 = nil;
    v32 = if v31.seeAllFlag and (not (v30 ~= l_AppPage_0.Home) or v30 == l_AppPage_0.Games) then v22 else v28[v30];
    if v32 then
        local v33, v34 = v32(v31);
        if not v33 then
            l_DiscoveryEventErrorLogger_0.reportError("GameImpressionsEventInvalidInterface", v34);
        end;
    else
        l_DiscoveryEventErrorLogger_0.reportError("GameImpressionsEventMissingInterface", ("Missing interface for eventContext %* to type check gameImpressions event parameters"):format(v30), {
            eventContext = v30
        });
    end;
    if l_FFlagLuaAppLogOmniAnalyticsData_0 and v31.analyticsData then
        local l_analyticsData_0 = v31.analyticsData;
        v31 = v2.Dictionary.join(l_analyticsData_0, v31, {
            analyticsData = v2.None
        });
    end;
    if l_FFlagLuaAppMigrateGameEventsTelemetryService_0 then
        l_TelemetryService_0:LogEvent(v19, {
            eventContext = v30, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v31
        });
    else
        v29:sendEventDeferred(v30, "gameImpressions", v31);
    end;
    if l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 then
        l_TelemetryService_0:LogEvent(v20, {
            eventContext = v30, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v31
        });
    end;
end;