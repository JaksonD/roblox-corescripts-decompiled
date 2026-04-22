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
local v27 = require(script.Parent.Parent.Utils.MarketplaceSubscriptionRefetchUtils);
local l_getSearchKeywordFromSearchesParameters_0 = v27.getSearchKeywordFromSearchesParameters;
local l_getShouldFetchCatalogOrganicAfterWidgets_0 = v27.getShouldFetchCatalogOrganicAfterWidgets;
local v30 = require(script.Parent.Parent.Utils.fetchHydratedWidgets);
local v31 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSponsoredItems);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ApiFetchCatalogSearch);
local v33 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategoriesFromStore);
local v34 = require(l_Modules_0.LuaApp.mutedError);
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveSearchInCatalog);
local v36 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearWidgetInfo);
local v37 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v38 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v39 = require(l_Modules_0.LuaApp.Actions.SetSearchTime);
local v40 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortAndFilters);
local v42 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 = v42.FFlagAXFixPrefetchMarketplaceStartupCrash;
local l_FFlagAXUnifiedMarketplaceResultsFetcher_0 = v42.FFlagAXUnifiedMarketplaceResultsFetcher;
local l_FFlagAXPrefetchOnlyWithinTTL_0 = v42.FFlagAXPrefetchOnlyWithinTTL;
local v46 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency);
local l_FFlagAXResetFetchMarketplaceLogic_0 = v42.FFlagAXResetFetchMarketplaceLogic;
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v42.FFlagAXMoveAllTabToWidgetOnly;
local l_FFlagAXCatalogCategoriesSDUI_0 = v42.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXFixHydratedWidgetsParams_0 = v42.FFlagAXFixHydratedWidgetsParams;
local l_FFlagAXDefaultCatalogCategoryId_0 = v42.FFlagAXDefaultCatalogCategoryId;
local l_FFlagAXEnableTTIViaModule_0 = v42.FFlagAXEnableTTIViaModule;
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = v42.FFlagAXEnableMilestoneTrackingForAvatarExperience;
local l_FFlagAXMarketplaceSubscriptionRefetchListener_0 = v42.FFlagAXMarketplaceSubscriptionRefetchListener;
local v55 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v57 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance);
local l_TTIPerformanceManager_0 = v57.TTIPerformanceManager;
local l_WidgetsPercievedTTIManager_0 = v57.WidgetsPercievedTTIManager;
local l_OrganicTTIMilestoneManager_0 = v57.OrganicTTIMilestoneManager;
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
selectSortAndFilters = function(v62) --[[ Line: 157 ]] --[[ Name: selectSortAndFilters ]]
    -- upvalues: l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (copy)
    if l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 and (not v62.AvatarExperience or not v62.AvatarExperience.Catalog) then
        return nil;
    else
        return v62.AvatarExperience.Catalog.SortAndFilters;
    end;
end;
return function(v63) --[[ Line: 207 ]] --[[ Name: useMarketplaceResultsFetcher ]]
    -- upvalues: l_AXPrefetchMarketplaceIXP_0 (copy), v23 (copy), l_useDispatch_0 (copy), l_FFlagAXResetFetchMarketplaceLogic_0 (copy), l_useSelector_0 (copy), v2 (copy), v16 (copy), l_useRoactService_0 (copy), v9 (copy), v12 (copy), l_useSignalState_0 (copy), l_FFlagAXPrefetchOnlyWithinTTL_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v17 (copy), v18 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), v21 (copy), l_CatalogCategories_0 (copy), l_FFlagAXFixHydratedWidgetsParams_0 (copy), v33 (copy), v25 (copy), v34 (copy), l_useStore_0 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy), v19 (copy), l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (copy), v35 (copy), v46 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_TTIPerformanceManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), v55 (copy), v40 (copy), v38 (copy), v24 (copy), l_FFlagAXMarketplaceSubscriptionRefetchListener_0 (copy), v37 (copy), v13 (copy), l_AvatarScreen_0 (copy), v36 (copy), v31 (copy), v14 (copy), l_Logging_0 (copy), l_getSearchKeywordFromSearchesParameters_0 (copy), v32 (copy), l_WidgetsPercievedTTIManager_0 (copy), v39 (copy), l_OrganicTTIMilestoneManager_0 (copy), l_sendAXCounterV2_0 (copy), v30 (copy), l_getShouldFetchCatalogOrganicAfterWidgets_0 (copy), v26 (copy)
    local v64 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v23.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser) else nil;
    local v65 = l_useDispatch_0();
    local v66 = if l_FFlagAXResetFetchMarketplaceLogic_0 then l_useSelector_0(selectSortAndFilters) else nil;
    local v67 = if l_FFlagAXResetFetchMarketplaceLogic_0 then v2.useContext(v16.Consumer) else nil;
    local v68 = l_useRoactService_0(v9);
    local v69 = v12.getFetchMarketplaceStore(false);
    local v70 = l_useSignalState_0(v69.getFetchingMarketplace);
    local v71 = l_useSignalState_0(v69.getFetchedMarketplace);
    local v72 = if l_FFlagAXPrefetchOnlyWithinTTL_0 then l_useSignalState_0(v69.getFetchedMarketplaceTimestamp) else nil;
    local l_setFetchingMarketplaceInProgress_0 = v69.setFetchingMarketplaceInProgress;
    local l_setFetchedMarketplaceCompleted_0 = v69.setFetchedMarketplaceCompleted;
    local v75 = if not not l_FFlagAXMoveAllTabToWidgetOnly_0 or l_FFlagAXCatalogCategoriesSDUI_0 then v69.setFetchingMarketplaceErrorOccured else nil;
    local v76 = if l_FFlagAXCatalogCategoriesSDUI_0 then v69.setCatalogCategoriesErrorOccured else nil;
    local v77 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v69.setFetchingMarketplaceProcessed else nil;
    local v78 = v17();
    local v79, v80 = v18();
    local v81 = v79 or if l_FFlagAXDefaultCatalogCategoryId_0 then v21.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue();
    local v82 = if not v63 or l_FFlagAXFixHydratedWidgetsParams_0 then v78 else v63.categoryInfo;
    local v83 = if v63 then v63.categoryId else v81;
    local v84 = if v63 then v63.subcategoryId else v80;
    if l_FFlagAXFixHydratedWidgetsParams_0 then
        local v85 = v33();
        v82 = v25.getCategoryInfoById(v85, v83, v84);
        if not v82 then
            v34("[useMarketplaceResultsFetcher] categoryInfo is nil for categoryId: " .. tostring(v83) .. " and subcategoryId: " .. tostring(v84));
            v82 = v78;
        end;
    end;
    local v86 = if v63 then v63.searchUuid else v82.SearchUuid;
    local v87 = l_useStore_0();
    local v88, v89 = v2.useState(false);
    local v90 = nil;
    local v91 = nil;
    local v92 = nil;
    local v93 = nil;
    local v94 = nil;
    local v95 = nil;
    local v96 = nil;
    local v97 = nil;
    local v98 = nil;
    local v99 = nil;
    if l_FFlagAXMoveAllTabToWidgetOnly_0 then
        local v100, v101 = v2.useState(false);
        v90 = v100;
        v91 = v101;
        v100, v101 = v2.useState(false);
        v92 = v100;
        v93 = v101;
        v100, v101 = v2.useState(false);
        v94 = v100;
        v95 = v101;
        v100, v101 = v2.useState(false);
        v96 = v100;
        v97 = v101;
        v100, v101 = v2.useState(false);
        v98 = v100;
        v99 = v101;
    end;
    local v102, v103 = v2.useState(false);
    local v104 = (not not v64 or l_FFlagAXUnifiedMarketplaceResultsFetcher_0) and not v70 and v86 ~= nil;
    local v105 = nil;
    if l_FFlagAXCatalogCategoriesSDUI_0 then
        v105 = v19();
    end;
    local v114 = if l_FFlagAXResetFetchMarketplaceLogic_0 then v2.useCallback(function() --[[ Line: 309 ]]
        -- upvalues: l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (ref), v66 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), v91 (ref), v93 (ref), v95 (ref), v97 (ref), v99 (ref), v89 (copy), v103 (copy), v67 (copy), v86 (copy), v65 (copy), v35 (ref), v46 (ref), l_FFlagAXEnableTTIViaModule_0 (ref), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_TTIPerformanceManager_0 (ref), l_TimeToInteractiveTracker_0 (ref), v55 (ref), v40 (ref), v38 (ref), v24 (ref), l_FFlagAXMarketplaceSubscriptionRefetchListener_0 (ref), v87 (copy), v37 (ref), v82 (ref), v83 (copy), v84 (copy), v13 (ref), l_AvatarScreen_0 (ref), v36 (ref), l_setFetchingMarketplaceInProgress_0 (copy)
        if l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 and v66 == nil then
            return;
        else
            if l_FFlagAXMoveAllTabToWidgetOnly_0 then
                v91(false);
                v93(false);
                v95(false);
                v97(false);
                v99(false);
            else
                v89(false);
            end;
            v103(false);
            if v67 then
                v67:storePageObject(v86, nil);
            end;
            v65(v35(v86));
            if v46() then
                if l_FFlagAXEnableTTIViaModule_0 then
                    if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                        l_TTIPerformanceManager_0.Surface.Marketplace.Root.startTracking();
                    else
                        l_TimeToInteractiveTracker_0.trackStart(v55.Counter.PREFIX .. v55.Counter.Latency.Organic.Tiles);
                        l_TimeToInteractiveTracker_0.trackStart(v55.Counter.PREFIX .. v55.Counter.Latency.Organic.Thumbnails);
                        l_TimeToInteractiveTracker_0.trackStart(v55.Counter.PREFIX .. v55.Counter.Latency.Widget.Tiles);
                        l_TimeToInteractiveTracker_0.trackStart(v55.Counter.PREFIX .. v55.Counter.Latency.Widget.Thumbnails);
                    end;
                end;
                v65(v40.StartTracking(v86));
            end;
            v65(v38(v86, v24.SearchTypes.Catalog));
            local v106 = nil;
            if l_FFlagAXMarketplaceSubscriptionRefetchListener_0 then
                local v107 = v87:getState();
                local v108 = if v107.SearchesParameters and v86 then v107.SearchesParameters[v86] else nil;
                if v108 then
                    v106 = v108.searchKeyword;
                end;
            end;
            v65(v37(v86, {
                categoryInfo = v82, 
                catalogSort = v66.CatalogSort, 
                catalogSortAggregation = v66.CatalogSortAggregation, 
                minPrice = v66.PriceRange.minPrice, 
                maxPrice = v66.PriceRange.maxPrice, 
                selectedTopics = v66.SelectedTopics, 
                creatorFilter = v66.CreatorFilter, 
                salesTypeFilter = v66.SalesTypeFilter, 
                unavailableItemFilter = v66.UnavailableItemFilter, 
                wearTimeFilter = v66.WearTimeFilter, 
                searchKeyword = if l_FFlagAXMarketplaceSubscriptionRefetchListener_0 then v106 else nil
            }));
            local v109 = nil;
            local l_v83_0 = v83;
            local l_v84_0 = v84;
            if l_v83_0 then
                local v112 = if type(l_v83_0) == "string" then l_v83_0 else if type(l_v83_0) == "number" then tostring(l_v83_0) else nil;
                local v113 = if type(l_v84_0) == "string" then l_v84_0 else if type(l_v84_0) == "number" then tostring(l_v84_0) else nil;
                if v112 then
                    v109 = v13.getContextForWidgetsById(l_AvatarScreen_0.Catalog, v112, v113);
                end;
            end;
            if v109 then
                v65(v36(nil, v109));
            end;
            v65(v36(nil, nil));
            l_setFetchingMarketplaceInProgress_0();
            return;
        end;
    end, {
        v67, 
        v86, 
        v66, 
        v82, 
        v83, 
        v84, 
        l_setFetchingMarketplaceInProgress_0, 
        if l_FFlagAXMarketplaceSubscriptionRefetchListener_0 then v87 else nil, 
        if l_FFlagAXMarketplaceSubscriptionRefetchListener_0 then v65 else nil
    }) else nil;
    local v117 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v2.useCallback(function() --[[ Line: 437 ]]
        -- upvalues: v82 (ref), v65 (copy), v31 (ref), v68 (copy), v14 (ref), v93 (ref), v97 (ref), l_Logging_0 (ref)
        if v82.ShowSponsored then
            local v115 = v65(v31(v68, v14.SponsoredItemsCategoryRecommended, v14.SponsoredItemsToFetch));
            if v115 and v115.andThen then
                v115:andThen(function() --[[ Line: 448 ]]
                    -- upvalues: v93 (ref), v97 (ref)
                    v93(true);
                    v97(true);
                end, function(v116) --[[ Line: 451 ]]
                    -- upvalues: l_Logging_0 (ref), v97 (ref)
                    l_Logging_0.warn("useMarketplaceResultsFetcher: Fetch sponsored items failed: " .. tostring(v116));
                    v97(true);
                end);
                return;
            else
                v97(true);
                return;
            end;
        else
            v97(true);
            return;
        end;
    end, {
        v82, 
        v68, 
        v65, 
        v93, 
        v97
    }) else nil;
    local v122 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v2.useCallback(function() --[[ Line: 471 ]]
        -- upvalues: v86 (copy), v82 (ref), l_FFlagAXMarketplaceSubscriptionRefetchListener_0 (ref), l_getSearchKeywordFromSearchesParameters_0 (ref), v87 (copy), v65 (copy), v32 (ref), v68 (copy), v91 (ref), v95 (ref), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_WidgetsPercievedTTIManager_0 (ref), l_Logging_0 (ref)
        local v118 = {
            searchUuid = v86, 
            categoryInfo = v82, 
            recordSearchTime = true
        };
        if l_FFlagAXMarketplaceSubscriptionRefetchListener_0 then
            local v119 = l_getSearchKeywordFromSearchesParameters_0(v87, v86);
            if v119 then
                v118.searchKeyword = v119;
            end;
        end;
        local v120 = v65(v32(v118, v68));
        if v120 and v120.andThen then
            v120:andThen(function() --[[ Line: 485 ]]
                -- upvalues: v91 (ref), v95 (ref), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_WidgetsPercievedTTIManager_0 (ref)
                v91(true);
                v95(true);
                if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 and l_WidgetsPercievedTTIManager_0 then
                    l_WidgetsPercievedTTIManager_0.L3.requestFetchCatalogSearchOrganic();
                end;
            end, function(v121) --[[ Line: 493 ]]
                -- upvalues: l_Logging_0 (ref), v95 (ref)
                l_Logging_0.warn("useMarketplaceResultsFetcher: Fetch catalog search failed: " .. tostring(v121));
                v95(true);
            end);
            return;
        else
            v95(true);
            return;
        end;
    end, {
        v86, 
        v82, 
        v65, 
        v68, 
        v91, 
        v95, 
        if l_FFlagAXMarketplaceSubscriptionRefetchListener_0 then v87 else nil
    }) else nil;
    local v123 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v2.useCallback(function() --[[ Line: 512 ]]
        -- upvalues: v65 (copy), v39 (ref), v86 (copy)
        v65(v39(v86, tick()));
    end, {
        v65, 
        v86
    }) else nil;
    local v137 = v2.useCallback(function() --[[ Line: 522 ]]
        -- upvalues: v104 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_WidgetsPercievedTTIManager_0 (ref), l_OrganicTTIMilestoneManager_0 (ref), l_FFlagAXResetFetchMarketplaceLogic_0 (ref), v114 (copy), l_setFetchingMarketplaceInProgress_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), v123 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (ref), v105 (ref), l_sendAXCounterV2_0 (ref), v21 (ref), v76 (copy), v30 (ref), v65 (copy), v68 (copy), v82 (ref), v87 (copy), l_FFlagAXFixHydratedWidgetsParams_0 (ref), v83 (copy), v84 (copy), v117 (copy), v103 (copy), v99 (ref), l_FFlagAXMarketplaceSubscriptionRefetchListener_0 (ref), l_getSearchKeywordFromSearchesParameters_0 (ref), v86 (copy), l_getShouldFetchCatalogOrganicAfterWidgets_0 (ref), v122 (copy), v95 (ref), v75 (copy), v26 (ref), v89 (copy)
        if not v104 then
            return;
        else
            if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                if l_WidgetsPercievedTTIManager_0 then
                    l_WidgetsPercievedTTIManager_0.L2.primaryDataStarted();
                end;
                if l_OrganicTTIMilestoneManager_0 then
                    l_OrganicTTIMilestoneManager_0.L2.primaryDataStarted();
                end;
            end;
            if l_FFlagAXResetFetchMarketplaceLogic_0 then
                v114();
            else
                l_setFetchingMarketplaceInProgress_0();
            end;
            if l_FFlagAXMoveAllTabToWidgetOnly_0 then
                v123();
                if l_FFlagAXCatalogCategoriesSDUI_0 then
                    v105():andThen(function() --[[ Line: 549 ]]

                    end, function(v124) --[[ Line: 551 ]]
                        -- upvalues: l_sendAXCounterV2_0 (ref), v21 (ref), v76 (ref)
                        warn("fetchCatalogCategories error", v124);
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 553 ]]
                            -- upvalues: v124 (copy)
                            return (string.sub(tostring(v124), 1, 100));
                        end);
                        l_sendAXCounterV2_0(v21.Counter.Catalog.Errors.FetchCatalogCategoriesError, {
                            error = if l_status_0 then l_result_0 else "unknown"
                        });
                        v76();
                    end);
                end;
                if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                    if l_WidgetsPercievedTTIManager_0 then
                        l_WidgetsPercievedTTIManager_0.L3.networkFetch();
                    end;
                    if l_OrganicTTIMilestoneManager_0 then
                        l_OrganicTTIMilestoneManager_0.L3.networkFetch();
                    end;
                end;
                local v127 = v30(v65, v68, v82, v87, if l_FFlagAXFixHydratedWidgetsParams_0 then v83 else nil, if l_FFlagAXFixHydratedWidgetsParams_0 then v84 else nil);
                v117();
                if v127 and v127.andThen then
                    v127:andThen(function(v128) --[[ Line: 585 ]]
                        -- upvalues: v103 (ref), v99 (ref), l_FFlagAXMarketplaceSubscriptionRefetchListener_0 (ref), l_getSearchKeywordFromSearchesParameters_0 (ref), v87 (ref), v86 (ref), l_getShouldFetchCatalogOrganicAfterWidgets_0 (ref), v122 (ref), v95 (ref)
                        v103(true);
                        v99(true);
                        if l_FFlagAXMarketplaceSubscriptionRefetchListener_0 then
                            local v129 = v128 and v128.configuration and v128.configuration.customizedDataMap and v128.configuration.customizedDataMap.disableOrganicContentFetch;
                            local v130 = l_getSearchKeywordFromSearchesParameters_0(v87, v86);
                            if l_getShouldFetchCatalogOrganicAfterWidgets_0(v129, v130) then
                                v122();
                                return;
                            else
                                v95(true);
                                return;
                            end;
                        elseif not v128 or not v128.configuration or not v128.configuration.customizedDataMap or not v128.configuration.customizedDataMap.disableOrganicContentFetch then
                            v122();
                            return;
                        else
                            v95(true);
                            return;
                        end;
                    end, function(_) --[[ Line: 622 ]]
                        -- upvalues: v95 (ref), v75 (ref)
                        v95(true);
                        v75();
                    end);
                    return;
                end;
            else
                if l_FFlagAXCatalogCategoriesSDUI_0 then
                    v105():andThen(function() --[[ Line: 630 ]]

                    end, function(v132) --[[ Line: 632 ]]
                        -- upvalues: l_sendAXCounterV2_0 (ref), v21 (ref), v76 (ref)
                        warn("fetchCatalogCategories error", v132);
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 634 ]]
                            -- upvalues: v132 (copy)
                            return (string.sub(tostring(v132), 1, 100));
                        end);
                        l_sendAXCounterV2_0(v21.Counter.Catalog.Errors.FetchCatalogCategoriesError, {
                            error = if l_status_1 then l_result_1 else "unknown"
                        });
                        v76();
                    end);
                end;
                if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                    if l_WidgetsPercievedTTIManager_0 then
                        l_WidgetsPercievedTTIManager_0.L3.networkFetch();
                    end;
                    if l_OrganicTTIMilestoneManager_0 then
                        l_OrganicTTIMilestoneManager_0.L3.networkFetch();
                    end;
                end;
                local v135 = if l_FFlagAXMarketplaceSubscriptionRefetchListener_0 then v26(v65, v68, v86, v82, l_getSearchKeywordFromSearchesParameters_0(v87, v86)) else v26(v65, v68, v86, v82);
                local v136 = v30(v65, v68, v82, v87, if l_FFlagAXFixHydratedWidgetsParams_0 then v83 else nil, if l_FFlagAXFixHydratedWidgetsParams_0 then v84 else nil);
                if v135 and v135.andThen then
                    v135:andThen(function() --[[ Line: 683 ]]
                        -- upvalues: v89 (ref), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_WidgetsPercievedTTIManager_0 (ref)
                        v89(true);
                        if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 and l_WidgetsPercievedTTIManager_0 then
                            l_WidgetsPercievedTTIManager_0.L3.requestFetchCatalogSearch();
                        end;
                    end);
                end;
                if v136 and v136.andThen then
                    v136:andThen(function() --[[ Line: 695 ]]
                        -- upvalues: v103 (ref)
                        v103(true);
                    end);
                end;
            end;
            return;
        end;
    end, {
        v104, 
        v86, 
        l_setFetchingMarketplaceInProgress_0, 
        v65, 
        if l_FFlagAXResetFetchMarketplaceLogic_0 then v114 else nil, 
        v68, 
        v82, 
        if l_FFlagAXFixHydratedWidgetsParams_0 then v83 else nil, 
        if l_FFlagAXFixHydratedWidgetsParams_0 then v84 else nil, 
        v87, 
        v89, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v91 else nil, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v123 else nil, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v99 else nil, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v95 else nil, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v75 else nil, 
        v103
    });
    if l_FFlagAXMoveAllTabToWidgetOnly_0 then
        v2.useEffect(function() --[[ Line: 723 ]]
            -- upvalues: v102 (copy), v90 (ref), v92 (ref), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_WidgetsPercievedTTIManager_0 (ref), l_OrganicTTIMilestoneManager_0 (ref), l_setFetchedMarketplaceCompleted_0 (copy), v98 (ref), v94 (ref), v96 (ref), v77 (copy)
            if v102 and v90 and v92 then
                if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                    if l_WidgetsPercievedTTIManager_0 then
                        l_WidgetsPercievedTTIManager_0.L2.dataProcessingStarted();
                    end;
                    if l_OrganicTTIMilestoneManager_0 then
                        l_OrganicTTIMilestoneManager_0.L2.dataProcessingStarted();
                    end;
                end;
                l_setFetchedMarketplaceCompleted_0();
                if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                    if l_WidgetsPercievedTTIManager_0 then
                        l_WidgetsPercievedTTIManager_0.L2.dataProcessingCompleted();
                    end;
                    if l_OrganicTTIMilestoneManager_0 then
                        l_OrganicTTIMilestoneManager_0.L2.dataProcessingCompleted();
                    end;
                end;
            end;
            if v98 and v94 and v96 then
                v77();
            end;
        end, {
            v102, 
            v90, 
            v92, 
            v98, 
            v94, 
            v96
        });
    else
        v2.useEffect(function() --[[ Line: 760 ]]
            -- upvalues: v88 (copy), v102 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_WidgetsPercievedTTIManager_0 (ref), l_OrganicTTIMilestoneManager_0 (ref), l_setFetchedMarketplaceCompleted_0 (copy)
            if v88 and v102 then
                if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                    if l_WidgetsPercievedTTIManager_0 then
                        l_WidgetsPercievedTTIManager_0.L3.responseReceived();
                        l_WidgetsPercievedTTIManager_0.L2.dataProcessingStarted();
                    end;
                    if l_OrganicTTIMilestoneManager_0 then
                        l_OrganicTTIMilestoneManager_0.L3.responseReceived();
                        l_OrganicTTIMilestoneManager_0.L2.dataProcessingStarted();
                    end;
                end;
                l_setFetchedMarketplaceCompleted_0();
                if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                    if l_WidgetsPercievedTTIManager_0 then
                        l_WidgetsPercievedTTIManager_0.L2.dataProcessingCompleted();
                    end;
                    if l_OrganicTTIMilestoneManager_0 then
                        l_OrganicTTIMilestoneManager_0.L2.dataProcessingCompleted();
                    end;
                end;
            end;
        end, {
            v88, 
            v102
        });
    end;
    return {
        fetchMarketplace = v137, 
        hasFetched = v71, 
        isFetching = v70, 
        fetchedMarketplaceTimestamp = if l_FFlagAXPrefetchOnlyWithinTTL_0 then v72 else nil
    };
end;