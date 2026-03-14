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
local v42 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v43 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Constants);
local v44 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v45 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local v46 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortAndFilters);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local l_InventoryItemAvailability_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability;
local v51 = require(l_Modules_0.AvatarExperience.Common.getEmotesCategory);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_SwitchTab_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SwitchTab;
local v55 = l_GuiService_0:IsTenFootInterface();
local v56 = game:DefineFastFlag("AXUseDynamicIsLooksWidget", false);
local v57 = game:DefineFastString("AXLookWidgetContentType", "SearchToLooksWidget,SearchToCommunityLooksWidget,SearchToAvatarLooksWidget,PersonalizedAvatarLooksWidget,SortsPersonalizedAvatarLooksWidget,MySharedAvatarsWidget");
local v58 = game:DefineFastString("AXAvatarWidgetContentType", "SearchToAvatarLooksWidget,PersonalizedAvatarLooksWidget,SortsPersonalizedAvatarLooksWidget,MySharedAvatarsWidget");
local l_FFlagAXSlotsInventoryLoadableGridView_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsInventoryLoadableGridView;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local v61 = game:DefineFastFlag("AXFixMinMaxPriceFilterError", false);
local v62 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXExtractEmotesCategory);
local v63 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagAXHttpCatalogV2SearchItemDetails_0 = v20.FFlagAXHttpCatalogV2SearchItemDetails;
local l_FFlagAXMutedErrorLoggingForCategorySelection_0 = v20.FFlagAXMutedErrorLoggingForCategorySelection;
local l_FFlagAXTimedOptionsSalesTypeFilter_0 = v20.FFlagAXTimedOptionsSalesTypeFilter;
local l_FFlagAXRemoveTimedOptionsSalesTypeEnumCheck_0 = v20.FFlagAXRemoveTimedOptionsSalesTypeEnumCheck;
local l_FFlagAXCatalogSearchParamTypes_0 = v20.FFlagAXCatalogSearchParamTypes;
local v70 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v71 = {};
local v72 = {};
if v56 then
    local v73 = string.split(v57, ",") or {};
    v71 = v10.List.map(v73, function(v74) --[[ Line: 126 ]]
        return v74:match("^%s*(.*)%s*$");
    end);
end;
local v75 = string.split(v58, ",") or {};
v72 = v10.List.map(v75, function(v76) --[[ Line: 134 ]]
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
local v88 = l_memoize_0(function(v82, v83, v84) --[[ Line: 180 ]]
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
local v96 = l_memoize_0(function(v89, v90, v91) --[[ Line: 223 ]]
    -- upvalues: v46 (copy), l_FFlagAXMutedErrorLoggingForCategorySelection_0 (copy), v7 (copy), v10 (copy), v22 (copy)
    local v92 = v46.extractCategoryById(v90, v89);
    if l_FFlagAXMutedErrorLoggingForCategorySelection_0 and v92 == nil then
        v7("[buildCategoryInfoById] Category not found for categoryId: " .. tostring(v90) .. " and subcategoryId: " .. tostring(v91));
    end;
    if v92.Subcategories and v91 then
        local l_Subcategories_0 = v92.Subcategories;
        local v94 = v46.extractSubcategoryById(v91, l_Subcategories_0);
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
local function _(v97, v98, v99) --[[ Line: 274 ]] --[[ Name: categoryKey ]]
    return string.format("%s.%s.%s", tostring(v97), tostring(v98), (tostring(v99)));
end;
local function _(v101, v102, v103) --[[ Line: 278 ]] --[[ Name: categoryKeyV2 ]]
    return string.format("%s.%s.%s", tostring(v101), tostring(v102), (tostring(v103)));
end;
v79.getCategoryInfo = l_memoize_0(function(v105, v106, v107) --[[ Line: 287 ]]
    -- upvalues: v80 (copy), v88 (copy)
    local v108 = string.format("%s.%s.%s", tostring(v105), tostring(v106), (tostring(v107)));
    local v109 = v80[v108];
    if v109 == nil then
        v109 = v88(v105, v106, v107);
        v80[v108] = v109;
    end;
    return v109;
end);
v79.getCategoryInfoById = l_memoize_0(function(v110, v111, v112) --[[ Line: 299 ]]
    -- upvalues: v81 (copy), v96 (copy)
    local v113 = string.format("%s.%s.%s", tostring(v110), tostring(v111), (tostring(v112)));
    local v114 = v81[v113];
    if v114 == nil then
        v114 = v96(v110, v111, v112);
        v81[v113] = v114;
    end;
    return v114;
end);
v79.getCatalogCategoryInfo = l_memoize_0(function(v115, v116) --[[ Line: 311 ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v27 (copy), v26 (copy), v79 (copy)
    local v117 = if l_FFlagAXCatalogCategoriesStore_0 then v27() else v26();
    return v79.getCategoryInfo(v117, v115, v116);
end);
v79.getCatalogCategoryInfoById = l_memoize_0(function(v118, v119) --[[ Line: 320 ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v27 (copy), v26 (copy), v79 (copy)
    local v120 = if l_FFlagAXCatalogCategoriesStore_0 then v27() else v26();
    return v79.getCategoryInfoById(v120, v118, v119);
end);
v79.getAvatarEditorCategoryInfo = l_memoize_0(function(v121, v122) --[[ Line: 329 ]]
    -- upvalues: v21 (copy), v79 (copy)
    local v123 = v21();
    return v79.getCategoryInfo(v123, v121, v122);
end);
local function _(v124) --[[ Line: 335 ]] --[[ Name: getCatalogCardFooterHeight ]]
    if v124 < 100 then
        return 30;
    elseif v124 < 148 then
        return 36;
    else
        return 42;
    end;
end;
local v135 = l_memoize_0(function(v126, _, v128) --[[ Line: 345 ]]
    -- upvalues: v22 (copy)
    local v129 = if v128 then v22.CreatorNameItemTileTitleMaxLines else v22.ItemTileTitleMaxLines;
    local v130 = if v128 then v22.CreatorNameItemTilePadding else v22.ItemTilePadding;
    return function(v131) --[[ Line: 353 ]]
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
local v146 = l_memoize_0(function(v136, _, v138) --[[ Line: 368 ]]
    -- upvalues: v22 (copy)
    local v139 = if v138 then v22.CreatorNameItemTileTitleMaxLines else v22.ItemTileTitleMaxLines;
    local v140 = if v138 then v22.CreatorNameItemTilePadding else v22.ItemTilePadding;
    return function(v141) --[[ Line: 376 ]]
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
v79.isLooksWidget = function(v147) --[[ Line: 392 ]] --[[ Name: isLooksWidget ]]
    -- upvalues: v56 (copy), v71 (ref), v42 (copy)
    if v56 then
        return table.find(v71, v147) ~= nil;
    elseif v147 and (v147 == v42.Types.SearchToAvatarLooksWidget or v147 == v42.Types.PersonalizedAvatarLooksWidget or v147 == v42.Types.SortsPersonalizedAvatarLooksWidget or v147 == v42.Types.SearchToCommunityLooksWidget or v147 == v42.Types.SearchToLooksWidget or v147 == v42.Types.MySharedAvatarsWidget) then
        return true;
    else
        return false;
    end;
end;
v79.isAvatarLooksWidget = function(v148) --[[ Line: 419 ]] --[[ Name: isAvatarLooksWidget ]]
    -- upvalues: v79 (copy), v72 (ref)
    return v79.isLooksWidget(v148) and table.find(v72, v148) ~= nil;
end;
local v157 = l_memoize_0(function(v149, _, v151, v152, v153) --[[ Line: 426 ]]
    -- upvalues: v22 (copy)
    return function(v154) --[[ Line: 433 ]]
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
local v162 = l_memoize_0(function(v158) --[[ Line: 474 ]]
    -- upvalues: v22 (copy)
    return function(v159) --[[ Line: 475 ]]
        -- upvalues: v22 (ref), v158 (copy)
        local v160 = v22.ItemTileTitleMaxLines * v158;
        local l_ItemTilePadding_0 = v22.ItemTilePadding;
        return v159 + v160 + l_ItemTilePadding_0;
    end;
end);
local function v164(v163) --[[ Line: 483 ]] --[[ Name: squareItemHeightGetter ]]
    return v163;
end;
local v169 = l_memoize_0(function(v165) --[[ Line: 487 ]]
    -- upvalues: v164 (copy), l_FFlagAXSlotsInventoryLoadableGridView_0 (copy), v22 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
    if v165 == nil then
        return v164;
    else
        return function(v166) --[[ Line: 491 ]]
            -- upvalues: l_FFlagAXSlotsInventoryLoadableGridView_0 (ref), v22 (ref), v165 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (ref)
            local v167 = if l_FFlagAXSlotsInventoryLoadableGridView_0 then v22.EditorItemTileTitleMaxLines * v165 else v22.ItemTileTitleMaxLines * v165;
            local v168 = if l_FFlagAXRootSlotBasedEditorFlag_0 then v22.ItemTilePadding else v22.ItemTilePadding * 2;
            return v166 + v167 + v168;
        end;
    end;
end);
local function _(v170) --[[ Line: 505 ]] --[[ Name: splitKeywords ]]
    if v170 then
        return string.split(v170, " ");
    else
        return {};
    end;
end;
v79.mergeKeywordsAndTopics = function(v172, v173) --[[ Line: 525 ]] --[[ Name: mergeKeywordsAndTopics ]]
    local v174 = if v172 then string.split(v172, " ") else {};
    local v175 = if v173 then string.split(v173, " ") else {};
    for _, v177 in v175 do
        if #v177 > 0 and not table.find(v174, v177) then
            table.insert(v174, v177);
        end;
    end;
    return table.concat(v174, " ");
end;
v79.GetCategoryIdsFromNavKey = l_memoize_0(function(v178, v179) --[[ Line: 544 ]]
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
v79.GridItemHeightGetter = function(v186, ...) --[[ Line: 566 ]] --[[ Name: GridItemHeightGetter ]]
    -- upvalues: v22 (copy), v169 (copy), v164 (copy), v162 (copy), v157 (copy), v135 (copy), v146 (copy)
    if v186 == v22.ItemTileType.AvatarEditorTile then
        return v169(...);
    elseif v186 == v22.ItemTileType.BodyColorButton then
        return v164;
    elseif v186 == v22.ItemTileType.BundleItemTile then
        return v162(...);
    elseif v186 == v22.ItemTileType.BundleItemTileNoText then
        return v164;
    elseif v186 == v22.ItemTileType.LookItemTile then
        return v157(...);
    elseif v186 == v22.ItemTileType.CatalogItemTile then
        return v135(...);
    elseif v186 == v22.ItemTileType.TallCatalogItemTile then
        return v146(...);
    else
        warn("Unknown itemType " .. tostring(v186) .. " in AvatarExperienceUtils.GridItemHeightGetter");
        return v164;
    end;
end;
v79.GridItemHeightGetterWithOptions = function(v187) --[[ Line: 598 ]] --[[ Name: GridItemHeightGetterWithOptions ]]
    -- upvalues: v22 (copy), v169 (copy), v164 (copy), v162 (copy), v157 (copy), v135 (copy), v146 (copy)
    local l_itemTileType_0 = v187.itemTileType;
    if l_itemTileType_0 == v22.ItemTileType.AvatarEditorTile then
        return v169(v187.fontHeight);
    elseif l_itemTileType_0 == v22.ItemTileType.BodyColorButton then
        return v164;
    elseif l_itemTileType_0 == v22.ItemTileType.BundleItemTile and v187.fontHeight then
        return v162(v187.fontHeight);
    elseif l_itemTileType_0 == v22.ItemTileType.BundleItemTileNoText then
        return v164;
    elseif l_itemTileType_0 == v22.ItemTileType.LookItemTile and v187.fontHeight then
        return v157(v187.fontHeight, v187.hideItemName, v187.itemCreatorNamesEnabled, v187.itemPriceEnabled, v187.isWidgetFocused);
    elseif l_itemTileType_0 == v22.ItemTileType.CatalogItemTile then
        return v135(v187.fontHeight, nil, v187.itemCreatorNamesEnabled);
    elseif l_itemTileType_0 == v22.ItemTileType.TallCatalogItemTile then
        return v146(v187.fontHeight, nil, v187.itemCreatorNamesEnabled);
    else
        warn("Unknown itemType " .. tostring(l_itemTileType_0) .. " in AvatarExperienceUtils.GridItemHeightGetterWithOptions");
        return v164;
    end;
end;
v79.isAvatarBackground = function(v189) --[[ Line: 627 ]] --[[ Name: isAvatarBackground ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v189 == l_AvatarScreen_0.AvatarBackground;
end;
v79.isAvatarExperienceRoute = function(v190) --[[ Line: 631 ]] --[[ Name: isAvatarExperienceRoute ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_SwitchTab_0 (copy)
    local l_history_0 = v190.Navigation.history;
    for _, v193 in l_history_0[#l_history_0] do
        if v193.name == l_AvatarScreen_0.AvatarExperienceRoot or v193.name == l_SwitchTab_0.AvatarExperienceTab then
            return true;
        end;
    end;
    return false;
end;
v79.isRouteInAvatarEditor = function(v194) --[[ Line: 645 ]] --[[ Name: isRouteInAvatarEditor ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v194.opaque.name == l_AvatarScreen_0.AvatarEditor;
end;
v79.didLeaveAvatarEditor = function(v195, v196) --[[ Line: 654 ]] --[[ Name: didLeaveAvatarEditor ]]
    -- upvalues: v79 (copy)
    if v79.isRouteInAvatarEditor(v196) and not v79.isRouteInAvatarEditor(v195) then
        return true;
    else
        return false;
    end;
end;
v79.getIsSceneFullViewFromState = function(v197, v198) --[[ Line: 663 ]] --[[ Name: getIsSceneFullViewFromState ]]
    -- upvalues: v34 (copy)
    local l_name_0 = v198.opaque.name;
    return v197.AvatarExperience.Common.FullView[l_name_0] == v34.SceneFullView;
end;
v79.getCatalogCategoryInfoFromState = function(v200) --[[ Line: 668 ]] --[[ Name: getCatalogCategoryInfoFromState ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v7 (copy), v79 (copy)
    if l_FFlagAXCatalogCategoriesStore_0 then
        v7("getCatalogCategoryInfoFromState is not supported with FFlagAXCatalogCategoriesStore");
    end;
    local l_categoryId_0 = v200.AvatarExperience.Catalog.Categories.categoryId;
    local l_subcategoryId_0 = v200.AvatarExperience.Catalog.Categories.subcategoryId;
    return v79.getCatalogCategoryInfoById(l_categoryId_0, l_subcategoryId_0);
end;
v79.getAvatarEditorCategoryInfoFromState = function(v203) --[[ Line: 678 ]] --[[ Name: getAvatarEditorCategoryInfoFromState ]]
    -- upvalues: v79 (copy)
    local l_category_0 = v203.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v203.AvatarExperience.AvatarEditor.Categories.subcategory;
    return v79.getAvatarEditorCategoryInfo(l_category_0, l_subcategory_0);
end;
v79.getAvatarEditorSubcategoryFilterFromState = function(v206) --[[ Line: 686 ]] --[[ Name: getAvatarEditorSubcategoryFilterFromState ]]
    -- upvalues: v79 (copy)
    local v207 = v79.getAvatarEditorCategoryInfoFromState(v206);
    if v207.SubcategoryFilters then
        local l_subcategoryFilter_0 = v206.AvatarExperience.AvatarEditor.Categories.subcategoryFilter;
        return v207.SubcategoryFilters[l_subcategoryFilter_0];
    else
        return nil;
    end;
end;
v79.getSelectedAccessoryDescription = function(v209, v210) --[[ Line: 697 ]] --[[ Name: getSelectedAccessoryDescription ]]
    local v211 = tonumber(v210) or 0;
    for _, v213 in v209:GetChildren() do
        if v213:IsA("AccessoryDescription") and v213.AssetId == v211 then
            return v213;
        end;
    end;
    return nil;
end;
v79.getAccessoryAdjustmentCategoryInfo = function(v214) --[[ Line: 712 ]] --[[ Name: getAccessoryAdjustmentCategoryInfo ]]
    -- upvalues: v79 (copy), v43 (copy)
    local v215 = v214.AvatarExperience.AccessoryAdjustment.SelectedAccessory or "";
    local l_CurrentCharacter_0 = v214.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    assert(l_CurrentCharacter_0, "assert currentCharacter exists");
    local l_Humanoid_0 = l_CurrentCharacter_0:FindFirstChild("Humanoid");
    assert(l_Humanoid_0, "assert humanoid exists");
    local l_HumanoidDescription_0 = l_Humanoid_0:FindFirstChild("HumanoidDescription");
    assert(l_HumanoidDescription_0, "assert currentCharacter exists");
    local v219 = v79.getSelectedAccessoryDescription(l_HumanoidDescription_0, v215);
    if not v219 then
        return;
    else
        assert(v219, "assert accessoryDescription exists");
        return v43.CameraCategories[v219.AccessoryType];
    end;
end;
v79.getCategoryInfoFromState = function(v220, v221) --[[ Line: 739 ]] --[[ Name: getCategoryInfoFromState ]]
    -- upvalues: l_AvatarScreen_0 (copy), v79 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v70 (copy), v62 (copy), v51 (copy), v33 (copy), v22 (copy), v77 (copy), v41 (copy), v44 (copy), v78 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy)
    local l_name_1 = v221.opaque.name;
    if l_name_1 == l_AvatarScreen_0.AvatarEditor then
        return v79.getAvatarEditorCategoryInfoFromState(v220);
    elseif l_name_1 == l_AvatarScreen_0.Catalog then
        if l_FFlagAXCatalogCategoriesStore_0 then
            return (v70.getCatalogSelectionStore().selectedCategoryInfo(false));
        else
            return v79.getCatalogCategoryInfoFromState(v220);
        end;
    elseif l_name_1 == l_AvatarScreen_0.ProfilePictureEditorEmotes then
        if v62() then
            return (v51());
        else
            local v223 = v33().AssetTypeToCategorySubcategory[v22.AssetTypeIdStrings.EmoteAnimation];
            local l_category_1 = v223.category;
            local l_subcategory_1 = v223.subcategory;
            return v79.getAvatarEditorCategoryInfo(l_category_1, l_subcategory_1);
        end;
    elseif l_name_1 == l_AvatarScreen_0.AdjustAccessoryView then
        local v226 = v79.getAccessoryAdjustmentCategoryInfo(v220);
        if v226 then
            return v226;
        else
            return v77;
        end;
    elseif v41.readTestVariable(v44.EnabledForUser) and l_name_1 == l_AvatarScreen_0.CatalogSearch then
        return v78;
    elseif l_name_1 == l_AvatarScreen_0.HeadRefinement then
        return v22.HeadRefinementCameraCategory;
    elseif l_FFlagAXCustomizeMakeupSupport_0 and l_name_1 == l_AvatarScreen_0.LayeredMakeupSort then
        return v22.LayeredMakeupCameraCategory;
    else
        return v77;
    end;
end;
local v227 = {
    "Torso", 
    "RightArm", 
    "LeftArm", 
    "LeftLeg", 
    "RightLeg"
};
v79.routeIsProfilePictureEditor = function(v228) --[[ Line: 798 ]] --[[ Name: routeIsProfilePictureEditor ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local v229 = true;
    if v228.opaque.name ~= l_AvatarScreen_0.ProfilePictureEditorEmotes then
        v229 = true;
        if v228.opaque.name ~= l_AvatarScreen_0.ProfilePictureEditorCamera then
            v229 = v228.opaque.name == l_AvatarScreen_0.ProfilePictureEditorFinal;
        end;
    end;
    return v229;
end;
v79.routeIsPPEStaticImagePage = function(v230) --[[ Line: 808 ]] --[[ Name: routeIsPPEStaticImagePage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local v231 = true;
    if v230.opaque.name ~= l_AvatarScreen_0.ProfilePictureEditorCamera then
        v231 = v230.opaque.name == l_AvatarScreen_0.ProfilePictureEditorFinal;
    end;
    return v231;
end;
v79.isFullyQualifiedCostume = function(v232) --[[ Line: 813 ]] --[[ Name: isFullyQualifiedCostume ]]
    -- upvalues: v227 (copy)
    for _, v234 in v227 do
        if v232[v234] == "" or v232[v234] == 0 then
            return false;
        end;
    end;
    return true;
end;
v79.shouldShowGradientForScrollingFrame = function(v235) --[[ Line: 822 ]] --[[ Name: shouldShowGradientForScrollingFrame ]]
    local l_AbsoluteSize_0 = v235.AbsoluteSize;
    local l_CanvasSize_0 = v235.CanvasSize;
    local l_CanvasPosition_0 = v235.CanvasPosition;
    return l_AbsoluteSize_0.X < l_CanvasSize_0.X.Offset, l_CanvasPosition_0.X > 20, l_CanvasPosition_0.X + l_AbsoluteSize_0.X < l_CanvasSize_0.X.Offset - 20;
end;
v79.Round = function(v239, v240) --[[ Line: 835 ]] --[[ Name: Round ]]
    local v241 = v240 or 1;
    return math.floor((v239 + v241 / 2) / v241) * v241;
end;
v79.isFetchingDoneOrFailed = function(v242, v243) --[[ Line: 840 ]] --[[ Name: isFetchingDoneOrFailed ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    local v244 = true;
    if v242 ~= l_RetrievalStatus_0.Done then
        v244 = v242 == l_RetrievalStatus_0.Failed;
    end;
    local v245 = true;
    if v243 ~= l_RetrievalStatus_0.Done then
        v245 = v243 == l_RetrievalStatus_0.Failed;
    end;
    return not v244 and v245;
end;
v79.getDeviceType = function() --[[ Line: 848 ]] --[[ Name: getDeviceType ]]
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
v79.getUserOutfitIdFromBundle = function(v247) --[[ Line: 860 ]] --[[ Name: getUserOutfitIdFromBundle ]]
    -- upvalues: v22 (copy)
    for _, v249 in v247.items do
        if v249.type == v22.ItemType.Outfit then
            return v249.id;
        end;
    end;
    return nil;
end;
v79.getUserOutfitIdsFromBundle = function(v250) --[[ Line: 871 ]] --[[ Name: getUserOutfitIdsFromBundle ]]
    -- upvalues: v22 (copy)
    local v251 = {};
    if v250.items then
        for _, v253 in v250.items do
            if v253.type == v22.ItemType.Outfit then
                table.insert(v251, v253.id);
            end;
        end;
    end;
    return v251;
end;
v79.getBundleInfo = l_memoize_0(function(v254, v255) --[[ Line: 886 ]]
    if v255 == nil then
        return nil;
    else
        local v256 = v254[v255];
        if not v256 then
            return nil;
        elseif v256.receivedCatalogData then
            return v256;
        else
            return nil;
        end;
    end;
end);
v79.getBundleInfoFromState = function(v257, v258) --[[ Line: 902 ]] --[[ Name: getBundleInfoFromState ]]
    -- upvalues: v79 (copy)
    local l_BundleInfos_0 = v257.AvatarExperience.Common.BundleInfos;
    return v79.getBundleInfo(l_BundleInfos_0, v258);
end;
v79.getOutfitInfoFromBundleIdNoState = function(v260, v261) --[[ Line: 910 ]] --[[ Name: getOutfitInfoFromBundleIdNoState ]]
    -- upvalues: v79 (copy), v12 (copy), v10 (copy)
    if not v260 then
        return nil;
    else
        assert(v260, "contentId is not nil: silences type checker");
        local v262 = v79.getUserOutfitIdsFromBundle(v260);
        if #v262 < 1 then
            return nil;
        else
            local v263 = nil;
            for _, v265 in v262 do
                local v266 = v261[v265];
                if not v266 then
                    return nil;
                elseif not v263 then
                    v263 = v12.deepCopy(v266);
                else
                    v263.assets = v10.Dictionary.join(v263.assets, v266.assets);
                end;
            end;
            return v263;
        end;
    end;
end;
v79.getOutfitInfoFromBundleId = function(v267, v268) --[[ Line: 945 ]] --[[ Name: getOutfitInfoFromBundleId ]]
    -- upvalues: v79 (copy)
    local v269 = v79.getBundleInfoFromState(v267, v268);
    local l_OutfitInfos_0 = v267.AvatarExperience.AvatarEditor.OutfitInfos;
    return v79.getOutfitInfoFromBundleIdNoState(v269, l_OutfitInfos_0);
end;
v79.getAllCategoriesStr = function(v271) --[[ Line: 952 ]] --[[ Name: getAllCategoriesStr ]]
    local v272 = "";
    local v273 = 1;
    while true do
        local v274 = "level" .. v273;
        if v271[v274] then
            if v273 ~= 1 then
                v272 = v272 .. "|";
            end;
            v272 = v272 .. v271[v274];
            v273 = v273 + 1;
        else
            break;
        end;
    end;
    return v272;
end;
v79.isAnimationAssetType = function(v275) --[[ Line: 974 ]] --[[ Name: isAnimationAssetType ]]
    -- upvalues: v22 (copy)
    local v276 = true;
    if v275 ~= v22.AssetTypeIdStrings.ClimbAnimation then
        v276 = true;
        if v275 ~= v22.AssetTypeIdStrings.FallAnimation then
            v276 = true;
            if v275 ~= v22.AssetTypeIdStrings.IdleAnimation then
                v276 = true;
                if v275 ~= v22.AssetTypeIdStrings.JumpAnimation then
                    v276 = true;
                    if v275 ~= v22.AssetTypeIdStrings.RunAnimation then
                        v276 = true;
                        if v275 ~= v22.AssetTypeIdStrings.SwimAnimation then
                            v276 = v275 == v22.AssetTypeIdStrings.WalkAnimation;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v276;
end;
v79.getNumElementsWithKeyField = function(v277) --[[ Line: 984 ]] --[[ Name: getNumElementsWithKeyField ]]
    local v278 = 0;
    if v277 then
        for _, v280 in v277 do
            if typeof(v280) == "table" and v280.key then
                v278 = v278 + 1;
            end;
        end;
    end;
    return v278;
end;
v79.lerp = function(v281, v282, v283) --[[ Line: 996 ]] --[[ Name: lerp ]]
    return (v282 - v281) * v283 + v281;
end;
v79.getTopBarHeightAvatarScene = function(v284) --[[ Line: 1000 ]] --[[ Name: getTopBarHeightAvatarScene ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v29 (copy)
    if not v284.TopBar then
        return 0;
    elseif v284.DeviceOrientation == l_DeviceOrientationMode_0.Landscape then
        return v284.TopBar.statusBarHeight + v29.NAV_BAR_SIZE;
    else
        return v284.TopBar.topBarHeight;
    end;
end;
v79.tableToCamelCaseKeys = function(v285) --[[ Line: 1014 ]] --[[ Name: tableToCamelCaseKeys ]]
    -- upvalues: v79 (copy)
    local v286 = {};
    for v287, v288 in v285 do
        local l_v287_0 = v287;
        if typeof(v287) == "string" then
            l_v287_0 = string.lower((string.sub(v287, 1, 1))) .. string.sub(v287, 2);
        end;
        local l_v288_0 = v288;
        if typeof(v288) == "table" then
            l_v288_0 = v79.tableToCamelCaseKeys(v288);
        end;
        v286[l_v287_0] = l_v288_0;
    end;
    return v286;
end;
v79.AssetTypeIdStringToEnumValue = function(v291) --[[ Line: 1035 ]] --[[ Name: AssetTypeIdStringToEnumValue ]]
    -- upvalues: v22 (copy)
    local v292 = v22.AssetTypeIdStringToName[v291];
    return Enum.AvatarAssetType[v292];
end;
v79.bundleIdToEnum = function(v293) --[[ Line: 1040 ]] --[[ Name: bundleIdToEnum ]]
    -- upvalues: v22 (copy)
    local v294 = v22.BundleTypeIdStringToName[v293];
    return Enum.BundleType[v294];
end;
v79.getSearchKey = function(v295, v296) --[[ Line: 1045 ]] --[[ Name: getSearchKey ]]
    -- upvalues: v45 (copy), v22 (copy)
    local v297 = v45.selectSortAndFiltersKey(v295);
    return v22.SearchCatalogKey .. v296 .. "." .. v297;
end;
local function v299(v298) --[[ Line: 1050 ]]
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
    })(v298));
end;
local function v301(v300) --[[ Line: 1065 ]]
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
    })(v300));
end;
local function v307(v302, v303, v304) --[[ Line: 1091 ]]
    -- upvalues: v10 (copy), v79 (copy)
    if v303 ~= nil and #v303 > 0 then
        v302.AssetTypes = v10.List.map(v303, function(v305) --[[ Line: 1093 ]]
            -- upvalues: v79 (ref)
            return v79.AssetTypeIdStringToEnumValue(v305);
        end);
    end;
    if v304 ~= nil and #v304 > 0 then
        v302.BundleTypes = v10.List.map(v304, function(v306) --[[ Line: 1100 ]]
            -- upvalues: v79 (ref)
            return v79.bundleIdToEnum(v306);
        end);
    end;
end;
local function v310(v308) --[[ Line: 1107 ]] --[[ Name: hasSortOrFilters ]]
    -- upvalues: v28 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXTimedOptionsSalesTypeFilter_0 (copy)
    local v309 = true;
    if v308.SortType == Enum.CatalogSortType.Relevance then
        v309 = true;
        if v308.CreatorName == "" then
            v309 = true;
            if v308.SalesTypeFilter == Enum.SalesTypeFilter.All then
                v309 = true;
                if v308.SearchKeyword == "" then
                    v309 = true;
                    if v308.MinPrice <= v28.MinPriceFilter then
                        v309 = true;
                        if v308.MaxPrice >= v28.MaxPriceFilter then
                            v309 = v308.IncludeOffSale or game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and l_FFlagAXDurablesSupport_0 and not l_FFlagAXTimedOptionsSalesTypeFilter_0 and v308.TimedOptionFilter ~= Enum.CatalogTimedOptionFilter.All;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v309;
end;
if l_FFlagAXHttpCatalogV2SearchItemDetails_0 then
    v79.getSearchParamsAsQueryParams = function(v311, v312) --[[ Line: 1125 ]] --[[ Name: getSearchParamsAsQueryParams ]]
        -- upvalues: v310 (copy), v28 (copy)
        local v313 = {
            keyword = v311.SearchKeyword or "", 
            limit = v311.Limit
        };
        if v311.CategoryFilter ~= Enum.CatalogCategoryFilter.None and not v310(v311) then
            v313.categoryFilter = tostring(v311.CategoryFilter.Name);
        end;
        v313.sortType = v28.SortTypeAPIMap[tostring(v311.SortType.Name)];
        if v311.CreatorName and v311.CreatorName ~= "" then
            v313.creatorName = v311.CreatorName;
        end;
        if v312 and v312.TaxonomyUuid then
            v313.taxonomy = tostring(v312.TaxonomyUuid);
        else
            if v311.BundleTypes and #v311.BundleTypes > 0 then
                local v314 = {};
                for _, v316 in v311.BundleTypes do
                    table.insert(v314, v316.Value);
                end;
                v313.bundleTypeIds = v314;
            end;
            if v311.AssetTypes and #v311.AssetTypes > 0 then
                local v317 = {};
                for _, v319 in v311.AssetTypes do
                    table.insert(v317, v319.Value);
                end;
                v313.assetTypeIds = v317;
            end;
        end;
        v313.includeNotForSale = v311.IncludeOffSale;
        v313.creatorType = "All";
        if v311.MinPrice and v311.MinPrice > v28.MinPriceFilter then
            v313.minPrice = v311.MinPrice;
        end;
        if v311.MaxPrice and v311.MaxPrice < v28.MaxPriceFilter then
            v313.maxPrice = v311.MaxPrice;
        end;
        if v311.SalesTypeFilter and v311.SalesTypeFilter ~= Enum.SalesTypeFilter.All then
            v313.salesTypeFilter = tostring(v311.SalesTypeFilter.Name);
        end;
        if v311.SortAggregation and (v311.SortType == Enum.CatalogSortType.MostFavorited or v311.SortType == Enum.CatalogSortType.Bestselling) then
            v313.sortAggregation = tostring(v311.SortAggregation.Name);
        end;
        return v313;
    end;
end;
v79.getSearchParams = function(v320, v321, v322) --[[ Line: 1210 ]] --[[ Name: getSearchParams ]]
    -- upvalues: v299 (copy), v301 (copy), l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXTimedOptionsSalesTypeFilter_0 (copy), l_FFlagAXCatalogSearchParamTypes_0 (copy), v307 (copy), v28 (copy), v61 (copy), v38 (copy), v36 (copy), l_FFlagAXRemoveTimedOptionsSalesTypeEnumCheck_0 (copy), v7 (copy), v37 (copy), v35 (copy), v310 (copy)
    v299(v320);
    v301(v321);
    local v323 = CatalogSearchParams.new();
    local v324 = nil;
    if v320.searchKeyword then
        v324 = v320.searchKeyword;
    end;
    v323.AssetTypes = {};
    v323.BundleTypes = {};
    v323.IncludeOffSale = false;
    if game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and l_FFlagAXDurablesSupport_0 and not l_FFlagAXTimedOptionsSalesTypeFilter_0 then
        v323.TimedOptionFilter = Enum.CatalogTimedOptionFilter.All;
    end;
    local v325 = false;
    local v326 = if l_FFlagAXCatalogSearchParamTypes_0 then v321.SelectedTopics else v320.topics or v321.SelectedTopics;
    if v326 and #v326 > 0 then
        v325 = true;
        local v327 = table.concat(v326, " ");
        if v324 == nil then
            v324 = v327;
        else
            if #v324 > 0 then
                v324 = v324 .. " ";
            end;
            v324 = v324 .. v327;
        end;
    end;
    if v324 then
        v323.SearchKeyword = v324;
    end;
    local v328 = 120;
    if not v324 and v322 then
        v328 = 30;
    end;
    v323.Limit = v328;
    if v320.categoryInfo == nil then
        local v329 = {};
        local v330 = {};
        v323.CategoryFilter = if l_FFlagAXCatalogSearchParamTypes_0 then Enum.CatalogCategoryFilter.None else v320.categoryFilter or Enum.CatalogCategoryFilter.None;
        v307(v323, v329, v330);
    else
        local l_CategoryFilter_0 = v320.categoryInfo.CategoryFilter;
        local v332 = v28.CategoryFilters[l_CategoryFilter_0];
        if v332 == nil or v325 then
            v323.CategoryFilter = Enum.CatalogCategoryFilter.None;
        else
            v323.CategoryFilter = v332;
        end;
        local l_AssetTypeIdStrings_0 = v320.categoryInfo.AssetTypeIdStrings;
        local l_BundleTypes_0 = v320.categoryInfo.BundleTypes;
        v307(v323, l_AssetTypeIdStrings_0, l_BundleTypes_0);
    end;
    local v335 = if l_FFlagAXCatalogSearchParamTypes_0 then v321.PriceRange.minPrice else v320.minPrice or v321.PriceRange.minPrice;
    local v336 = if l_FFlagAXCatalogSearchParamTypes_0 then v321.PriceRange.maxPrice else v320.maxPrice or v321.PriceRange.maxPrice;
    if v61 and v335 and v336 and v336 < v335 then
        local l_v336_0 = v336;
        v336 = v335;
        v335 = l_v336_0;
    end;
    if v28.MinPriceFilter < v335 then
        v323.MinPrice = v335;
    end;
    if v336 < v28.MaxPriceFilter then
        v323.MaxPrice = v336;
    end;
    local v338 = if l_FFlagAXCatalogSearchParamTypes_0 then v321.CatalogSort else v320.catalogSort or v321.CatalogSort;
    v323.SortType = Enum.CatalogSortType[v338];
    if v321.UnavailableItemFilter ~= v38.Hide then
        v323.IncludeOffSale = true;
    end;
    local l_SalesTypeFilter_0 = v321.SalesTypeFilter;
    if l_SalesTypeFilter_0 ~= v36.All then
        if l_FFlagAXTimedOptionsSalesTypeFilter_0 then
            if not l_FFlagAXRemoveTimedOptionsSalesTypeEnumCheck_0 then
                local v341 = pcall(function() --[[ Line: 1323 ]]
                    local _ = Enum.SalesTypeFilter.TimedOptions;
                end);
                if l_SalesTypeFilter_0 == v36.TimedOptions and not v341 then
                    v7("Referenced TimeOptions sales type but enum value is not present");
                else
                    v323.SalesTypeFilter = Enum.SalesTypeFilter[l_SalesTypeFilter_0];
                end;
            else
                v323.SalesTypeFilter = Enum.SalesTypeFilter[l_SalesTypeFilter_0];
            end;
        else
            v323.SalesTypeFilter = Enum.SalesTypeFilter[l_SalesTypeFilter_0];
        end;
    end;
    local l_CreatorFilter_0 = v321.CreatorFilter;
    if l_CreatorFilter_0 ~= nil and l_CreatorFilter_0 ~= "" then
        v323.CreatorName = l_CreatorFilter_0;
    end;
    if not l_FFlagAXTimedOptionsSalesTypeFilter_0 and game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and l_FFlagAXDurablesSupport_0 then
        local l_WearTimeFilter_0 = v321.WearTimeFilter;
        if l_WearTimeFilter_0 == v37.All then
            v323.TimedOptionFilter = Enum.CatalogTimedOptionFilter.All;
        elseif l_WearTimeFilter_0 == v37.TimedOptionsOnly then
            v323.TimedOptionFilter = Enum.CatalogTimedOptionFilter.TimedOptionOnly;
        end;
    end;
    if v338 == v35.MostFavorited or v338 == v35.Bestselling then
        v323.SortAggregation = Enum.CatalogSortAggregation[v321.CatalogSortAggregation];
    end;
    if v310(v323) then
        v323.CategoryFilter = Enum.CatalogCategoryFilter.None;
    end;
    return v323;
end;
v79.getWebAssetModelFromEquippedAssets = function(v344) --[[ Line: 1386 ]] --[[ Name: getWebAssetModelFromEquippedAssets ]]
    -- upvalues: v22 (copy)
    local v345 = {};
    for v346, v347 in v344 do
        local v348 = v22.LayeredAssetTypes[v346] ~= nil;
        for v349, v350 in v347 do
            table.insert(v345, {
                id = v349, 
                meta = v348 and v350 or nil
            });
        end;
    end;
    return v345;
end;
v79.createHumanoidDescriptionAccessoryInfo = function(v351, v352, v353) --[[ Line: 1408 ]] --[[ Name: createHumanoidDescriptionAccessoryInfo ]]
    -- upvalues: v22 (copy)
    local v354 = tonumber(v352);
    assert(v354 ~= nil, "assetIdAsNumber is not nil. Silence type checker.");
    return {
        AssetId = v354, 
        Order = v353.order, 
        AccessoryType = v353.type or v22.AssetTypeIdToAccessoryTypeEnum[v351], 
        IsLayered = v353.isLayered, 
        Position = v353.position, 
        Rotation = v353.rotation, 
        Scale = v353.scale
    };
end;
v79.createDefaultHumanoidDescriptionAccessoryInfo = function(v355, v356) --[[ Line: 1430 ]] --[[ Name: createDefaultHumanoidDescriptionAccessoryInfo ]]
    -- upvalues: v7 (copy), v22 (copy)
    local v357 = tonumber(v356);
    if v357 == nil then
        v7("Called AvatarExperienceUtils.createDefaultHumanoidDescriptionAccessoryInfo with assetId that does not convert to string.");
        v357 = 0;
    end;
    assert(v357, "assetIdAsNumber is non-nil: Silence type checker");
    return {
        AssetId = v357, 
        Order = v22.LayeredClothingOrder[v355], 
        AccessoryType = v22.AssetTypeIdToAccessoryTypeEnum[v355], 
        IsLayered = v22.LayeredAssetTypes[v355] ~= nil
    };
end;
v79.getNewFullViewEnum = function(v358) --[[ Line: 1455 ]] --[[ Name: getNewFullViewEnum ]]
    -- upvalues: v34 (copy)
    if v358 == v34.None then
        return v34.UIFullView;
    else
        return v34.None;
    end;
end;
v79.getPartCFrame = function(v359, v360) --[[ Line: 1463 ]] --[[ Name: getPartCFrame ]]
    -- upvalues: v22 (copy)
    if v359 and v359:FindFirstChild(v360) then
        return v359[v360].CFrame;
    else
        return CFrame.new(v22.DefaultRigPosition);
    end;
end;
v79.getAttachmentCFrame = function(v361, v362, v363) --[[ Line: 1471 ]] --[[ Name: getAttachmentCFrame ]]
    if v361 and v361:FindFirstChild(v362) then
        local v364 = v361[v362];
        local l_v364_FirstChild_0 = v364:FindFirstChild(v363);
        if l_v364_FirstChild_0 then
            return v364.CFrame * l_v364_FirstChild_0.CFrame;
        end;
    end;
    return nil;
end;
v79.isLCCategory = function(v366) --[[ Line: 1487 ]] --[[ Name: isLCCategory ]]
    -- upvalues: v22 (copy)
    if v366 and v366.AssetTypeIdStrings then
        for _, v368 in v366.AssetTypeIdStrings do
            if v22.LayeredAssetTypes[v368] ~= nil then
                if v22.LayeredAssetTypes[v368] == Enum.AccessoryType.Hair then
                    return false;
                else
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;
v79.isShoeBundle = function(v369) --[[ Line: 1513 ]] --[[ Name: isShoeBundle ]]
    -- upvalues: v22 (copy)
    local v370 = true;
    if v369.bundleType ~= v22.BundleTypeIdStrings.Shoes then
        v370 = v369.bundleType == Enum.BundleType.Shoes.Name;
    end;
    return v370;
end;
v79.isBundleOrLCAsset = function(v371, v372) --[[ Line: 1525 ]] --[[ Name: isBundleOrLCAsset ]]
    -- upvalues: v22 (copy)
    local v373 = v371 == v22.ItemType.Bundle;
    return v371 == v22.ItemType.Asset and v22.LayeredAssetTypes[v372] ~= nil or v373;
end;
v79.isBoundingBoxVectorSane = function(v374) --[[ Line: 1537 ]] --[[ Name: isBoundingBoxVectorSane ]]
    local v375 = false;
    if v374.X <= 50000 then
        v375 = false;
        if v374.X >= -50000 then
            v375 = false;
            if v374.Y <= 50000 then
                v375 = false;
                if v374.Y >= -50000 then
                    v375 = false;
                    if v374.Z <= 50000 then
                        v375 = v374.Z >= -50000;
                    end;
                end;
            end;
        end;
    end;
    return v375;
end;
v79.isBoundingBoxCFrameSane = function(v376) --[[ Line: 1551 ]] --[[ Name: isBoundingBoxCFrameSane ]]
    -- upvalues: v79 (copy)
    return v79.isBoundingBoxVectorSane(v376.Position) and v79.isBoundingBoxVectorSane(v376.LookVector);
end;
v79.getAssetIdsWithGeometryFromHumanoidDescription = function(v377) --[[ Line: 1561 ]] --[[ Name: getAssetIdsWithGeometryFromHumanoidDescription ]]
    if v377 == nil then
        return {};
    else
        local v378 = {};
        for _, v380 in (v377:GetAccessories(true)) do
            if v380.AssetId then
                table.insert(v378, v380.AssetId);
            end;
        end;
        if v377.Torso then
            table.insert(v378, v377.Torso);
        end;
        if v377.RightLeg then
            table.insert(v378, v377.RightLeg);
        end;
        if v377.RightArm then
            table.insert(v378, v377.RightArm);
        end;
        if v377.LeftLeg then
            table.insert(v378, v377.LeftLeg);
        end;
        if v377.LeftArm then
            table.insert(v378, v377.LeftArm);
        end;
        if v377.Head then
            table.insert(v378, v377.Head);
        end;
        return v378;
    end;
end;
v79.calculateNewAssetIdsWithGeometry = function(v381, v382) --[[ Line: 1599 ]] --[[ Name: calculateNewAssetIdsWithGeometry ]]
    -- upvalues: v79 (copy), v10 (copy)
    if not v381 or not v382 then
        return {};
    else
        local v383 = v79.getAssetIdsWithGeometryFromHumanoidDescription(v381);
        local v384 = v79.getAssetIdsWithGeometryFromHumanoidDescription(v382);
        local v385 = v10.List.toSet(v383);
        return (v10.List.filter(v384, function(v386) --[[ Line: 1610 ]]
            -- upvalues: v385 (copy)
            return v385[v386] == nil;
        end));
    end;
end;
v79.getItemIconTypeFromOutfit = function(v387) --[[ Line: 1616 ]] --[[ Name: getItemIconTypeFromOutfit ]]
    -- upvalues: v22 (copy), l_ItemTileEnums_0 (copy)
    local v388 = v387.outfitType == v22.OutfitTypes.DynamicHead;
    local l_containsDynamicHead_0 = v387.containsDynamicHead;
    if v388 or l_containsDynamicHead_0 then
        return l_ItemTileEnums_0.ItemIconType.DynamicHead;
    else
        return nil;
    end;
end;
v79.getItemStatusStyleFromOutfit = function(v390) --[[ Line: 1627 ]] --[[ Name: getItemStatusStyleFromOutfit ]]
    -- upvalues: l_ItemTileEnums_0 (copy)
    local l_moderationStatus_0 = v390.moderationStatus;
    if l_moderationStatus_0 == Enum.ModerationStatus.ReviewedRejected then
        return l_ItemTileEnums_0.StatusStyle.AlertIcon;
    elseif l_moderationStatus_0 == Enum.ModerationStatus.NotReviewed then
        return l_ItemTileEnums_0.StatusStyle.PendingIcon;
    else
        return nil;
    end;
end;
v79.isModerationPendingOrRejected = function(v392) --[[ Line: 1638 ]] --[[ Name: isModerationPendingOrRejected ]]
    local v393 = true;
    if v392 ~= Enum.ModerationStatus.NotReviewed then
        v393 = v392 == Enum.ModerationStatus.ReviewedRejected;
    end;
    return v393;
end;
v79.getMessageTypeFromModerationStatus = function(v394) --[[ Line: 1643 ]] --[[ Name: getMessageTypeFromModerationStatus ]]
    if not v394 then
        return nil;
    elseif v394 == Enum.ModerationStatus.NotReviewed then
        return "UnavailableItems";
    elseif v394 == Enum.ModerationStatus.ReviewedRejected then
        return "ItemDidNotMeetRobloxCommunityStandards";
    else
        return nil;
    end;
end;
v79.getModerationStatusFromAvailabilityStatus = function(v395) --[[ Line: 1658 ]] --[[ Name: getModerationStatusFromAvailabilityStatus ]]
    -- upvalues: l_InventoryItemAvailability_0 (copy)
    if not v395 then
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
        })[v395];
    end;
end;
v79.assetTypeIdIsAnimationOrEmote = function(v396) --[[ Line: 1677 ]] --[[ Name: assetTypeIdIsAnimationOrEmote ]]
    -- upvalues: v22 (copy)
    if not v396 then
        return false;
    else
        return v22.AssetTypeIdToCategory[v396] == v22.AssetCategories.Animation;
    end;
end;
local v399 = l_memoize_0(function(v397) --[[ Line: 1687 ]]
    -- upvalues: v22 (copy)
    local v398 = v397 and v397[v22.AssetTypeIdStrings.MoodAnimation];
    return v398 and next(v398);
end);
v79.getEquippedMoodAssetId = function(v400) --[[ Line: 1694 ]] --[[ Name: getEquippedMoodAssetId ]]
    -- upvalues: v399 (copy)
    local l_EquippedAssets_0 = v400.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    return v399(l_EquippedAssets_0);
end;
v79.getAssetIdForPPEPose = function(v402) --[[ Line: 1699 ]] --[[ Name: getAssetIdForPPEPose ]]
    -- upvalues: v22 (copy), v79 (copy)
    local l_AvatarExperience_0 = v402.AvatarExperience;
    for _, v405 in v402.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
        if v405.itemType == v22.ItemType.Asset and v79.assetTypeIdIsAnimationOrEmote(v405.itemSubType) then
            return v405.itemId;
        end;
    end;
    if l_AvatarExperience_0.ProfilePictureEditor.ProfilePictureParams.emoteAssetId then
        return l_AvatarExperience_0.ProfilePictureEditor.ProfilePictureParams.emoteAssetId;
    else
        return nil;
    end;
end;
local v407 = l_memoize_0(function(v406) --[[ Line: 1720 ]]
    -- upvalues: v22 (copy)
    return v406 and v406[v22.AssetTypeIdStrings.Gear] and next(v406[v22.AssetTypeIdStrings.Gear]);
end);
v79.getEquippedToolId = function(v408) --[[ Line: 1727 ]] --[[ Name: getEquippedToolId ]]
    -- upvalues: v407 (copy)
    local l_EquippedAssets_1 = v408.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    return v407(l_EquippedAssets_1);
end;
v79.getNextPageCursorKey = function(v410, v411, v412) --[[ Line: 1736 ]] --[[ Name: getNextPageCursorKey ]]
    if v411 then
        return v410 .. (v412 or "");
    else
        return v410;
    end;
end;
v79.getPerformFetchKey = function(v413, v414, v415) --[[ Line: 1752 ]] --[[ Name: getPerformFetchKey ]]
    -- upvalues: v22 (copy)
    if v414 then
        return v22.OutfitsKey .. v413 .. (v415 or "");
    else
        return v22.UserInventoryKey .. v413;
    end;
end;
v79.getCurrentScreenIgnoreItemDetails = function(v416) --[[ Line: 1768 ]] --[[ Name: getCurrentScreenIgnoreItemDetails ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local l_name_2 = v416.current.name;
    local v418 = true;
    if l_name_2 ~= l_AvatarScreen_0.ItemDetails then
        v418 = true;
        if l_name_2 ~= l_AvatarScreen_0.LookDetails then
            v418 = l_name_2 == l_AvatarScreen_0.OutfitDetails;
        end;
    end;
    if v418 then
        l_name_2 = v416.opaque.name;
    end;
    return l_name_2;
end;
v79.getLargestPossibleOneLineTextSize = function(v419, v420, v421, v422) --[[ Line: 1787 ]] --[[ Name: getLargestPossibleOneLineTextSize ]]
    -- upvalues: l_TextService_0 (copy)
    v422 = v422 - 1;
    local v423 = Vector2.new(v422, 100000);
    while true do
        if v420 > 1 then
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v419, v420, v421.Font, v423);
            if l_l_TextService_0_TextSize_0.Y <= v420 + 1 then
                return Vector2.new(math.ceil(l_l_TextService_0_TextSize_0.X), (math.ceil(l_l_TextService_0_TextSize_0.Y))), v420;
            else
                v420 = v420 - 1;
            end;
        else
            return nil, nil;
        end;
    end;
end;
v79.selectSceneSize = function(v425) --[[ Line: 1823 ]] --[[ Name: selectSceneSize ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), l_getSafeAreaSize_0 (copy), v22 (copy)
    local l_GlobalGuiInset_0 = v425.GlobalGuiInset;
    local v427 = v425.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local l_ScreenSize_0 = v425.ScreenSize;
    local l_Offset_0 = l_getSafeAreaSize_0(l_ScreenSize_0, l_GlobalGuiInset_0).Y.Offset;
    local l_bottom_0 = l_GlobalGuiInset_0.bottom;
    local v431 = l_ScreenSize_0.Y - l_bottom_0;
    local v432 = l_Offset_0 * v22.PortraitSceneHeight;
    local v433 = v427 and v432 or v431;
    local v434 = l_ScreenSize_0.X * v22.LandscapeSceneWidth;
    return v433, v427 and l_ScreenSize_0.X or v434;
end;
v79.getColor3Difference = l_memoize_0(function(v435, v436) --[[ Line: 1843 ]]
    return (math.sqrt((v435.R - v436.R) * (v435.R - v436.R) + (v435.G - v436.G) * (v435.G - v436.G) + (v435.B - v436.B) * (v435.B - v436.B)));
end);
v79.bodyColorToBodyColor3 = l_memoize_0(function(v437) --[[ Line: 1847 ]]
    if v437 then
        return BrickColor.new(v437).Color;
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
for v438, v439 in pairs(v79.bodyPartForSkinColoringIdToBodyColorId) do
    v79.bodyColorIdToBodyPartForSkinColoringId[v439] = v438;
end;
v79.convertBodyColor3sToHexes = l_memoize_0(function(v440) --[[ Line: 1880 ]]
    local v441 = {};
    for v442, v443 in pairs(v440) do
        v441[v442] = v443:ToHex();
    end;
    return v441;
end);
v79.convertBodyColor3HexesToColor3s = l_memoize_0(function(v444) --[[ Line: 1898 ]]
    local v445 = {};
    for v446, v447 in pairs(v444) do
        v445[v446] = Color3.fromHex(v447);
    end;
    return v445;
end);
v79.isAvatarSceneButtonsVisible = function(v448, v449, v450, v451, v452) --[[ Line: 1907 ]] --[[ Name: isAvatarSceneButtonsVisible ]]
    -- upvalues: l_AvatarScreenProperties_0 (copy)
    local v453 = (l_AvatarScreenProperties_0[v448.opaque.name] or {}).refinementButtonVisible and not v450 and not v451;
    if v452 then
        return v453 and v452.state.key == v448.opaque.key;
    else
        return v453 and v449;
    end;
end;
v79.isUserCameraEligible = function() --[[ Line: 1930 ]] --[[ Name: isUserCameraEligible ]]
    -- upvalues: v10 (copy), l_Players_0 (copy), v55 (copy)
    local l_CameraDevices_0 = game:GetService("VideoCaptureService"):GetCameraDevices();
    local v455 = v10.isEmpty(l_CameraDevices_0);
    assert(l_Players_0 ~= nil, "Players should always be defined");
    return not (v455 or v55);
end;
v79.getUserId = function(v456) --[[ Line: 1939 ]] --[[ Name: getUserId ]]
    if v456.LocalUserId then
        return v456.LocalUserId;
    elseif v456.RobloxUser and v456.RobloxUser.rbxuid then
        return (tostring(v456.RobloxUser.rbxuid));
    else
        return nil;
    end;
end;
v79.isItemSelectable = function(v457) --[[ Line: 1951 ]] --[[ Name: isItemSelectable ]]
    if v457 == nil then
        return false;
    else
        local l_noPriceStatus_0 = v457.noPriceStatus;
        if l_noPriceStatus_0 == nil or l_noPriceStatus_0 == "Free" then
            return true;
        elseif l_noPriceStatus_0 == "Unavailable" then
            return false;
        elseif v457.quantityOwned > 0 then
            return true;
        else
            return false;
        end;
    end;
end;
v79.isTryingOnClassicFace = function(v459) --[[ Line: 1969 ]] --[[ Name: isTryingOnClassicFace ]]
    -- upvalues: v11 (copy), v22 (copy)
    return v11.some(v459, function(v460) --[[ Line: 1970 ]]
        -- upvalues: v22 (ref)
        local v461 = false;
        if v460.itemType == "Asset" then
            v461 = v460.itemSubType == v22.AssetTypeIdStrings.Face;
        end;
        return v461;
    end);
end;
v79.isTryingOnDynamicHead = function(v462) --[[ Line: 1975 ]] --[[ Name: isTryingOnDynamicHead ]]
    -- upvalues: v11 (copy), v22 (copy)
    return v11.some(v462, function(v463) --[[ Line: 1976 ]]
        -- upvalues: v22 (ref)
        local v464 = false;
        if v463.itemType == "Bundle" then
            v464 = v463.itemSubType == v22.BundleTypeIdStrings.DynamicHead;
        end;
        return v464;
    end);
end;
v79.getRecommendedAssetTypeIdStringFromCategoryInfo = l_memoize_0(function(v465) --[[ Line: 1986 ]]
    if v465.RecommendedAssetTypeIdString then
        return v465.RecommendedAssetTypeIdString;
    elseif v465.AssetTypeIdStrings and #v465.AssetTypeIdStrings == 1 then
        return v465.AssetTypeIdStrings[1];
    else
        return nil;
    end;
end);
v79.getRecommendedKey = l_memoize_0(function(v466) --[[ Line: 2000 ]]
    -- upvalues: v23 (copy), v79 (copy), v7 (copy), v22 (copy), v63 (copy)
    if v466.RecommendationsType == v23.RecommendationsType.Asset then
        local v467 = v79.getRecommendedAssetTypeIdStringFromCategoryInfo(v466);
        if not v467 then
            v7("called getRecommendedKey with a category with no assetTypeIdString");
            return v22.AssetTypeIdStrings.Hat;
        else
            return v467;
        end;
    elseif v466.RecommendationsType == v23.RecommendationsType.BodyParts then
        return v23.RecommendationsType.BodyParts;
    elseif v466.RecommendationsType == v23.RecommendationsType.AvatarAnimations then
        return v23.RecommendationsType.AvatarAnimations;
    elseif v466.RecommendationsType == v23.RecommendationsType.Shoes then
        return v23.RecommendationsType.Shoes;
    elseif v466.RecommendationsType == v23.RecommendationsType.DynamicHeads then
        return v23.RecommendationsType.DynamicHeads;
    elseif v63() and v466.RecommendationsType == v23.RecommendationsType.All then
        return v23.RecommendationsType.All;
    else
        return v23.RecommendationsType.None;
    end;
end);
v79.getCategoryInfoByName = l_memoize_0(function(v468, v469, v470) --[[ Line: 2033 ]]
    -- upvalues: v79 (copy)
    local v471 = nil;
    local v472 = nil;
    for v473, v474 in v468 do
        if v474.Name == v469 then
            v471 = v473;
            if v470 and v474.Subcategories then
                for v475, v476 in v474.Subcategories do
                    if v476.Name == v470 then
                        v472 = v475;
                        break;
                    end;
                end;
                assert(v472 ~= nil, "Could not find subcategory with name " .. v470);
                break;
            else
                break;
            end;
        end;
    end;
    assert(v471 ~= nil, "Could not find category with name  " .. v469);
    return (v79.getCategoryInfo(v468, v471, v472));
end);
v79.getAssetIdFromContent = l_memoize_0(function(v477) --[[ Line: 2059 ]]
    if v477 == nil then
        return nil;
    else
        assert(v477, "contentId is not nil: silences type checker");
        local v478 = string.match(v477, ".*?id=([0-9]+)");
        if v478 then
            return v478;
        else
            return string.match(v477, "rbxassetid://([0-9]+)");
        end;
    end;
end);
v79.sortOutfitTryOnItemsByRecency = l_memoize_0(function(v479, v480) --[[ Line: 2074 ]]
    local v481 = {};
    for _, v483 in v479 do
        table.insert(v481, v483);
    end;
    table.sort(v481, function(v484, v485) --[[ Line: 2081 ]]
        -- upvalues: v480 (copy)
        if v484.itemRecency and v485.itemRecency then
            if v480 then
                return v484.itemRecency > v485.itemRecency;
            else
                return v484.itemRecency < v485.itemRecency;
            end;
        else
            return false;
        end;
    end);
    return v481;
end);
v79.fuzzyEq = function(v486, v487, v488) --[[ Line: 2096 ]]
    return (v488 or 0.001) > math.abs(v486 - v487);
end;
v79.getCreatorNameTileFooterEnabled = function(v489) --[[ Line: 2101 ]]
    return v489 and v489.customizedDataMap and v489.customizedDataMap.creatorNameTileFooterEnabled == "true";
end;
v79.translateString = function(v490, v491) --[[ Line: 2115 ]] --[[ Name: translateString ]]
    -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy), v7 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v493 = l_Localization_0.new(l_RobloxLocaleId_0);
    v493:SetLocale(l_RobloxLocaleId_0);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 2120 ]]
        -- upvalues: v493 (copy), v490 (copy), v491 (copy)
        return v493:Format(v490, v491);
    end);
    if l_status_0 then
        return l_result_0;
    else
        v7("Failed to translate string with key: " .. v490);
        return "";
    end;
end;
v79.resolveEditorCategory = function(v496) --[[ Line: 2138 ]] --[[ Name: resolveEditorCategory ]]
    -- upvalues: v21 (copy)
    for _, v498 in (v21()) do
        if v498.Id == v496 then
            return v498.Category, nil;
        elseif v498.Subcategories then
            for _, v500 in v498.Subcategories do
                if v500.Id == v496 then
                    return v498.Category, v500.Subcategory;
                end;
            end;
        end;
    end;
    return nil, nil;
end;
return v79;