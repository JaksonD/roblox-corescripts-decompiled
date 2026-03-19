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
local l_sendAXStat_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXStat;
local v26 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCatalogSearchForLooks);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_CatalogSearchAXPages_0 = l_Api_0.CatalogSearchAXPages;
local function v44(v29, v30, v31, v32, v33, v34) --[[ Line: 59 ]]
    -- upvalues: v12 (copy), v14 (copy), v6 (copy), v5 (copy), v7 (copy), v10 (copy), v8 (copy), v9 (copy)
    local l_searchUuid_0 = v29.searchUuid;
    local l_searchKeyword_0 = v29.searchKeyword;
    local v37 = v30:getState().Search.SearchesInCatalog[l_searchUuid_0];
    if v12.selectSortAndFiltersKey(v30:getState()) ~= v34 then
        v33("Search with Uuid " .. l_searchUuid_0 .. " has been terminated");
    end;
    local l_v31_CurrentPage_0 = v31:GetCurrentPage();
    l_v31_CurrentPage_0 = v14.tableToCamelCaseKeys(l_v31_CurrentPage_0);
    local v39 = {};
    local v40 = {};
    local v41 = {
        items = {}, 
        keyword = l_searchKeyword_0, 
        hasMoreEntries = not v31.IsFinished
    };
    for v42, v43 in l_v31_CurrentPage_0 do
        if v43.itemType == v6.ItemType.Asset then
            v43.assetType = v6.AssetTypeIdStrings[v43.assetType];
            table.insert(v39, v43);
        elseif v43.itemType == v6.ItemType.Bundle then
            v43.bundleType = v6.BundleTypeIdStrings[v43.bundleType];
            table.insert(v40, v43);
        end;
        v41.items[v42] = {
            id = tostring(v43.id), 
            type = tostring(v43.itemType), 
            productId = v43.productId
        };
    end;
    if v37 then
        v30:dispatch(v5(l_searchUuid_0, v41));
    else
        v30:dispatch(v7(l_searchUuid_0, v41));
    end;
    if v29.recordSearchTime then
        v30:dispatch(v10(l_searchUuid_0, tick()));
    end;
    if #v39 > 0 then
        v30:dispatch(v8(v39));
    end;
    if #v40 > 0 then
        v30:dispatch(v9(v40));
    end;
    v32:storePageObject(l_searchUuid_0, v31);
    v33();
end;
local function v64(v45, v46, v47, v48, v49, v50, v51, v52, v53) --[[ Line: 129 ]] --[[ Name: fetchInitialPage ]]
    -- upvalues: v14 (copy), l_FFlagAXHttpCatalogV2SearchItemDetails_0 (copy), l_Api_0 (copy), v17 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v16 (copy), l_Logging_0 (copy), l_CatalogSearchAXPages_0 (copy), v44 (copy)
    local l_SortAndFilters_0 = v46:getState().AvatarExperience.Catalog.SortAndFilters;
    local v55 = v14.getSearchParams(v45, l_SortAndFilters_0, v52);
    if l_FFlagAXHttpCatalogV2SearchItemDetails_0 then
        local v56 = v14.getSearchParamsAsQueryParams(v55, v45.categoryInfo);
        local v57, _ = l_Api_0.getCatalogV2SearchItemDetails(v53, v56);
        v57:andThen(function(v59) --[[ Line: 152 ]]
            -- upvalues: v17 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v16 (ref), l_Logging_0 (ref), v50 (copy), l_CatalogSearchAXPages_0 (ref), v53 (copy), v56 (copy), v44 (ref), v45 (copy), v46 (copy), v47 (copy), v49 (copy), v51 (copy)
            if not v59 or not v59.data then
                if v17() then
                    l_reportAvatarEventCounterNoAnalyticsArgument_0(v16.Counter.AvatarEditorServiceErrors.SearchCatalog);
                end;
                l_Logging_0.warn("ApiFetchCatalogSearch V2 failure: CatalogV2SearchItemDetails is nil");
                v50({
                    HttpError = Enum.HttpError.OK
                });
                return;
            else
                local v60 = l_CatalogSearchAXPages_0.new(v53, v56, v59.data, v59.nextPageCursor);
                v44(v45, v46, v60, v47, v49, v51);
                return;
            end;
        end):catch(function(v61) --[[ Line: 172 ]]
            -- upvalues: v17 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v16 (ref), l_Logging_0 (ref), v50 (copy)
            if v17() then
                l_reportAvatarEventCounterNoAnalyticsArgument_0(v16.Counter.AvatarEditorServiceErrors.SearchCatalog);
            end;
            l_Logging_0.warn("ApiFetchCatalogSearch V2 failure: " .. tostring(v61));
            v50({
                HttpError = Enum.HttpError.OK
            });
        end);
        return;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 182 ]]
            -- upvalues: v48 (copy), v55 (copy)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return v48:SearchCatalogAsync(v55);
            else
                return v48:SearchCatalog(v55);
            end;
        end);
        if l_status_0 then
            v44(v45, v46, l_result_0, v47, v49, v51);
            return;
        else
            if v17() then
                l_reportAvatarEventCounterNoAnalyticsArgument_0(v16.Counter.AvatarEditorServiceErrors.SearchCatalog);
            end;
            l_Logging_0.warn("ApiFetchCatalogSearch failure: " .. tostring(l_result_0));
            v50({
                HttpError = Enum.HttpError.OK
            });
            return;
        end;
    end;
end;
local function v74(v65, v66, v67, v68, v69, v70, v71) --[[ Line: 204 ]] --[[ Name: advancePage ]]
    -- upvalues: v44 (copy), l_Logging_0 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 213 ]]
        -- upvalues: v65 (copy)
        v65:AdvanceToNextPageAsync();
    end);
    if l_status_1 then
        v44(v66, v67, v65, v68, v69, v71);
        return;
    else
        l_Logging_0.warn("ApiFetchCatalogSearch failure: " .. l_result_1);
        v70({
            HttpError = Enum.HttpError.OK
        });
        return;
    end;
end;
return function(v75, v76) --[[ Line: 225 ]]
    -- upvalues: v12 (copy), l_DeviceOrientationMode_0 (copy), v26 (copy), l_PerformFetch_0 (copy), v14 (copy), l_FFlagAXLooksWidgetContextForOrganicContent_0 (copy), v3 (copy), v64 (copy), l_FFlagAXHttpCatalogV2SearchItemDetails_0 (copy), l_sendAXStat_0 (copy), v16 (copy), v74 (copy)
    return function(v77, v78) --[[ Line: 226 ]]
        -- upvalues: v75 (copy), v12 (ref), l_DeviceOrientationMode_0 (ref), v26 (ref), v76 (copy), l_PerformFetch_0 (ref), v14 (ref), l_FFlagAXLooksWidgetContextForOrganicContent_0 (ref), v3 (ref), v64 (ref), l_FFlagAXHttpCatalogV2SearchItemDetails_0 (ref), l_sendAXStat_0 (ref), v16 (ref), v74 (ref)
        local l_pageObjectManager_0 = v78.pageObjectManager;
        local l_avatarEditorService_0 = v78.avatarEditorService;
        local l_searchUuid_1 = v75.searchUuid;
        local v82 = v12.selectSortAndFiltersKey(v77:getState());
        local v83 = os.clock();
        local v84 = v77:getState().DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
        local function v85() --[[ Line: 238 ]]
            -- upvalues: v77 (copy), v26 (ref), v75 (ref), v76 (ref)
            return v77:dispatch(v26(v75, v76));
        end;
        local v86 = v75 and v75.categoryInfo;
        return l_PerformFetch_0.Single(v14.getSearchKey(v77:getState(), l_searchUuid_1), function(v87) --[[ Line: 244 ]]
            -- upvalues: v86 (copy), l_FFlagAXLooksWidgetContextForOrganicContent_0 (ref), v85 (copy), l_pageObjectManager_0 (copy), l_searchUuid_1 (copy), v3 (ref), v64 (ref), v75 (ref), l_avatarEditorService_0 (copy), v82 (copy), v84 (copy), l_FFlagAXHttpCatalogV2SearchItemDetails_0 (ref), v76 (ref), v83 (copy), l_sendAXStat_0 (ref), v16 (ref), v74 (ref)
            if v86 and if l_FFlagAXLooksWidgetContextForOrganicContent_0 then v86.LooksWidgetContextForOrganicContent else v86.ShowLooksAsOrganicContent then
                assert(v85, "Function exists if AXAvatarsTabIXP.isEnabled() is enabled. Assert can be removed with AXAvatarsTabIXP.isEnabled()");
                return v85();
            else
                local v88 = l_pageObjectManager_0:getPageObject(l_searchUuid_1);
                if v88 and v88.IsFinished then
                    return v3.resolve();
                else
                    return v3.new(function(v89, v90) --[[ Line: 265 ]]
                        -- upvalues: l_searchUuid_1 (ref), v88 (copy), v64 (ref), v75 (ref), v87 (copy), l_pageObjectManager_0 (ref), l_avatarEditorService_0 (ref), v82 (ref), v84 (ref), l_FFlagAXHttpCatalogV2SearchItemDetails_0 (ref), v76 (ref), v83 (ref), l_sendAXStat_0 (ref), v16 (ref), v74 (ref)
                        if not l_searchUuid_1 then
                            v90("Must have a searchUuid.");
                        end;
                        if v88 == nil then
                            v64(v75, v87, l_pageObjectManager_0, l_avatarEditorService_0, v89, v90, v82, v84, if l_FFlagAXHttpCatalogV2SearchItemDetails_0 then v76 else nil);
                            if v83 then
                                local v91 = (os.clock() - v83) * 1000;
                                l_sendAXStat_0({
                                    statName = v16.Counter.Latency.Network.ApiFetchCatalogSearch, 
                                    deltaMs = v91
                                });
                                return;
                            end;
                        else
                            v74(v88, v75, v87, l_pageObjectManager_0, v89, v90, v82);
                        end;
                    end);
                end;
            end;
        end)(v77);
    end;
end;