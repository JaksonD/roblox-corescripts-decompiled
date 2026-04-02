local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v7 = require(l_CorePackages_0.Packages.Dash);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_InventorySorts_0 = v8.Enums.InventorySorts;
local l_InventoryFilterToAvailabilityStatus_0 = v8.Constants.InventoryFilterToAvailabilityStatus;
local l_AvatarEditorCategories_0 = v8.Enums.AvatarEditorCategories;
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v13 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageFinished);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOutfitOrAsset);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromInventoryFetch);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfit);
local v19 = require(l_Modules_0.AvatarExperience.Common.Thunks.BatchGetOutfits);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v23 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local v26 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfoBatched);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v30 = require(l_Modules_0.LuaApp.mutedError);
local v31 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXInventoryV2CombineGetOutfitDispatches);
local l_FIntAXDefaultInventoryPageSize_0 = v12.FIntAXDefaultInventoryPageSize;
local v33 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRemoveAwaitUsageInThunks);
local v34 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList);
local v35 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters);
local l_FFlagAXEditorSubcategoryFilters_0 = v12.FFlagAXEditorSubcategoryFilters;
local l_FFlagAXPhotoboothIsStandalone_0 = v12.FFlagAXPhotoboothIsStandalone;
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = v12.FFlagAXEnableModeratedItemsFlowForDurables;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXInventoryDurablesSupport_0 = v12.FFlagAXInventoryDurablesSupport;
local l_FFlagAXFixStaleModerationStatusFromGrant_0 = v12.FFlagAXFixStaleModerationStatusFromGrant;
local l_FFlagAXInventoryDurablesExpiredFilter_0 = v12.FFlagAXInventoryDurablesExpiredFilter;
local function v52(v44, v45, v46) --[[ Line: 77 ]] --[[ Name: checkAndSendDuplicateItemCount ]]
    -- upvalues: v7 (copy), l_sendAXCounterV2_0 (copy), v23 (copy)
    local v47 = v44.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[v45];
    if not v47 or #v47 == 0 then
        return;
    else
        local v49 = v7.keyBy(v47, function(v48) --[[ Line: 86 ]]
            return v48;
        end);
        for _, v51 in v46 do
            if v49[v51] then
                l_sendAXCounterV2_0(v23.Counter.AvatarInventory.ReceivedDuplicateItem);
            else
                v49[v51] = v51;
            end;
        end;
        return;
    end;
end;
local function v63(v53) --[[ Line: 98 ]] --[[ Name: getRequestItemCategoriesFromInfo ]]
    -- upvalues: v34 (copy), l_AvatarEditorCategories_0 (copy), v22 (copy), v23 (copy)
    local v54 = {};
    if v34() and v53.NavigationKey == l_AvatarEditorCategories_0.All then
        return {};
    else
        if v53.AssetTypeIdStrings then
            for _, v56 in v53.AssetTypeIdStrings do
                table.insert(v54, {
                    itemType = string.lower(v22.OutfitOrAsset.Asset or "asset"), 
                    itemSubType = tonumber(v56)
                });
            end;
        end;
        if v34() then
            if v53.BundleTypeIdStrings then
                for _, v58 in v53.BundleTypeIdStrings do
                    local v59 = v23.BundleTypeIdStringsForBackend[v58];
                    if v59 then
                        table.insert(v54, {
                            itemType = string.lower(v22.OutfitOrAsset.Outfit or "outfit"), 
                            itemSubType = tonumber(v59)
                        });
                    end;
                end;
                return v54;
            end;
        elseif v53.OutfitTypeIdStrings then
            for _, v61 in v53.OutfitTypeIdStrings do
                local v62 = v23.BundleTypeIdStringsForBackend[v61];
                if v62 then
                    table.insert(v54, {
                        itemType = string.lower(v22.OutfitOrAsset.Outfit or "outfit"), 
                        itemSubType = tonumber(v62)
                    });
                end;
            end;
        end;
        return v54;
    end;
end;
local function _(v64) --[[ Line: 153 ]] --[[ Name: getNextPageCursor ]]
    -- upvalues: l_MemStorageService_0 (copy)
    if not v64 then
        return nil;
    else
        return l_MemStorageService_0:GetItem(v64);
    end;
end;
local function _(v66, v67) --[[ Line: 160 ]] --[[ Name: assetExists ]]
    local v68 = v66.AvatarExperience.Common.AssetInfos[v67];
    if v68 and v68.receivedFromInventoryFetch then
        return true;
    else
        return false;
    end;
end;
local function _(v70, v71) --[[ Line: 168 ]] --[[ Name: outfitExists ]]
    return v70.AvatarExperience.AvatarEditor.OutfitInfos[v71] ~= nil;
end;
local v73 = {
    PendingReview = Enum.ModerationStatus.NotReviewed, 
    Unavailable = Enum.ModerationStatus.ReviewedRejected
};
local v81 = l_FFlagAXInventoryDurablesExpiredFilter_0 and function(v74, v75, v76) --[[ Line: 180 ]]
    -- upvalues: v23 (copy), v26 (copy)
    local v77 = {};
    for _, v79 in v76 do
        local v80 = nil;
        if v79.itemCategory.itemType == Enum.AvatarItemType.Asset.Value then
            v80 = v23.ItemType.Asset;
        elseif v79.itemCategory.itemType == Enum.AvatarItemType.Bundle.Value then
            v80 = v23.ItemType.Bundle;
        end;
        if v80 then
            table.insert(v77, {
                id = tostring(v79.itemId), 
                itemType = v80
            });
        end;
    end;
    if #v77 > 0 then
        v75:dispatch(v26(v74, nil, v77, true));
    end;
end or nil;
local function v102(v82) --[[ Line: 205 ]]
    -- upvalues: v34 (copy), l_FFlagAXPhotoboothIsStandalone_0 (copy), l_FFlagAXFixStaleModerationStatusFromGrant_0 (copy), v13 (copy), v73 (copy), v23 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v31 (copy), v18 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v17 (copy), v52 (copy), v19 (copy), v16 (copy), v22 (copy), v14 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (copy), v81 (copy), l_MemStorageService_0 (copy), v15 (copy)
    if (v34() or l_FFlagAXPhotoboothIsStandalone_0) and v82.categoryInventoryStore then
        v82.categoryInventoryStore.addResultsPage(v82.results);
    end;
    local l_store_0 = v82.store;
    local l_searchUuid_0 = v82.searchUuid;
    local l_results_0 = v82.results;
    local l_resolve_0 = v82.resolve;
    local v87 = l_store_0:getState();
    local v88 = l_results_0.avatarInventoryItems or {};
    local v89 = {};
    local v90 = {};
    local v91 = {};
    local v92 = {};
    for _, v94 in v88 do
        local v95 = tostring(v94.itemId);
        local l_itemCategory_0 = v94.itemCategory;
        v91[#v91 + 1] = v95;
        if l_itemCategory_0.itemType == Enum.AvatarItemType.Asset.Value then
            local v97 = v87.AvatarExperience.Common.AssetInfos[v95];
            if not (v97 and v97.receivedFromInventoryFetch and true or false) then
                local v98 = nil;
                v97 = nil;
                local l_availabilityStatus_0 = v94.availabilityStatus;
                if l_availabilityStatus_0 then
                    v98 = if l_FFlagAXFixStaleModerationStatusFromGrant_0 then v13.getModerationStatusFromAvailabilityStatus(l_availabilityStatus_0) else v73[l_availabilityStatus_0];
                end;
                if v94.creatingUniverseId then
                    v97 = tostring(v94.creatingUniverseId);
                end;
                v89[#v89 + 1] = {
                    assetId = v94.itemId, 
                    name = v94.itemName, 
                    assetType = v23.AssetTypeIdStringToName[tostring(l_itemCategory_0.itemSubType)], 
                    moderationStatus = v98, 
                    creatingUniverseId = v97, 
                    expirationTime = if l_FFlagAXInventoryDurablesSupport_0 then v94.expirationTime else nil
                };
            end;
        elseif l_itemCategory_0.itemType == Enum.AvatarItemType.Bundle.Value then
            v90[#v90 + 1] = v95;
            if not (v87.AvatarExperience.AvatarEditor.OutfitInfos[v95] ~= nil) then
                if v31 then
                    table.insert(v92, v95);
                else
                    l_store_0:dispatch(v18(v95, nil, nil, if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v82.networkImpl else nil));
                end;
            end;
        end;
    end;
    if #v89 > 0 then
        l_store_0:dispatch(v17(v89));
    end;
    v52(v87, l_searchUuid_0, v91);
    if v31 then
        l_store_0:dispatch(v19(v92, if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v82.networkImpl else nil));
    end;
    l_store_0:dispatch(v16(v90, v22.OutfitOrAsset.Outfit));
    l_store_0:dispatch(v14(l_searchUuid_0, v91));
    if l_FFlagAXInventoryDurablesExpiredFilter_0 and v82.shouldFetchItemDetails then
        v81(v82.networkImpl, l_store_0, v88);
    end;
    local v100 = nil;
    if l_results_0 then
        local l_nextPageToken_0 = l_results_0.nextPageToken;
        if l_nextPageToken_0 and l_nextPageToken_0 ~= "" then
            l_MemStorageService_0:SetItem(l_searchUuid_0, l_nextPageToken_0);
        else
            l_store_0:dispatch(v15(l_searchUuid_0, true));
            l_MemStorageService_0:SetItem(l_searchUuid_0, v22.ReachedLastPage);
            v100 = v22.ReachedLastPage;
        end;
    end;
    l_resolve_0(v100);
end;
local function v115(v103) --[[ Line: 332 ]] --[[ Name: fetchItems ]]
    -- upvalues: l_FIntAXDefaultInventoryPageSize_0 (copy), v35 (copy), l_InventorySorts_0 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (copy), l_InventoryFilterToAvailabilityStatus_0 (copy), v33 (copy), v25 (copy), v63 (copy), v102 (copy), v34 (copy), l_FFlagAXPhotoboothIsStandalone_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
    local l_l_FIntAXDefaultInventoryPageSize_0_0 = l_FIntAXDefaultInventoryPageSize_0;
    local v105 = if v35() and v103.sortAndFiltersStore then v103.sortAndFiltersStore.getSortAndFilters(false) else nil;
    local v106 = v35() and v105 and v105.sort == l_InventorySorts_0.RecentlyWorn and "recentEquipped" or "recentAdded";
    local v107 = nil;
    local v108 = nil;
    if l_FFlagAXInventoryDurablesExpiredFilter_0 and v35() and v105 then
        v108 = l_InventoryFilterToAvailabilityStatus_0[v105.filter];
        v107 = v108 ~= nil;
    end;
    if v33() then
        return v25.GetUserAvatarInventory(v103.networkImpl, v63(v103.categoryInfo), v106, l_l_FIntAXDefaultInventoryPageSize_0_0, v103.nextPageCursor, if l_FFlagAXInventoryDurablesExpiredFilter_0 then v108 else nil):andThen(function(v109) --[[ Line: 369 ]]
            -- upvalues: v102 (ref), v103 (copy), v34 (ref), l_FFlagAXPhotoboothIsStandalone_0 (ref), l_FFlagAXInventoryDurablesExpiredFilter_0 (ref), v107 (ref)
            local l_responseBody_0 = v109.responseBody;
            v102({
                networkImpl = v103.networkImpl, 
                results = l_responseBody_0, 
                searchUuid = v103.searchUuid, 
                store = v103.store, 
                resolve = v103.resolve, 
                categoryInventoryStore = if not not v34() or l_FFlagAXPhotoboothIsStandalone_0 then v103.categoryInventoryStore else nil, 
                shouldFetchItemDetails = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v107 else nil
            });
        end):catch(function(v111) --[[ Line: 386 ]]
            -- upvalues: v103 (copy)
            warn("GetUserInventoryV2 failure: ", v111);
            return v103.reject();
        end);
    else
        local v112, v113 = v25.GetUserAvatarInventory(v103.networkImpl, v63(v103.categoryInfo), v106, l_l_FIntAXDefaultInventoryPageSize_0_0, v103.nextPageCursor, if l_FFlagAXInventoryDurablesExpiredFilter_0 then v108 else nil):await();
        if not v112 then
            warn("GetUserInventoryV2 failure: ", v113);
            return v103.reject(if l_FFlagAXRootSlotBasedEditorFlag_0 then v113 else nil);
        else
            local l_responseBody_1 = v113.responseBody;
            v102({
                networkImpl = v103.networkImpl, 
                results = l_responseBody_1, 
                searchUuid = v103.searchUuid, 
                store = v103.store, 
                resolve = v103.resolve, 
                categoryInventoryStore = if not not v34() or l_FFlagAXPhotoboothIsStandalone_0 then v103.categoryInventoryStore else nil, 
                shouldFetchItemDetails = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v107 else nil
            });
            return;
        end;
    end;
end;
return function(v116, v117, _, v119, v120) --[[ Line: 422 ]]
    -- upvalues: v6 (copy), v24 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy), v4 (copy), l_PerformFetch_0 (copy), v34 (copy), v22 (copy), l_MemStorageService_0 (copy), v115 (copy), l_FFlagAXPhotoboothIsStandalone_0 (copy), v35 (copy), v30 (copy)
    v6.isType(v117, "table", "GetUserInventoryV2 thunk expects categoryInfo to be a table");
    return function(v121) --[[ Line: 430 ]]
        -- upvalues: v24 (ref), v117 (copy), l_FFlagAXEditorSubcategoryFilters_0 (ref), v4 (ref), l_PerformFetch_0 (ref), v34 (ref), v119 (copy), v22 (ref), l_MemStorageService_0 (ref), v115 (ref), v116 (copy), l_FFlagAXPhotoboothIsStandalone_0 (ref), v35 (ref), v120 (copy), v30 (ref)
        local v122 = v121:getState();
        local v123 = v24.getSearchUuidAndAssetTypes(v117, v122.AvatarExperience.AvatarEditor.Categories.subButton, if l_FFlagAXEditorSubcategoryFilters_0 then v122.AvatarExperience.AvatarEditor.Categories.subcategoryFilter else nil);
        if not v123 then
            return v4.resolve("No SearchUuid");
        else
            return l_PerformFetch_0.Single(v123, function() --[[ Line: 448 ]]
                -- upvalues: v34 (ref), v119 (ref), v4 (ref), v22 (ref), v123 (copy), l_MemStorageService_0 (ref), v115 (ref), v116 (ref), v117 (ref), v121 (copy), l_FFlagAXPhotoboothIsStandalone_0 (ref), v35 (ref), v120 (ref)
                local v124 = nil;
                if v34() and v119 then
                    v124 = v119.nextPageCursor;
                    if v119.getHasReachedLastPage(false) then
                        return v4.resolve(v22.ReachedLastPage);
                    end;
                else
                    local l_v123_0 = v123;
                    v124 = if not l_v123_0 then nil else l_MemStorageService_0:GetItem(l_v123_0);
                    if v124 == v22.ReachedLastPage then
                        return v4.resolve(v22.ReachedLastPage);
                    end;
                end;
                return v4.new(function(v126, v127) --[[ Line: 461 ]]
                    -- upvalues: v115 (ref), v116 (ref), v123 (ref), v117 (ref), v121 (ref), v124 (ref), v34 (ref), l_FFlagAXPhotoboothIsStandalone_0 (ref), v119 (ref), v35 (ref), v120 (ref)
                    v115({
                        networkImpl = v116, 
                        searchUuid = v123, 
                        categoryInfo = v117, 
                        store = v121, 
                        resolve = v126, 
                        reject = v127, 
                        nextPageCursor = v124, 
                        categoryInventoryStore = if not not v34() or l_FFlagAXPhotoboothIsStandalone_0 then v119 else nil, 
                        sortAndFiltersStore = if v35() then v120 else nil
                    });
                end);
            end)(v121):catch(function(v128) --[[ Line: 479 ]]
                -- upvalues: v30 (ref)
                v30("GetUserInventoryV2 fetch failed: ", v128);
            end);
        end;
    end;
end;