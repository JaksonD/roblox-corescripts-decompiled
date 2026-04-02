local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_GridMetrics_0 = require(l_CorePackages_0.Packages.UIBlox).App.Grid.GridMetrics;
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v9 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_getUseSelectorDeepEquals_0 = v11.Utils.getUseSelectorDeepEquals;
local v13 = require(l_Modules_0.AvatarExperience.Flags.FFlagAEGetEditableOutfitsType);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
local l_useSlotBasedEditorContext_0 = v7.Context.useSlotBasedEditorContext;
local l_useAvatarEditorStores_0 = v7.Context.useAvatarEditorStores;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useAvatarRoute_0 = v8.AvatarRoute.Hooks.useAvatarRoute;
local v22 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_useNetworking_0 = v11.Hooks.useNetworking;
local l_Signal_0 = v9.Signal;
local v25 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v26 = require(l_Modules_0.LuaApp.Constants);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v28 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v29 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v30 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v31 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v32 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfits);
local v33 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetUserInventoryV2);
local l_FFlagAXAvatarEditorStoresContext_0 = v6.FFlagAXAvatarEditorStoresContext;
local l_FFlagAXInventoryDurablesSupport_0 = v6.FFlagAXInventoryDurablesSupport;
local l_FFlagAXFixEmptyMakeupLooks_0 = v6.FFlagAXFixEmptyMakeupLooks;
local function v38(v37) --[[ Line: 48 ]] --[[ Name: selectPageFinished ]]
    return v37.AvatarExperience.AvatarEditor.PageFinished;
end;
local function v40(v39) --[[ Line: 52 ]] --[[ Name: selectScreenSize ]]
    return v39.ScreenSize;
end;
local function v42(v41) --[[ Line: 56 ]] --[[ Name: selectAnalyticsMetadata ]]
    return v41.AvatarExperience.AnalyticsMetadata;
end;
local function v44(v43) --[[ Line: 86 ]] --[[ Name: shouldRenderSettingsTile ]]
    return v43 == "OUTFIT_SWITCHER_SETTINGS_TILE";
end;
return function(v45) --[[ Line: 99 ]] --[[ Name: useOutfitSwitcherFrameProps ]]
    -- upvalues: v2 (copy), v28 (copy), v27 (copy), l_PerformFetch_0 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v4 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_useSelector_0 (copy), v31 (copy), l_FFlagAXAvatarEditorStoresContext_0 (copy), l_useAvatarEditorStores_0 (copy), l_useSlotBasedEditorContext_0 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), l_useNetworking_0 (copy), v22 (copy), v40 (copy), l_getUseSelectorDeepEquals_0 (copy), v38 (copy), v30 (copy), v25 (copy), v29 (copy), l_GridMetrics_0 (copy), v32 (copy), v13 (copy), v33 (copy), v42 (copy), v26 (copy), l_Signal_0 (copy), v44 (copy), l_FFlagAXFixEmptyMakeupLooks_0 (copy)
    local v62 = v2.useCallback(function(v46) --[[ Line: 100 ]]
        -- upvalues: v45 (copy), v28 (ref), v27 (ref)
        local l_OutfitInfos_0 = v46.AvatarExperience.AvatarEditor.OutfitInfos;
        local l_EquippedAssets_0 = v46.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local l_AvatarType_0 = v46.AvatarExperience.AvatarEditor.Character.AvatarType;
        local l_BodyColor3s_0 = v46.AvatarExperience.AvatarEditor.Character.BodyColor3s;
        local l_AvatarScales_0 = v46.AvatarExperience.AvatarEditor.Character.AvatarScales;
        local l_OwnedItemIdsBySubtype_0 = v46.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
        local v53 = {};
        local v54 = false;
        local v55 = {};
        if l_OwnedItemIdsBySubtype_0 then
            local v56 = l_OwnedItemIdsBySubtype_0[v45.outfitKey] or {};
            v55 = table.clone(v56);
        end;
        local v57 = {};
        for _, v59 in v55 do
            local v60 = l_OutfitInfos_0[v59];
            if v60 then
                if v45.outfitType == v28.OutfitTypes.Makeup and v60.outfitType == v28.OutfitTypes.Makeup then
                    table.insert(v57, v59);
                end;
                local v61 = v27.isWearingOutfitNoState(v60, l_AvatarType_0, l_BodyColor3s_0, l_EquippedAssets_0, l_AvatarScales_0);
                v53[v59] = v61;
                if v61 then
                    v54 = true;
                end;
            end;
        end;
        return {
            ownedItemIds = if v45.outfitType == v28.OutfitTypes.Makeup then v57 else v55, 
            itemIdsToIsWearing = v53, 
            hasItemEquipped = v54
        };
    end, {
        v45.outfitKey
    });
    local v64 = v2.useCallback(function(v63) --[[ Line: 146 ]]
        -- upvalues: l_PerformFetch_0 (ref), v45 (copy)
        return l_PerformFetch_0.GetStatus(v63, v45.outfitKey);
    end, {
        v45.outfitKey
    });
    local v65 = l_useDispatch_0();
    local v66 = l_useNavigation_0();
    local v67 = l_useAvatarRoute_0();
    local v68 = v4.Hooks.useTokens();
    local v69 = if l_FFlagAXInventoryDurablesSupport_0 then l_useSelector_0(v31.getAvatarEditorCategoryInfoFromState) else nil;
    local v70 = nil;
    local v71 = nil;
    if l_FFlagAXInventoryDurablesSupport_0 then
        if l_FFlagAXAvatarEditorStoresContext_0 then
            v70 = l_useAvatarEditorStores_0();
        else
            v71 = l_useSlotBasedEditorContext_0();
        end;
    end;
    local v72 = if l_FFlagAXInventoryDurablesSupport_0 and v69 then if l_FFlagAXAvatarEditorStoresContext_0 then v70.categoryInventoryStores[v69.NavigationKey] else v71.categoryInventoryStores[v69.NavigationKey] else nil;
    local v73 = nil;
    if l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then
        v73 = l_useNetworking_0();
    end;
    local v75 = v22(function(v74) --[[ Line: 178 ]]
        return v74.getEnableContinuousLoad();
    end);
    local v76 = l_useSelector_0(v40, l_getUseSelectorDeepEquals_0());
    local v77 = l_useSelector_0(v38, l_getUseSelectorDeepEquals_0());
    local v79 = l_useSelector_0(function(v78) --[[ Line: 184 ]]
        -- upvalues: v30 (ref), v67 (copy)
        return v30(v78, v67.opaque.name);
    end, l_getUseSelectorDeepEquals_0());
    local v80 = l_useSelector_0(v62, l_getUseSelectorDeepEquals_0());
    local v81 = l_useSelector_0(v64, l_getUseSelectorDeepEquals_0());
    local l_itemIdsToIsWearing_0 = v80.itemIdsToIsWearing;
    local l_hasItemEquipped_0 = v80.hasItemEquipped;
    local v84 = not v77[v45.outfitKey];
    local v85 = not v75 and v84 and v81 ~= v25.Fetching;
    local v86, v87 = v2.useState(v76.X * v28.LandscapeNavWidth);
    local v88 = math.max(0, v86 - v68.Gap.Small * 2);
    local v89 = v79 == v29.SceneFullView;
    local v90 = v79 == v29.UIFullView;
    local l_XLarge_0 = v68.Gap.XLarge;
    local v94 = v2.useMemo(function() --[[ Line: 206 ]]
        -- upvalues: l_GridMetrics_0 (ref), v88 (copy), l_XLarge_0 (copy)
        local v92 = l_GridMetrics_0.getMetricsForFixedColumns(math.max(v88, 0), l_XLarge_0, 4);
        local v93 = l_GridMetrics_0.getMediumMetrics(math.max(v88, 0), l_XLarge_0);
        if v92.itemsPerRow > v93.itemsPerRow then
            v93 = v92;
        end;
        return v93;
    end, {
        v86
    });
    local v96 = v2.useCallback(function(v95) --[[ Line: 218 ]]
        -- upvalues: v87 (copy)
        v87(v95.AbsoluteSize.X);
    end, {
        v87
    });
    local v98 = v2.useMemo(function() --[[ Line: 222 ]]
        -- upvalues: v80 (copy), v45 (copy)
        if not v80.ownedItemIds then
            return {};
        else
            local v97 = table.clone(v80.ownedItemIds);
            if v45.showSettingsTile then
                table.insert(v97, 1, "OUTFIT_SWITCHER_SETTINGS_TILE");
            end;
            return v97;
        end;
    end, {
        v80.ownedItemIds, 
        v45.showSettingsTile
    });
    local v99 = v2.useCallback(function() --[[ Line: 235 ]]
        -- upvalues: v84 (copy), v81 (copy), v25 (ref), v65 (copy), v32 (ref), v45 (copy), v13 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref), v73 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), v72 (copy), v33 (ref), v69 (copy)
        if v84 and v81 ~= v25.Fetching then
            v65(v32(v45.outfitKey, true, v45.outfitKey, if v13 then v45.outfitType else nil, if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v73 else nil));
            if l_FFlagAXInventoryDurablesSupport_0 and v73 and v72 then
                v65(v33(v73, v69, nil, v72));
            end;
        end;
    end, {
        v65, 
        v84, 
        v81, 
        if l_FFlagAXInventoryDurablesSupport_0 then v73 else nil, 
        if l_FFlagAXInventoryDurablesSupport_0 then v69 else nil, 
        if l_FFlagAXInventoryDurablesSupport_0 then v72 else nil
    });
    local v100 = v2.useCallback(function() --[[ Line: 263 ]]
        -- upvalues: v75 (copy), v99 (copy)
        if v75 then
            v99();
        end;
    end, {
        v75, 
        v99
    });
    v2.useEffect(function() --[[ Line: 270 ]]
        -- upvalues: v99 (copy)
        v99();
    end, {
        v99
    });
    local v101 = l_useSelector_0(v42);
    local l_key_0 = v67.current.key;
    local v103 = v26.ImpressionsEvents.AvatarItems .. if l_key_0 then string.gsub(l_key_0, "[-{}]", "") else "";
    local v104 = v2.useMemo(function() --[[ Line: 281 ]]
        -- upvalues: l_Signal_0 (ref)
        return l_Signal_0.new();
    end, {});
    local v105 = v2.useCallback(function() --[[ Line: 285 ]]
        -- upvalues: l_key_0 (copy), v66 (copy)
        return l_key_0 == v66.state.key;
    end, {
        l_key_0, 
        v66.state.key
    });
    local v106 = v2.useCallback(function() --[[ Line: 289 ]]
        -- upvalues: v104 (copy)
        v104:fire();
    end, {
        v104
    });
    return {
        fetchMoreOutfits = v99, 
        gridMetrics = v94, 
        hasItemFromCurrentPageEquipped = l_hasItemEquipped_0, 
        isSceneFullView = v89, 
        isUIFullView = v90, 
        itemIds = v98, 
        itemIdsToIsWearing = l_itemIdsToIsWearing_0, 
        onAbsoluteSizeChanged = v96, 
        onScrollingFrameThresholdReached = v100, 
        shouldRenderSettingsTile = v44, 
        impressionsTag = v103, 
        analyticsMetadata = v101, 
        requestImpressionsSignal = v104, 
        impressionsPageFilter = v105, 
        onCanvasPositionChanged = v106, 
        searchUuid = v45.outfitKey, 
        showLoadMoreButton = v85, 
        outfitType = if l_FFlagAXFixEmptyMakeupLooks_0 then v45.outfitType else nil
    };
end;