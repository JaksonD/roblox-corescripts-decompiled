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
local function v60(v54, v55) --[[ Line: 84 ]] --[[ Name: buildStringsToLocalize ]]
    -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy), l_SlotType_0 (copy)
    local v56 = {};
    for _, v58 in v54 do
        if l_FFlagAXCustomizeMakeupSupport_0 and v58.slotType == l_SlotType_0.LayeredSlot then
            for v59 = 1, v58.layerLimit do
                v56[v58.nameTranslationKey .. "_" .. v59] = {
                    v58.nameTranslationKey; 
                    layerIndex = v59
                };
            end;
        else
            v56[v58.nameTranslationKey] = v58.nameTranslationKey;
        end;
    end;
    v56[v55] = v55;
    return v56;
end;
local function v68(v61) --[[ Line: 103 ]] --[[ Name: getCategoryIndices ]]
    -- upvalues: v31 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy)
    for v62, v63 in (v31()) do
        if v63.Subcategories then
            for v64, v65 in v63.Subcategories do
                if v65.NavigationKey == v61 then
                    return v62, v64, nil;
                elseif l_FFlagAXEditorSubcategoryFilters_0 and v65.SubcategoryFilters then
                    for v66, v67 in v65.SubcategoryFilters do
                        if v67.NavigationKey == v61 then
                            return v62, v64, v66;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return nil, nil, nil;
end;
local function v75(v69, v70) --[[ Line: 126 ]] --[[ Name: shallowEqual ]]
    if v69 == v70 then
        return true;
    elseif type(v69) ~= "table" or type(v70) ~= "table" then
        return false;
    else
        for v71, v72 in v69 do
            if v70[v71] ~= v72 then
                return false;
            end;
        end;
        for v73, _ in v70 do
            if v69[v73] == nil then
                return false;
            end;
        end;
        return true;
    end;
end;
local v76 = nil;
local v77 = nil;
if l_FFlagAXCustomizeMakeupSupport_0 then
    v76 = function(v78) --[[ Line: 154 ]]
        return v78.AvatarExperience.AvatarEditor.Categories.category;
    end;
    v77 = function(v79) --[[ Line: 157 ]]
        return v79.AvatarExperience.AvatarEditor.Categories.subcategory;
    end;
end;
return function(v80) --[[ Line: 162 ]] --[[ Name: useSlotProps ]]
    -- upvalues: l_useSlotBasedEditorContext_0 (copy), l_useDispatch_0 (copy), v29 (copy), v27 (copy), v28 (copy), l_useTokens_0 (copy), v5 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v2 (copy), l_useSelector_0 (copy), l_DeviceOrientationMode_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v76 (ref), v77 (ref), l_useSlotItemCardBreakpoints_0 (copy), v46 (copy), v47 (copy), v3 (copy), l_FFlagAXMigrateSlotsSignals_0 (copy), v4 (copy), l_buildSlots_0 (copy), l_Constants_0 (copy), l_useLocalization_0 (copy), v60 (copy), v75 (copy), v31 (copy), v68 (copy), v30 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy), l_FFlagAXSlotsDesktopRedesign_0 (copy), v8 (copy), l_FFlagAXSlotsScrollAway_0 (copy), l_Categories_0 (copy), l_FFlagAXSlotsDesktopCrashFix_0 (copy), l_FFlagAXSlotBasedEditorCategoryTooltip_0 (copy), v44 (copy), l_getAssetTypesByCategory_0 (copy), v7 (copy), l_AvatarScreen_0 (copy), l_ClearAllButton_0 (copy), l_AvatarEditorSubcategories_0 (copy), v42 (copy), l_buildBodySlotViewportProps_0 (copy), v14 (copy), l_SlotCircularGradientFrame_0 (copy), l_SlotItemCardThumbnail_0 (copy), l_SlotType_0 (copy), l_NavigationParams_0 (copy), l_ItemView_0 (copy)
    local v81 = l_useSlotBasedEditorContext_0();
    local v82 = l_useDispatch_0();
    local v83 = v29(v27);
    local v84 = v29(v28);
    local v85 = l_useTokens_0();
    local v86 = v29(v5);
    local v87 = l_useNavigation_0();
    local v88 = l_useAvatarRoute_0();
    local v89 = v2.useRef(nil);
    local v91 = l_useSelector_0(function(v90) --[[ Line: 172 ]]
        -- upvalues: l_DeviceOrientationMode_0 (ref)
        return v90.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    end);
    local v92 = nil;
    local v93 = nil;
    if l_FFlagAXCustomizeMakeupSupport_0 then
        v92 = l_useSelector_0(v76);
        v93 = l_useSelector_0(v77);
    end;
    local v94 = l_useSlotItemCardBreakpoints_0(v89.current and v89.current.AbsoluteSize);
    local v96 = l_useSelector_0(function(v95) --[[ Line: 186 ]]
        -- upvalues: v46 (ref)
        if v46 then
            return v95.AvatarExperience.AvatarEditor.Character.EquippedAssets or {};
        else
            return v95.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        end;
    end);
    local v97 = nil;
    if v47 then
        local v99 = l_useSelector_0(function(v98) --[[ Line: 196 ]]
            return v98.AvatarExperience.AvatarEditor.Character.BodyColor3s;
        end);
        local l_v99_0 = v99 --[[ copy: 16 -> 33 ]];
        v97 = v2.useMemo(function() --[[ Line: 199 ]]
            -- upvalues: v3 (ref), l_v99_0 (copy)
            return v3.Dictionary.values(l_v99_0);
        end, {
            v99
        });
    else
        v97 = l_useSelector_0(function(v101) --[[ Line: 203 ]]
            -- upvalues: v3 (ref)
            return v3.Dictionary.values(v101.AvatarExperience.AvatarEditor.Character.BodyColor3s);
        end);
    end;
    assert(v81 ~= nil, "useSlotProps must be used within a SlotBasedEditorContextProvider");
    local v102 = if l_FFlagAXMigrateSlotsSignals_0 then v4.useSignalState(v81.signalStore.getSlotCategory) else v81.slotCategory;
    local v103 = if l_FFlagAXMigrateSlotsSignals_0 then v81.signalStore.setSlotCategory else v81.setSlotCategory;
    local v104 = if l_FFlagAXMigrateSlotsSignals_0 then v4.useSignalState(v81.signalStore.getSlotIndex) else v81.slotIndex;
    local v105 = if l_FFlagAXMigrateSlotsSignals_0 then v81.signalStore.setSlotIndex else v81.setSlotIndex;
    local v106 = nil;
    v106 = if l_FFlagAXMigrateSlotsSignals_0 then v4.useSignalState(v81.signalStore.getSlots) else if v47 then v2.useMemo(function() --[[ Line: 231 ]]
        -- upvalues: l_buildSlots_0 (ref), l_Constants_0 (ref), v102 (copy), v96 (copy)
        return l_buildSlots_0(l_Constants_0.SlotEditorCategories[v102].slots, v96);
    end, {
        v102, 
        v96
    }) else l_buildSlots_0(l_Constants_0.SlotEditorCategories[v102].slots, v96);
    local l_nameTranslationKey_0 = l_Constants_0.SlotEditorCategories[v102].nameTranslationKey;
    local v108 = nil;
    if v47 then
        local v109 = l_useLocalization_0((v60(v106, l_nameTranslationKey_0)));
        local v110 = v2.useRef(nil);
        local l_v110_0 = v110 --[[ copy: 24 -> 31 ]];
        local l_v109_0 = v109 --[[ copy: 23 -> 32 ]];
        v108 = v2.useMemo(function() --[[ Line: 249 ]]
            -- upvalues: l_v110_0 (copy), v75 (ref), l_v109_0 (copy)
            if l_v110_0.current and v75(l_v109_0, l_v110_0.current) then
                return l_v110_0.current;
            else
                l_v110_0.current = l_v109_0;
                return l_v109_0;
            end;
        end, {
            v109
        });
    else
        v108 = l_useLocalization_0((v60(v106, l_nameTranslationKey_0)));
    end;
    local v113 = if l_FFlagAXCustomizeMakeupSupport_0 then v31() else nil;
    local v123 = if not l_FFlagAXCustomizeMakeupSupport_0 then nil else v2.useCallback(function(v114) --[[ Line: 266 ]]
        -- upvalues: v113 (copy), v92 (ref), v93 (ref), v68 (ref), v82 (copy), v30 (ref), v83 (copy), l_FFlagAXEditorSubcategoryFilters_0 (ref)
        local v115 = nil;
        local v116 = nil;
        local v117 = nil;
        if v114.eligibleSubcategories ~= nil then
            if v114.currentAssetType == nil then
                if table.find(v114.eligibleSubcategories, v113[v92].Subcategories[v93].NavigationKey) then
                    v115 = v92;
                    v116 = v93;
                    v117 = nil;
                end;
            else
                for v118, v119 in v113[v92].Subcategories do
                    if table.find(v114.eligibleSubcategories, v119.NavigationKey) and v119.AssetTypeIdStrings ~= nil and table.find(v119.AssetTypeIdStrings, (tostring(v114.currentAssetType.Value))) then
                        v115 = v92;
                        v116 = v118;
                        v117 = nil;
                        break;
                    end;
                end;
            end;
        end;
        if v115 == nil then
            local v120, v121, v122 = v68(v114.editorSubcategory);
            v115 = v120;
            v116 = v121;
            v117 = v122;
        end;
        if v115 and v116 then
            v82(v30(v115, v116, v83, if l_FFlagAXEditorSubcategoryFilters_0 then v117 else nil));
        end;
    end, {
        v92, 
        v93, 
        v82, 
        v83
    });
    local v126 = v2.useCallback(function(v124, v125) --[[ Line: 321 ]]
        -- upvalues: v103 (copy), v105 (copy), l_FFlagAXSlotsDesktopRedesign_0 (ref), v91 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v82 (copy), v30 (ref), v83 (copy), v8 (ref)
        v103(v124);
        v105(1);
        if l_FFlagAXSlotsDesktopRedesign_0 or v91 or l_FFlagAXCustomizeMakeupSupport_0 then
            v82(v30(v125.index + 1, 1, v83));
        end;
        if l_FFlagAXCustomizeMakeupSupport_0 then
            v82(v8());
        end;
    end, {
        v103, 
        v105, 
        v82, 
        if not v47 or l_FFlagAXSlotsDesktopRedesign_0 then nil else v91, 
        if v47 then v83 else nil
    });
    local v128 = v2.useMemo(function() --[[ Line: 342 ]]
        -- upvalues: v94 (copy), l_Constants_0 (ref), v126 (copy), l_FFlagAXSlotsScrollAway_0 (ref), v102 (copy), l_FFlagAXSlotsDesktopRedesign_0 (ref), l_Categories_0 (ref), v91 (copy), l_FFlagAXSlotsDesktopCrashFix_0 (ref)
        local v127 = {
            navHeight = v94.navHeight, 
            categories = table.clone(l_Constants_0.SlotEditorCategories), 
            onSlotCategorySelected = v126, 
            enableSnapToSelectedItem = true, 
            LayoutOrder = l_FFlagAXSlotsScrollAway_0 and 2 or nil, 
            slotCategory = v102
        };
        if l_FFlagAXSlotsDesktopRedesign_0 then
            v127.categories[l_Categories_0.All].hide = v91;
        end;
        if l_FFlagAXSlotsDesktopCrashFix_0 then
            v127.categories[l_Categories_0.Avatars].hide = not (l_FFlagAXSlotsDesktopRedesign_0 or v91);
            v127.categories[l_Categories_0.Emotes].hide = not (l_FFlagAXSlotsDesktopRedesign_0 or v91);
            return v127;
        else
            if not l_FFlagAXSlotsDesktopRedesign_0 and not v91 then
                v127.categories[l_Categories_0.Avatars] = nil;
                v127.categories[l_Categories_0.Emotes] = nil;
            end;
            return v127;
        end;
    end, {
        v91, 
        v102, 
        if v47 then v94 else nil, 
        if v47 then v126 else nil
    });
    local v129 = nil;
    if l_FFlagAXSlotBasedEditorCategoryTooltip_0 then
        local v131 = l_useSelector_0(function(v130) --[[ Line: 379 ]]
            return v130.AvatarExperience.Common.FullView.AvatarEditor;
        end);
        local l_v131_0 = v131 --[[ copy: 28 -> 30 ]];
        v129 = v2.useMemo(function() --[[ Line: 383 ]]
            -- upvalues: l_v131_0 (copy), v80 (copy)
            local v133 = tostring(l_v131_0) ~= "FullView.SceneFullView";
            local v134 = true;
            if v80.slotSubNavigationFill ~= 1 then
                v134 = v80.slotSubNavigationFill == nil;
            end;
            return v133 and v134;
        end, {
            v131, 
            v80.slotSubNavigationFill
        });
    end;
    if l_FFlagAXCustomizeMakeupSupport_0 then
        v2.useEffect(function() --[[ Line: 392 ]]
            -- upvalues: v113 (copy), v92 (ref), v103 (copy), v104 (copy), v106 (ref), v93 (ref), v105 (copy)
            if v113[v92].Subcategories ~= nil then
                v103(v113[v92].NavigationKey);
                if v104 ~= nil and v106[v104] ~= nil and v106[v104].eligibleSubcategories ~= nil and table.find(v106[v104].eligibleSubcategories, v113[v92].Subcategories[v93].NavigationKey) then
                    return;
                else
                    for v135, v136 in v106 do
                        if if v136.eligibleSubcategories ~= nil then table.find(v136.eligibleSubcategories, v113[v92].Subcategories[v93].NavigationKey) else v136.editorSubcategory == v113[v92].Subcategories[v93].NavigationKey then
                            v105(v135);
                            return;
                        end;
                    end;
                end;
            end;
        end, {
            v92, 
            v93, 
            v105, 
            v103, 
            v113, 
            v106
        });
    end;
    local v153 = v2.useMemo(function() --[[ Line: 437 ]]
        -- upvalues: v102 (copy), v104 (copy), l_Constants_0 (ref), v94 (copy), l_FFlagAXSlotsScrollAway_0 (ref), v85 (copy), l_FFlagAXSlotBasedEditorCategoryTooltip_0 (ref), v129 (ref), l_Categories_0 (ref), v44 (ref), l_getAssetTypesByCategory_0 (ref), v106 (ref), v82 (copy), v7 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v105 (copy), v123 (copy), v87 (copy), l_AvatarScreen_0 (ref), v2 (ref), l_ClearAllButton_0 (ref), v86 (copy), l_AvatarEditorSubcategories_0 (ref), v42 (ref), l_buildBodySlotViewportProps_0 (ref), v14 (ref), v96 (copy), l_SlotCircularGradientFrame_0 (ref), v97 (ref), l_SlotItemCardThumbnail_0 (ref), l_SlotType_0 (ref), v108 (ref), l_FFlagAXMigrateSlotsSignals_0 (ref), v81 (copy), v84 (copy), v8 (ref), v88 (copy), l_NavigationParams_0 (ref), l_ItemView_0 (ref), v68 (ref), v30 (ref), v83 (copy), l_FFlagAXEditorSubcategoryFilters_0 (ref)
        local v137 = {
            slotCategory = v102, 
            slotIndex = v104, 
            index = l_Constants_0.SlotEditorCategories[v102].index, 
            slots = {}, 
            buttonPadding = v94.scrollingFramePadding.buttonPadding, 
            contentPadding = v94.scrollingFramePadding.contentPadding, 
            enableSnapToSelectedItem = v94.enableSnapToSelectedSlot, 
            margin = if l_FFlagAXSlotsScrollAway_0 then nil else {
                top = v85.Padding.Medium, 
                bottom = v85.Padding.Medium, 
                left = 0, 
                right = 0
            }, 
            enableIntroScroll = true, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            slotSubNavigationFrameHeight = if l_FFlagAXSlotsScrollAway_0 then v94.slotCardTotalHeight else nil, 
            canShowTooltip = if l_FFlagAXSlotBasedEditorCategoryTooltip_0 then v129 else nil
        };
        if v102 ~= l_Categories_0.Body then
            v137.clearAllButton = {
                onActivated = function() --[[ Line: 465 ]] --[[ Name: onActivated ]]
                    -- upvalues: v44 (ref), l_getAssetTypesByCategory_0 (ref), v102 (ref), v106 (ref), v82 (ref), v7 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), l_Constants_0 (ref), v105 (ref), v123 (ref), v87 (ref), l_AvatarScreen_0 (ref)
                    if v44 then
                        local function v139() --[[ Line: 467 ]]
                            -- upvalues: l_getAssetTypesByCategory_0 (ref), v102 (ref), v106 (ref), v82 (ref), v7 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), l_Constants_0 (ref), v105 (ref), v123 (ref)
                            local v138 = l_getAssetTypesByCategory_0(v102, v106);
                            if #v138 > 0 then
                                v82(v7(v138));
                            end;
                            if l_FFlagAXCustomizeMakeupSupport_0 and l_Constants_0.SlotEditorCategories[v102].resetSlotOnClearAll then
                                v105(1);
                                v123(v106[1]);
                            end;
                        end;
                        v87.navigate(l_AvatarScreen_0.SlotEditorClearAllConfirmationPrompt, {
                            slotCategory = v102, 
                            clearAll = v139
                        });
                        return;
                    else
                        local v140 = l_getAssetTypesByCategory_0(v102, v106);
                        if #v140 > 0 then
                            v82(v7(v140));
                        end;
                        return;
                    end;
                end, 
                renderHeaderSlot = function() --[[ Line: 493 ]] --[[ Name: renderHeaderSlot ]]
                    -- upvalues: v2 (ref), l_ClearAllButton_0 (ref)
                    return v2.createElement(l_ClearAllButton_0);
                end, 
                Size = v94.itemCardSize, 
                text = v86:Format("Feature.Avatar.Action.Clear")
            };
        end;
        for v141, v142 in v106 do
            table.insert(v137.slots, {
                renderHeaderSlot = function() --[[ Line: 503 ]] --[[ Name: renderHeaderSlot ]]
                    -- upvalues: v142 (copy), l_AvatarEditorSubcategories_0 (ref), v2 (ref), v42 (ref), l_buildBodySlotViewportProps_0 (ref), v14 (ref), v96 (ref), l_SlotCircularGradientFrame_0 (ref), v97 (ref), l_SlotItemCardThumbnail_0 (ref), v94 (ref)
                    if v142.editorSubcategory == l_AvatarEditorSubcategories_0.PurchasedCharacters then
                        return v2.createElement(v42, l_buildBodySlotViewportProps_0(v14.DefaultBodyColor3, v96));
                    elseif v142.editorSubcategory == l_AvatarEditorSubcategories_0.Skin then
                        return v2.createElement(l_SlotCircularGradientFrame_0, {
                            Colors = v97
                        });
                    elseif v142.editorSubcategory == l_AvatarEditorSubcategories_0.Build then
                        return v2.createElement(l_SlotItemCardThumbnail_0, {
                            icon = v142.icon, 
                            iconFrameStyles = v94.slotItemCardThumbnailStyles.iconFrameStyles, 
                            ignoredUrl = true
                        });
                    else
                        local v143 = false;
                        if table.find(v142.assetTypes, Enum.AvatarAssetType.Face) then
                            local v144 = v96[tostring(Enum.AvatarAssetType.DynamicHead.Value)];
                            if v144 ~= nil and next(v144) then
                                v143 = true;
                            end;
                        end;
                        return v2.createElement(l_SlotItemCardThumbnail_0, {
                            url = v142.thumbnailUrl, 
                            icon = v142.icon, 
                            enableThumbnailOverlay = v143, 
                            iconFrameStyles = v94.slotItemCardThumbnailStyles.iconFrameStyles
                        });
                    end;
                end, 
                BackgroundTransparency = if not (not v142.thumbnailUrl and v142.editorSubcategory ~= l_AvatarEditorSubcategories_0.Skin and v142.editorSubcategory ~= l_AvatarEditorSubcategories_0.Build) or v142.editorSubcategory == l_AvatarEditorSubcategories_0.PurchasedCharacters then nil else 1, 
                title = if l_FFlagAXCustomizeMakeupSupport_0 and v142.slotType == l_SlotType_0.LayeredSlot then v108[v142.nameTranslationKey .. "_" .. v142.layerIndex + 1] else v108[v142.nameTranslationKey], 
                Size = v94.itemCardSize, 
                isActive = v141 == if l_FFlagAXMigrateSlotsSignals_0 then v104 else v81.slotIndex, 
                editorSubcategory = v142.editorSubcategory, 
                slotType = if l_FFlagAXCustomizeMakeupSupport_0 then v142.slotType or l_SlotType_0.BaseSlot else nil, 
                onActivated = function() --[[ Line: 557 ]] --[[ Name: onActivated ]]
                    -- upvalues: v84 (ref), v142 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v141 (copy), v104 (ref), v105 (ref), v123 (ref), v106 (ref), v82 (ref), v8 (ref), v88 (ref), l_AvatarScreen_0 (ref), v87 (ref), l_NavigationParams_0 (ref), l_ItemView_0 (ref), v68 (ref), v30 (ref), v83 (ref), l_FFlagAXEditorSubcategoryFilters_0 (ref)
                    v84.slotClick(v142);
                    local v145 = nil;
                    local v146 = nil;
                    local v147 = nil;
                    if l_FFlagAXCustomizeMakeupSupport_0 then
                        if v142.deselectable and v141 == v104 then
                            v105(1);
                            v123(v106[1]);
                            v82(v8());
                            return;
                        else
                            v123(v142);
                            local v148 = v88.current.name == l_AvatarScreen_0.LookDetails;
                            v87.navigate(l_AvatarScreen_0.AvatarEditor, {
                                [l_NavigationParams_0.itemView] = l_ItemView_0.SlotItems
                            });
                            if v148 then
                                v87.navigate(l_AvatarScreen_0.LookDetails);
                            end;
                            if not v106[v141].deselectable or v141 ~= v104 then
                                v105(v141);
                                return;
                            end;
                        end;
                    else
                        if v145 == nil then
                            local v149, v150, v151 = v68(v142.editorSubcategory);
                            v145 = v149;
                            v146 = v150;
                            v147 = v151;
                        end;
                        if v145 and v146 then
                            v82(v30(v145, v146, v83, if l_FFlagAXEditorSubcategoryFilters_0 then v147 else nil));
                            local v152 = v88.current.name == l_AvatarScreen_0.LookDetails;
                            v87.navigate(l_AvatarScreen_0.AvatarEditor, {
                                [l_NavigationParams_0.itemView] = l_ItemView_0.SlotItems
                            });
                            if v152 then
                                v87.navigate(l_AvatarScreen_0.LookDetails);
                            end;
                            if not v106[v141].deselectable or v141 ~= v104 then
                                v105(v141);
                            end;
                        end;
                    end;
                end, 
                hide = if l_FFlagAXCustomizeMakeupSupport_0 then v142.hide else nil
            });
        end;
        return v137;
    end, {
        v104, 
        v102, 
        v85, 
        v108, 
        v82, 
        v84, 
        v83, 
        v87, 
        if v47 then v106 else nil, 
        if v47 then v94 else nil, 
        if v47 then v96 else nil, 
        if v47 then v97 else nil, 
        if v47 then v81 else nil, 
        if v47 then v88 else nil, 
        if v47 then v105 else nil, 
        if v47 then v86 else nil, 
        if l_FFlagAXSlotBasedEditorCategoryTooltip_0 then v129 else nil, 
        if l_FFlagAXCustomizeMakeupSupport_0 then v113 else nil
    });
    local v154 = 0;
    if l_FFlagAXSlotsScrollAway_0 then
        v154 = v94.navHeight;
        if #v153.slots > 0 then
            v154 = v154 + v94.slotCardTotalHeight;
        end;
    else
        v154 = v94.navigationFrameHeight;
        if #v153.slots == 0 then
            v154 = v154 - v94.itemCardSize.Height.Offset * 2;
        end;
    end;
    return {
        slotNavigationProps = v128, 
        slotSubNavigationProps = v153, 
        ref = v89, 
        navigationFrameHeight = v154, 
        slotSubNavigationFill = 1, 
        slotCardTotalHeight = v94.slotCardTotalHeight, 
        navHeight = v94.navHeight
    };
end;