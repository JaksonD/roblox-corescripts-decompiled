local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.SignalsReact);
local v5 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.BatchUnequipByAssetType);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.NormalizeAvatar);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_useSlotBasedEditorContext_0 = v11.Context.useSlotBasedEditorContext;
local l_Constants_0 = v11.Constants;
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local l_buildSlots_0 = v11.Utils.buildSlots;
local l_buildBodySlotViewportProps_0 = v11.Utils.buildBodySlotViewportProps;
local l_AvatarEditorSubcategories_0 = v11.Enums.AvatarEditorSubcategories;
local l_SlotCircularGradientFrame_0 = v11.Components.SlotCircularGradientFrame;
local l_Categories_0 = v11.Enums.Categories;
local l_ClearAllButton_0 = v11.Components.ClearAllButton;
local v21 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v22 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_SlotItemCardThumbnail_0 = v11.Components.SlotItemCardThumbnail;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v28 = require(script.Parent.Parent.Parent.Services.Analytics);
local v29 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v30 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v31 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local l_getAssetTypesByCategory_0 = v11.Utils.getAssetTypesByCategory;
local l_useSlotItemCardBreakpoints_0 = v11.Hooks.useSlotItemCardBreakpoints;
local _ = require(script.Parent.Parent.SlotNavigation);
local _ = require(script.Parent.Parent.SlotSubNavigation);
local _ = require(script.Parent.Slots);
local l_ItemView_0 = v11.Enums.ItemView;
local l_NavigationParams_0 = v11.Enums.NavigationParams;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useAvatarRoute_0 = v21.AvatarRoute.Hooks.useAvatarRoute;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v42 = require(l_Modules_0.AvatarExperience.Common.Components.Looks.LookViewport);
local l_SlotType_0 = v11.Enums.SlotType;
local v44 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableClearAllConfirmationPrompt);
local l_FFlagAXEditorSubcategoryFilters_0 = v22.FFlagAXEditorSubcategoryFilters;
local v46 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixCheckOnEquippedAssets);
local v47 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXImproveSlotBasedEditorPerformance);
local l_FFlagAXSlotsScrollAway_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsScrollAway;
local l_FFlagAXSlotsDesktopCrashFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopCrashFix;
local l_FFlagAXSlotBasedEditorCategoryTooltip_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotBasedEditorCategoryTooltip;
local l_FFlagAXSlotsDesktopRedesign_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign;
local l_FFlagAXCustomizeMakeupSupport_0 = v22.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXMigrateSlotsSignals_0 = v22.FFlagAXMigrateSlotsSignals;
local l_FFlagAXSlotsDisableScrollAwayOnLandscape_0 = v22.FFlagAXSlotsDisableScrollAwayOnLandscape;
local l_FFlagAXFixLookLinkToCustomize_0 = v22.FFlagAXFixLookLinkToCustomize;
local v56 = game:DefineFastFlag("AXSlotCategoriesNilCheck", false);
local function v63(v57, v58) --[[ Line: 92 ]] --[[ Name: buildStringsToLocalize ]]
    -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy), l_SlotType_0 (copy)
    local v59 = {};
    for _, v61 in v57 do
        if l_FFlagAXCustomizeMakeupSupport_0 and v61.slotType == l_SlotType_0.LayeredSlot then
            for v62 = 1, v61.layerLimit do
                v59[v61.nameTranslationKey .. "_" .. v62] = {
                    v61.nameTranslationKey; 
                    layerIndex = v62
                };
            end;
        else
            v59[v61.nameTranslationKey] = v61.nameTranslationKey;
        end;
    end;
    v59[v58] = v58;
    return v59;
end;
local function v71(v64) --[[ Line: 111 ]] --[[ Name: getCategoryIndices ]]
    -- upvalues: v31 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy)
    for v65, v66 in (v31()) do
        if v66.Subcategories then
            for v67, v68 in v66.Subcategories do
                if v68.NavigationKey == v64 then
                    return v65, v67, nil;
                elseif l_FFlagAXEditorSubcategoryFilters_0 and v68.SubcategoryFilters then
                    for v69, v70 in v68.SubcategoryFilters do
                        if v70.NavigationKey == v64 then
                            return v65, v67, v69;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return nil, nil, nil;
end;
local function v78(v72, v73) --[[ Line: 134 ]] --[[ Name: shallowEqual ]]
    if v72 == v73 then
        return true;
    elseif type(v72) ~= "table" or type(v73) ~= "table" then
        return false;
    else
        for v74, v75 in v72 do
            if v73[v74] ~= v75 then
                return false;
            end;
        end;
        for v76, _ in v73 do
            if v72[v76] == nil then
                return false;
            end;
        end;
        return true;
    end;
end;
local v79 = nil;
local v80 = nil;
if l_FFlagAXCustomizeMakeupSupport_0 then
    v79 = function(v81) --[[ Line: 162 ]]
        return v81.AvatarExperience.AvatarEditor.Categories.category;
    end;
    v80 = function(v82) --[[ Line: 165 ]]
        return v82.AvatarExperience.AvatarEditor.Categories.subcategory;
    end;
end;
return function(v83) --[[ Line: 170 ]] --[[ Name: useSlotProps ]]
    -- upvalues: l_useSlotBasedEditorContext_0 (copy), l_useDispatch_0 (copy), v29 (copy), v27 (copy), v28 (copy), l_useTokens_0 (copy), v5 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v2 (copy), l_useSelector_0 (copy), l_DeviceOrientationMode_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v79 (ref), v80 (ref), l_useSlotItemCardBreakpoints_0 (copy), v46 (copy), v47 (copy), v3 (copy), l_FFlagAXMigrateSlotsSignals_0 (copy), v4 (copy), l_buildSlots_0 (copy), l_Constants_0 (copy), l_useLocalization_0 (copy), v63 (copy), v78 (copy), v31 (copy), v56 (copy), v71 (copy), v30 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy), l_FFlagAXSlotsDesktopRedesign_0 (copy), v8 (copy), l_FFlagAXSlotsScrollAway_0 (copy), l_Categories_0 (copy), l_FFlagAXSlotsDesktopCrashFix_0 (copy), l_FFlagAXSlotsDisableScrollAwayOnLandscape_0 (copy), l_FFlagAXSlotBasedEditorCategoryTooltip_0 (copy), l_FFlagAXFixLookLinkToCustomize_0 (copy), v44 (copy), l_getAssetTypesByCategory_0 (copy), v7 (copy), l_AvatarScreen_0 (copy), l_ClearAllButton_0 (copy), l_AvatarEditorSubcategories_0 (copy), v42 (copy), l_buildBodySlotViewportProps_0 (copy), v14 (copy), l_SlotCircularGradientFrame_0 (copy), l_SlotItemCardThumbnail_0 (copy), l_SlotType_0 (copy), l_NavigationParams_0 (copy), l_ItemView_0 (copy)
    local v84 = l_useSlotBasedEditorContext_0();
    local v85 = l_useDispatch_0();
    local v86 = v29(v27);
    local v87 = v29(v28);
    local v88 = l_useTokens_0();
    local v89 = v29(v5);
    local v90 = l_useNavigation_0();
    local v91 = l_useAvatarRoute_0();
    local v92 = v2.useRef(nil);
    local v94 = l_useSelector_0(function(v93) --[[ Line: 180 ]]
        -- upvalues: l_DeviceOrientationMode_0 (ref)
        return v93.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    end);
    local v95 = nil;
    local v96 = nil;
    if l_FFlagAXCustomizeMakeupSupport_0 then
        v95 = l_useSelector_0(v79);
        v96 = l_useSelector_0(v80);
    end;
    local v97 = l_useSlotItemCardBreakpoints_0(v92.current and v92.current.AbsoluteSize);
    local v99 = l_useSelector_0(function(v98) --[[ Line: 194 ]]
        -- upvalues: v46 (ref)
        if v46 then
            return v98.AvatarExperience.AvatarEditor.Character.EquippedAssets or {};
        else
            return v98.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        end;
    end);
    local v100 = nil;
    if v47 then
        local v102 = l_useSelector_0(function(v101) --[[ Line: 204 ]]
            return v101.AvatarExperience.AvatarEditor.Character.BodyColor3s;
        end);
        local l_v102_0 = v102 --[[ copy: 16 -> 34 ]];
        v100 = v2.useMemo(function() --[[ Line: 207 ]]
            -- upvalues: v3 (ref), l_v102_0 (copy)
            return v3.Dictionary.values(l_v102_0);
        end, {
            v102
        });
    else
        v100 = l_useSelector_0(function(v104) --[[ Line: 211 ]]
            -- upvalues: v3 (ref)
            return v3.Dictionary.values(v104.AvatarExperience.AvatarEditor.Character.BodyColor3s);
        end);
    end;
    assert(v84 ~= nil, "useSlotProps must be used within a SlotBasedEditorContextProvider");
    local v105 = if l_FFlagAXMigrateSlotsSignals_0 then v4.useSignalState(v84.signalStore.getSlotCategory) else v84.slotCategory;
    local v106 = if l_FFlagAXMigrateSlotsSignals_0 then v84.signalStore.setSlotCategory else v84.setSlotCategory;
    local v107 = if l_FFlagAXMigrateSlotsSignals_0 then v4.useSignalState(v84.signalStore.getSlotIndex) else v84.slotIndex;
    local v108 = if l_FFlagAXMigrateSlotsSignals_0 then v84.signalStore.setSlotIndex else v84.setSlotIndex;
    local v109 = nil;
    v109 = if l_FFlagAXMigrateSlotsSignals_0 then v4.useSignalState(v84.signalStore.getSlots) else if v47 then v2.useMemo(function() --[[ Line: 239 ]]
        -- upvalues: l_buildSlots_0 (ref), l_Constants_0 (ref), v105 (copy), v99 (copy)
        return l_buildSlots_0(l_Constants_0.SlotEditorCategories[v105].slots, v99);
    end, {
        v105, 
        v99
    }) else l_buildSlots_0(l_Constants_0.SlotEditorCategories[v105].slots, v99);
    local l_nameTranslationKey_0 = l_Constants_0.SlotEditorCategories[v105].nameTranslationKey;
    local v111 = nil;
    if v47 then
        local v112 = l_useLocalization_0((v63(v109, l_nameTranslationKey_0)));
        local v113 = v2.useRef(nil);
        local l_v113_0 = v113 --[[ copy: 24 -> 32 ]];
        local l_v112_0 = v112 --[[ copy: 23 -> 33 ]];
        v111 = v2.useMemo(function() --[[ Line: 257 ]]
            -- upvalues: l_v113_0 (copy), v78 (ref), l_v112_0 (copy)
            if l_v113_0.current and v78(l_v112_0, l_v113_0.current) then
                return l_v113_0.current;
            else
                l_v113_0.current = l_v112_0;
                return l_v112_0;
            end;
        end, {
            v112
        });
    else
        v111 = l_useLocalization_0((v63(v109, l_nameTranslationKey_0)));
    end;
    local v116 = if l_FFlagAXCustomizeMakeupSupport_0 then v31() else nil;
    local v126 = if not l_FFlagAXCustomizeMakeupSupport_0 then nil else v2.useCallback(function(v117) --[[ Line: 274 ]]
        -- upvalues: v56 (ref), v116 (copy), v95 (ref), v96 (ref), v71 (ref), v85 (copy), v30 (ref), v86 (copy), l_FFlagAXEditorSubcategoryFilters_0 (ref)
        local v118 = nil;
        local v119 = nil;
        local v120 = nil;
        if v117.eligibleSubcategories ~= nil and (not v56 or v116[v95].Subcategories ~= nil) then
            if v117.currentAssetType == nil then
                if table.find(v117.eligibleSubcategories, v116[v95].Subcategories[v96].NavigationKey) then
                    v118 = v95;
                    v119 = v96;
                    v120 = nil;
                end;
            else
                for v121, v122 in v116[v95].Subcategories do
                    if table.find(v117.eligibleSubcategories, v122.NavigationKey) and v122.AssetTypeIdStrings ~= nil and table.find(v122.AssetTypeIdStrings, (tostring(v117.currentAssetType.Value))) then
                        v118 = v95;
                        v119 = v121;
                        v120 = nil;
                        break;
                    end;
                end;
            end;
        end;
        if v118 == nil then
            local v123, v124, v125 = v71(v117.editorSubcategory);
            v118 = v123;
            v119 = v124;
            v120 = v125;
        end;
        if v118 and v119 then
            v85(v30(v118, v119, v86, if l_FFlagAXEditorSubcategoryFilters_0 then v120 else nil));
        end;
    end, {
        v95, 
        v96, 
        v85, 
        v86
    });
    local v129 = v2.useCallback(function(v127, v128) --[[ Line: 332 ]]
        -- upvalues: v106 (copy), v108 (copy), l_FFlagAXSlotsDesktopRedesign_0 (ref), v94 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v85 (copy), v30 (ref), v86 (copy), v8 (ref)
        v106(v127);
        v108(1);
        if l_FFlagAXSlotsDesktopRedesign_0 or v94 or l_FFlagAXCustomizeMakeupSupport_0 then
            v85(v30(v128.index + 1, 1, v86));
        end;
        if l_FFlagAXCustomizeMakeupSupport_0 then
            v85(v8());
        end;
    end, {
        v106, 
        v108, 
        v85, 
        if not v47 or l_FFlagAXSlotsDesktopRedesign_0 then nil else v94, 
        if v47 then v86 else nil
    });
    local v131 = v2.useMemo(function() --[[ Line: 353 ]]
        -- upvalues: v97 (copy), l_Constants_0 (ref), v129 (copy), l_FFlagAXSlotsScrollAway_0 (ref), v105 (copy), l_FFlagAXSlotsDesktopRedesign_0 (ref), l_Categories_0 (ref), v94 (copy), l_FFlagAXSlotsDesktopCrashFix_0 (ref)
        local v130 = {
            navHeight = v97.navHeight, 
            categories = table.clone(l_Constants_0.SlotEditorCategories), 
            onSlotCategorySelected = v129, 
            enableSnapToSelectedItem = true, 
            LayoutOrder = l_FFlagAXSlotsScrollAway_0 and 2 or nil, 
            slotCategory = v105
        };
        if l_FFlagAXSlotsDesktopRedesign_0 then
            v130.categories[l_Categories_0.All].hide = v94;
        end;
        if l_FFlagAXSlotsDesktopCrashFix_0 then
            v130.categories[l_Categories_0.Avatars].hide = not (l_FFlagAXSlotsDesktopRedesign_0 or v94);
            v130.categories[l_Categories_0.Emotes].hide = not (l_FFlagAXSlotsDesktopRedesign_0 or v94);
            return v130;
        else
            if not l_FFlagAXSlotsDesktopRedesign_0 and not v94 then
                v130.categories[l_Categories_0.Avatars] = nil;
                v130.categories[l_Categories_0.Emotes] = nil;
            end;
            return v130;
        end;
    end, {
        v94, 
        v105, 
        if v47 then v97 else nil, 
        if v47 then v129 else nil
    });
    local v132 = if l_FFlagAXSlotsDisableScrollAwayOnLandscape_0 then not v94 or l_Constants_0.SlotEditorCategories[v105].disableScrollAway else nil;
    local v133 = nil;
    if l_FFlagAXSlotBasedEditorCategoryTooltip_0 then
        local v135 = l_useSelector_0(function(v134) --[[ Line: 394 ]]
            return v134.AvatarExperience.Common.FullView.AvatarEditor;
        end);
        local l_v135_0 = v135 --[[ copy: 29 -> 31 ]];
        v133 = v2.useMemo(function() --[[ Line: 399 ]]
            -- upvalues: l_v135_0 (copy), v83 (copy), l_FFlagAXSlotsDisableScrollAwayOnLandscape_0 (ref), v132 (copy)
            local v137 = tostring(l_v135_0) ~= "FullView.SceneFullView";
            local v138 = true;
            if v83.slotSubNavigationFill ~= 1 then
                v138 = true;
                if v83.slotSubNavigationFill ~= nil then
                    v138 = l_FFlagAXSlotsDisableScrollAwayOnLandscape_0 and v132;
                end;
            end;
            return v137 and v138;
        end, {
            v135, 
            v83.slotSubNavigationFill, 
            if l_FFlagAXSlotsDisableScrollAwayOnLandscape_0 then v132 else nil
        });
    end;
    if l_FFlagAXCustomizeMakeupSupport_0 then
        v2.useEffect(function() --[[ Line: 416 ]]
            -- upvalues: l_FFlagAXFixLookLinkToCustomize_0 (ref), v106 (copy), v116 (copy), v95 (ref), v107 (copy), v109 (ref), v96 (ref), v108 (copy)
            if l_FFlagAXFixLookLinkToCustomize_0 then
                v106(v116[v95].NavigationKey);
            end;
            if v116[v95].Subcategories ~= nil then
                if not l_FFlagAXFixLookLinkToCustomize_0 then
                    v106(v116[v95].NavigationKey);
                end;
                if v107 ~= nil and v109[v107] ~= nil and v109[v107].eligibleSubcategories ~= nil and table.find(v109[v107].eligibleSubcategories, v116[v95].Subcategories[v96].NavigationKey) then
                    return;
                else
                    for v139, v140 in v109 do
                        if if v140.eligibleSubcategories ~= nil then table.find(v140.eligibleSubcategories, v116[v95].Subcategories[v96].NavigationKey) else v140.editorSubcategory == v116[v95].Subcategories[v96].NavigationKey then
                            v108(v139);
                            return;
                        end;
                    end;
                end;
            end;
        end, {
            v95, 
            v96, 
            v108, 
            v106, 
            v116, 
            v109, 
            if l_FFlagAXFixLookLinkToCustomize_0 then v107 else nil
        });
    end;
    local v157 = v2.useMemo(function() --[[ Line: 467 ]]
        -- upvalues: v105 (copy), v107 (copy), l_Constants_0 (ref), v97 (copy), l_FFlagAXSlotsScrollAway_0 (ref), v88 (copy), l_FFlagAXSlotBasedEditorCategoryTooltip_0 (ref), v133 (ref), l_Categories_0 (ref), v44 (ref), l_getAssetTypesByCategory_0 (ref), v109 (ref), v85 (copy), v7 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v108 (copy), v126 (copy), v90 (copy), l_AvatarScreen_0 (ref), v2 (ref), l_ClearAllButton_0 (ref), v89 (copy), l_AvatarEditorSubcategories_0 (ref), v42 (ref), l_buildBodySlotViewportProps_0 (ref), v14 (ref), v99 (copy), l_SlotCircularGradientFrame_0 (ref), v100 (ref), l_SlotItemCardThumbnail_0 (ref), l_SlotType_0 (ref), v111 (ref), l_FFlagAXMigrateSlotsSignals_0 (ref), v84 (copy), v87 (copy), v8 (ref), v91 (copy), l_NavigationParams_0 (ref), l_ItemView_0 (ref), v71 (ref), v30 (ref), v86 (copy), l_FFlagAXEditorSubcategoryFilters_0 (ref)
        local v141 = {
            slotCategory = v105, 
            slotIndex = v107, 
            index = l_Constants_0.SlotEditorCategories[v105].index, 
            slots = {}, 
            buttonPadding = v97.scrollingFramePadding.buttonPadding, 
            contentPadding = v97.scrollingFramePadding.contentPadding, 
            enableSnapToSelectedItem = v97.enableSnapToSelectedSlot, 
            margin = if l_FFlagAXSlotsScrollAway_0 then nil else {
                top = v88.Padding.Medium, 
                bottom = v88.Padding.Medium, 
                left = 0, 
                right = 0
            }, 
            enableIntroScroll = true, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            slotSubNavigationFrameHeight = if l_FFlagAXSlotsScrollAway_0 then v97.slotCardTotalHeight else nil, 
            canShowTooltip = if l_FFlagAXSlotBasedEditorCategoryTooltip_0 then v133 else nil
        };
        if v105 ~= l_Categories_0.Body then
            v141.clearAllButton = {
                onActivated = function() --[[ Line: 495 ]] --[[ Name: onActivated ]]
                    -- upvalues: v44 (ref), l_getAssetTypesByCategory_0 (ref), v105 (ref), v109 (ref), v85 (ref), v7 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), l_Constants_0 (ref), v108 (ref), v126 (ref), v90 (ref), l_AvatarScreen_0 (ref)
                    if v44 then
                        local function v143() --[[ Line: 497 ]]
                            -- upvalues: l_getAssetTypesByCategory_0 (ref), v105 (ref), v109 (ref), v85 (ref), v7 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), l_Constants_0 (ref), v108 (ref), v126 (ref)
                            local v142 = l_getAssetTypesByCategory_0(v105, v109);
                            if #v142 > 0 then
                                v85(v7(v142));
                            end;
                            if l_FFlagAXCustomizeMakeupSupport_0 and l_Constants_0.SlotEditorCategories[v105].resetSlotOnClearAll then
                                v108(1);
                                v126(v109[1]);
                            end;
                        end;
                        v90.navigate(l_AvatarScreen_0.SlotEditorClearAllConfirmationPrompt, {
                            slotCategory = v105, 
                            clearAll = v143
                        });
                        return;
                    else
                        local v144 = l_getAssetTypesByCategory_0(v105, v109);
                        if #v144 > 0 then
                            v85(v7(v144));
                        end;
                        return;
                    end;
                end, 
                renderHeaderSlot = function() --[[ Line: 523 ]] --[[ Name: renderHeaderSlot ]]
                    -- upvalues: v2 (ref), l_ClearAllButton_0 (ref)
                    return v2.createElement(l_ClearAllButton_0);
                end, 
                Size = v97.itemCardSize, 
                text = v89:Format("Feature.Avatar.Action.Clear")
            };
        end;
        for v145, v146 in v109 do
            table.insert(v141.slots, {
                renderHeaderSlot = function() --[[ Line: 533 ]] --[[ Name: renderHeaderSlot ]]
                    -- upvalues: v146 (copy), l_AvatarEditorSubcategories_0 (ref), v2 (ref), v42 (ref), l_buildBodySlotViewportProps_0 (ref), v14 (ref), v99 (ref), l_SlotCircularGradientFrame_0 (ref), v100 (ref), l_SlotItemCardThumbnail_0 (ref), v97 (ref)
                    if v146.editorSubcategory == l_AvatarEditorSubcategories_0.PurchasedCharacters then
                        return v2.createElement(v42, l_buildBodySlotViewportProps_0(v14.DefaultBodyColor3, v99));
                    elseif v146.editorSubcategory == l_AvatarEditorSubcategories_0.Skin then
                        return v2.createElement(l_SlotCircularGradientFrame_0, {
                            Colors = v100
                        });
                    elseif v146.editorSubcategory == l_AvatarEditorSubcategories_0.Build then
                        return v2.createElement(l_SlotItemCardThumbnail_0, {
                            icon = v146.icon, 
                            iconFrameStyles = v97.slotItemCardThumbnailStyles.iconFrameStyles, 
                            ignoredUrl = true
                        });
                    else
                        local v147 = false;
                        if table.find(v146.assetTypes, Enum.AvatarAssetType.Face) then
                            local v148 = v99[tostring(Enum.AvatarAssetType.DynamicHead.Value)];
                            if v148 ~= nil and next(v148) then
                                v147 = true;
                            end;
                        end;
                        return v2.createElement(l_SlotItemCardThumbnail_0, {
                            url = v146.thumbnailUrl, 
                            icon = v146.icon, 
                            enableThumbnailOverlay = v147, 
                            iconFrameStyles = v97.slotItemCardThumbnailStyles.iconFrameStyles
                        });
                    end;
                end, 
                BackgroundTransparency = if not (not v146.thumbnailUrl and v146.editorSubcategory ~= l_AvatarEditorSubcategories_0.Skin and v146.editorSubcategory ~= l_AvatarEditorSubcategories_0.Build) or v146.editorSubcategory == l_AvatarEditorSubcategories_0.PurchasedCharacters then nil else 1, 
                title = if l_FFlagAXCustomizeMakeupSupport_0 and v146.slotType == l_SlotType_0.LayeredSlot then v111[v146.nameTranslationKey .. "_" .. v146.layerIndex + 1] else v111[v146.nameTranslationKey], 
                Size = v97.itemCardSize, 
                isActive = v145 == if l_FFlagAXMigrateSlotsSignals_0 then v107 else v84.slotIndex, 
                editorSubcategory = v146.editorSubcategory, 
                slotType = if l_FFlagAXCustomizeMakeupSupport_0 then v146.slotType or l_SlotType_0.BaseSlot else nil, 
                onActivated = function() --[[ Line: 587 ]] --[[ Name: onActivated ]]
                    -- upvalues: v87 (ref), v146 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v145 (copy), v107 (ref), v108 (ref), v126 (ref), v109 (ref), v85 (ref), v8 (ref), v91 (ref), l_AvatarScreen_0 (ref), v90 (ref), l_NavigationParams_0 (ref), l_ItemView_0 (ref), v71 (ref), v30 (ref), v86 (ref), l_FFlagAXEditorSubcategoryFilters_0 (ref)
                    v87.slotClick(v146);
                    local v149 = nil;
                    local v150 = nil;
                    local v151 = nil;
                    if l_FFlagAXCustomizeMakeupSupport_0 then
                        if v146.deselectable and v145 == v107 then
                            v108(1);
                            v126(v109[1]);
                            v85(v8());
                            return;
                        else
                            v126(v146);
                            local v152 = v91.current.name == l_AvatarScreen_0.LookDetails;
                            v90.navigate(l_AvatarScreen_0.AvatarEditor, {
                                [l_NavigationParams_0.itemView] = l_ItemView_0.SlotItems
                            });
                            if v152 then
                                v90.navigate(l_AvatarScreen_0.LookDetails);
                            end;
                            if not v109[v145].deselectable or v145 ~= v107 then
                                v108(v145);
                                return;
                            end;
                        end;
                    else
                        if v149 == nil then
                            local v153, v154, v155 = v71(v146.editorSubcategory);
                            v149 = v153;
                            v150 = v154;
                            v151 = v155;
                        end;
                        if v149 and v150 then
                            v85(v30(v149, v150, v86, if l_FFlagAXEditorSubcategoryFilters_0 then v151 else nil));
                            local v156 = v91.current.name == l_AvatarScreen_0.LookDetails;
                            v90.navigate(l_AvatarScreen_0.AvatarEditor, {
                                [l_NavigationParams_0.itemView] = l_ItemView_0.SlotItems
                            });
                            if v156 then
                                v90.navigate(l_AvatarScreen_0.LookDetails);
                            end;
                            if not v109[v145].deselectable or v145 ~= v107 then
                                v108(v145);
                            end;
                        end;
                    end;
                end, 
                hide = if l_FFlagAXCustomizeMakeupSupport_0 then v146.hide else nil
            });
        end;
        return v141;
    end, {
        v107, 
        v105, 
        v88, 
        v111, 
        v85, 
        v87, 
        v86, 
        v90, 
        if v47 then v109 else nil, 
        if v47 then v97 else nil, 
        if v47 then v99 else nil, 
        if v47 then v100 else nil, 
        if v47 then v84 else nil, 
        if v47 then v91 else nil, 
        if v47 then v108 else nil, 
        if v47 then v89 else nil, 
        if l_FFlagAXSlotBasedEditorCategoryTooltip_0 then v133 else nil, 
        if l_FFlagAXCustomizeMakeupSupport_0 then v116 else nil
    });
    local v158 = 0;
    if l_FFlagAXSlotsScrollAway_0 then
        v158 = v97.navHeight;
        if #v157.slots > 0 then
            v158 = v158 + v97.slotCardTotalHeight;
        end;
    else
        v158 = v97.navigationFrameHeight;
        if #v157.slots == 0 then
            v158 = v158 - v97.itemCardSize.Height.Offset * 2;
        end;
    end;
    return {
        slotNavigationProps = v131, 
        slotSubNavigationProps = v157, 
        ref = v92, 
        navigationFrameHeight = v158, 
        slotSubNavigationFill = if l_FFlagAXSlotsDisableScrollAwayOnLandscape_0 then v83.slotSubNavigationFill or 1 else 1, 
        slotCardTotalHeight = v97.slotCardTotalHeight, 
        navHeight = v97.navHeight, 
        disableScrollAway = if l_FFlagAXSlotsDisableScrollAwayOnLandscape_0 then v132 else nil, 
        absoluteSizeChanged = if l_FFlagAXSlotsDisableScrollAwayOnLandscape_0 then v83.absoluteSizeChanged else nil
    };
end;