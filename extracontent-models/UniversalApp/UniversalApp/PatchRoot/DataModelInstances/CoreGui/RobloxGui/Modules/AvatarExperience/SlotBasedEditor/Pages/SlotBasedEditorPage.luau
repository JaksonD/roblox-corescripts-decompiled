local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.SignalsReact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v4.Focusable;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(l_CorePackages_0.Packages.RoactNavigation);
local v9 = require(l_CorePackages_0.Packages.Foundation);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceControlBar);
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave);
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local v14 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.NavigateToSearch);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v18 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v19 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetCategoryAndSubcategory);
local v23 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.NormalizeAvatar);
local v25 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v26 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v28 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Utils.createInventoryStoresFromCategories);
local l_createSortAndFiltersStore_0 = v13.Stores.createSortAndFiltersStore;
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useAvatarRoute_0 = v10.AvatarRoute.Hooks.useAvatarRoute;
local v35 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v37 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local l_useTokens_0 = v9.Hooks.useTokens;
local v39 = require(script.Parent.useSlotBasedEditorContextValue);
local v40 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarEditorTopBar);
local v41 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceView);
local v42 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarNavigationItemsView);
local v43 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.Slots.SlotsContainer);
local l_UndoRedoBar_0 = v11.UndoRedoBar;
local l_SaveButton_0 = v12.Components.SaveButton;
local v46 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger);
local l_SlotBasedEditorContext_0 = v13.Context.SlotBasedEditorContext;
local l_ScreenLayout_0 = v13.Enums.ScreenLayout;
local l_ItemView_0 = v13.Enums.ItemView;
local l_AvatarEditorCategories_0 = v13.Enums.AvatarEditorCategories;
local l_NavigationParams_0 = v13.Enums.NavigationParams;
local l_AvatarScreen_0 = v10.Enums.AvatarScreen;
local v53 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v54 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v55 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v56 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList);
local v57 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters);
local v58 = require(l_Modules_0.AvatarExperience.Flags.GetFlagAXEnableInitialTopLevelPageCounter);
local v59 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXCustomizeOverhaulEditorExposure);
local v60 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXModerationFeatureExposure);
local v61 = require(l_Modules_0.AvatarExperience.Flags.GetFStringAXCatalogAndEditorExposureLayerName);
local v62 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXCatalogAndEditorExposureUseFStringLayer);
local l_FFlagAXAvatarEditorStoresContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext;
local v64 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixCatalogSearchRedirect);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXSlotsPeekViewScrollFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsPeekViewScrollFix;
local l_FFlagAXResetAvatarButton_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXResetAvatarButton;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXSlotsDesktopRedesign_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign;
local l_FFlagAXEnableEnhancedAvatarHeadsFtux_0 = v55.FFlagAXEnableEnhancedAvatarHeadsFtux;
local v71 = game:DefineFastString("AXModerationFeatureLayer", "AvatarExperience.UA.CustomizeView");
local l_FFlagAXCustomizeMakeupSupport_0 = v55.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXEnableEditorCategoryDeepLink_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXEnableEditorCategoryDeepLink;
local l_FFlagAXFixEditorCategoryRenavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXFixEditorCategoryRenavigation;
local l_FFlagAXMigrateSlotsSignals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMigrateSlotsSignals;
local l_FFlagAXSlotsDesignUpdatesExposureLogging_0 = v55.FFlagAXSlotsDesignUpdatesExposureLogging;
local l_FStringAXSlotsDesignUpdatesExposureLayer_0 = v55.FStringAXSlotsDesignUpdatesExposureLayer;
local l_useEnhancedAvatarHeadsFtux_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Hooks.useEnhancedAvatarHeadsFtux;
local _ = function(v79, v80) --[[ Line: 124 ]] --[[ Name: getCategoryTitle ]]
    -- upvalues: l_ItemView_0 (copy), v20 (copy)
    if v80 == l_ItemView_0.SlotItems then
        for _, v82 in (v20()) do
            if v82.NavigationKey == v79 then
                return v82.Title or "Feature.Avatar.Label.Title.MyInventory";
            end;
        end;
    end;
    return "Feature.Avatar.Label.Title.MyInventory";
end;
local function _(v84) --[[ Line: 137 ]] --[[ Name: getScreenLayout ]]
    -- upvalues: l_ItemView_0 (copy), l_ScreenLayout_0 (copy)
    local l_isPortrait_0 = v84.isPortrait;
    local l_itemView_0 = v84.itemView;
    if l_isPortrait_0 then
        if l_itemView_0 ~= l_ItemView_0.Off then
            return l_ScreenLayout_0.PortraitItems;
        else
            return l_ScreenLayout_0.PortraitSlots;
        end;
    else
        return l_ScreenLayout_0.LandscapeSplit;
    end;
end;
local function v89(v88) --[[ Line: 156 ]]
    -- upvalues: v7 (copy)
    return not v7.isEmpty(v88.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems);
end;
local function _(v90, v91) --[[ Line: 160 ]] --[[ Name: getSubcategoryNavKey ]]
    if v91 and v90.Subcategories and v90.Subcategories[v91] then
        return v90.Subcategories[v91].NavigationKey;
    else
        return nil;
    end;
end;
local function _(v93, v94) --[[ Line: 167 ]] --[[ Name: getSlotIndexForSubcategoryKey ]]
    for v95, v96 in v93 do
        if v96.editorSubcategory == v94 then
            return v95;
        end;
    end;
    return nil;
end;
local v99 = l_FFlagAXCustomizeMakeupSupport_0 and function(v98) --[[ Line: 177 ]]
    return v98.AvatarExperience.AvatarEditor.Categories.category;
end or nil;
return (v37(function() --[[ Line: 182 ]] --[[ Name: SlotBasedEditorPage ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v2 (copy), v4 (copy), l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_FFlagAXMigrateSlotsSignals_0 (copy), v35 (copy), v26 (copy), v27 (copy), v56 (copy), v28 (copy), v57 (copy), l_createSortAndFiltersStore_0 (copy), l_FFlagAXSlotsPeekViewScrollFix_0 (copy), l_useSelector_0 (copy), v89 (copy), v19 (copy), l_DeviceOrientationMode_0 (copy), v18 (copy), l_NavigationParams_0 (copy), l_ItemView_0 (copy), v64 (copy), v39 (copy), v3 (copy), l_FFlagAXSlotsDesktopRedesign_0 (copy), v13 (copy), l_useLocalization_0 (copy), v20 (copy), l_ScreenLayout_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v99 (copy), l_FFlagAXEnableEditorCategoryDeepLink_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), v22 (copy), v21 (copy), l_FFlagAXFixEditorCategoryRenavigation_0 (copy), v8 (copy), l_AvatarEditorCategories_0 (copy), v23 (copy), l_AvatarScreen_0 (copy), v16 (copy), v25 (copy), v40 (copy), l_FFlagAXResetAvatarButton_0 (copy), v54 (copy), v9 (copy), l_UndoRedoBar_0 (copy), l_SaveButton_0 (copy), v43 (copy), v58 (copy), l_sendAXCounterV2_0 (copy), v53 (copy), l_FFlagAXEnableEnhancedAvatarHeadsFtux_0 (copy), l_useEnhancedAvatarHeadsFtux_0 (copy), v59 (copy), v14 (copy), v62 (copy), v61 (copy), l_AppUserLayers_0 (copy), v60 (copy), v71 (copy), v24 (copy), l_Focusable_0 (copy), l_SlotBasedEditorContext_0 (copy), l_FFlagAXAvatarEditorStoresContext_0 (copy), v41 (copy), v42 (copy), l_FFlagAXSlotsDesignUpdatesExposureLogging_0 (copy), v46 (copy), l_FStringAXSlotsDesignUpdatesExposureLayer_0 (copy)
    local v100 = false;
    local v101 = l_useTokens_0();
    local v102 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.useRef(v4.createFocusController()).current;
    local v103 = v2.useRef(nil);
    local v104 = l_useAvatarRoute_0();
    local v105 = l_useNavigation_0();
    local v106 = l_useDispatch_0();
    local v107 = if l_FFlagAXMigrateSlotsSignals_0 then nil else v35(v26);
    local v108 = v35(v27);
    local v109 = if not l_FFlagAXMigrateSlotsSignals_0 and v56() then v2.useMemo(v28, {}) else nil;
    local v110 = if not l_FFlagAXMigrateSlotsSignals_0 and v57() then v2.useMemo(l_createSortAndFiltersStore_0, {}) else nil;
    local v111 = nil;
    local v112 = nil;
    if l_FFlagAXSlotsPeekViewScrollFix_0 then
        local v113, v114 = v2.useBinding(false);
        v111 = v113;
        v112 = v114;
    end;
    local v115 = l_useSelector_0(v89);
    local v117 = l_useSelector_0(function(v116) --[[ Line: 209 ]]
        -- upvalues: v19 (ref), v104 (copy)
        return v19(v116, v104.opaque.name);
    end);
    local v119 = l_useSelector_0(function(v118) --[[ Line: 212 ]]
        -- upvalues: l_DeviceOrientationMode_0 (ref)
        return v118.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    end);
    local v120 = v117 == v18.SceneFullView;
    local v121 = v117 == v18.UIFullView;
    local v122 = v105.getParam(l_NavigationParams_0.itemView) or v119 and l_ItemView_0.SlotItems or not v119 and l_ItemView_0.Off;
    local v123 = if l_FFlagAXMigrateSlotsSignals_0 then nil else v105.getParam(l_NavigationParams_0.fromScreen);
    local v124 = if not l_FFlagAXMigrateSlotsSignals_0 and v64 then v105.getParam(l_NavigationParams_0.params) else nil;
    local v125 = nil;
    local v126 = nil;
    local v127 = nil;
    local v128 = nil;
    local v129 = if l_FFlagAXMigrateSlotsSignals_0 then v39() else nil;
    if l_FFlagAXMigrateSlotsSignals_0 then
        v125 = v3.useSignalState(v129.signalStore.getSlotCategory);
        v126 = v129.signalStore.setSlotCategory;
        v128 = v129.signalStore.setSlotIndex;
    else
        local v130, v131 = v2.useState(if l_FFlagAXSlotsDesktopRedesign_0 then if v119 then v13.Enums.Categories.Avatars else v13.Enums.Categories.All else if v119 then v13.Enums.Categories.Avatars else v13.Enums.Categories.Body);
        v125 = v130;
        v126 = v131;
        v130, v131 = v2.useState(1);
        v127 = v130;
        v128 = v131;
    end;
    local l_l_useLocalization_0_0 = l_useLocalization_0;
    local v133 = {};
    local l_v125_0 = v125;
    local v135;
    if v122 == l_ItemView_0.SlotItems then
        for _, v137 in (v20()) do
            if v137.NavigationKey == l_v125_0 then
                v135 = v137.Title or "Feature.Avatar.Label.Title.MyInventory";
                v100 = true;
            end;
            if v100 then
                break;
            end;
        end;
    end;
    if not v100 then
        v135 = "Feature.Avatar.Label.Title.MyInventory";
    end;
    v100 = false;
    v133.itemScreenTitle = v135;
    l_l_useLocalization_0_0 = l_l_useLocalization_0_0(v133);
    if l_FFlagAXMigrateSlotsSignals_0 then
        v133 = v129.screenLayout;
    else
        v135 = {
            isPortrait = v119, 
            itemView = v122
        };
        l_v125_0 = v135.isPortrait;
        local l_itemView_1 = v135.itemView;
        v133 = if l_v125_0 then if l_itemView_1 ~= l_ItemView_0.Off then l_ScreenLayout_0.PortraitItems else l_ScreenLayout_0.PortraitSlots else l_ScreenLayout_0.LandscapeSplit;
    end;
    v135 = if l_FFlagAXCustomizeMakeupSupport_0 then l_useSelector_0(v99) else nil;
    v2.useEffect(function() --[[ Line: 268 ]]
        -- upvalues: l_FFlagAXEnableEditorCategoryDeepLink_0 (ref), v105 (copy), l_NavigationParams_0 (ref), l_FFlagAXRootSlotBasedEditorFlag_0 (ref), v119 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v125 (ref), v13 (ref), v135 (copy), v126 (ref), v106 (copy), v22 (ref)
        if l_FFlagAXEnableEditorCategoryDeepLink_0 and v105.getParam(l_NavigationParams_0.category) ~= nil then
            return;
        else
            if l_FFlagAXRootSlotBasedEditorFlag_0 and v119 and (not l_FFlagAXCustomizeMakeupSupport_0 or v125 == v13.Enums.Categories.All or v135 == 1) then
                if l_FFlagAXCustomizeMakeupSupport_0 then
                    v126(v13.Enums.Categories.Avatars);
                end;
                v106(v22(2, nil));
            end;
            return;
        end;
    end, if l_FFlagAXCustomizeMakeupSupport_0 then {
        v119, 
        v125, 
        v135
    } else {
        v119
    });
    if l_FFlagAXEnableEditorCategoryDeepLink_0 then
        l_v125_0 = v2.useCallback(function(v139, v140) --[[ Line: 298 ]]
            -- upvalues: v20 (ref), v126 (ref), v106 (copy), v21 (ref), v108 (copy), v13 (ref), v128 (ref)
            local v141 = false;
            local v142 = v139 and v20()[v139];
            if not v142 or not v142.NavigationKey then
                return;
            else
                v126(v142.NavigationKey);
                v106(v21(v139, v140, v108));
                local v143 = if v140 and v142.Subcategories and v142.Subcategories[v140] then v142.Subcategories[v140].NavigationKey else nil;
                if v143 then
                    local v144 = v13.Constants.SlotEditorCategories[v142.NavigationKey];
                    if v144 and v144.slots then
                        local v145;
                        for v146, v147 in v144.slots do
                            if v147.editorSubcategory == v143 then
                                v145 = v146;
                                v141 = true;
                            end;
                            if v141 then
                                break;
                            end;
                        end;
                        if not v141 then
                            v145 = nil;
                        end;
                        v141 = false;
                        if v145 then
                            v128(v145);
                        end;
                    end;
                end;
                return;
            end;
        end, {
            v106, 
            v108
        });
        local v148 = v105.getParam(l_NavigationParams_0.category);
        local v149 = v105.getParam(l_NavigationParams_0.subcategory);
        local l_v148_0 = v148 --[[ copy: 29 -> 44 ]];
        local l_l_v125_0_0 = l_v125_0 --[[ copy: 28 -> 45 ]];
        local l_v149_0 = v149 --[[ copy: 30 -> 46 ]];
        v2.useEffect(function() --[[ Line: 324 ]]
            -- upvalues: l_v148_0 (copy), l_l_v125_0_0 (copy), l_v149_0 (copy), l_FFlagAXFixEditorCategoryRenavigation_0 (ref), v105 (copy), l_NavigationParams_0 (ref), v8 (ref)
            if l_v148_0 == nil then
                return;
            else
                l_l_v125_0_0(l_v148_0, l_v149_0);
                if l_FFlagAXFixEditorCategoryRenavigation_0 then
                    v105.setParams({
                        [l_NavigationParams_0.category] = v8.None, 
                        [l_NavigationParams_0.subcategory] = v8.None
                    });
                end;
                return;
            end;
        end, {
            v148, 
            v149, 
            l_v125_0
        });
    end;
    l_v125_0 = if l_FFlagAXMigrateSlotsSignals_0 then nil else v2.useCallback(function() --[[ Line: 340 ]]
        -- upvalues: v20 (ref), l_AvatarEditorCategories_0 (ref), v106 (copy), v21 (ref), v108 (copy), v23 (ref), v107 (copy), v105 (copy)
        for _, v154 in (v20()) do
            if v154.NavigationKey == l_AvatarEditorCategories_0.All then
                v106(v21(v154.Category, nil, v108));
                break;
            end;
        end;
        v106(v23(v107, v105.state.routeName));
    end, {
        v106, 
        v107, 
        v105.state.routeName, 
        v108
    });
    local v157 = if l_FFlagAXMigrateSlotsSignals_0 then nil else v2.useCallback(function() --[[ Line: 354 ]]
        -- upvalues: v104 (copy), l_AvatarScreen_0 (ref), v105 (copy), l_NavigationParams_0 (ref), l_ItemView_0 (ref), l_v125_0 (copy), v64 (ref), v123 (copy), v124 (copy), v106 (copy), v16 (ref), v25 (ref), v107 (copy), v18 (ref)
        local v155 = v104.current.name == l_AvatarScreen_0.LookDetails;
        v105.navigate(l_AvatarScreen_0.AvatarEditor, {
            [l_NavigationParams_0.itemView] = l_ItemView_0.Off
        });
        if v155 then
            v105.navigate(l_AvatarScreen_0.LookDetails);
        end;
        l_v125_0();
        if v64 and v123 == l_AvatarScreen_0.CatalogSearch and v123 ~= v104.opaque.name then
            if v124 and v124.searchParams then
                local v156 = {
                    searchKeyword = v124.searchParams.searchKeyword, 
                    isKeywordSuggestionEnabled = true
                };
                v106(v16(v105, v156));
            end;
        elseif v123 and v123 ~= v104.opaque.name then
            v105.navigate(v123);
        end;
        v106(v25(v107, v105.state.routeName, v18.None));
    end, {
        l_v125_0, 
        v105, 
        v123
    });
    local v158 = v2.useMemo(function() --[[ Line: 385 ]]
        -- upvalues: v2 (ref), v40 (ref), v105 (copy), v104 (copy)
        return v2.createElement(v40, {
            navigation = v105, 
            avatarRoute = v104
        });
    end, {
        v105, 
        v104, 
        v133, 
        v125, 
        l_l_useLocalization_0_0, 
        v122
    });
    local v163 = v2.useCallback(function(v159) --[[ Line: 392 ]]
        -- upvalues: l_FFlagAXResetAvatarButton_0 (ref), v115 (copy), v54 (ref), v2 (ref), v9 (ref), v101 (copy), l_UndoRedoBar_0 (ref), l_SaveButton_0 (ref), v43 (ref)
        local v160 = not l_FFlagAXResetAvatarButton_0 and (not (v159.showUndoRedo ~= nil) or v159.showUndoRedo);
        local v161 = v159.showSaveButton ~= nil and v159.showSaveButton;
        local v162 = if v115 then v54.ActionBar.ActionBarHeight + v54.ActionBar.ActionBarPadding else 0;
        return v2.createElement(v9.View, {
            tag = "col anchor-bottom-left auto-xy size-full-0", 
            Position = UDim2.new(0, 0, 1, v101.Radius.Medium), 
            padding = {
                bottom = UDim.new(0, v162)
            }, 
            ZIndex = 2
        }, {
            SceneButtons = v2.createElement(v9.View, {
                tag = "auto-xy size-full-0", 
                padding = {
                    left = UDim.new(0, v101.Size.Size_500), 
                    bottom = UDim.new(0, v101.Size.Size_400), 
                    right = UDim.new(0, v101.Size.Size_500)
                }
            }, {
                BottomLeftButtons = v2.createElement(v9.View, {
                    tag = "auto-xy", 
                    Position = UDim2.fromScale(0, 0)
                }, {
                    UndoRedoBar = v160 and v2.createElement(l_UndoRedoBar_0)
                }), 
                BottomRightButtons = v2.createElement(v9.View, {
                    tag = "auto-xy anchor-top-right", 
                    Position = UDim2.fromScale(1, 0)
                }, {
                    SaveButton = v161 and v2.createElement(l_SaveButton_0)
                })
            }), 
            SlotsContainer = v2.createElement(v43)
        });
    end, {
        v115
    });
    if v58() then
        v2.useEffect(function() --[[ Line: 441 ]]
            -- upvalues: l_sendAXCounterV2_0 (ref), v53 (ref)
            l_sendAXCounterV2_0(v53.Counter.TopLevelPageInitialView.SlotBasedEditor);
        end, {});
    end;
    if l_FFlagAXEnableEnhancedAvatarHeadsFtux_0 then
        l_useEnhancedAvatarHeadsFtux_0();
    end;
    if v59 then
        v2.useEffect(function() --[[ Line: 451 ]]
            -- upvalues: v14 (ref), v62 (ref), v61 (ref), l_AppUserLayers_0 (ref)
            v14.logLayerExposure(if v62 then v61() else l_AppUserLayers_0.AvatarExperienceUAAllViews);
        end, {});
    end;
    if v60 then
        v2.useEffect(function() --[[ Line: 461 ]]
            -- upvalues: v14 (ref), v71 (ref)
            v14.logLayerExposure(v71);
        end, {});
    end;
    if l_FFlagAXCustomizeMakeupSupport_0 then
        v2.useEffect(function() --[[ Line: 469 ]]
            -- upvalues: v104 (copy), l_AvatarScreen_0 (ref), v106 (copy), v24 (ref)
            if v104.opaque.name == l_AvatarScreen_0.AvatarEditor then
                v106(v24());
            end;
        end, {
            v104.opaque.name
        });
    end;
    local l_createElement_0 = v2.createElement;
    local l_Frame_0 = l_Focusable_0.Frame;
    local v166 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v102
    };
    local v167 = {};
    local l_createElement_1 = v2.createElement;
    local l_Provider_0 = l_SlotBasedEditorContext_0.Provider;
    local v170 = {
        value = if l_FFlagAXMigrateSlotsSignals_0 then v129 else {
            handleExitPortraitItems = v157, 
            itemView = v122, 
            slotCategory = v125, 
            setSlotCategory = v126, 
            screenLayout = v133, 
            slotIndex = v127, 
            setSlotIndex = v128, 
            categoryInventoryStores = if not v56() or l_FFlagAXAvatarEditorStoresContext_0 then nil else v109, 
            sortAndFiltersStore = if not v57() or l_FFlagAXAvatarEditorStoresContext_0 then nil else v110
        }
    };
    local v171 = {};
    local l_createElement_2 = v2.createElement;
    local l_v41_0 = v41;
    local v174 = {
        bottomBarEnabled = false, 
        showControlBar = true, 
        showRobuxBalance = true
    };
    local v175 = true;
    if v133 ~= l_ScreenLayout_0.PortraitItems then
        v175 = v133 == l_ScreenLayout_0.LandscapeSplit;
    end;
    v174.showUndoRedo = v175;
    v174.showSaveButton = v133 == l_ScreenLayout_0.PortraitItems;
    v174.allowAdaptiveScrolling = v133 ~= l_ScreenLayout_0.PortraitSlots;
    v174.isSceneFullView = v120;
    v174.isUIFullView = v121;
    v174.topBar = v158;
    v174.multiTryOnBottomBarRef = v103;
    v174.disableScrollViewBindings = if l_FFlagAXSlotsPeekViewScrollFix_0 then v111 else nil;
    v174.sceneUi = if not (not l_FFlagAXSlotsDesktopRedesign_0 and v133 == l_ScreenLayout_0.LandscapeSplit) or v120 then nil else v163({
        showUndoRedo = false
    });
    v171.AvatarExperienceView = l_createElement_2(l_v41_0, v174, {
        Inventory = (not (v133 ~= l_ScreenLayout_0.LandscapeSplit) or v133 == l_ScreenLayout_0.PortraitItems) and v2.createElement(v42, {
            updateDisableScrollView = if l_FFlagAXSlotsPeekViewScrollFix_0 then v112 else nil
        }), 
        SlotsContainer = if not (v133 == l_ScreenLayout_0.PortraitSlots) or v120 then nil else v163({})
    });
    v167.SlotBasedEditorContext = l_createElement_1(l_Provider_0, v170, v171);
    v167.OnFocusExperimentExposureLogger = if l_FFlagAXSlotsDesignUpdatesExposureLogging_0 then v2.createElement(v46, {
        ixpTests = {}, 
        flagIXPTestLayers = if l_FFlagAXSlotsDesignUpdatesExposureLogging_0 then {
            if l_FFlagAXSlotsDesignUpdatesExposureLogging_0 then l_FStringAXSlotsDesignUpdatesExposureLayer_0 else nil
        } else nil
    }) else nil;
    return l_createElement_0(l_Frame_0, v166, v167);
end));