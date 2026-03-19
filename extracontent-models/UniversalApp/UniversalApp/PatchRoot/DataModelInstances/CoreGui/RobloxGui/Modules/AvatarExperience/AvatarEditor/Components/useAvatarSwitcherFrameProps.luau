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
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v29 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v30 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v31 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v32 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v33 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfits);
local v34 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetUserInventoryV2);
local l_FFlagAXAvatarEditorStoresContext_0 = v6.FFlagAXAvatarEditorStoresContext;
local l_FFlagAXInventoryDurablesSupport_0 = v6.FFlagAXInventoryDurablesSupport;
local l_EditableCharacterKey_0 = v27.EditableCharacterKey;
local function v39(v38) --[[ Line: 50 ]] --[[ Name: selectPageFinished ]]
    return v38.AvatarExperience.AvatarEditor.PageFinished;
end;
local function v55(v40) --[[ Line: 54 ]] --[[ Name: selectOwnedItemIdsWearing ]]
    -- upvalues: l_EditableCharacterKey_0 (copy), v28 (copy)
    local l_OutfitInfos_0 = v40.AvatarExperience.AvatarEditor.OutfitInfos;
    local l_EquippedAssets_0 = v40.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local l_AvatarType_0 = v40.AvatarExperience.AvatarEditor.Character.AvatarType;
    local l_BodyColor3s_0 = v40.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    local l_AvatarScales_0 = v40.AvatarExperience.AvatarEditor.Character.AvatarScales;
    local l_OwnedItemIdsBySubtype_0 = v40.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
    local v47 = {};
    local v48 = false;
    local v49 = {};
    if l_OwnedItemIdsBySubtype_0 then
        local v50 = l_OwnedItemIdsBySubtype_0[l_EditableCharacterKey_0] or {};
        v49 = table.clone(v50);
    end;
    for _, v52 in v49 do
        local v53 = l_OutfitInfos_0[v52];
        if v53 then
            local v54 = v28.isWearingOutfitNoState(v53, l_AvatarType_0, l_BodyColor3s_0, l_EquippedAssets_0, l_AvatarScales_0);
            v47[v52] = v54;
            if v54 then
                v48 = true;
            end;
        end;
    end;
    return {
        ownedItemIds = v49, 
        itemIdsToIsWearing = v47, 
        hasItemEquipped = v48
    };
end;
local function v57(v56) --[[ Line: 90 ]] --[[ Name: selectScreenSize ]]
    return v56.ScreenSize;
end;
local function v59(v58) --[[ Line: 94 ]] --[[ Name: selectAnalyticsMetadata ]]
    return v58.AvatarExperience.AnalyticsMetadata;
end;
local function v61(v60) --[[ Line: 98 ]] --[[ Name: selectFetchStatus ]]
    -- upvalues: l_PerformFetch_0 (copy), l_EditableCharacterKey_0 (copy)
    return l_PerformFetch_0.GetStatus(v60, l_EditableCharacterKey_0);
end;
local function v63(v62) --[[ Line: 125 ]] --[[ Name: shouldRenderSettingsTile ]]
    return v62 == "AVATAR_SWITCHER_SETTINGS_TILE";
end;
return function() --[[ Line: 132 ]] --[[ Name: useAvatarSwitcherPageProps ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v4 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_useSelector_0 (copy), v32 (copy), l_FFlagAXAvatarEditorStoresContext_0 (copy), l_useAvatarEditorStores_0 (copy), l_useSlotBasedEditorContext_0 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), l_useNetworking_0 (copy), v22 (copy), v57 (copy), l_getUseSelectorDeepEquals_0 (copy), v39 (copy), v31 (copy), v55 (copy), v61 (copy), l_EditableCharacterKey_0 (copy), v25 (copy), v2 (copy), v29 (copy), v30 (copy), l_GridMetrics_0 (copy), v33 (copy), v27 (copy), v13 (copy), v34 (copy), v59 (copy), v26 (copy), l_Signal_0 (copy), v63 (copy)
    local v64 = l_useDispatch_0();
    local v65 = l_useNavigation_0();
    local v66 = l_useAvatarRoute_0();
    local v67 = v4.Hooks.useTokens();
    local v68 = if l_FFlagAXInventoryDurablesSupport_0 then l_useSelector_0(v32.getAvatarEditorCategoryInfoFromState) else nil;
    local v69 = nil;
    local v70 = nil;
    if l_FFlagAXInventoryDurablesSupport_0 then
        if l_FFlagAXAvatarEditorStoresContext_0 then
            v69 = l_useAvatarEditorStores_0();
        else
            v70 = l_useSlotBasedEditorContext_0();
        end;
    end;
    local v71 = if l_FFlagAXInventoryDurablesSupport_0 and v68 then if l_FFlagAXAvatarEditorStoresContext_0 then v69.categoryInventoryStores[v68.NavigationKey] else v70.categoryInventoryStores[v68.NavigationKey] else nil;
    local v72 = nil;
    if l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then
        v72 = l_useNetworking_0();
    end;
    local v74 = v22(function(v73) --[[ Line: 161 ]]
        return v73.getEnableContinuousLoad();
    end);
    local v75 = l_useSelector_0(v57, l_getUseSelectorDeepEquals_0());
    local v76 = l_useSelector_0(v39, l_getUseSelectorDeepEquals_0());
    local v78 = l_useSelector_0(function(v77) --[[ Line: 167 ]]
        -- upvalues: v31 (ref), v66 (copy)
        return v31(v77, v66.opaque.name);
    end, l_getUseSelectorDeepEquals_0());
    local v79 = l_useSelector_0(v55, l_getUseSelectorDeepEquals_0());
    local v80 = l_useSelector_0(v61, l_getUseSelectorDeepEquals_0());
    local l_itemIdsToIsWearing_0 = v79.itemIdsToIsWearing;
    local l_hasItemEquipped_0 = v79.hasItemEquipped;
    local v83 = not v76[l_EditableCharacterKey_0];
    local v84 = not v74 and v83 and v80 ~= v25.Fetching;
    local v85, v86 = v2.useState(v75.X * v29.LandscapeNavWidth);
    local v87 = math.max(0, v85 - v67.Gap.Small * 2);
    local v88 = v78 == v30.SceneFullView;
    local v89 = v78 == v30.UIFullView;
    local l_XLarge_0 = v67.Gap.XLarge;
    local v93 = v2.useMemo(function() --[[ Line: 189 ]]
        -- upvalues: l_GridMetrics_0 (ref), v87 (copy), l_XLarge_0 (copy)
        local v91 = l_GridMetrics_0.getMetricsForFixedColumns(math.max(v87, 0), l_XLarge_0, 4);
        local v92 = l_GridMetrics_0.getMediumMetrics(math.max(v87, 0), l_XLarge_0);
        if v91.itemsPerRow > v92.itemsPerRow then
            v92 = v91;
        end;
        return v92;
    end, {
        v85
    });
    local v95 = v2.useCallback(function(v94) --[[ Line: 201 ]]
        -- upvalues: v86 (copy)
        v86(v94.AbsoluteSize.X);
    end, {
        v86
    });
    local v97 = v2.useMemo(function() --[[ Line: 205 ]]
        -- upvalues: v79 (copy)
        if not v79.ownedItemIds then
            return {};
        else
            local v96 = table.clone(v79.ownedItemIds);
            table.insert(v96, 1, "AVATAR_SWITCHER_SETTINGS_TILE");
            return v96;
        end;
    end, {
        v79.ownedItemIds
    });
    local v98 = v2.useCallback(function() --[[ Line: 215 ]]
        -- upvalues: v83 (copy), v80 (copy), v25 (ref), v64 (copy), v33 (ref), v27 (ref), l_EditableCharacterKey_0 (ref), v13 (ref), v29 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref), v72 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), v71 (copy), v34 (ref), v68 (copy)
        if v83 and v80 ~= v25.Fetching then
            v64(v33(v27.EditableCharacterKey, true, l_EditableCharacterKey_0, if v13 then v29.OutfitTypes.Avatar else nil, if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v72 else nil));
            if l_FFlagAXInventoryDurablesSupport_0 and v72 and v71 then
                v64(v34(v72, v68, nil, v71));
            end;
        end;
    end, {
        v64, 
        v83, 
        v80, 
        if l_FFlagAXInventoryDurablesSupport_0 then v72 else nil, 
        if l_FFlagAXInventoryDurablesSupport_0 then v68 else nil, 
        if l_FFlagAXInventoryDurablesSupport_0 then v71 else nil
    });
    local v99 = v2.useCallback(function() --[[ Line: 243 ]]
        -- upvalues: v74 (copy), v98 (copy)
        if v74 then
            v98();
        end;
    end, {
        v74, 
        v98
    });
    v2.useEffect(function() --[[ Line: 250 ]]
        -- upvalues: v98 (copy)
        v98();
    end, {
        if l_FFlagAXInventoryDurablesSupport_0 then v98 else nil
    });
    local v100 = l_useSelector_0(v59);
    local l_key_0 = v66.current.key;
    local v102 = v26.ImpressionsEvents.AvatarItems .. if l_key_0 then string.gsub(l_key_0, "[-{}]", "") else "";
    local v103 = v2.useMemo(function() --[[ Line: 261 ]]
        -- upvalues: l_Signal_0 (ref)
        return l_Signal_0.new();
    end, {});
    local v104 = v2.useCallback(function() --[[ Line: 265 ]]
        -- upvalues: l_key_0 (copy), v65 (copy)
        return l_key_0 == v65.state.key;
    end, {
        l_key_0, 
        v65.state.key
    });
    local v105 = v2.useCallback(function() --[[ Line: 269 ]]
        -- upvalues: v103 (copy)
        v103:fire();
    end, {
        v103
    });
    return {
        fetchMoreOutfits = v98, 
        gridMetrics = v93, 
        hasItemFromCurrentPageEquipped = l_hasItemEquipped_0, 
        isSceneFullView = v88, 
        isUIFullView = v89, 
        itemIds = v97, 
        itemIdsToIsWearing = l_itemIdsToIsWearing_0, 
        onAbsoluteSizeChanged = v95, 
        onScrollingFrameThresholdReached = v99, 
        shouldRenderSettingsTile = v63, 
        impressionsTag = v102, 
        analyticsMetadata = v100, 
        requestImpressionsSignal = v103, 
        impressionsPageFilter = v104, 
        onCanvasPositionChanged = v105, 
        searchUuid = l_EditableCharacterKey_0, 
        showLoadMoreButton = v84
    };
end;