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
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix;
local l_FFlagLuaAppLogOmniAnalyticsData_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogOmniAnalyticsData;
local v22 = {};
local function _(v23, v24) --[[ Line: 33 ]] --[[ Name: mergeAnalyticsData ]]
    -- upvalues: v14 (copy), v22 (copy)
    if not v23 and not v24 then
        return nil;
    else
        local v25 = v14.Dictionary.join(v23 or v22, v24 or v22);
        if next(v25) then
            return v25;
        else
            return nil;
        end;
    end;
end;
local v27 = if l_FFlagLuaAppLogGameAttributionError_0 then {
    GameDetail = "GameDetail", 
    PlayIntent = "PlayIntent"
} else nil;
local function _(v28, v29, v30) --[[ Line: 55 ]] --[[ Name: getGameSetTypeId ]]
    if v28 ~= nil then
        if v29 or v30 then
            return v28.topicId;
        else
            return v28.gameSetTypeId;
        end;
    else
        return nil;
    end;
end;
local function _(v32, v33) --[[ Line: 67 ]] --[[ Name: getGameSetTargetId ]]
    if not v33 and v32 ~= nil then
        return v32.gameSetTargetId;
    else
        return nil;
    end;
end;
local function _(v35, v36) --[[ Line: 77 ]] --[[ Name: getAppliedFilters ]]
    if not v36 and v35 then
        return v35.appliedFilters;
    else
        return nil;
    end;
end;
return function(v38, v39, v40, v41, v42, v43, v44, v45) --[[ Line: 90 ]] --[[ Name: useGameSortAnalytics ]]
    -- upvalues: l_useStore_0 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_AppEventIngestService_0 (copy), l_AppPage_0 (copy), l_GameSortLoadSource_0 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), v1 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), l_reportGameAttributionError_0 (copy), v27 (copy), l_mutedError_0 (copy), l_calculateRowPositionFields_0 (copy), v14 (copy), v22 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_GameCollectionItemTypes_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppLogGameAttributionError_0 (copy), l_gamePlayIntent_0 (copy), l_feedScroll_0 (copy)
    local v46 = l_useStore_0();
    local v47 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v48 = l_useRoactService_0(l_AppEventIngestService_0);
    local v49 = v41 == l_AppPage_0.SearchPage;
    local v50 = if v38 ~= nil then if v39 or v49 then v38.topicId else v38.gameSetTypeId else nil;
    local v51 = if not v39 and v38 ~= nil then v38.gameSetTargetId else nil;
    local v52 = if not v39 and v38 then v38.appliedFilters else nil;
    local v53 = if v41 == l_AppPage_0.Home and v38 and v38.topicId then l_GameSortLoadSource_0.getSortLoadSource(v38.topicId) else nil;
    local v54 = if l_FFlagLuaAppAddSubIdToHomeEvents_0 and v38 then v38.sortSubId else nil;
    local v55 = if l_FFlagLuaAppLogOmniAnalyticsData_0 and v38 then v38.analyticsData else nil;
    return v1.useCallback(function(v56, v57, v58) --[[ Line: 120 ]]
        -- upvalues: l_FFlagLuaAppGameDetailsAttributionFix_0 (ref), v43 (copy), l_reportGameAttributionError_0 (ref), v41 (copy), v27 (ref), v50 (copy), v51 (copy), v40 (copy), l_mutedError_0 (ref), l_calculateRowPositionFields_0 (ref), v44 (copy), v45 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (ref), v55 (copy), v14 (ref), v22 (ref), v47 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v52 (copy), v53 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), l_FFlagLuaAppAddSubIdToHomeEvents_0 (ref), v54 (copy)
        if l_FFlagLuaAppGameDetailsAttributionFix_0 then
            local v59 = nil;
            local v60 = nil;
            if v56 and v43 then
                v60 = v43[v56];
                v59 = not v60 or v60.universeId ~= v57;
            else
                v59 = true;
            end;
            if v59 then
                l_reportGameAttributionError_0(v41, {
                    errorType = v27.GameDetail, 
                    clickedUniverseId = v57, 
                    universeId = if v60 then v60.universeId else nil, 
                    gameSetTypeId = v50, 
                    gameSetTargetId = v51, 
                    sortIndex = v40, 
                    sortEntryIndex = v56 or nil
                });
            end;
        end;
        if v56 ~= nil and v43 ~= nil then
            local v61 = v43[v56];
            if not v61 then
                l_mutedError_0("reportGameDetailOpened requires a valid entry");
            end;
            local v62 = l_calculateRowPositionFields_0(v56, v44, v45);
            local v63;
            if l_FFlagLuaAppLogOmniAnalyticsData_0 then
                local l_v55_0 = v55;
                local l_analyticsData_0 = v61.analyticsData;
                if not l_v55_0 and not l_analyticsData_0 then
                    v63 = nil;
                else
                    local v66 = v14.Dictionary.join(l_v55_0 or v22, l_analyticsData_0 or v22);
                    v63 = if next(v66) then v66 else nil;
                end;
            else
                v63 = nil;
            end;
            v47.reportOpenGameDetailWithId(if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v61.placeIdOverride or v61.placeId else v61.placeId, v50, v51, v40, v56, #v43, v61.isSponsored, v61.adId, v61.universeId, v41, v57, v52, v61.topicContentsIndex or v56, nil, v62.positionInRow, v62.rowInSort, v62.rowOnPage, nil, v53, if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v61.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile else if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v58 else nil, if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v54 else nil, if l_FFlagLuaAppLogOmniAnalyticsData_0 then v63 else nil);
        end;
    end, {
        v47, 
        v40, 
        v41, 
        v50, 
        v51, 
        v43, 
        v44, 
        v45, 
        v53, 
        if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v54 else nil, 
        if l_FFlagLuaAppLogOmniAnalyticsData_0 then v55 else nil
    }), v1.useCallback(function(v67, v68, _, v70, v71) --[[ Line: 205 ]]
        -- upvalues: l_FFlagLuaAppLogGameAttributionError_0 (ref), v43 (copy), l_reportGameAttributionError_0 (ref), v27 (ref), v50 (copy), v51 (copy), v40 (copy), l_calculateRowPositionFields_0 (ref), v44 (copy), v45 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (ref), v55 (copy), v14 (ref), v22 (ref), l_gamePlayIntent_0 (ref), v48 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v52 (copy), v41 (copy), v53 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (ref), v54 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref)
        if l_FFlagLuaAppLogGameAttributionError_0 then
            local v72 = nil;
            local v73 = nil;
            if v71 and v43 then
                v73 = v43[v71];
                v72 = not v73 or v73.universeId ~= v67.universeId;
            else
                v72 = true;
            end;
            if v72 then
                l_reportGameAttributionError_0(v70, {
                    errorType = v27.PlayIntent, 
                    clickedUniverseId = v67.universeId, 
                    universeId = if v73 then v73.universeId else nil, 
                    gameSetTypeId = v50, 
                    gameSetTargetId = v51, 
                    sortIndex = v40, 
                    sortEntryIndex = v71 or nil
                });
            end;
        end;
        local v74 = l_calculateRowPositionFields_0(v71, v44, v45);
        local v75;
        if l_FFlagLuaAppLogOmniAnalyticsData_0 then
            local l_v55_1 = v55;
            local l_analyticsData_1 = v67.analyticsData;
            if not l_v55_1 and not l_analyticsData_1 then
                v75 = nil;
            else
                local v78 = v14.Dictionary.join(l_v55_1 or v22, l_analyticsData_1 or v22);
                v75 = if next(v78) then v78 else nil;
            end;
        else
            v75 = nil;
        end;
        l_gamePlayIntent_0(v48, v70, {
            placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v67.placeIdOverride or v67.placeId else v67.placeId, 
            rootPlaceId = tonumber(v67.placeId), 
            universeId = v67.universeId, 
            sortIndex = tostring(v40), 
            sortEntryIndex = if v71 then tostring(v71) else nil, 
            referralSource = v68, 
            gameSetTypeId = v50, 
            gameSetTargetId = v51, 
            appliedFilters = v52, 
            topicDataPosition = v67.topicContentsIndex or v71, 
            nativeAdData = v67.adId, 
            pageName = v41, 
            positionInRow = v74.positionInRow, 
            rowNumber = v74.rowInSort, 
            feedRowNumber = v74.rowOnPage, 
            loadSource = v53, 
            launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v67.launchDataOverride else nil, 
            sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v54 else nil, 
            tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v67.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile else nil, 
            analyticsData = if l_FFlagLuaAppLogOmniAnalyticsData_0 then v75 else nil
        });
    end, {
        v40, 
        v48, 
        v50, 
        v51, 
        if l_FFlagLuaAppLogGameAttributionError_0 then v43 else nil, 
        v41, 
        v44, 
        v45, 
        v53, 
        if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v54 else nil, 
        if l_FFlagLuaAppLogOmniAnalyticsData_0 then v55 else nil
    }), v1.useCallback(function() --[[ Line: 284 ]]
        -- upvalues: v47 (copy), v50 (copy), v51 (copy), v40 (copy)
        v47.reportSeeAllWithId(v50, v51, v40);
    end, {
        v47, 
        v50, 
        v51, 
        v40
    }), (v1.useCallback(function(v79, v80, v81) --[[ Line: 297 ]]
        -- upvalues: v42 (copy), l_mutedError_0 (ref), v46 (copy), v40 (copy), v50 (copy), v51 (copy), l_feedScroll_0 (ref), v48 (copy), v41 (copy)
        if v42 and v42.current ~= nil then
            local l_ScrollingDirection_0 = v42.current.ScrollingDirection;
            local v83 = 0;
            if l_ScrollingDirection_0 == Enum.ScrollingDirection.X then
                v83 = v42.current.AbsoluteSize.X;
            elseif l_ScrollingDirection_0 == Enum.ScrollingDirection.Y then
                v83 = v42.current.AbsoluteSize.Y;
            else
                l_mutedError_0((("Direction %* is an unsupported option for feedScroll event"):format(l_ScrollingDirection_0.Name)));
            end;
            local l_ScreenSize_0 = v46:getState().ScreenSize;
            local v85 = {
                distance = v79, 
                screenSizeX = l_ScreenSize_0.X, 
                screenSizeY = l_ScreenSize_0.Y, 
                scrollAreaSize = v83, 
                scrollDepth = if v83 > 0 then v79 / v83 else nil, 
                startDepth = if v83 > 0 then v81 / v83 else nil, 
                startPos = v81, 
                scrollDuration = v80, 
                sortPos = v40, 
                gameSetTypeId = v50, 
                gameSetTargetId = v51
            };
            l_feedScroll_0(v48, v41, l_ScrollingDirection_0, v85);
        end;
    end, {
        v48, 
        v40, 
        v41, 
        v42, 
        v50, 
        v51, 
        v46
    }));
end;