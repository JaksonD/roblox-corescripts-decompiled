local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local l_SponsoredGamesRecordClick_0 = require(l_Parent_0.GameTile).SponsoredGamesRecordClick;
local l_calculateRowPositionFields_0 = require(l_Parent_0.UnifiedLogging).calculateRowPositionFields;
local l_SetGamePlaySession_0 = require(l_Parent_0.RobloxAppSessionization).SetGamePlaySession;
local l_gamePlayIntent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.gamePlayIntent;
local l_findAnalyticsFieldInAncestors_0 = require(l_Parent_0.SduiCoreSystem).findAnalyticsFieldInAncestors;
return function(v7, v8, v9, v10, v11, v12) --[[ Line: 19 ]] --[[ Name: useSduiReportExperienceLaunched ]]
    -- upvalues: v1 (copy), l_findAnalyticsFieldInAncestors_0 (copy), l_SetGamePlaySession_0 (copy), l_SponsoredGamesRecordClick_0 (copy), l_calculateRowPositionFields_0 (copy), l_gamePlayIntent_0 (copy)
    local l_eventIngest_0 = v7.dependencies.eventIngest;
    local l_sessionService_0 = v7.dependencies.sessionService;
    return v1.useCallback(function() --[[ Line: 31 ]]
        -- upvalues: v11 (ref), v10 (copy), v8 (copy), l_findAnalyticsFieldInAncestors_0 (ref), l_SetGamePlaySession_0 (ref), l_sessionService_0 (copy), l_SponsoredGamesRecordClick_0 (ref), v7 (copy), l_calculateRowPositionFields_0 (ref), l_gamePlayIntent_0 (ref), l_eventIngest_0 (copy), v9 (copy), v12 (copy)
        v11 = v11 or v10;
        local v15 = nil;
        local v16 = nil;
        local v17 = nil;
        local v18 = nil;
        local v19 = v8.getCollectionData and v8.getCollectionData() or nil;
        if v19 then
            v15 = v19.collectionPosition;
            v16 = v19.collectionId;
            v17 = v19.itemsPerRow;
            v18 = v19.startRowNumber;
        end;
        v15 = v15 or l_findAnalyticsFieldInAncestors_0("collectionIndex", v8);
        v16 = v16 or l_findAnalyticsFieldInAncestors_0("collectionId", v8);
        local v20 = l_findAnalyticsFieldInAncestors_0("gameSetTargetId", v8);
        local v21 = l_findAnalyticsFieldInAncestors_0("itemPosition", v8, -1);
        local v22 = l_findAnalyticsFieldInAncestors_0("topicDataPosition", v8, v21);
        local v23 = l_findAnalyticsFieldInAncestors_0("heroUnitId", v8);
        local v24 = l_findAnalyticsFieldInAncestors_0("eventContext", v8, "ExperienceTile");
        local v25 = l_findAnalyticsFieldInAncestors_0("referralSource", v8);
        local v26 = l_findAnalyticsFieldInAncestors_0("gamePlaySessionType", v8);
        if v26 then
            l_SetGamePlaySession_0(l_sessionService_0, v26, true);
        end;
        local v27 = l_findAnalyticsFieldInAncestors_0("nativeAdData", v8);
        if v27 == nil then
            v27 = l_findAnalyticsFieldInAncestors_0("adId", v8);
        end;
        if v27 then
            l_SponsoredGamesRecordClick_0(v7.dependencies.networking, (tostring(v27)));
        end;
        local v28 = l_calculateRowPositionFields_0(v21, v17, v18);
        l_gamePlayIntent_0(l_eventIngest_0, tostring(v24), {
            placeId = tostring(v10), 
            rootPlaceId = tonumber(v11), 
            universeId = tostring(v9), 
            sortIndex = tostring(v15), 
            sortEntryIndex = if v21 then tostring(v21) else nil, 
            referralSource = v25, 
            gameSetTypeId = tostring(v16), 
            gameSetTargetId = v20, 
            appliedFilters = v12, 
            topicDataPosition = v22, 
            nativeAdData = v27, 
            pageName = v7.appPage, 
            positionInRow = v28.positionInRow, 
            rowNumber = v28.rowInSort, 
            feedRowNumber = v28.rowOnPage, 
            heroUnitId = v23
        });
    end, {
        l_eventIngest_0, 
        v8, 
        v9, 
        v10, 
        v11, 
        v12, 
        l_sessionService_0, 
        v7
    });
end;