local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v6 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v7.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v7.AvatarRoute.Hooks.useAvatarRoute;
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useGetCurrentCategoryNames);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_sendAXStat_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXStat;
local v16 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXEnableTTIViaModule_0 = v16.FFlagAXEnableTTIViaModule;
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = v16.FFlagAXEnableMilestoneTrackingForAvatarExperience;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local l_TTIPerformanceManager_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance).TTIPerformanceManager;
local function v36(v22, v23, v24) --[[ Line: 32 ]] --[[ Name: fireTileLoadingLatencyTracker ]]
    -- upvalues: v11 (copy), v12 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_TTIPerformanceManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_sendAXStat_0 (copy), l_MemStorageService_0 (copy)
    if v22.trackerStartTime then
        local l_trackerPerceivedStartTime_0 = v22.trackerPerceivedStartTime;
        local v26 = os.clock();
        if v23 and not v24 then
            v22.dispatch(v11.EndTracking(v22.searchUuid, v26));
        end;
        local v27 = (v26 - v22.trackerStartTime) * 1000;
        local v28 = if l_trackerPerceivedStartTime_0 then (v26 - l_trackerPerceivedStartTime_0) * 1000 else nil;
        local v29 = if v23 then v12.Counter.Latency.Organic.Thumbnails else v12.Counter.Latency.Organic.Tiles;
        if v24 then
            v29 = if v23 then v12.Counter.Latency.Widget.Thumbnails else v12.Counter.Latency.Widget.Tiles;
        end;
        local v30 = {
            Page = v22.currentPageName, 
            OpaquePage = v22.opaquePageName, 
            ColdStart = v22.coldStart, 
            Category = v22.currentCategory, 
            Subcategory = v22.currentSubcategory
        };
        if l_FFlagAXEnableTTIViaModule_0 then
            local v31 = v12.Counter.PREFIX .. v29;
            local v32 = {
                page = v22.currentPageName, 
                opaquePage = v22.opaquePageName, 
                coldStart = v22.coldStart, 
                category = v22.currentCategory, 
                subcategory = v22.currentSubcategory
            };
            if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                local l_Root_0 = l_TTIPerformanceManager_0.Surface.Marketplace.Root;
                l_Root_0.endTracking(v29, v32);
                if v28 then
                    l_Root_0.endPerceivedTracking(v29, v32);
                end;
            else
                l_TimeToInteractiveTracker_0.updateMetadata(v31, v32);
                l_TimeToInteractiveTracker_0.trackEnd(v31);
                if v28 then
                    local v34 = v12.Counter.PREFIX .. v29 .. "_Percieved";
                    local v35 = l_TimeToInteractiveTracker_0.getEvents();
                    if v35 and v35[v34] ~= nil then
                        l_TimeToInteractiveTracker_0.updateMetadata(v34, v32);
                        l_TimeToInteractiveTracker_0.trackEnd(v34, {
                            cleanupAfterSend = false
                        });
                    end;
                end;
            end;
        end;
        l_sendAXStat_0({
            statName = v29, 
            deltaMs = v27, 
            metaData = v30
        });
        if v28 then
            l_sendAXStat_0({
                statName = v29 .. "_Percieved", 
                deltaMs = v28, 
                metaData = v30
            });
        end;
        if l_MemStorageService_0:GetItem(v12.MemStorageKeys.ColdStart.CatalogAndCatalogSearch) and v23 then
            l_MemStorageService_0:SetItem(v12.MemStorageKeys.ColdStart.CatalogAndCatalogSearch, "false");
        end;
    end;
end;
local function v38(v37) --[[ Line: 139 ]] --[[ Name: perceivedStartTimeSelector ]]
    return v37.AvatarExperience.Catalog.ResultsList.perceivedStartTime or nil;
end;
return function(v39) --[[ Line: 143 ]] --[[ Name: useTileLoadingLatencyInitializer ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), v6 (copy), v3 (copy), v10 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v38 (copy), l_MemStorageService_0 (copy), v12 (copy), l_usePrevious_0 (copy), v2 (copy), l_AvatarScreen_0 (copy), v36 (copy)
    local v40 = l_useAvatarRoute_0();
    local l_name_0 = v40.current.name;
    local v42 = if v40.opaque then v40.opaque.name else nil;
    local v43 = l_useDispatch_0();
    local v44 = v6(v3);
    local v45 = v10();
    local v47 = l_useSelector_0(function(v46) --[[ Line: 150 ]]
        -- upvalues: v39 (copy)
        return v46.AvatarExperience.Catalog.ResultsList[v39] and v46.AvatarExperience.Catalog.ResultsList[v39].tileLoadingLatency and v46.AvatarExperience.Catalog.ResultsList[v39].tileLoadingLatency.thumbnails or nil;
    end, l_getUseSelectorDeepEquals_0());
    local v49 = l_useSelector_0(function(v48) --[[ Line: 156 ]]
        -- upvalues: v39 (copy)
        return v48.AvatarExperience.Catalog.ResultsList[v39] and v48.AvatarExperience.Catalog.ResultsList[v39].tileLoadingLatency and v48.AvatarExperience.Catalog.ResultsList[v39].tileLoadingLatency.startTime or nil;
    end, l_getUseSelectorDeepEquals_0());
    local v50 = l_useSelector_0(v38, l_getUseSelectorDeepEquals_0());
    local v52 = l_useSelector_0(function(v51) --[[ Line: 163 ]]
        -- upvalues: v39 (copy)
        return v51.AvatarExperience.Catalog.ResultsList[v39] and v51.AvatarExperience.Catalog.ResultsList[v39].tileLoadingLatency and v51.AvatarExperience.Catalog.ResultsList[v39].tileLoadingLatency.endTime or nil;
    end, l_getUseSelectorDeepEquals_0());
    local v53 = l_MemStorageService_0:GetItem(v12.MemStorageKeys.ColdStart.CatalogAndCatalogSearch) ~= "false";
    local v54 = l_usePrevious_0(v47);
    local v55, v56 = v2.useState("");
    local v57, v58 = v2.useState("");
    v2.useEffect(function() --[[ Line: 178 ]]
        -- upvalues: v45 (copy), l_name_0 (copy), l_AvatarScreen_0 (ref), v56 (copy), v58 (copy)
        if not v45 then
            return;
        elseif l_name_0 == l_AvatarScreen_0.CatalogSearch then
            v56(v45.catalogSearchCategory);
            v58(v45.catalogSearchSubcategory);
            return;
        else
            v56(v45.catalogCategory);
            v58(v45.catalogSubcategory);
            return;
        end;
    end, {
        l_name_0, 
        v45
    });
    return {
        dispatch = v43, 
        analytics = v44, 
        trackerLoadedThumbnails = v47, 
        trackerStartTime = v49, 
        trackerEndTime = v52, 
        coldStart = v53, 
        prevImpressionResults = v54, 
        currentCategory = v55, 
        setCurrentCategory = v56, 
        currentSubcategory = v57, 
        setCurrentSubcategory = v58, 
        currentPageName = l_name_0, 
        searchUuid = v39, 
        opaquePageName = v42, 
        fireTileLoadingLatencyTracker = v36, 
        trackerPerceivedStartTime = v50
    };
end;