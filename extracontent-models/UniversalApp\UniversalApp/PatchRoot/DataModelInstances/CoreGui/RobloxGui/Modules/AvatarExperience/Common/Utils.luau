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
local v68 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v69 = {};
local v70 = {};
local v71 = string.split(v55, ",") or {};
v69 = v10.List.map(v71, function(v72) --[[ Line: 123 ]]
    return v72:match("^%s*(.*)%s*$");
end);
local v73 = string.split(v56, ",") or {};
v70 = v10.List.map(v73, function(v74) --[[ Line: 130 ]]
    return v74:match("^%s*(.*)%s*$");
end);
local v75 = {
    PageType = v22.PageType.Other, 
    RecommendationsType = v23.RecommendationsType.None
};
local v76 = {
    PageType = v22.PageType.Other, 
    RecommendationsType = v23.RecommendationsType.None, 
    CanAnimateCameraBasedMood = true
};
local v77 = {};
local v78 = {};
local v79 = {};
local v86 = l_memoize_0(function(v80, v81, v82) --[[ Line: 176 ]]
    -- upvalues: v10 (copy), v22 (copy)
    local v83 = v80[v81];
    if v83.Subcategories and v82 then
        local v84 = v83.Subcategories[v82];
        if v84 then
            local v85 = v10.Dictionary.join(v83, v84);
            v85.AssetTypeIdStrings = v84.AssetTypeIdStrings;
            v85.BundleTypes = v84.BundleTypes;
            v85.CategoryFilter = v84.CategoryFilter;
            v85.Subcategories = v84.Subcategories;
            return v85;
        end;
    end;
    if v83.PageType == v22.PageType.Emotes then
        return v10.Dictionary.join(v83, {
            EmoteSlot = v82
        });
    else
        return v83;
    end;
end);
local v94 = l_memoize_0(function(v87, v88, v89) --[[ Line: 219 ]]
    -- upvalues: v45 (copy), l_FFlagAXMutedErrorLoggingForCategorySelection_0 (copy), v7 (copy), v10 (copy), v22 (copy)
    local v90 = v45.extractCategoryById(v88, v87);
    if l_FFlagAXMutedErrorLoggingForCategorySelection_0 and v90 == nil then
        v7("[buildCategoryInfoById] Category not found for categoryId: " .. tostring(v88) .. " and subcategoryId: " .. tostring(v89));
    end;
    if v90.Subcategories and v89 then
        local l_Subcategories_0 = v90.Subcategories;
        local v92 = v45.extractSubcategoryById(v89, l_Subcategories_0);
        if v92 then
            local v93 = v10.Dictionary.join(v90, v92);
            v93.AssetTypeIdStrings = v92.AssetTypeIdStrings;
            v93.BundleTypes = v92.BundleTypes;
            v93.CategoryFilter = v92.CategoryFilter;
            v93.Subcategories = v92.Subcategories;
            v93.SubcategoriesMap = v92.SubcategoriesMap;
            return v93;
        end;
    end;
    if v90.PageType == v22.PageType.Emotes then
        return v10.Dictionary.join(v90, {
            EmoteSlot = v89
        });
    else
        return v90;
    end;
end);
local function _(v95, v96, v97) --[[ Line: 270 ]] --[[ Name: categoryKey ]]
    return string.format("%s.%s.%s", tostring(v95), tostring(v96), (tostring(v97)));
end;
local function _(v99, v100, v101) --[[ Line: 274 ]] --[[ Name: categoryKeyV2 ]]
    return string.format("%s.%s.%s", tostring(v99), tostring(v100), (tostring(v101)));
end;
v77.getCategoryInfo = l_memoize_0(function(v103, v104, v105) --[[ Line: 283 ]]
    -- upvalues: v78 (copy), v86 (copy)
    local v106 = string.format("%s.%s.%s", tostring(v103), tostring(v104), (tostring(v105)));
    local v107 = v78[v106];
    if v107 == nil then
        v107 = v86(v103, v104, v105);
        v78[v106] = v107;
    end;
    return v107;
end);
v77.getCategoryInfoById = l_memoize_0(function(v108, v109, v110) --[[ Line: 295 ]]
    -- upvalues: v79 (copy), v94 (copy)
    local v111 = string.format("%s.%s.%s", tostring(v108), tostring(v109), (tostring(v110)));
    local v112 = v79[v111];
    if v112 == nil then
        v112 = v94(v108, v109, v110);
        v79[v111] = v112;
    end;
    return v112;
end);
v77.getCatalogCategoryInfo = l_memoize_0(function(v113, v114) --[[ Line: 307 ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v27 (copy), v26 (copy), v77 (copy)
    local v115 = if l_FFlagAXCatalogCategoriesStore_0 then v27() else v26();
    return v77.getCategoryInfo(v115, v113, v114);
end);
v77.getCatalogCategoryInfoById = l_memoize_0(function(v116, v117) --[[ Line: 316 ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v27 (copy), v26 (copy), v77 (copy)
    local v118 = if l_FFlagAXCatalogCategoriesStore_0 then v27() else v26();
    return v77.getCategoryInfoById(v118, v116, v117);
end);
v77.getAvatarEditorCategoryInfo = l_memoize_0(function(v119, v120) --[[ Line: 325 ]]
    -- upvalues: v21 (copy), v77 (copy)
    local v121 = v21();
    return v77.getCategoryInfo(v121, v119, v120);
end);
local function _(v122) --[[ Line: 331 ]] --[[ Name: getCatalogCardFooterHeight ]]
    if v122 < 100 then
        return 30;
    elseif v122 < 148 then
        return 36;
    else
        return 42;
    end;
end;
local v133 = l_memoize_0(function(v124, _, v126) --[[ Line: 341 ]]
    -- upvalues: v22 (copy)
    local v127 = if v126 then v22.CreatorNameItemTileTitleMaxLines else v22.ItemTileTitleMaxLines;
    local v128 = if v126 then v22.CreatorNameItemTilePadding else v22.ItemTilePadding;
    return function(v129) --[[ Line: 349 ]]
        -- upvalues: v127 (copy), v124 (copy), v128 (copy), v126 (copy)
        local v130 = v127 * v124;
        local v131 = v128 * 2;
        local v132 = v129 < 100 and 30 or v129 < 148 and 36 or 42;
        if v126 then
            v132 = v132 * 2;
        end;
        return v129 + v130 + v131 + v132;
    end;
end);
local v144 = l_memoize_0(function(v134, _, v136) --[[ Line: 364 ]]
    -- upvalues: v22 (copy)
    local v137 = if v136 then v22.CreatorNameItemTileTitleMaxLines else v22.ItemTileTitleMaxLines;
    local v138 = if v136 then v22.CreatorNameItemTilePadding else v22.ItemTilePadding;
    return function(v139) --[[ Line: 372 ]]
        -- upvalues: v22 (ref), v137 (copy), v134 (copy), v138 (copy), v136 (copy)
        local v140 = v139 / v22.ItemTileTallAspectRatio;
        local v141 = v137 * v134;
        local v142 = v138 * 2;
        local v143 = v139 < 100 and 30 or v139 < 148 and 36 or 42;
        if v136 then
            v143 = v143 * 2;
        end;
        return v140 + v141 + v142 + v143;
    end;
end);
v77.isLooksWidget = function(v145) --[[ Line: 388 ]] --[[ Name: isLooksWidget ]]
    -- upvalues: v69 (ref)
    return table.find(v69, v145) ~= nil;
end;
v77.isAvatarLooksWidget = function(v146) --[[ Line: 397 ]] --[[ Name: isAvatarLooksWidget ]]
    -- upvalues: v77 (copy), v70 (ref)
    return v77.isLooksWidget(v146) and table.find(v70, v146) ~= nil;
end;
local v155 = l_memoize_0(function(v147, _, v149, v150, v151) --[[ Line: 404 ]]
    -- upvalues: v22 (copy)
    return function(v152) --[[ Line: 411 ]]
        -- upvalues: v22 (ref), v149 (copy), v150 (copy), v151 (copy), v147 (copy)
        local v153 = v152 / v22.LookTileAspectRatio;
        local v154 = v149 or v150;
        if not v151 then
            v153 = v153 + 30;
        elseif v154 then
            v153 = v153 + 30;
        end;
        if v154 then
            v153 = v153 + 4;
        end;
        if v149 then
            v153 = v153 + v147;
        end;
        if v150 then
            if v149 then
                v153 = v153 + 4;
            end;
            v153 = v153 + v147;
        end;
        return v153;
    end;
end);
local v160 = l_memoize_0(function(v156) --[[ Line: 452 ]]
    -- upvalues: v22 (copy)
    return function(v157) --[[ Line: 453 ]]
        -- upvalues: v22 (ref), v156 (copy)
        local v158 = v22.ItemTileTitleMaxLines * v156;
        local l_ItemTilePadding_0 = v22.ItemTilePadding;
        return v157 + v158 + l_ItemTilePadding_0;
    end;
end);
local function v162(v161) --[[ Line: 461 ]] --[[ Name: squareItemHeightGetter ]]
    return v161;
end;
local v167 = l_memoize_0(function(v163) --[[ Line: 465 ]]
    -- upvalues: v162 (copy), l_FFlagAXSlotsInventoryLoadableGridView_0 (copy), v22 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
    if v163 == nil then
        return v162;
    else
        return function(v164) --[[ Line: 469 ]]
            -- upvalues: l_FFlagAXSlotsInventoryLoadableGridView_0 (ref), v22 (ref), v163 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (ref)
            local v165 = if l_FFlagAXSlotsInventoryLoadableGridView_0 then v22.EditorItemTileTitleMaxLines * v163 else v22.ItemTileTitleMaxLines * v163;
            local v166 = if l_FFlagAXRootSlotBasedEditorFlag_0 then v22.ItemTilePadding else v22.ItemTilePadding * 2;
            return v164 + v165 + v166;
        end;
    end;
end);
local function _(v168) --[[ Line: 483 ]] --[[ Name: splitKeywords ]]
    if v168 then
        return string.split(v168, " ");
    else
        return {};
    end;
end;
v77.mergeKeywordsAndTopics = function(v170, v171) --[[ Line: 503 ]] --[[ Name: mergeKeywordsAndTopics ]]
    local v172 = if v170 then string.split(v170, " ") else {};
    local v173 = if v171 then string.split(v171, " ") else {};
    for _, v175 in v173 do
        if #v175 > 0 and not table.find(v172, v175) then
            table.insert(v172, v175);
        end;
    end;
    return table.concat(v172, " ");
end;
v77.GetCategoryIdsFromNavKey = l_memoize_0(function(v176, v177) --[[ Line: 522 ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v27 (copy), v26 (copy)
    local v178 = if l_FFlagAXCatalogCategoriesStore_0 then v27() else v26();
    for _, v180 in v178 do
        if v180.NavigationKey then
            local l_Id_0 = v180.Id;
            if v180.NavigationKey == v176 then
                if v180.Subcategories and v177 then
                    for _, v183 in v180.Subcategories do
                        if v183.NavigationKey == v177 then
                            return l_Id_0, v183.Id;
                        end;
                    end;
                end;
                return l_Id_0, nil;
            end;
        end;
    end;
    return nil, nil;
end);
v77.GridItemHeightGetter = function(v184, ...) --[[ Line: 544 ]] --[[ Name: GridItemHeightGetter ]]
    -- upvalues: v22 (copy), v167 (copy), v162 (copy), v160 (copy), v155 (copy), v133 (copy), v144 (copy)
    if v184 == v22.ItemTileType.AvatarEditorTile then
        return v167(...);
    elseif v184 == v22.ItemTileType.BodyColorButton then
        return v162;
    elseif v184 == v22.ItemTileType.BundleItemTile then
        return v160(...);
    elseif v184 == v22.ItemTileType.BundleItemTileNoText then
        return v162;
    elseif v184 == v22.ItemTileType.LookItemTile then
        return v155(...);
    elseif v184 == v22.ItemTileType.CatalogItemTile then
        return v133(...);
    elseif v184 == v22.ItemTileType.TallCatalogItemTile then
        return v144(...);
    else
        warn("Unknown itemType " .. tostring(v184) .. " in AvatarExperienceUtils.GridItemHeightGetter");
        return v162;
    end;
end;
v77.GridItemHeightGetterWithOptions = function(v185) --[[ Line: 576 ]] --[[ Name: GridItemHeightGetterWithOptions ]]
    -- upvalues: v22 (copy), v167 (copy), v162 (copy), v160 (copy), v155 (copy), v133 (copy), v144 (copy)
    local l_itemTileType_0 = v185.itemTileType;
    if l_itemTileType_0 == v22.ItemTileType.AvatarEditorTile then
        return v167(v185.fontHeight);
    elseif l_itemTileType_0 == v22.ItemTileType.BodyColorButton then
        return v162;
    elseif l_itemTileType_0 == v22.ItemTileType.BundleItemTile and v185.fontHeight then
        return v160(v185.fontHeight);
    elseif l_itemTileType_0 == v22.ItemTileType.BundleItemTileNoText then
        return v162;
    elseif l_itemTileType_0 == v22.ItemTileType.LookItemTile and v185.fontHeight then
        return v155(v185.fontHeight, v185.hideItemName, v185.itemCreatorNamesEnabled, v185.itemPriceEnabled, v185.isWidgetFocused);
    elseif l_itemTileType_0 == v22.ItemTileType.CatalogItemTile then
        return v133(v185.fontHeight, nil, v185.itemCreatorNamesEnabled);
    elseif l_itemTileType_0 == v22.ItemTileType.TallCatalogItemTile then
        return v144(v185.fontHeight, nil, v185.itemCreatorNamesEnabled);
    else
        warn("Unknown itemType " .. tostring(l_itemTileType_0) .. " in AvatarExperienceUtils.GridItemHeightGetterWithOptions");
        return v162;
    end;
end;
v77.isAvatarBackground = function(v187) --[[ Line: 605 ]] --[[ Name: isAvatarBackground ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v187 == l_AvatarScreen_0.AvatarBackground;
end;
v77.isAvatarExperienceRoute = function(v188) --[[ Line: 609 ]] --[[ Name: isAvatarExperienceRoute ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_SwitchTab_0 (copy)
    local l_history_0 = v188.Navigation.history;
    for _, v191 in l_history_0[#l_history_0] do
        if v191.name == l_AvatarScreen_0.AvatarExperienceRoot or v191.name == l_SwitchTab_0.AvatarExperienceTab then
            return true;
        end;
    end;
    return false;
end;
v77.isRouteInAvatarEditor = function(v192) --[[ Line: 623 ]] --[[ Name: isRouteInAvatarEditor ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v192.opaque.name == l_AvatarScreen_0.AvatarEditor;
end;
v77.didLeaveAvatarEditor = function(v193, v194) --[[ Line: 632 ]] --[[ Name: didLeaveAvatarEditor ]]
    -- upvalues: v77 (copy)
    if v77.isRouteInAvatarEditor(v194) and not v77.isRouteInAvatarEditor(v193) then
        return true;
    else
        return false;
    end;
end;
v77.getIsSceneFullViewFromState = function(v195, v196) --[[ Line: 641 ]] --[[ Name: getIsSceneFullViewFromState ]]
    -- upvalues: v34 (copy)
    local l_name_0 = v196.opaque.name;
    return v195.AvatarExperience.Common.FullView[l_name_0] == v34.SceneFullView;
end;
v77.getCatalogCategoryInfoFromState = function(v198) --[[ Line: 646 ]] --[[ Name: getCatalogCategoryInfoFromState ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v7 (copy), v77 (copy)
    if l_FFlagAXCatalogCategoriesStore_0 then
        v7("getCatalogCategoryInfoFromState is not supported with FFlagAXCatalogCategoriesStore");
    end;
    local l_categoryId_0 = v198.AvatarExperience.Catalog.Categories.categoryId;
    local l_subcategoryId_0 = v198.AvatarExperience.Catalog.Categories.subcategoryId;
    return v77.getCatalogCategoryInfoById(l_categoryId_0, l_subcategoryId_0);
end;
v77.getAvatarEditorCategoryInfoFromState = function(v201) --[[ Line: 656 ]] --[[ Name: getAvatarEditorCategoryInfoFromState ]]
    -- upvalues: v77 (copy)
    local l_category_0 = v201.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v201.AvatarExperience.AvatarEditor.Categories.subcategory;
    return v77.getAvatarEditorCategoryInfo(l_category_0, l_subcategory_0);
end;
v77.getAvatarEditorSubcategoryFilterFromState = function(v204) --[[ Line: 664 ]] --[[ Name: getAvatarEditorSubcategoryFilterFromState ]]
    -- upvalues: v77 (copy)
    local v205 = v77.getAvatarEditorCategoryInfoFromState(v204);
    if v205.SubcategoryFilters then
        local l_subcategoryFilter_0 = v204.AvatarExperience.AvatarEditor.Categories.subcategoryFilter;
        return v205.SubcategoryFilters[l_subcategoryFilter_0];
    else
        return nil;
    end;
end;
v77.getSelectedAccessoryDescription = function(v207, v208) --[[ Line: 675 ]] --[[ Name: getSelectedAccessoryDescription ]]
    local v209 = tonumber(v208) or 0;
    for _, v211 in v207:GetChildren() do
        if v211:IsA("AccessoryDescription") and v211.AssetId == v209 then
            return v211;
        end;
    end;
    return nil;
end;
v77.getAccessoryAdjustmentCategoryInfo = function(v212) --[[ Line: 690 ]] --[[ Name: getAccessoryAdjustmentCategoryInfo ]]
    -- upvalues: v77 (copy), v42 (copy)
    local v213 = v212.AvatarExperience.AccessoryAdjustment.SelectedAccessory or "";
    local l_CurrentCharacter_0 = v212.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    assert(l_CurrentCharacter_0, "assert currentCharacter exists");
    local l_Humanoid_0 = l_CurrentCharacter_0:FindFirstChild("Humanoid");
    assert(l_Humanoid_0, "assert humanoid exists");
    local l_HumanoidDescription_0 = l_Humanoid_0:FindFirstChild("HumanoidDescription");
    assert(l_HumanoidDescription_0, "assert currentCharacter exists");
    local v217 = v77.getSelectedAccessoryDescription(l_HumanoidDescription_0, v213);
    if not v217 then
        return;
    else
        assert(v217, "assert accessoryDescription exists");
        return v42.CameraCategories[v217.AccessoryType];
    end;
end;
v77.getCategoryInfoFromState = function(v218, v219) --[[ Line: 717 ]] --[[ Name: getCategoryInfoFromState ]]
    -- upvalues: l_AvatarScreen_0 (copy), v77 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v68 (copy), v60 (copy), v50 (copy), v33 (copy), v22 (copy), v75 (copy), v41 (copy), v43 (copy), v76 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy)
    local l_name_1 = v219.opaque.name;
    if l_name_1 == l_AvatarScreen_0.AvatarEditor then
        return v77.getAvatarEditorCategoryInfoFromState(v218);
    elseif l_name_1 == l_AvatarScreen_0.Catalog then
        if l_FFlagAXCatalogCategoriesStore_0 then
            return (v68.getCatalogSelectionStore().selectedCategoryInfo(false));
        else
            return v77.getCatalogCategoryInfoFromState(v218);
        end;
    elseif l_name_1 == l_AvatarScreen_0.ProfilePictureEditorEmotes then
        if v60() then
            return (v50());
        else
            local v221 = v33().AssetTypeToCategorySubcategory[v22.AssetTypeIdStrings.EmoteAnimation];
            local l_category_1 = v221.category;
            local l_subcategory_1 = v221.subcategory;
            return v77.getAvatarEditorCategoryInfo(l_category_1, l_subcategory_1);
        end;
    elseif l_name_1 == l_AvatarScreen_0.AdjustAccessoryView then
        local v224 = v77.getAccessoryAdjustmentCategoryInfo(v218);
        if v224 then
            return v224;
        else
            return v75;
        end;
    elseif v41.readTestVariable(v43.EnabledForUser) and l_name_1 == l_AvatarScreen_0.CatalogSearch then
        return v76;
    elseif l_name_1 == l_AvatarScreen_0.HeadRefinement then
        return v22.HeadRefinementCameraCategory;
    elseif l_FFlagAXCustomizeMakeupSupport_0 and l_name_1 == l_AvatarScreen_0.LayeredMakeupSort then
        return v22.LayeredMakeupCameraCategory;
    else
        return v75;
    end;
end;
local v225 = {
    "Torso", 
    "RightArm", 
    "LeftArm", 
    "LeftLeg", 
    "RightLeg"
};
v77.routeIsProfilePictureEditor = function(v226) --[[ Line: 776 ]] --[[ Name: routeIsProfilePictureEditor ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local v227 = true;
    if v226.opaque.name ~= l_AvatarScreen_0.ProfilePictureEditorEmotes then
        v227 = true;
        if v226.opaque.name ~= l_AvatarScreen_0.ProfilePictureEditorCamera then
            v227 = v226.opaque.name == l_AvatarScreen_0.ProfilePictureEditorFinal;
        end;
    end;
    return v227;
end;
v77.routeIsPPEStaticImagePage = function(v228) --[[ Line: 786 ]] --[[ Name: routeIsPPEStaticImagePage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local v229 = true;
    if v228.opaque.name ~= l_AvatarScreen_0.ProfilePictureEditorCamera then
        v229 = v228.opaque.name == l_AvatarScreen_0.ProfilePictureEditorFinal;
    end;
    return v229;
end;
v77.isFullyQualifiedCostume = function(v230) --[[ Line: 791 ]] --[[ Name: isFullyQualifiedCostume ]]
    -- upvalues: v225 (copy)
    for _, v232 in v225 do
        if v230[v232] == "" or v230[v232] == 0 then
            return false;
        end;
    end;
    return true;
end;
v77.shouldShowGradientForScrollingFrame = function(v233) --[[ Line: 800 ]] --[[ Name: shouldShowGradientForScrollingFrame ]]
    local l_AbsoluteSize_0 = v233.AbsoluteSize;
    local l_CanvasSize_0 = v233.CanvasSize;
    local l_CanvasPosition_0 = v233.CanvasPosition;
    return l_AbsoluteSize_0.X < l_CanvasSize_0.X.Offset, l_CanvasPosition_0.X > 20, l_CanvasPosition_0.X + l_AbsoluteSize_0.X < l_CanvasSize_0.X.Offset - 20;
end;
v77.Round = function(v237, v238) --[[ Line: 813 ]] --[[ Name: Round ]]
    local v239 = v238 or 1;
    return math.floor((v237 + v239 / 2) / v239) * v239;
end;
v77.isFetchingDoneOrFailed = function(v240, v241) --[[ Line: 818 ]] --[[ Name: isFetchingDoneOrFailed ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    local v242 = true;
    if v240 ~= l_RetrievalStatus_0.Done then
        v242 = v240 == l_RetrievalStatus_0.Failed;
    end;
    local v243 = true;
    if v241 ~= l_RetrievalStatus_0.Done then
        v243 = v241 == l_RetrievalStatus_0.Failed;
    end;
    return not v242 and v243;
end;
v77.getDeviceType = function() --[[ Line: 826 ]] --[[ Name: getDeviceType ]]
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
v77.getUserOutfitIdFromBundle = function(v245) --[[ Line: 838 ]] --[[ Name: getUserOutfitIdFromBundle ]]
    -- upvalues: v22 (copy)
    for _, v247 in v245.items do
        if v247.type == v22.ItemType.Outfit then
            return v247.id;
        end;
    end;
    return nil;
end;
v77.getUserOutfitIdsFromBundle = function(v248) --[[ Line: 849 ]] --[[ Name: getUserOutfitIdsFromBundle ]]
    -- upvalues: v22 (copy)
    local v249 = {};
    if v248.items then
        for _, v251 in v248.items do
            if v251.type == v22.ItemType.Outfit then
                table.insert(v249, v251.id);
            end;
        end;
    end;
    return v249;
end;
v77.getBundleInfo = l_memoize_0(function(v252, v253) --[[ Line: 864 ]]
    if v253 == nil then
        return nil;
    else
        local v254 = v252[v253];
        if not v254 then
            return nil;
        elseif v254.receivedCatalogData then
            return v254;
        else
            return nil;
        end;
    end;
end);
v77.getBundleInfoFromState = function(v255, v256) --[[ Line: 880 ]] --[[ Name: getBundleInfoFromState ]]
    -- upvalues: v77 (copy)
    local l_BundleInfos_0 = v255.AvatarExperience.Common.BundleInfos;
    return v77.getBundleInfo(l_BundleInfos_0, v256);
end;
v77.getOutfitInfoFromBundleIdNoState = function(v258, v259) --[[ Line: 888 ]] --[[ Name: getOutfitInfoFromBundleIdNoState ]]
    -- upvalues: v77 (copy), v12 (copy), v10 (copy)
    if not v258 then
        return nil;
    else
        assert(v258, "contentId is not nil: silences type checker");
        local v260 = v77.getUserOutfitIdsFromBundle(v258);
        if #v260 < 1 then
            return nil;
        else
            local v261 = nil;
            for _, v263 in v260 do
                local v264 = v259[v263];
                if not v264 then
                    return nil;
                elseif not v261 then
                    v261 = v12.deepCopy(v264);
                else
                    v261.assets = v10.Dictionary.join(v261.assets, v264.assets);
                end;
            end;
            return v261;
        end;
    end;
end;
v77.getOutfitInfoFromBundleId = function(v265, v266) --[[ Line: 923 ]] --[[ Name: getOutfitInfoFromBundleId ]]
    -- upvalues: v77 (copy)
    local v267 = v77.getBundleInfoFromState(v265, v266);
    local l_OutfitInfos_0 = v265.AvatarExperience.AvatarEditor.OutfitInfos;
    return v77.getOutfitInfoFromBundleIdNoState(v267, l_OutfitInfos_0);
end;
v77.getAllCategoriesStr = function(v269) --[[ Line: 930 ]] --[[ Name: getAllCategoriesStr ]]
    local v270 = "";
    local v271 = 1;
    while true do
        local v272 = "level" .. v271;
        if v269[v272] then
            if v271 ~= 1 then
                v270 = v270 .. "|";
            end;
            v270 = v270 .. v269[v272];
            v271 = v271 + 1;
        else
            break;
        end;
    end;
    return v270;
end;
v77.isAnimationAssetType = function(v273) --[[ Line: 952 ]] --[[ Name: isAnimationAssetType ]]
    -- upvalues: v22 (copy)
    local v274 = true;
    if v273 ~= v22.AssetTypeIdStrings.ClimbAnimation then
        v274 = true;
        if v273 ~= v22.AssetTypeIdStrings.FallAnimation then
            v274 = true;
            if v273 ~= v22.AssetTypeIdStrings.IdleAnimation then
                v274 = true;
                if v273 ~= v22.AssetTypeIdStrings.JumpAnimation then
                    v274 = true;
                    if v273 ~= v22.AssetTypeIdStrings.RunAnimation then
                        v274 = true;
                        if v273 ~= v22.AssetTypeIdStrings.SwimAnimation then
                            v274 = v273 == v22.AssetTypeIdStrings.WalkAnimation;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v274;
end;
v77.getNumElementsWithKeyField = function(v275) --[[ Line: 962 ]] --[[ Name: getNumElementsWithKeyField ]]
    local v276 = 0;
    if v275 then
        for _, v278 in v275 do
            if typeof(v278) == "table" and v278.key then
                v276 = v276 + 1;
            end;
        end;
    end;
    return v276;
end;
v77.lerp = function(v279, v280, v281) --[[ Line: 974 ]] --[[ Name: lerp ]]
    return (v280 - v279) * v281 + v279;
end;
v77.getTopBarHeightAvatarScene = function(v282) --[[ Line: 978 ]] --[[ Name: getTopBarHeightAvatarScene ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v29 (copy)
    if not v282.TopBar then
        return 0;
    elseif v282.DeviceOrientation == l_DeviceOrientationMode_0.Landscape then
        return v282.TopBar.statusBarHeight + v29.NAV_BAR_SIZE;
    else
        return v282.TopBar.topBarHeight;
    end;
end;
v77.tableToCamelCaseKeys = function(v283) --[[ Line: 992 ]] --[[ Name: tableToCamelCaseKeys ]]
    -- upvalues: v77 (copy)
    local v284 = {};
    for v285, v286 in v283 do
        local l_v285_0 = v285;
        if typeof(v285) == "string" then
            l_v285_0 = string.lower((string.sub(v285, 1, 1))) .. string.sub(v285, 2);
        end;
        local l_v286_0 = v286;
        if typeof(v286) == "table" then
            l_v286_0 = v77.tableToCamelCaseKeys(v286);
        end;
        v284[l_v285_0] = l_v286_0;
    end;
    return v284;
end;
v77.AssetTypeIdStringToEnumValue = function(v289) --[[ Line: 1013 ]] --[[ Name: AssetTypeIdStringToEnumValue ]]
    -- upvalues: v22 (copy)
    local v290 = v22.AssetTypeIdStringToName[v289];
    return Enum.AvatarAssetType[v290];
end;
v77.bundleIdToEnum = function(v291) --[[ Line: 1018 ]] --[[ Name: bundleIdToEnum ]]
    -- upvalues: v22 (copy)
    local v292 = v22.BundleTypeIdStringToName[v291];
    return Enum.BundleType[v292];
end;
v77.getSearchKey = function(v293, v294) --[[ Line: 1023 ]] --[[ Name: getSearchKey ]]
    -- upvalues: v44 (copy), v22 (copy)
    local v295 = v44.selectSortAndFiltersKey(v293);
    return v22.SearchCatalogKey .. v294 .. "." .. v295;
end;
local function v297(v296) --[[ Line: 1028 ]]
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
    })(v296));
end;
local function v299(v298) --[[ Line: 1043 ]]
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
    })(v298));
end;
local function v305(v300, v301, v302) --[[ Line: 1069 ]]
    -- upvalues: v10 (copy), v77 (copy)
    if v301 ~= nil and #v301 > 0 then
        v300.AssetTypes = v10.List.map(v301, function(v303) --[[ Line: 1071 ]]
            -- upvalues: v77 (ref)
            return v77.AssetTypeIdStringToEnumValue(v303);
        end);
    end;
    if v302 ~= nil and #v302 > 0 then
        v300.BundleTypes = v10.List.map(v302, function(v304) --[[ Line: 1078 ]]
            -- upvalues: v77 (ref)
            return v77.bundleIdToEnum(v304);
        end);
    end;
end;
local function v308(v306) --[[ Line: 1085 ]] --[[ Name: hasSortOrFilters ]]
    -- upvalues: v28 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXTimedOptionsSalesTypeFilter_0 (copy)
    local v307 = true;
    if v306.SortType == Enum.CatalogSortType.Relevance then
        v307 = true;
        if v306.CreatorName == "" then
            v307 = true;
            if v306.SalesTypeFilter == Enum.SalesTypeFilter.All then
                v307 = true;
                if v306.SearchKeyword == "" then
                    v307 = true;
                    if v306.MinPrice <= v28.MinPriceFilter then
                        v307 = true;
                        if v306.MaxPrice >= v28.MaxPriceFilter then
                            v307 = v306.IncludeOffSale or game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and l_FFlagAXDurablesSupport_0 and not l_FFlagAXTimedOptionsSalesTypeFilter_0 and v306.TimedOptionFilter ~= Enum.CatalogTimedOptionFilter.All;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v307;
end;
if l_FFlagAXHttpCatalogV2SearchItemDetails_0 then
    v77.getSearchParamsAsQueryParams = function(v309, v310) --[[ Line: 1103 ]] --[[ Name: getSearchParamsAsQueryParams ]]
        -- upvalues: v308 (copy), v28 (copy)
        local v311 = {
            keyword = v309.SearchKeyword or "", 
            limit = v309.Limit
        };
        if v309.CategoryFilter ~= Enum.CatalogCategoryFilter.None and not v308(v309) then
            v311.categoryFilter = tostring(v309.CategoryFilter.Name);
        end;
        v311.sortType = v28.SortTypeAPIMap[tostring(v309.SortType.Name)];
        if v309.CreatorName and v309.CreatorName ~= "" then
            v311.creatorName = v309.CreatorName;
        end;
        if v310 and v310.TaxonomyUuid then
            v311.taxonomy = tostring(v310.TaxonomyUuid);
        else
            if v309.BundleTypes and #v309.BundleTypes > 0 then
                local v312 = {};
                for _, v314 in v309.BundleTypes do
                    table.insert(v312, v314.Value);
                end;
                v311.bundleTypeIds = v312;
            end;
            if v309.AssetTypes and #v309.AssetTypes > 0 then
                local v315 = {};
                for _, v317 in v309.AssetTypes do
                    table.insert(v315, v317.Value);
                end;
                v311.assetTypeIds = v315;
            end;
        end;
        v311.includeNotForSale = v309.IncludeOffSale;
        v311.creatorType = "All";
        if v309.MinPrice and v309.MinPrice > v28.MinPriceFilter then
            v311.minPrice = v309.MinPrice;
        end;
        if v309.MaxPrice and v309.MaxPrice < v28.MaxPriceFilter then
            v311.maxPrice = v309.MaxPrice;
        end;
        if v309.SalesTypeFilter and v309.SalesTypeFilter ~= Enum.SalesTypeFilter.All then
            v311.salesTypeFilter = tostring(v309.SalesTypeFilter.Name);
        end;
        if v309.SortAggregation and (v309.SortType == Enum.CatalogSortType.MostFavorited or v309.SortType == Enum.CatalogSortType.Bestselling) then
            v311.sortAggregation = tostring(v309.SortAggregation.Name);
        end;
        return v311;
    end;
end;
v77.getSearchParams = function(v318, v319, v320) --[[ Line: 1188 ]] --[[ Name: getSearchParams ]]
    -- upvalues: v297 (copy), v299 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXTimedOptionsSalesTypeFilter_0 (copy), l_FFlagAXCatalogSearchParamTypes_0 (copy), v305 (copy), v28 (copy), v59 (copy), v38 (copy), v36 (copy), l_FFlagAXRemoveTimedOptionsSalesTypeEnumCheck_0 (copy), v7 (copy), v37 (copy), v35 (copy), v308 (copy)
    v297(v318);
    v299(v319);
    local v321 = CatalogSearchParams.new();
    local v322 = nil;
    if v318.searchKeyword then
        v322 = v318.searchKeyword;
    end;
    v321.AssetTypes = {};
    v321.BundleTypes = {};
    v321.IncludeOffSale = false;
    if game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and l_FFlagAXDurablesSupport_0 and not l_FFlagAXTimedOptionsSalesTypeFilter_0 then
        v321.TimedOptionFilter = Enum.CatalogTimedOptionFilter.All;
    end;
    local v323 = false;
    local v324 = if l_FFlagAXCatalogSearchParamTypes_0 then v319.SelectedTopics else v318.topics or v319.SelectedTopics;
    if v324 and #v324 > 0 then
        v323 = true;
        local v325 = table.concat(v324, " ");
        if v322 == nil then
            v322 = v325;
        else
            if #v322 > 0 then
                v322 = v322 .. " ";
            end;
            v322 = v322 .. v325;
        end;
    end;
    if v322 then
        v321.SearchKeyword = v322;
    end;
    local v326 = 120;
    if not v322 and v320 then
        v326 = 30;
    end;
    v321.Limit = v326;
    if v318.categoryInfo == nil then
        local v327 = {};
        local v328 = {};
        v321.CategoryFilter = if l_FFlagAXCatalogSearchParamTypes_0 then Enum.CatalogCategoryFilter.None else v318.categoryFilter or Enum.CatalogCategoryFilter.None;
        v305(v321, v327, v328);
    else
        local l_CategoryFilter_0 = v318.categoryInfo.CategoryFilter;
        local v330 = v28.CategoryFilters[l_CategoryFilter_0];
        if v330 == nil or v323 then
            v321.CategoryFilter = Enum.CatalogCategoryFilter.None;
        else
            v321.CategoryFilter = v330;
        end;
        local l_AssetTypeIdStrings_0 = v318.categoryInfo.AssetTypeIdStrings;
        local l_BundleTypes_0 = v318.categoryInfo.BundleTypes;
        v305(v321, l_AssetTypeIdStrings_0, l_BundleTypes_0);
    end;
    local v333 = if l_FFlagAXCatalogSearchParamTypes_0 then v319.PriceRange.minPrice else v318.minPrice or v319.PriceRange.minPrice;
    local v334 = if l_FFlagAXCatalogSearchParamTypes_0 then v319.PriceRange.maxPrice else v318.maxPrice or v319.PriceRange.maxPrice;
    if v59 and v333 and v334 and v334 < v333 then
        local l_v334_0 = v334;
        v334 = v333;
        v333 = l_v334_0;
    end;
    if v28.MinPriceFilter < v333 then
        v321.MinPrice = v333;
    end;
    if v334 < v28.MaxPriceFilter then
        v321.MaxPrice = v334;
    end;
    local v336 = if l_FFlagAXCatalogSearchParamTypes_0 then v319.CatalogSort else v318.catalogSort or v319.CatalogSort;
    v321.SortType = Enum.CatalogSortType[v336];
    if v319.UnavailableItemFilter ~= v38.Hide then
        v321.IncludeOffSale = true;
    end;
    local l_SalesTypeFilter_0 = v319.SalesTypeFilter;
    if l_SalesTypeFilter_0 ~= v36.All then
        if l_FFlagAXTimedOptionsSalesTypeFilter_0 then
            if not l_FFlagAXRemoveTimedOptionsSalesTypeEnumCheck_0 then
                local v339 = pcall(function() --[[ Line: 1301 ]]
                    local _ = Enum.SalesTypeFilter.TimedOptions;
                end);
                if l_SalesTypeFilter_0 == v36.TimedOptions and not v339 then
                    v7("Referenced TimeOptions sales type but enum value is not present");
                else
                    v321.SalesTypeFilter = Enum.SalesTypeFilter[l_SalesTypeFilter_0];
                end;
            else
                v321.SalesTypeFilter = Enum.SalesTypeFilter[l_SalesTypeFilter_0];
            end;
        else
            v321.SalesTypeFilter = Enum.SalesTypeFilter[l_SalesTypeFilter_0];
        end;
    end;
    local l_CreatorFilter_0 = v319.CreatorFilter;
    if l_CreatorFilter_0 ~= nil and l_CreatorFilter_0 ~= "" then
        v321.CreatorName = l_CreatorFilter_0;
    end;
    if not l_FFlagAXTimedOptionsSalesTypeFilter_0 and game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and l_FFlagAXDurablesSupport_0 then
        local l_WearTimeFilter_0 = v319.WearTimeFilter;
        if l_WearTimeFilter_0 == v37.All then
            v321.TimedOptionFilter = Enum.CatalogTimedOptionFilter.All;
        elseif l_WearTimeFilter_0 == v37.TimedOptionsOnly then
            v321.TimedOptionFilter = Enum.CatalogTimedOptionFilter.TimedOptionOnly;
        end;
    end;
    if v336 == v35.MostFavorited or v336 == v35.Bestselling then
        v321.SortAggregation = Enum.CatalogSortAggregation[v319.CatalogSortAggregation];
    end;
    if v308(v321) then
        v321.CategoryFilter = Enum.CatalogCategoryFilter.None;
    end;
    return v321;
end;
v77.getWebAssetModelFromEquippedAssets = function(v342) --[[ Line: 1364 ]] --[[ Name: getWebAssetModelFromEquippedAssets ]]
    -- upvalues: v22 (copy)
    local v343 = {};
    for v344, v345 in v342 do
        local v346 = v22.LayeredAssetTypes[v344] ~= nil;
        for v347, v348 in v345 do
            table.insert(v343, {
                id = v347, 
                meta = v346 and v348 or nil
            });
        end;
    end;
    return v343;
end;
v77.createHumanoidDescriptionAccessoryInfo = function(v349, v350, v351) --[[ Line: 1386 ]] --[[ Name: createHumanoidDescriptionAccessoryInfo ]]
    -- upvalues: v22 (copy)
    local v352 = tonumber(v350);
    assert(v352 ~= nil, "assetIdAsNumber is not nil. Silence type checker.");
    return {
        AssetId = v352, 
        Order = v351.order, 
        AccessoryType = v351.type or v22.AssetTypeIdToAccessoryTypeEnum[v349], 
        IsLayered = v351.isLayered, 
        Position = v351.position, 
        Rotation = v351.rotation, 
        Scale = v351.scale
    };
end;
v77.createDefaultHumanoidDescriptionAccessoryInfo = function(v353, v354) --[[ Line: 1408 ]] --[[ Name: createDefaultHumanoidDescriptionAccessoryInfo ]]
    -- upvalues: v7 (copy), v22 (copy)
    local v355 = tonumber(v354);
    if v355 == nil then
        v7("Called AvatarExperienceUtils.createDefaultHumanoidDescriptionAccessoryInfo with assetId that does not convert to string.");
        v355 = 0;
    end;
    assert(v355, "assetIdAsNumber is non-nil: Silence type checker");
    return {
        AssetId = v355, 
        Order = v22.LayeredClothingOrder[v353], 
        AccessoryType = v22.AssetTypeIdToAccessoryTypeEnum[v353], 
        IsLayered = v22.LayeredAssetTypes[v353] ~= nil
    };
end;
v77.getNewFullViewEnum = function(v356) --[[ Line: 1433 ]] --[[ Name: getNewFullViewEnum ]]
    -- upvalues: v34 (copy)
    if v356 == v34.None then
        return v34.UIFullView;
    else
        return v34.None;
    end;
end;
v77.getPartCFrame = function(v357, v358) --[[ Line: 1441 ]] --[[ Name: getPartCFrame ]]
    -- upvalues: v22 (copy)
    if v357 and v357:FindFirstChild(v358) then
        return v357[v358].CFrame;
    else
        return CFrame.new(v22.DefaultRigPosition);
    end;
end;
v77.getAttachmentCFrame = function(v359, v360, v361) --[[ Line: 1449 ]] --[[ Name: getAttachmentCFrame ]]
    if v359 and v359:FindFirstChild(v360) then
        local v362 = v359[v360];
        local l_v362_FirstChild_0 = v362:FindFirstChild(v361);
        if l_v362_FirstChild_0 then
            return v362.CFrame * l_v362_FirstChild_0.CFrame;
        end;
    end;
    return nil;
end;
v77.isLCCategory = function(v364) --[[ Line: 1465 ]] --[[ Name: isLCCategory ]]
    -- upvalues: v22 (copy)
    if v364 and v364.AssetTypeIdStrings then
        for _, v366 in v364.AssetTypeIdStrings do
            if v22.LayeredAssetTypes[v366] ~= nil then
                if v22.LayeredAssetTypes[v366] == Enum.AccessoryType.Hair then
                    return false;
                else
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;
v77.isShoeBundle = function(v367) --[[ Line: 1491 ]] --[[ Name: isShoeBundle ]]
    -- upvalues: v22 (copy)
    local v368 = true;
    if v367.bundleType ~= v22.BundleTypeIdStrings.Shoes then
        v368 = v367.bundleType == Enum.BundleType.Shoes.Name;
    end;
    return v368;
end;
v77.isBundleOrLCAsset = function(v369, v370) --[[ Line: 1503 ]] --[[ Name: isBundleOrLCAsset ]]
    -- upvalues: v22 (copy)
    local v371 = v369 == v22.ItemType.Bundle;
    return v369 == v22.ItemType.Asset and v22.LayeredAssetTypes[v370] ~= nil or v371;
end;
v77.isBoundingBoxVectorSane = function(v372) --[[ Line: 1515 ]] --[[ Name: isBoundingBoxVectorSane ]]
    local v373 = false;
    if v372.X <= 50000 then
        v373 = false;
        if v372.X >= -50000 then
            v373 = false;
            if v372.Y <= 50000 then
                v373 = false;
                if v372.Y >= -50000 then
                    v373 = false;
                    if v372.Z <= 50000 then
                        v373 = v372.Z >= -50000;
                    end;
                end;
            end;
        end;
    end;
    return v373;
end;
v77.isBoundingBoxCFrameSane = function(v374) --[[ Line: 1529 ]] --[[ Name: isBoundingBoxCFrameSane ]]
    -- upvalues: v77 (copy)
    return v77.isBoundingBoxVectorSane(v374.Position) and v77.isBoundingBoxVectorSane(v374.LookVector);
end;
v77.getAssetIdsWithGeometryFromHumanoidDescription = function(v375) --[[ Line: 1539 ]] --[[ Name: getAssetIdsWithGeometryFromHumanoidDescription ]]
    if v375 == nil then
        return {};
    else
        local v376 = {};
        for _, v378 in (v375:GetAccessories(true)) do
            if v378.AssetId then
                table.insert(v376, v378.AssetId);
            end;
        end;
        if v375.Torso then
            table.insert(v376, v375.Torso);
        end;
        if v375.RightLeg then
            table.insert(v376, v375.RightLeg);
        end;
        if v375.RightArm then
            table.insert(v376, v375.RightArm);
        end;
        if v375.LeftLeg then
            table.insert(v376, v375.LeftLeg);
        end;
        if v375.LeftArm then
            table.insert(v376, v375.LeftArm);
        end;
        if v375.Head then
            table.insert(v376, v375.Head);
        end;
        return v376;
    end;
end;
v77.calculateNewAssetIdsWithGeometry = function(v379, v380) --[[ Line: 1577 ]] --[[ Name: calculateNewAssetIdsWithGeometry ]]
    -- upvalues: v77 (copy), v10 (copy)
    if not v379 or not v380 then
        return {};
    else
        local v381 = v77.getAssetIdsWithGeometryFromHumanoidDescription(v379);
        local v382 = v77.getAssetIdsWithGeometryFromHumanoidDescription(v380);
        local v383 = v10.List.toSet(v381);
        return (v10.List.filter(v382, function(v384) --[[ Line: 1588 ]]
            -- upvalues: v383 (copy)
            return v383[v384] == nil;
        end));
    end;
end;
v77.getItemIconTypeFromOutfit = function(v385) --[[ Line: 1594 ]] --[[ Name: getItemIconTypeFromOutfit ]]
    -- upvalues: v22 (copy), l_ItemTileEnums_0 (copy)
    local v386 = v385.outfitType == v22.OutfitTypes.DynamicHead;
    local l_containsDynamicHead_0 = v385.containsDynamicHead;
    if v386 or l_containsDynamicHead_0 then
        return l_ItemTileEnums_0.ItemIconType.DynamicHead;
    else
        return nil;
    end;
end;
v77.getItemStatusStyleFromOutfit = function(v388) --[[ Line: 1605 ]] --[[ Name: getItemStatusStyleFromOutfit ]]
    -- upvalues: l_ItemTileEnums_0 (copy)
    local l_moderationStatus_0 = v388.moderationStatus;
    if l_moderationStatus_0 == Enum.ModerationStatus.ReviewedRejected then
        return l_ItemTileEnums_0.StatusStyle.AlertIcon;
    elseif l_moderationStatus_0 == Enum.ModerationStatus.NotReviewed then
        return l_ItemTileEnums_0.StatusStyle.PendingIcon;
    else
        return nil;
    end;
end;
v77.isModerationPendingOrRejected = function(v390) --[[ Line: 1616 ]] --[[ Name: isModerationPendingOrRejected ]]
    local v391 = true;
    if v390 ~= Enum.ModerationStatus.NotReviewed then
        v391 = v390 == Enum.ModerationStatus.ReviewedRejected;
    end;
    return v391;
end;
v77.getMessageTypeFromModerationStatus = function(v392) --[[ Line: 1621 ]] --[[ Name: getMessageTypeFromModerationStatus ]]
    if not v392 then
        return nil;
    elseif v392 == Enum.ModerationStatus.NotReviewed then
        return "UnavailableItems";
    elseif v392 == Enum.ModerationStatus.ReviewedRejected then
        return "ItemDidNotMeetRobloxCommunityStandards";
    else
        return nil;
    end;
end;
v77.getModerationStatusFromAvailabilityStatus = function(v393) --[[ Line: 1636 ]] --[[ Name: getModerationStatusFromAvailabilityStatus ]]
    -- upvalues: l_InventoryItemAvailability_0 (copy)
    if not v393 then
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
        })[v393];
    end;
end;
v77.assetTypeIdIsAnimationOrEmote = function(v394) --[[ Line: 1655 ]] --[[ Name: assetTypeIdIsAnimationOrEmote ]]
    -- upvalues: v22 (copy)
    if not v394 then
        return false;
    else
        return v22.AssetTypeIdToCategory[v394] == v22.AssetCategories.Animation;
    end;
end;
local v397 = l_memoize_0(function(v395) --[[ Line: 1665 ]]
    -- upvalues: v22 (copy)
    local v396 = v395 and v395[v22.AssetTypeIdStrings.MoodAnimation];
    return v396 and next(v396);
end);
v77.getEquippedMoodAssetId = function(v398) --[[ Line: 1672 ]] --[[ Name: getEquippedMoodAssetId ]]
    -- upvalues: v397 (copy)
    local l_EquippedAssets_0 = v398.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    return v397(l_EquippedAssets_0);
end;
v77.getAssetIdForPPEPose = function(v400) --[[ Line: 1677 ]] --[[ Name: getAssetIdForPPEPose ]]
    -- upvalues: v22 (copy), v77 (copy)
    local l_AvatarExperience_0 = v400.AvatarExperience;
    for _, v403 in v400.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
        if v403.itemType == v22.ItemType.Asset and v77.assetTypeIdIsAnimationOrEmote(v403.itemSubType) then
            return v403.itemId;
        end;
    end;
    if l_AvatarExperience_0.ProfilePictureEditor.ProfilePictureParams.emoteAssetId then
        return l_AvatarExperience_0.ProfilePictureEditor.ProfilePictureParams.emoteAssetId;
    else
        return nil;
    end;
end;
local v405 = l_memoize_0(function(v404) --[[ Line: 1698 ]]
    -- upvalues: v22 (copy)
    return v404 and v404[v22.AssetTypeIdStrings.Gear] and next(v404[v22.AssetTypeIdStrings.Gear]);
end);
v77.getEquippedToolId = function(v406) --[[ Line: 1705 ]] --[[ Name: getEquippedToolId ]]
    -- upvalues: v405 (copy)
    local l_EquippedAssets_1 = v406.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    return v405(l_EquippedAssets_1);
end;
v77.getNextPageCursorKey = function(v408, v409, v410) --[[ Line: 1714 ]] --[[ Name: getNextPageCursorKey ]]
    if v409 then
        return v408 .. (v410 or "");
    else
        return v408;
    end;
end;
v77.getPerformFetchKey = function(v411, v412, v413) --[[ Line: 1730 ]] --[[ Name: getPerformFetchKey ]]
    -- upvalues: v22 (copy)
    if v412 then
        return v22.OutfitsKey .. v411 .. (v413 or "");
    else
        return v22.UserInventoryKey .. v411;
    end;
end;
v77.getCurrentScreenIgnoreItemDetails = function(v414) --[[ Line: 1746 ]] --[[ Name: getCurrentScreenIgnoreItemDetails ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local l_name_2 = v414.current.name;
    local v416 = true;
    if l_name_2 ~= l_AvatarScreen_0.ItemDetails then
        v416 = true;
        if l_name_2 ~= l_AvatarScreen_0.LookDetails then
            v416 = l_name_2 == l_AvatarScreen_0.OutfitDetails;
        end;
    end;
    if v416 then
        l_name_2 = v414.opaque.name;
    end;
    return l_name_2;
end;
v77.getLargestPossibleOneLineTextSize = function(v417, v418, v419, v420) --[[ Line: 1765 ]] --[[ Name: getLargestPossibleOneLineTextSize ]]
    -- upvalues: l_TextService_0 (copy)
    v420 = v420 - 1;
    local v421 = Vector2.new(v420, 100000);
    while true do
        if v418 > 1 then
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v417, v418, v419.Font, v421);
            if l_l_TextService_0_TextSize_0.Y <= v418 + 1 then
                return Vector2.new(math.ceil(l_l_TextService_0_TextSize_0.X), (math.ceil(l_l_TextService_0_TextSize_0.Y))), v418;
            else
                v418 = v418 - 1;
            end;
        else
            return nil, nil;
        end;
    end;
end;
v77.selectSceneSize = function(v423) --[[ Line: 1801 ]] --[[ Name: selectSceneSize ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), l_getSafeAreaSize_0 (copy), v22 (copy)
    local l_GlobalGuiInset_0 = v423.GlobalGuiInset;
    local v425 = v423.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local l_ScreenSize_0 = v423.ScreenSize;
    local l_Offset_0 = l_getSafeAreaSize_0(l_ScreenSize_0, l_GlobalGuiInset_0).Y.Offset;
    local l_bottom_0 = l_GlobalGuiInset_0.bottom;
    local v429 = l_ScreenSize_0.Y - l_bottom_0;
    local v430 = l_Offset_0 * v22.PortraitSceneHeight;
    local v431 = v425 and v430 or v429;
    local v432 = l_ScreenSize_0.X * v22.LandscapeSceneWidth;
    return v431, v425 and l_ScreenSize_0.X or v432;
end;
v77.getColor3Difference = l_memoize_0(function(v433, v434) --[[ Line: 1821 ]]
    return (math.sqrt((v433.R - v434.R) * (v433.R - v434.R) + (v433.G - v434.G) * (v433.G - v434.G) + (v433.B - v434.B) * (v433.B - v434.B)));
end);
v77.bodyColorToBodyColor3 = l_memoize_0(function(v435) --[[ Line: 1825 ]]
    if v435 then
        return BrickColor.new(v435).Color;
    else
        return nil;
    end;
end);
v77.bodyPartForSkinColoringIdToBodyColorId = {
    headColor3 = "headColorId", 
    torsoColor3 = "torsoColorId", 
    rightArmColor3 = "rightArmColorId", 
    rightLegColor3 = "rightLegColorId", 
    leftArmColor3 = "leftArmColorId", 
    leftLegColor3 = "leftLegColorId"
};
v77.bodyColorIdToBodyPartForSkinColoringId = {};
for v436, v437 in pairs(v77.bodyPartForSkinColoringIdToBodyColorId) do
    v77.bodyColorIdToBodyPartForSkinColoringId[v437] = v436;
end;
v77.convertBodyColor3sToHexes = l_memoize_0(function(v438) --[[ Line: 1858 ]]
    local v439 = {};
    for v440, v441 in pairs(v438) do
        v439[v440] = v441:ToHex();
    end;
    return v439;
end);
v77.convertBodyColor3HexesToColor3s = l_memoize_0(function(v442) --[[ Line: 1876 ]]
    local v443 = {};
    for v444, v445 in pairs(v442) do
        v443[v444] = Color3.fromHex(v445);
    end;
    return v443;
end);
v77.isAvatarSceneButtonsVisible = function(v446, v447, v448, v449, v450) --[[ Line: 1885 ]] --[[ Name: isAvatarSceneButtonsVisible ]]
    -- upvalues: l_AvatarScreenProperties_0 (copy)
    local v451 = (l_AvatarScreenProperties_0[v446.opaque.name] or {}).refinementButtonVisible and not v448 and not v449;
    if v450 then
        return v451 and v450.state.key == v446.opaque.key;
    else
        return v451 and v447;
    end;
end;
v77.isUserCameraEligible = function() --[[ Line: 1908 ]] --[[ Name: isUserCameraEligible ]]
    -- upvalues: v10 (copy), l_Players_0 (copy), v54 (copy)
    local l_CameraDevices_0 = game:GetService("VideoCaptureService"):GetCameraDevices();
    local v453 = v10.isEmpty(l_CameraDevices_0);
    assert(l_Players_0 ~= nil, "Players should always be defined");
    return not (v453 or v54);
end;
v77.getUserId = function(v454) --[[ Line: 1917 ]] --[[ Name: getUserId ]]
    if v454.LocalUserId then
        return v454.LocalUserId;
    elseif v454.RobloxUser and v454.RobloxUser.rbxuid then
        return (tostring(v454.RobloxUser.rbxuid));
    else
        return nil;
    end;
end;
v77.isItemSelectable = function(v455) --[[ Line: 1929 ]] --[[ Name: isItemSelectable ]]
    if v455 == nil then
        return false;
    else
        local l_noPriceStatus_0 = v455.noPriceStatus;
        if l_noPriceStatus_0 == nil or l_noPriceStatus_0 == "Free" then
            return true;
        elseif l_noPriceStatus_0 == "Unavailable" then
            return false;
        elseif v455.quantityOwned > 0 then
            return true;
        else
            return false;
        end;
    end;
end;
v77.isTryingOnClassicFace = function(v457) --[[ Line: 1947 ]] --[[ Name: isTryingOnClassicFace ]]
    -- upvalues: v11 (copy), v22 (copy)
    return v11.some(v457, function(v458) --[[ Line: 1948 ]]
        -- upvalues: v22 (ref)
        local v459 = false;
        if v458.itemType == "Asset" then
            v459 = v458.itemSubType == v22.AssetTypeIdStrings.Face;
        end;
        return v459;
    end);
end;
v77.isTryingOnDynamicHead = function(v460) --[[ Line: 1953 ]] --[[ Name: isTryingOnDynamicHead ]]
    -- upvalues: v11 (copy), v22 (copy)
    return v11.some(v460, function(v461) --[[ Line: 1954 ]]
        -- upvalues: v22 (ref)
        local v462 = false;
        if v461.itemType == "Bundle" then
            v462 = v461.itemSubType == v22.BundleTypeIdStrings.DynamicHead;
        end;
        return v462;
    end);
end;
v77.getRecommendedAssetTypeIdStringFromCategoryInfo = l_memoize_0(function(v463) --[[ Line: 1964 ]]
    if v463.RecommendedAssetTypeIdString then
        return v463.RecommendedAssetTypeIdString;
    elseif v463.AssetTypeIdStrings and #v463.AssetTypeIdStrings == 1 then
        return v463.AssetTypeIdStrings[1];
    else
        return nil;
    end;
end);
v77.getRecommendedKey = l_memoize_0(function(v464) --[[ Line: 1978 ]]
    -- upvalues: v23 (copy), v77 (copy), v7 (copy), v22 (copy), v61 (copy)
    if v464.RecommendationsType == v23.RecommendationsType.Asset then
        local v465 = v77.getRecommendedAssetTypeIdStringFromCategoryInfo(v464);
        if not v465 then
            v7("called getRecommendedKey with a category with no assetTypeIdString");
            return v22.AssetTypeIdStrings.Hat;
        else
            return v465;
        end;
    elseif v464.RecommendationsType == v23.RecommendationsType.BodyParts then
        return v23.RecommendationsType.BodyParts;
    elseif v464.RecommendationsType == v23.RecommendationsType.AvatarAnimations then
        return v23.RecommendationsType.AvatarAnimations;
    elseif v464.RecommendationsType == v23.RecommendationsType.Shoes then
        return v23.RecommendationsType.Shoes;
    elseif v464.RecommendationsType == v23.RecommendationsType.DynamicHeads then
        return v23.RecommendationsType.DynamicHeads;
    elseif v61() and v464.RecommendationsType == v23.RecommendationsType.All then
        return v23.RecommendationsType.All;
    else
        return v23.RecommendationsType.None;
    end;
end);
v77.getCategoryInfoByName = l_memoize_0(function(v466, v467, v468) --[[ Line: 2011 ]]
    -- upvalues: v77 (copy)
    local v469 = nil;
    local v470 = nil;
    for v471, v472 in v466 do
        if v472.Name == v467 then
            v469 = v471;
            if v468 and v472.Subcategories then
                for v473, v474 in v472.Subcategories do
                    if v474.Name == v468 then
                        v470 = v473;
                        break;
                    end;
                end;
                assert(v470 ~= nil, "Could not find subcategory with name " .. v468);
                break;
            else
                break;
            end;
        end;
    end;
    assert(v469 ~= nil, "Could not find category with name  " .. v467);
    return (v77.getCategoryInfo(v466, v469, v470));
end);
v77.getAssetIdFromContent = l_memoize_0(function(v475) --[[ Line: 2037 ]]
    if v475 == nil then
        return nil;
    else
        assert(v475, "contentId is not nil: silences type checker");
        local v476 = string.match(v475, ".*?id=([0-9]+)");
        if v476 then
            return v476;
        else
            return string.match(v475, "rbxassetid://([0-9]+)");
        end;
    end;
end);
v77.sortOutfitTryOnItemsByRecency = l_memoize_0(function(v477, v478) --[[ Line: 2052 ]]
    local v479 = {};
    for _, v481 in v477 do
        table.insert(v479, v481);
    end;
    table.sort(v479, function(v482, v483) --[[ Line: 2059 ]]
        -- upvalues: v478 (copy)
        if v482.itemRecency and v483.itemRecency then
            if v478 then
                return v482.itemRecency > v483.itemRecency;
            else
                return v482.itemRecency < v483.itemRecency;
            end;
        else
            return false;
        end;
    end);
    return v479;
end);
v77.fuzzyEq = function(v484, v485, v486) --[[ Line: 2074 ]]
    return (v486 or 0.001) > math.abs(v484 - v485);
end;
v77.getCreatorNameTileFooterEnabled = function(v487) --[[ Line: 2079 ]]
    return v487 and v487.customizedDataMap and v487.customizedDataMap.creatorNameTileFooterEnabled == "true";
end;
v77.translateString = function(v488, v489) --[[ Line: 2093 ]] --[[ Name: translateString ]]
    -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy), v7 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v491 = l_Localization_0.new(l_RobloxLocaleId_0);
    v491:SetLocale(l_RobloxLocaleId_0);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 2098 ]]
        -- upvalues: v491 (copy), v488 (copy), v489 (copy)
        return v491:Format(v488, v489);
    end);
    if l_status_0 then
        return l_result_0;
    else
        v7("Failed to translate string with key: " .. v488);
        return "";
    end;
end;
v77.resolveEditorCategory = function(v494) --[[ Line: 2116 ]] --[[ Name: resolveEditorCategory ]]
    -- upvalues: v21 (copy)
    for _, v496 in (v21()) do
        if v496.Id == v494 then
            return v496.Category, nil;
        elseif v496.Subcategories then
            for _, v498 in v496.Subcategories do
                if v498.Id == v494 then
                    return v496.Category, v498.Subcategory;
                end;
            end;
        end;
    end;
    return nil, nil;
end;
return v77;