local l_HttpService_0 = game:GetService("HttpService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.t);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_FFlagEnableInGameExitModalNextUpUi_0 = require(l_Parent_0.SharedFlags).FFlagEnableInGameExitModalNextUpUi;
local l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGamePlayIntentEventMobileAdsId;
local l_FFlagTraversalHistoryDiscoveryTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppEnableCustomSpawnSearch_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSearch;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local l_FFlagLuaAppMigrateGameEventsTelemetryService_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameEventsTelemetryService;
local l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameEventsTelemetryServiceShadowTraffic;
local v15 = game:DefineFastInt("LuaAppGamePlayIntentEventThrottlingHundredthsPercent", 10000);
local v16 = game:DefineFastInt("LuaAppGamePlayIntentShadowThrottlingHundredthsPercent", 10000);
local v17 = require(l_script_FirstAncestor_0.Constants);
local v18 = nil;
if l_FFlagLuaAppMigrateGameEventsTelemetryService_0 then
    v18 = {
        eventName = "gamePlayIntent", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v15, 
        lastUpdated = {
            26, 
            2, 
            4
        }, 
        description = "Fires when the user clicks on a Play Button"
    };
end;
local v19 = nil;
if l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 then
    v19 = {
        eventName = "gamePlayIntentShadow", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v16, 
        lastUpdated = {
            26, 
            3, 
            4
        }, 
        description = "Shadow traffic for gamePlayIntent event recovery percentage"
    };
end;
local v20 = v5.strictInterface({
    placeId = v5.union(v5.string, v5.number), 
    rootPlaceId = v5.union(v5.number, v5.string), 
    referralSource = v5.optional(v5.string), 
    sortIndex = v5.optional(v5.string), 
    sortEntryIndex = v5.optional(v5.string), 
    gameSetTypeId = v5.optional(v5.string), 
    gameSetTargetId = v5.optional(v5.number), 
    linkId = v5.optional(v5.union(v5.string, v5.number)), 
    linkType = v5.optional(v5.string), 
    linkStatus = v5.optional(v5.string), 
    conversationId = v5.optional(v5.union(v5.number, v5.string)), 
    joinAttemptId = v5.optional(v5.string), 
    uid = v5.optional(v5.string), 
    launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v5.optional(v5.string) else nil
});
local v21 = v5.strictInterface({
    placeId = v5.union(v5.string, v5.number), 
    rootPlaceId = v5.union(v5.number, v5.string), 
    referralSource = v5.optional(v5.string), 
    universeId = v5.string, 
    launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v5.optional(v5.string) else nil
});
local v22 = v5.strictInterface({
    placeId = v5.string, 
    rootPlaceId = v5.number, 
    universeId = v5.string, 
    referralSource = v5.optional(v5.string), 
    sortIndex = v5.string, 
    sortEntryIndex = v5.string, 
    gameSetTypeId = v5.optional(v5.string), 
    gameSetTargetId = v5.optional(v5.number), 
    appliedFilters = v5.optional(v5.string), 
    topicDataPosition = v5.optional(v5.number), 
    nativeAdData = v5.optional(v5.string), 
    pageName = v5.optional(v5.string), 
    positionInRow = v5.optional(v5.number), 
    rowNumber = v5.optional(v5.number), 
    feedRowNumber = v5.optional(v5.number), 
    heroUnitId = v5.optional(v5.string), 
    loadSource = v5.optional(v5.string), 
    launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v5.optional(v5.string) else nil, 
    sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v5.optional(v5.string) else nil
});
local v23 = v5.strictInterface({
    placeId = v5.string, 
    rootPlaceId = v5.number, 
    universeId = v5.string, 
    sortEntryIndex = v5.string, 
    gameSetTypeId = v5.string, 
    sortIndex = v5.number, 
    rowOnPage = v5.optional(v5.number), 
    topicDataPosition = v5.optional(v5.number), 
    nativeAdData = v5.optional(v5.string), 
    pageName = v5.optional(v5.string), 
    launchData = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v5.optional(v5.string) else nil
});
local v24 = v5.strictInterface({
    placeId = v5.string, 
    rootPlaceId = v5.number, 
    joinAttemptId = v5.optional(v5.string), 
    friendId = v5.string
});
local v25 = v5.strictInterface({
    placeId = v5.string, 
    rootPlaceId = v5.number, 
    joinAttemptId = v5.optional(v5.string), 
    friendId = v5.string
});
local v26 = v5.strictInterface({
    placeId = v5.string, 
    rootPlaceId = v5.number, 
    joinAttemptId = v5.optional(v5.string), 
    conversationId = v5.optional(v5.string)
});
local v27 = v5.strictInterface({
    placeId = v5.union(v5.string, v5.number), 
    rootPlaceId = v5.union(v5.number, v5.string), 
    linkId = v5.string, 
    linkType = v5.string, 
    linkStatus = v5.string, 
    joinAttemptId = v5.optional(v5.string)
});
local v28 = v5.strictInterface({
    friendId = v5.string, 
    pageName = v5.string, 
    placeId = v5.optional(v5.string), 
    rootPlaceId = v5.optional(v5.string), 
    joinAttemptId = v5.string
});
local v29 = v5.strictInterface({
    placeId = v5.string, 
    rootPlaceId = v5.number, 
    universeId = v5.string, 
    referralSource = v5.string, 
    sortIndex = v5.string, 
    sortEntryIndex = v5.string, 
    gameSetTypeId = v5.string, 
    gameSetTargetId = v5.optional(v5.number), 
    topicDataPosition = v5.optional(v5.number), 
    nativeAdData = v5.optional(v5.string), 
    pageName = v5.optional(v5.string)
});
local v30 = if l_FFlagEnableInGameExitModalNextUpUi_0 then v5.strictInterface({
    placeId = v5.string, 
    rootPlaceId = v5.number, 
    universeId = v5.string, 
    sortEntryIndex = v5.string, 
    gameSetTypeId = v5.string, 
    joinAttemptId = v5.string
}) else nil;
local v31 = if l_FFlagTraversalHistoryDiscoveryTelemetry_0 then v5.strictInterface({
    placeId = v5.string, 
    universeId = v5.string, 
    sortEntryIndex = v5.string
}) else nil;
local v32 = {
    PlayButton = v21, 
    [v17.Context.ExperienceTile] = v22, 
    [v17.Context.SearchExperienceTile] = v23, 
    [v17.Context.PeopleListInHomePage] = v24, 
    [v17.Context.GamePlayIntentInPlacesList] = v25, 
    shareLinks = v27, 
    PlayGameFromPlayTogether = v20, 
    PlayGameFromLinkCard = v26, 
    [v17.Context.PlayerContextualMenu] = v28, 
    [v17.Context.HoldToPlayLauncher] = v29, 
    [v17.Context.InExpHistoryTile] = if l_FFlagTraversalHistoryDiscoveryTelemetry_0 then v31 else nil, 
    InGameExitPage = if l_FFlagEnableInGameExitModalNextUpUi_0 then v30 else nil
};
local function _(v33) --[[ Line: 199 ]] --[[ Name: addMobileAdvertisingIdToEventParams ]]
    -- upvalues: l_AppStorageService_0 (copy)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
    if l_l_AppStorageService_0_Item_0 and l_l_AppStorageService_0_Item_0 ~= "" then
        v33.mobileAdvertisingId = l_l_AppStorageService_0_Item_0;
    end;
end;
return function(v36, v37, v38) --[[ Line: 206 ]]
    -- upvalues: v32 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_HttpService_0 (copy), l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 (copy), l_AppStorageService_0 (copy), l_FFlagLuaAppMigrateGameEventsTelemetryService_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), l_TelemetryService_0 (copy), v18 (ref), l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 (copy), v19 (ref)
    if v32[v37] ~= nil then
        local v39, v40 = v32[v37](v38);
        if not v39 then
            l_DiscoveryEventErrorLogger_0.reportError("GamePlayIntentInvalidInterface", v40);
        end;
    else
        l_DiscoveryEventErrorLogger_0.reportError("GamePlayIntentMissingInterface", ("Missing interface for eventContext %* to type check gamePlayIntent event parameters"):format(v37), {
            eventContext = v37
        });
    end;
    if not v38.interactionUuid then
        v38.interactionUuid = l_HttpService_0:GenerateGUID(false);
    end;
    if not v38.contentType then
        v38.contentType = "Game";
    end;
    if not v38.actionType then
        v38.actionType = "PlayButtonClick";
    end;
    if l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 then
        local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
        if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
            v38.mobileAdvertisingId = l_l_AppStorageService_0_Item_1;
        end;
    end;
    if l_FFlagLuaAppMigrateGameEventsTelemetryService_0 then
        local v42 = {
            placeId = v38.placeId, 
            rootPlaceId = v38.rootPlaceId, 
            universeId = v38.universeId, 
            referralSource = v38.referralSource, 
            sortIndex = v38.sortIndex, 
            sortEntryIndex = v38.sortEntryIndex, 
            gameSetTypeId = v38.gameSetTypeId, 
            gameSetTargetId = v38.gameSetTargetId, 
            linkId = v38.linkId, 
            linkType = v38.linkType, 
            linkStatus = v38.linkStatus, 
            conversationId = v38.conversationId, 
            joinAttemptId = v38.joinAttemptId, 
            friendId = v38.friendId, 
            pageName = v38.pageName, 
            rowOnPage = v38.rowOnPage, 
            appliedFilters = v38.appliedFilters, 
            topicDataPosition = v38.topicDataPosition, 
            nativeAdData = v38.nativeAdData, 
            interactionUuid = v38.interactionUuid, 
            contentType = v38.contentType, 
            actionType = v38.actionType, 
            positionInRow = v38.positionInRow, 
            rowNumber = v38.rowNumber, 
            feedRowNumber = v38.feedRowNumber, 
            heroUnitId = v38.heroUnitId, 
            mobileAdvertisingId = if l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 then v38.mobileAdvertisingId else nil, 
            loadSource = v38.loadSource, 
            launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v38.launchData then v38.launchData else nil, 
            sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v38.sortSubId else nil
        };
        l_TelemetryService_0:LogEvent(v18, {
            eventContext = v37, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v42
        });
    else
        v36:sendEventDeferred(v37, "gamePlayIntent", {
            placeId = v38.placeId, 
            rootPlaceId = v38.rootPlaceId, 
            universeId = v38.universeId, 
            referralSource = v38.referralSource, 
            sortIndex = v38.sortIndex, 
            sortEntryIndex = v38.sortEntryIndex, 
            gameSetTypeId = v38.gameSetTypeId, 
            gameSetTargetId = v38.gameSetTargetId, 
            linkId = v38.linkId, 
            linkType = v38.linkType, 
            linkStatus = v38.linkStatus, 
            conversationId = v38.conversationId, 
            joinAttemptId = v38.joinAttemptId, 
            friendId = v38.friendId, 
            pageName = v38.pageName, 
            rowOnPage = v38.rowOnPage, 
            appliedFilters = v38.appliedFilters, 
            topicDataPosition = v38.topicDataPosition, 
            nativeAdData = v38.nativeAdData, 
            interactionUuid = v38.interactionUuid, 
            contentType = v38.contentType, 
            actionType = v38.actionType, 
            positionInRow = v38.positionInRow, 
            rowNumber = v38.rowNumber, 
            feedRowNumber = v38.feedRowNumber, 
            heroUnitId = v38.heroUnitId, 
            mobileAdvertisingId = if l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 then v38.mobileAdvertisingId else nil, 
            loadSource = v38.loadSource, 
            launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v38.launchData then v38.launchData else nil, 
            sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v38.sortSubId else nil
        });
    end;
    if l_FFlagLuaAppGameEventsTelemetryServiceShadowTraffic_0 then
        l_TelemetryService_0:LogEvent(v19, {
            eventContext = v37, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = {
                placeId = v38.placeId, 
                rootPlaceId = v38.rootPlaceId, 
                universeId = v38.universeId, 
                referralSource = v38.referralSource, 
                sortIndex = v38.sortIndex, 
                sortEntryIndex = v38.sortEntryIndex, 
                gameSetTypeId = v38.gameSetTypeId, 
                gameSetTargetId = v38.gameSetTargetId, 
                linkId = v38.linkId, 
                linkType = v38.linkType, 
                linkStatus = v38.linkStatus, 
                conversationId = v38.conversationId, 
                joinAttemptId = v38.joinAttemptId, 
                friendId = v38.friendId, 
                pageName = v38.pageName, 
                rowOnPage = v38.rowOnPage, 
                appliedFilters = v38.appliedFilters, 
                topicDataPosition = v38.topicDataPosition, 
                nativeAdData = v38.nativeAdData, 
                interactionUuid = v38.interactionUuid, 
                contentType = v38.contentType, 
                actionType = v38.actionType, 
                positionInRow = v38.positionInRow, 
                rowNumber = v38.rowNumber, 
                feedRowNumber = v38.feedRowNumber, 
                heroUnitId = v38.heroUnitId, 
                mobileAdvertisingId = if l_FFlagLuaAppGamePlayIntentEventMobileAdsId_0 then v38.mobileAdvertisingId else nil, 
                loadSource = v38.loadSource, 
                launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v38.launchData then v38.launchData else nil, 
                sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v38.sortSubId else nil
            }
        });
    end;
end;