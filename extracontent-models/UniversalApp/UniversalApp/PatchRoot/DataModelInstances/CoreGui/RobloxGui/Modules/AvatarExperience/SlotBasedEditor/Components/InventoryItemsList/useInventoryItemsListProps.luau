local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v6 = require(l_CorePackages_0.Packages.SignalsReact);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_InventoryFilters_0 = v12.Enums.InventoryFilters;
local l_InventoryItemType_0 = v12.Enums.InventoryItemType;
local l_useSlotBasedEditorContext_0 = v12.Context.useSlotBasedEditorContext;
local l_useAvatarEditorStores_0 = v12.Context.useAvatarEditorStores;
local l_useAvatarSaveContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext;
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v21 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetUserInventoryV2);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetUprankedItems);
local v24 = require(l_Modules_0.LuaApp.Constants);
local v25 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendShopForMoreAnalytics);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectOwnedItemIdToIsWearing);
local v28 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v29 = require(l_Modules_0.AvatarExperience.Common.Context.useAdaptiveScrolling);
local v30 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v31 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v32 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters);
local l_FFlagAXAvatarEditorStoresContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit);
local v35 = require(script.Parent.Parent.InventoryItemCard.InventoryItemCardContainer);
local v36 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCardContainer);
local _ = require(script.Parent.InventoryItemsList);
local v38 = require(script.Parent.useInventoryItems);
local v39 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v40 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_CatalogItemCardStatusIconTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v43 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXAddInventoryItemsListProps_0 = v43.FFlagAXAddInventoryItemsListProps;
local l_FIntAXDefaultInventoryPageSize_0 = v43.FIntAXDefaultInventoryPageSize;
local v46 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXUprankBundles);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
local l_FFlagAXInventoryDurablesExpiredFilter_0 = v43.FFlagAXInventoryDurablesExpiredFilter;
local function v52(v50) --[[ Line: 96 ]] --[[ Name: selectCurrentOwnedItemIdToIsWearing ]]
    -- upvalues: v20 (copy), v27 (copy)
    local v51 = v20.selectAssetTypeKey(v50);
    return v27(v50, v51);
end;
local function v54(v53) --[[ Line: 101 ]] --[[ Name: selectAnalyticsMetadata ]]
    return v53.AvatarExperience.AnalyticsMetadata;
end;
return function(v55) --[[ Line: 105 ]] --[[ Name: useInventoryItemsListProps ]]
    -- upvalues: v2 (copy), v7 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v30 (copy), v25 (copy), v19 (copy), l_useAvatarSaveContext_0 (copy), v6 (copy), v29 (copy), l_FFlagAXAvatarEditorStoresContext_0 (copy), l_useAvatarEditorStores_0 (copy), l_useSlotBasedEditorContext_0 (copy), v24 (copy), v31 (copy), l_Signal_0 (copy), l_useSelector_0 (copy), v21 (copy), l_FFlagAXAddInventoryItemsListProps_0 (copy), v52 (copy), v54 (copy), l_PerformFetch_0 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (copy), v38 (copy), l_useSignalState_0 (copy), v46 (copy), v23 (copy), v32 (copy), v22 (copy), l_InventoryFilters_0 (copy), l_InventoryItemType_0 (copy), v40 (copy), v36 (copy), l_FIntAXDefaultInventoryPageSize_0 (copy), v39 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), v35 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v26 (copy), v18 (copy), v28 (copy)
    local v56 = v2.useRef(nil);
    local v57 = v7.useRefCache();
    local v58 = l_useDispatch_0();
    local v59 = l_useNavigation_0();
    local v60 = l_useAvatarRoute_0();
    local v61 = v30(v25);
    local v62 = v30(v19);
    local v63 = l_useAvatarSaveContext_0();
    local v64 = v6.useSignalState(v63.getLastSuccessfullySavedStateSignal);
    local v65 = v29();
    local v66 = not v65 or not v65.scrollingEnabledBinding or v65.scrollingEnabledBinding;
    local v67 = nil;
    local v68 = nil;
    if l_FFlagAXAvatarEditorStoresContext_0 then
        v67 = l_useAvatarEditorStores_0();
    else
        v68 = l_useSlotBasedEditorContext_0();
        assert(v68, "InventoryItemsList must be used within a SlotBasedEditorContextProvider");
    end;
    local l_key_0 = v60.current.key;
    local v70 = v24.ImpressionsEvents.AvatarItems .. if l_key_0 then string.gsub(l_key_0, "[-{}]", "") else "";
    local v72 = v31(function(v71) --[[ Line: 134 ]]
        return v71.getEnableContinuousLoad();
    end);
    local v73 = v2.useMemo(function() --[[ Line: 138 ]]
        -- upvalues: l_Signal_0 (ref)
        return l_Signal_0.new();
    end, {});
    local v74 = l_useSelector_0(v21.getAvatarEditorCategoryInfoFromState);
    local v75 = l_useSelector_0(v21.getAvatarEditorSubcategoryFilterFromState);
    if l_FFlagAXAddInventoryItemsListProps_0 then
        v74 = v55.categoryInfo;
        v75 = v55.subcategoryFilter;
    end;
    local v76 = v75 or v74;
    local v77 = l_useSelector_0(v52);
    local v78 = l_useSelector_0(v54);
    local v80 = v2.useCallback(function(v79) --[[ Line: 153 ]]
        -- upvalues: l_PerformFetch_0 (ref), v76 (copy)
        return l_PerformFetch_0.GetStatus(v79, v76.SearchUuid);
    end, {
        v76.SearchUuid
    });
    local v81 = l_useSelector_0(v80);
    local v82 = if l_FFlagAXAvatarEditorStoresContext_0 then v67.categoryInventoryStores[v76.NavigationKey] else v68.categoryInventoryStores[v76.NavigationKey];
    local v83 = if l_FFlagAXInventoryDurablesExpiredFilter_0 then if l_FFlagAXAvatarEditorStoresContext_0 then v67.sortAndFiltersStore else v68.sortAndFiltersStore else nil;
    local v84 = v38(v82, v76, if l_FFlagAXInventoryDurablesExpiredFilter_0 then v83 else if l_FFlagAXAvatarEditorStoresContext_0 then v67.sortAndFiltersStore else v68.sortAndFiltersStore);
    local v85 = l_useSignalState_0(v82.getHasReachedLastPage);
    local v86 = l_useSignalState_0(v82.getSearchUuid);
    local v88 = v2.useCallback(function(v87) --[[ Line: 180 ]]
        -- upvalues: v73 (copy), v55 (copy), v65 (copy)
        v73:fire();
        if v55 and v55.onContentScroll then
            v55.onContentScroll(v87);
        end;
        if v65 and v65.onCanvasYChanged then
            v65.onCanvasYChanged(v87.CanvasPosition.Y);
        end;
    end, {
        v65, 
        v55
    });
    if v46() then
        v2.useEffect(function() --[[ Line: 194 ]]
            -- upvalues: v58 (copy), v23 (ref), v61 (copy)
            v58(v23(v61));
        end, {
            v64, 
            v58
        });
    end;
    local v89 = nil;
    v89 = if v32() then v2.useCallback(function() --[[ Line: 201 ]]
        -- upvalues: v82 (copy), v58 (copy), v22 (ref), v61 (copy), v76 (copy), l_FFlagAXAddInventoryItemsListProps_0 (ref), v55 (copy), v83 (copy)
        if not v82.getHasReachedLastPage(false) then
            v58(v22(v61, v76, nil, v82, if l_FFlagAXAddInventoryItemsListProps_0 and v55 and v55.disableSortsAndFilters then nil else v83));
        end;
    end, {
        v58, 
        v61, 
        v76, 
        v82, 
        v83
    }) else v2.useCallback(function() --[[ Line: 219 ]]
        -- upvalues: v82 (copy), v58 (copy), v22 (ref), v61 (copy), v76 (copy)
        if not v82.getHasReachedLastPage(false) then
            v58(v22(v61, v76, nil, v82));
        end;
    end, {
        v58, 
        v61, 
        v76, 
        v82
    });
    local v90 = if l_FFlagAXInventoryDurablesExpiredFilter_0 then l_useSignalState_0(v83.getSortAndFilters) else nil;
    local v91 = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v90.filter == l_InventoryFilters_0.Expired else nil;
    local function v99(v92) --[[ Line: 233 ]] --[[ Name: renderItem ]]
        -- upvalues: l_FFlagAXAddInventoryItemsListProps_0 (ref), v55 (copy), v77 (copy), v56 (copy), v57 (copy), v70 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (ref), v91 (copy), l_InventoryItemType_0 (ref), v40 (ref), v2 (ref), v36 (ref), l_FIntAXDefaultInventoryPageSize_0 (ref), v39 (ref), v74 (ref), v75 (ref), l_CatalogItemCardStatusIconTypeEnum_0 (ref), v35 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref)
        if l_FFlagAXAddInventoryItemsListProps_0 and v55 and v55.renderItem then
            return v55.renderItem(v92, {
                ownedItemIdToIsWearing = v77, 
                gridRef = v56, 
                itemDetailsPeekViewRefs = v57, 
                impressionsTag = v70
            });
        elseif l_FFlagAXInventoryDurablesExpiredFilter_0 and v91 and v92.item.itemId then
            local v93 = if v92.gridInformation then {
                gridPositionRow = v92.gridInformation.row, 
                gridPositionColumn = v92.gridInformation.column
            } else nil;
            local v94 = if v92.item.inventoryItemType == l_InventoryItemType_0.Asset then v40.ItemType.Asset else v40.ItemType.Bundle;
            return v2.createElement(v36, {
                itemId = v92.item.itemId, 
                itemType = v94, 
                index = v92.index, 
                analyticsItemCountPerPage = l_FIntAXDefaultInventoryPageSize_0, 
                analyticsContext = v39.AnalyticsContext.AvatarEditorExpiredItem, 
                itemDetailsPeekViewRefs = v57, 
                resultsListRef = v56, 
                gridInformation = v93, 
                impressionsTag = v70, 
                impressionsSchema = "defaultItem", 
                impressionsId = v92.item.itemId, 
                impressionsCategory = v74.Name, 
                impressionsSubcategory = if v75 then v75.Name else nil, 
                isTitleVisible = true, 
                isPriceVisible = true, 
                itemStatusOverride = {
                    type = "icon", 
                    iconType = l_CatalogItemCardStatusIconTypeEnum_0.Durable
                }, 
                isCreatorNameVisible = true, 
                isOrganic = true
            });
        else
            local l_createElement_0 = v2.createElement;
            local l_v35_0 = v35;
            local v97 = {
                inventoryItemType = v92.item.inventoryItemType, 
                itemId = v92.item.itemId
            };
            local v98 = false;
            if v92.item.itemId ~= nil then
                v98 = v77[v92.item.itemId];
            end;
            v97.isSelected = v98;
            v97.resultsListRef = v56;
            v97.itemDetailsPeekViewRefs = v57;
            v97.gridInformation = v92.gridInformation;
            v97.impressionsTag = v70;
            v97.hideName = not v74.ShowName;
            v97.impressionsSchema = "defaultItem";
            v97.availabilityStatus = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v92.item.availabilityStatus else nil;
            return l_createElement_0(l_v35_0, v97);
        end;
    end;
    local v100 = v2.useCallback(function() --[[ Line: 292 ]]
        -- upvalues: v58 (copy), v26 (ref), v62 (copy)
        v58(v26(v62));
    end, {
        v58, 
        v62
    });
    local v101 = v2.useCallback(function() --[[ Line: 296 ]]
        -- upvalues: l_key_0 (copy), v59 (copy)
        return l_key_0 == v59.state.key;
    end, {
        l_key_0, 
        v59.state.key
    });
    local v102 = (if l_FFlagAXAddInventoryItemsListProps_0 then v55 and v55.showRecommendedItems and v74.RecommendationsType and v74.RecommendationsType ~= v18.RecommendationsType.None and v85 else v74.RecommendationsType and v74.RecommendationsType ~= v18.RecommendationsType.None and v85) or false;
    local v103 = not v72 and not v85 and v81 ~= v28.Fetching;
    local v104 = if not (not v72 or v85) and v81 ~= v28.Fetching then v89 else nil;
    local v105 = if l_FFlagAXInventoryDurablesExpiredFilter_0 and v91 and v84 and #v84 > 0 and v84[1].itemId ~= nil then v40.ItemTileType.CatalogItemTile else nil;
    return {
        items = v84, 
        scrollingEnabled = v66, 
        showLoadMoreButton = v103, 
        showRecommendedItems = v102, 
        fetchStatus = v81, 
        impressionsTag = v70, 
        searchUuid = v86, 
        categoryInfo = v74, 
        subcategoryFilter = v75, 
        analyticsMetadata = v78, 
        requestImpressionsSignal = v73, 
        itemDetailsPeekViewRefs = v57, 
        fetchUserInventory = v89, 
        sendShopForMoreAnalytics = v100, 
        onCanvasPositionChanged = v88, 
        renderItem = v99, 
        impressionsPageFilter = v101, 
        onListEndReached = v104, 
        itemTileType = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v105 else nil
    };
end;