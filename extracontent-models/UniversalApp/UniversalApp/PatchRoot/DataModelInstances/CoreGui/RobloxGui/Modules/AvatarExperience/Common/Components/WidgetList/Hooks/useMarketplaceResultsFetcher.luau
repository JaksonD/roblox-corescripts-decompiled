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
local v51 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
selectSortAndFilters = function(v54) --[[ Line: 145 ]] --[[ Name: selectSortAndFilters ]]
    -- upvalues: l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (copy)
    if l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 and (not v54.AvatarExperience or not v54.AvatarExperience.Catalog) then
        return nil;
    else
        return v54.AvatarExperience.Catalog.SortAndFilters;
    end;
end;
return function(v55) --[[ Line: 194 ]] --[[ Name: useMarketplaceResultsFetcher ]]
    -- upvalues: l_AXPrefetchMarketplaceIXP_0 (copy), v23 (copy), l_useDispatch_0 (copy), l_FFlagAXResetFetchMarketplaceLogic_0 (copy), l_useSelector_0 (copy), v2 (copy), v16 (copy), l_useRoactService_0 (copy), v9 (copy), v12 (copy), l_useSignalState_0 (copy), l_FFlagAXPrefetchOnlyWithinTTL_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v17 (copy), v18 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), v21 (copy), l_CatalogCategories_0 (copy), l_FFlagAXFixHydratedWidgetsParams_0 (copy), v30 (copy), v25 (copy), v31 (copy), l_useStore_0 (copy), l_FFlagAXUnifiedMarketplaceResultsFetcher_0 (copy), v19 (copy), l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (copy), v32 (copy), v44 (copy), l_FFlagAXEnableTTIViaModule_0 (copy), l_TimeToInteractiveTracker_0 (copy), v51 (copy), v37 (copy), v35 (copy), v24 (copy), v34 (copy), l_FFlagAXDurablesSupport_0 (copy), v13 (copy), l_AvatarScreen_0 (copy), v33 (copy), v28 (copy), v14 (copy), l_Logging_0 (copy), v29 (copy), v36 (copy), l_sendAXCounterV2_0 (copy), v27 (copy), v26 (copy)
    local v56 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v23.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser) else nil;
    local v57 = l_useDispatch_0();
    local v58 = if l_FFlagAXResetFetchMarketplaceLogic_0 then l_useSelector_0(selectSortAndFilters) else nil;
    local v59 = if l_FFlagAXResetFetchMarketplaceLogic_0 then v2.useContext(v16.Consumer) else nil;
    local v60 = l_useRoactService_0(v9);
    local v61 = v12.getFetchMarketplaceStore(false);
    local v62 = l_useSignalState_0(v61.getFetchingMarketplace);
    local v63 = l_useSignalState_0(v61.getFetchedMarketplace);
    local v64 = if l_FFlagAXPrefetchOnlyWithinTTL_0 then l_useSignalState_0(v61.getFetchedMarketplaceTimestamp) else nil;
    local l_setFetchingMarketplaceInProgress_0 = v61.setFetchingMarketplaceInProgress;
    local l_setFetchedMarketplaceCompleted_0 = v61.setFetchedMarketplaceCompleted;
    local v67 = if not not l_FFlagAXMoveAllTabToWidgetOnly_0 or l_FFlagAXCatalogCategoriesSDUI_0 then v61.setFetchingMarketplaceErrorOccured else nil;
    local v68 = if l_FFlagAXCatalogCategoriesSDUI_0 then v61.setCatalogCategoriesErrorOccured else nil;
    local v69 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v61.setFetchingMarketplaceProcessed else nil;
    local v70 = v17();
    local v71, v72 = v18();
    local v73 = v71 or if l_FFlagAXDefaultCatalogCategoryId_0 then v21.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue();
    local v74 = if not v55 or l_FFlagAXFixHydratedWidgetsParams_0 then v70 else v55.categoryInfo;
    local v75 = if v55 then v55.categoryId else v73;
    local v76 = if v55 then v55.subcategoryId else v72;
    if l_FFlagAXFixHydratedWidgetsParams_0 then
        local v77 = v30();
        v74 = v25.getCategoryInfoById(v77, v75, v76);
        if not v74 then
            v31("[useMarketplaceResultsFetcher] categoryInfo is nil for categoryId: " .. tostring(v75) .. " and subcategoryId: " .. tostring(v76));
            v74 = v70;
        end;
    end;
    local v78 = if v55 then v55.searchUuid else v74.SearchUuid;
    local v79 = l_useStore_0();
    local v80, v81 = v2.useState(false);
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    local v88 = nil;
    local v89 = nil;
    local v90 = nil;
    local v91 = nil;
    if l_FFlagAXMoveAllTabToWidgetOnly_0 then
        local v92, v93 = v2.useState(false);
        v82 = v92;
        v83 = v93;
        v92, v93 = v2.useState(false);
        v84 = v92;
        v85 = v93;
        v92, v93 = v2.useState(false);
        v86 = v92;
        v87 = v93;
        v92, v93 = v2.useState(false);
        v88 = v92;
        v89 = v93;
        v92, v93 = v2.useState(false);
        v90 = v92;
        v91 = v93;
    end;
    local v94, v95 = v2.useState(false);
    local v96 = (not not v56 or l_FFlagAXUnifiedMarketplaceResultsFetcher_0) and not v62 and v78 ~= nil;
    local v97 = nil;
    if l_FFlagAXCatalogCategoriesSDUI_0 then
        v97 = v19();
    end;
    local v103 = if l_FFlagAXResetFetchMarketplaceLogic_0 then v2.useCallback(function() --[[ Line: 296 ]]
        -- upvalues: l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (ref), v58 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), v83 (ref), v85 (ref), v87 (ref), v89 (ref), v91 (ref), v81 (copy), v95 (copy), v59 (copy), v78 (copy), v57 (copy), v32 (ref), v44 (ref), l_FFlagAXEnableTTIViaModule_0 (ref), l_TimeToInteractiveTracker_0 (ref), v51 (ref), v37 (ref), v35 (ref), v24 (ref), v34 (ref), v74 (ref), l_FFlagAXDurablesSupport_0 (ref), v75 (copy), v76 (copy), v13 (ref), l_AvatarScreen_0 (ref), v33 (ref), l_setFetchingMarketplaceInProgress_0 (copy)
        if l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 and v58 == nil then
            return;
        else
            if l_FFlagAXMoveAllTabToWidgetOnly_0 then
                v83(false);
                v85(false);
                v87(false);
                v89(false);
                v91(false);
            else
                v81(false);
            end;
            v95(false);
            if v59 then
                v59:storePageObject(v78, nil);
            end;
            v57(v32(v78));
            if v44() then
                if l_FFlagAXEnableTTIViaModule_0 then
                    l_TimeToInteractiveTracker_0.trackStart(v51.Counter.PREFIX .. v51.Counter.Latency.Organic.Tiles);
                    l_TimeToInteractiveTracker_0.trackStart(v51.Counter.PREFIX .. v51.Counter.Latency.Organic.Thumbnails);
                    l_TimeToInteractiveTracker_0.trackStart(v51.Counter.PREFIX .. v51.Counter.Latency.Widget.Tiles);
                    l_TimeToInteractiveTracker_0.trackStart(v51.Counter.PREFIX .. v51.Counter.Latency.Widget.Thumbnails);
                end;
                v57(v37.StartTracking(v78));
            end;
            v57(v35(v78, v24.SearchTypes.Catalog));
            v57(v34(v78, {
                categoryInfo = v74, 
                catalogSort = v58.CatalogSort, 
                catalogSortAggregation = v58.CatalogSortAggregation, 
                minPrice = v58.PriceRange.minPrice, 
                maxPrice = v58.PriceRange.maxPrice, 
                selectedTopics = v58.SelectedTopics, 
                creatorFilter = v58.CreatorFilter, 
                salesTypeFilter = v58.SalesTypeFilter, 
                unavailableItemFilter = v58.UnavailableItemFilter, 
                wearTimeFilter = if l_FFlagAXDurablesSupport_0 then v58.WearTimeFilter else nil
            }));
            local v98 = nil;
            local l_v75_0 = v75;
            local l_v76_0 = v76;
            if l_v75_0 then
                local v101 = if type(l_v75_0) == "string" then l_v75_0 else if type(l_v75_0) == "number" then tostring(l_v75_0) else nil;
                local v102 = if type(l_v76_0) == "string" then l_v76_0 else if type(l_v76_0) == "number" then tostring(l_v76_0) else nil;
                if v101 then
                    v98 = v13.getContextForWidgetsById(l_AvatarScreen_0.Catalog, v101, v102);
                end;
            end;
            if v98 then
                v57(v33(nil, v98));
            end;
            v57(v33(nil, nil));
            l_setFetchingMarketplaceInProgress_0();
            return;
        end;
    end, {
        v59, 
        v78, 
        v58, 
        v74, 
        v75, 
        v76, 
        l_setFetchingMarketplaceInProgress_0
    }) else nil;
    local v106 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v2.useCallback(function() --[[ Line: 405 ]]
        -- upvalues: v74 (ref), v57 (copy), v28 (ref), v60 (copy), v14 (ref), v85 (ref), v89 (ref), l_Logging_0 (ref)
        if v74.ShowSponsored then
            local v104 = v57(v28(v60, v14.SponsoredItemsCategoryRecommended, v14.SponsoredItemsToFetch));
            if v104 and v104.andThen then
                v104:andThen(function() --[[ Line: 416 ]]
                    -- upvalues: v85 (ref), v89 (ref)
                    v85(true);
                    v89(true);
                end, function(v105) --[[ Line: 419 ]]
                    -- upvalues: l_Logging_0 (ref), v89 (ref)
                    l_Logging_0.warn("useMarketplaceResultsFetcher: Fetch sponsored items failed: " .. tostring(v105));
                    v89(true);
                end);
                return;
            else
                v89(true);
                return;
            end;
        else
            v89(true);
            return;
        end;
    end, {
        v74, 
        v60, 
        v57, 
        v85, 
        v89
    }) else nil;
    local v110 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v2.useCallback(function() --[[ Line: 439 ]]
        -- upvalues: v78 (copy), v74 (ref), v57 (copy), v29 (ref), v60 (copy), v83 (ref), v87 (ref), l_Logging_0 (ref)
        local v107 = {
            searchUuid = v78, 
            categoryInfo = v74, 
            recordSearchTime = true
        };
        local v108 = v57(v29(v107, v60));
        if v108 and v108.andThen then
            v108:andThen(function() --[[ Line: 447 ]]
                -- upvalues: v83 (ref), v87 (ref)
                v83(true);
                v87(true);
            end, function(v109) --[[ Line: 450 ]]
                -- upvalues: l_Logging_0 (ref), v87 (ref)
                l_Logging_0.warn("useMarketplaceResultsFetcher: Fetch catalog search failed: " .. tostring(v109));
                v87(true);
            end);
            return;
        else
            v87(true);
            return;
        end;
    end, {
        v78, 
        v74, 
        v57, 
        v60, 
        v83, 
        v87
    }) else nil;
    local v111 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then v2.useCallback(function() --[[ Line: 468 ]]
        -- upvalues: v57 (copy), v36 (ref), v78 (copy)
        v57(v36(v78, tick()));
    end, {
        v57, 
        v78
    }) else nil;
    local v123 = v2.useCallback(function() --[[ Line: 478 ]]
        -- upvalues: v96 (copy), l_FFlagAXResetFetchMarketplaceLogic_0 (ref), v103 (copy), l_setFetchingMarketplaceInProgress_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), v111 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (ref), v97 (ref), l_sendAXCounterV2_0 (ref), v21 (ref), v68 (copy), v27 (ref), v57 (copy), v60 (copy), v74 (ref), v79 (copy), l_FFlagAXFixHydratedWidgetsParams_0 (ref), v75 (copy), v76 (copy), v106 (copy), v95 (copy), v91 (ref), v110 (copy), v87 (ref), v67 (copy), v26 (ref), v78 (copy), v81 (copy)
        if not v96 then
            return;
        else
            if l_FFlagAXResetFetchMarketplaceLogic_0 then
                v103();
            else
                l_setFetchingMarketplaceInProgress_0();
            end;
            if l_FFlagAXMoveAllTabToWidgetOnly_0 then
                v111();
                if l_FFlagAXCatalogCategoriesSDUI_0 then
                    v97():andThen(function() --[[ Line: 496 ]]

                    end, function(v112) --[[ Line: 498 ]]
                        -- upvalues: l_sendAXCounterV2_0 (ref), v21 (ref), v68 (ref)
                        warn("fetchCatalogCategories error", v112);
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 500 ]]
                            -- upvalues: v112 (copy)
                            return (string.sub(tostring(v112), 1, 100));
                        end);
                        l_sendAXCounterV2_0(v21.Counter.Catalog.Errors.FetchCatalogCategoriesError, {
                            error = if l_status_0 then l_result_0 else "unknown"
                        });
                        v68();
                    end);
                end;
                local v115 = v27(v57, v60, v74, v79, if l_FFlagAXFixHydratedWidgetsParams_0 then v75 else nil, if l_FFlagAXFixHydratedWidgetsParams_0 then v76 else nil);
                v106();
                if v115 and v115.andThen then
                    v115:andThen(function(v116) --[[ Line: 523 ]]
                        -- upvalues: v95 (ref), v91 (ref), v110 (ref), v87 (ref)
                        v95(true);
                        v91(true);
                        if not v116 or not v116.configuration or not v116.configuration.customizedDataMap or not v116.configuration.customizedDataMap.disableOrganicContentFetch then
                            v110();
                            return;
                        else
                            v87(true);
                            return;
                        end;
                    end, function(_) --[[ Line: 540 ]]
                        -- upvalues: v87 (ref), v67 (ref)
                        v87(true);
                        v67();
                    end);
                    return;
                end;
            else
                if l_FFlagAXCatalogCategoriesSDUI_0 then
                    v97():andThen(function() --[[ Line: 548 ]]

                    end, function(v118) --[[ Line: 550 ]]
                        -- upvalues: l_sendAXCounterV2_0 (ref), v21 (ref), v68 (ref)
                        warn("fetchCatalogCategories error", v118);
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 552 ]]
                            -- upvalues: v118 (copy)
                            return (string.sub(tostring(v118), 1, 100));
                        end);
                        l_sendAXCounterV2_0(v21.Counter.Catalog.Errors.FetchCatalogCategoriesError, {
                            error = if l_status_1 then l_result_1 else "unknown"
                        });
                        v68();
                    end);
                end;
                local v121 = v26(v57, v60, v78, v74);
                local v122 = v27(v57, v60, v74, v79, if l_FFlagAXFixHydratedWidgetsParams_0 then v75 else nil, if l_FFlagAXFixHydratedWidgetsParams_0 then v76 else nil);
                if v121 and v121.andThen then
                    v121:andThen(function() --[[ Line: 579 ]]
                        -- upvalues: v81 (ref)
                        v81(true);
                    end);
                end;
                if v122 and v122.andThen then
                    v122:andThen(function() --[[ Line: 587 ]]
                        -- upvalues: v95 (ref)
                        v95(true);
                    end);
                end;
            end;
            return;
        end;
    end, {
        v96, 
        v78, 
        l_setFetchingMarketplaceInProgress_0, 
        v57, 
        if l_FFlagAXResetFetchMarketplaceLogic_0 then v103 else nil, 
        v60, 
        v74, 
        if l_FFlagAXFixHydratedWidgetsParams_0 then v75 else nil, 
        if l_FFlagAXFixHydratedWidgetsParams_0 then v76 else nil, 
        v79, 
        v81, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v83 else nil, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v111 else nil, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v91 else nil, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v87 else nil, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v67 else nil, 
        v95
    });
    if l_FFlagAXMoveAllTabToWidgetOnly_0 then
        v2.useEffect(function() --[[ Line: 615 ]]
            -- upvalues: v94 (copy), v82 (ref), v84 (ref), l_setFetchedMarketplaceCompleted_0 (copy), v90 (ref), v86 (ref), v88 (ref), v69 (copy)
            if v94 and v82 and v84 then
                l_setFetchedMarketplaceCompleted_0();
            end;
            if v90 and v86 and v88 then
                v69();
            end;
        end, {
            v94, 
            v82, 
            v84, 
            v90, 
            v86, 
            v88
        });
    else
        v2.useEffect(function() --[[ Line: 636 ]]
            -- upvalues: v80 (copy), v94 (copy), l_setFetchedMarketplaceCompleted_0 (copy)
            if v80 and v94 then
                l_setFetchedMarketplaceCompleted_0();
            end;
        end, {
            v80, 
            v94
        });
    end;
    return {
        fetchMarketplace = v123, 
        hasFetched = v63, 
        isFetching = v62, 
        fetchedMarketplaceTimestamp = if l_FFlagAXPrefetchOnlyWithinTTL_0 then v64 else nil
    };
end;