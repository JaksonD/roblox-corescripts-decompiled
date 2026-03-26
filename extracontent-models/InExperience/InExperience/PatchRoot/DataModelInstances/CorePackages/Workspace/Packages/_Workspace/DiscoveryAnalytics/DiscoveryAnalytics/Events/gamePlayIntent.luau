local l_HttpService_0 = game:GetService("HttpService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.t);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_FFlagEnableInGameExitModalNextUpUi_0 = require(l_Parent_0.SharedFlags).FFlagEnableInGameExitModalNextUpUi;
local l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGamePlayIntentEventMobileAdsId;
local l_FFlagTraversalHistoryDiscoveryTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppEnableCustomSpawnSearch_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSearch;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix;
local l_FFlagLuaAppLogOmniAnalyticsData_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogOmniAnalyticsData;
local l_FFlagLuaAppMigrateGameEventsTelemetryService_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameEventsTelemetryService;
local l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameEventsTelemetryServiceShadowTraffic;
local v18 = game:DefineFastInt("LuaAppGamePlayIntentEventThrottlingHundredthsPercent", 10000);
local v19 = game:DefineFastInt("LuaAppGamePlayIntentShadowThrottlingHundredthsPercent", 10000);
local v20 = require(l_script_FirstAncestor_0.Constants);
local v21 = nil;
if l_FFlagLuaAppMigrateGameEventsTelemetryService_0 then
    v21 = {
        eventName = "gamePlayIntent", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v18, 
        lastUpdated = {
            26, 
            2, 
            4
        }, 
        description = "Fires when the user clicks on a Play Button"
    };
end;
local v22 = nil;
if l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 then
    v22 = {
        eventName = "gamePlayIntentShadow", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v19, 
        lastUpdated = {
            26, 
            3, 
            4
        }, 
        description = "Shadow traffic for gamePlayIntent event recovery percentage"
    };
end;
local v23 = v6.strictInterface({
    placeId = v6.union(v6.string, v6.number), 
    rootPlaceId = v6.union(v6.number, v6.string), 
    referralSource = v6.optional(v6.string), 
    sortIndex = v6.optional(v6.string), 
    sortEntryIndex = v6.optional(v6.string), 
    gameSetTypeId = v6.optional(v6.string), 
    gameSetTargetId = v6.optional(v6.number), 
    linkId = v6.optional(v6.union(v6.string, v6.number)), 
    linkType = v6.optional(v6.string), 
    linkStatus = v6.optional(v6.string), 
    conversationId = v6.optional(v6.union(v6.number, v6.string)), 
    joinAttemptId = v6.optional(v6.string), 
    uid = v6.optional(v6.string), 
    launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v6.optional(v6.string) else nil
});
local v24 = v6.strictInterface({
    placeId = v6.union(v6.string, v6.number), 
    rootPlaceId = v6.union(v6.number, v6.string), 
    referralSource = v6.optional(v6.string), 
    universeId = v6.string, 
    launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v6.optional(v6.string) else nil, 
    tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v6.optional(v6.string) else nil, 
    nativeAdData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v6.optional(v6.string) else nil
});
local v25 = v6.strictInterface({
    placeId = v6.string, 
    rootPlaceId = v6.number, 
    universeId = v6.string, 
    referralSource = v6.optional(v6.string), 
    sortIndex = v6.string, 
    sortEntryIndex = v6.string, 
    gameSetTypeId = v6.optional(v6.string), 
    gameSetTargetId = v6.optional(v6.number), 
    appliedFilters = v6.optional(v6.string), 
    topicDataPosition = v6.optional(v6.number), 
    nativeAdData = v6.optional(v6.string), 
    pageName = v6.optional(v6.string), 
    positionInRow = v6.optional(v6.number), 
    rowNumber = v6.optional(v6.number), 
    feedRowNumber = v6.optional(v6.number), 
    heroUnitId = v6.optional(v6.string), 
    loadSource = v6.optional(v6.string), 
    launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v6.optional(v6.string) else nil, 
    sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v6.optional(v6.string) else nil, 
    tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v6.string else nil, 
    analyticsData = if l_FFlagLuaAppLogOmniAnalyticsData_0 then v6.optional(v6.table) else nil
});
local v26 = v6.strictInterface({
    placeId = v6.string, 
    rootPlaceId = v6.number, 
    universeId = v6.string, 
    sortEntryIndex = v6.string, 
    gameSetTypeId = v6.string, 
    sortIndex = v6.number, 
    rowOnPage = v6.optional(v6.number), 
    topicDataPosition = v6.optional(v6.number), 
    nativeAdData = v6.optional(v6.string), 
    pageName = v6.optional(v6.string), 
    launchData = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v6.optional(v6.string) else nil, 
    tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v6.string else nil
});
local v27 = v6.strictInterface({
    placeId = v6.string, 
    rootPlaceId = v6.number, 
    joinAttemptId = v6.optional(v6.string), 
    friendId = v6.string
});
local v28 = v6.strictInterface({
    placeId = v6.string, 
    rootPlaceId = v6.number, 
    joinAttemptId = v6.optional(v6.string), 
    friendId = v6.string
});
local v29 = v6.strictInterface({
    placeId = v6.string, 
    rootPlaceId = v6.number, 
    joinAttemptId = v6.optional(v6.string), 
    conversationId = v6.optional(v6.string)
});
local v30 = v6.strictInterface({
    placeId = v6.union(v6.string, v6.number), 
    rootPlaceId = v6.union(v6.number, v6.string), 
    linkId = v6.string, 
    linkType = v6.string, 
    linkStatus = v6.string, 
    joinAttemptId = v6.optional(v6.string)
});
local v31 = v6.strictInterface({
    friendId = v6.string, 
    pageName = v6.string, 
    placeId = v6.optional(v6.string), 
    rootPlaceId = v6.optional(v6.string), 
    joinAttemptId = v6.string
});
local v32 = v6.strictInterface({
    placeId = v6.string, 
    rootPlaceId = v6.number, 
    universeId = v6.string, 
    referralSource = v6.string, 
    sortIndex = v6.string, 
    sortEntryIndex = v6.string, 
    gameSetTypeId = v6.string, 
    gameSetTargetId = v6.optional(v6.number), 
    topicDataPosition = v6.optional(v6.number), 
    nativeAdData = v6.optional(v6.string), 
    pageName = v6.optional(v6.string), 
    tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v6.string else nil
});
local v33 = if l_FFlagEnableInGameExitModalNextUpUi_0 then v6.strictInterface({
    placeId = v6.string, 
    rootPlaceId = v6.number, 
    universeId = v6.string, 
    sortEntryIndex = v6.string, 
    gameSetTypeId = v6.string, 
    joinAttemptId = v6.string
}) else nil;
local v34 = if l_FFlagTraversalHistoryDiscoveryTelemetry_0 then v6.strictInterface({
    placeId = v6.string, 
    universeId = v6.string, 
    sortEntryIndex = v6.string
}) else nil;
local v35 = {
    PlayButton = v24, 
    [v20.Context.ExperienceTile] = v25, 
    [v20.Context.SearchExperienceTile] = v26, 
    [v20.Context.PeopleListInHomePage] = v27, 
    [v20.Context.GamePlayIntentInPlacesList] = v28, 
    shareLinks = v30, 
    PlayGameFromPlayTogether = v23, 
    PlayGameFromLinkCard = v29, 
    [v20.Context.PlayerContextualMenu] = v31, 
    [v20.Context.HoldToPlayLauncher] = v32, 
    [v20.Context.InExpHistoryTile] = if l_FFlagTraversalHistoryDiscoveryTelemetry_0 then v34 else nil, 
    InGameExitPage = if l_FFlagEnableInGameExitModalNextUpUi_0 then v33 else nil
};
local function _(v36) --[[ Line: 208 ]] --[[ Name: addMobileAdvertisingIdToEventParams ]]
    -- upvalues: l_AppStorageService_0 (copy)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
    if l_l_AppStorageService_0_Item_0 and l_l_AppStorageService_0_Item_0 ~= "" then
        v36.mobileAdvertisingId = l_l_AppStorageService_0_Item_0;
    end;
end;
return function(v39, v40, v41) --[[ Line: 215 ]]
    -- upvalues: v35 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), l_HttpService_0 (copy), l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 (copy), l_AppStorageService_0 (copy), l_FFlagLuaAppMigrateGameEventsTelemetryService_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), v5 (copy), l_TelemetryService_0 (copy), v21 (ref), l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 (copy), v22 (ref)
    if v35[v40] ~= nil then
        local v42, v43 = v35[v40](v41);
        if not v42 then
            l_DiscoveryEventErrorLogger_0.reportError("GamePlayIntentInvalidInterface", v43);
        end;
    else
        l_DiscoveryEventErrorLogger_0.reportError("GamePlayIntentMissingInterface", ("Missing interface for eventContext %* to type check gamePlayIntent event parameters"):format(v40), {
            eventContext = v40
        });
    end;
    local v44 = if l_FFlagLuaAppLogOmniAnalyticsData_0 then v41.analyticsData else nil;
    if not v41.interactionUuid then
        v41.interactionUuid = l_HttpService_0:GenerateGUID(false);
    end;
    if not v41.contentType then
        v41.contentType = "Game";
    end;
    if not v41.actionType then
        v41.actionType = "PlayButtonClick";
    end;
    if l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 then
        local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
        if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
            v41.mobileAdvertisingId = l_l_AppStorageService_0_Item_1;
        end;
    end;
    if l_FFlagLuaAppMigrateGameEventsTelemetryService_0 then
        local v46 = {
            placeId = v41.placeId, 
            rootPlaceId = v41.rootPlaceId, 
            universeId = v41.universeId, 
            referralSource = v41.referralSource, 
            sortIndex = v41.sortIndex, 
            sortEntryIndex = v41.sortEntryIndex, 
            gameSetTypeId = v41.gameSetTypeId, 
            gameSetTargetId = v41.gameSetTargetId, 
            linkId = v41.linkId, 
            linkType = v41.linkType, 
            linkStatus = v41.linkStatus, 
            conversationId = v41.conversationId, 
            joinAttemptId = v41.joinAttemptId, 
            friendId = v41.friendId, 
            pageName = v41.pageName, 
            rowOnPage = v41.rowOnPage, 
            appliedFilters = v41.appliedFilters, 
            topicDataPosition = v41.topicDataPosition, 
            nativeAdData = v41.nativeAdData, 
            interactionUuid = v41.interactionUuid, 
            contentType = v41.contentType, 
            actionType = v41.actionType, 
            positionInRow = v41.positionInRow, 
            rowNumber = v41.rowNumber, 
            feedRowNumber = v41.feedRowNumber, 
            heroUnitId = v41.heroUnitId, 
            mobileAdvertisingId = if l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 then v41.mobileAdvertisingId else nil, 
            loadSource = v41.loadSource, 
            launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v41.launchData then v41.launchData else nil, 
            sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v41.sortSubId else nil, 
            tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v41.tileType else nil
        };
        if l_FFlagLuaAppLogOmniAnalyticsData_0 and v44 then
            v46 = v5.Dictionary.join(v44, v46);
        end;
        l_TelemetryService_0:LogEvent(v21, {
            eventContext = v40, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v46
        });
    else
        local v47 = {
            placeId = v41.placeId, 
            rootPlaceId = v41.rootPlaceId, 
            universeId = v41.universeId, 
            referralSource = v41.referralSource, 
            sortIndex = v41.sortIndex, 
            sortEntryIndex = v41.sortEntryIndex, 
            gameSetTypeId = v41.gameSetTypeId, 
            gameSetTargetId = v41.gameSetTargetId, 
            linkId = v41.linkId, 
            linkType = v41.linkType, 
            linkStatus = v41.linkStatus, 
            conversationId = v41.conversationId, 
            joinAttemptId = v41.joinAttemptId, 
            friendId = v41.friendId, 
            pageName = v41.pageName, 
            rowOnPage = v41.rowOnPage, 
            appliedFilters = v41.appliedFilters, 
            topicDataPosition = v41.topicDataPosition, 
            nativeAdData = v41.nativeAdData, 
            interactionUuid = v41.interactionUuid, 
            contentType = v41.contentType, 
            actionType = v41.actionType, 
            positionInRow = v41.positionInRow, 
            rowNumber = v41.rowNumber, 
            feedRowNumber = v41.feedRowNumber, 
            heroUnitId = v41.heroUnitId, 
            mobileAdvertisingId = if l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 then v41.mobileAdvertisingId else nil, 
            loadSource = v41.loadSource, 
            launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v41.launchData then v41.launchData else nil, 
            sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v41.sortSubId else nil, 
            tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v41.tileType else nil
        };
        if l_FFlagLuaAppLogOmniAnalyticsData_0 and v44 then
            v47 = v5.Dictionary.join(v44, v47);
        end;
        v39:sendEventDeferred(v40, "gamePlayIntent", v47);
    end;
    if l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 then
        l_TelemetryService_0:LogEvent(v22, {
            eventContext = v40, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = {
                placeId = v41.placeId, 
                rootPlaceId = v41.rootPlaceId, 
                universeId = v41.universeId, 
                referralSource = v41.referralSource, 
                sortIndex = v41.sortIndex, 
                sortEntryIndex = v41.sortEntryIndex, 
                gameSetTypeId = v41.gameSetTypeId, 
                gameSetTargetId = v41.gameSetTargetId, 
                linkId = v41.linkId, 
                linkType = v41.linkType, 
                linkStatus = v41.linkStatus, 
                conversationId = v41.conversationId, 
                joinAttemptId = v41.joinAttemptId, 
                friendId = v41.friendId, 
                pageName = v41.pageName, 
                rowOnPage = v41.rowOnPage, 
                appliedFilters = v41.appliedFilters, 
                topicDataPosition = v41.topicDataPosition, 
                nativeAdData = v41.nativeAdData, 
                interactionUuid = v41.interactionUuid, 
                contentType = v41.contentType, 
                actionType = v41.actionType, 
                positionInRow = v41.positionInRow, 
                rowNumber = v41.rowNumber, 
                feedRowNumber = v41.feedRowNumber, 
                heroUnitId = v41.heroUnitId, 
                mobileAdvertisingId = if l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 then v41.mobileAdvertisingId else nil, 
                loadSource = v41.loadSource, 
                launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v41.launchData then v41.launchData else nil, 
                sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v41.sortSubId else nil, 
                tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v41.tileType else nil
            }
        });
    end;
end;