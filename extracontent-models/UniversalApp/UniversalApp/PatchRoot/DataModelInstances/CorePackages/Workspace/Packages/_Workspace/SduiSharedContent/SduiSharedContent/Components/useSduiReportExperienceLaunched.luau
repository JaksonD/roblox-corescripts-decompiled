local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local l_calculateRowPositionFields_0 = require(l_Parent_0.UnifiedLogging).calculateRowPositionFields;
local l_SetGamePlaySession_0 = require(l_Parent_0.RobloxAppSessionization).SetGamePlaySession;
local v4 = require(l_Parent_0.DiscoveryAnalytics);
local l_gamePlayIntent_0 = v4.Events.gamePlayIntent;
local l_sponsoredGamesRecordClick_0 = v4.Requests.sponsoredGamesRecordClick;
local l_findAnalyticsFieldInAncestors_0 = require(l_Parent_0.SduiCoreSystem).findAnalyticsFieldInAncestors;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix;
return function(v9, v10, v11, v12, v13, v14) --[[ Line: 21 ]] --[[ Name: useSduiReportExperienceLaunched ]]
    -- upvalues: v1 (copy), l_findAnalyticsFieldInAncestors_0 (copy), l_SetGamePlaySession_0 (copy), l_sponsoredGamesRecordClick_0 (copy), l_calculateRowPositionFields_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_gamePlayIntent_0 (copy)
    local l_eventIngest_0 = v9.dependencies.eventIngest;
    local l_sessionService_0 = v9.dependencies.sessionService;
    return v1.useCallback(function() --[[ Line: 33 ]]
        -- upvalues: v13 (ref), v12 (copy), v10 (copy), l_findAnalyticsFieldInAncestors_0 (ref), l_SetGamePlaySession_0 (ref), l_sessionService_0 (copy), l_sponsoredGamesRecordClick_0 (ref), v9 (copy), l_calculateRowPositionFields_0 (ref), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_gamePlayIntent_0 (ref), l_eventIngest_0 (copy), v11 (copy), v14 (copy)
        v13 = v13 or v12;
        local v17 = nil;
        local v18 = nil;
        local v19 = nil;
        local v20 = nil;
        local v21 = v10.getCollectionData and v10.getCollectionData() or nil;
        if v21 then
            v17 = v21.collectionPosition;
            v18 = v21.collectionId;
            v19 = v21.itemsPerRow;
            v20 = v21.startRowNumber;
        end;
        v17 = v17 or l_findAnalyticsFieldInAncestors_0("collectionIndex", v10);
        v18 = v18 or l_findAnalyticsFieldInAncestors_0("collectionId", v10);
        local v22 = l_findAnalyticsFieldInAncestors_0("gameSetTargetId", v10);
        local v23 = l_findAnalyticsFieldInAncestors_0("itemPosition", v10, -1);
        local v24 = l_findAnalyticsFieldInAncestors_0("topicDataPosition", v10, v23);
        local v25 = l_findAnalyticsFieldInAncestors_0("heroUnitId", v10);
        local v26 = l_findAnalyticsFieldInAncestors_0("eventContext", v10, "ExperienceTile");
        local v27 = l_findAnalyticsFieldInAncestors_0("referralSource", v10);
        local v28 = l_findAnalyticsFieldInAncestors_0("gamePlaySessionType", v10);
        if v28 then
            l_SetGamePlaySession_0(l_sessionService_0, v28, true);
        end;
        local v29 = l_findAnalyticsFieldInAncestors_0("nativeAdData", v10);
        if v29 == nil then
            v29 = l_findAnalyticsFieldInAncestors_0("adId", v10);
        end;
        if v29 then
            l_sponsoredGamesRecordClick_0(v9.dependencies.networking, (tostring(v29)));
        end;
        local v30 = l_calculateRowPositionFields_0(v23, v19, v20);
        local v31 = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then l_findAnalyticsFieldInAncestors_0("tileType", v10, "GameTile") else nil;
        l_gamePlayIntent_0(l_eventIngest_0, tostring(v26), {
            placeId = tostring(v12), 
            rootPlaceId = tonumber(v13), 
            universeId = tostring(v11), 
            sortIndex = tostring(v17), 
            sortEntryIndex = if v23 then tostring(v23) else nil, 
            referralSource = v27, 
            gameSetTypeId = tostring(v18), 
            gameSetTargetId = v22, 
            appliedFilters = v14, 
            topicDataPosition = v24, 
            nativeAdData = v29, 
            pageName = v9.appPage, 
            positionInRow = v30.positionInRow, 
            rowNumber = v30.rowInSort, 
            feedRowNumber = v30.rowOnPage, 
            heroUnitId = v25, 
            tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v31 else nil
        });
    end, {
        l_eventIngest_0, 
        v10, 
        v11, 
        v12, 
        v13, 
        v14, 
        l_sessionService_0, 
        v9
    });
end;