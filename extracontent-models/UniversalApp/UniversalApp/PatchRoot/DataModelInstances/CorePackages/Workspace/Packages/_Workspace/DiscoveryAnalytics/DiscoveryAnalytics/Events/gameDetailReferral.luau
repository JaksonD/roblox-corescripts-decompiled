local l_HttpService_0 = game:GetService("HttpService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.t);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_FFlagEnableShareLinksInGameDetailEvent_0 = require(l_Parent_0.SharedFlags).FFlagEnableShareLinksInGameDetailEvent;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local l_FFlagLuaAppGameDetailEventMobileAdsId_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameDetailEventMobileAdsId;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local l_FFlagLuaAppLogOmniAnalyticsData_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogOmniAnalyticsData;
local l_FFlagLuaAppMigrateGameEventsTelemetryService_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameEventsTelemetryService;
local l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameEventsTelemetryServiceShadowTraffic;
local v15 = game:DefineFastInt("LuaAppGameDetailReferralEventThrottlingHundredthsPercent", 10000);
local v16 = game:DefineFastInt("LuaAppGameDetailReferralShadowThrottlingHundredthsPercent", 10000);
local v17 = nil;
if l_FFlagLuaAppMigrateGameEventsTelemetryService_0 then
    v17 = {
        eventName = "gameDetailReferral", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v15, 
        lastUpdated = {
            26, 
            2, 
            4
        }, 
        description = "Fires when the user navigates to game details"
    };
end;
local v18 = nil;
if l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 then
    v18 = {
        eventName = "gameDetailReferralShadow", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v16, 
        lastUpdated = {
            26, 
            3, 
            4
        }, 
        description = "Shadow traffic for gameDetailReferral event recovery percentage"
    };
end;
local v19 = v5.strictInterface({
    pg = v5.string, 
    universeId = v5.union(v5.string, v5.number), 
    navigationUniverseId = v5.optional(v5.string), 
    pos = v5.optional(v5.number), 
    pid = v5.optional(v5.union(v5.number, v5.string)), 
    sortPos = v5.optional(v5.number), 
    ad = v5.optional(v5.string), 
    isAd = v5.optional(v5.boolean), 
    nativeAdData = v5.optional(v5.string), 
    gameSetTargetId = v5.optional(v5.number), 
    gameSetTypeId = v5.optional(v5.string), 
    tis = v5.optional(v5.number), 
    refId = v5.optional(v5.string), 
    src = v5.optional(v5.string), 
    friendId = v5.optional(v5.string), 
    position = v5.optional(v5.number), 
    absolutePosition = v5.optional(v5.number), 
    fromWhere = v5.optional(v5.string), 
    locale = v5.optional(v5.string), 
    conversationId = v5.optional(v5.number), 
    shareLinkType = if l_FFlagEnableShareLinksInGameDetailEvent_0 then v5.optional(v5.string) else nil, 
    shareLinkId = if l_FFlagEnableShareLinksInGameDetailEvent_0 then v5.optional(v5.string) else nil, 
    rowOnPage = v5.optional(v5.number), 
    appliedFilters = v5.optional(v5.string), 
    topicDataPosition = v5.optional(v5.number), 
    refSongId = if l_FFlagEnableTopSongsSort_0 then v5.optional(v5.string) else nil, 
    isSdui = v5.optional(v5.boolean), 
    contentType = v5.optional(v5.string), 
    actionType = v5.optional(v5.string), 
    interactionUuid = v5.optional(v5.string), 
    positionInRow = v5.optional(v5.number), 
    rowNumber = v5.optional(v5.number), 
    heroUnitId = v5.optional(v5.string), 
    loadSource = v5.optional(v5.string), 
    tileType = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v5.optional(v5.string) else nil, 
    sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v5.optional(v5.string) else nil, 
    analyticsData = if l_FFlagLuaAppLogOmniAnalyticsData_0 then v5.optional(v5.table) else nil
});
local function _(v20) --[[ Line: 90 ]] --[[ Name: addMobileAdvertisingIdToEventParams ]]
    -- upvalues: l_AppStorageService_0 (copy)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
    if l_l_AppStorageService_0_Item_0 and l_l_AppStorageService_0_Item_0 ~= "" then
        v20.mobileAdvertisingId = l_l_AppStorageService_0_Item_0;
    end;
end;
return function(v23, v24, v25) --[[ Line: 97 ]]
    -- upvalues: v19 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_HttpService_0 (copy), l_FFlagLuaAppGameDetailEventMobileAdsId_0 (copy), l_AppStorageService_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), v4 (copy), l_FFlagLuaAppMigrateGameEventsTelemetryService_0 (copy), l_TelemetryService_0 (copy), v17 (ref), l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 (copy), v18 (ref)
    local v26, v27 = v19(v25);
    if not v26 then
        l_DiscoveryEventErrorLogger_0.reportError("GameDetailReferralInvalidInterface", v27);
    end;
    if not v25.interactionUuid then
        v25.interactionUuid = l_HttpService_0:GenerateGUID(false);
    end;
    if not v25.contentType then
        v25.contentType = "Game";
    end;
    if not v25.actionType then
        v25.actionType = "OpenGameDetails";
    end;
    if l_FFlagLuaAppGameDetailEventMobileAdsId_0 then
        local l_v25_0 = v25;
        local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
        if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
            l_v25_0.mobileAdvertisingId = l_l_AppStorageService_0_Item_1;
        end;
    end;
    if l_FFlagLuaAppLogOmniAnalyticsData_0 and v25.analyticsData then
        local l_analyticsData_0 = v25.analyticsData;
        v25 = v4.Dictionary.join(l_analyticsData_0, v25, {
            analyticsData = v4.None
        });
    end;
    if l_FFlagLuaAppMigrateGameEventsTelemetryService_0 then
        v25.isSdui = v25.isSdui == true and "true" or v25.isSdui == false and "false" or nil;
        v25.isAd = v25.isAd == true and "true" or v25.isAd == false and "false" or nil;
        l_TelemetryService_0:LogEvent(v17, {
            eventContext = v24, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v25
        });
    else
        v23:sendEventDeferred(v24, "gameDetailReferral", v25);
    end;
    if l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 then
        local v31 = table.clone(v25);
        v31.isSdui = v31.isSdui == true and "true" or v31.isSdui == false and "false" or v31.isSdui;
        v31.isAd = v31.isAd == true and "true" or v31.isAd == false and "false" or v31.isAd;
        l_TelemetryService_0:LogEvent(v18, {
            eventContext = v24, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v31
        });
    end;
end;