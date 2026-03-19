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
local l_FFlagAXEnableTTIViaModule_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableTTIViaModule;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local function v32(v19, v20, v21) --[[ Line: 28 ]] --[[ Name: fireTileLoadingLatencyTracker ]]
    -- upvalues: v11 (copy), v12 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_sendAXStat_0 (copy), l_MemStorageService_0 (copy)
    if v19.trackerStartTime then
        local l_trackerPerceivedStartTime_0 = v19.trackerPerceivedStartTime;
        local v23 = os.clock();
        if v20 and not v21 then
            v19.dispatch(v11.EndTracking(v19.searchUuid, v23));
        end;
        local v24 = (v23 - v19.trackerStartTime) * 1000;
        local v25 = if l_trackerPerceivedStartTime_0 then (v23 - l_trackerPerceivedStartTime_0) * 1000 else nil;
        local v26 = if v20 then v12.Counter.Latency.Organic.Thumbnails else v12.Counter.Latency.Organic.Tiles;
        if v21 then
            v26 = if v20 then v12.Counter.Latency.Widget.Thumbnails else v12.Counter.Latency.Widget.Tiles;
        end;
        local v27 = {
            Page = v19.currentPageName, 
            OpaquePage = v19.opaquePageName, 
            ColdStart = v19.coldStart, 
            Category = v19.currentCategory, 
            Subcategory = v19.currentSubcategory
        };
        if l_FFlagAXEnableTTIViaModule_0 then
            local v28 = v12.Counter.PREFIX .. v26;
            local v29 = {
                page = v19.currentPageName, 
                opaquePage = v19.opaquePageName, 
                coldStart = v19.coldStart, 
                category = v19.currentCategory, 
                subcategory = v19.currentSubcategory
            };
            l_TimeToInteractiveTracker_0.updateMetadata(v28, v29);
            l_TimeToInteractiveTracker_0.trackEnd(v28);
            if v25 then
                local v30 = v12.Counter.PREFIX .. v26 .. "_Percieved";
                local v31 = l_TimeToInteractiveTracker_0.getEvents();
                if v31 and v31[v30] ~= nil then
                    l_TimeToInteractiveTracker_0.updateMetadata(v30, v29);
                    l_TimeToInteractiveTracker_0.trackEnd(v30, {
                        cleanupAfterSend = false
                    });
                end;
            end;
        end;
        l_sendAXStat_0({
            statName = v26, 
            deltaMs = v24, 
            metaData = v27
        });
        if v25 then
            l_sendAXStat_0({
                statName = v26 .. "_Percieved", 
                deltaMs = v25, 
                metaData = v27
            });
        end;
        if l_MemStorageService_0:GetItem(v12.MemStorageKeys.ColdStart.CatalogAndCatalogSearch) and v20 then
            l_MemStorageService_0:SetItem(v12.MemStorageKeys.ColdStart.CatalogAndCatalogSearch, "false");
        end;
    end;
end;
local function v34(v33) --[[ Line: 125 ]] --[[ Name: perceivedStartTimeSelector ]]
    return v33.AvatarExperience.Catalog.ResultsList.perceivedStartTime or nil;
end;
return function(v35) --[[ Line: 129 ]] --[[ Name: useTileLoadingLatencyInitializer ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), v6 (copy), v3 (copy), v10 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v34 (copy), l_MemStorageService_0 (copy), v12 (copy), l_usePrevious_0 (copy), v2 (copy), l_AvatarScreen_0 (copy), v32 (copy)
    local v36 = l_useAvatarRoute_0();
    local l_name_0 = v36.current.name;
    local v38 = if v36.opaque then v36.opaque.name else nil;
    local v39 = l_useDispatch_0();
    local v40 = v6(v3);
    local v41 = v10();
    local v43 = l_useSelector_0(function(v42) --[[ Line: 136 ]]
        -- upvalues: v35 (copy)
        return v42.AvatarExperience.Catalog.ResultsList[v35] and v42.AvatarExperience.Catalog.ResultsList[v35].tileLoadingLatency and v42.AvatarExperience.Catalog.ResultsList[v35].tileLoadingLatency.thumbnails or nil;
    end, l_getUseSelectorDeepEquals_0());
    local v45 = l_useSelector_0(function(v44) --[[ Line: 142 ]]
        -- upvalues: v35 (copy)
        return v44.AvatarExperience.Catalog.ResultsList[v35] and v44.AvatarExperience.Catalog.ResultsList[v35].tileLoadingLatency and v44.AvatarExperience.Catalog.ResultsList[v35].tileLoadingLatency.startTime or nil;
    end, l_getUseSelectorDeepEquals_0());
    local v46 = l_useSelector_0(v34, l_getUseSelectorDeepEquals_0());
    local v48 = l_useSelector_0(function(v47) --[[ Line: 149 ]]
        -- upvalues: v35 (copy)
        return v47.AvatarExperience.Catalog.ResultsList[v35] and v47.AvatarExperience.Catalog.ResultsList[v35].tileLoadingLatency and v47.AvatarExperience.Catalog.ResultsList[v35].tileLoadingLatency.endTime or nil;
    end, l_getUseSelectorDeepEquals_0());
    local v49 = l_MemStorageService_0:GetItem(v12.MemStorageKeys.ColdStart.CatalogAndCatalogSearch) ~= "false";
    local v50 = l_usePrevious_0(v43);
    local v51, v52 = v2.useState("");
    local v53, v54 = v2.useState("");
    v2.useEffect(function() --[[ Line: 164 ]]
        -- upvalues: v41 (copy), l_name_0 (copy), l_AvatarScreen_0 (ref), v52 (copy), v54 (copy)
        if not v41 then
            return;
        elseif l_name_0 == l_AvatarScreen_0.CatalogSearch then
            v52(v41.catalogSearchCategory);
            v54(v41.catalogSearchSubcategory);
            return;
        else
            v52(v41.catalogCategory);
            v54(v41.catalogSubcategory);
            return;
        end;
    end, {
        l_name_0, 
        v41
    });
    return {
        dispatch = v39, 
        analytics = v40, 
        trackerLoadedThumbnails = v43, 
        trackerStartTime = v45, 
        trackerEndTime = v48, 
        coldStart = v49, 
        prevImpressionResults = v50, 
        currentCategory = v51, 
        setCurrentCategory = v52, 
        currentSubcategory = v53, 
        setCurrentSubcategory = v54, 
        currentPageName = l_name_0, 
        searchUuid = v35, 
        opaquePageName = v38, 
        fireTileLoadingLatencyTracker = v32, 
        trackerPerceivedStartTime = v46
    };
end;