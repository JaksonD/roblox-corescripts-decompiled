local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.SignalsReact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v4.Focusable;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(l_CorePackages_0.Packages.Foundation);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceControlBar);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave);
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local v13 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.NavigateToSearch);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v17 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v18 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetCategoryAndSubcategory);
local v22 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.NormalizeAvatar);
local v24 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v25 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v27 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Utils.createInventoryStoresFromCategories);
local l_createSortAndFiltersStore_0 = v12.Stores.createSortAndFiltersStore;
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useAvatarRoute_0 = v9.AvatarRoute.Hooks.useAvatarRoute;
local v34 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local l_useTokens_0 = v8.Hooks.useTokens;
local v38 = require(script.Parent.useSlotBasedEditorContextValue);
local v39 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarEditorTopBar);
local v40 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceView);
local v41 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarNavigationItemsView);
local v42 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.Slots.SlotsContainer);
local l_UndoRedoBar_0 = v10.UndoRedoBar;
local l_SaveButton_0 = v11.Components.SaveButton;
local v45 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger);
local l_SlotBasedEditorContext_0 = v12.Context.SlotBasedEditorContext;
local l_ScreenLayout_0 = v12.Enums.ScreenLayout;
local l_ItemView_0 = v12.Enums.ItemView;
local l_AvatarEditorCategories_0 = v12.Enums.AvatarEditorCategories;
local l_NavigationParams_0 = v12.Enums.NavigationParams;
local l_AvatarScreen_0 = v9.Enums.AvatarScreen;
local v52 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v53 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v54 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v55 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList);
local v56 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters);
local v57 = require(l_Modules_0.AvatarExperience.Flags.GetFlagAXEnableInitialTopLevelPageCounter);
local v58 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXCustomizeOverhaulEditorExposure);
local v59 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXModerationFeatureExposure);
local v60 = require(l_Modules_0.AvatarExperience.Flags.GetFStringAXCatalogAndEditorExposureLayerName);
local v61 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXCatalogAndEditorExposureUseFStringLayer);
local l_FFlagAXAvatarEditorStoresContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext;
local v63 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixCatalogSearchRedirect);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXSlotsPeekViewScrollFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsPeekViewScrollFix;
local l_FFlagAXResetAvatarButton_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXResetAvatarButton;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXSlotsDesktopRedesign_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign;
local l_FFlagAXEnableEnhancedAvatarHeadsFtux_0 = v54.FFlagAXEnableEnhancedAvatarHeadsFtux;
local v70 = game:DefineFastString("AXModerationFeatureLayer", "AvatarExperience.UA.CustomizeView");
local l_FFlagAXCustomizeMakeupSupport_0 = v54.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXEnableEditorCategoryDeepLink_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXEnableEditorCategoryDeepLink;
local l_FFlagAXMigrateSlotsSignals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMigrateSlotsSignals;
local l_FFlagAXSlotsDesignUpdatesExposureLogging_0 = v54.FFlagAXSlotsDesignUpdatesExposureLogging;
local l_FStringAXSlotsDesignUpdatesExposureLayer_0 = v54.FStringAXSlotsDesignUpdatesExposureLayer;
local l_useEnhancedAvatarHeadsFtux_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Hooks.useEnhancedAvatarHeadsFtux;
local _ = function(v77, v78) --[[ Line: 121 ]] --[[ Name: getCategoryTitle ]]
    -- upvalues: l_ItemView_0 (copy), v19 (copy)
    if v78 == l_ItemView_0.SlotItems then
        for _, v80 in (v19()) do
            if v80.NavigationKey == v77 then
                return v80.Title or "Feature.Avatar.Label.Title.MyInventory";
            end;
        end;
    end;
    return "Feature.Avatar.Label.Title.MyInventory";
end;
local function _(v82) --[[ Line: 134 ]] --[[ Name: getScreenLayout ]]
    -- upvalues: l_ItemView_0 (copy), l_ScreenLayout_0 (copy)
    local l_isPortrait_0 = v82.isPortrait;
    local l_itemView_0 = v82.itemView;
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
local function v87(v86) --[[ Line: 153 ]]
    -- upvalues: v7 (copy)
    return not v7.isEmpty(v86.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems);
end;
local function _(v88, v89) --[[ Line: 157 ]] --[[ Name: getSubcategoryNavKey ]]
    if v89 and v88.Subcategories and v88.Subcategories[v89] then
        return v88.Subcategories[v89].NavigationKey;
    else
        return nil;
    end;
end;
local function _(v91, v92) --[[ Line: 164 ]] --[[ Name: getSlotIndexForSubcategoryKey ]]
    for v93, v94 in v91 do
        if v94.editorSubcategory == v92 then
            return v93;
        end;
    end;
    return nil;
end;
local v97 = l_FFlagAXCustomizeMakeupSupport_0 and function(v96) --[[ Line: 174 ]]
    return v96.AvatarExperience.AvatarEditor.Categories.category;
end or nil;
return (v36(function() --[[ Line: 179 ]] --[[ Name: SlotBasedEditorPage ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v2 (copy), v4 (copy), l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_FFlagAXMigrateSlotsSignals_0 (copy), v34 (copy), v25 (copy), v26 (copy), v55 (copy), v27 (copy), v56 (copy), l_createSortAndFiltersStore_0 (copy), l_FFlagAXSlotsPeekViewScrollFix_0 (copy), l_useSelector_0 (copy), v87 (copy), v18 (copy), l_DeviceOrientationMode_0 (copy), v17 (copy), l_NavigationParams_0 (copy), l_ItemView_0 (copy), v63 (copy), v38 (copy), v3 (copy), l_FFlagAXSlotsDesktopRedesign_0 (copy), v12 (copy), l_useLocalization_0 (copy), v19 (copy), l_ScreenLayout_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v97 (copy), l_FFlagAXEnableEditorCategoryDeepLink_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), v21 (copy), v20 (copy), l_AvatarEditorCategories_0 (copy), v22 (copy), l_AvatarScreen_0 (copy), v15 (copy), v24 (copy), v39 (copy), l_FFlagAXResetAvatarButton_0 (copy), v53 (copy), v8 (copy), l_UndoRedoBar_0 (copy), l_SaveButton_0 (copy), v42 (copy), v57 (copy), l_sendAXCounterV2_0 (copy), v52 (copy), l_FFlagAXEnableEnhancedAvatarHeadsFtux_0 (copy), l_useEnhancedAvatarHeadsFtux_0 (copy), v58 (copy), v13 (copy), v61 (copy), v60 (copy), l_AppUserLayers_0 (copy), v59 (copy), v70 (copy), v23 (copy), l_Focusable_0 (copy), l_SlotBasedEditorContext_0 (copy), l_FFlagAXAvatarEditorStoresContext_0 (copy), v40 (copy), v41 (copy), l_FFlagAXSlotsDesignUpdatesExposureLogging_0 (copy), v45 (copy), l_FStringAXSlotsDesignUpdatesExposureLayer_0 (copy)
    local v98 = false;
    local v99 = l_useTokens_0();
    local v100 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.useRef(v4.createFocusController()).current;
    local v101 = v2.useRef(nil);
    local v102 = l_useAvatarRoute_0();
    local v103 = l_useNavigation_0();
    local v104 = l_useDispatch_0();
    local v105 = if l_FFlagAXMigrateSlotsSignals_0 then nil else v34(v25);
    local v106 = v34(v26);
    local v107 = if not l_FFlagAXMigrateSlotsSignals_0 and v55() then v2.useMemo(v27, {}) else nil;
    local v108 = if not l_FFlagAXMigrateSlotsSignals_0 and v56() then v2.useMemo(l_createSortAndFiltersStore_0, {}) else nil;
    local v109 = nil;
    local v110 = nil;
    if l_FFlagAXSlotsPeekViewScrollFix_0 then
        local v111, v112 = v2.useBinding(false);
        v109 = v111;
        v110 = v112;
    end;
    local v113 = l_useSelector_0(v87);
    local v115 = l_useSelector_0(function(v114) --[[ Line: 206 ]]
        -- upvalues: v18 (ref), v102 (copy)
        return v18(v114, v102.opaque.name);
    end);
    local v117 = l_useSelector_0(function(v116) --[[ Line: 209 ]]
        -- upvalues: l_DeviceOrientationMode_0 (ref)
        return v116.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    end);
    local v118 = v115 == v17.SceneFullView;
    local v119 = v115 == v17.UIFullView;
    local v120 = v103.getParam(l_NavigationParams_0.itemView) or v117 and l_ItemView_0.SlotItems or not v117 and l_ItemView_0.Off;
    local v121 = if l_FFlagAXMigrateSlotsSignals_0 then nil else v103.getParam(l_NavigationParams_0.fromScreen);
    local v122 = if not l_FFlagAXMigrateSlotsSignals_0 and v63 then v103.getParam(l_NavigationParams_0.params) else nil;
    local v123 = nil;
    local v124 = nil;
    local v125 = nil;
    local v126 = nil;
    local v127 = if l_FFlagAXMigrateSlotsSignals_0 then v38() else nil;
    if l_FFlagAXMigrateSlotsSignals_0 then
        v123 = v3.useSignalState(v127.signalStore.getSlotCategory);
        v124 = v127.signalStore.setSlotCategory;
        v126 = v127.signalStore.setSlotIndex;
    else
        local v128, v129 = v2.useState(if l_FFlagAXSlotsDesktopRedesign_0 then if v117 then v12.Enums.Categories.Avatars else v12.Enums.Categories.All else if v117 then v12.Enums.Categories.Avatars else v12.Enums.Categories.Body);
        v123 = v128;
        v124 = v129;
        v128, v129 = v2.useState(1);
        v125 = v128;
        v126 = v129;
    end;
    local l_l_useLocalization_0_0 = l_useLocalization_0;
    local v131 = {};
    local l_v123_0 = v123;
    local v133;
    if v120 == l_ItemView_0.SlotItems then
        for _, v135 in (v19()) do
            if v135.NavigationKey == l_v123_0 then
                v133 = v135.Title or "Feature.Avatar.Label.Title.MyInventory";
                v98 = true;
            end;
            if v98 then
                break;
            end;
        end;
    end;
    if not v98 then
        v133 = "Feature.Avatar.Label.Title.MyInventory";
    end;
    v98 = false;
    v131.itemScreenTitle = v133;
    l_l_useLocalization_0_0 = l_l_useLocalization_0_0(v131);
    if l_FFlagAXMigrateSlotsSignals_0 then
        v131 = v127.screenLayout;
    else
        v133 = {
            isPortrait = v117, 
            itemView = v120
        };
        l_v123_0 = v133.isPortrait;
        local l_itemView_1 = v133.itemView;
        v131 = if l_v123_0 then if l_itemView_1 ~= l_ItemView_0.Off then l_ScreenLayout_0.PortraitItems else l_ScreenLayout_0.PortraitSlots else l_ScreenLayout_0.LandscapeSplit;
    end;
    v133 = if l_FFlagAXCustomizeMakeupSupport_0 then l_useSelector_0(v97) else nil;
    v2.useEffect(function() --[[ Line: 265 ]]
        -- upvalues: l_FFlagAXEnableEditorCategoryDeepLink_0 (ref), v103 (copy), l_NavigationParams_0 (ref), l_FFlagAXRootSlotBasedEditorFlag_0 (ref), v117 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v123 (ref), v12 (ref), v133 (copy), v124 (ref), v104 (copy), v21 (ref)
        if l_FFlagAXEnableEditorCategoryDeepLink_0 and v103.getParam(l_NavigationParams_0.category) ~= nil then
            return;
        else
            if l_FFlagAXRootSlotBasedEditorFlag_0 and v117 and (not l_FFlagAXCustomizeMakeupSupport_0 or v123 == v12.Enums.Categories.All or v133 == 1) then
                if l_FFlagAXCustomizeMakeupSupport_0 then
                    v124(v12.Enums.Categories.Avatars);
                end;
                v104(v21(2, nil));
            end;
            return;
        end;
    end, if l_FFlagAXCustomizeMakeupSupport_0 then {
        v117, 
        v123, 
        v133
    } else {
        v117
    });
    if l_FFlagAXEnableEditorCategoryDeepLink_0 then
        l_v123_0 = v2.useCallback(function(v137, v138) --[[ Line: 295 ]]
            -- upvalues: v19 (ref), v124 (ref), v104 (copy), v20 (ref), v106 (copy), v12 (ref), v126 (ref)
            local v139 = false;
            local v140 = v137 and v19()[v137];
            if not v140 or not v140.NavigationKey then
                return;
            else
                v124(v140.NavigationKey);
                v104(v20(v137, v138, v106));
                local v141 = if v138 and v140.Subcategories and v140.Subcategories[v138] then v140.Subcategories[v138].NavigationKey else nil;
                if v141 then
                    local v142 = v12.Constants.SlotEditorCategories[v140.NavigationKey];
                    if v142 and v142.slots then
                        local v143;
                        for v144, v145 in v142.slots do
                            if v145.editorSubcategory == v141 then
                                v143 = v144;
                                v139 = true;
                            end;
                            if v139 then
                                break;
                            end;
                        end;
                        if not v139 then
                            v143 = nil;
                        end;
                        v139 = false;
                        if v143 then
                            v126(v143);
                        end;
                    end;
                end;
                return;
            end;
        end, {
            v104, 
            v106
        });
        local v146 = v103.getParam(l_NavigationParams_0.category);
        local v147 = v103.getParam(l_NavigationParams_0.subcategory);
        local l_v146_0 = v146 --[[ copy: 29 -> 44 ]];
        local l_l_v123_0_0 = l_v123_0 --[[ copy: 28 -> 45 ]];
        local l_v147_0 = v147 --[[ copy: 30 -> 46 ]];
        v2.useEffect(function() --[[ Line: 321 ]]
            -- upvalues: l_v146_0 (copy), l_l_v123_0_0 (copy), l_v147_0 (copy)
            if l_v146_0 == nil then
                return;
            else
                l_l_v123_0_0(l_v146_0, l_v147_0);
                return;
            end;
        end, {
            v146, 
            v147, 
            l_v123_0
        });
    end;
    l_v123_0 = if l_FFlagAXMigrateSlotsSignals_0 then nil else v2.useCallback(function() --[[ Line: 331 ]]
        -- upvalues: v19 (ref), l_AvatarEditorCategories_0 (ref), v104 (copy), v20 (ref), v106 (copy), v22 (ref), v105 (copy), v103 (copy)
        for _, v152 in (v19()) do
            if v152.NavigationKey == l_AvatarEditorCategories_0.All then
                v104(v20(v152.Category, nil, v106));
                break;
            end;
        end;
        v104(v22(v105, v103.state.routeName));
    end, {
        v104, 
        v105, 
        v103.state.routeName, 
        v106
    });
    local v155 = if l_FFlagAXMigrateSlotsSignals_0 then nil else v2.useCallback(function() --[[ Line: 345 ]]
        -- upvalues: v102 (copy), l_AvatarScreen_0 (ref), v103 (copy), l_NavigationParams_0 (ref), l_ItemView_0 (ref), l_v123_0 (copy), v63 (ref), v121 (copy), v122 (copy), v104 (copy), v15 (ref), v24 (ref), v105 (copy), v17 (ref)
        local v153 = v102.current.name == l_AvatarScreen_0.LookDetails;
        v103.navigate(l_AvatarScreen_0.AvatarEditor, {
            [l_NavigationParams_0.itemView] = l_ItemView_0.Off
        });
        if v153 then
            v103.navigate(l_AvatarScreen_0.LookDetails);
        end;
        l_v123_0();
        if v63 and v121 == l_AvatarScreen_0.CatalogSearch and v121 ~= v102.opaque.name then
            if v122 and v122.searchParams then
                local v154 = {
                    searchKeyword = v122.searchParams.searchKeyword, 
                    isKeywordSuggestionEnabled = true
                };
                v104(v15(v103, v154));
            end;
        elseif v121 and v121 ~= v102.opaque.name then
            v103.navigate(v121);
        end;
        v104(v24(v105, v103.state.routeName, v17.None));
    end, {
        l_v123_0, 
        v103, 
        v121
    });
    local v156 = v2.useMemo(function() --[[ Line: 376 ]]
        -- upvalues: v2 (ref), v39 (ref), v103 (copy), v102 (copy)
        return v2.createElement(v39, {
            navigation = v103, 
            avatarRoute = v102
        });
    end, {
        v103, 
        v102, 
        v131, 
        v123, 
        l_l_useLocalization_0_0, 
        v120
    });
    local v161 = v2.useCallback(function(v157) --[[ Line: 383 ]]
        -- upvalues: l_FFlagAXResetAvatarButton_0 (ref), v113 (copy), v53 (ref), v2 (ref), v8 (ref), v99 (copy), l_UndoRedoBar_0 (ref), l_SaveButton_0 (ref), v42 (ref)
        local v158 = not l_FFlagAXResetAvatarButton_0 and (not (v157.showUndoRedo ~= nil) or v157.showUndoRedo);
        local v159 = v157.showSaveButton ~= nil and v157.showSaveButton;
        local v160 = if v113 then v53.ActionBar.ActionBarHeight + v53.ActionBar.ActionBarPadding else 0;
        return v2.createElement(v8.View, {
            tag = "col anchor-bottom-left auto-xy size-full-0", 
            Position = UDim2.new(0, 0, 1, v99.Radius.Medium), 
            padding = {
                bottom = UDim.new(0, v160)
            }, 
            ZIndex = 2
        }, {
            SceneButtons = v2.createElement(v8.View, {
                tag = "auto-xy size-full-0", 
                padding = {
                    left = UDim.new(0, v99.Size.Size_500), 
                    bottom = UDim.new(0, v99.Size.Size_400), 
                    right = UDim.new(0, v99.Size.Size_500)
                }
            }, {
                BottomLeftButtons = v2.createElement(v8.View, {
                    tag = "auto-xy", 
                    Position = UDim2.fromScale(0, 0)
                }, {
                    UndoRedoBar = v158 and v2.createElement(l_UndoRedoBar_0)
                }), 
                BottomRightButtons = v2.createElement(v8.View, {
                    tag = "auto-xy anchor-top-right", 
                    Position = UDim2.fromScale(1, 0)
                }, {
                    SaveButton = v159 and v2.createElement(l_SaveButton_0)
                })
            }), 
            SlotsContainer = v2.createElement(v42)
        });
    end, {
        v113
    });
    if v57() then
        v2.useEffect(function() --[[ Line: 432 ]]
            -- upvalues: l_sendAXCounterV2_0 (ref), v52 (ref)
            l_sendAXCounterV2_0(v52.Counter.TopLevelPageInitialView.SlotBasedEditor);
        end, {});
    end;
    if l_FFlagAXEnableEnhancedAvatarHeadsFtux_0 then
        l_useEnhancedAvatarHeadsFtux_0();
    end;
    if v58 then
        v2.useEffect(function() --[[ Line: 442 ]]
            -- upvalues: v13 (ref), v61 (ref), v60 (ref), l_AppUserLayers_0 (ref)
            v13.logLayerExposure(if v61 then v60() else l_AppUserLayers_0.AvatarExperienceUAAllViews);
        end, {});
    end;
    if v59 then
        v2.useEffect(function() --[[ Line: 452 ]]
            -- upvalues: v13 (ref), v70 (ref)
            v13.logLayerExposure(v70);
        end, {});
    end;
    if l_FFlagAXCustomizeMakeupSupport_0 then
        v2.useEffect(function() --[[ Line: 460 ]]
            -- upvalues: v102 (copy), l_AvatarScreen_0 (ref), v104 (copy), v23 (ref)
            if v102.opaque.name == l_AvatarScreen_0.AvatarEditor then
                v104(v23());
            end;
        end, {
            v102.opaque.name
        });
    end;
    local l_createElement_0 = v2.createElement;
    local l_Frame_0 = l_Focusable_0.Frame;
    local v164 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v100
    };
    local v165 = {};
    local l_createElement_1 = v2.createElement;
    local l_Provider_0 = l_SlotBasedEditorContext_0.Provider;
    local v168 = {
        value = if l_FFlagAXMigrateSlotsSignals_0 then v127 else {
            handleExitPortraitItems = v155, 
            itemView = v120, 
            slotCategory = v123, 
            setSlotCategory = v124, 
            screenLayout = v131, 
            slotIndex = v125, 
            setSlotIndex = v126, 
            categoryInventoryStores = if not v55() or l_FFlagAXAvatarEditorStoresContext_0 then nil else v107, 
            sortAndFiltersStore = if not v56() or l_FFlagAXAvatarEditorStoresContext_0 then nil else v108
        }
    };
    local v169 = {};
    local l_createElement_2 = v2.createElement;
    local l_v40_0 = v40;
    local v172 = {
        bottomBarEnabled = false, 
        showControlBar = true, 
        showRobuxBalance = true
    };
    local v173 = true;
    if v131 ~= l_ScreenLayout_0.PortraitItems then
        v173 = v131 == l_ScreenLayout_0.LandscapeSplit;
    end;
    v172.showUndoRedo = v173;
    v172.showSaveButton = v131 == l_ScreenLayout_0.PortraitItems;
    v172.allowAdaptiveScrolling = v131 ~= l_ScreenLayout_0.PortraitSlots;
    v172.isSceneFullView = v118;
    v172.isUIFullView = v119;
    v172.topBar = v156;
    v172.multiTryOnBottomBarRef = v101;
    v172.disableScrollViewBindings = if l_FFlagAXSlotsPeekViewScrollFix_0 then v109 else nil;
    v172.sceneUi = if not (not l_FFlagAXSlotsDesktopRedesign_0 and v131 == l_ScreenLayout_0.LandscapeSplit) or v118 then nil else v161({
        showUndoRedo = false
    });
    v169.AvatarExperienceView = l_createElement_2(l_v40_0, v172, {
        Inventory = (not (v131 ~= l_ScreenLayout_0.LandscapeSplit) or v131 == l_ScreenLayout_0.PortraitItems) and v2.createElement(v41, {
            updateDisableScrollView = if l_FFlagAXSlotsPeekViewScrollFix_0 then v110 else nil
        }), 
        SlotsContainer = if not (v131 == l_ScreenLayout_0.PortraitSlots) or v118 then nil else v161({})
    });
    v165.SlotBasedEditorContext = l_createElement_1(l_Provider_0, v168, v169);
    v165.OnFocusExperimentExposureLogger = if l_FFlagAXSlotsDesignUpdatesExposureLogging_0 then v2.createElement(v45, {
        ixpTests = {}, 
        flagIXPTestLayers = if l_FFlagAXSlotsDesignUpdatesExposureLogging_0 then {
            if l_FFlagAXSlotsDesignUpdatesExposureLogging_0 then l_FStringAXSlotsDesignUpdatesExposureLayer_0 else nil
        } else nil
    }) else nil;
    return l_createElement_0(l_Frame_0, v164, v165);
end));