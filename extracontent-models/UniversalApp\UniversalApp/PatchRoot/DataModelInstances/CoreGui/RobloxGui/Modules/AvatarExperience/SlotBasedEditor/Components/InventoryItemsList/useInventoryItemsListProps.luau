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
local l_useSlotBasedEditorContext_0 = v12.Context.useSlotBasedEditorContext;
local l_useAvatarEditorStores_0 = v12.Context.useAvatarEditorStores;
local l_useAvatarSaveContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext;
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v19 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetUserInventoryV2);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetUprankedItems);
local v22 = require(l_Modules_0.LuaApp.Constants);
local v23 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendShopForMoreAnalytics);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectOwnedItemIdToIsWearing);
local v26 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v27 = require(l_Modules_0.AvatarExperience.Common.Context.useAdaptiveScrolling);
local v28 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v29 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v30 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters);
local l_FFlagAXAvatarEditorStoresContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit);
local v33 = require(script.Parent.Parent.InventoryItemCard.InventoryItemCardContainer);
local _ = require(script.Parent.InventoryItemsList);
local v35 = require(script.Parent.useInventoryItems);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_FFlagAXAddInventoryItemsListProps_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddInventoryItemsListProps;
local v38 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXUprankBundles);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
local function v43(v41) --[[ Line: 87 ]] --[[ Name: selectCurrentOwnedItemIdToIsWearing ]]
    -- upvalues: v18 (copy), v25 (copy)
    local v42 = v18.selectAssetTypeKey(v41);
    return v25(v41, v42);
end;
local function v45(v44) --[[ Line: 92 ]] --[[ Name: selectAnalyticsMetadata ]]
    return v44.AvatarExperience.AnalyticsMetadata;
end;
return function(v46) --[[ Line: 96 ]] --[[ Name: useInventoryItemsListProps ]]
    -- upvalues: v2 (copy), v7 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v28 (copy), v23 (copy), v17 (copy), l_useAvatarSaveContext_0 (copy), v6 (copy), v27 (copy), l_FFlagAXAvatarEditorStoresContext_0 (copy), l_useAvatarEditorStores_0 (copy), l_useSlotBasedEditorContext_0 (copy), v22 (copy), v29 (copy), l_Signal_0 (copy), l_useSelector_0 (copy), v19 (copy), l_FFlagAXAddInventoryItemsListProps_0 (copy), v43 (copy), v45 (copy), l_PerformFetch_0 (copy), v35 (copy), l_useSignalState_0 (copy), v38 (copy), v21 (copy), v30 (copy), v20 (copy), v33 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v24 (copy), v16 (copy), v26 (copy)
    local v47 = v2.useRef(nil);
    local v48 = v7.useRefCache();
    local v49 = l_useDispatch_0();
    local v50 = l_useNavigation_0();
    local v51 = l_useAvatarRoute_0();
    local v52 = v28(v23);
    local v53 = v28(v17);
    local v54 = l_useAvatarSaveContext_0();
    local v55 = v6.useSignalState(v54.getLastSuccessfullySavedStateSignal);
    local v56 = v27();
    local v57 = not v56 or not v56.scrollingEnabledBinding or v56.scrollingEnabledBinding;
    local v58 = nil;
    local v59 = nil;
    if l_FFlagAXAvatarEditorStoresContext_0 then
        v58 = l_useAvatarEditorStores_0();
    else
        v59 = l_useSlotBasedEditorContext_0();
        assert(v59, "InventoryItemsList must be used within a SlotBasedEditorContextProvider");
    end;
    local l_key_0 = v51.current.key;
    local v61 = v22.ImpressionsEvents.AvatarItems .. if l_key_0 then string.gsub(l_key_0, "[-{}]", "") else "";
    local v63 = v29(function(v62) --[[ Line: 125 ]]
        return v62.getEnableContinuousLoad();
    end);
    local v64 = v2.useMemo(function() --[[ Line: 129 ]]
        -- upvalues: l_Signal_0 (ref)
        return l_Signal_0.new();
    end, {});
    local v65 = l_useSelector_0(v19.getAvatarEditorCategoryInfoFromState);
    local v66 = l_useSelector_0(v19.getAvatarEditorSubcategoryFilterFromState);
    if l_FFlagAXAddInventoryItemsListProps_0 then
        v65 = v46.categoryInfo;
        v66 = v46.subcategoryFilter;
    end;
    local v67 = v66 or v65;
    local v68 = l_useSelector_0(v43);
    local v69 = l_useSelector_0(v45);
    local v71 = v2.useCallback(function(v70) --[[ Line: 144 ]]
        -- upvalues: l_PerformFetch_0 (ref), v67 (copy)
        return l_PerformFetch_0.GetStatus(v70, v67.SearchUuid);
    end, {
        v67.SearchUuid
    });
    local v72 = l_useSelector_0(v71);
    local v73 = if l_FFlagAXAvatarEditorStoresContext_0 then v58.categoryInventoryStores[v67.NavigationKey] else v59.categoryInventoryStores[v67.NavigationKey];
    local v74 = v35(v73, v67, if l_FFlagAXAvatarEditorStoresContext_0 then v58.sortAndFiltersStore else v59.sortAndFiltersStore);
    local v75 = l_useSignalState_0(v73.getHasReachedLastPage);
    local v76 = l_useSignalState_0(v73.getSearchUuid);
    local v78 = v2.useCallback(function(v77) --[[ Line: 162 ]]
        -- upvalues: v64 (copy), v46 (copy), v56 (copy)
        v64:fire();
        if v46 and v46.onContentScroll then
            v46.onContentScroll(v77);
        end;
        if v56 and v56.onCanvasYChanged then
            v56.onCanvasYChanged(v77.CanvasPosition.Y);
        end;
    end, {
        v56, 
        v46
    });
    if v38() then
        v2.useEffect(function() --[[ Line: 176 ]]
            -- upvalues: v49 (copy), v21 (ref), v52 (copy)
            v49(v21(v52));
        end, {
            v55, 
            v49
        });
    end;
    local v79 = nil;
    if v30() then
        local v80 = if l_FFlagAXAvatarEditorStoresContext_0 then v58.sortAndFiltersStore else v59.sortAndFiltersStore;
        local l_v80_0 = v80 --[[ copy: 31 -> 37 ]];
        v79 = v2.useCallback(function() --[[ Line: 186 ]]
            -- upvalues: v73 (copy), v49 (copy), v20 (ref), v52 (copy), v67 (copy), l_FFlagAXAddInventoryItemsListProps_0 (ref), v46 (copy), l_v80_0 (copy)
            if not v73.getHasReachedLastPage(false) then
                v49(v20(v52, v67, nil, v73, if l_FFlagAXAddInventoryItemsListProps_0 and v46 and v46.disableSortsAndFilters then nil else l_v80_0));
            end;
        end, {
            v49, 
            v52, 
            v67, 
            v73, 
            v80
        });
    else
        v79 = v2.useCallback(function() --[[ Line: 204 ]]
            -- upvalues: v73 (copy), v49 (copy), v20 (ref), v52 (copy), v67 (copy)
            if not v73.getHasReachedLastPage(false) then
                v49(v20(v52, v67, nil, v73));
            end;
        end, {
            v49, 
            v52, 
            v67, 
            v73
        });
    end;
    local function v87(v82) --[[ Line: 211 ]] --[[ Name: renderItem ]]
        -- upvalues: l_FFlagAXAddInventoryItemsListProps_0 (ref), v46 (copy), v68 (copy), v47 (copy), v48 (copy), v61 (copy), v2 (ref), v33 (ref), v65 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref)
        if l_FFlagAXAddInventoryItemsListProps_0 and v46 and v46.renderItem then
            return v46.renderItem(v82, {
                ownedItemIdToIsWearing = v68, 
                gridRef = v47, 
                itemDetailsPeekViewRefs = v48, 
                impressionsTag = v61
            });
        else
            local l_createElement_0 = v2.createElement;
            local l_v33_0 = v33;
            local v85 = {
                inventoryItemType = v82.item.inventoryItemType, 
                itemId = v82.item.itemId
            };
            local v86 = false;
            if v82.item.itemId ~= nil then
                v86 = v68[v82.item.itemId];
            end;
            v85.isSelected = v86;
            v85.resultsListRef = v47;
            v85.itemDetailsPeekViewRefs = v48;
            v85.gridInformation = v82.gridInformation;
            v85.impressionsTag = v61;
            v85.hideName = not v65.ShowName;
            v85.impressionsSchema = "defaultItem";
            v85.availabilityStatus = if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v82.item.availabilityStatus else nil;
            return l_createElement_0(l_v33_0, v85);
        end;
    end;
    local v88 = v2.useCallback(function() --[[ Line: 237 ]]
        -- upvalues: v49 (copy), v24 (ref), v53 (copy)
        v49(v24(v53));
    end, {
        v49, 
        v53
    });
    local v89 = v2.useCallback(function() --[[ Line: 241 ]]
        -- upvalues: l_key_0 (copy), v50 (copy)
        return l_key_0 == v50.state.key;
    end, {
        l_key_0, 
        v50.state.key
    });
    local v90 = (if l_FFlagAXAddInventoryItemsListProps_0 then v46 and v46.showRecommendedItems and v65.RecommendationsType and v65.RecommendationsType ~= v16.RecommendationsType.None and v75 else v65.RecommendationsType and v65.RecommendationsType ~= v16.RecommendationsType.None and v75) or false;
    local v91 = not v63 and not v75 and v72 ~= v26.Fetching;
    local v92 = if not (not v63 or v75) and v72 ~= v26.Fetching then v79 else nil;
    return {
        items = v74, 
        scrollingEnabled = v57, 
        showLoadMoreButton = v91, 
        showRecommendedItems = v90, 
        fetchStatus = v72, 
        impressionsTag = v61, 
        searchUuid = v76, 
        categoryInfo = v65, 
        subcategoryFilter = v66, 
        analyticsMetadata = v69, 
        requestImpressionsSignal = v64, 
        itemDetailsPeekViewRefs = v48, 
        fetchUserInventory = v79, 
        sendShopForMoreAnalytics = v88, 
        onCanvasPositionChanged = v78, 
        renderItem = v87, 
        impressionsPageFilter = v89, 
        onListEndReached = v92
    };
end;