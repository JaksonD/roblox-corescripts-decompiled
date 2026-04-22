local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Promise);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AppendSearchInCatalog);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSearchInCatalog);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromSortResults);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleInfoFromSortResults);
local v10 = require(l_Modules_0.LuaApp.Actions.SetSearchTime);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v14 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v16 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_Api_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Api;
local v22 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXHttpCatalogV2SearchItemDetails_0 = v22.FFlagAXHttpCatalogV2SearchItemDetails;
local l_FFlagAXLooksWidgetContextForOrganicContent_0 = v22.FFlagAXLooksWidgetContextForOrganicContent;
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = v22.FFlagAXEnableMilestoneTrackingForAvatarExperience;
local l_sendAXStat_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXStat;
local v27 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCatalogSearchForLooks);
local l_OrganicTTIMilestoneManager_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance).OrganicTTIMilestoneManager;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_CatalogSearchAXPages_0 = l_Api_0.CatalogSearchAXPages;
local function v46(v31, v32, v33, v34, v35, v36) --[[ Line: 64 ]]
    -- upvalues: v12 (copy), v14 (copy), v6 (copy), v5 (copy), v7 (copy), v10 (copy), v8 (copy), v9 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_OrganicTTIMilestoneManager_0 (copy)
    local l_searchUuid_0 = v31.searchUuid;
    local l_searchKeyword_0 = v31.searchKeyword;
    local v39 = v32:getState().Search.SearchesInCatalog[l_searchUuid_0];
    if v12.selectSortAndFiltersKey(v32:getState()) ~= v36 then
        v35("Search with Uuid " .. l_searchUuid_0 .. " has been terminated");
    end;
    local l_v33_CurrentPage_0 = v33:GetCurrentPage();
    l_v33_CurrentPage_0 = v14.tableToCamelCaseKeys(l_v33_CurrentPage_0);
    local v41 = {};
    local v42 = {};
    local v43 = {
        items = {}, 
        keyword = l_searchKeyword_0, 
        hasMoreEntries = not v33.IsFinished
    };
    for v44, v45 in l_v33_CurrentPage_0 do
        if v45.itemType == v6.ItemType.Asset then
            v45.assetType = v6.AssetTypeIdStrings[v45.assetType];
            table.insert(v41, v45);
        elseif v45.itemType == v6.ItemType.Bundle then
            v45.bundleType = v6.BundleTypeIdStrings[v45.bundleType];
            table.insert(v42, v45);
        end;
        v43.items[v44] = {
            id = tostring(v45.id), 
            type = tostring(v45.itemType), 
            productId = v45.productId
        };
    end;
    if v39 then
        v32:dispatch(v5(l_searchUuid_0, v43));
    else
        v32:dispatch(v7(l_searchUuid_0, v43));
    end;
    if v31.recordSearchTime then
        v32:dispatch(v10(l_searchUuid_0, tick()));
    end;
    if #v41 > 0 then
        v32:dispatch(v8(v41));
    end;
    if #v42 > 0 then
        v32:dispatch(v9(v42));
    end;
    v34:storePageObject(l_searchUuid_0, v33);
    if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 and l_OrganicTTIMilestoneManager_0 then
        l_OrganicTTIMilestoneManager_0.L3.catalogApiSearchCompleted();
        l_OrganicTTIMilestoneManager_0.L2.primaryDataReady();
    end;
    v35();
end;
local function v66(v47, v48, v49, v50, v51, v52, v53, v54, v55) --[[ Line: 140 ]] --[[ Name: fetchInitialPage ]]
    -- upvalues: v14 (copy), l_FFlagAXHttpCatalogV2SearchItemDetails_0 (copy), l_Api_0 (copy), v17 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v16 (copy), l_Logging_0 (copy), l_CatalogSearchAXPages_0 (copy), v46 (copy)
    local l_SortAndFilters_0 = v48:getState().AvatarExperience.Catalog.SortAndFilters;
    local v57 = v14.getSearchParams(v47, l_SortAndFilters_0, v54);
    if l_FFlagAXHttpCatalogV2SearchItemDetails_0 then
        local v58 = v14.getSearchParamsAsQueryParams(v57, v47.categoryInfo);
        local v59, _ = l_Api_0.getCatalogV2SearchItemDetails(v55, v58);
        v59:andThen(function(v61) --[[ Line: 163 ]]
            -- upvalues: v17 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v16 (ref), l_Logging_0 (ref), v52 (copy), l_CatalogSearchAXPages_0 (ref), v55 (copy), v58 (copy), v46 (ref), v47 (copy), v48 (copy), v49 (copy), v51 (copy), v53 (copy)
            if not v61 or not v61.data then
                if v17() then
                    l_reportAvatarEventCounterNoAnalyticsArgument_0(v16.Counter.AvatarEditorServiceErrors.SearchCatalog);
                end;
                l_Logging_0.warn("ApiFetchCatalogSearch V2 failure: CatalogV2SearchItemDetails is nil");
                v52({
                    HttpError = Enum.HttpError.OK
                });
                return;
            else
                local v62 = l_CatalogSearchAXPages_0.new(v55, v58, v61.data, v61.nextPageCursor);
                v46(v47, v48, v62, v49, v51, v53);
                return;
            end;
        end):catch(function(v63) --[[ Line: 183 ]]
            -- upvalues: v17 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v16 (ref), l_Logging_0 (ref), v52 (copy)
            if v17() then
                l_reportAvatarEventCounterNoAnalyticsArgument_0(v16.Counter.AvatarEditorServiceErrors.SearchCatalog);
            end;
            l_Logging_0.warn("ApiFetchCatalogSearch V2 failure: " .. tostring(v63));
            v52({
                HttpError = Enum.HttpError.OK
            });
        end);
        return;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 193 ]]
            -- upvalues: v50 (copy), v57 (copy)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return v50:SearchCatalogAsync(v57);
            else
                return v50:SearchCatalog(v57);
            end;
        end);
        if l_status_0 then
            v46(v47, v48, l_result_0, v49, v51, v53);
            return;
        else
            if v17() then
                l_reportAvatarEventCounterNoAnalyticsArgument_0(v16.Counter.AvatarEditorServiceErrors.SearchCatalog);
            end;
            l_Logging_0.warn("ApiFetchCatalogSearch failure: " .. tostring(l_result_0));
            v52({
                HttpError = Enum.HttpError.OK
            });
            return;
        end;
    end;
end;
local function v76(v67, v68, v69, v70, v71, v72, v73) --[[ Line: 215 ]] --[[ Name: advancePage ]]
    -- upvalues: v46 (copy), l_Logging_0 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 224 ]]
        -- upvalues: v67 (copy)
        v67:AdvanceToNextPageAsync();
    end);
    if l_status_1 then
        v46(v68, v69, v67, v70, v71, v73);
        return;
    else
        l_Logging_0.warn("ApiFetchCatalogSearch failure: " .. l_result_1);
        v72({
            HttpError = Enum.HttpError.OK
        });
        return;
    end;
end;
return function(v77, v78) --[[ Line: 236 ]]
    -- upvalues: v12 (copy), l_DeviceOrientationMode_0 (copy), v27 (copy), l_PerformFetch_0 (copy), v14 (copy), l_FFlagAXLooksWidgetContextForOrganicContent_0 (copy), v3 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_OrganicTTIMilestoneManager_0 (copy), v66 (copy), l_FFlagAXHttpCatalogV2SearchItemDetails_0 (copy), l_sendAXStat_0 (copy), v16 (copy), v76 (copy)
    return function(v79, v80) --[[ Line: 237 ]]
        -- upvalues: v77 (copy), v12 (ref), l_DeviceOrientationMode_0 (ref), v27 (ref), v78 (copy), l_PerformFetch_0 (ref), v14 (ref), l_FFlagAXLooksWidgetContextForOrganicContent_0 (ref), v3 (ref), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_OrganicTTIMilestoneManager_0 (ref), v66 (ref), l_FFlagAXHttpCatalogV2SearchItemDetails_0 (ref), l_sendAXStat_0 (ref), v16 (ref), v76 (ref)
        local l_pageObjectManager_0 = v80.pageObjectManager;
        local l_avatarEditorService_0 = v80.avatarEditorService;
        local l_searchUuid_1 = v77.searchUuid;
        local v84 = v12.selectSortAndFiltersKey(v79:getState());
        local v85 = os.clock();
        local v86 = v79:getState().DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
        local function v87() --[[ Line: 249 ]]
            -- upvalues: v79 (copy), v27 (ref), v77 (ref), v78 (ref)
            return v79:dispatch(v27(v77, v78));
        end;
        local v88 = v77 and v77.categoryInfo;
        return l_PerformFetch_0.Single(v14.getSearchKey(v79:getState(), l_searchUuid_1), function(v89) --[[ Line: 255 ]]
            -- upvalues: v88 (copy), l_FFlagAXLooksWidgetContextForOrganicContent_0 (ref), v87 (copy), l_pageObjectManager_0 (copy), l_searchUuid_1 (copy), v3 (ref), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_OrganicTTIMilestoneManager_0 (ref), v66 (ref), v77 (ref), l_avatarEditorService_0 (copy), v84 (copy), v86 (copy), l_FFlagAXHttpCatalogV2SearchItemDetails_0 (ref), v78 (ref), v85 (copy), l_sendAXStat_0 (ref), v16 (ref), v76 (ref)
            if v88 and if l_FFlagAXLooksWidgetContextForOrganicContent_0 then v88.LooksWidgetContextForOrganicContent else v88.ShowLooksAsOrganicContent then
                assert(v87, "Function exists if AXAvatarsTabIXP.isEnabled() is enabled. Assert can be removed with AXAvatarsTabIXP.isEnabled()");
                return v87();
            else
                local v90 = l_pageObjectManager_0:getPageObject(l_searchUuid_1);
                if v90 and v90.IsFinished then
                    return v3.resolve();
                else
                    if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 and l_OrganicTTIMilestoneManager_0 then
                        l_OrganicTTIMilestoneManager_0.L3.catalogApiSearchStarted();
                    end;
                    return v3.new(function(v91, v92) --[[ Line: 280 ]]
                        -- upvalues: l_searchUuid_1 (ref), v90 (copy), v66 (ref), v77 (ref), v89 (copy), l_pageObjectManager_0 (ref), l_avatarEditorService_0 (ref), v84 (ref), v86 (ref), l_FFlagAXHttpCatalogV2SearchItemDetails_0 (ref), v78 (ref), v85 (ref), l_sendAXStat_0 (ref), v16 (ref), v76 (ref)
                        if not l_searchUuid_1 then
                            v92("Must have a searchUuid.");
                        end;
                        if v90 == nil then
                            v66(v77, v89, l_pageObjectManager_0, l_avatarEditorService_0, v91, v92, v84, v86, if l_FFlagAXHttpCatalogV2SearchItemDetails_0 then v78 else nil);
                            if v85 then
                                local v93 = (os.clock() - v85) * 1000;
                                l_sendAXStat_0({
                                    statName = v16.Counter.Latency.Network.ApiFetchCatalogSearch, 
                                    deltaMs = v93
                                });
                                return;
                            end;
                        else
                            v76(v90, v77, v89, l_pageObjectManager_0, v91, v92, v84);
                        end;
                    end);
                end;
            end;
        end)(v79);
    end;
end;