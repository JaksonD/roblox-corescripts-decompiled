local l_HttpService_0 = game:GetService("HttpService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v4 = require(l_Parent_0.t);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_FFlagEnableShareLinksInGameDetailEvent_0 = require(l_Parent_0.SharedFlags).FFlagEnableShareLinksInGameDetailEvent;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local l_FFlagLuaAppGameDetailEventMobileAdsId_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameDetailEventMobileAdsId;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local l_FFlagLuaAppMigrateGameEventsTelemetryService_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameEventsTelemetryService;
local l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameEventsTelemetryServiceShadowTraffic;
local v13 = game:DefineFastInt("LuaAppGameDetailReferralEventThrottlingHundredthsPercent", 10000);
local v14 = game:DefineFastInt("LuaAppGameDetailReferralShadowThrottlingHundredthsPercent", 10000);
local v15 = nil;
if l_FFlagLuaAppMigrateGameEventsTelemetryService_0 then
    v15 = {
        eventName = "gameDetailReferral", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v13, 
        lastUpdated = {
            26, 
            2, 
            4
        }, 
        description = "Fires when the user navigates to game details"
    };
end;
local v16 = nil;
if l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 then
    v16 = {
        eventName = "gameDetailReferralShadow", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v14, 
        lastUpdated = {
            26, 
            3, 
            4
        }, 
        description = "Shadow traffic for gameDetailReferral event recovery percentage"
    };
end;
local v17 = v4.strictInterface({
    pg = v4.string, 
    universeId = v4.union(v4.string, v4.number), 
    navigationUniverseId = v4.optional(v4.string), 
    pos = v4.optional(v4.number), 
    pid = v4.optional(v4.union(v4.number, v4.string)), 
    sortPos = v4.optional(v4.number), 
    ad = v4.optional(v4.string), 
    isAd = v4.optional(v4.boolean), 
    nativeAdData = v4.optional(v4.string), 
    gameSetTargetId = v4.optional(v4.number), 
    gameSetTypeId = v4.optional(v4.string), 
    tis = v4.optional(v4.number), 
    refId = v4.optional(v4.string), 
    src = v4.optional(v4.string), 
    friendId = v4.optional(v4.string), 
    position = v4.optional(v4.number), 
    absolutePosition = v4.optional(v4.number), 
    fromWhere = v4.optional(v4.string), 
    locale = v4.optional(v4.string), 
    conversationId = v4.optional(v4.number), 
    shareLinkType = if l_FFlagEnableShareLinksInGameDetailEvent_0 then v4.optional(v4.string) else nil, 
    shareLinkId = if l_FFlagEnableShareLinksInGameDetailEvent_0 then v4.optional(v4.string) else nil, 
    rowOnPage = v4.optional(v4.number), 
    appliedFilters = v4.optional(v4.string), 
    topicDataPosition = v4.optional(v4.number), 
    refSongId = if l_FFlagEnableTopSongsSort_0 then v4.optional(v4.string) else nil, 
    isSdui = v4.optional(v4.boolean), 
    contentType = v4.optional(v4.string), 
    actionType = v4.optional(v4.string), 
    interactionUuid = v4.optional(v4.string), 
    positionInRow = v4.optional(v4.number), 
    rowNumber = v4.optional(v4.number), 
    heroUnitId = v4.optional(v4.string), 
    loadSource = v4.optional(v4.string), 
    tileType = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v4.optional(v4.string) else nil, 
    sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v4.optional(v4.string) else nil
});
local function _(v18) --[[ Line: 87 ]] --[[ Name: addMobileAdvertisingIdToEventParams ]]
    -- upvalues: l_AppStorageService_0 (copy)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
    if l_l_AppStorageService_0_Item_0 and l_l_AppStorageService_0_Item_0 ~= "" then
        v18.mobileAdvertisingId = l_l_AppStorageService_0_Item_0;
    end;
end;
return function(v21, v22, v23) --[[ Line: 94 ]]
    -- upvalues: v17 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_HttpService_0 (copy), l_FFlagLuaAppGameDetailEventMobileAdsId_0 (copy), l_AppStorageService_0 (copy), l_FFlagLuaAppMigrateGameEventsTelemetryService_0 (copy), l_TelemetryService_0 (copy), v15 (ref), l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 (copy), v16 (ref)
    local v24, v25 = v17(v23);
    if not v24 then
        l_DiscoveryEventErrorLogger_0.reportError("GameDetailReferralInvalidInterface", v25);
    end;
    if not v23.interactionUuid then
        v23.interactionUuid = l_HttpService_0:GenerateGUID(false);
    end;
    if not v23.contentType then
        v23.contentType = "Game";
    end;
    if not v23.actionType then
        v23.actionType = "OpenGameDetails";
    end;
    if l_FFlagLuaAppGameDetailEventMobileAdsId_0 then
        local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
        if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
            v23.mobileAdvertisingId = l_l_AppStorageService_0_Item_1;
        end;
    end;
    if l_FFlagLuaAppMigrateGameEventsTelemetryService_0 then
        v23.isSdui = v23.isSdui == true and "true" or v23.isSdui == false and "false" or nil;
        v23.isAd = v23.isAd == true and "true" or v23.isAd == false and "false" or nil;
        l_TelemetryService_0:LogEvent(v15, {
            eventContext = v22, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v23
        });
    else
        v21:sendEventDeferred(v22, "gameDetailReferral", v23);
    end;
    if l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 then
        local v27 = table.clone(v23);
        v27.isSdui = v27.isSdui == true and "true" or v27.isSdui == false and "false" or v27.isSdui;
        v27.isAd = v27.isAd == true and "true" or v27.isAd == false and "false" or v27.isAd;
        l_TelemetryService_0:LogEvent(v16, {
            eventContext = v22, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v27
        });
    end;
end;