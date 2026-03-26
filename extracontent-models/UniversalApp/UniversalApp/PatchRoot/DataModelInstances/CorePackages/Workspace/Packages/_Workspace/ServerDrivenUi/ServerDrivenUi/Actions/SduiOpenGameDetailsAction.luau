local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_GetInputModeStore_0 = require(l_Parent_0.Responsive).GetInputModeStore;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local l_IntervalPerformanceTracker_0 = require(l_Parent_0.IntervalPerformanceTracker).IntervalPerformanceTracker;
local l_sponsoredGamesRecordClick_0 = require(l_Parent_0.DiscoveryAnalytics).Requests.sponsoredGamesRecordClick;
local l_calculateRowPositionFields_0 = require(l_Parent_0.UnifiedLogging).calculateRowPositionFields;
local v6 = require(l_Parent_0.SduiCoreSystem);
local l_findAnalyticsFieldInAncestors_0 = v6.findAnalyticsFieldInAncestors;
local l_SduiParsers_0 = v6.SduiParsers;
local l_SduiErrors_0 = v6.SduiErrors;
local v10 = {};
return function(v11, v12, v13) --[[ Line: 25 ]]
    -- upvalues: l_SduiErrors_0 (copy), l_GetInputModeStore_0 (copy), v10 (copy), l_findAnalyticsFieldInAncestors_0 (copy), l_IntervalPerformanceTracker_0 (copy), l_SduiParsers_0 (copy), l_sponsoredGamesRecordClick_0 (copy), l_calculateRowPositionFields_0 (copy), l_OpenGameDetails_0 (copy)
    v13.dependencies.logger.reportCounter(l_SduiErrors_0.SduiCounterName.OpenGameDetailsAction, {
        name = l_GetInputModeStore_0(false).getLastInputType(false)
    }, true);
    local v14 = v11 and v11.actionParams or v10;
    local v15 = l_findAnalyticsFieldInAncestors_0("itemComponentType", v12);
    if v15 == "Tile" or v15 == "GameTile" then
        l_IntervalPerformanceTracker_0:startTracking("AppGameTile_to_GameDetail", 2);
    end;
    local v16 = v14.placeId or l_findAnalyticsFieldInAncestors_0("placeId", v12);
    local v17 = v14.universeId or l_findAnalyticsFieldInAncestors_0("universeId", v12);
    local v18 = l_findAnalyticsFieldInAncestors_0("itemPosition", v12);
    local v19 = l_SduiParsers_0.safeParseBoolean(l_findAnalyticsFieldInAncestors_0("adFlag", v12, false), v13, v12);
    local v20 = l_findAnalyticsFieldInAncestors_0("nativeAdData", v12);
    if v20 == nil then
        v20 = l_findAnalyticsFieldInAncestors_0("adId", v12);
    end;
    local v21 = l_findAnalyticsFieldInAncestors_0("navigationUniverseId", v12, v17);
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = v12.getCollectionData and v12.getCollectionData() or nil;
    if v27 then
        v22 = v27.collectionPosition;
        v23 = v27.collectionId;
        v24 = v27.totalNumberOfItems;
        v25 = v27.itemsPerRow;
        v26 = v27.startRowNumber;
    end;
    v22 = v22 or l_findAnalyticsFieldInAncestors_0("collectionIndex", v12);
    v23 = v23 or l_findAnalyticsFieldInAncestors_0("collectionId", v12);
    v24 = v24 or l_findAnalyticsFieldInAncestors_0("totalNumberOfItems", v12);
    local v28 = l_findAnalyticsFieldInAncestors_0("gameSetTargetId", v12);
    local v29 = l_findAnalyticsFieldInAncestors_0("heroUnitId", v12);
    local l_dependencies_0 = v13.dependencies;
    if v19 and v20 then
        l_sponsoredGamesRecordClick_0(l_dependencies_0.networking, (tostring(v20)));
    end;
    local v31 = l_calculateRowPositionFields_0(v18, v25, v26);
    l_dependencies_0.gameAnalytics.reportOpenGameDetailWithId(v16, tostring(v23), v28, v22, v18, v24, v19, v20, tostring(v17), v13.appPage, tostring(v21), nil, v18, true, v31.positionInRow, v31.rowInSort, v31.rowOnPage, v29);
    local v32 = l_dependencies_0.getNavigation();
    l_dependencies_0.dispatch(l_OpenGameDetails_0(tostring(v21), v32, {
        index = v18
    }));
    v13.dependencies.logger.reportCounter(l_SduiErrors_0.SduiCounterName.OpenGameDetailsActionFinish, {
        name = l_GetInputModeStore_0(false).getLastInputType(false)
    }, true);
end;