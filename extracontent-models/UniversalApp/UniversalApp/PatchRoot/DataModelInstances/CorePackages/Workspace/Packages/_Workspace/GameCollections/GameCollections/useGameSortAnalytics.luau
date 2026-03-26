local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_Parent_0.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_gamePlayIntent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.gamePlayIntent;
local l_reportGameAttributionError_0 = require(l_Parent_0.DiscoveryAnalytics).Events.reportGameAttributionError;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_useStore_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore;
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local l_GameSortLoadSource_0 = require(l_Parent_0.DiscoveryAvailability).GameSortLoadSource;
local l_feedScroll_0 = require(l_Parent_0.ScrollTelemetry).feedScroll;
local l_calculateRowPositionFields_0 = require(l_Parent_0.UnifiedLogging).calculateRowPositionFields;
local v14 = require(l_Parent_0.Cryo);
local l_FFlagLuaAppLogGameAttributionError_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogGameAttributionError;
local l_FFlagLuaAppGameDetailsAttributionFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameDetailsAttributionFix;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixGameSortAnalyticFromSearch;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix;
local l_FFlagLuaAppLogOmniAnalyticsData_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogOmniAnalyticsData;
local v23 = {};
local function _(v24, v25) --[[ Line: 34 ]] --[[ Name: mergeAnalyticsData ]]
    -- upvalues: v14 (copy), v23 (copy)
    if not v24 and not v25 then
        return nil;
    else
        local v26 = v14.Dictionary.join(v24 or v23, v25 or v23);
        if next(v26) then
            return v26;
        else
            return nil;
        end;
    end;
end;
local v28 = if l_FFlagLuaAppLogGameAttributionError_0 then {
    GameDetail = "GameDetail", 
    PlayIntent = "PlayIntent"
} else nil;
local function _(v29, v30, v31) --[[ Line: 56 ]] --[[ Name: getGameSetTypeId ]]
    -- upvalues: l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 (copy)
    if v29 ~= nil then
        if v30 or if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 then v31 else false then
            return v29.topicId;
        else
            return v29.gameSetTypeId;
        end;
    else
        return nil;
    end;
end;
local function _(v33, v34) --[[ Line: 68 ]] --[[ Name: getGameSetTargetId ]]
    if not v34 and v33 ~= nil then
        return v33.gameSetTargetId;
    else
        return nil;
    end;
end;
local function _(v36, v37) --[[ Line: 78 ]] --[[ Name: getAppliedFilters ]]
    if not v37 and v36 then
        return v36.appliedFilters;
    else
        return nil;
    end;
end;
return function(v39, v40, v41, v42, v43, v44, v45, v46) --[[ Line: 91 ]] --[[ Name: useGameSortAnalytics ]]
    -- upvalues: l_useStore_0 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_AppEventIngestService_0 (copy), l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 (copy), l_AppPage_0 (copy), l_GameSortLoadSource_0 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), v1 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), l_reportGameAttributionError_0 (copy), v28 (copy), l_mutedError_0 (copy), l_calculateRowPositionFields_0 (copy), v14 (copy), v23 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_GameCollectionItemTypes_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppLogGameAttributionError_0 (copy), l_gamePlayIntent_0 (copy), l_feedScroll_0 (copy)
    local v47 = l_useStore_0();
    local v48 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v49 = l_useRoactService_0(l_AppEventIngestService_0);
    local v50 = if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 then v42 == l_AppPage_0.SearchPage else nil;
    local v51 = if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 then v50 else nil;
    local v52 = if v39 ~= nil then if v40 or if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 then v51 else false then v39.topicId else v39.gameSetTypeId else nil;
    v51 = if not v40 and v39 ~= nil then v39.gameSetTargetId else nil;
    local v53 = if not v40 and v39 then v39.appliedFilters else nil;
    local v54 = if v42 == l_AppPage_0.Home and v39 and v39.topicId then l_GameSortLoadSource_0.getSortLoadSource(v39.topicId) else nil;
    local v55 = if l_FFlagLuaAppAddSubIdToHomeEvents_0 and v39 then v39.sortSubId else nil;
    local v56 = if l_FFlagLuaAppLogOmniAnalyticsData_0 and v39 then v39.analyticsData else nil;
    return v1.useCallback(function(v57, v58, v59) --[[ Line: 124 ]]
        -- upvalues: l_FFlagLuaAppGameDetailsAttributionFix_0 (ref), v44 (copy), l_reportGameAttributionError_0 (ref), v42 (copy), v28 (ref), v52 (copy), v51 (copy), v41 (copy), l_mutedError_0 (ref), l_calculateRowPositionFields_0 (ref), v45 (copy), v46 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (ref), v56 (copy), v14 (ref), v23 (ref), v48 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v53 (copy), v54 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), l_FFlagLuaAppAddSubIdToHomeEvents_0 (ref), v55 (copy)
        if l_FFlagLuaAppGameDetailsAttributionFix_0 then
            local v60 = nil;
            local v61 = nil;
            if v57 and v44 then
                v61 = v44[v57];
                v60 = not v61 or v61.universeId ~= v58;
            else
                v60 = true;
            end;
            if v60 then
                l_reportGameAttributionError_0(v42, {
                    errorType = v28.GameDetail, 
                    clickedUniverseId = v58, 
                    universeId = if v61 then v61.universeId else nil, 
                    gameSetTypeId = v52, 
                    gameSetTargetId = v51, 
                    sortIndex = v41, 
                    sortEntryIndex = v57 or nil
                });
            end;
        end;
        if v57 ~= nil and v44 ~= nil then
            local v62 = v44[v57];
            if not v62 then
                l_mutedError_0("reportGameDetailOpened requires a valid entry");
            end;
            local v63 = l_calculateRowPositionFields_0(v57, v45, v46);
            local v64;
            if l_FFlagLuaAppLogOmniAnalyticsData_0 then
                local l_v56_0 = v56;
                local l_analyticsData_0 = v62.analyticsData;
                if not l_v56_0 and not l_analyticsData_0 then
                    v64 = nil;
                else
                    local v67 = v14.Dictionary.join(l_v56_0 or v23, l_analyticsData_0 or v23);
                    v64 = if next(v67) then v67 else nil;
                end;
            else
                v64 = nil;
            end;
            v48.reportOpenGameDetailWithId(if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v62.placeIdOverride or v62.placeId else v62.placeId, v52, v51, v41, v57, #v44, v62.isSponsored, v62.adId, v62.universeId, v42, v58, v53, v62.topicContentsIndex or v57, nil, v63.positionInRow, v63.rowInSort, v63.rowOnPage, nil, v54, if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v62.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile else if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v59 else nil, if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v55 else nil, if l_FFlagLuaAppLogOmniAnalyticsData_0 then v64 else nil);
        end;
    end, {
        v48, 
        v41, 
        v42, 
        v52, 
        v51, 
        v44, 
        v45, 
        v46, 
        v54, 
        if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v55 else nil, 
        if l_FFlagLuaAppLogOmniAnalyticsData_0 then v56 else nil
    }), v1.useCallback(function(v68, v69, _, v71, v72) --[[ Line: 209 ]]
        -- upvalues: l_FFlagLuaAppLogGameAttributionError_0 (ref), v44 (copy), l_reportGameAttributionError_0 (ref), v28 (ref), v52 (copy), v51 (copy), v41 (copy), l_calculateRowPositionFields_0 (ref), v45 (copy), v46 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (ref), v56 (copy), v14 (ref), v23 (ref), l_gamePlayIntent_0 (ref), v49 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v53 (copy), v42 (copy), v54 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (ref), v55 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref)
        if l_FFlagLuaAppLogGameAttributionError_0 then
            local v73 = nil;
            local v74 = nil;
            if v72 and v44 then
                v74 = v44[v72];
                v73 = not v74 or v74.universeId ~= v68.universeId;
            else
                v73 = true;
            end;
            if v73 then
                l_reportGameAttributionError_0(v71, {
                    errorType = v28.PlayIntent, 
                    clickedUniverseId = v68.universeId, 
                    universeId = if v74 then v74.universeId else nil, 
                    gameSetTypeId = v52, 
                    gameSetTargetId = v51, 
                    sortIndex = v41, 
                    sortEntryIndex = v72 or nil
                });
            end;
        end;
        local v75 = l_calculateRowPositionFields_0(v72, v45, v46);
        local v76;
        if l_FFlagLuaAppLogOmniAnalyticsData_0 then
            local l_v56_1 = v56;
            local l_analyticsData_1 = v68.analyticsData;
            if not l_v56_1 and not l_analyticsData_1 then
                v76 = nil;
            else
                local v79 = v14.Dictionary.join(l_v56_1 or v23, l_analyticsData_1 or v23);
                v76 = if next(v79) then v79 else nil;
            end;
        else
            v76 = nil;
        end;
        l_gamePlayIntent_0(v49, v71, {
            placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v68.placeIdOverride or v68.placeId else v68.placeId, 
            rootPlaceId = tonumber(v68.placeId), 
            universeId = v68.universeId, 
            sortIndex = tostring(v41), 
            sortEntryIndex = if v72 then tostring(v72) else nil, 
            referralSource = v69, 
            gameSetTypeId = v52, 
            gameSetTargetId = v51, 
            appliedFilters = v53, 
            topicDataPosition = v68.topicContentsIndex or v72, 
            nativeAdData = v68.adId, 
            pageName = v42, 
            positionInRow = v75.positionInRow, 
            rowNumber = v75.rowInSort, 
            feedRowNumber = v75.rowOnPage, 
            loadSource = v54, 
            launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v68.launchDataOverride else nil, 
            sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v55 else nil, 
            tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v68.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile else nil, 
            analyticsData = if l_FFlagLuaAppLogOmniAnalyticsData_0 then v76 else nil
        });
    end, {
        v41, 
        v49, 
        v52, 
        v51, 
        if l_FFlagLuaAppLogGameAttributionError_0 then v44 else nil, 
        v42, 
        v45, 
        v46, 
        v54, 
        if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v55 else nil, 
        if l_FFlagLuaAppLogOmniAnalyticsData_0 then v56 else nil
    }), v1.useCallback(function() --[[ Line: 288 ]]
        -- upvalues: v48 (copy), v52 (copy), v51 (copy), v41 (copy)
        v48.reportSeeAllWithId(v52, v51, v41);
    end, {
        v48, 
        v52, 
        v51, 
        v41
    }), (v1.useCallback(function(v80, v81, v82) --[[ Line: 301 ]]
        -- upvalues: v43 (copy), l_mutedError_0 (ref), v47 (copy), v41 (copy), v52 (copy), v51 (copy), l_feedScroll_0 (ref), v49 (copy), v42 (copy)
        if v43 and v43.current ~= nil then
            local l_ScrollingDirection_0 = v43.current.ScrollingDirection;
            local v84 = 0;
            if l_ScrollingDirection_0 == Enum.ScrollingDirection.X then
                v84 = v43.current.AbsoluteSize.X;
            elseif l_ScrollingDirection_0 == Enum.ScrollingDirection.Y then
                v84 = v43.current.AbsoluteSize.Y;
            else
                l_mutedError_0((("Direction %* is an unsupported option for feedScroll event"):format(l_ScrollingDirection_0.Name)));
            end;
            local l_ScreenSize_0 = v47:getState().ScreenSize;
            local v86 = {
                distance = v80, 
                screenSizeX = l_ScreenSize_0.X, 
                screenSizeY = l_ScreenSize_0.Y, 
                scrollAreaSize = v84, 
                scrollDepth = if v84 > 0 then v80 / v84 else nil, 
                startDepth = if v84 > 0 then v82 / v84 else nil, 
                startPos = v82, 
                scrollDuration = v81, 
                sortPos = v41, 
                gameSetTypeId = v52, 
                gameSetTargetId = v51
            };
            l_feedScroll_0(v49, v42, l_ScrollingDirection_0, v86);
        end;
    end, {
        v49, 
        v41, 
        v42, 
        v43, 
        v52, 
        v51, 
        v47
    }));
end;