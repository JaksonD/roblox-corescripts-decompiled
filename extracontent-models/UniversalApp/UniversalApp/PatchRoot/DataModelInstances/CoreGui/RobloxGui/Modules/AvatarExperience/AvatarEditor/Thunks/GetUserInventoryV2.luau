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
local l_AvatarEditorCategories_0 = v8.Enums.AvatarEditorCategories;
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageFinished);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOutfitOrAsset);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromInventoryFetch);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfit);
local v18 = require(l_Modules_0.AvatarExperience.Common.Thunks.BatchGetOutfits);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v22 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v28 = require(l_Modules_0.LuaApp.mutedError);
local v29 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXInventoryV2CombineGetOutfitDispatches);
local v30 = game:DefineFastInt("AXDefaultInventoryPageSize", 25);
local v31 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRemoveAwaitUsageInThunks);
local v32 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList);
local v33 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters);
local l_FFlagAXEditorSubcategoryFilters_0 = v11.FFlagAXEditorSubcategoryFilters;
local l_FFlagAXPhotoboothIsStandalone_0 = v11.FFlagAXPhotoboothIsStandalone;
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = v11.FFlagAXEnableModeratedItemsFlowForDurables;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXInventoryDurablesSupport_0 = v11.FFlagAXInventoryDurablesSupport;
local l_FFlagAXFixStaleModerationStatusFromGrant_0 = v11.FFlagAXFixStaleModerationStatusFromGrant;
local function v49(v41, v42, v43) --[[ Line: 72 ]] --[[ Name: checkAndSendDuplicateItemCount ]]
    -- upvalues: v7 (copy), l_sendAXCounterV2_0 (copy), v22 (copy)
    local v44 = v41.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[v42];
    if not v44 or #v44 == 0 then
        return;
    else
        local v46 = v7.keyBy(v44, function(v45) --[[ Line: 81 ]]
            return v45;
        end);
        for _, v48 in v43 do
            if v46[v48] then
                l_sendAXCounterV2_0(v22.Counter.AvatarInventory.ReceivedDuplicateItem);
            else
                v46[v48] = v48;
            end;
        end;
        return;
    end;
end;
local function v60(v50) --[[ Line: 93 ]] --[[ Name: getRequestItemCategoriesFromInfo ]]
    -- upvalues: v32 (copy), l_AvatarEditorCategories_0 (copy), v21 (copy), v22 (copy)
    local v51 = {};
    if v32() and v50.NavigationKey == l_AvatarEditorCategories_0.All then
        return {};
    else
        if v50.AssetTypeIdStrings then
            for _, v53 in v50.AssetTypeIdStrings do
                table.insert(v51, {
                    itemType = string.lower(v21.OutfitOrAsset.Asset or "asset"), 
                    itemSubType = tonumber(v53)
                });
            end;
        end;
        if v32() then
            if v50.BundleTypeIdStrings then
                for _, v55 in v50.BundleTypeIdStrings do
                    local v56 = v22.BundleTypeIdStringsForBackend[v55];
                    if v56 then
                        table.insert(v51, {
                            itemType = string.lower(v21.OutfitOrAsset.Outfit or "outfit"), 
                            itemSubType = tonumber(v56)
                        });
                    end;
                end;
                return v51;
            end;
        elseif v50.OutfitTypeIdStrings then
            for _, v58 in v50.OutfitTypeIdStrings do
                local v59 = v22.BundleTypeIdStringsForBackend[v58];
                if v59 then
                    table.insert(v51, {
                        itemType = string.lower(v21.OutfitOrAsset.Outfit or "outfit"), 
                        itemSubType = tonumber(v59)
                    });
                end;
            end;
        end;
        return v51;
    end;
end;
local function _(v61) --[[ Line: 148 ]] --[[ Name: getNextPageCursor ]]
    -- upvalues: l_MemStorageService_0 (copy)
    if not v61 then
        return nil;
    else
        return l_MemStorageService_0:GetItem(v61);
    end;
end;
local function _(v63, v64) --[[ Line: 155 ]] --[[ Name: assetExists ]]
    local v65 = v63.AvatarExperience.Common.AssetInfos[v64];
    if v65 and v65.receivedFromInventoryFetch then
        return true;
    else
        return false;
    end;
end;
local function _(v67, v68) --[[ Line: 163 ]] --[[ Name: outfitExists ]]
    return v67.AvatarExperience.AvatarEditor.OutfitInfos[v68] ~= nil;
end;
local v70 = {
    PendingReview = Enum.ModerationStatus.NotReviewed, 
    Unavailable = Enum.ModerationStatus.ReviewedRejected
};
local function v91(v71) --[[ Line: 172 ]]
    -- upvalues: v32 (copy), l_FFlagAXPhotoboothIsStandalone_0 (copy), l_FFlagAXFixStaleModerationStatusFromGrant_0 (copy), v12 (copy), v70 (copy), v22 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v29 (copy), v17 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v16 (copy), v49 (copy), v18 (copy), v15 (copy), v21 (copy), v13 (copy), l_MemStorageService_0 (copy), v14 (copy)
    if (v32() or l_FFlagAXPhotoboothIsStandalone_0) and v71.categoryInventoryStore then
        v71.categoryInventoryStore.addResultsPage(v71.results);
    end;
    local l_store_0 = v71.store;
    local l_searchUuid_0 = v71.searchUuid;
    local l_results_0 = v71.results;
    local l_resolve_0 = v71.resolve;
    local v76 = l_store_0:getState();
    local v77 = l_results_0.avatarInventoryItems or {};
    local v78 = {};
    local v79 = {};
    local v80 = {};
    local v81 = {};
    for _, v83 in v77 do
        local v84 = tostring(v83.itemId);
        local l_itemCategory_0 = v83.itemCategory;
        v80[#v80 + 1] = v84;
        if l_itemCategory_0.itemType == Enum.AvatarItemType.Asset.Value then
            local v86 = v76.AvatarExperience.Common.AssetInfos[v84];
            if not (v86 and v86.receivedFromInventoryFetch and true or false) then
                local v87 = nil;
                v86 = nil;
                local l_availabilityStatus_0 = v83.availabilityStatus;
                if l_availabilityStatus_0 then
                    v87 = if l_FFlagAXFixStaleModerationStatusFromGrant_0 then v12.getModerationStatusFromAvailabilityStatus(l_availabilityStatus_0) else v70[l_availabilityStatus_0];
                end;
                if v83.creatingUniverseId then
                    v86 = tostring(v83.creatingUniverseId);
                end;
                v78[#v78 + 1] = {
                    assetId = v83.itemId, 
                    name = v83.itemName, 
                    assetType = v22.AssetTypeIdStringToName[tostring(l_itemCategory_0.itemSubType)], 
                    moderationStatus = v87, 
                    creatingUniverseId = v86, 
                    expirationTime = if l_FFlagAXInventoryDurablesSupport_0 then v83.expirationTime else nil
                };
            end;
        elseif l_itemCategory_0.itemType == Enum.AvatarItemType.Bundle.Value then
            v79[#v79 + 1] = v84;
            if not (v76.AvatarExperience.AvatarEditor.OutfitInfos[v84] ~= nil) then
                if v29 then
                    table.insert(v81, v84);
                else
                    l_store_0:dispatch((v17(v84, nil, nil, if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v71.networkImpl else nil)));
                end;
            end;
        end;
    end;
    if #v78 > 0 then
        l_store_0:dispatch(v16(v78));
    end;
    v49(v76, l_searchUuid_0, v80);
    if v29 then
        l_store_0:dispatch(v18(v81, if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v71.networkImpl else nil));
    end;
    l_store_0:dispatch(v15(v79, v21.OutfitOrAsset.Outfit));
    l_store_0:dispatch(v13(l_searchUuid_0, v80));
    local v89 = nil;
    if l_results_0 then
        local l_nextPageToken_0 = l_results_0.nextPageToken;
        if l_nextPageToken_0 and l_nextPageToken_0 ~= "" then
            l_MemStorageService_0:SetItem(l_searchUuid_0, l_nextPageToken_0);
        else
            l_store_0:dispatch(v14(l_searchUuid_0, true));
            l_MemStorageService_0:SetItem(l_searchUuid_0, v21.ReachedLastPage);
            v89 = v21.ReachedLastPage;
        end;
    end;
    l_resolve_0(v89);
end;
local function v102(v92) --[[ Line: 293 ]] --[[ Name: fetchItems ]]
    -- upvalues: v30 (copy), v33 (copy), l_InventorySorts_0 (copy), v31 (copy), v24 (copy), v60 (copy), v91 (copy), v32 (copy), l_FFlagAXPhotoboothIsStandalone_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
    local l_v30_0 = v30;
    local v94 = if v33() and v92.sortAndFiltersStore then v92.sortAndFiltersStore.getSortAndFilters(false) else nil;
    local v95 = v33() and v94 and v94.sort == l_InventorySorts_0.RecentlyWorn and "recentEquipped" or "recentAdded";
    if v31() then
        return v24.GetUserAvatarInventory(v92.networkImpl, v60(v92.categoryInfo), v95, l_v30_0, v92.nextPageCursor):andThen(function(v96) --[[ Line: 322 ]]
            -- upvalues: v91 (ref), v92 (copy), v32 (ref), l_FFlagAXPhotoboothIsStandalone_0 (ref)
            local l_responseBody_0 = v96.responseBody;
            v91({
                networkImpl = v92.networkImpl, 
                results = l_responseBody_0, 
                searchUuid = v92.searchUuid, 
                store = v92.store, 
                resolve = v92.resolve, 
                categoryInventoryStore = if not not v32() or l_FFlagAXPhotoboothIsStandalone_0 then v92.categoryInventoryStore else nil
            });
        end):catch(function(v98) --[[ Line: 336 ]]
            -- upvalues: v92 (copy)
            warn("GetUserInventoryV2 failure: ", v98);
            return v92.reject();
        end);
    else
        local v99, v100 = v24.GetUserAvatarInventory(v92.networkImpl, v60(v92.categoryInfo), v95, l_v30_0, v92.nextPageCursor):await();
        if not v99 then
            warn("GetUserInventoryV2 failure: ", v100);
            return v92.reject(if l_FFlagAXRootSlotBasedEditorFlag_0 then v100 else nil);
        else
            local l_responseBody_1 = v100.responseBody;
            v91({
                networkImpl = v92.networkImpl, 
                results = l_responseBody_1, 
                searchUuid = v92.searchUuid, 
                store = v92.store, 
                resolve = v92.resolve, 
                categoryInventoryStore = if not not v32() or l_FFlagAXPhotoboothIsStandalone_0 then v92.categoryInventoryStore else nil
            });
            return;
        end;
    end;
end;
return function(v103, v104, _, v106, v107) --[[ Line: 370 ]]
    -- upvalues: v6 (copy), v23 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy), v4 (copy), l_PerformFetch_0 (copy), v32 (copy), v21 (copy), l_MemStorageService_0 (copy), v102 (copy), l_FFlagAXPhotoboothIsStandalone_0 (copy), v33 (copy), v28 (copy)
    v6.isType(v104, "table", "GetUserInventoryV2 thunk expects categoryInfo to be a table");
    return function(v108) --[[ Line: 378 ]]
        -- upvalues: v23 (ref), v104 (copy), l_FFlagAXEditorSubcategoryFilters_0 (ref), v4 (ref), l_PerformFetch_0 (ref), v32 (ref), v106 (copy), v21 (ref), l_MemStorageService_0 (ref), v102 (ref), v103 (copy), l_FFlagAXPhotoboothIsStandalone_0 (ref), v33 (ref), v107 (copy), v28 (ref)
        local v109 = v108:getState();
        local v110 = v23.getSearchUuidAndAssetTypes(v104, v109.AvatarExperience.AvatarEditor.Categories.subButton, if l_FFlagAXEditorSubcategoryFilters_0 then v109.AvatarExperience.AvatarEditor.Categories.subcategoryFilter else nil);
        if not v110 then
            return v4.resolve("No SearchUuid");
        else
            return l_PerformFetch_0.Single(v110, function() --[[ Line: 396 ]]
                -- upvalues: v32 (ref), v106 (ref), v4 (ref), v21 (ref), v110 (copy), l_MemStorageService_0 (ref), v102 (ref), v103 (ref), v104 (ref), v108 (copy), l_FFlagAXPhotoboothIsStandalone_0 (ref), v33 (ref), v107 (ref)
                local v111 = nil;
                if v32() and v106 then
                    v111 = v106.nextPageCursor;
                    if v106.getHasReachedLastPage(false) then
                        return v4.resolve(v21.ReachedLastPage);
                    end;
                else
                    local l_v110_0 = v110;
                    v111 = if not l_v110_0 then nil else l_MemStorageService_0:GetItem(l_v110_0);
                    if v111 == v21.ReachedLastPage then
                        return v4.resolve(v21.ReachedLastPage);
                    end;
                end;
                return v4.new(function(v113, v114) --[[ Line: 409 ]]
                    -- upvalues: v102 (ref), v103 (ref), v110 (ref), v104 (ref), v108 (ref), v111 (ref), v32 (ref), l_FFlagAXPhotoboothIsStandalone_0 (ref), v106 (ref), v33 (ref), v107 (ref)
                    v102({
                        networkImpl = v103, 
                        searchUuid = v110, 
                        categoryInfo = v104, 
                        store = v108, 
                        resolve = v113, 
                        reject = v114, 
                        nextPageCursor = v111, 
                        categoryInventoryStore = if not not v32() or l_FFlagAXPhotoboothIsStandalone_0 then v106 else nil, 
                        sortAndFiltersStore = if v33() then v107 else nil
                    });
                end);
            end)(v108):catch(function(v115) --[[ Line: 427 ]]
                -- upvalues: v28 (ref)
                v28("GetUserInventoryV2 fetch failed: ", v115);
            end);
        end;
    end;
end;