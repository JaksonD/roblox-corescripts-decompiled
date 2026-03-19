local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.BatchUnequipByAssetType);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.NormalizeAvatar);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_useSlotBasedEditorContext_0 = v10.Context.useSlotBasedEditorContext;
local l_Constants_0 = v10.Constants;
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local l_buildSlots_0 = v10.Utils.buildSlots;
local l_buildBodySlotViewportProps_0 = v10.Utils.buildBodySlotViewportProps;
local l_AvatarEditorSubcategories_0 = v10.Enums.AvatarEditorSubcategories;
local l_SlotCircularGradientFrame_0 = v10.Components.SlotCircularGradientFrame;
local l_Categories_0 = v10.Enums.Categories;
local l_ClearAllButton_0 = v10.Components.ClearAllButton;
local v20 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v21 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_SlotItemCardThumbnail_0 = v10.Components.SlotItemCardThumbnail;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v27 = require(script.Parent.Parent.Parent.Services.Analytics);
local v28 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v30 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local l_getAssetTypesByCategory_0 = v10.Utils.getAssetTypesByCategory;
local l_useSlotItemCardBreakpoints_0 = v10.Hooks.useSlotItemCardBreakpoints;
local _ = require(script.Parent.Parent.SlotNavigation);
local _ = require(script.Parent.Parent.SlotSubNavigation);
local _ = require(script.Parent.Slots);
local l_ItemView_0 = v10.Enums.ItemView;
local l_NavigationParams_0 = v10.Enums.NavigationParams;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useAvatarRoute_0 = v20.AvatarRoute.Hooks.useAvatarRoute;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v41 = require(l_Modules_0.AvatarExperience.Common.Components.Looks.LookViewport);
local l_SlotType_0 = v10.Enums.SlotType;
local v43 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableClearAllConfirmationPrompt);
local l_FFlagAXEditorSubcategoryFilters_0 = v21.FFlagAXEditorSubcategoryFilters;
local v45 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixCheckOnEquippedAssets);
local v46 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXImproveSlotBasedEditorPerformance);
local l_FFlagAXSlotsScrollAway_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsScrollAway;
local l_FFlagAXSlotsDesktopCrashFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopCrashFix;
local l_FFlagAXSlotBasedEditorCategoryTooltip_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotBasedEditorCategoryTooltip;
local l_FFlagAXSlotsDesktopRedesign_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign;
local l_FFlagAXCustomizeMakeupSupport_0 = v21.FFlagAXCustomizeMakeupSupport;
local function v58(v52, v53) --[[ Line: 79 ]] --[[ Name: buildStringsToLocalize ]]
    -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy), l_SlotType_0 (copy)
    local v54 = {};
    for _, v56 in v52 do
        if l_FFlagAXCustomizeMakeupSupport_0 and v56.slotType == l_SlotType_0.LayeredSlot then
            for v57 = 1, v56.layerLimit do
                v54[v56.nameTranslationKey .. "_" .. v57] = {
                    v56.nameTranslationKey; 
                    layerIndex = v57
                };
            end;
        else
            v54[v56.nameTranslationKey] = v56.nameTranslationKey;
        end;
    end;
    v54[v53] = v53;
    return v54;
end;
local function v66(v59) --[[ Line: 98 ]] --[[ Name: getCategoryIndices ]]
    -- upvalues: v30 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy)
    for v60, v61 in (v30()) do
        if v61.Subcategories then
            for v62, v63 in v61.Subcategories do
                if v63.NavigationKey == v59 then
                    return v60, v62, nil;
                elseif l_FFlagAXEditorSubcategoryFilters_0 and v63.SubcategoryFilters then
                    for v64, v65 in v63.SubcategoryFilters do
                        if v65.NavigationKey == v59 then
                            return v60, v62, v64;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return nil, nil, nil;
end;
local function v73(v67, v68) --[[ Line: 121 ]] --[[ Name: shallowEqual ]]
    if v67 == v68 then
        return true;
    elseif type(v67) ~= "table" or type(v68) ~= "table" then
        return false;
    else
        for v69, v70 in v67 do
            if v68[v69] ~= v70 then
                return false;
            end;
        end;
        for v71, _ in v68 do
            if v67[v71] == nil then
                return false;
            end;
        end;
        return true;
    end;
end;
local v74 = nil;
local v75 = nil;
if l_FFlagAXCustomizeMakeupSupport_0 then
    v74 = function(v76) --[[ Line: 149 ]]
        return v76.AvatarExperience.AvatarEditor.Categories.category;
    end;
    v75 = function(v77) --[[ Line: 152 ]]
        return v77.AvatarExperience.AvatarEditor.Categories.subcategory;
    end;
end;
return function(v78) --[[ Line: 157 ]] --[[ Name: useSlotProps ]]
    -- upvalues: l_useSlotBasedEditorContext_0 (copy), l_useDispatch_0 (copy), v28 (copy), v26 (copy), v27 (copy), l_useTokens_0 (copy), v4 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v2 (copy), l_useSelector_0 (copy), l_DeviceOrientationMode_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v74 (ref), v75 (ref), l_useSlotItemCardBreakpoints_0 (copy), v45 (copy), v46 (copy), v3 (copy), l_buildSlots_0 (copy), l_Constants_0 (copy), l_useLocalization_0 (copy), v58 (copy), v73 (copy), v30 (copy), v66 (copy), v29 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy), l_FFlagAXSlotsDesktopRedesign_0 (copy), v7 (copy), l_FFlagAXSlotsScrollAway_0 (copy), l_Categories_0 (copy), l_FFlagAXSlotsDesktopCrashFix_0 (copy), l_FFlagAXSlotBasedEditorCategoryTooltip_0 (copy), v43 (copy), l_getAssetTypesByCategory_0 (copy), v6 (copy), l_AvatarScreen_0 (copy), l_ClearAllButton_0 (copy), l_AvatarEditorSubcategories_0 (copy), v41 (copy), l_buildBodySlotViewportProps_0 (copy), v13 (copy), l_SlotCircularGradientFrame_0 (copy), l_SlotItemCardThumbnail_0 (copy), l_SlotType_0 (copy), l_NavigationParams_0 (copy), l_ItemView_0 (copy)
    local v79 = l_useSlotBasedEditorContext_0();
    local v80 = l_useDispatch_0();
    local v81 = v28(v26);
    local v82 = v28(v27);
    local v83 = l_useTokens_0();
    local v84 = v28(v4);
    local v85 = l_useNavigation_0();
    local v86 = l_useAvatarRoute_0();
    local v87 = v2.useRef(nil);
    local v89 = l_useSelector_0(function(v88) --[[ Line: 167 ]]
        -- upvalues: l_DeviceOrientationMode_0 (ref)
        return v88.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    end);
    local v90 = nil;
    local v91 = nil;
    if l_FFlagAXCustomizeMakeupSupport_0 then
        v90 = l_useSelector_0(v74);
        v91 = l_useSelector_0(v75);
    end;
    local v92 = l_useSlotItemCardBreakpoints_0(v87.current and v87.current.AbsoluteSize);
    local v94 = l_useSelector_0(function(v93) --[[ Line: 181 ]]
        -- upvalues: v45 (ref)
        if v45 then
            return v93.AvatarExperience.AvatarEditor.Character.EquippedAssets or {};
        else
            return v93.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        end;
    end);
    local v95 = nil;
    if v46 then
        local v97 = l_useSelector_0(function(v96) --[[ Line: 191 ]]
            return v96.AvatarExperience.AvatarEditor.Character.BodyColor3s;
        end);
        local l_v97_0 = v97 --[[ copy: 16 -> 33 ]];
        v95 = v2.useMemo(function() --[[ Line: 194 ]]
            -- upvalues: v3 (ref), l_v97_0 (copy)
            return v3.Dictionary.values(l_v97_0);
        end, {
            v97
        });
    else
        v95 = l_useSelector_0(function(v99) --[[ Line: 198 ]]
            -- upvalues: v3 (ref)
            return v3.Dictionary.values(v99.AvatarExperience.AvatarEditor.Character.BodyColor3s);
        end);
    end;
    assert(v79 ~= nil, "useSlotProps must be used within a SlotBasedEditorContextProvider");
    local l_slotCategory_0 = v79.slotCategory;
    local l_setSlotCategory_0 = v79.setSlotCategory;
    local l_slotIndex_0 = v79.slotIndex;
    local l_setSlotIndex_0 = v79.setSlotIndex;
    local v104 = nil;
    v104 = if v46 then v2.useMemo(function() --[[ Line: 211 ]]
        -- upvalues: l_buildSlots_0 (ref), l_Constants_0 (ref), l_slotCategory_0 (copy), v94 (copy)
        return l_buildSlots_0(l_Constants_0.SlotEditorCategories[l_slotCategory_0].slots, v94);
    end, {
        l_slotCategory_0, 
        v94
    }) else l_buildSlots_0(l_Constants_0.SlotEditorCategories[l_slotCategory_0].slots, v94);
    local l_nameTranslationKey_0 = l_Constants_0.SlotEditorCategories[l_slotCategory_0].nameTranslationKey;
    local v106 = nil;
    if v46 then
        local v107 = l_useLocalization_0((v58(v104, l_nameTranslationKey_0)));
        local v108 = v2.useRef(nil);
        local l_v108_0 = v108 --[[ copy: 24 -> 31 ]];
        local l_v107_0 = v107 --[[ copy: 23 -> 32 ]];
        v106 = v2.useMemo(function() --[[ Line: 229 ]]
            -- upvalues: l_v108_0 (copy), v73 (ref), l_v107_0 (copy)
            if l_v108_0.current and v73(l_v107_0, l_v108_0.current) then
                return l_v108_0.current;
            else
                l_v108_0.current = l_v107_0;
                return l_v107_0;
            end;
        end, {
            v107
        });
    else
        v106 = l_useLocalization_0((v58(v104, l_nameTranslationKey_0)));
    end;
    local v111 = if l_FFlagAXCustomizeMakeupSupport_0 then v30() else nil;
    local v121 = if not l_FFlagAXCustomizeMakeupSupport_0 then nil else v2.useCallback(function(v112) --[[ Line: 246 ]]
        -- upvalues: v111 (copy), v90 (ref), v91 (ref), v66 (ref), v80 (copy), v29 (ref), v81 (copy), l_FFlagAXEditorSubcategoryFilters_0 (ref)
        local v113 = nil;
        local v114 = nil;
        local v115 = nil;
        if v112.eligibleSubcategories ~= nil then
            if v112.currentAssetType == nil then
                if table.find(v112.eligibleSubcategories, v111[v90].Subcategories[v91].NavigationKey) then
                    v113 = v90;
                    v114 = v91;
                    v115 = nil;
                end;
            else
                for v116, v117 in v111[v90].Subcategories do
                    if table.find(v112.eligibleSubcategories, v117.NavigationKey) and v117.AssetTypeIdStrings ~= nil and table.find(v117.AssetTypeIdStrings, (tostring(v112.currentAssetType.Value))) then
                        v113 = v90;
                        v114 = v116;
                        v115 = nil;
                        break;
                    end;
                end;
            end;
        end;
        if v113 == nil then
            local v118, v119, v120 = v66(v112.editorSubcategory);
            v113 = v118;
            v114 = v119;
            v115 = v120;
        end;
        if v113 and v114 then
            v80(v29(v113, v114, v81, if l_FFlagAXEditorSubcategoryFilters_0 then v115 else nil));
        end;
    end, {
        v90, 
        v91, 
        v80, 
        v81
    });
    local v124 = v2.useCallback(function(v122, v123) --[[ Line: 301 ]]
        -- upvalues: l_setSlotCategory_0 (copy), l_setSlotIndex_0 (copy), l_FFlagAXSlotsDesktopRedesign_0 (ref), v89 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v80 (copy), v29 (ref), v81 (copy), v7 (ref)
        l_setSlotCategory_0(v122);
        l_setSlotIndex_0(1);
        if l_FFlagAXSlotsDesktopRedesign_0 or v89 or l_FFlagAXCustomizeMakeupSupport_0 then
            v80(v29(v123.index + 1, 1, v81));
        end;
        if l_FFlagAXCustomizeMakeupSupport_0 then
            v80(v7());
        end;
    end, {
        l_setSlotCategory_0, 
        l_setSlotIndex_0, 
        v80, 
        if not v46 or l_FFlagAXSlotsDesktopRedesign_0 then nil else v89, 
        if v46 then v81 else nil
    });
    local v126 = v2.useMemo(function() --[[ Line: 322 ]]
        -- upvalues: v92 (copy), l_Constants_0 (ref), v124 (copy), l_FFlagAXSlotsScrollAway_0 (ref), l_slotCategory_0 (copy), l_FFlagAXSlotsDesktopRedesign_0 (ref), l_Categories_0 (ref), v89 (copy), l_FFlagAXSlotsDesktopCrashFix_0 (ref)
        local v125 = {
            navHeight = v92.navHeight, 
            categories = table.clone(l_Constants_0.SlotEditorCategories), 
            onSlotCategorySelected = v124, 
            enableSnapToSelectedItem = true, 
            LayoutOrder = l_FFlagAXSlotsScrollAway_0 and 2 or nil, 
            slotCategory = l_slotCategory_0
        };
        if l_FFlagAXSlotsDesktopRedesign_0 then
            v125.categories[l_Categories_0.All].hide = v89;
        end;
        if l_FFlagAXSlotsDesktopCrashFix_0 then
            v125.categories[l_Categories_0.Avatars].hide = not (l_FFlagAXSlotsDesktopRedesign_0 or v89);
            v125.categories[l_Categories_0.Emotes].hide = not (l_FFlagAXSlotsDesktopRedesign_0 or v89);
            return v125;
        else
            if not l_FFlagAXSlotsDesktopRedesign_0 and not v89 then
                v125.categories[l_Categories_0.Avatars] = nil;
                v125.categories[l_Categories_0.Emotes] = nil;
            end;
            return v125;
        end;
    end, {
        v89, 
        l_slotCategory_0, 
        if v46 then v92 else nil, 
        if v46 then v124 else nil
    });
    local v127 = nil;
    if l_FFlagAXSlotBasedEditorCategoryTooltip_0 then
        local v129 = l_useSelector_0(function(v128) --[[ Line: 359 ]]
            return v128.AvatarExperience.Common.FullView.AvatarEditor;
        end);
        local l_v129_0 = v129 --[[ copy: 28 -> 30 ]];
        v127 = v2.useMemo(function() --[[ Line: 363 ]]
            -- upvalues: l_v129_0 (copy), v78 (copy)
            local v131 = tostring(l_v129_0) ~= "FullView.SceneFullView";
            local v132 = true;
            if v78.slotSubNavigationFill ~= 1 then
                v132 = v78.slotSubNavigationFill == nil;
            end;
            return v131 and v132;
        end, {
            v129, 
            v78.slotSubNavigationFill
        });
    end;
    if l_FFlagAXCustomizeMakeupSupport_0 then
        v2.useEffect(function() --[[ Line: 372 ]]
            -- upvalues: v111 (copy), v90 (ref), l_setSlotCategory_0 (copy), l_slotIndex_0 (copy), v104 (ref), v91 (ref), l_setSlotIndex_0 (copy)
            if v111[v90].Subcategories ~= nil then
                l_setSlotCategory_0(v111[v90].NavigationKey);
                if l_slotIndex_0 ~= nil and v104[l_slotIndex_0] ~= nil and v104[l_slotIndex_0].eligibleSubcategories ~= nil and table.find(v104[l_slotIndex_0].eligibleSubcategories, v111[v90].Subcategories[v91].NavigationKey) then
                    return;
                else
                    for v133, v134 in v104 do
                        if if v134.eligibleSubcategories ~= nil then table.find(v134.eligibleSubcategories, v111[v90].Subcategories[v91].NavigationKey) else v134.editorSubcategory == v111[v90].Subcategories[v91].NavigationKey then
                            l_setSlotIndex_0(v133);
                            return;
                        end;
                    end;
                end;
            end;
        end, {
            v90, 
            v91, 
            l_setSlotIndex_0, 
            l_setSlotCategory_0, 
            v111, 
            v104
        });
    end;
    local v151 = v2.useMemo(function() --[[ Line: 417 ]]
        -- upvalues: l_slotCategory_0 (copy), l_slotIndex_0 (copy), l_Constants_0 (ref), v92 (copy), l_FFlagAXSlotsScrollAway_0 (ref), v83 (copy), l_FFlagAXSlotBasedEditorCategoryTooltip_0 (ref), v127 (ref), l_Categories_0 (ref), v43 (ref), l_getAssetTypesByCategory_0 (ref), v104 (ref), v80 (copy), v6 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), l_setSlotIndex_0 (copy), v121 (copy), v85 (copy), l_AvatarScreen_0 (ref), v2 (ref), l_ClearAllButton_0 (ref), v84 (copy), l_AvatarEditorSubcategories_0 (ref), v41 (ref), l_buildBodySlotViewportProps_0 (ref), v13 (ref), v94 (copy), l_SlotCircularGradientFrame_0 (ref), v95 (ref), l_SlotItemCardThumbnail_0 (ref), l_SlotType_0 (ref), v106 (ref), v79 (copy), v82 (copy), v7 (ref), v86 (copy), l_NavigationParams_0 (ref), l_ItemView_0 (ref), v66 (ref), v29 (ref), v81 (copy), l_FFlagAXEditorSubcategoryFilters_0 (ref)
        local v135 = {
            slotCategory = l_slotCategory_0, 
            slotIndex = l_slotIndex_0, 
            index = l_Constants_0.SlotEditorCategories[l_slotCategory_0].index, 
            slots = {}, 
            buttonPadding = v92.scrollingFramePadding.buttonPadding, 
            contentPadding = v92.scrollingFramePadding.contentPadding, 
            enableSnapToSelectedItem = v92.enableSnapToSelectedSlot, 
            margin = if l_FFlagAXSlotsScrollAway_0 then nil else {
                top = v83.Padding.Medium, 
                bottom = v83.Padding.Medium, 
                left = 0, 
                right = 0
            }, 
            enableIntroScroll = true, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            slotSubNavigationFrameHeight = if l_FFlagAXSlotsScrollAway_0 then v92.slotCardTotalHeight else nil, 
            canShowTooltip = if l_FFlagAXSlotBasedEditorCategoryTooltip_0 then v127 else nil
        };
        if l_slotCategory_0 ~= l_Categories_0.Body then
            v135.clearAllButton = {
                onActivated = function() --[[ Line: 445 ]] --[[ Name: onActivated ]]
                    -- upvalues: v43 (ref), l_getAssetTypesByCategory_0 (ref), l_slotCategory_0 (ref), v104 (ref), v80 (ref), v6 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), l_Constants_0 (ref), l_setSlotIndex_0 (ref), v121 (ref), v85 (ref), l_AvatarScreen_0 (ref)
                    if v43 then
                        local function v137() --[[ Line: 447 ]]
                            -- upvalues: l_getAssetTypesByCategory_0 (ref), l_slotCategory_0 (ref), v104 (ref), v80 (ref), v6 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), l_Constants_0 (ref), l_setSlotIndex_0 (ref), v121 (ref)
                            local v136 = l_getAssetTypesByCategory_0(l_slotCategory_0, v104);
                            if #v136 > 0 then
                                v80(v6(v136));
                            end;
                            if l_FFlagAXCustomizeMakeupSupport_0 and l_Constants_0.SlotEditorCategories[l_slotCategory_0].resetSlotOnClearAll then
                                l_setSlotIndex_0(1);
                                v121(v104[1]);
                            end;
                        end;
                        v85.navigate(l_AvatarScreen_0.SlotEditorClearAllConfirmationPrompt, {
                            slotCategory = l_slotCategory_0, 
                            clearAll = v137
                        });
                        return;
                    else
                        local v138 = l_getAssetTypesByCategory_0(l_slotCategory_0, v104);
                        if #v138 > 0 then
                            v80(v6(v138));
                        end;
                        return;
                    end;
                end, 
                renderHeaderSlot = function() --[[ Line: 473 ]] --[[ Name: renderHeaderSlot ]]
                    -- upvalues: v2 (ref), l_ClearAllButton_0 (ref)
                    return v2.createElement(l_ClearAllButton_0);
                end, 
                Size = v92.itemCardSize, 
                text = v84:Format("Feature.Avatar.Action.Clear")
            };
        end;
        for v139, v140 in v104 do
            table.insert(v135.slots, {
                renderHeaderSlot = function() --[[ Line: 483 ]] --[[ Name: renderHeaderSlot ]]
                    -- upvalues: v140 (copy), l_AvatarEditorSubcategories_0 (ref), v2 (ref), v41 (ref), l_buildBodySlotViewportProps_0 (ref), v13 (ref), v94 (ref), l_SlotCircularGradientFrame_0 (ref), v95 (ref), l_SlotItemCardThumbnail_0 (ref), v92 (ref)
                    if v140.editorSubcategory == l_AvatarEditorSubcategories_0.PurchasedCharacters then
                        return v2.createElement(v41, l_buildBodySlotViewportProps_0(v13.DefaultBodyColor3, v94));
                    elseif v140.editorSubcategory == l_AvatarEditorSubcategories_0.Skin then
                        return v2.createElement(l_SlotCircularGradientFrame_0, {
                            Colors = v95
                        });
                    elseif v140.editorSubcategory == l_AvatarEditorSubcategories_0.Build then
                        return v2.createElement(l_SlotItemCardThumbnail_0, {
                            icon = v140.icon, 
                            iconFrameStyles = v92.slotItemCardThumbnailStyles.iconFrameStyles, 
                            ignoredUrl = true
                        });
                    else
                        local v141 = false;
                        if table.find(v140.assetTypes, Enum.AvatarAssetType.Face) then
                            local v142 = v94[tostring(Enum.AvatarAssetType.DynamicHead.Value)];
                            if v142 ~= nil and next(v142) then
                                v141 = true;
                            end;
                        end;
                        return v2.createElement(l_SlotItemCardThumbnail_0, {
                            url = v140.thumbnailUrl, 
                            icon = v140.icon, 
                            enableThumbnailOverlay = v141, 
                            iconFrameStyles = v92.slotItemCardThumbnailStyles.iconFrameStyles
                        });
                    end;
                end, 
                BackgroundTransparency = if not (not v140.thumbnailUrl and v140.editorSubcategory ~= l_AvatarEditorSubcategories_0.Skin and v140.editorSubcategory ~= l_AvatarEditorSubcategories_0.Build) or v140.editorSubcategory == l_AvatarEditorSubcategories_0.PurchasedCharacters then nil else 1, 
                title = if l_FFlagAXCustomizeMakeupSupport_0 and v140.slotType == l_SlotType_0.LayeredSlot then v106[v140.nameTranslationKey .. "_" .. v140.layerIndex + 1] else v106[v140.nameTranslationKey], 
                Size = v92.itemCardSize, 
                isActive = v139 == v79.slotIndex, 
                editorSubcategory = v140.editorSubcategory, 
                slotType = if l_FFlagAXCustomizeMakeupSupport_0 then v140.slotType or l_SlotType_0.BaseSlot else nil, 
                onActivated = function() --[[ Line: 535 ]] --[[ Name: onActivated ]]
                    -- upvalues: v82 (ref), v140 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), v139 (copy), v79 (ref), l_setSlotIndex_0 (ref), v121 (ref), v104 (ref), v80 (ref), v7 (ref), v86 (ref), l_AvatarScreen_0 (ref), v85 (ref), l_NavigationParams_0 (ref), l_ItemView_0 (ref), v66 (ref), v29 (ref), v81 (ref), l_FFlagAXEditorSubcategoryFilters_0 (ref)
                    v82.slotClick(v140);
                    local v143 = nil;
                    local v144 = nil;
                    local v145 = nil;
                    if l_FFlagAXCustomizeMakeupSupport_0 then
                        if v140.deselectable and v139 == v79.slotIndex then
                            l_setSlotIndex_0(1);
                            v121(v104[1]);
                            v80(v7());
                            return;
                        else
                            v121(v140);
                            local v146 = v86.current.name == l_AvatarScreen_0.LookDetails;
                            v85.navigate(l_AvatarScreen_0.AvatarEditor, {
                                [l_NavigationParams_0.itemView] = l_ItemView_0.SlotItems
                            });
                            if v146 then
                                v85.navigate(l_AvatarScreen_0.LookDetails);
                            end;
                            if not v104[v139].deselectable or v139 ~= v79.slotIndex then
                                l_setSlotIndex_0(v139);
                                return;
                            end;
                        end;
                    else
                        if v143 == nil then
                            local v147, v148, v149 = v66(v140.editorSubcategory);
                            v143 = v147;
                            v144 = v148;
                            v145 = v149;
                        end;
                        if v143 and v144 then
                            v80(v29(v143, v144, v81, if l_FFlagAXEditorSubcategoryFilters_0 then v145 else nil));
                            local v150 = v86.current.name == l_AvatarScreen_0.LookDetails;
                            v85.navigate(l_AvatarScreen_0.AvatarEditor, {
                                [l_NavigationParams_0.itemView] = l_ItemView_0.SlotItems
                            });
                            if v150 then
                                v85.navigate(l_AvatarScreen_0.LookDetails);
                            end;
                            if not v104[v139].deselectable or v139 ~= v79.slotIndex then
                                l_setSlotIndex_0(v139);
                            end;
                        end;
                    end;
                end, 
                hide = if l_FFlagAXCustomizeMakeupSupport_0 then v140.hide else nil
            });
        end;
        return v135;
    end, {
        l_slotIndex_0, 
        l_slotCategory_0, 
        v83, 
        v106, 
        v80, 
        v82, 
        v81, 
        v85, 
        if v46 then v104 else nil, 
        if v46 then v92 else nil, 
        if v46 then v94 else nil, 
        if v46 then v95 else nil, 
        if v46 then v79 else nil, 
        if v46 then v86 else nil, 
        if v46 then l_setSlotIndex_0 else nil, 
        if v46 then v84 else nil, 
        if l_FFlagAXSlotBasedEditorCategoryTooltip_0 then v127 else nil, 
        if l_FFlagAXCustomizeMakeupSupport_0 then v111 else nil
    });
    local v152 = 0;
    if l_FFlagAXSlotsScrollAway_0 then
        v152 = v92.navHeight;
        if #v151.slots > 0 then
            v152 = v152 + v92.slotCardTotalHeight;
        end;
    else
        v152 = v92.navigationFrameHeight;
        if #v151.slots == 0 then
            v152 = v152 - v92.itemCardSize.Height.Offset * 2;
        end;
    end;
    return {
        slotNavigationProps = v126, 
        slotSubNavigationProps = v151, 
        ref = v87, 
        navigationFrameHeight = v152, 
        slotSubNavigationFill = 1, 
        slotCardTotalHeight = v92.slotCardTotalHeight, 
        navHeight = v92.navHeight
    };
end;