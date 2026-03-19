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
local v19 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableWidgetsTTI);
local function v33(v20, v21, v22) --[[ Line: 29 ]] --[[ Name: fireTileLoadingLatencyTracker ]]
    -- upvalues: v19 (copy), v11 (copy), v12 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_sendAXStat_0 (copy), l_MemStorageService_0 (copy)
    if v20.trackerStartTime then
        local l_trackerPerceivedStartTime_0 = v20.trackerPerceivedStartTime;
        local v24 = os.clock();
        if v21 and v19() and not v22 then
            v20.dispatch(v11.EndTracking(v20.searchUuid, v24));
        end;
        local v25 = (v24 - v20.trackerStartTime) * 1000;
        local v26 = if l_trackerPerceivedStartTime_0 then (v24 - l_trackerPerceivedStartTime_0) * 1000 else nil;
        local v27 = if v21 then v12.Counter.Latency.Organic.Thumbnails else v12.Counter.Latency.Organic.Tiles;
        if v19() and v22 then
            v27 = if v21 then v12.Counter.Latency.Widget.Thumbnails else v12.Counter.Latency.Widget.Tiles;
        end;
        local v28 = {
            Page = v20.currentPageName, 
            OpaquePage = v20.opaquePageName, 
            ColdStart = v20.coldStart, 
            Category = v20.currentCategory, 
            Subcategory = v20.currentSubcategory
        };
        if l_FFlagAXEnableTTIViaModule_0 then
            local v29 = v12.Counter.PREFIX .. v27;
            local v30 = {
                page = v20.currentPageName, 
                opaquePage = v20.opaquePageName, 
                coldStart = v20.coldStart, 
                category = v20.currentCategory, 
                subcategory = v20.currentSubcategory
            };
            l_TimeToInteractiveTracker_0.updateMetadata(v29, v30);
            l_TimeToInteractiveTracker_0.trackEnd(v29);
            if v26 then
                local v31 = v12.Counter.PREFIX .. v27 .. "_Percieved";
                local v32 = l_TimeToInteractiveTracker_0.getEvents();
                if v32 and v32[v31] ~= nil then
                    l_TimeToInteractiveTracker_0.updateMetadata(v31, v30);
                    l_TimeToInteractiveTracker_0.trackEnd(v31, {
                        cleanupAfterSend = false
                    });
                end;
            end;
        end;
        l_sendAXStat_0({
            statName = v27, 
            deltaMs = v25, 
            metaData = v28
        });
        if v26 then
            l_sendAXStat_0({
                statName = v27 .. "_Percieved", 
                deltaMs = v26, 
                metaData = v28
            });
        end;
        if l_MemStorageService_0:GetItem(v12.MemStorageKeys.ColdStart.CatalogAndCatalogSearch) and v21 then
            l_MemStorageService_0:SetItem(v12.MemStorageKeys.ColdStart.CatalogAndCatalogSearch, "false");
        end;
    end;
end;
local function v35(v34) --[[ Line: 126 ]] --[[ Name: perceivedStartTimeSelector ]]
    return v34.AvatarExperience.Catalog.ResultsList.perceivedStartTime or nil;
end;
return function(v36) --[[ Line: 130 ]] --[[ Name: useTileLoadingLatencyInitializer ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), v6 (copy), v3 (copy), v10 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v35 (copy), l_MemStorageService_0 (copy), v12 (copy), l_usePrevious_0 (copy), v2 (copy), l_AvatarScreen_0 (copy), v33 (copy)
    local v37 = l_useAvatarRoute_0();
    local l_name_0 = v37.current.name;
    local v39 = if v37.opaque then v37.opaque.name else nil;
    local v40 = l_useDispatch_0();
    local v41 = v6(v3);
    local v42 = v10();
    local v44 = l_useSelector_0(function(v43) --[[ Line: 137 ]]
        -- upvalues: v36 (copy)
        return v43.AvatarExperience.Catalog.ResultsList[v36] and v43.AvatarExperience.Catalog.ResultsList[v36].tileLoadingLatency and v43.AvatarExperience.Catalog.ResultsList[v36].tileLoadingLatency.thumbnails or nil;
    end, l_getUseSelectorDeepEquals_0());
    local v46 = l_useSelector_0(function(v45) --[[ Line: 143 ]]
        -- upvalues: v36 (copy)
        return v45.AvatarExperience.Catalog.ResultsList[v36] and v45.AvatarExperience.Catalog.ResultsList[v36].tileLoadingLatency and v45.AvatarExperience.Catalog.ResultsList[v36].tileLoadingLatency.startTime or nil;
    end, l_getUseSelectorDeepEquals_0());
    local v47 = l_useSelector_0(v35, l_getUseSelectorDeepEquals_0());
    local v49 = l_useSelector_0(function(v48) --[[ Line: 150 ]]
        -- upvalues: v36 (copy)
        return v48.AvatarExperience.Catalog.ResultsList[v36] and v48.AvatarExperience.Catalog.ResultsList[v36].tileLoadingLatency and v48.AvatarExperience.Catalog.ResultsList[v36].tileLoadingLatency.endTime or nil;
    end, l_getUseSelectorDeepEquals_0());
    local v50 = l_MemStorageService_0:GetItem(v12.MemStorageKeys.ColdStart.CatalogAndCatalogSearch) ~= "false";
    local v51 = l_usePrevious_0(v44);
    local v52, v53 = v2.useState("");
    local v54, v55 = v2.useState("");
    v2.useEffect(function() --[[ Line: 165 ]]
        -- upvalues: v42 (copy), l_name_0 (copy), l_AvatarScreen_0 (ref), v53 (copy), v55 (copy)
        if not v42 then
            return;
        elseif l_name_0 == l_AvatarScreen_0.CatalogSearch then
            v53(v42.catalogSearchCategory);
            v55(v42.catalogSearchSubcategory);
            return;
        else
            v53(v42.catalogCategory);
            v55(v42.catalogSubcategory);
            return;
        end;
    end, {
        l_name_0, 
        v42
    });
    return {
        dispatch = v40, 
        analytics = v41, 
        trackerLoadedThumbnails = v44, 
        trackerStartTime = v46, 
        trackerEndTime = v49, 
        coldStart = v50, 
        prevImpressionResults = v51, 
        currentCategory = v52, 
        setCurrentCategory = v53, 
        currentSubcategory = v54, 
        setCurrentSubcategory = v55, 
        currentPageName = l_name_0, 
        searchUuid = v36, 
        opaquePageName = v39, 
        fireTileLoadingLatencyTracker = v33, 
        trackerPerceivedStartTime = v47
    };
end;