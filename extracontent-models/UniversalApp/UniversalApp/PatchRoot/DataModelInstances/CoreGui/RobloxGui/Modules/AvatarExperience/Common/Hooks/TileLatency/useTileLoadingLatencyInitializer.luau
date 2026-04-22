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
local v21 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance);
local l_TTIPerformanceManager_0 = v21.TTIPerformanceManager;
local l_WidgetsPercievedTTIManager_0 = v21.WidgetsPercievedTTIManager;
local l_OrganicTTIMilestoneManager_0 = v21.OrganicTTIMilestoneManager;
local function v39(v25, v26, v27) --[[ Line: 34 ]] --[[ Name: fireTileLoadingLatencyTracker ]]
    -- upvalues: v11 (copy), v12 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_WidgetsPercievedTTIManager_0 (copy), l_OrganicTTIMilestoneManager_0 (copy), l_TTIPerformanceManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_sendAXStat_0 (copy), l_MemStorageService_0 (copy)
    if v25.trackerStartTime then
        local l_trackerPerceivedStartTime_0 = v25.trackerPerceivedStartTime;
        local v29 = os.clock();
        if v26 and not v27 then
            v25.dispatch(v11.EndTracking(v25.searchUuid, v29));
        end;
        local v30 = (v29 - v25.trackerStartTime) * 1000;
        local v31 = if l_trackerPerceivedStartTime_0 then (v29 - l_trackerPerceivedStartTime_0) * 1000 else nil;
        local v32 = if v26 then v12.Counter.Latency.Organic.Thumbnails else v12.Counter.Latency.Organic.Tiles;
        if v27 then
            v32 = if v26 then v12.Counter.Latency.Widget.Thumbnails else v12.Counter.Latency.Widget.Tiles;
        end;
        local v33 = {
            Page = v25.currentPageName, 
            OpaquePage = v25.opaquePageName, 
            ColdStart = v25.coldStart, 
            Category = v25.currentCategory, 
            Subcategory = v25.currentSubcategory
        };
        if l_FFlagAXEnableTTIViaModule_0 then
            local v34 = v12.Counter.PREFIX .. v32;
            local v35 = {
                page = v25.currentPageName, 
                opaquePage = v25.opaquePageName, 
                coldStart = v25.coldStart, 
                category = v25.currentCategory, 
                subcategory = v25.currentSubcategory
            };
            if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                if v27 and l_WidgetsPercievedTTIManager_0 then
                    if v26 then
                        l_WidgetsPercievedTTIManager_0.L2.surfaceReady();
                    else
                        l_WidgetsPercievedTTIManager_0.L2.functionallyReady();
                    end;
                end;
                if not v27 and l_OrganicTTIMilestoneManager_0 then
                    if v26 then
                        l_OrganicTTIMilestoneManager_0.L2.surfaceReady();
                    else
                        l_OrganicTTIMilestoneManager_0.L2.functionallyReady();
                    end;
                end;
                local l_Root_0 = l_TTIPerformanceManager_0.Surface.Marketplace.Root;
                l_Root_0.endTracking(v32, v35);
                if v31 then
                    l_Root_0.endPerceivedTracking(v32, v35);
                end;
            else
                l_TimeToInteractiveTracker_0.updateMetadata(v34, v35);
                l_TimeToInteractiveTracker_0.trackEnd(v34);
                if v31 then
                    local v37 = v12.Counter.PREFIX .. v32 .. "_Percieved";
                    local v38 = l_TimeToInteractiveTracker_0.getEvents();
                    if v38 and v38[v37] ~= nil then
                        l_TimeToInteractiveTracker_0.updateMetadata(v37, v35);
                        l_TimeToInteractiveTracker_0.trackEnd(v37, {
                            cleanupAfterSend = false
                        });
                    end;
                end;
            end;
        end;
        l_sendAXStat_0({
            statName = v32, 
            deltaMs = v30, 
            metaData = v33
        });
        if v31 then
            l_sendAXStat_0({
                statName = v32 .. "_Percieved", 
                deltaMs = v31, 
                metaData = v33
            });
        end;
        if l_MemStorageService_0:GetItem(v12.MemStorageKeys.ColdStart.CatalogAndCatalogSearch) and v26 then
            l_MemStorageService_0:SetItem(v12.MemStorageKeys.ColdStart.CatalogAndCatalogSearch, "false");
        end;
    end;
end;
local function v41(v40) --[[ Line: 157 ]] --[[ Name: perceivedStartTimeSelector ]]
    return v40.AvatarExperience.Catalog.ResultsList.perceivedStartTime or nil;
end;
return function(v42) --[[ Line: 161 ]] --[[ Name: useTileLoadingLatencyInitializer ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), v6 (copy), v3 (copy), v10 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v41 (copy), l_MemStorageService_0 (copy), v12 (copy), l_usePrevious_0 (copy), v2 (copy), l_AvatarScreen_0 (copy), v39 (copy)
    local v43 = l_useAvatarRoute_0();
    local l_name_0 = v43.current.name;
    local v45 = if v43.opaque then v43.opaque.name else nil;
    local v46 = l_useDispatch_0();
    local v47 = v6(v3);
    local v48 = v10();
    local v50 = l_useSelector_0(function(v49) --[[ Line: 168 ]]
        -- upvalues: v42 (copy)
        return v49.AvatarExperience.Catalog.ResultsList[v42] and v49.AvatarExperience.Catalog.ResultsList[v42].tileLoadingLatency and v49.AvatarExperience.Catalog.ResultsList[v42].tileLoadingLatency.thumbnails or nil;
    end, l_getUseSelectorDeepEquals_0());
    local v52 = l_useSelector_0(function(v51) --[[ Line: 174 ]]
        -- upvalues: v42 (copy)
        return v51.AvatarExperience.Catalog.ResultsList[v42] and v51.AvatarExperience.Catalog.ResultsList[v42].tileLoadingLatency and v51.AvatarExperience.Catalog.ResultsList[v42].tileLoadingLatency.startTime or nil;
    end, l_getUseSelectorDeepEquals_0());
    local v53 = l_useSelector_0(v41, l_getUseSelectorDeepEquals_0());
    local v55 = l_useSelector_0(function(v54) --[[ Line: 181 ]]
        -- upvalues: v42 (copy)
        return v54.AvatarExperience.Catalog.ResultsList[v42] and v54.AvatarExperience.Catalog.ResultsList[v42].tileLoadingLatency and v54.AvatarExperience.Catalog.ResultsList[v42].tileLoadingLatency.endTime or nil;
    end, l_getUseSelectorDeepEquals_0());
    local v56 = l_MemStorageService_0:GetItem(v12.MemStorageKeys.ColdStart.CatalogAndCatalogSearch) ~= "false";
    local v57 = l_usePrevious_0(v50);
    local v58, v59 = v2.useState("");
    local v60, v61 = v2.useState("");
    v2.useEffect(function() --[[ Line: 196 ]]
        -- upvalues: v48 (copy), l_name_0 (copy), l_AvatarScreen_0 (ref), v59 (copy), v61 (copy)
        if not v48 then
            return;
        elseif l_name_0 == l_AvatarScreen_0.CatalogSearch then
            v59(v48.catalogSearchCategory);
            v61(v48.catalogSearchSubcategory);
            return;
        else
            v59(v48.catalogCategory);
            v61(v48.catalogSubcategory);
            return;
        end;
    end, {
        l_name_0, 
        v48
    });
    return {
        dispatch = v46, 
        analytics = v47, 
        trackerLoadedThumbnails = v50, 
        trackerStartTime = v52, 
        trackerEndTime = v55, 
        coldStart = v56, 
        prevImpressionResults = v57, 
        currentCategory = v58, 
        setCurrentCategory = v59, 
        currentSubcategory = v60, 
        setCurrentSubcategory = v61, 
        currentPageName = l_name_0, 
        searchUuid = v42, 
        opaquePageName = v45, 
        fireTileLoadingLatencyTracker = v39, 
        trackerPerceivedStartTime = v53
    };
end;