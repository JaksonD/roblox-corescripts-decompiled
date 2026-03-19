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
local _ = require(l_Parent_0.DiscoveryTypes);
local l_GameSortLoadSource_0 = require(l_Parent_0.DiscoveryAvailability).GameSortLoadSource;
local l_feedScroll_0 = require(l_Parent_0.ScrollTelemetry).feedScroll;
local l_calculateRowPositionFields_0 = require(l_Parent_0.UnifiedLogging).calculateRowPositionFields;
local l_FFlagLuaAppLogGameAttributionError_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogGameAttributionError;
local l_FFlagLuaAppGameDetailsAttributionFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameDetailsAttributionFix;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixGameSortAnalyticFromSearch;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local v20 = if l_FFlagLuaAppLogGameAttributionError_0 then {
    GameDetail = "GameDetail", 
    PlayIntent = "PlayIntent"
} else nil;
local function _(v21, v22, v23) --[[ Line: 39 ]] --[[ Name: getGameSetTypeId ]]
    -- upvalues: l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 (copy)
    if v21 ~= nil then
        if v22 or if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 then v23 else false then
            return v21.topicId;
        else
            return v21.gameSetTypeId;
        end;
    else
        return nil;
    end;
end;
local function _(v25, v26) --[[ Line: 51 ]] --[[ Name: getGameSetTargetId ]]
    if not v26 and v25 ~= nil then
        return v25.gameSetTargetId;
    else
        return nil;
    end;
end;
local function _(v28, v29) --[[ Line: 61 ]] --[[ Name: getAppliedFilters ]]
    if not v29 and v28 then
        return v28.appliedFilters;
    else
        return nil;
    end;
end;
return function(v31, v32, v33, v34, v35, v36, v37, v38) --[[ Line: 74 ]] --[[ Name: useGameSortAnalytics ]]
    -- upvalues: l_useStore_0 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_AppEventIngestService_0 (copy), l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 (copy), l_AppPage_0 (copy), l_GameSortLoadSource_0 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), v1 (copy), l_FFlagLuaAppGameDetailsAttributionFix_0 (copy), l_reportGameAttributionError_0 (copy), v20 (copy), l_mutedError_0 (copy), l_calculateRowPositionFields_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppLogGameAttributionError_0 (copy), l_gamePlayIntent_0 (copy), l_feedScroll_0 (copy)
    local v39 = l_useStore_0();
    local v40 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v41 = l_useRoactService_0(l_AppEventIngestService_0);
    local v42 = if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 then v34 == l_AppPage_0.SearchPage else nil;
    local v43 = if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 then v42 else nil;
    local v44 = if v31 ~= nil then if v32 or if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 then v43 else false then v31.topicId else v31.gameSetTypeId else nil;
    v43 = if not v32 and v31 ~= nil then v31.gameSetTargetId else nil;
    local v45 = if not v32 and v31 then v31.appliedFilters else nil;
    local v46 = if v34 == l_AppPage_0.Home and v31 and v31.topicId then l_GameSortLoadSource_0.getSortLoadSource(v31.topicId) else nil;
    local v47 = if l_FFlagLuaAppAddSubIdToHomeEvents_0 and v31 then v31.sortSubId else nil;
    return v1.useCallback(function(v48, v49, v50) --[[ Line: 106 ]]
        -- upvalues: l_FFlagLuaAppGameDetailsAttributionFix_0 (ref), v36 (copy), l_reportGameAttributionError_0 (ref), v34 (copy), v20 (ref), v44 (copy), v43 (copy), v33 (copy), l_mutedError_0 (ref), l_calculateRowPositionFields_0 (ref), v37 (copy), v38 (copy), v40 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v45 (copy), v46 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), l_FFlagLuaAppAddSubIdToHomeEvents_0 (ref), v47 (copy)
        if l_FFlagLuaAppGameDetailsAttributionFix_0 then
            local v51 = nil;
            local v52 = nil;
            if v48 and v36 then
                v52 = v36[v48];
                v51 = not v52 or v52.universeId ~= v49;
            else
                v51 = true;
            end;
            if v51 then
                l_reportGameAttributionError_0(v34, {
                    errorType = v20.GameDetail, 
                    clickedUniverseId = v49, 
                    universeId = if v52 then v52.universeId else nil, 
                    gameSetTypeId = v44, 
                    gameSetTargetId = v43, 
                    sortIndex = v33, 
                    sortEntryIndex = v48 or nil
                });
            end;
        end;
        if v48 ~= nil and v36 ~= nil then
            local v53 = v36[v48];
            if not v53 then
                l_mutedError_0("reportGameDetailOpened requires a valid entry");
            end;
            local v54 = l_calculateRowPositionFields_0(v48, v37, v38);
            v40.reportOpenGameDetailWithId(if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v53.placeIdOverride or v53.placeId else v53.placeId, v44, v43, v33, v48, #v36, v53.isSponsored, v53.adId, v53.universeId, v34, v49, v45, v53.topicContentsIndex or v48, nil, v54.positionInRow, v54.rowInSort, v54.rowOnPage, nil, v46, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v50 else nil, if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v47 else nil);
        end;
    end, {
        v40, 
        v33, 
        v34, 
        v44, 
        v43, 
        v36, 
        v37, 
        v38, 
        v46, 
        if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v47 else nil
    }), v1.useCallback(function(v55, v56, _, v58, v59) --[[ Line: 182 ]]
        -- upvalues: l_FFlagLuaAppLogGameAttributionError_0 (ref), v36 (copy), l_reportGameAttributionError_0 (ref), v20 (ref), v44 (copy), v43 (copy), v33 (copy), l_calculateRowPositionFields_0 (ref), v37 (copy), v38 (copy), l_gamePlayIntent_0 (ref), v41 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v45 (copy), v34 (copy), v46 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (ref), v47 (copy)
        if l_FFlagLuaAppLogGameAttributionError_0 then
            local v60 = nil;
            local v61 = nil;
            if v59 and v36 then
                v61 = v36[v59];
                v60 = not v61 or v61.universeId ~= v55.universeId;
            else
                v60 = true;
            end;
            if v60 then
                l_reportGameAttributionError_0(v58, {
                    errorType = v20.PlayIntent, 
                    clickedUniverseId = v55.universeId, 
                    universeId = if v61 then v61.universeId else nil, 
                    gameSetTypeId = v44, 
                    gameSetTargetId = v43, 
                    sortIndex = v33, 
                    sortEntryIndex = v59 or nil
                });
            end;
        end;
        local v62 = l_calculateRowPositionFields_0(v59, v37, v38);
        l_gamePlayIntent_0(v41, v58, {
            placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v55.placeIdOverride or v55.placeId else v55.placeId, 
            rootPlaceId = tonumber(v55.placeId), 
            universeId = v55.universeId, 
            sortIndex = tostring(v33), 
            sortEntryIndex = if v59 then tostring(v59) else nil, 
            referralSource = v56, 
            gameSetTypeId = v44, 
            gameSetTargetId = v43, 
            appliedFilters = v45, 
            topicDataPosition = v55.topicContentsIndex or v59, 
            nativeAdData = v55.adId, 
            pageName = v34, 
            positionInRow = v62.positionInRow, 
            rowNumber = v62.rowInSort, 
            feedRowNumber = v62.rowOnPage, 
            loadSource = v46, 
            launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v55.launchDataOverride else nil, 
            sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v47 else nil
        });
    end, {
        v33, 
        v41, 
        v44, 
        v43, 
        if l_FFlagLuaAppLogGameAttributionError_0 then v36 else nil, 
        v34, 
        v37, 
        v38, 
        v46, 
        if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v47 else nil
    }), v1.useCallback(function() --[[ Line: 248 ]]
        -- upvalues: v40 (copy), v44 (copy), v43 (copy), v33 (copy)
        v40.reportSeeAllWithId(v44, v43, v33);
    end, {
        v40, 
        v44, 
        v43, 
        v33
    }), (v1.useCallback(function(v63, v64, v65) --[[ Line: 261 ]]
        -- upvalues: v35 (copy), l_mutedError_0 (ref), v39 (copy), v33 (copy), v44 (copy), v43 (copy), l_feedScroll_0 (ref), v41 (copy), v34 (copy)
        if v35 and v35.current ~= nil then
            local l_ScrollingDirection_0 = v35.current.ScrollingDirection;
            local v67 = 0;
            if l_ScrollingDirection_0 == Enum.ScrollingDirection.X then
                v67 = v35.current.AbsoluteSize.X;
            elseif l_ScrollingDirection_0 == Enum.ScrollingDirection.Y then
                v67 = v35.current.AbsoluteSize.Y;
            else
                l_mutedError_0((("Direction %* is an unsupported option for feedScroll event"):format(l_ScrollingDirection_0.Name)));
            end;
            local l_ScreenSize_0 = v39:getState().ScreenSize;
            local v69 = {
                distance = v63, 
                screenSizeX = l_ScreenSize_0.X, 
                screenSizeY = l_ScreenSize_0.Y, 
                scrollAreaSize = v67, 
                scrollDepth = if v67 > 0 then v63 / v67 else nil, 
                startDepth = if v67 > 0 then v65 / v67 else nil, 
                startPos = v65, 
                scrollDuration = v64, 
                sortPos = v33, 
                gameSetTypeId = v44, 
                gameSetTargetId = v43
            };
            l_feedScroll_0(v41, v34, l_ScrollingDirection_0, v69);
        end;
    end, {
        v41, 
        v33, 
        v34, 
        v35, 
        v44, 
        v43, 
        v39
    }));
end;