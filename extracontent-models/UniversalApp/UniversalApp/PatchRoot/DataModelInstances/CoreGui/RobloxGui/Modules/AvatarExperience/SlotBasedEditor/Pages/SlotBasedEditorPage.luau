local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.Foundation);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceControlBar);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local v12 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.NavigateToSearch);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v16 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v17 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetCategoryAndSubcategory);
local v21 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.NormalizeAvatar);
local v23 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v24 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v26 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Utils.createInventoryStoresFromCategories);
local l_createSortAndFiltersStore_0 = v11.Stores.createSortAndFiltersStore;
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useAvatarRoute_0 = v8.AvatarRoute.Hooks.useAvatarRoute;
local v33 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v35 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local l_useTokens_0 = v7.Hooks.useTokens;
local v37 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarEditorTopBar);
local v38 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceView);
local v39 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarNavigationItemsView);
local v40 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.Slots.SlotsContainer);
local l_UndoRedoBar_0 = v9.UndoRedoBar;
local l_SaveButton_0 = v10.Components.SaveButton;
local v43 = require(l_Modules_0.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger);
local l_SlotBasedEditorContext_0 = v11.Context.SlotBasedEditorContext;
local l_ScreenLayout_0 = v11.Enums.ScreenLayout;
local l_ItemView_0 = v11.Enums.ItemView;
local l_AvatarEditorCategories_0 = v11.Enums.AvatarEditorCategories;
local l_NavigationParams_0 = v11.Enums.NavigationParams;
local l_AvatarScreen_0 = v8.Enums.AvatarScreen;
local v50 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v51 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v52 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v53 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList);
local v54 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters);
local v55 = require(l_Modules_0.AvatarExperience.Flags.GetFlagAXEnableInitialTopLevelPageCounter);
local v56 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXCustomizeOverhaulEditorExposure);
local v57 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXModerationFeatureExposure);
local v58 = require(l_Modules_0.AvatarExperience.Flags.GetFStringAXCatalogAndEditorExposureLayerName);
local v59 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXCatalogAndEditorExposureUseFStringLayer);
local l_FFlagAXAvatarEditorStoresContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext;
local v61 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixCatalogSearchRedirect);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXSlotsPeekViewScrollFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsPeekViewScrollFix;
local l_FFlagAXResetAvatarButton_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXResetAvatarButton;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXSlotsDesktopRedesign_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign;
local v67 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableEnhancedAvatarHeadsFtux);
local v68 = game:DefineFastString("AXModerationFeatureLayer", "AvatarExperience.UA.CustomizeView");
local l_FFlagAXCustomizeMakeupSupport_0 = v52.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXEnableEditorCategoryDeepLink_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXEnableEditorCategoryDeepLink;
local l_FFlagAXSlotsDesignUpdatesExposureLogging_0 = v52.FFlagAXSlotsDesignUpdatesExposureLogging;
local l_FStringAXSlotsDesignUpdatesExposureLayer_0 = v52.FStringAXSlotsDesignUpdatesExposureLayer;
local v73 = require(l_Modules_0.AvatarExperience.AvatarEditor.Hooks.useEnhancedAvatarHeadsFtux);
local _ = function(v74, v75) --[[ Line: 116 ]] --[[ Name: getCategoryTitle ]]
    -- upvalues: l_ItemView_0 (copy), v18 (copy)
    if v75 == l_ItemView_0.SlotItems then
        for _, v77 in (v18()) do
            if v77.NavigationKey == v74 then
                return v77.Title or "Feature.Avatar.Label.Title.MyInventory";
            end;
        end;
    end;
    return "Feature.Avatar.Label.Title.MyInventory";
end;
local function _(v79) --[[ Line: 128 ]] --[[ Name: getScreenLayout ]]
    -- upvalues: l_ItemView_0 (copy), l_ScreenLayout_0 (copy)
    local l_isPortrait_0 = v79.isPortrait;
    local l_itemView_0 = v79.itemView;
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
local function v84(v83) --[[ Line: 147 ]]
    -- upvalues: v6 (copy)
    return not v6.isEmpty(v83.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems);
end;
local function _(v85, v86) --[[ Line: 151 ]] --[[ Name: getSubcategoryNavKey ]]
    if v86 and v85.Subcategories and v85.Subcategories[v86] then
        return v85.Subcategories[v86].NavigationKey;
    else
        return nil;
    end;
end;
local function _(v88, v89) --[[ Line: 158 ]] --[[ Name: getSlotIndexForSubcategoryKey ]]
    for v90, v91 in v88 do
        if v91.editorSubcategory == v89 then
            return v90;
        end;
    end;
    return nil;
end;
return (v35(function() --[[ Line: 167 ]] --[[ Name: SlotBasedEditorPage ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v2 (copy), v3 (copy), l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), v33 (copy), v24 (copy), v25 (copy), v53 (copy), v26 (copy), v54 (copy), l_createSortAndFiltersStore_0 (copy), l_FFlagAXSlotsPeekViewScrollFix_0 (copy), l_useSelector_0 (copy), v84 (copy), v17 (copy), l_DeviceOrientationMode_0 (copy), v16 (copy), l_NavigationParams_0 (copy), l_ItemView_0 (copy), v61 (copy), l_FFlagAXSlotsDesktopRedesign_0 (copy), v11 (copy), l_useLocalization_0 (copy), v18 (copy), l_ScreenLayout_0 (copy), l_FFlagAXEnableEditorCategoryDeepLink_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v20 (copy), v19 (copy), l_AvatarEditorCategories_0 (copy), v21 (copy), l_AvatarScreen_0 (copy), v14 (copy), v23 (copy), v37 (copy), l_FFlagAXResetAvatarButton_0 (copy), v51 (copy), v7 (copy), l_UndoRedoBar_0 (copy), l_SaveButton_0 (copy), v40 (copy), v55 (copy), l_sendAXCounterV2_0 (copy), v50 (copy), v67 (copy), v73 (copy), v56 (copy), v12 (copy), v59 (copy), v58 (copy), l_AppUserLayers_0 (copy), v57 (copy), v68 (copy), v22 (copy), l_Focusable_0 (copy), l_SlotBasedEditorContext_0 (copy), l_FFlagAXAvatarEditorStoresContext_0 (copy), v38 (copy), v39 (copy), l_FFlagAXSlotsDesignUpdatesExposureLogging_0 (copy), v43 (copy), l_FStringAXSlotsDesignUpdatesExposureLayer_0 (copy)
    local v93 = false;
    local v94 = l_useTokens_0();
    local v95 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v2.useRef(v3.createFocusController()).current;
    local v96 = v2.useRef(nil);
    local v97 = l_useAvatarRoute_0();
    local v98 = l_useNavigation_0();
    local v99 = l_useDispatch_0();
    local v100 = v33(v24);
    local v101 = v33(v25);
    local v102 = if v53() then v2.useMemo(v26, {}) else nil;
    local v103 = if v54() then v2.useMemo(l_createSortAndFiltersStore_0, {}) else nil;
    local v104 = nil;
    local v105 = nil;
    if l_FFlagAXSlotsPeekViewScrollFix_0 then
        local v106, v107 = v2.useBinding(false);
        v104 = v106;
        v105 = v107;
    end;
    local v108 = l_useSelector_0(v84);
    local v110 = l_useSelector_0(function(v109) --[[ Line: 194 ]]
        -- upvalues: v17 (ref), v97 (copy)
        return v17(v109, v97.opaque.name);
    end);
    local v112 = l_useSelector_0(function(v111) --[[ Line: 197 ]]
        -- upvalues: l_DeviceOrientationMode_0 (ref)
        return v111.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    end);
    local v113 = v110 == v16.SceneFullView;
    local v114 = v110 == v16.UIFullView;
    local v115 = v98.getParam(l_NavigationParams_0.itemView) or v112 and l_ItemView_0.SlotItems or not v112 and l_ItemView_0.Off;
    local v116 = v98.getParam(l_NavigationParams_0.fromScreen);
    local v117 = if v61 then v98.getParam(l_NavigationParams_0.params) else nil;
    local v118, v119 = v2.useState(if l_FFlagAXSlotsDesktopRedesign_0 then if v112 then v11.Enums.Categories.Avatars else v11.Enums.Categories.All else if v112 then v11.Enums.Categories.Avatars else v11.Enums.Categories.Body);
    local v120, v121 = v2.useState(1);
    local l_l_useLocalization_0_0 = l_useLocalization_0;
    local v123 = {};
    local v124;
    if v115 == l_ItemView_0.SlotItems then
        for _, v126 in (v18()) do
            if v126.NavigationKey == v118 then
                v124 = v126.Title or "Feature.Avatar.Label.Title.MyInventory";
                v93 = true;
            end;
            if v93 then
                break;
            end;
        end;
    end;
    if not v93 then
        v124 = "Feature.Avatar.Label.Title.MyInventory";
    end;
    v93 = false;
    v123.itemScreenTitle = v124;
    l_l_useLocalization_0_0 = l_l_useLocalization_0_0(v123);
    v124 = {
        isPortrait = v112, 
        itemView = v115
    };
    local l_isPortrait_1 = v124.isPortrait;
    local l_itemView_1 = v124.itemView;
    v123 = if l_isPortrait_1 then if l_itemView_1 ~= l_ItemView_0.Off then l_ScreenLayout_0.PortraitItems else l_ScreenLayout_0.PortraitSlots else l_ScreenLayout_0.LandscapeSplit;
    v2.useEffect(function() --[[ Line: 233 ]]
        -- upvalues: l_FFlagAXEnableEditorCategoryDeepLink_0 (ref), v98 (copy), l_NavigationParams_0 (ref), l_FFlagAXRootSlotBasedEditorFlag_0 (ref), v112 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v118 (copy), v11 (ref), v119 (copy), v99 (copy), v20 (ref)
        if l_FFlagAXEnableEditorCategoryDeepLink_0 and v98.getParam(l_NavigationParams_0.category) ~= nil then
            return;
        else
            if l_FFlagAXRootSlotBasedEditorFlag_0 and v112 and (not l_FFlagAXCustomizeMakeupSupport_0 or v118 == v11.Enums.Categories.All) then
                if l_FFlagAXCustomizeMakeupSupport_0 then
                    v119(v11.Enums.Categories.Avatars);
                end;
                v99(v20(2, nil));
            end;
            return;
        end;
    end, {
        v112
    });
    if l_FFlagAXEnableEditorCategoryDeepLink_0 then
        v124 = v2.useCallback(function(v129, v130) --[[ Line: 258 ]]
            -- upvalues: v18 (ref), v119 (copy), v99 (copy), v19 (ref), v101 (copy), v11 (ref), v121 (copy)
            local v131 = false;
            local v132 = v129 and v18()[v129];
            if not v132 or not v132.NavigationKey then
                return;
            else
                v119(v132.NavigationKey);
                v99(v19(v129, v130, v101));
                local v133 = if v130 and v132.Subcategories and v132.Subcategories[v130] then v132.Subcategories[v130].NavigationKey else nil;
                if v133 then
                    local v134 = v11.Constants.SlotEditorCategories[v132.NavigationKey];
                    if v134 and v134.slots then
                        local v135;
                        for v136, v137 in v134.slots do
                            if v137.editorSubcategory == v133 then
                                v135 = v136;
                                v131 = true;
                            end;
                            if v131 then
                                break;
                            end;
                        end;
                        if not v131 then
                            v135 = nil;
                        end;
                        v131 = false;
                        if v135 then
                            v121(v135);
                        end;
                    end;
                end;
                return;
            end;
        end, {
            v99, 
            v101
        });
        l_isPortrait_1 = v98.getParam(l_NavigationParams_0.category);
        l_itemView_1 = v98.getParam(l_NavigationParams_0.subcategory);
        local l_l_isPortrait_1_0 = l_isPortrait_1 --[[ copy: 27 -> 42 ]];
        local l_v124_0 = v124 --[[ copy: 26 -> 43 ]];
        local l_l_itemView_1_0 = l_itemView_1 --[[ copy: 28 -> 44 ]];
        v2.useEffect(function() --[[ Line: 284 ]]
            -- upvalues: l_l_isPortrait_1_0 (copy), l_v124_0 (copy), l_l_itemView_1_0 (copy)
            if l_l_isPortrait_1_0 == nil then
                return;
            else
                l_v124_0(l_l_isPortrait_1_0, l_l_itemView_1_0);
                return;
            end;
        end, {
            l_isPortrait_1, 
            l_itemView_1, 
            v124
        });
    end;
    v124 = v2.useCallback(function() --[[ Line: 292 ]]
        -- upvalues: v18 (ref), l_AvatarEditorCategories_0 (ref), v99 (copy), v19 (ref), v101 (copy), v21 (ref), v100 (copy), v98 (copy)
        for _, v142 in (v18()) do
            if v142.NavigationKey == l_AvatarEditorCategories_0.All then
                v99(v19(v142.Category, nil, v101));
                break;
            end;
        end;
        v99(v21(v100, v98.state.routeName));
    end, {
        v99, 
        v100, 
        v98.state.routeName, 
        v101
    });
    l_isPortrait_1 = v2.useCallback(function() --[[ Line: 304 ]]
        -- upvalues: v97 (copy), l_AvatarScreen_0 (ref), v98 (copy), l_NavigationParams_0 (ref), l_ItemView_0 (ref), v124 (copy), v61 (ref), v116 (copy), v117 (copy), v99 (copy), v14 (ref), v23 (ref), v100 (copy), v16 (ref)
        local v143 = v97.current.name == l_AvatarScreen_0.LookDetails;
        v98.navigate(l_AvatarScreen_0.AvatarEditor, {
            [l_NavigationParams_0.itemView] = l_ItemView_0.Off
        });
        if v143 then
            v98.navigate(l_AvatarScreen_0.LookDetails);
        end;
        v124();
        if v61 and v116 == l_AvatarScreen_0.CatalogSearch and v116 ~= v97.opaque.name then
            if v117 and v117.searchParams then
                local v144 = {
                    searchKeyword = v117.searchParams.searchKeyword, 
                    isKeywordSuggestionEnabled = true
                };
                v99(v14(v98, v144));
            end;
        elseif v116 and v116 ~= v97.opaque.name then
            v98.navigate(v116);
        end;
        v99(v23(v100, v98.state.routeName, v16.None));
    end, {
        v124, 
        v98, 
        v116
    });
    l_itemView_1 = v2.useMemo(function() --[[ Line: 335 ]]
        -- upvalues: v2 (ref), v37 (ref), v98 (copy), v97 (copy)
        return v2.createElement(v37, {
            navigation = v98, 
            avatarRoute = v97
        });
    end, {
        v98, 
        v97, 
        v123, 
        v118, 
        l_l_useLocalization_0_0, 
        v115
    });
    local v149 = v2.useCallback(function(v145) --[[ Line: 342 ]]
        -- upvalues: l_FFlagAXResetAvatarButton_0 (ref), v108 (copy), v51 (ref), v2 (ref), v7 (ref), v94 (copy), l_UndoRedoBar_0 (ref), l_SaveButton_0 (ref), v40 (ref)
        local v146 = not l_FFlagAXResetAvatarButton_0 and (not (v145.showUndoRedo ~= nil) or v145.showUndoRedo);
        local v147 = v145.showSaveButton ~= nil and v145.showSaveButton;
        local v148 = if v108 then v51.ActionBar.ActionBarHeight + v51.ActionBar.ActionBarPadding else 0;
        return v2.createElement(v7.View, {
            tag = "col anchor-bottom-left auto-xy size-full-0", 
            Position = UDim2.new(0, 0, 1, v94.Radius.Medium), 
            padding = {
                bottom = UDim.new(0, v148)
            }, 
            ZIndex = 2
        }, {
            SceneButtons = v2.createElement(v7.View, {
                tag = "auto-xy size-full-0", 
                padding = {
                    left = UDim.new(0, v94.Size.Size_500), 
                    bottom = UDim.new(0, v94.Size.Size_400), 
                    right = UDim.new(0, v94.Size.Size_500)
                }
            }, {
                BottomLeftButtons = v2.createElement(v7.View, {
                    tag = "auto-xy", 
                    Position = UDim2.fromScale(0, 0)
                }, {
                    UndoRedoBar = v146 and v2.createElement(l_UndoRedoBar_0)
                }), 
                BottomRightButtons = v2.createElement(v7.View, {
                    tag = "auto-xy anchor-top-right", 
                    Position = UDim2.fromScale(1, 0)
                }, {
                    SaveButton = v147 and v2.createElement(l_SaveButton_0)
                })
            }), 
            SlotsContainer = v2.createElement(v40)
        });
    end, {
        v108
    });
    if v55() then
        v2.useEffect(function() --[[ Line: 391 ]]
            -- upvalues: l_sendAXCounterV2_0 (ref), v50 (ref)
            l_sendAXCounterV2_0(v50.Counter.TopLevelPageInitialView.SlotBasedEditor);
        end, {});
    end;
    if v67 then
        v73();
    end;
    if v56 then
        v2.useEffect(function() --[[ Line: 401 ]]
            -- upvalues: v12 (ref), v59 (ref), v58 (ref), l_AppUserLayers_0 (ref)
            v12.logLayerExposure(if v59 then v58() else l_AppUserLayers_0.AvatarExperienceUAAllViews);
        end, {});
    end;
    if v57 then
        v2.useEffect(function() --[[ Line: 411 ]]
            -- upvalues: v12 (ref), v68 (ref)
            v12.logLayerExposure(v68);
        end, {});
    end;
    if l_FFlagAXCustomizeMakeupSupport_0 then
        v2.useEffect(function() --[[ Line: 419 ]]
            -- upvalues: v97 (copy), l_AvatarScreen_0 (ref), v99 (copy), v22 (ref)
            if v97.opaque.name == l_AvatarScreen_0.AvatarEditor then
                v99(v22());
            end;
        end, {
            v97.opaque.name
        });
    end;
    local l_createElement_0 = v2.createElement;
    local l_Frame_0 = l_Focusable_0.Frame;
    local v152 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v95
    };
    local v153 = {};
    local l_createElement_1 = v2.createElement;
    local l_Provider_0 = l_SlotBasedEditorContext_0.Provider;
    local v156 = {
        value = {
            handleExitPortraitItems = l_isPortrait_1, 
            itemView = v115, 
            slotCategory = v118, 
            setSlotCategory = v119, 
            screenLayout = v123, 
            slotIndex = v120, 
            setSlotIndex = v121, 
            categoryInventoryStores = if not v53() or l_FFlagAXAvatarEditorStoresContext_0 then nil else v102, 
            sortAndFiltersStore = if not v54() or l_FFlagAXAvatarEditorStoresContext_0 then nil else v103
        }
    };
    local v157 = {};
    local l_createElement_2 = v2.createElement;
    local l_v38_0 = v38;
    local v160 = {
        bottomBarEnabled = false, 
        showControlBar = true, 
        showRobuxBalance = true
    };
    local v161 = true;
    if v123 ~= l_ScreenLayout_0.PortraitItems then
        v161 = v123 == l_ScreenLayout_0.LandscapeSplit;
    end;
    v160.showUndoRedo = v161;
    v160.showSaveButton = v123 == l_ScreenLayout_0.PortraitItems;
    v160.allowAdaptiveScrolling = v123 ~= l_ScreenLayout_0.PortraitSlots;
    v160.isSceneFullView = v113;
    v160.isUIFullView = v114;
    v160.topBar = l_itemView_1;
    v160.multiTryOnBottomBarRef = v96;
    v160.disableScrollViewBindings = if l_FFlagAXSlotsPeekViewScrollFix_0 then v104 else nil;
    v160.sceneUi = if not (not l_FFlagAXSlotsDesktopRedesign_0 and v123 == l_ScreenLayout_0.LandscapeSplit) or v113 then nil else v149({
        showUndoRedo = false
    });
    v157.AvatarExperienceView = l_createElement_2(l_v38_0, v160, {
        Inventory = (not (v123 ~= l_ScreenLayout_0.LandscapeSplit) or v123 == l_ScreenLayout_0.PortraitItems) and v2.createElement(v39, {
            updateDisableScrollView = if l_FFlagAXSlotsPeekViewScrollFix_0 then v105 else nil
        }), 
        SlotsContainer = if not (v123 == l_ScreenLayout_0.PortraitSlots) or v113 then nil else v149({})
    });
    v153.SlotBasedEditorContext = l_createElement_1(l_Provider_0, v156, v157);
    v153.OnFocusExperimentExposureLogger = if l_FFlagAXSlotsDesignUpdatesExposureLogging_0 then v2.createElement(v43, {
        ixpTests = {}, 
        flagIXPTestLayers = if l_FFlagAXSlotsDesignUpdatesExposureLogging_0 then {
            if l_FFlagAXSlotsDesignUpdatesExposureLogging_0 then l_FStringAXSlotsDesignUpdatesExposureLayer_0 else nil
        } else nil
    }) else nil;
    return l_createElement_0(l_Frame_0, v152, v153);
end));