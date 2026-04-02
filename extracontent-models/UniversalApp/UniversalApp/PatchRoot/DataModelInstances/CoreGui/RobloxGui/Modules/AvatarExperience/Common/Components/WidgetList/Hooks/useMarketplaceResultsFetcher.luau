local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useStore_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useStore;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Stores);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v16 = require(l_Modules_0.AvatarExperience.Common.Context.PageObjectManagerContext);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useGetCategoryInfo);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useGetSelectedCategoryAndSubcategoryId);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.useCatalogCategoriesFetcher);
local l_CatalogCategories_0 = v11.Enums.CatalogCategories;
local v21 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_AXPrefetchMarketplaceIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXPrefetchMarketplaceIXP;
local v23 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v24 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v25 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v26 = require(script.Parent.Parent.Utils.fetchCatalogSearchWithSponsoredItems);
local v27 = require(script.Parent.Parent.Utils.fetchHydratedWidgets);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSponsoredItems);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ApiFetchCatalogSearch);
local v30 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategoriesFromStore);
local v31 = require(l_Modules_0.LuaApp.mutedError);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveSearchInCatalog);
local v33 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearWidgetInfo);
local v34 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v35 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v36 = require(l_Modules_0.LuaApp.Actions.SetSearchTime);
local v37 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortAndFilters);
local v39 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 = v39.FFlagAXFixPrefetchMarketplaceStartupCrash;
local l_FFlagAXUnifiedMarketplaceResultsFetcher_0 = v39.FFlagAXUnifiedMarketplaceResultsFetcher;
local l_FFlagAXDurablesSupport_0 = v39.FFlagAXDurablesSupport;
local l_FFlagAXPrefetchOnlyWithinTTL_0 = v39.FFlagAXPrefetchOnlyWithinTTL;
local v44 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency);
local l_FFlagAXResetFetchMarketplaceLogic_0 = v39.FFlagAXResetFetchMarketplaceLogic;
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v39.FFlagAXMoveAllTabToWidgetOnly;
local l_FFlagAXCatalogCategoriesSDUI_0 = v39.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXFixHydratedWidgetsParams_0 = v39.FFlagAXFixHydratedWidgetsParams;
local l_FFlagAXDefaultCatalogCategoryId_0 = v39.FFlagAXDefaultCatalogCategoryId;
local l_FFlagAXEnableTTIViaModule_0 = v39.FFlagAXEnableTTIViaModule;
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = v39.FFlagAXEnableMilestoneTrackingForAvatarExperience;
local v52 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_TTIPerformanceManager_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance).TTIPerformanceManager;
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
selectSortAndFilters = function(v56) --[[ Line: 149 ]] --[[ Name: selectSortAndFilters ]]
    -- upvalues: l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (copy)
    if l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 and (not v56.AvatarExperience or not v56.AvatarExperience.Catalog) then
        return nil;
    else
        return v56.AvatarExperience.Catalog.SortAndFilters;
    end;
end;
return function(v57) --[[ Line: 198 ]] --[[ Name: useMarketplaceResultsFetcher ]]
    -- upvalues: l_AXPrefetchMarketplaceIXP_0 (copy), v23 (copy), l_useDispatch_0 (copy), l_FFlagAXResetFetchMarketplaceLogic_0 (copy), l_useSelector_0 (copy), v2 (copy), v16 (copy), l_useRoactService_0 (copy), v9 (copy), v12 (copy), l_useSignalState_0 (copy), l_FFlagAXPrefetchOnlyWithinTTL_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v17 (copy), v18 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), v21 (copy), l_CatalogCategories_0 (copy), l_FFlagAXFixHydratedWidgetsParams_0 (copy), v30 (copy), v25 (copy), v31 (copy), l_useStore_0 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy), v19 (copy), l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (copy), v32 (copy), v44 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_TTIPerformanceManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), v52 (copy), v37 (copy), v35 (copy), v24 (copy), v34 (copy), l_FFlagAXDurablesSupport_0 (copy), v13 (copy), l_AvatarScreen_0 (copy), v33 (copy), v28 (copy), v14 (copy), l_Logging_0 (copy), v29 (copy), v36 (copy), l_sendAXCounterV2_0 (copy), v27 (copy), v26 (copy)
    local v58 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v23.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser) else nil;
    local v59 = l_useDispatch_0();
    local v60 = if l_FFlagAXResetFetchMarketplaceLogic_0 then l_useSelector_0(selectSortAndFilters) else nil;
    local v61 = if l_FFlagAXResetFetchMarketplaceLogic_0 then v2.useContext(v16.Consumer) else nil;
    local v62 = l_useRoactService_0(v9);
    local v63 = v12.getFetchMarketplaceStore(false);
    local v64 = l_useSignalState_0(v63.getFetchingMarketplace);
    local v65 = l_useSignalState_0(v63.getFetchedMarketplace);
    local v66 = if l_FFlagAXPrefetchOnlyWithinTTL_0 then l_useSignalState_0(v63.getFetchedMarketplaceTimestamp) else nil;
    local l_setFetchingMarketplaceInProgress_0 = v63.setFetchingMarketplaceInProgress;
    local l_setFetchedMarketplaceCompleted_0 = v63.setFetchedMarketplaceCompleted;
    local v69 = if not not l_FFlagAXMoveAllTabToWidgetOnly_0 or l_FFlagAXCatalogCategoriesSDUI_0 then v63.setFetchingMarketplaceErrorOccured else nil;
    local v70 = if l_FFlagAXCatalogCategoriesSDUI_0 then v63.setCatalogCategoriesErrorOccured else nil;
    local v71 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v63.setFetchingMarketplaceProcessed else nil;
    local v72 = v17();
    local v73, v74 = v18();
    local v75 = v73 or if l_FFlagAXDefaultCatalogCategoryId_0 then v21.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue();
    local v76 = if not v57 or l_FFlagAXFixHydratedWidgetsParams_0 then v72 else v57.categoryInfo;
    local v77 = if v57 then v57.categoryId else v75;
    local v78 = if v57 then v57.subcategoryId else v74;
    if l_FFlagAXFixHydratedWidgetsParams_0 then
        local v79 = v30();
        v76 = v25.getCategoryInfoById(v79, v77, v78);
        if not v76 then
            v31("[useMarketplaceResultsFetcher] categoryInfo is nil for categoryId: " .. tostring(v77) .. " and subcategoryId: " .. tostring(v78));
            v76 = v72;
        end;
    end;
    local v80 = if v57 then v57.searchUuid else v76.SearchUuid;
    local v81 = l_useStore_0();
    local v82, v83 = v2.useState(false);
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    local v88 = nil;
    local v89 = nil;
    local v90 = nil;
    local v91 = nil;
    local v92 = nil;
    local v93 = nil;
    if l_FFlagAXMoveAllTabToWidgetOnly_0 then
        local v94, v95 = v2.useState(false);
        v84 = v94;
        v85 = v95;
        v94, v95 = v2.useState(false);
        v86 = v94;
        v87 = v95;
        v94, v95 = v2.useState(false);
        v88 = v94;
        v89 = v95;
        v94, v95 = v2.useState(false);
        v90 = v94;
        v91 = v95;
        v94, v95 = v2.useState(false);
        v92 = v94;
        v93 = v95;
    end;
    local v96, v97 = v2.useState(false);
    local v98 = (not not v58 or l_FFlagAXUnifiedMarketplaceResultsFetcher_0) and not v64 and v80 ~= nil;
    local v99 = nil;
    if l_FFlagAXCatalogCategoriesSDUI_0 then
        v99 = v19();
    end;
    local v105 = if l_FFlagAXResetFetchMarketplaceLogic_0 then v2.useCallback(function() --[[ Line: 300 ]]
        -- upvalues: l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (ref), v60 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), v85 (ref), v87 (ref), v89 (ref), v91 (ref), v93 (ref), v83 (copy), v97 (copy), v61 (copy), v80 (copy), v59 (copy), v32 (ref), v44 (ref), l_FFlagAXEnableTTIViaModule_0 (ref), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_TTIPerformanceManager_0 (ref), l_TimeToInteractiveTracker_0 (ref), v52 (ref), v37 (ref), v35 (ref), v24 (ref), v34 (ref), v76 (ref), l_FFlagAXDurablesSupport_0 (ref), v77 (copy), v78 (copy), v13 (ref), l_AvatarScreen_0 (ref), v33 (ref), l_setFetchingMarketplaceInProgress_0 (copy)
        if l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 and v60 == nil then
            return;
        else
            if l_FFlagAXMoveAllTabToWidgetOnly_0 then
                v85(false);
                v87(false);
                v89(false);
                v91(false);
                v93(false);
            else
                v83(false);
            end;
            v97(false);
            if v61 then
                v61:storePageObject(v80, nil);
            end;
            v59(v32(v80));
            if v44() then
                if l_FFlagAXEnableTTIViaModule_0 then
                    if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                        l_TTIPerformanceManager_0.Surface.Marketplace.Root.startTracking();
                    else
                        l_TimeToInteractiveTracker_0.trackStart(v52.Counter.PREFIX .. v52.Counter.Latency.Organic.Tiles);
                        l_TimeToInteractiveTracker_0.trackStart(v52.Counter.PREFIX .. v52.Counter.Latency.Organic.Thumbnails);
                        l_TimeToInteractiveTracker_0.trackStart(v52.Counter.PREFIX .. v52.Counter.Latency.Widget.Tiles);
                        l_TimeToInteractiveTracker_0.trackStart(v52.Counter.PREFIX .. v52.Counter.Latency.Widget.Thumbnails);
                    end;
                end;
                v59(v37.StartTracking(v80));
            end;
            v59(v35(v80, v24.SearchTypes.Catalog));
            v59(v34(v80, {
                categoryInfo = v76, 
                catalogSort = v60.CatalogSort, 
                catalogSortAggregation = v60.CatalogSortAggregation, 
                minPrice = v60.PriceRange.minPrice, 
                maxPrice = v60.PriceRange.maxPrice, 
                selectedTopics = v60.SelectedTopics, 
                creatorFilter = v60.CreatorFilter, 
                salesTypeFilter = v60.SalesTypeFilter, 
                unavailableItemFilter = v60.UnavailableItemFilter, 
                wearTimeFilter = if l_FFlagAXDurablesSupport_0 then v60.WearTimeFilter else nil
            }));
            local v100 = nil;
            local l_v77_0 = v77;
            local l_v78_0 = v78;
            if l_v77_0 then
                local v103 = if type(l_v77_0) == "string" then l_v77_0 else if type(l_v77_0) == "number" then tostring(l_v77_0) else nil;
                local v104 = if type(l_v78_0) == "string" then l_v78_0 else if type(l_v78_0) == "number" then tostring(l_v78_0) else nil;
                if v103 then
                    v100 = v13.getContextForWidgetsById(l_AvatarScreen_0.Catalog, v103, v104);
                end;
            end;
            if v100 then
                v59(v33(nil, v100));
            end;
            v59(v33(nil, nil));
            l_setFetchingMarketplaceInProgress_0();
            return;
        end;
    end, {
        v61, 
        v80, 
        v60, 
        v76, 
        v77, 
        v78, 
        l_setFetchingMarketplaceInProgress_0
    }) else nil;
    local v108 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v2.useCallback(function() --[[ Line: 413 ]]
        -- upvalues: v76 (ref), v59 (copy), v28 (ref), v62 (copy), v14 (ref), v87 (ref), v91 (ref), l_Logging_0 (ref)
        if v76.ShowSponsored then
            local v106 = v59(v28(v62, v14.SponsoredItemsCategoryRecommended, v14.SponsoredItemsToFetch));
            if v106 and v106.andThen then
                v106:andThen(function() --[[ Line: 424 ]]
                    -- upvalues: v87 (ref), v91 (ref)
                    v87(true);
                    v91(true);
                end, function(v107) --[[ Line: 427 ]]
                    -- upvalues: l_Logging_0 (ref), v91 (ref)
                    l_Logging_0.warn("useMarketplaceResultsFetcher: Fetch sponsored items failed: " .. tostring(v107));
                    v91(true);
                end);
                return;
            else
                v91(true);
                return;
            end;
        else
            v91(true);
            return;
        end;
    end, {
        v76, 
        v62, 
        v59, 
        v87, 
        v91
    }) else nil;
    local v112 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v2.useCallback(function() --[[ Line: 447 ]]
        -- upvalues: v80 (copy), v76 (ref), v59 (copy), v29 (ref), v62 (copy), v85 (ref), v89 (ref), l_Logging_0 (ref)
        local v109 = {
            searchUuid = v80, 
            categoryInfo = v76, 
            recordSearchTime = true
        };
        local v110 = v59(v29(v109, v62));
        if v110 and v110.andThen then
            v110:andThen(function() --[[ Line: 455 ]]
                -- upvalues: v85 (ref), v89 (ref)
                v85(true);
                v89(true);
            end, function(v111) --[[ Line: 458 ]]
                -- upvalues: l_Logging_0 (ref), v89 (ref)
                l_Logging_0.warn("useMarketplaceResultsFetcher: Fetch catalog search failed: " .. tostring(v111));
                v89(true);
            end);
            return;
        else
            v89(true);
            return;
        end;
    end, {
        v80, 
        v76, 
        v59, 
        v62, 
        v85, 
        v89
    }) else nil;
    local v113 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v2.useCallback(function() --[[ Line: 476 ]]
        -- upvalues: v59 (copy), v36 (ref), v80 (copy)
        v59(v36(v80, tick()));
    end, {
        v59, 
        v80
    }) else nil;
    local v125 = v2.useCallback(function() --[[ Line: 486 ]]
        -- upvalues: v98 (copy), l_FFlagAXResetFetchMarketplaceLogic_0 (ref), v105 (copy), l_setFetchingMarketplaceInProgress_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), v113 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (ref), v99 (ref), l_sendAXCounterV2_0 (ref), v21 (ref), v70 (copy), v27 (ref), v59 (copy), v62 (copy), v76 (ref), v81 (copy), l_FFlagAXFixHydratedWidgetsParams_0 (ref), v77 (copy), v78 (copy), v108 (copy), v97 (copy), v93 (ref), v112 (copy), v89 (ref), v69 (copy), v26 (ref), v80 (copy), v83 (copy)
        if not v98 then
            return;
        else
            if l_FFlagAXResetFetchMarketplaceLogic_0 then
                v105();
            else
                l_setFetchingMarketplaceInProgress_0();
            end;
            if l_FFlagAXMoveAllTabToWidgetOnly_0 then
                v113();
                if l_FFlagAXCatalogCategoriesSDUI_0 then
                    v99():andThen(function() --[[ Line: 504 ]]

                    end, function(v114) --[[ Line: 506 ]]
                        -- upvalues: l_sendAXCounterV2_0 (ref), v21 (ref), v70 (ref)
                        warn("fetchCatalogCategories error", v114);
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 508 ]]
                            -- upvalues: v114 (copy)
                            return (string.sub(tostring(v114), 1, 100));
                        end);
                        l_sendAXCounterV2_0(v21.Counter.Catalog.Errors.FetchCatalogCategoriesError, {
                            error = if l_status_0 then l_result_0 else "unknown"
                        });
                        v70();
                    end);
                end;
                local v117 = v27(v59, v62, v76, v81, if l_FFlagAXFixHydratedWidgetsParams_0 then v77 else nil, if l_FFlagAXFixHydratedWidgetsParams_0 then v78 else nil);
                v108();
                if v117 and v117.andThen then
                    v117:andThen(function(v118) --[[ Line: 531 ]]
                        -- upvalues: v97 (ref), v93 (ref), v112 (ref), v89 (ref)
                        v97(true);
                        v93(true);
                        if not v118 or not v118.configuration or not v118.configuration.customizedDataMap or not v118.configuration.customizedDataMap.disableOrganicContentFetch then
                            v112();
                            return;
                        else
                            v89(true);
                            return;
                        end;
                    end, function(_) --[[ Line: 548 ]]
                        -- upvalues: v89 (ref), v69 (ref)
                        v89(true);
                        v69();
                    end);
                    return;
                end;
            else
                if l_FFlagAXCatalogCategoriesSDUI_0 then
                    v99():andThen(function() --[[ Line: 556 ]]

                    end, function(v120) --[[ Line: 558 ]]
                        -- upvalues: l_sendAXCounterV2_0 (ref), v21 (ref), v70 (ref)
                        warn("fetchCatalogCategories error", v120);
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 560 ]]
                            -- upvalues: v120 (copy)
                            return (string.sub(tostring(v120), 1, 100));
                        end);
                        l_sendAXCounterV2_0(v21.Counter.Catalog.Errors.FetchCatalogCategoriesError, {
                            error = if l_status_1 then l_result_1 else "unknown"
                        });
                        v70();
                    end);
                end;
                local v123 = v26(v59, v62, v80, v76);
                local v124 = v27(v59, v62, v76, v81, if l_FFlagAXFixHydratedWidgetsParams_0 then v77 else nil, if l_FFlagAXFixHydratedWidgetsParams_0 then v78 else nil);
                if v123 and v123.andThen then
                    v123:andThen(function() --[[ Line: 587 ]]
                        -- upvalues: v83 (ref)
                        v83(true);
                    end);
                end;
                if v124 and v124.andThen then
                    v124:andThen(function() --[[ Line: 595 ]]
                        -- upvalues: v97 (ref)
                        v97(true);
                    end);
                end;
            end;
            return;
        end;
    end, {
        v98, 
        v80, 
        l_setFetchingMarketplaceInProgress_0, 
        v59, 
        if l_FFlagAXResetFetchMarketplaceLogic_0 then v105 else nil, 
        v62, 
        v76, 
        if l_FFlagAXFixHydratedWidgetsParams_0 then v77 else nil, 
        if l_FFlagAXFixHydratedWidgetsParams_0 then v78 else nil, 
        v81, 
        v83, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v85 else nil, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v113 else nil, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v93 else nil, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v89 else nil, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v69 else nil, 
        v97
    });
    if l_FFlagAXMoveAllTabToWidgetOnly_0 then
        v2.useEffect(function() --[[ Line: 623 ]]
            -- upvalues: v96 (copy), v84 (ref), v86 (ref), l_setFetchedMarketplaceCompleted_0 (copy), v92 (ref), v88 (ref), v90 (ref), v71 (copy)
            if v96 and v84 and v86 then
                l_setFetchedMarketplaceCompleted_0();
            end;
            if v92 and v88 and v90 then
                v71();
            end;
        end, {
            v96, 
            v84, 
            v86, 
            v92, 
            v88, 
            v90
        });
    else
        v2.useEffect(function() --[[ Line: 644 ]]
            -- upvalues: v82 (copy), v96 (copy), l_setFetchedMarketplaceCompleted_0 (copy)
            if v82 and v96 then
                l_setFetchedMarketplaceCompleted_0();
            end;
        end, {
            v82, 
            v96
        });
    end;
    return {
        fetchMarketplace = v125, 
        hasFetched = v65, 
        isFetching = v64, 
        fetchedMarketplaceTimestamp = if l_FFlagAXPrefetchOnlyWithinTTL_0 then v66 else nil
    };
end;