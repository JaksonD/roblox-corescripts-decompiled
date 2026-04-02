local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.LuaApp.mutedError);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v10 = require(l_CorePackages_0.Packages.Cryo);
local v11 = require(l_CorePackages_0.Packages.Dash);
local v12 = require(l_CorePackages_0.Packages.tutils);
local v13 = require(l_CorePackages_0.Packages.t);
local v14 = require(l_CorePackages_0.Packages.UIBlox);
local l_TextService_0 = game:GetService("TextService");
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local l_ItemTileEnums_0 = v14.Tile.ItemTileEnums;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v20 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v22 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local l_FFlagAXCatalogCategoriesStore_0 = v20.FFlagAXCatalogCategoriesStore;
local l_FFlagAXCustomizeMakeupSupport_0 = v20.FFlagAXCustomizeMakeupSupport;
local v26 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategoriesFromStore);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v29 = require(l_Modules_0.LuaApp.Constants);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v33 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorStructure);
local v34 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v35 = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local v36 = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local v37 = require(l_Modules_0.AvatarExperience.Common.Enum.WearTimeFilter);
local v38 = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v41 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v42 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Constants);
local v43 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v44 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local v45 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortAndFilters);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local l_InventoryItemAvailability_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability;
local v50 = require(l_Modules_0.AvatarExperience.Common.getEmotesCategory);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_SwitchTab_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SwitchTab;
local v54 = l_GuiService_0:IsTenFootInterface();
local v55 = game:DefineFastString("AXLookWidgetContentType", "SearchToLooksWidget,SearchToCommunityLooksWidget,SearchToAvatarLooksWidget,PersonalizedAvatarLooksWidget,SortsPersonalizedAvatarLooksWidget,MySharedAvatarsWidget");
local v56 = game:DefineFastString("AXAvatarWidgetContentType", "SearchToAvatarLooksWidget,PersonalizedAvatarLooksWidget,SortsPersonalizedAvatarLooksWidget,MySharedAvatarsWidget");
local l_FFlagAXSlotsInventoryLoadableGridView_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsInventoryLoadableGridView;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local v59 = game:DefineFastFlag("AXFixMinMaxPriceFilterError", false);
local v60 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXExtractEmotesCategory);
local v61 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagAXHttpCatalogV2SearchItemDetails_0 = v20.FFlagAXHttpCatalogV2SearchItemDetails;
local l_FFlagAXMutedErrorLoggingForCategorySelection_0 = v20.FFlagAXMutedErrorLoggingForCategorySelection;
local l_FFlagAXTimedOptionsSalesTypeFilter_0 = v20.FFlagAXTimedOptionsSalesTypeFilter;
local l_FFlagAXRemoveTimedOptionsSalesTypeEnumCheck_0 = v20.FFlagAXRemoveTimedOptionsSalesTypeEnumCheck;
local l_FFlagAXCatalogSearchParamTypes_0 = v20.FFlagAXCatalogSearchParamTypes;
local l_FFlagAXEditorSubcategoryFilters_0 = v20.FFlagAXEditorSubcategoryFilters;
local l_FFlagAvatarJointUpgradeInUA_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAvatarJointUpgradeInUA;
local v70 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v71 = {};
local v72 = {};
local v73 = string.split(v55, ",") or {};
v71 = v10.List.map(v73, function(v74) --[[ Line: 126 ]]
    return v74:match("^%s*(.*)%s*$");
end);
local v75 = string.split(v56, ",") or {};
v72 = v10.List.map(v75, function(v76) --[[ Line: 133 ]]
    return v76:match("^%s*(.*)%s*$");
end);
local v77 = {
    PageType = v22.PageType.Other, 
    RecommendationsType = v23.RecommendationsType.None
};
local v78 = {
    PageType = v22.PageType.Other, 
    RecommendationsType = v23.RecommendationsType.None, 
    CanAnimateCameraBasedMood = true
};
local v79 = {};
local v80 = {};
local v81 = {};
local v88 = l_memoize_0(function(v82, v83, v84) --[[ Line: 179 ]]
    -- upvalues: v10 (copy), v22 (copy)
    local v85 = v82[v83];
    if v85.Subcategories and v84 then
        local v86 = v85.Subcategories[v84];
        if v86 then
            local v87 = v10.Dictionary.join(v85, v86);
            v87.AssetTypeIdStrings = v86.AssetTypeIdStrings;
            v87.BundleTypes = v86.BundleTypes;
            v87.CategoryFilter = v86.CategoryFilter;
            v87.Subcategories = v86.Subcategories;
            return v87;
        end;
    end;
    if v85.PageType == v22.PageType.Emotes then
        return v10.Dictionary.join(v85, {
            EmoteSlot = v84
        });
    else
        return v85;
    end;
end);
local v96 = l_memoize_0(function(v89, v90, v91) --[[ Line: 222 ]]
    -- upvalues: v45 (copy), l_FFlagAXMutedErrorLoggingForCategorySelection_0 (copy), v7 (copy), v10 (copy), v22 (copy)
    local v92 = v45.extractCategoryById(v90, v89);
    if l_FFlagAXMutedErrorLoggingForCategorySelection_0 and v92 == nil then
        v7("[buildCategoryInfoById] Category not found for categoryId: " .. tostring(v90) .. " and subcategoryId: " .. tostring(v91));
    end;
    if v92.Subcategories and v91 then
        local l_Subcategories_0 = v92.Subcategories;
        local v94 = v45.extractSubcategoryById(v91, l_Subcategories_0);
        if v94 then
            local v95 = v10.Dictionary.join(v92, v94);
            v95.AssetTypeIdStrings = v94.AssetTypeIdStrings;
            v95.BundleTypes = v94.BundleTypes;
            v95.CategoryFilter = v94.CategoryFilter;
            v95.Subcategories = v94.Subcategories;
            v95.SubcategoriesMap = v94.SubcategoriesMap;
            return v95;
        end;
    end;
    if v92.PageType == v22.PageType.Emotes then
        return v10.Dictionary.join(v92, {
            EmoteSlot = v91
        });
    else
        return v92;
    end;
end);
local function _(v97, v98, v99) --[[ Line: 273 ]] --[[ Name: categoryKey ]]
    return string.format("%s.%s.%s", tostring(v97), tostring(v98), (tostring(v99)));
end;
local function _(v101, v102, v103) --[[ Line: 277 ]] --[[ Name: categoryKeyV2 ]]
    return string.format("%s.%s.%s", tostring(v101), tostring(v102), (tostring(v103)));
end;
v79.getCategoryInfo = l_memoize_0(function(v105, v106, v107) --[[ Line: 286 ]]
    -- upvalues: v80 (copy), v88 (copy)
    local v108 = string.format("%s.%s.%s", tostring(v105), tostring(v106), (tostring(v107)));
    local v109 = v80[v108];
    if v109 == nil then
        v109 = v88(v105, v106, v107);
        v80[v108] = v109;
    end;
    return v109;
end);
v79.getCategoryInfoById = l_memoize_0(function(v110, v111, v112) --[[ Line: 298 ]]
    -- upvalues: v81 (copy), v96 (copy)
    local v113 = string.format("%s.%s.%s", tostring(v110), tostring(v111), (tostring(v112)));
    local v114 = v81[v113];
    if v114 == nil then
        v114 = v96(v110, v111, v112);
        v81[v113] = v114;
    end;
    return v114;
end);
v79.getCatalogCategoryInfo = l_memoize_0(function(v115, v116) --[[ Line: 310 ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v27 (copy), v26 (copy), v79 (copy)
    local v117 = if l_FFlagAXCatalogCategoriesStore_0 then v27() else v26();
    return v79.getCategoryInfo(v117, v115, v116);
end);
v79.getCatalogCategoryInfoById = l_memoize_0(function(v118, v119) --[[ Line: 319 ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v27 (copy), v26 (copy), v79 (copy)
    local v120 = if l_FFlagAXCatalogCategoriesStore_0 then v27() else v26();
    return v79.getCategoryInfoById(v120, v118, v119);
end);
v79.getAvatarEditorCategoryInfo = l_memoize_0(function(v121, v122) --[[ Line: 328 ]]
    -- upvalues: v21 (copy), v79 (copy)
    local v123 = v21();
    return v79.getCategoryInfo(v123, v121, v122);
end);
local function _(v124) --[[ Line: 334 ]] --[[ Name: getCatalogCardFooterHeight ]]
    if v124 < 100 then
        return 30;
    elseif v124 < 148 then
        return 36;
    else
        return 42;
    end;
end;
local v135 = l_memoize_0(function(v126, _, v128) --[[ Line: 344 ]]
    -- upvalues: v22 (copy)
    local v129 = if v128 then v22.CreatorNameItemTileTitleMaxLines else v22.ItemTileTitleMaxLines;
    local v130 = if v128 then v22.CreatorNameItemTilePadding else v22.ItemTilePadding;
    return function(v131) --[[ Line: 352 ]]
        -- upvalues: v129 (copy), v126 (copy), v130 (copy), v128 (copy)
        local v132 = v129 * v126;
        local v133 = v130 * 2;
        local v134 = v131 < 100 and 30 or v131 < 148 and 36 or 42;
        if v128 then
            v134 = v134 * 2;
        end;
        return v131 + v132 + v133 + v134;
    end;
end);
local v146 = l_memoize_0(function(v136, _, v138) --[[ Line: 367 ]]
    -- upvalues: v22 (copy)
    local v139 = if v138 then v22.CreatorNameItemTileTitleMaxLines else v22.ItemTileTitleMaxLines;
    local v140 = if v138 then v22.CreatorNameItemTilePadding else v22.ItemTilePadding;
    return function(v141) --[[ Line: 375 ]]
        -- upvalues: v22 (ref), v139 (copy), v136 (copy), v140 (copy), v138 (copy)
        local v142 = v141 / v22.ItemTileTallAspectRatio;
        local v143 = v139 * v136;
        local v144 = v140 * 2;
        local v145 = v141 < 100 and 30 or v141 < 148 and 36 or 42;
        if v138 then
            v145 = v145 * 2;
        end;
        return v142 + v143 + v144 + v145;
    end;
end);
v79.isLooksWidget = function(v147) --[[ Line: 391 ]] --[[ Name: isLooksWidget ]]
    -- upvalues: v71 (ref)
    return table.find(v71, v147) ~= nil;
end;
v79.isAvatarLooksWidget = function(v148) --[[ Line: 400 ]] --[[ Name: isAvatarLooksWidget ]]
    -- upvalues: v79 (copy), v72 (ref)
    return v79.isLooksWidget(v148) and table.find(v72, v148) ~= nil;
end;
local v157 = l_memoize_0(function(v149, _, v151, v152, v153) --[[ Line: 407 ]]
    -- upvalues: v22 (copy)
    return function(v154) --[[ Line: 414 ]]
        -- upvalues: v22 (ref), v151 (copy), v152 (copy), v153 (copy), v149 (copy)
        local v155 = v154 / v22.LookTileAspectRatio;
        local v156 = v151 or v152;
        if not v153 then
            v155 = v155 + 30;
        elseif v156 then
            v155 = v155 + 30;
        end;
        if v156 then
            v155 = v155 + 4;
        end;
        if v151 then
            v155 = v155 + v149;
        end;
        if v152 then
            if v151 then
                v155 = v155 + 4;
            end;
            v155 = v155 + v149;
        end;
        return v155;
    end;
end);
local v162 = l_memoize_0(function(v158) --[[ Line: 455 ]]
    -- upvalues: v22 (copy)
    return function(v159) --[[ Line: 456 ]]
        -- upvalues: v22 (ref), v158 (copy)
        local v160 = v22.ItemTileTitleMaxLines * v158;
        local l_ItemTilePadding_0 = v22.ItemTilePadding;
        return v159 + v160 + l_ItemTilePadding_0;
    end;
end);
local function v164(v163) --[[ Line: 464 ]] --[[ Name: squareItemHeightGetter ]]
    return v163;
end;
local v169 = l_memoize_0(function(v165) --[[ Line: 468 ]]
    -- upvalues: v164 (copy), l_FFlagAXSlotsInventoryLoadableGridView_0 (copy), v22 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
    if v165 == nil then
        return v164;
    else
        return function(v166) --[[ Line: 472 ]]
            -- upvalues: l_FFlagAXSlotsInventoryLoadableGridView_0 (ref), v22 (ref), v165 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (ref)
            local v167 = if l_FFlagAXSlotsInventoryLoadableGridView_0 then v22.EditorItemTileTitleMaxLines * v165 else v22.ItemTileTitleMaxLines * v165;
            local v168 = if l_FFlagAXRootSlotBasedEditorFlag_0 then v22.ItemTilePadding else v22.ItemTilePadding * 2;
            return v166 + v167 + v168;
        end;
    end;
end);
local function _(v170) --[[ Line: 486 ]] --[[ Name: splitKeywords ]]
    if v170 then
        return string.split(v170, " ");
    else
        return {};
    end;
end;
v79.mergeKeywordsAndTopics = function(v172, v173) --[[ Line: 506 ]] --[[ Name: mergeKeywordsAndTopics ]]
    local v174 = if v172 then string.split(v172, " ") else {};
    local v175 = if v173 then string.split(v173, " ") else {};
    for _, v177 in v175 do
        if #v177 > 0 and not table.find(v174, v177) then
            table.insert(v174, v177);
        end;
    end;
    return table.concat(v174, " ");
end;
v79.GetCategoryIdsFromNavKey = l_memoize_0(function(v178, v179) --[[ Line: 525 ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v27 (copy), v26 (copy)
    local v180 = if l_FFlagAXCatalogCategoriesStore_0 then v27() else v26();
    for _, v182 in v180 do
        if v182.NavigationKey then
            local l_Id_0 = v182.Id;
            if v182.NavigationKey == v178 then
                if v182.Subcategories and v179 then
                    for _, v185 in v182.Subcategories do
                        if v185.NavigationKey == v179 then
                            return l_Id_0, v185.Id;
                        end;
                    end;
                end;
                return l_Id_0, nil;
            end;
        end;
    end;
    return nil, nil;
end);
v79.GetAvatarEditorCategoryIdsFromNavKey = l_memoize_0(function(v186) --[[ Line: 548 ]]
    -- upvalues: v21 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy)
    for v187, v188 in (v21()) do
        if v188.NavigationKey == v186 then
            return v187, nil, nil;
        elseif v188.Subcategories then
            for v189, v190 in v188.Subcategories do
                if v190.NavigationKey == v186 then
                    return v187, v189, nil;
                elseif l_FFlagAXEditorSubcategoryFilters_0 and v190.SubcategoryFilters then
                    for v191, v192 in v190.SubcategoryFilters do
                        if v192.NavigationKey == v186 then
                            return v187, v189, v191;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return nil, nil, nil;
end);
v79.GridItemHeightGetter = function(v193, ...) --[[ Line: 573 ]] --[[ Name: GridItemHeightGetter ]]
    -- upvalues: v22 (copy), v169 (copy), v164 (copy), v162 (copy), v157 (copy), v135 (copy), v146 (copy)
    if v193 == v22.ItemTileType.AvatarEditorTile then
        return v169(...);
    elseif v193 == v22.ItemTileType.BodyColorButton then
        return v164;
    elseif v193 == v22.ItemTileType.BundleItemTile then
        return v162(...);
    elseif v193 == v22.ItemTileType.BundleItemTileNoText then
        return v164;
    elseif v193 == v22.ItemTileType.LookItemTile then
        return v157(...);
    elseif v193 == v22.ItemTileType.CatalogItemTile then
        return v135(...);
    elseif v193 == v22.ItemTileType.TallCatalogItemTile then
        return v146(...);
    else
        warn("Unknown itemType " .. tostring(v193) .. " in AvatarExperienceUtils.GridItemHeightGetter");
        return v164;
    end;
end;
v79.GridItemHeightGetterWithOptions = function(v194) --[[ Line: 605 ]] --[[ Name: GridItemHeightGetterWithOptions ]]
    -- upvalues: v22 (copy), v169 (copy), v164 (copy), v162 (copy), v157 (copy), v135 (copy), v146 (copy)
    local l_itemTileType_0 = v194.itemTileType;
    if l_itemTileType_0 == v22.ItemTileType.AvatarEditorTile then
        return v169(v194.fontHeight);
    elseif l_itemTileType_0 == v22.ItemTileType.BodyColorButton then
        return v164;
    elseif l_itemTileType_0 == v22.ItemTileType.BundleItemTile and v194.fontHeight then
        return v162(v194.fontHeight);
    elseif l_itemTileType_0 == v22.ItemTileType.BundleItemTileNoText then
        return v164;
    elseif l_itemTileType_0 == v22.ItemTileType.LookItemTile and v194.fontHeight then
        return v157(v194.fontHeight, v194.hideItemName, v194.itemCreatorNamesEnabled, v194.itemPriceEnabled, v194.isWidgetFocused);
    elseif l_itemTileType_0 == v22.ItemTileType.CatalogItemTile then
        return v135(v194.fontHeight, nil, v194.itemCreatorNamesEnabled);
    elseif l_itemTileType_0 == v22.ItemTileType.TallCatalogItemTile then
        return v146(v194.fontHeight, nil, v194.itemCreatorNamesEnabled);
    else
        warn("Unknown itemType " .. tostring(l_itemTileType_0) .. " in AvatarExperienceUtils.GridItemHeightGetterWithOptions");
        return v164;
    end;
end;
v79.isAvatarBackground = function(v196) --[[ Line: 634 ]] --[[ Name: isAvatarBackground ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v196 == l_AvatarScreen_0.AvatarBackground;
end;
v79.isAvatarExperienceRoute = function(v197) --[[ Line: 638 ]] --[[ Name: isAvatarExperienceRoute ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_SwitchTab_0 (copy)
    local l_history_0 = v197.Navigation.history;
    for _, v200 in l_history_0[#l_history_0] do
        if v200.name == l_AvatarScreen_0.AvatarExperienceRoot or v200.name == l_SwitchTab_0.AvatarExperienceTab then
            return true;
        end;
    end;
    return false;
end;
v79.isRouteInAvatarEditor = function(v201) --[[ Line: 652 ]] --[[ Name: isRouteInAvatarEditor ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v201.opaque.name == l_AvatarScreen_0.AvatarEditor;
end;
v79.didLeaveAvatarEditor = function(v202, v203) --[[ Line: 661 ]] --[[ Name: didLeaveAvatarEditor ]]
    -- upvalues: v79 (copy)
    if v79.isRouteInAvatarEditor(v203) and not v79.isRouteInAvatarEditor(v202) then
        return true;
    else
        return false;
    end;
end;
v79.getIsSceneFullViewFromState = function(v204, v205) --[[ Line: 670 ]] --[[ Name: getIsSceneFullViewFromState ]]
    -- upvalues: v34 (copy)
    local l_name_0 = v205.opaque.name;
    return v204.AvatarExperience.Common.FullView[l_name_0] == v34.SceneFullView;
end;
v79.getCatalogCategoryInfoFromState = function(v207) --[[ Line: 675 ]] --[[ Name: getCatalogCategoryInfoFromState ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v7 (copy), v79 (copy)
    if l_FFlagAXCatalogCategoriesStore_0 then
        v7("getCatalogCategoryInfoFromState is not supported with FFlagAXCatalogCategoriesStore");
    end;
    local l_categoryId_0 = v207.AvatarExperience.Catalog.Categories.categoryId;
    local l_subcategoryId_0 = v207.AvatarExperience.Catalog.Categories.subcategoryId;
    return v79.getCatalogCategoryInfoById(l_categoryId_0, l_subcategoryId_0);
end;
v79.getAvatarEditorCategoryInfoFromState = function(v210) --[[ Line: 685 ]] --[[ Name: getAvatarEditorCategoryInfoFromState ]]
    -- upvalues: v79 (copy)
    local l_category_0 = v210.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v210.AvatarExperience.AvatarEditor.Categories.subcategory;
    return v79.getAvatarEditorCategoryInfo(l_category_0, l_subcategory_0);
end;
v79.getAvatarEditorSubcategoryFilterFromState = function(v213) --[[ Line: 693 ]] --[[ Name: getAvatarEditorSubcategoryFilterFromState ]]
    -- upvalues: v79 (copy)
    local v214 = v79.getAvatarEditorCategoryInfoFromState(v213);
    if v214.SubcategoryFilters then
        local l_subcategoryFilter_0 = v213.AvatarExperience.AvatarEditor.Categories.subcategoryFilter;
        return v214.SubcategoryFilters[l_subcategoryFilter_0];
    else
        return nil;
    end;
end;
v79.getSelectedAccessoryDescription = function(v216, v217) --[[ Line: 704 ]] --[[ Name: getSelectedAccessoryDescription ]]
    local v218 = tonumber(v217) or 0;
    for _, v220 in v216:GetChildren() do
        if v220:IsA("AccessoryDescription") and v220.AssetId == v218 then
            return v220;
        end;
    end;
    return nil;
end;
v79.getAccessoryAdjustmentCategoryInfo = function(v221) --[[ Line: 719 ]] --[[ Name: getAccessoryAdjustmentCategoryInfo ]]
    -- upvalues: v79 (copy), v42 (copy)
    local v222 = v221.AvatarExperience.AccessoryAdjustment.SelectedAccessory or "";
    local l_CurrentCharacter_0 = v221.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    assert(l_CurrentCharacter_0, "assert currentCharacter exists");
    local l_Humanoid_0 = l_CurrentCharacter_0:FindFirstChild("Humanoid");
    assert(l_Humanoid_0, "assert humanoid exists");
    local l_HumanoidDescription_0 = l_Humanoid_0:FindFirstChild("HumanoidDescription");
    assert(l_HumanoidDescription_0, "assert currentCharacter exists");
    local v226 = v79.getSelectedAccessoryDescription(l_HumanoidDescription_0, v222);
    if not v226 then
        return;
    else
        assert(v226, "assert accessoryDescription exists");
        return v42.CameraCategories[v226.AccessoryType];
    end;
end;
v79.getCategoryInfoFromState = function(v227, v228) --[[ Line: 746 ]] --[[ Name: getCategoryInfoFromState ]]
    -- upvalues: l_AvatarScreen_0 (copy), v79 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v70 (copy), v60 (copy), v50 (copy), v33 (copy), v22 (copy), v77 (copy), v41 (copy), v43 (copy), v78 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy)
    local l_name_1 = v228.opaque.name;
    if l_name_1 == l_AvatarScreen_0.AvatarEditor then
        return v79.getAvatarEditorCategoryInfoFromState(v227);
    elseif l_name_1 == l_AvatarScreen_0.Catalog then
        if l_FFlagAXCatalogCategoriesStore_0 then
            return (v70.getCatalogSelectionStore().selectedCategoryInfo(false));
        else
            return v79.getCatalogCategoryInfoFromState(v227);
        end;
    elseif l_name_1 == l_AvatarScreen_0.ProfilePictureEditorEmotes then
        if v60() then
            return (v50());
        else
            local v230 = v33().AssetTypeToCategorySubcategory[v22.AssetTypeIdStrings.EmoteAnimation];
            local l_category_1 = v230.category;
            local l_subcategory_1 = v230.subcategory;
            return v79.getAvatarEditorCategoryInfo(l_category_1, l_subcategory_1);
        end;
    elseif l_name_1 == l_AvatarScreen_0.AdjustAccessoryView then
        local v233 = v79.getAccessoryAdjustmentCategoryInfo(v227);
        if v233 then
            return v233;
        else
            return v77;
        end;
    elseif v41.readTestVariable(v43.EnabledForUser) and l_name_1 == l_AvatarScreen_0.CatalogSearch then
        return v78;
    elseif l_name_1 == l_AvatarScreen_0.HeadRefinement then
        return v22.HeadRefinementCameraCategory;
    elseif l_FFlagAXCustomizeMakeupSupport_0 and l_name_1 == l_AvatarScreen_0.LayeredMakeupSort then
        return v22.LayeredMakeupCameraCategory;
    else
        return v77;
    end;
end;
local v234 = {
    "Torso", 
    "RightArm", 
    "LeftArm", 
    "LeftLeg", 
    "RightLeg"
};
v79.routeIsProfilePictureEditor = function(v235) --[[ Line: 805 ]] --[[ Name: routeIsProfilePictureEditor ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local v236 = true;
    if v235.opaque.name ~= l_AvatarScreen_0.ProfilePictureEditorEmotes then
        v236 = true;
        if v235.opaque.name ~= l_AvatarScreen_0.ProfilePictureEditorCamera then
            v236 = v235.opaque.name == l_AvatarScreen_0.ProfilePictureEditorFinal;
        end;
    end;
    return v236;
end;
v79.routeIsPPEStaticImagePage = function(v237) --[[ Line: 815 ]] --[[ Name: routeIsPPEStaticImagePage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local v238 = true;
    if v237.opaque.name ~= l_AvatarScreen_0.ProfilePictureEditorCamera then
        v238 = v237.opaque.name == l_AvatarScreen_0.ProfilePictureEditorFinal;
    end;
    return v238;
end;
v79.isFullyQualifiedCostume = function(v239) --[[ Line: 820 ]] --[[ Name: isFullyQualifiedCostume ]]
    -- upvalues: v234 (copy)
    for _, v241 in v234 do
        if v239[v241] == "" or v239[v241] == 0 then
            return false;
        end;
    end;
    return true;
end;
v79.shouldShowGradientForScrollingFrame = function(v242) --[[ Line: 829 ]] --[[ Name: shouldShowGradientForScrollingFrame ]]
    local l_AbsoluteSize_0 = v242.AbsoluteSize;
    local l_CanvasSize_0 = v242.CanvasSize;
    local l_CanvasPosition_0 = v242.CanvasPosition;
    return l_AbsoluteSize_0.X < l_CanvasSize_0.X.Offset, l_CanvasPosition_0.X > 20, l_CanvasPosition_0.X + l_AbsoluteSize_0.X < l_CanvasSize_0.X.Offset - 20;
end;
v79.Round = function(v246, v247) --[[ Line: 842 ]] --[[ Name: Round ]]
    local v248 = v247 or 1;
    return math.floor((v246 + v248 / 2) / v248) * v248;
end;
v79.isFetchingDoneOrFailed = function(v249, v250) --[[ Line: 847 ]] --[[ Name: isFetchingDoneOrFailed ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    local v251 = true;
    if v249 ~= l_RetrievalStatus_0.Done then
        v251 = v249 == l_RetrievalStatus_0.Failed;
    end;
    local v252 = true;
    if v250 ~= l_RetrievalStatus_0.Done then
        v252 = v250 == l_RetrievalStatus_0.Failed;
    end;
    return not v251 and v252;
end;
v79.getDeviceType = function() --[[ Line: 855 ]] --[[ Name: getDeviceType ]]
    -- upvalues: l_UserInputService_0 (copy), v22 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
        return v22.DeviceType.Android;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
        return v22.DeviceType.IOS;
    else
        return v22.DeviceType.Other;
    end;
end;
v79.getUserOutfitIdFromBundle = function(v254) --[[ Line: 867 ]] --[[ Name: getUserOutfitIdFromBundle ]]
    -- upvalues: v22 (copy)
    for _, v256 in v254.items do
        if v256.type == v22.ItemType.Outfit then
            return v256.id;
        end;
    end;
    return nil;
end;
v79.getUserOutfitIdsFromBundle = function(v257) --[[ Line: 878 ]] --[[ Name: getUserOutfitIdsFromBundle ]]
    -- upvalues: v22 (copy)
    local v258 = {};
    if v257.items then
        for _, v260 in v257.items do
            if v260.type == v22.ItemType.Outfit then
                table.insert(v258, v260.id);
            end;
        end;
    end;
    return v258;
end;
v79.getBundleInfo = l_memoize_0(function(v261, v262) --[[ Line: 893 ]]
    if v262 == nil then
        return nil;
    else
        local v263 = v261[v262];
        if not v263 then
            return nil;
        elseif v263.receivedCatalogData then
            return v263;
        else
            return nil;
        end;
    end;
end);
v79.getBundleInfoFromState = function(v264, v265) --[[ Line: 909 ]] --[[ Name: getBundleInfoFromState ]]
    -- upvalues: v79 (copy)
    local l_BundleInfos_0 = v264.AvatarExperience.Common.BundleInfos;
    return v79.getBundleInfo(l_BundleInfos_0, v265);
end;
v79.getOutfitInfoFromBundleIdNoState = function(v267, v268) --[[ Line: 917 ]] --[[ Name: getOutfitInfoFromBundleIdNoState ]]
    -- upvalues: v79 (copy), v12 (copy), v10 (copy)
    if not v267 then
        return nil;
    else
        assert(v267, "contentId is not nil: silences type checker");
        local v269 = v79.getUserOutfitIdsFromBundle(v267);
        if #v269 < 1 then
            return nil;
        else
            local v270 = nil;
            for _, v272 in v269 do
                local v273 = v268[v272];
                if not v273 then
                    return nil;
                elseif not v270 then
                    v270 = v12.deepCopy(v273);
                else
                    v270.assets = v10.Dictionary.join(v270.assets, v273.assets);
                end;
            end;
            return v270;
        end;
    end;
end;
v79.getOutfitInfoFromBundleId = function(v274, v275) --[[ Line: 952 ]] --[[ Name: getOutfitInfoFromBundleId ]]
    -- upvalues: v79 (copy)
    local v276 = v79.getBundleInfoFromState(v274, v275);
    local l_OutfitInfos_0 = v274.AvatarExperience.AvatarEditor.OutfitInfos;
    return v79.getOutfitInfoFromBundleIdNoState(v276, l_OutfitInfos_0);
end;
v79.getAllCategoriesStr = function(v278) --[[ Line: 959 ]] --[[ Name: getAllCategoriesStr ]]
    local v279 = "";
    local v280 = 1;
    while true do
        local v281 = "level" .. v280;
        if v278[v281] then
            if v280 ~= 1 then
                v279 = v279 .. "|";
            end;
            v279 = v279 .. v278[v281];
            v280 = v280 + 1;
        else
            break;
        end;
    end;
    return v279;
end;
v79.isAnimationAssetType = function(v282) --[[ Line: 981 ]] --[[ Name: isAnimationAssetType ]]
    -- upvalues: v22 (copy)
    local v283 = true;
    if v282 ~= v22.AssetTypeIdStrings.ClimbAnimation then
        v283 = true;
        if v282 ~= v22.AssetTypeIdStrings.FallAnimation then
            v283 = true;
            if v282 ~= v22.AssetTypeIdStrings.IdleAnimation then
                v283 = true;
                if v282 ~= v22.AssetTypeIdStrings.JumpAnimation then
                    v283 = true;
                    if v282 ~= v22.AssetTypeIdStrings.RunAnimation then
                        v283 = true;
                        if v282 ~= v22.AssetTypeIdStrings.SwimAnimation then
                            v283 = v282 == v22.AssetTypeIdStrings.WalkAnimation;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v283;
end;
v79.getNumElementsWithKeyField = function(v284) --[[ Line: 991 ]] --[[ Name: getNumElementsWithKeyField ]]
    local v285 = 0;
    if v284 then
        for _, v287 in v284 do
            if typeof(v287) == "table" and v287.key then
                v285 = v285 + 1;
            end;
        end;
    end;
    return v285;
end;
v79.lerp = function(v288, v289, v290) --[[ Line: 1003 ]] --[[ Name: lerp ]]
    return (v289 - v288) * v290 + v288;
end;
v79.getTopBarHeightAvatarScene = function(v291) --[[ Line: 1007 ]] --[[ Name: getTopBarHeightAvatarScene ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v29 (copy)
    if not v291.TopBar then
        return 0;
    elseif v291.DeviceOrientation == l_DeviceOrientationMode_0.Landscape then
        return v291.TopBar.statusBarHeight + v29.NAV_BAR_SIZE;
    else
        return v291.TopBar.topBarHeight;
    end;
end;
v79.tableToCamelCaseKeys = function(v292) --[[ Line: 1021 ]] --[[ Name: tableToCamelCaseKeys ]]
    -- upvalues: v79 (copy)
    local v293 = {};
    for v294, v295 in v292 do
        local l_v294_0 = v294;
        if typeof(v294) == "string" then
            l_v294_0 = string.lower((string.sub(v294, 1, 1))) .. string.sub(v294, 2);
        end;
        local l_v295_0 = v295;
        if typeof(v295) == "table" then
            l_v295_0 = v79.tableToCamelCaseKeys(v295);
        end;
        v293[l_v294_0] = l_v295_0;
    end;
    return v293;
end;
v79.AssetTypeIdStringToEnumValue = function(v298) --[[ Line: 1042 ]] --[[ Name: AssetTypeIdStringToEnumValue ]]
    -- upvalues: v22 (copy)
    local v299 = v22.AssetTypeIdStringToName[v298];
    return Enum.AvatarAssetType[v299];
end;
v79.bundleIdToEnum = function(v300) --[[ Line: 1047 ]] --[[ Name: bundleIdToEnum ]]
    -- upvalues: v22 (copy)
    local v301 = v22.BundleTypeIdStringToName[v300];
    return Enum.BundleType[v301];
end;
v79.getSearchKey = function(v302, v303) --[[ Line: 1052 ]] --[[ Name: getSearchKey ]]
    -- upvalues: v44 (copy), v22 (copy)
    local v304 = v44.selectSortAndFiltersKey(v302);
    return v22.SearchCatalogKey .. v303 .. "." .. v304;
end;
local function v306(v305) --[[ Line: 1057 ]]
    -- upvalues: v13 (copy)
    assert(v13.strictInterface({
        searchUuid = v13.union(v13.number, v13.string), 
        searchKeyword = v13.optional(v13.string), 
        recordSearchTime = v13.optional(v13.boolean), 
        categoryInfo = v13.optional(v13.table), 
        minPrice = v13.optional(v13.number), 
        maxPrice = v13.optional(v13.number), 
        catalogSort = v13.optional(v13.string), 
        categoryFilter = v13.optional(v13.enum(Enum.CatalogCategoryFilter)), 
        topics = v13.optional(v13.array(v13.string))
    })(v305));
end;
local function v308(v307) --[[ Line: 1072 ]]
    -- upvalues: v13 (copy), l_FFlagAXDurablesSupport_0 (copy)
    assert(v13.strictInterface({
        CatalogSort = v13.optional(v13.string), 
        CatalogSortAggregation = v13.optional(v13.string), 
        PriceRange = v13.strictInterface({
            maxPrice = v13.number, 
            minPrice = v13.number
        }), 
        SelectedTopics = v13.optional(v13.array(v13.string)), 
        SalesTypeFilter = v13.optional(v13.string), 
        CreatorFilter = v13.optional(v13.string), 
        UnavailableItemFilter = v13.optional(v13.string), 
        WearTimeFilter = if l_FFlagAXDurablesSupport_0 then v13.optional(v13.string) else nil
    })(v307));
end;
local function v314(v309, v310, v311) --[[ Line: 1098 ]]
    -- upvalues: v10 (copy), v79 (copy)
    if v310 ~= nil and #v310 > 0 then
        v309.AssetTypes = v10.List.map(v310, function(v312) --[[ Line: 1100 ]]
            -- upvalues: v79 (ref)
            return v79.AssetTypeIdStringToEnumValue(v312);
        end);
    end;
    if v311 ~= nil and #v311 > 0 then
        v309.BundleTypes = v10.List.map(v311, function(v313) --[[ Line: 1107 ]]
            -- upvalues: v79 (ref)
            return v79.bundleIdToEnum(v313);
        end);
    end;
end;
local function v317(v315) --[[ Line: 1114 ]] --[[ Name: hasSortOrFilters ]]
    -- upvalues: v28 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXTimedOptionsSalesTypeFilter_0 (copy)
    local v316 = true;
    if v315.SortType == Enum.CatalogSortType.Relevance then
        v316 = true;
        if v315.CreatorName == "" then
            v316 = true;
            if v315.SalesTypeFilter == Enum.SalesTypeFilter.All then
                v316 = true;
                if v315.SearchKeyword == "" then
                    v316 = true;
                    if v315.MinPrice <= v28.MinPriceFilter then
                        v316 = true;
                        if v315.MaxPrice >= v28.MaxPriceFilter then
                            v316 = v315.IncludeOffSale or game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and l_FFlagAXDurablesSupport_0 and not l_FFlagAXTimedOptionsSalesTypeFilter_0 and v315.TimedOptionFilter ~= Enum.CatalogTimedOptionFilter.All;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v316;
end;
if l_FFlagAXHttpCatalogV2SearchItemDetails_0 then
    v79.getSearchParamsAsQueryParams = function(v318, v319) --[[ Line: 1132 ]] --[[ Name: getSearchParamsAsQueryParams ]]
        -- upvalues: v317 (copy), v28 (copy)
        local v320 = {
            keyword = v318.SearchKeyword or "", 
            limit = v318.Limit
        };
        if v318.CategoryFilter ~= Enum.CatalogCategoryFilter.None and not v317(v318) then
            v320.categoryFilter = tostring(v318.CategoryFilter.Name);
        end;
        v320.sortType = v28.SortTypeAPIMap[tostring(v318.SortType.Name)];
        if v318.CreatorName and v318.CreatorName ~= "" then
            v320.creatorName = v318.CreatorName;
        end;
        if v319 and v319.TaxonomyUuid then
            v320.taxonomy = tostring(v319.TaxonomyUuid);
        else
            if v318.BundleTypes and #v318.BundleTypes > 0 then
                local v321 = {};
                for _, v323 in v318.BundleTypes do
                    table.insert(v321, v323.Value);
                end;
                v320.bundleTypeIds = v321;
            end;
            if v318.AssetTypes and #v318.AssetTypes > 0 then
                local v324 = {};
                for _, v326 in v318.AssetTypes do
                    table.insert(v324, v326.Value);
                end;
                v320.assetTypeIds = v324;
            end;
        end;
        v320.includeNotForSale = v318.IncludeOffSale;
        v320.creatorType = "All";
        if v318.MinPrice and v318.MinPrice > v28.MinPriceFilter then
            v320.minPrice = v318.MinPrice;
        end;
        if v318.MaxPrice and v318.MaxPrice < v28.MaxPriceFilter then
            v320.maxPrice = v318.MaxPrice;
        end;
        if v318.SalesTypeFilter and v318.SalesTypeFilter ~= Enum.SalesTypeFilter.All then
            v320.salesTypeFilter = tostring(v318.SalesTypeFilter.Name);
        end;
        if v318.SortAggregation and (v318.SortType == Enum.CatalogSortType.MostFavorited or v318.SortType == Enum.CatalogSortType.Bestselling) then
            v320.sortAggregation = tostring(v318.SortAggregation.Name);
        end;
        return v320;
    end;
end;
v79.getSearchParams = function(v327, v328, v329) --[[ Line: 1217 ]] --[[ Name: getSearchParams ]]
    -- upvalues: v306 (copy), v308 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXTimedOptionsSalesTypeFilter_0 (copy), l_FFlagAXCatalogSearchParamTypes_0 (copy), v314 (copy), v28 (copy), v59 (copy), v38 (copy), v36 (copy), l_FFlagAXRemoveTimedOptionsSalesTypeEnumCheck_0 (copy), v7 (copy), v37 (copy), v35 (copy), v317 (copy)
    v306(v327);
    v308(v328);
    local v330 = CatalogSearchParams.new();
    local v331 = nil;
    if v327.searchKeyword then
        v331 = v327.searchKeyword;
    end;
    v330.AssetTypes = {};
    v330.BundleTypes = {};
    v330.IncludeOffSale = false;
    if game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and l_FFlagAXDurablesSupport_0 and not l_FFlagAXTimedOptionsSalesTypeFilter_0 then
        v330.TimedOptionFilter = Enum.CatalogTimedOptionFilter.All;
    end;
    local v332 = false;
    local v333 = if l_FFlagAXCatalogSearchParamTypes_0 then v328.SelectedTopics else v327.topics or v328.SelectedTopics;
    if v333 and #v333 > 0 then
        v332 = true;
        local v334 = table.concat(v333, " ");
        if v331 == nil then
            v331 = v334;
        else
            if #v331 > 0 then
                v331 = v331 .. " ";
            end;
            v331 = v331 .. v334;
        end;
    end;
    if v331 then
        v330.SearchKeyword = v331;
    end;
    local v335 = 120;
    if not v331 and v329 then
        v335 = 30;
    end;
    v330.Limit = v335;
    if v327.categoryInfo == nil then
        local v336 = {};
        local v337 = {};
        v330.CategoryFilter = if l_FFlagAXCatalogSearchParamTypes_0 then Enum.CatalogCategoryFilter.None else v327.categoryFilter or Enum.CatalogCategoryFilter.None;
        v314(v330, v336, v337);
    else
        local l_CategoryFilter_0 = v327.categoryInfo.CategoryFilter;
        local v339 = v28.CategoryFilters[l_CategoryFilter_0];
        if v339 == nil or v332 then
            v330.CategoryFilter = Enum.CatalogCategoryFilter.None;
        else
            v330.CategoryFilter = v339;
        end;
        local l_AssetTypeIdStrings_0 = v327.categoryInfo.AssetTypeIdStrings;
        local l_BundleTypes_0 = v327.categoryInfo.BundleTypes;
        v314(v330, l_AssetTypeIdStrings_0, l_BundleTypes_0);
    end;
    local v342 = if l_FFlagAXCatalogSearchParamTypes_0 then v328.PriceRange.minPrice else v327.minPrice or v328.PriceRange.minPrice;
    local v343 = if l_FFlagAXCatalogSearchParamTypes_0 then v328.PriceRange.maxPrice else v327.maxPrice or v328.PriceRange.maxPrice;
    if v59 and v342 and v343 and v343 < v342 then
        local l_v343_0 = v343;
        v343 = v342;
        v342 = l_v343_0;
    end;
    if v28.MinPriceFilter < v342 then
        v330.MinPrice = v342;
    end;
    if v343 < v28.MaxPriceFilter then
        v330.MaxPrice = v343;
    end;
    local v345 = if l_FFlagAXCatalogSearchParamTypes_0 then v328.CatalogSort else v327.catalogSort or v328.CatalogSort;
    v330.SortType = Enum.CatalogSortType[v345];
    if v328.UnavailableItemFilter ~= v38.Hide then
        v330.IncludeOffSale = true;
    end;
    local l_SalesTypeFilter_0 = v328.SalesTypeFilter;
    if l_SalesTypeFilter_0 ~= v36.All then
        if l_FFlagAXTimedOptionsSalesTypeFilter_0 then
            if not l_FFlagAXRemoveTimedOptionsSalesTypeEnumCheck_0 then
                local v348 = pcall(function() --[[ Line: 1330 ]]
                    local _ = Enum.SalesTypeFilter.TimedOptions;
                end);
                if l_SalesTypeFilter_0 == v36.TimedOptions and not v348 then
                    v7("Referenced TimeOptions sales type but enum value is not present");
                else
                    v330.SalesTypeFilter = Enum.SalesTypeFilter[l_SalesTypeFilter_0];
                end;
            else
                v330.SalesTypeFilter = Enum.SalesTypeFilter[l_SalesTypeFilter_0];
            end;
        else
            v330.SalesTypeFilter = Enum.SalesTypeFilter[l_SalesTypeFilter_0];
        end;
    end;
    local l_CreatorFilter_0 = v328.CreatorFilter;
    if l_CreatorFilter_0 ~= nil and l_CreatorFilter_0 ~= "" then
        v330.CreatorName = l_CreatorFilter_0;
    end;
    if not l_FFlagAXTimedOptionsSalesTypeFilter_0 and game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and l_FFlagAXDurablesSupport_0 then
        local l_WearTimeFilter_0 = v328.WearTimeFilter;
        if l_WearTimeFilter_0 == v37.All then
            v330.TimedOptionFilter = Enum.CatalogTimedOptionFilter.All;
        elseif l_WearTimeFilter_0 == v37.TimedOptionsOnly then
            v330.TimedOptionFilter = Enum.CatalogTimedOptionFilter.TimedOptionOnly;
        end;
    end;
    if v345 == v35.MostFavorited or v345 == v35.Bestselling then
        v330.SortAggregation = Enum.CatalogSortAggregation[v328.CatalogSortAggregation];
    end;
    if v317(v330) then
        v330.CategoryFilter = Enum.CatalogCategoryFilter.None;
    end;
    return v330;
end;
v79.getWebAssetModelFromEquippedAssets = function(v351) --[[ Line: 1393 ]] --[[ Name: getWebAssetModelFromEquippedAssets ]]
    -- upvalues: v22 (copy)
    local v352 = {};
    for v353, v354 in v351 do
        local v355 = v22.LayeredAssetTypes[v353] ~= nil;
        for v356, v357 in v354 do
            table.insert(v352, {
                id = v356, 
                meta = v355 and v357 or nil
            });
        end;
    end;
    return v352;
end;
v79.createHumanoidDescriptionAccessoryInfo = function(v358, v359, v360) --[[ Line: 1415 ]] --[[ Name: createHumanoidDescriptionAccessoryInfo ]]
    -- upvalues: v22 (copy)
    local v361 = tonumber(v359);
    assert(v361 ~= nil, "assetIdAsNumber is not nil. Silence type checker.");
    return {
        AssetId = v361, 
        Order = v360.order, 
        AccessoryType = v360.type or v22.AssetTypeIdToAccessoryTypeEnum[v358], 
        IsLayered = v360.isLayered, 
        Position = v360.position, 
        Rotation = v360.rotation, 
        Scale = v360.scale
    };
end;
v79.createDefaultHumanoidDescriptionAccessoryInfo = function(v362, v363) --[[ Line: 1437 ]] --[[ Name: createDefaultHumanoidDescriptionAccessoryInfo ]]
    -- upvalues: v7 (copy), v22 (copy)
    local v364 = tonumber(v363);
    if v364 == nil then
        v7("Called AvatarExperienceUtils.createDefaultHumanoidDescriptionAccessoryInfo with assetId that does not convert to string.");
        v364 = 0;
    end;
    assert(v364, "assetIdAsNumber is non-nil: Silence type checker");
    return {
        AssetId = v364, 
        Order = v22.LayeredClothingOrder[v362], 
        AccessoryType = v22.AssetTypeIdToAccessoryTypeEnum[v362], 
        IsLayered = v22.LayeredAssetTypes[v362] ~= nil
    };
end;
v79.getNewFullViewEnum = function(v365) --[[ Line: 1462 ]] --[[ Name: getNewFullViewEnum ]]
    -- upvalues: v34 (copy)
    if v365 == v34.None then
        return v34.UIFullView;
    else
        return v34.None;
    end;
end;
v79.getPartCFrame = function(v366, v367) --[[ Line: 1470 ]] --[[ Name: getPartCFrame ]]
    -- upvalues: v22 (copy)
    if v366 and v366:FindFirstChild(v367) then
        return v366[v367].CFrame;
    else
        return CFrame.new(v22.DefaultRigPosition);
    end;
end;
v79.getAttachmentCFrame = function(v368, v369, v370) --[[ Line: 1478 ]] --[[ Name: getAttachmentCFrame ]]
    -- upvalues: l_FFlagAvatarJointUpgradeInUA_0 (copy)
    if v368 and v368:FindFirstChild(v369) then
        local v371 = v368[v369];
        local v372 = if l_FFlagAvatarJointUpgradeInUA_0 then v371:FindFirstChild(v370, true) else v371:FindFirstChild(v370);
        if v372 then
            if l_FFlagAvatarJointUpgradeInUA_0 then
                return v372.WorldCFrame;
            else
                return v371.CFrame * v372.CFrame;
            end;
        end;
    end;
    return nil;
end;
v79.getRecursiveAttachmentCFrame = function(v373) --[[ Line: 1494 ]] --[[ Name: getRecursiveAttachmentCFrame ]]
    local l_CFrame_0 = v373.CFrame;
    local l_Parent_0 = v373.Parent;
    while l_Parent_0 and l_Parent_0:IsA("Bone") do
        l_CFrame_0 = l_Parent_0.CFrame * l_CFrame_0;
        l_Parent_0 = l_Parent_0.Parent;
    end;
    return l_CFrame_0;
end;
v79.isLCCategory = function(v376) --[[ Line: 1509 ]] --[[ Name: isLCCategory ]]
    -- upvalues: v22 (copy)
    if v376 and v376.AssetTypeIdStrings then
        for _, v378 in v376.AssetTypeIdStrings do
            if v22.LayeredAssetTypes[v378] ~= nil then
                if v22.LayeredAssetTypes[v378] == Enum.AccessoryType.Hair then
                    return false;
                else
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;
v79.isShoeBundle = function(v379) --[[ Line: 1535 ]] --[[ Name: isShoeBundle ]]
    -- upvalues: v22 (copy)
    local v380 = true;
    if v379.bundleType ~= v22.BundleTypeIdStrings.Shoes then
        v380 = v379.bundleType == Enum.BundleType.Shoes.Name;
    end;
    return v380;
end;
v79.isBundleOrLCAsset = function(v381, v382) --[[ Line: 1547 ]] --[[ Name: isBundleOrLCAsset ]]
    -- upvalues: v22 (copy)
    local v383 = v381 == v22.ItemType.Bundle;
    return v381 == v22.ItemType.Asset and v22.LayeredAssetTypes[v382] ~= nil or v383;
end;
v79.isBoundingBoxVectorSane = function(v384) --[[ Line: 1559 ]] --[[ Name: isBoundingBoxVectorSane ]]
    local v385 = false;
    if v384.X <= 50000 then
        v385 = false;
        if v384.X >= -50000 then
            v385 = false;
            if v384.Y <= 50000 then
                v385 = false;
                if v384.Y >= -50000 then
                    v385 = false;
                    if v384.Z <= 50000 then
                        v385 = v384.Z >= -50000;
                    end;
                end;
            end;
        end;
    end;
    return v385;
end;
v79.isBoundingBoxCFrameSane = function(v386) --[[ Line: 1573 ]] --[[ Name: isBoundingBoxCFrameSane ]]
    -- upvalues: v79 (copy)
    return v79.isBoundingBoxVectorSane(v386.Position) and v79.isBoundingBoxVectorSane(v386.LookVector);
end;
v79.getAssetIdsWithGeometryFromHumanoidDescription = function(v387) --[[ Line: 1583 ]] --[[ Name: getAssetIdsWithGeometryFromHumanoidDescription ]]
    if v387 == nil then
        return {};
    else
        local v388 = {};
        for _, v390 in (v387:GetAccessories(true)) do
            if v390.AssetId then
                table.insert(v388, v390.AssetId);
            end;
        end;
        if v387.Torso then
            table.insert(v388, v387.Torso);
        end;
        if v387.RightLeg then
            table.insert(v388, v387.RightLeg);
        end;
        if v387.RightArm then
            table.insert(v388, v387.RightArm);
        end;
        if v387.LeftLeg then
            table.insert(v388, v387.LeftLeg);
        end;
        if v387.LeftArm then
            table.insert(v388, v387.LeftArm);
        end;
        if v387.Head then
            table.insert(v388, v387.Head);
        end;
        return v388;
    end;
end;
v79.calculateNewAssetIdsWithGeometry = function(v391, v392) --[[ Line: 1621 ]] --[[ Name: calculateNewAssetIdsWithGeometry ]]
    -- upvalues: v79 (copy), v10 (copy)
    if not v391 or not v392 then
        return {};
    else
        local v393 = v79.getAssetIdsWithGeometryFromHumanoidDescription(v391);
        local v394 = v79.getAssetIdsWithGeometryFromHumanoidDescription(v392);
        local v395 = v10.List.toSet(v393);
        return (v10.List.filter(v394, function(v396) --[[ Line: 1632 ]]
            -- upvalues: v395 (copy)
            return v395[v396] == nil;
        end));
    end;
end;
v79.getItemIconTypeFromOutfit = function(v397) --[[ Line: 1638 ]] --[[ Name: getItemIconTypeFromOutfit ]]
    -- upvalues: v22 (copy), l_ItemTileEnums_0 (copy)
    local v398 = v397.outfitType == v22.OutfitTypes.DynamicHead;
    local l_containsDynamicHead_0 = v397.containsDynamicHead;
    if v398 or l_containsDynamicHead_0 then
        return l_ItemTileEnums_0.ItemIconType.DynamicHead;
    else
        return nil;
    end;
end;
v79.getItemStatusStyleFromOutfit = function(v400) --[[ Line: 1649 ]] --[[ Name: getItemStatusStyleFromOutfit ]]
    -- upvalues: l_ItemTileEnums_0 (copy)
    local l_moderationStatus_0 = v400.moderationStatus;
    if l_moderationStatus_0 == Enum.ModerationStatus.ReviewedRejected then
        return l_ItemTileEnums_0.StatusStyle.AlertIcon;
    elseif l_moderationStatus_0 == Enum.ModerationStatus.NotReviewed then
        return l_ItemTileEnums_0.StatusStyle.PendingIcon;
    else
        return nil;
    end;
end;
v79.isModerationPendingOrRejected = function(v402) --[[ Line: 1660 ]] --[[ Name: isModerationPendingOrRejected ]]
    local v403 = true;
    if v402 ~= Enum.ModerationStatus.NotReviewed then
        v403 = v402 == Enum.ModerationStatus.ReviewedRejected;
    end;
    return v403;
end;
v79.getMessageTypeFromModerationStatus = function(v404) --[[ Line: 1665 ]] --[[ Name: getMessageTypeFromModerationStatus ]]
    if not v404 then
        return nil;
    elseif v404 == Enum.ModerationStatus.NotReviewed then
        return "UnavailableItems";
    elseif v404 == Enum.ModerationStatus.ReviewedRejected then
        return "ItemDidNotMeetRobloxCommunityStandards";
    else
        return nil;
    end;
end;
v79.getModerationStatusFromAvailabilityStatus = function(v405) --[[ Line: 1680 ]] --[[ Name: getModerationStatusFromAvailabilityStatus ]]
    -- upvalues: l_InventoryItemAvailability_0 (copy)
    if not v405 then
        return nil;
    else
        return ({
            [l_InventoryItemAvailability_0.Invalid] = Enum.ModerationStatus.Invalid, 
            [l_InventoryItemAvailability_0.Available] = Enum.ModerationStatus.ReviewedApproved, 
            [l_InventoryItemAvailability_0.Unavailable] = Enum.ModerationStatus.ReviewedRejected, 
            [l_InventoryItemAvailability_0.Revoked] = Enum.ModerationStatus.NotApplicable, 
            [l_InventoryItemAvailability_0.PartiallyAvailableWithUnavailableSubitems] = Enum.ModerationStatus.NotApplicable, 
            [l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems] = Enum.ModerationStatus.NotApplicable, 
            [l_InventoryItemAvailability_0.Expired] = Enum.ModerationStatus.NotApplicable, 
            [l_InventoryItemAvailability_0.PendingReview] = Enum.ModerationStatus.NotReviewed
        })[v405];
    end;
end;
v79.assetTypeIdIsAnimationOrEmote = function(v406) --[[ Line: 1699 ]] --[[ Name: assetTypeIdIsAnimationOrEmote ]]
    -- upvalues: v22 (copy)
    if not v406 then
        return false;
    else
        return v22.AssetTypeIdToCategory[v406] == v22.AssetCategories.Animation;
    end;
end;
local v409 = l_memoize_0(function(v407) --[[ Line: 1709 ]]
    -- upvalues: v22 (copy)
    local v408 = v407 and v407[v22.AssetTypeIdStrings.MoodAnimation];
    return v408 and next(v408);
end);
v79.getEquippedMoodAssetId = function(v410) --[[ Line: 1716 ]] --[[ Name: getEquippedMoodAssetId ]]
    -- upvalues: v409 (copy)
    local l_EquippedAssets_0 = v410.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    return v409(l_EquippedAssets_0);
end;
v79.getAssetIdForPPEPose = function(v412) --[[ Line: 1721 ]] --[[ Name: getAssetIdForPPEPose ]]
    -- upvalues: v22 (copy), v79 (copy)
    local l_AvatarExperience_0 = v412.AvatarExperience;
    for _, v415 in v412.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
        if v415.itemType == v22.ItemType.Asset and v79.assetTypeIdIsAnimationOrEmote(v415.itemSubType) then
            return v415.itemId;
        end;
    end;
    if l_AvatarExperience_0.ProfilePictureEditor.ProfilePictureParams.emoteAssetId then
        return l_AvatarExperience_0.ProfilePictureEditor.ProfilePictureParams.emoteAssetId;
    else
        return nil;
    end;
end;
local v417 = l_memoize_0(function(v416) --[[ Line: 1742 ]]
    -- upvalues: v22 (copy)
    return v416 and v416[v22.AssetTypeIdStrings.Gear] and next(v416[v22.AssetTypeIdStrings.Gear]);
end);
v79.getEquippedToolId = function(v418) --[[ Line: 1749 ]] --[[ Name: getEquippedToolId ]]
    -- upvalues: v417 (copy)
    local l_EquippedAssets_1 = v418.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    return v417(l_EquippedAssets_1);
end;
v79.getNextPageCursorKey = function(v420, v421, v422) --[[ Line: 1758 ]] --[[ Name: getNextPageCursorKey ]]
    if v421 then
        return v420 .. (v422 or "");
    else
        return v420;
    end;
end;
v79.getPerformFetchKey = function(v423, v424, v425) --[[ Line: 1774 ]] --[[ Name: getPerformFetchKey ]]
    -- upvalues: v22 (copy)
    if v424 then
        return v22.OutfitsKey .. v423 .. (v425 or "");
    else
        return v22.UserInventoryKey .. v423;
    end;
end;
v79.getCurrentScreenIgnoreItemDetails = function(v426) --[[ Line: 1790 ]] --[[ Name: getCurrentScreenIgnoreItemDetails ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local l_name_2 = v426.current.name;
    local v428 = true;
    if l_name_2 ~= l_AvatarScreen_0.ItemDetails then
        v428 = true;
        if l_name_2 ~= l_AvatarScreen_0.LookDetails then
            v428 = l_name_2 == l_AvatarScreen_0.OutfitDetails;
        end;
    end;
    if v428 then
        l_name_2 = v426.opaque.name;
    end;
    return l_name_2;
end;
v79.getLargestPossibleOneLineTextSize = function(v429, v430, v431, v432) --[[ Line: 1809 ]] --[[ Name: getLargestPossibleOneLineTextSize ]]
    -- upvalues: l_TextService_0 (copy)
    v432 = v432 - 1;
    local v433 = Vector2.new(v432, 100000);
    while true do
        if v430 > 1 then
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v429, v430, v431.Font, v433);
            if l_l_TextService_0_TextSize_0.Y <= v430 + 1 then
                return Vector2.new(math.ceil(l_l_TextService_0_TextSize_0.X), (math.ceil(l_l_TextService_0_TextSize_0.Y))), v430;
            else
                v430 = v430 - 1;
            end;
        else
            return nil, nil;
        end;
    end;
end;
v79.selectSceneSize = function(v435) --[[ Line: 1845 ]] --[[ Name: selectSceneSize ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), l_getSafeAreaSize_0 (copy), v22 (copy)
    local l_GlobalGuiInset_0 = v435.GlobalGuiInset;
    local v437 = v435.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local l_ScreenSize_0 = v435.ScreenSize;
    local l_Offset_0 = l_getSafeAreaSize_0(l_ScreenSize_0, l_GlobalGuiInset_0).Y.Offset;
    local l_bottom_0 = l_GlobalGuiInset_0.bottom;
    local v441 = l_ScreenSize_0.Y - l_bottom_0;
    local v442 = l_Offset_0 * v22.PortraitSceneHeight;
    local v443 = v437 and v442 or v441;
    local v444 = l_ScreenSize_0.X * v22.LandscapeSceneWidth;
    return v443, v437 and l_ScreenSize_0.X or v444;
end;
v79.getColor3Difference = l_memoize_0(function(v445, v446) --[[ Line: 1865 ]]
    return (math.sqrt((v445.R - v446.R) * (v445.R - v446.R) + (v445.G - v446.G) * (v445.G - v446.G) + (v445.B - v446.B) * (v445.B - v446.B)));
end);
v79.bodyColorToBodyColor3 = l_memoize_0(function(v447) --[[ Line: 1869 ]]
    if v447 then
        return BrickColor.new(v447).Color;
    else
        return nil;
    end;
end);
v79.bodyPartForSkinColoringIdToBodyColorId = {
    headColor3 = "headColorId", 
    torsoColor3 = "torsoColorId", 
    rightArmColor3 = "rightArmColorId", 
    rightLegColor3 = "rightLegColorId", 
    leftArmColor3 = "leftArmColorId", 
    leftLegColor3 = "leftLegColorId"
};
v79.bodyColorIdToBodyPartForSkinColoringId = {};
for v448, v449 in pairs(v79.bodyPartForSkinColoringIdToBodyColorId) do
    v79.bodyColorIdToBodyPartForSkinColoringId[v449] = v448;
end;
v79.convertBodyColor3sToHexes = l_memoize_0(function(v450) --[[ Line: 1902 ]]
    local v451 = {};
    for v452, v453 in pairs(v450) do
        v451[v452] = v453:ToHex();
    end;
    return v451;
end);
v79.convertBodyColor3HexesToColor3s = l_memoize_0(function(v454) --[[ Line: 1920 ]]
    local v455 = {};
    for v456, v457 in pairs(v454) do
        v455[v456] = Color3.fromHex(v457);
    end;
    return v455;
end);
v79.isAvatarSceneButtonsVisible = function(v458, v459, v460, v461, v462) --[[ Line: 1929 ]] --[[ Name: isAvatarSceneButtonsVisible ]]
    -- upvalues: l_AvatarScreenProperties_0 (copy)
    local v463 = (l_AvatarScreenProperties_0[v458.opaque.name] or {}).refinementButtonVisible and not v460 and not v461;
    if v462 then
        return v463 and v462.state.key == v458.opaque.key;
    else
        return v463 and v459;
    end;
end;
v79.isUserCameraEligible = function() --[[ Line: 1952 ]] --[[ Name: isUserCameraEligible ]]
    -- upvalues: v10 (copy), l_Players_0 (copy), v54 (copy)
    local l_CameraDevices_0 = game:GetService("VideoCaptureService"):GetCameraDevices();
    local v465 = v10.isEmpty(l_CameraDevices_0);
    assert(l_Players_0 ~= nil, "Players should always be defined");
    return not (v465 or v54);
end;
v79.getUserId = function(v466) --[[ Line: 1961 ]] --[[ Name: getUserId ]]
    if v466.LocalUserId then
        return v466.LocalUserId;
    elseif v466.RobloxUser and v466.RobloxUser.rbxuid then
        return (tostring(v466.RobloxUser.rbxuid));
    else
        return nil;
    end;
end;
v79.isItemSelectable = function(v467) --[[ Line: 1973 ]] --[[ Name: isItemSelectable ]]
    if v467 == nil then
        return false;
    else
        local l_noPriceStatus_0 = v467.noPriceStatus;
        if l_noPriceStatus_0 == nil or l_noPriceStatus_0 == "Free" then
            return true;
        elseif l_noPriceStatus_0 == "Unavailable" then
            return false;
        elseif v467.quantityOwned > 0 then
            return true;
        else
            return false;
        end;
    end;
end;
v79.isTryingOnClassicFace = function(v469) --[[ Line: 1991 ]] --[[ Name: isTryingOnClassicFace ]]
    -- upvalues: v11 (copy), v22 (copy)
    return v11.some(v469, function(v470) --[[ Line: 1992 ]]
        -- upvalues: v22 (ref)
        local v471 = false;
        if v470.itemType == "Asset" then
            v471 = v470.itemSubType == v22.AssetTypeIdStrings.Face;
        end;
        return v471;
    end);
end;
v79.isTryingOnDynamicHead = function(v472) --[[ Line: 1997 ]] --[[ Name: isTryingOnDynamicHead ]]
    -- upvalues: v11 (copy), v22 (copy)
    return v11.some(v472, function(v473) --[[ Line: 1998 ]]
        -- upvalues: v22 (ref)
        local v474 = false;
        if v473.itemType == "Bundle" then
            v474 = v473.itemSubType == v22.BundleTypeIdStrings.DynamicHead;
        end;
        return v474;
    end);
end;
v79.getRecommendedAssetTypeIdStringFromCategoryInfo = l_memoize_0(function(v475) --[[ Line: 2008 ]]
    if v475.RecommendedAssetTypeIdString then
        return v475.RecommendedAssetTypeIdString;
    elseif v475.AssetTypeIdStrings and #v475.AssetTypeIdStrings == 1 then
        return v475.AssetTypeIdStrings[1];
    else
        return nil;
    end;
end);
v79.getRecommendedKey = l_memoize_0(function(v476) --[[ Line: 2022 ]]
    -- upvalues: v23 (copy), v79 (copy), v7 (copy), v22 (copy), v61 (copy)
    if v476.RecommendationsType == v23.RecommendationsType.Asset then
        local v477 = v79.getRecommendedAssetTypeIdStringFromCategoryInfo(v476);
        if not v477 then
            v7("called getRecommendedKey with a category with no assetTypeIdString");
            return v22.AssetTypeIdStrings.Hat;
        else
            return v477;
        end;
    elseif v476.RecommendationsType == v23.RecommendationsType.BodyParts then
        return v23.RecommendationsType.BodyParts;
    elseif v476.RecommendationsType == v23.RecommendationsType.AvatarAnimations then
        return v23.RecommendationsType.AvatarAnimations;
    elseif v476.RecommendationsType == v23.RecommendationsType.Shoes then
        return v23.RecommendationsType.Shoes;
    elseif v476.RecommendationsType == v23.RecommendationsType.DynamicHeads then
        return v23.RecommendationsType.DynamicHeads;
    elseif v61() and v476.RecommendationsType == v23.RecommendationsType.All then
        return v23.RecommendationsType.All;
    else
        return v23.RecommendationsType.None;
    end;
end);
v79.getCategoryInfoByName = l_memoize_0(function(v478, v479, v480) --[[ Line: 2055 ]]
    -- upvalues: v79 (copy)
    local v481 = nil;
    local v482 = nil;
    for v483, v484 in v478 do
        if v484.Name == v479 then
            v481 = v483;
            if v480 and v484.Subcategories then
                for v485, v486 in v484.Subcategories do
                    if v486.Name == v480 then
                        v482 = v485;
                        break;
                    end;
                end;
                assert(v482 ~= nil, "Could not find subcategory with name " .. v480);
                break;
            else
                break;
            end;
        end;
    end;
    assert(v481 ~= nil, "Could not find category with name  " .. v479);
    return (v79.getCategoryInfo(v478, v481, v482));
end);
v79.getAssetIdFromContent = l_memoize_0(function(v487) --[[ Line: 2081 ]]
    if v487 == nil then
        return nil;
    else
        assert(v487, "contentId is not nil: silences type checker");
        local v488 = string.match(v487, ".*?id=([0-9]+)");
        if v488 then
            return v488;
        else
            return string.match(v487, "rbxassetid://([0-9]+)");
        end;
    end;
end);
v79.sortOutfitTryOnItemsByRecency = l_memoize_0(function(v489, v490) --[[ Line: 2096 ]]
    local v491 = {};
    for _, v493 in v489 do
        table.insert(v491, v493);
    end;
    table.sort(v491, function(v494, v495) --[[ Line: 2103 ]]
        -- upvalues: v490 (copy)
        if v494.itemRecency and v495.itemRecency then
            if v490 then
                return v494.itemRecency > v495.itemRecency;
            else
                return v494.itemRecency < v495.itemRecency;
            end;
        else
            return false;
        end;
    end);
    return v491;
end);
v79.fuzzyEq = function(v496, v497, v498) --[[ Line: 2118 ]]
    return (v498 or 0.001) > math.abs(v496 - v497);
end;
v79.getCreatorNameTileFooterEnabled = function(v499) --[[ Line: 2123 ]]
    return v499 and v499.customizedDataMap and v499.customizedDataMap.creatorNameTileFooterEnabled == "true";
end;
v79.translateString = function(v500, v501) --[[ Line: 2137 ]] --[[ Name: translateString ]]
    -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy), v7 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v503 = l_Localization_0.new(l_RobloxLocaleId_0);
    v503:SetLocale(l_RobloxLocaleId_0);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 2142 ]]
        -- upvalues: v503 (copy), v500 (copy), v501 (copy)
        return v503:Format(v500, v501);
    end);
    if l_status_0 then
        return l_result_0;
    else
        v7("Failed to translate string with key: " .. v500);
        return "";
    end;
end;
v79.resolveEditorCategory = function(v506) --[[ Line: 2160 ]] --[[ Name: resolveEditorCategory ]]
    -- upvalues: v21 (copy)
    for _, v508 in (v21()) do
        if v508.Id == v506 then
            return v508.Category, nil;
        elseif v508.Subcategories then
            for _, v510 in v508.Subcategories do
                if v510.Id == v506 then
                    return v508.Category, v510.Subcategory;
                end;
            end;
        end;
    end;
    return nil, nil;
end;
return v79;