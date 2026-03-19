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
local l_FFlagLuaAppLogOmniAnalyticsData_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogOmniAnalyticsData;
local l_FFlagLuaAppMigrateGameEventsTelemetryService_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameEventsTelemetryService;
local l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameEventsTelemetryServiceShadowTraffic;
local v17 = game:DefineFastInt("LuaAppGamePlayIntentEventThrottlingHundredthsPercent", 10000);
local v18 = game:DefineFastInt("LuaAppGamePlayIntentShadowThrottlingHundredthsPercent", 10000);
local v19 = require(l_script_FirstAncestor_0.Constants);
local v20 = nil;
if l_FFlagLuaAppMigrateGameEventsTelemetryService_0 then
    v20 = {
        eventName = "gamePlayIntent", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v17, 
        lastUpdated = {
            26, 
            2, 
            4
        }, 
        description = "Fires when the user clicks on a Play Button"
    };
end;
local v21 = nil;
if l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 then
    v21 = {
        eventName = "gamePlayIntentShadow", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v18, 
        lastUpdated = {
            26, 
            3, 
            4
        }, 
        description = "Shadow traffic for gamePlayIntent event recovery percentage"
    };
end;
local v22 = v6.strictInterface({
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
local v23 = v6.strictInterface({
    placeId = v6.union(v6.string, v6.number), 
    rootPlaceId = v6.union(v6.number, v6.string), 
    referralSource = v6.optional(v6.string), 
    universeId = v6.string, 
    launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v6.optional(v6.string) else nil
});
local v24 = v6.strictInterface({
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
    analyticsData = if l_FFlagLuaAppLogOmniAnalyticsData_0 then v6.optional(v6.table) else nil
});
local v25 = v6.strictInterface({
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
    launchData = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v6.optional(v6.string) else nil
});
local v26 = v6.strictInterface({
    placeId = v6.string, 
    rootPlaceId = v6.number, 
    joinAttemptId = v6.optional(v6.string), 
    friendId = v6.string
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
    conversationId = v6.optional(v6.string)
});
local v29 = v6.strictInterface({
    placeId = v6.union(v6.string, v6.number), 
    rootPlaceId = v6.union(v6.number, v6.string), 
    linkId = v6.string, 
    linkType = v6.string, 
    linkStatus = v6.string, 
    joinAttemptId = v6.optional(v6.string)
});
local v30 = v6.strictInterface({
    friendId = v6.string, 
    pageName = v6.string, 
    placeId = v6.optional(v6.string), 
    rootPlaceId = v6.optional(v6.string), 
    joinAttemptId = v6.string
});
local v31 = v6.strictInterface({
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
    pageName = v6.optional(v6.string)
});
local v32 = if l_FFlagEnableInGameExitModalNextUpUi_0 then v6.strictInterface({
    placeId = v6.string, 
    rootPlaceId = v6.number, 
    universeId = v6.string, 
    sortEntryIndex = v6.string, 
    gameSetTypeId = v6.string, 
    joinAttemptId = v6.string
}) else nil;
local v33 = if l_FFlagTraversalHistoryDiscoveryTelemetry_0 then v6.strictInterface({
    placeId = v6.string, 
    universeId = v6.string, 
    sortEntryIndex = v6.string
}) else nil;
local v34 = {
    PlayButton = v23, 
    [v19.Context.ExperienceTile] = v24, 
    [v19.Context.SearchExperienceTile] = v25, 
    [v19.Context.PeopleListInHomePage] = v26, 
    [v19.Context.GamePlayIntentInPlacesList] = v27, 
    shareLinks = v29, 
    PlayGameFromPlayTogether = v22, 
    PlayGameFromLinkCard = v28, 
    [v19.Context.PlayerContextualMenu] = v30, 
    [v19.Context.HoldToPlayLauncher] = v31, 
    [v19.Context.InExpHistoryTile] = if l_FFlagTraversalHistoryDiscoveryTelemetry_0 then v33 else nil, 
    InGameExitPage = if l_FFlagEnableInGameExitModalNextUpUi_0 then v32 else nil
};
local function _(v35) --[[ Line: 202 ]] --[[ Name: addMobileAdvertisingIdToEventParams ]]
    -- upvalues: l_AppStorageService_0 (copy)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
    if l_l_AppStorageService_0_Item_0 and l_l_AppStorageService_0_Item_0 ~= "" then
        v35.mobileAdvertisingId = l_l_AppStorageService_0_Item_0;
    end;
end;
return function(v38, v39, v40) --[[ Line: 209 ]]
    -- upvalues: v34 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), l_HttpService_0 (copy), l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 (copy), l_AppStorageService_0 (copy), l_FFlagLuaAppMigrateGameEventsTelemetryService_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), v5 (copy), l_TelemetryService_0 (copy), v20 (ref), l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 (copy), v21 (ref)
    if v34[v39] ~= nil then
        local v41, v42 = v34[v39](v40);
        if not v41 then
            l_DiscoveryEventErrorLogger_0.reportError("GamePlayIntentInvalidInterface", v42);
        end;
    else
        l_DiscoveryEventErrorLogger_0.reportError("GamePlayIntentMissingInterface", ("Missing interface for eventContext %* to type check gamePlayIntent event parameters"):format(v39), {
            eventContext = v39
        });
    end;
    local v43 = if l_FFlagLuaAppLogOmniAnalyticsData_0 then v40.analyticsData else nil;
    if not v40.interactionUuid then
        v40.interactionUuid = l_HttpService_0:GenerateGUID(false);
    end;
    if not v40.contentType then
        v40.contentType = "Game";
    end;
    if not v40.actionType then
        v40.actionType = "PlayButtonClick";
    end;
    if l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 then
        local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
        if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
            v40.mobileAdvertisingId = l_l_AppStorageService_0_Item_1;
        end;
    end;
    if l_FFlagLuaAppMigrateGameEventsTelemetryService_0 then
        local v45 = {
            placeId = v40.placeId, 
            rootPlaceId = v40.rootPlaceId, 
            universeId = v40.universeId, 
            referralSource = v40.referralSource, 
            sortIndex = v40.sortIndex, 
            sortEntryIndex = v40.sortEntryIndex, 
            gameSetTypeId = v40.gameSetTypeId, 
            gameSetTargetId = v40.gameSetTargetId, 
            linkId = v40.linkId, 
            linkType = v40.linkType, 
            linkStatus = v40.linkStatus, 
            conversationId = v40.conversationId, 
            joinAttemptId = v40.joinAttemptId, 
            friendId = v40.friendId, 
            pageName = v40.pageName, 
            rowOnPage = v40.rowOnPage, 
            appliedFilters = v40.appliedFilters, 
            topicDataPosition = v40.topicDataPosition, 
            nativeAdData = v40.nativeAdData, 
            interactionUuid = v40.interactionUuid, 
            contentType = v40.contentType, 
            actionType = v40.actionType, 
            positionInRow = v40.positionInRow, 
            rowNumber = v40.rowNumber, 
            feedRowNumber = v40.feedRowNumber, 
            heroUnitId = v40.heroUnitId, 
            mobileAdvertisingId = if l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 then v40.mobileAdvertisingId else nil, 
            loadSource = v40.loadSource, 
            launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v40.launchData then v40.launchData else nil, 
            sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v40.sortSubId else nil
        };
        if l_FFlagLuaAppLogOmniAnalyticsData_0 and v43 then
            v45 = v5.Dictionary.join(v43, v45);
        end;
        l_TelemetryService_0:LogEvent(v20, {
            eventContext = v39, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v45
        });
    else
        local v46 = {
            placeId = v40.placeId, 
            rootPlaceId = v40.rootPlaceId, 
            universeId = v40.universeId, 
            referralSource = v40.referralSource, 
            sortIndex = v40.sortIndex, 
            sortEntryIndex = v40.sortEntryIndex, 
            gameSetTypeId = v40.gameSetTypeId, 
            gameSetTargetId = v40.gameSetTargetId, 
            linkId = v40.linkId, 
            linkType = v40.linkType, 
            linkStatus = v40.linkStatus, 
            conversationId = v40.conversationId, 
            joinAttemptId = v40.joinAttemptId, 
            friendId = v40.friendId, 
            pageName = v40.pageName, 
            rowOnPage = v40.rowOnPage, 
            appliedFilters = v40.appliedFilters, 
            topicDataPosition = v40.topicDataPosition, 
            nativeAdData = v40.nativeAdData, 
            interactionUuid = v40.interactionUuid, 
            contentType = v40.contentType, 
            actionType = v40.actionType, 
            positionInRow = v40.positionInRow, 
            rowNumber = v40.rowNumber, 
            feedRowNumber = v40.feedRowNumber, 
            heroUnitId = v40.heroUnitId, 
            mobileAdvertisingId = if l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 then v40.mobileAdvertisingId else nil, 
            loadSource = v40.loadSource, 
            launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v40.launchData then v40.launchData else nil, 
            sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v40.sortSubId else nil
        };
        if l_FFlagLuaAppLogOmniAnalyticsData_0 and v43 then
            v46 = v5.Dictionary.join(v43, v46);
        end;
        v38:sendEventDeferred(v39, "gamePlayIntent", v46);
    end;
    if l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 then
        l_TelemetryService_0:LogEvent(v21, {
            eventContext = v39, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = {
                placeId = v40.placeId, 
                rootPlaceId = v40.rootPlaceId, 
                universeId = v40.universeId, 
                referralSource = v40.referralSource, 
                sortIndex = v40.sortIndex, 
                sortEntryIndex = v40.sortEntryIndex, 
                gameSetTypeId = v40.gameSetTypeId, 
                gameSetTargetId = v40.gameSetTargetId, 
                linkId = v40.linkId, 
                linkType = v40.linkType, 
                linkStatus = v40.linkStatus, 
                conversationId = v40.conversationId, 
                joinAttemptId = v40.joinAttemptId, 
                friendId = v40.friendId, 
                pageName = v40.pageName, 
                rowOnPage = v40.rowOnPage, 
                appliedFilters = v40.appliedFilters, 
                topicDataPosition = v40.topicDataPosition, 
                nativeAdData = v40.nativeAdData, 
                interactionUuid = v40.interactionUuid, 
                contentType = v40.contentType, 
                actionType = v40.actionType, 
                positionInRow = v40.positionInRow, 
                rowNumber = v40.rowNumber, 
                feedRowNumber = v40.feedRowNumber, 
                heroUnitId = v40.heroUnitId, 
                mobileAdvertisingId = if l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 then v40.mobileAdvertisingId else nil, 
                loadSource = v40.loadSource, 
                launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v40.launchData then v40.launchData else nil, 
                sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v40.sortSubId else nil
            }
        });
    end;
end;