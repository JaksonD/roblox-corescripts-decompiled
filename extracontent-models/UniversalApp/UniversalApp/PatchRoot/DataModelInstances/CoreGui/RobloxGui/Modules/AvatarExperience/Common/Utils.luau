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
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v23 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local l_FFlagAXCatalogCategoriesStore_0 = v20.FFlagAXCatalogCategoriesStore;
local l_FFlagAXCustomizeMakeupSupport_0 = v20.FFlagAXCustomizeMakeupSupport;
local v27 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategoriesFromStore);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v30 = require(l_Modules_0.LuaApp.Constants);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v34 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorStructure);
local v35 = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local v36 = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local v37 = require(l_Modules_0.AvatarExperience.Common.Enum.WearTimeFilter);
local v38 = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local v42 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
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
local l_FullView_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.FullView;
local l_SwitchTab_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SwitchTab;
local v55 = l_GuiService_0:IsTenFootInterface();
local v56 = game:DefineFastString("AXLookWidgetContentType", "SearchToLooksWidget,SearchToCommunityLooksWidget,SearchToAvatarLooksWidget,PersonalizedAvatarLooksWidget,SortsPersonalizedAvatarLooksWidget,MySharedAvatarsWidget");
local v57 = game:DefineFastString("AXAvatarWidgetContentType", "SearchToAvatarLooksWidget,PersonalizedAvatarLooksWidget,SortsPersonalizedAvatarLooksWidget,MySharedAvatarsWidget");
local l_FFlagAXSlotsInventoryLoadableGridView_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsInventoryLoadableGridView;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local v60 = game:DefineFastFlag("AXFixMinMaxPriceFilterError", false);
local v61 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXExtractEmotesCategory);
local v62 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize);
local l_FFlagAXHttpCatalogV2SearchItemDetails_0 = v20.FFlagAXHttpCatalogV2SearchItemDetails;
local l_FFlagAXMutedErrorLoggingForCategorySelection_0 = v20.FFlagAXMutedErrorLoggingForCategorySelection;
local l_FFlagAXTimedOptionsSalesTypeFilter_0 = v20.FFlagAXTimedOptionsSalesTypeFilter;
local l_FFlagAXRemoveTimedOptionsSalesTypeEnumCheck_0 = v20.FFlagAXRemoveTimedOptionsSalesTypeEnumCheck;
local l_FFlagAXCatalogSearchParamTypes_0 = v20.FFlagAXCatalogSearchParamTypes;
local l_FFlagAXEditorSubcategoryFilters_0 = v20.FFlagAXEditorSubcategoryFilters;
local l_FFlagAvatarJointUpgradeInUA_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAvatarJointUpgradeInUA;
local l_FFlagAXFixCatalogSearchZoom_0 = v20.FFlagAXFixCatalogSearchZoom;
local v71 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v72 = {};
local v73 = {};
local v74 = string.split(v56, ",") or {};
v72 = v10.List.map(v74, function(v75) --[[ Line: 128 ]]
    return v75:match("^%s*(.*)%s*$");
end);
local v76 = string.split(v57, ",") or {};
v73 = v10.List.map(v76, function(v77) --[[ Line: 135 ]]
    return v77:match("^%s*(.*)%s*$");
end);
local v78 = {
    PageType = v23.PageType.Other, 
    RecommendationsType = v24.RecommendationsType.None
};
local v79 = {
    PageType = v23.PageType.Other, 
    RecommendationsType = v24.RecommendationsType.None, 
    CanAnimateCameraBasedMood = true
};
local v80 = {};
local v81 = {};
local v82 = {};
local v89 = l_memoize_0(function(v83, v84, v85) --[[ Line: 181 ]]
    -- upvalues: v10 (copy), v23 (copy)
    local v86 = v83[v84];
    if v86.Subcategories and v85 then
        local v87 = v86.Subcategories[v85];
        if v87 then
            local v88 = v10.Dictionary.join(v86, v87);
            v88.AssetTypeIdStrings = v87.AssetTypeIdStrings;
            v88.BundleTypes = v87.BundleTypes;
            v88.CategoryFilter = v87.CategoryFilter;
            v88.Subcategories = v87.Subcategories;
            return v88;
        end;
    end;
    if v86.PageType == v23.PageType.Emotes then
        return v10.Dictionary.join(v86, {
            EmoteSlot = v85
        });
    else
        return v86;
    end;
end);
local v97 = l_memoize_0(function(v90, v91, v92) --[[ Line: 224 ]]
    -- upvalues: v46 (copy), l_FFlagAXMutedErrorLoggingForCategorySelection_0 (copy), v7 (copy), v10 (copy), v23 (copy)
    local v93 = v46.extractCategoryById(v91, v90);
    if l_FFlagAXMutedErrorLoggingForCategorySelection_0 and v93 == nil then
        v7("[buildCategoryInfoById] Category not found for categoryId: " .. tostring(v91) .. " and subcategoryId: " .. tostring(v92));
    end;
    if v93.Subcategories and v92 then
        local l_Subcategories_0 = v93.Subcategories;
        local v95 = v46.extractSubcategoryById(v92, l_Subcategories_0);
        if v95 then
            local v96 = v10.Dictionary.join(v93, v95);
            v96.AssetTypeIdStrings = v95.AssetTypeIdStrings;
            v96.BundleTypes = v95.BundleTypes;
            v96.CategoryFilter = v95.CategoryFilter;
            v96.Subcategories = v95.Subcategories;
            v96.SubcategoriesMap = v95.SubcategoriesMap;
            return v96;
        end;
    end;
    if v93.PageType == v23.PageType.Emotes then
        return v10.Dictionary.join(v93, {
            EmoteSlot = v92
        });
    else
        return v93;
    end;
end);
local function _(v98, v99, v100) --[[ Line: 275 ]] --[[ Name: categoryKey ]]
    return string.format("%s.%s.%s", tostring(v98), tostring(v99), (tostring(v100)));
end;
local function _(v102, v103, v104) --[[ Line: 279 ]] --[[ Name: categoryKeyV2 ]]
    return string.format("%s.%s.%s", tostring(v102), tostring(v103), (tostring(v104)));
end;
v80.getCategoryInfo = l_memoize_0(function(v106, v107, v108) --[[ Line: 288 ]]
    -- upvalues: v81 (copy), v89 (copy)
    local v109 = string.format("%s.%s.%s", tostring(v106), tostring(v107), (tostring(v108)));
    local v110 = v81[v109];
    if v110 == nil then
        v110 = v89(v106, v107, v108);
        v81[v109] = v110;
    end;
    return v110;
end);
v80.getCategoryInfoById = l_memoize_0(function(v111, v112, v113) --[[ Line: 300 ]]
    -- upvalues: v82 (copy), v97 (copy)
    local v114 = string.format("%s.%s.%s", tostring(v111), tostring(v112), (tostring(v113)));
    local v115 = v82[v114];
    if v115 == nil then
        v115 = v97(v111, v112, v113);
        v82[v114] = v115;
    end;
    return v115;
end);
v80.getCatalogCategoryInfo = l_memoize_0(function(v116, v117) --[[ Line: 312 ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v28 (copy), v27 (copy), v80 (copy)
    local v118 = if l_FFlagAXCatalogCategoriesStore_0 then v28() else v27();
    return v80.getCategoryInfo(v118, v116, v117);
end);
v80.getCatalogCategoryInfoById = l_memoize_0(function(v119, v120) --[[ Line: 321 ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v28 (copy), v27 (copy), v80 (copy)
    local v121 = if l_FFlagAXCatalogCategoriesStore_0 then v28() else v27();
    return v80.getCategoryInfoById(v121, v119, v120);
end);
v80.getAvatarEditorCategoryInfo = l_memoize_0(function(v122, v123) --[[ Line: 330 ]]
    -- upvalues: v22 (copy), v80 (copy)
    local v124 = v22();
    return v80.getCategoryInfo(v124, v122, v123);
end);
local function _(v125) --[[ Line: 336 ]] --[[ Name: getCatalogCardFooterHeight ]]
    if v125 < 100 then
        return 30;
    elseif v125 < 148 then
        return 36;
    else
        return 42;
    end;
end;
local v136 = l_memoize_0(function(v127, _, v129) --[[ Line: 346 ]]
    -- upvalues: v23 (copy)
    local v130 = if v129 then v23.CreatorNameItemTileTitleMaxLines else v23.ItemTileTitleMaxLines;
    local v131 = if v129 then v23.CreatorNameItemTilePadding else v23.ItemTilePadding;
    return function(v132) --[[ Line: 354 ]]
        -- upvalues: v130 (copy), v127 (copy), v131 (copy), v129 (copy)
        local v133 = v130 * v127;
        local v134 = v131 * 2;
        local v135 = v132 < 100 and 30 or v132 < 148 and 36 or 42;
        if v129 then
            v135 = v135 * 2;
        end;
        return v132 + v133 + v134 + v135;
    end;
end);
local v147 = l_memoize_0(function(v137, _, v139) --[[ Line: 369 ]]
    -- upvalues: v23 (copy)
    local v140 = if v139 then v23.CreatorNameItemTileTitleMaxLines else v23.ItemTileTitleMaxLines;
    local v141 = if v139 then v23.CreatorNameItemTilePadding else v23.ItemTilePadding;
    return function(v142) --[[ Line: 377 ]]
        -- upvalues: v23 (ref), v140 (copy), v137 (copy), v141 (copy), v139 (copy)
        local v143 = v142 / v23.ItemTileTallAspectRatio;
        local v144 = v140 * v137;
        local v145 = v141 * 2;
        local v146 = v142 < 100 and 30 or v142 < 148 and 36 or 42;
        if v139 then
            v146 = v146 * 2;
        end;
        return v143 + v144 + v145 + v146;
    end;
end);
v80.isLooksWidget = function(v148) --[[ Line: 393 ]] --[[ Name: isLooksWidget ]]
    -- upvalues: v72 (ref)
    return table.find(v72, v148) ~= nil;
end;
v80.isAvatarLooksWidget = function(v149) --[[ Line: 402 ]] --[[ Name: isAvatarLooksWidget ]]
    -- upvalues: v80 (copy), v73 (ref)
    return v80.isLooksWidget(v149) and table.find(v73, v149) ~= nil;
end;
local v158 = l_memoize_0(function(v150, _, v152, v153, v154) --[[ Line: 409 ]]
    -- upvalues: v23 (copy)
    return function(v155) --[[ Line: 416 ]]
        -- upvalues: v23 (ref), v152 (copy), v153 (copy), v154 (copy), v150 (copy)
        local v156 = v155 / v23.LookTileAspectRatio;
        local v157 = v152 or v153;
        if not v154 then
            v156 = v156 + 30;
        elseif v157 then
            v156 = v156 + 30;
        end;
        if v157 then
            v156 = v156 + 4;
        end;
        if v152 then
            v156 = v156 + v150;
        end;
        if v153 then
            if v152 then
                v156 = v156 + 4;
            end;
            v156 = v156 + v150;
        end;
        return v156;
    end;
end);
local v163 = l_memoize_0(function(v159) --[[ Line: 457 ]]
    -- upvalues: v23 (copy)
    return function(v160) --[[ Line: 458 ]]
        -- upvalues: v23 (ref), v159 (copy)
        local v161 = v23.ItemTileTitleMaxLines * v159;
        local l_ItemTilePadding_0 = v23.ItemTilePadding;
        return v160 + v161 + l_ItemTilePadding_0;
    end;
end);
local function v165(v164) --[[ Line: 466 ]] --[[ Name: squareItemHeightGetter ]]
    return v164;
end;
local v170 = l_memoize_0(function(v166) --[[ Line: 470 ]]
    -- upvalues: v165 (copy), l_FFlagAXSlotsInventoryLoadableGridView_0 (copy), v23 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
    if v166 == nil then
        return v165;
    else
        return function(v167) --[[ Line: 474 ]]
            -- upvalues: l_FFlagAXSlotsInventoryLoadableGridView_0 (ref), v23 (ref), v166 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (ref)
            local v168 = if l_FFlagAXSlotsInventoryLoadableGridView_0 then v23.EditorItemTileTitleMaxLines * v166 else v23.ItemTileTitleMaxLines * v166;
            local v169 = if l_FFlagAXRootSlotBasedEditorFlag_0 then v23.ItemTilePadding else v23.ItemTilePadding * 2;
            return v167 + v168 + v169;
        end;
    end;
end);
local function _(v171) --[[ Line: 488 ]] --[[ Name: splitKeywords ]]
    if v171 then
        return string.split(v171, " ");
    else
        return {};
    end;
end;
v80.mergeKeywordsAndTopics = function(v173, v174) --[[ Line: 508 ]] --[[ Name: mergeKeywordsAndTopics ]]
    local v175 = if v173 then string.split(v173, " ") else {};
    local v176 = if v174 then string.split(v174, " ") else {};
    for _, v178 in v176 do
        if #v178 > 0 and not table.find(v175, v178) then
            table.insert(v175, v178);
        end;
    end;
    return table.concat(v175, " ");
end;
v80.GetCategoryIdsFromNavKey = l_memoize_0(function(v179, v180) --[[ Line: 527 ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v28 (copy), v27 (copy)
    local v181 = if l_FFlagAXCatalogCategoriesStore_0 then v28() else v27();
    for _, v183 in v181 do
        if v183.NavigationKey then
            local l_Id_0 = v183.Id;
            if v183.NavigationKey == v179 then
                if v183.Subcategories and v180 then
                    for _, v186 in v183.Subcategories do
                        if v186.NavigationKey == v180 then
                            return l_Id_0, v186.Id;
                        end;
                    end;
                end;
                return l_Id_0, nil;
            end;
        end;
    end;
    return nil, nil;
end);
v80.GetAvatarEditorCategoryIdsFromNavKey = l_memoize_0(function(v187) --[[ Line: 550 ]]
    -- upvalues: v22 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy)
    for v188, v189 in (v22()) do
        if v189.NavigationKey == v187 then
            return v188, nil, nil;
        elseif v189.Subcategories then
            for v190, v191 in v189.Subcategories do
                if v191.NavigationKey == v187 then
                    return v188, v190, nil;
                elseif l_FFlagAXEditorSubcategoryFilters_0 and v191.SubcategoryFilters then
                    for v192, v193 in v191.SubcategoryFilters do
                        if v193.NavigationKey == v187 then
                            return v188, v190, v192;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return nil, nil, nil;
end);
v80.GridItemHeightGetter = function(v194, ...) --[[ Line: 575 ]] --[[ Name: GridItemHeightGetter ]]
    -- upvalues: v23 (copy), v170 (copy), v165 (copy), v163 (copy), v158 (copy), v136 (copy), v147 (copy)
    if v194 == v23.ItemTileType.AvatarEditorTile then
        return v170(...);
    elseif v194 == v23.ItemTileType.BodyColorButton then
        return v165;
    elseif v194 == v23.ItemTileType.BundleItemTile then
        return v163(...);
    elseif v194 == v23.ItemTileType.BundleItemTileNoText then
        return v165;
    elseif v194 == v23.ItemTileType.LookItemTile then
        return v158(...);
    elseif v194 == v23.ItemTileType.CatalogItemTile then
        return v136(...);
    elseif v194 == v23.ItemTileType.TallCatalogItemTile then
        return v147(...);
    else
        warn("Unknown itemType " .. tostring(v194) .. " in AvatarExperienceUtils.GridItemHeightGetter");
        return v165;
    end;
end;
v80.GridItemHeightGetterWithOptions = function(v195) --[[ Line: 607 ]] --[[ Name: GridItemHeightGetterWithOptions ]]
    -- upvalues: v23 (copy), v170 (copy), v165 (copy), v163 (copy), v158 (copy), v136 (copy), v147 (copy)
    local l_itemTileType_0 = v195.itemTileType;
    if l_itemTileType_0 == v23.ItemTileType.AvatarEditorTile then
        return v170(v195.fontHeight);
    elseif l_itemTileType_0 == v23.ItemTileType.BodyColorButton then
        return v165;
    elseif l_itemTileType_0 == v23.ItemTileType.BundleItemTile and v195.fontHeight then
        return v163(v195.fontHeight);
    elseif l_itemTileType_0 == v23.ItemTileType.BundleItemTileNoText then
        return v165;
    elseif l_itemTileType_0 == v23.ItemTileType.LookItemTile and v195.fontHeight then
        return v158(v195.fontHeight, v195.hideItemName, v195.itemCreatorNamesEnabled, v195.itemPriceEnabled, v195.isWidgetFocused);
    elseif l_itemTileType_0 == v23.ItemTileType.CatalogItemTile then
        return v136(v195.fontHeight, nil, v195.itemCreatorNamesEnabled);
    elseif l_itemTileType_0 == v23.ItemTileType.TallCatalogItemTile then
        return v147(v195.fontHeight, nil, v195.itemCreatorNamesEnabled);
    else
        warn("Unknown itemType " .. tostring(l_itemTileType_0) .. " in AvatarExperienceUtils.GridItemHeightGetterWithOptions");
        return v165;
    end;
end;
v80.isAvatarBackground = function(v197) --[[ Line: 636 ]] --[[ Name: isAvatarBackground ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v197 == l_AvatarScreen_0.AvatarBackground;
end;
v80.isAvatarExperienceRoute = function(v198) --[[ Line: 640 ]] --[[ Name: isAvatarExperienceRoute ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_AvatarScreen_0 (copy), l_SwitchTab_0 (copy)
    local v199 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v198) else v198.Navigation.history[#v198.Navigation.history];
    for _, v201 in v199 do
        if v201.name == l_AvatarScreen_0.AvatarExperienceRoot or v201.name == l_SwitchTab_0.AvatarExperienceTab then
            return true;
        end;
    end;
    return false;
end;
v80.isRouteInAvatarEditor = function(v202) --[[ Line: 655 ]] --[[ Name: isRouteInAvatarEditor ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v202.opaque.name == l_AvatarScreen_0.AvatarEditor;
end;
v80.didLeaveAvatarEditor = function(v203, v204) --[[ Line: 664 ]] --[[ Name: didLeaveAvatarEditor ]]
    -- upvalues: v80 (copy)
    if v80.isRouteInAvatarEditor(v204) and not v80.isRouteInAvatarEditor(v203) then
        return true;
    else
        return false;
    end;
end;
v80.getIsSceneFullViewFromState = function(v205, v206) --[[ Line: 673 ]] --[[ Name: getIsSceneFullViewFromState ]]
    -- upvalues: l_FullView_0 (copy)
    local l_name_0 = v206.opaque.name;
    return v205.AvatarExperience.Common.FullView[l_name_0] == l_FullView_0.SceneFullView;
end;
v80.getCatalogCategoryInfoFromState = function(v208) --[[ Line: 678 ]] --[[ Name: getCatalogCategoryInfoFromState ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v7 (copy), v80 (copy)
    if l_FFlagAXCatalogCategoriesStore_0 then
        v7("getCatalogCategoryInfoFromState is not supported with FFlagAXCatalogCategoriesStore");
    end;
    local l_categoryId_0 = v208.AvatarExperience.Catalog.Categories.categoryId;
    local l_subcategoryId_0 = v208.AvatarExperience.Catalog.Categories.subcategoryId;
    return v80.getCatalogCategoryInfoById(l_categoryId_0, l_subcategoryId_0);
end;
v80.getAvatarEditorCategoryInfoFromState = function(v211) --[[ Line: 688 ]] --[[ Name: getAvatarEditorCategoryInfoFromState ]]
    -- upvalues: v80 (copy)
    local l_category_0 = v211.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v211.AvatarExperience.AvatarEditor.Categories.subcategory;
    return v80.getAvatarEditorCategoryInfo(l_category_0, l_subcategory_0);
end;
v80.getAvatarEditorSubcategoryFilterFromState = function(v214) --[[ Line: 696 ]] --[[ Name: getAvatarEditorSubcategoryFilterFromState ]]
    -- upvalues: v80 (copy)
    local v215 = v80.getAvatarEditorCategoryInfoFromState(v214);
    if v215.SubcategoryFilters then
        local l_subcategoryFilter_0 = v214.AvatarExperience.AvatarEditor.Categories.subcategoryFilter;
        return v215.SubcategoryFilters[l_subcategoryFilter_0];
    else
        return nil;
    end;
end;
v80.getSelectedAccessoryDescription = function(v217, v218) --[[ Line: 707 ]] --[[ Name: getSelectedAccessoryDescription ]]
    local v219 = tonumber(v218) or 0;
    for _, v221 in v217:GetChildren() do
        if v221:IsA("AccessoryDescription") and v221.AssetId == v219 then
            return v221;
        end;
    end;
    return nil;
end;
v80.getAccessoryAdjustmentCategoryInfo = function(v222) --[[ Line: 722 ]] --[[ Name: getAccessoryAdjustmentCategoryInfo ]]
    -- upvalues: v80 (copy), v43 (copy)
    local v223 = v222.AvatarExperience.AccessoryAdjustment.SelectedAccessory or "";
    local l_CurrentCharacter_0 = v222.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    assert(l_CurrentCharacter_0, "assert currentCharacter exists");
    local l_Humanoid_0 = l_CurrentCharacter_0:FindFirstChild("Humanoid");
    assert(l_Humanoid_0, "assert humanoid exists");
    local l_HumanoidDescription_0 = l_Humanoid_0:FindFirstChild("HumanoidDescription");
    assert(l_HumanoidDescription_0, "assert currentCharacter exists");
    local v227 = v80.getSelectedAccessoryDescription(l_HumanoidDescription_0, v223);
    if not v227 then
        return;
    else
        assert(v227, "assert accessoryDescription exists");
        return v43.CameraCategories[v227.AccessoryType];
    end;
end;
v80.getCategoryInfoFromState = function(v228, v229) --[[ Line: 749 ]] --[[ Name: getCategoryInfoFromState ]]
    -- upvalues: l_AvatarScreen_0 (copy), v80 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v71 (copy), l_FFlagAXFixCatalogSearchZoom_0 (copy), v78 (copy), v61 (copy), v51 (copy), v34 (copy), v23 (copy), v42 (copy), v44 (copy), v79 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy)
    local l_name_1 = v229.opaque.name;
    if l_name_1 == l_AvatarScreen_0.AvatarEditor then
        return v80.getAvatarEditorCategoryInfoFromState(v228);
    elseif l_name_1 == l_AvatarScreen_0.Catalog then
        if l_FFlagAXCatalogCategoriesStore_0 then
            return (v71.getCatalogSelectionStore().selectedCategoryInfo(false));
        else
            return v80.getCatalogCategoryInfoFromState(v228);
        end;
    elseif l_FFlagAXFixCatalogSearchZoom_0 and l_name_1 == l_AvatarScreen_0.CatalogSearch then
        if l_FFlagAXCatalogCategoriesStore_0 then
            return v71.getCatalogSearchSelectionStore().selectedCategoryInfo(false);
        else
            local l_categoryId_1 = v228.AvatarExperience.Catalog.SearchCategories.categoryId;
            local l_subcategoryId_1 = v228.AvatarExperience.Catalog.SearchCategories.subcategoryId;
            if l_categoryId_1 then
                local v233 = v80.getCatalogCategoryInfoById(l_categoryId_1, l_subcategoryId_1);
                if v233 then
                    return v233;
                end;
            end;
            return v78;
        end;
    elseif l_name_1 == l_AvatarScreen_0.ProfilePictureEditorEmotes then
        if v61() then
            return (v51());
        else
            local v234 = v34().AssetTypeToCategorySubcategory[v23.AssetTypeIdStrings.EmoteAnimation];
            local l_category_1 = v234.category;
            local l_subcategory_1 = v234.subcategory;
            return v80.getAvatarEditorCategoryInfo(l_category_1, l_subcategory_1);
        end;
    elseif l_name_1 == l_AvatarScreen_0.AdjustAccessoryView then
        local v237 = v80.getAccessoryAdjustmentCategoryInfo(v228);
        if v237 then
            return v237;
        else
            return v78;
        end;
    elseif v42.readTestVariable(v44.EnabledForUser) and l_name_1 == l_AvatarScreen_0.CatalogSearch then
        return v79;
    elseif l_name_1 == l_AvatarScreen_0.HeadRefinement then
        return v23.HeadRefinementCameraCategory;
    elseif l_FFlagAXCustomizeMakeupSupport_0 and l_name_1 == l_AvatarScreen_0.LayeredMakeupSort then
        return v23.LayeredMakeupCameraCategory;
    else
        return v78;
    end;
end;
local v238 = {
    "Torso", 
    "RightArm", 
    "LeftArm", 
    "LeftLeg", 
    "RightLeg"
};
v80.routeIsProfilePictureEditor = function(v239) --[[ Line: 824 ]] --[[ Name: routeIsProfilePictureEditor ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local v240 = true;
    if v239.opaque.name ~= l_AvatarScreen_0.ProfilePictureEditorEmotes then
        v240 = true;
        if v239.opaque.name ~= l_AvatarScreen_0.ProfilePictureEditorCamera then
            v240 = v239.opaque.name == l_AvatarScreen_0.ProfilePictureEditorFinal;
        end;
    end;
    return v240;
end;
v80.routeIsPPEStaticImagePage = function(v241) --[[ Line: 834 ]] --[[ Name: routeIsPPEStaticImagePage ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local v242 = true;
    if v241.opaque.name ~= l_AvatarScreen_0.ProfilePictureEditorCamera then
        v242 = v241.opaque.name == l_AvatarScreen_0.ProfilePictureEditorFinal;
    end;
    return v242;
end;
v80.isFullyQualifiedCostume = function(v243) --[[ Line: 839 ]] --[[ Name: isFullyQualifiedCostume ]]
    -- upvalues: v238 (copy)
    for _, v245 in v238 do
        if v243[v245] == "" or v243[v245] == 0 then
            return false;
        end;
    end;
    return true;
end;
v80.shouldShowGradientForScrollingFrame = function(v246) --[[ Line: 848 ]] --[[ Name: shouldShowGradientForScrollingFrame ]]
    local l_AbsoluteSize_0 = v246.AbsoluteSize;
    local l_CanvasSize_0 = v246.CanvasSize;
    local l_CanvasPosition_0 = v246.CanvasPosition;
    return l_AbsoluteSize_0.X < l_CanvasSize_0.X.Offset, l_CanvasPosition_0.X > 20, l_CanvasPosition_0.X + l_AbsoluteSize_0.X < l_CanvasSize_0.X.Offset - 20;
end;
v80.Round = function(v250, v251) --[[ Line: 861 ]] --[[ Name: Round ]]
    local v252 = v251 or 1;
    return math.floor((v250 + v252 / 2) / v252) * v252;
end;
v80.isFetchingDoneOrFailed = function(v253, v254) --[[ Line: 866 ]] --[[ Name: isFetchingDoneOrFailed ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    local v255 = true;
    if v253 ~= l_RetrievalStatus_0.Done then
        v255 = v253 == l_RetrievalStatus_0.Failed;
    end;
    local v256 = true;
    if v254 ~= l_RetrievalStatus_0.Done then
        v256 = v254 == l_RetrievalStatus_0.Failed;
    end;
    return not v255 and v256;
end;
v80.getDeviceType = function() --[[ Line: 874 ]] --[[ Name: getDeviceType ]]
    -- upvalues: l_UserInputService_0 (copy), v23 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
        return v23.DeviceType.Android;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
        return v23.DeviceType.IOS;
    else
        return v23.DeviceType.Other;
    end;
end;
v80.getUserOutfitIdFromBundle = function(v258) --[[ Line: 886 ]] --[[ Name: getUserOutfitIdFromBundle ]]
    -- upvalues: v23 (copy)
    for _, v260 in v258.items do
        if v260.type == v23.ItemType.Outfit then
            return v260.id;
        end;
    end;
    return nil;
end;
v80.getUserOutfitIdsFromBundle = function(v261) --[[ Line: 897 ]] --[[ Name: getUserOutfitIdsFromBundle ]]
    -- upvalues: v23 (copy)
    local v262 = {};
    if v261.items then
        for _, v264 in v261.items do
            if v264.type == v23.ItemType.Outfit then
                table.insert(v262, v264.id);
            end;
        end;
    end;
    return v262;
end;
v80.getBundleInfo = l_memoize_0(function(v265, v266) --[[ Line: 912 ]]
    if v266 == nil then
        return nil;
    else
        local v267 = v265[v266];
        if not v267 then
            return nil;
        elseif v267.receivedCatalogData then
            return v267;
        else
            return nil;
        end;
    end;
end);
v80.getBundleInfoFromState = function(v268, v269) --[[ Line: 928 ]] --[[ Name: getBundleInfoFromState ]]
    -- upvalues: v80 (copy)
    local l_BundleInfos_0 = v268.AvatarExperience.Common.BundleInfos;
    return v80.getBundleInfo(l_BundleInfos_0, v269);
end;
v80.getOutfitInfoFromBundleIdNoState = function(v271, v272) --[[ Line: 936 ]] --[[ Name: getOutfitInfoFromBundleIdNoState ]]
    -- upvalues: v80 (copy), v12 (copy), v10 (copy)
    if not v271 then
        return nil;
    else
        assert(v271, "contentId is not nil: silences type checker");
        local v273 = v80.getUserOutfitIdsFromBundle(v271);
        if #v273 < 1 then
            return nil;
        else
            local v274 = nil;
            for _, v276 in v273 do
                local v277 = v272[v276];
                if not v277 then
                    return nil;
                elseif not v274 then
                    v274 = v12.deepCopy(v277);
                else
                    v274.assets = v10.Dictionary.join(v274.assets, v277.assets);
                end;
            end;
            return v274;
        end;
    end;
end;
v80.getOutfitInfoFromBundleId = function(v278, v279) --[[ Line: 971 ]] --[[ Name: getOutfitInfoFromBundleId ]]
    -- upvalues: v80 (copy)
    local v280 = v80.getBundleInfoFromState(v278, v279);
    local l_OutfitInfos_0 = v278.AvatarExperience.AvatarEditor.OutfitInfos;
    return v80.getOutfitInfoFromBundleIdNoState(v280, l_OutfitInfos_0);
end;
v80.getAllCategoriesStr = function(v282) --[[ Line: 978 ]] --[[ Name: getAllCategoriesStr ]]
    local v283 = "";
    local v284 = 1;
    while true do
        local v285 = "level" .. v284;
        if v282[v285] then
            if v284 ~= 1 then
                v283 = v283 .. "|";
            end;
            v283 = v283 .. v282[v285];
            v284 = v284 + 1;
        else
            break;
        end;
    end;
    return v283;
end;
v80.isAnimationAssetType = function(v286) --[[ Line: 1000 ]] --[[ Name: isAnimationAssetType ]]
    -- upvalues: v23 (copy)
    local v287 = true;
    if v286 ~= v23.AssetTypeIdStrings.ClimbAnimation then
        v287 = true;
        if v286 ~= v23.AssetTypeIdStrings.FallAnimation then
            v287 = true;
            if v286 ~= v23.AssetTypeIdStrings.IdleAnimation then
                v287 = true;
                if v286 ~= v23.AssetTypeIdStrings.JumpAnimation then
                    v287 = true;
                    if v286 ~= v23.AssetTypeIdStrings.RunAnimation then
                        v287 = true;
                        if v286 ~= v23.AssetTypeIdStrings.SwimAnimation then
                            v287 = v286 == v23.AssetTypeIdStrings.WalkAnimation;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v287;
end;
v80.getNumElementsWithKeyField = function(v288) --[[ Line: 1010 ]] --[[ Name: getNumElementsWithKeyField ]]
    local v289 = 0;
    if v288 then
        for _, v291 in v288 do
            if typeof(v291) == "table" and v291.key then
                v289 = v289 + 1;
            end;
        end;
    end;
    return v289;
end;
v80.lerp = function(v292, v293, v294) --[[ Line: 1022 ]] --[[ Name: lerp ]]
    return (v293 - v292) * v294 + v292;
end;
v80.getTopBarHeightAvatarScene = function(v295) --[[ Line: 1026 ]] --[[ Name: getTopBarHeightAvatarScene ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v30 (copy)
    if not v295.TopBar then
        return 0;
    elseif v295.DeviceOrientation == l_DeviceOrientationMode_0.Landscape then
        return v295.TopBar.statusBarHeight + v30.NAV_BAR_SIZE;
    else
        return v295.TopBar.topBarHeight;
    end;
end;
v80.tableToCamelCaseKeys = function(v296) --[[ Line: 1040 ]] --[[ Name: tableToCamelCaseKeys ]]
    -- upvalues: v80 (copy)
    local v297 = {};
    for v298, v299 in v296 do
        local l_v298_0 = v298;
        if typeof(v298) == "string" then
            l_v298_0 = string.lower((string.sub(v298, 1, 1))) .. string.sub(v298, 2);
        end;
        local l_v299_0 = v299;
        if typeof(v299) == "table" then
            l_v299_0 = v80.tableToCamelCaseKeys(v299);
        end;
        v297[l_v298_0] = l_v299_0;
    end;
    return v297;
end;
v80.AssetTypeIdStringToEnumValue = function(v302) --[[ Line: 1061 ]] --[[ Name: AssetTypeIdStringToEnumValue ]]
    -- upvalues: v23 (copy)
    local v303 = v23.AssetTypeIdStringToName[v302];
    return Enum.AvatarAssetType[v303];
end;
v80.bundleIdToEnum = function(v304) --[[ Line: 1066 ]] --[[ Name: bundleIdToEnum ]]
    -- upvalues: v23 (copy)
    local v305 = v23.BundleTypeIdStringToName[v304];
    return Enum.BundleType[v305];
end;
v80.getSearchKey = function(v306, v307) --[[ Line: 1071 ]] --[[ Name: getSearchKey ]]
    -- upvalues: v45 (copy), v23 (copy)
    local v308 = v45.selectSortAndFiltersKey(v306);
    return v23.SearchCatalogKey .. v307 .. "." .. v308;
end;
local function v310(v309) --[[ Line: 1076 ]]
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
    })(v309));
end;
local function v312(v311) --[[ Line: 1091 ]]
    -- upvalues: v13 (copy)
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
        WearTimeFilter = v13.optional(v13.string)
    })(v311));
end;
local function v318(v313, v314, v315) --[[ Line: 1117 ]]
    -- upvalues: v10 (copy), v80 (copy)
    if v314 ~= nil and #v314 > 0 then
        v313.AssetTypes = v10.List.map(v314, function(v316) --[[ Line: 1119 ]]
            -- upvalues: v80 (ref)
            return v80.AssetTypeIdStringToEnumValue(v316);
        end);
    end;
    if v315 ~= nil and #v315 > 0 then
        v313.BundleTypes = v10.List.map(v315, function(v317) --[[ Line: 1126 ]]
            -- upvalues: v80 (ref)
            return v80.bundleIdToEnum(v317);
        end);
    end;
end;
local function v321(v319) --[[ Line: 1133 ]] --[[ Name: hasSortOrFilters ]]
    -- upvalues: v29 (copy), l_FFlagAXTimedOptionsSalesTypeFilter_0 (copy)
    local v320 = true;
    if v319.SortType == Enum.CatalogSortType.Relevance then
        v320 = true;
        if v319.CreatorName == "" then
            v320 = true;
            if v319.SalesTypeFilter == Enum.SalesTypeFilter.All then
                v320 = true;
                if v319.SearchKeyword == "" then
                    v320 = true;
                    if v319.MinPrice <= v29.MinPriceFilter then
                        v320 = true;
                        if v319.MaxPrice >= v29.MaxPriceFilter then
                            v320 = v319.IncludeOffSale or game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and not l_FFlagAXTimedOptionsSalesTypeFilter_0 and v319.TimedOptionFilter ~= Enum.CatalogTimedOptionFilter.All;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v320;
end;
if l_FFlagAXHttpCatalogV2SearchItemDetails_0 then
    v80.getSearchParamsAsQueryParams = function(v322, v323) --[[ Line: 1148 ]] --[[ Name: getSearchParamsAsQueryParams ]]
        -- upvalues: v321 (copy), v29 (copy)
        local v324 = {
            keyword = v322.SearchKeyword or "", 
            limit = v322.Limit
        };
        if v322.CategoryFilter ~= Enum.CatalogCategoryFilter.None and not v321(v322) then
            v324.categoryFilter = tostring(v322.CategoryFilter.Name);
        end;
        v324.sortType = v29.SortTypeAPIMap[tostring(v322.SortType.Name)];
        if v322.CreatorName and v322.CreatorName ~= "" then
            v324.creatorName = v322.CreatorName;
        end;
        if v323 and v323.TaxonomyUuid then
            v324.taxonomy = tostring(v323.TaxonomyUuid);
        else
            if v322.BundleTypes and #v322.BundleTypes > 0 then
                local v325 = {};
                for _, v327 in v322.BundleTypes do
                    table.insert(v325, v327.Value);
                end;
                v324.bundleTypeIds = v325;
            end;
            if v322.AssetTypes and #v322.AssetTypes > 0 then
                local v328 = {};
                for _, v330 in v322.AssetTypes do
                    table.insert(v328, v330.Value);
                end;
                v324.assetTypeIds = v328;
            end;
        end;
        v324.includeNotForSale = v322.IncludeOffSale;
        v324.creatorType = "All";
        if v322.MinPrice and v322.MinPrice > v29.MinPriceFilter then
            v324.minPrice = v322.MinPrice;
        end;
        if v322.MaxPrice and v322.MaxPrice < v29.MaxPriceFilter then
            v324.maxPrice = v322.MaxPrice;
        end;
        if v322.SalesTypeFilter and v322.SalesTypeFilter ~= Enum.SalesTypeFilter.All then
            v324.salesTypeFilter = tostring(v322.SalesTypeFilter.Name);
        end;
        if v322.SortAggregation and (v322.SortType == Enum.CatalogSortType.MostFavorited or v322.SortType == Enum.CatalogSortType.Bestselling) then
            v324.sortAggregation = tostring(v322.SortAggregation.Name);
        end;
        return v324;
    end;
end;
v80.getSearchParams = function(v331, v332, v333) --[[ Line: 1233 ]] --[[ Name: getSearchParams ]]
    -- upvalues: v310 (copy), v312 (copy), l_FFlagAXTimedOptionsSalesTypeFilter_0 (copy), l_FFlagAXCatalogSearchParamTypes_0 (copy), v318 (copy), v29 (copy), v60 (copy), v38 (copy), v36 (copy), l_FFlagAXRemoveTimedOptionsSalesTypeEnumCheck_0 (copy), v7 (copy), v37 (copy), v35 (copy), v321 (copy)
    v310(v331);
    v312(v332);
    local v334 = CatalogSearchParams.new();
    local v335 = nil;
    if v331.searchKeyword then
        v335 = v331.searchKeyword;
    end;
    v334.AssetTypes = {};
    v334.BundleTypes = {};
    v334.IncludeOffSale = false;
    if game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and not l_FFlagAXTimedOptionsSalesTypeFilter_0 then
        v334.TimedOptionFilter = Enum.CatalogTimedOptionFilter.All;
    end;
    local v336 = false;
    local v337 = if l_FFlagAXCatalogSearchParamTypes_0 then v332.SelectedTopics else v331.topics or v332.SelectedTopics;
    if v337 and #v337 > 0 then
        v336 = true;
        local v338 = table.concat(v337, " ");
        if v335 == nil then
            v335 = v338;
        else
            if #v335 > 0 then
                v335 = v335 .. " ";
            end;
            v335 = v335 .. v338;
        end;
    end;
    if v335 then
        v334.SearchKeyword = v335;
    end;
    local v339 = 120;
    if not v335 and v333 then
        v339 = 30;
    end;
    v334.Limit = v339;
    if v331.categoryInfo == nil then
        local v340 = {};
        local v341 = {};
        v334.CategoryFilter = if l_FFlagAXCatalogSearchParamTypes_0 then Enum.CatalogCategoryFilter.None else v331.categoryFilter or Enum.CatalogCategoryFilter.None;
        v318(v334, v340, v341);
    else
        local l_CategoryFilter_0 = v331.categoryInfo.CategoryFilter;
        local v343 = v29.CategoryFilters[l_CategoryFilter_0];
        if v343 == nil or v336 then
            v334.CategoryFilter = Enum.CatalogCategoryFilter.None;
        else
            v334.CategoryFilter = v343;
        end;
        local l_AssetTypeIdStrings_0 = v331.categoryInfo.AssetTypeIdStrings;
        local l_BundleTypes_0 = v331.categoryInfo.BundleTypes;
        v318(v334, l_AssetTypeIdStrings_0, l_BundleTypes_0);
    end;
    local v346 = if l_FFlagAXCatalogSearchParamTypes_0 then v332.PriceRange.minPrice else v331.minPrice or v332.PriceRange.minPrice;
    local v347 = if l_FFlagAXCatalogSearchParamTypes_0 then v332.PriceRange.maxPrice else v331.maxPrice or v332.PriceRange.maxPrice;
    if v60 and v346 and v347 and v347 < v346 then
        local l_v347_0 = v347;
        v347 = v346;
        v346 = l_v347_0;
    end;
    if v29.MinPriceFilter < v346 then
        v334.MinPrice = v346;
    end;
    if v347 < v29.MaxPriceFilter then
        v334.MaxPrice = v347;
    end;
    local v349 = if l_FFlagAXCatalogSearchParamTypes_0 then v332.CatalogSort else v331.catalogSort or v332.CatalogSort;
    v334.SortType = Enum.CatalogSortType[v349];
    if v332.UnavailableItemFilter ~= v38.Hide then
        v334.IncludeOffSale = true;
    end;
    local l_SalesTypeFilter_0 = v332.SalesTypeFilter;
    if l_SalesTypeFilter_0 ~= v36.All then
        if l_FFlagAXTimedOptionsSalesTypeFilter_0 then
            if not l_FFlagAXRemoveTimedOptionsSalesTypeEnumCheck_0 then
                local v352 = pcall(function() --[[ Line: 1342 ]]
                    local _ = Enum.SalesTypeFilter.TimedOptions;
                end);
                if l_SalesTypeFilter_0 == v36.TimedOptions and not v352 then
                    v7("Referenced TimeOptions sales type but enum value is not present");
                else
                    v334.SalesTypeFilter = Enum.SalesTypeFilter[l_SalesTypeFilter_0];
                end;
            else
                v334.SalesTypeFilter = Enum.SalesTypeFilter[l_SalesTypeFilter_0];
            end;
        else
            v334.SalesTypeFilter = Enum.SalesTypeFilter[l_SalesTypeFilter_0];
        end;
    end;
    local l_CreatorFilter_0 = v332.CreatorFilter;
    if l_CreatorFilter_0 ~= nil and l_CreatorFilter_0 ~= "" then
        v334.CreatorName = l_CreatorFilter_0;
    end;
    if not l_FFlagAXTimedOptionsSalesTypeFilter_0 and game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") then
        local l_WearTimeFilter_0 = v332.WearTimeFilter;
        if l_WearTimeFilter_0 == v37.All then
            v334.TimedOptionFilter = Enum.CatalogTimedOptionFilter.All;
        elseif l_WearTimeFilter_0 == v37.TimedOptionsOnly then
            v334.TimedOptionFilter = Enum.CatalogTimedOptionFilter.TimedOptionOnly;
        end;
    end;
    if v349 == v35.MostFavorited or v349 == v35.Bestselling then
        v334.SortAggregation = Enum.CatalogSortAggregation[v332.CatalogSortAggregation];
    end;
    if v321(v334) then
        v334.CategoryFilter = Enum.CatalogCategoryFilter.None;
    end;
    return v334;
end;
v80.getWebAssetModelFromEquippedAssets = function(v355) --[[ Line: 1401 ]] --[[ Name: getWebAssetModelFromEquippedAssets ]]
    -- upvalues: v23 (copy)
    local v356 = {};
    for v357, v358 in v355 do
        local v359 = v23.LayeredAssetTypes[v357] ~= nil;
        for v360, v361 in v358 do
            table.insert(v356, {
                id = v360, 
                meta = v359 and v361 or nil
            });
        end;
    end;
    return v356;
end;
v80.createHumanoidDescriptionAccessoryInfo = function(v362, v363, v364) --[[ Line: 1423 ]] --[[ Name: createHumanoidDescriptionAccessoryInfo ]]
    -- upvalues: v23 (copy)
    local v365 = tonumber(v363);
    assert(v365 ~= nil, "assetIdAsNumber is not nil. Silence type checker.");
    return {
        AssetId = v365, 
        Order = v364.order, 
        AccessoryType = v364.type or v23.AssetTypeIdToAccessoryTypeEnum[v362], 
        IsLayered = v364.isLayered, 
        Position = v364.position, 
        Rotation = v364.rotation, 
        Scale = v364.scale
    };
end;
v80.createDefaultHumanoidDescriptionAccessoryInfo = function(v366, v367) --[[ Line: 1445 ]] --[[ Name: createDefaultHumanoidDescriptionAccessoryInfo ]]
    -- upvalues: v7 (copy), v23 (copy)
    local v368 = tonumber(v367);
    if v368 == nil then
        v7("Called AvatarExperienceUtils.createDefaultHumanoidDescriptionAccessoryInfo with assetId that does not convert to string.");
        v368 = 0;
    end;
    assert(v368, "assetIdAsNumber is non-nil: Silence type checker");
    return {
        AssetId = v368, 
        Order = v23.LayeredClothingOrder[v366], 
        AccessoryType = v23.AssetTypeIdToAccessoryTypeEnum[v366], 
        IsLayered = v23.LayeredAssetTypes[v366] ~= nil
    };
end;
v80.getNewFullViewEnum = function(v369) --[[ Line: 1470 ]] --[[ Name: getNewFullViewEnum ]]
    -- upvalues: l_FullView_0 (copy)
    if v369 == l_FullView_0.None then
        return l_FullView_0.UIFullView;
    else
        return l_FullView_0.None;
    end;
end;
v80.getPartCFrame = function(v370, v371) --[[ Line: 1478 ]] --[[ Name: getPartCFrame ]]
    -- upvalues: v23 (copy)
    if v370 and v370:FindFirstChild(v371) then
        return v370[v371].CFrame;
    else
        return CFrame.new(v23.DefaultRigPosition);
    end;
end;
v80.getAttachmentCFrame = function(v372, v373, v374) --[[ Line: 1486 ]] --[[ Name: getAttachmentCFrame ]]
    -- upvalues: l_FFlagAvatarJointUpgradeInUA_0 (copy)
    if v372 and v372:FindFirstChild(v373) then
        local v375 = v372[v373];
        local v376 = if l_FFlagAvatarJointUpgradeInUA_0 then nil else v375:FindFirstChild(v374);
        if l_FFlagAvatarJointUpgradeInUA_0 then
            for _, v378 in v375:GetDescendants() do
                if v378:IsA("Attachment") and v378.Name == v374 then
                    v376 = v378;
                    break;
                end;
            end;
        end;
        if v376 then
            if l_FFlagAvatarJointUpgradeInUA_0 then
                return v376.WorldCFrame;
            else
                return v375.CFrame * v376.CFrame;
            end;
        end;
    end;
    return nil;
end;
v80.getRecursiveAttachmentCFrame = function(v379) --[[ Line: 1510 ]] --[[ Name: getRecursiveAttachmentCFrame ]]
    local l_CFrame_0 = v379.CFrame;
    local l_Parent_0 = v379.Parent;
    while l_Parent_0 and l_Parent_0:IsA("Bone") do
        l_CFrame_0 = l_Parent_0.CFrame * l_CFrame_0;
        l_Parent_0 = l_Parent_0.Parent;
    end;
    return l_CFrame_0;
end;
v80.isLCCategory = function(v382) --[[ Line: 1525 ]] --[[ Name: isLCCategory ]]
    -- upvalues: v23 (copy)
    if v382 and v382.AssetTypeIdStrings then
        for _, v384 in v382.AssetTypeIdStrings do
            if v23.LayeredAssetTypes[v384] ~= nil then
                if v23.LayeredAssetTypes[v384] == Enum.AccessoryType.Hair then
                    return false;
                else
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;
v80.isShoeBundle = function(v385) --[[ Line: 1551 ]] --[[ Name: isShoeBundle ]]
    -- upvalues: v23 (copy)
    local v386 = true;
    if v385.bundleType ~= v23.BundleTypeIdStrings.Shoes then
        v386 = v385.bundleType == Enum.BundleType.Shoes.Name;
    end;
    return v386;
end;
v80.isBundleOrLCAsset = function(v387, v388) --[[ Line: 1563 ]] --[[ Name: isBundleOrLCAsset ]]
    -- upvalues: v23 (copy)
    local v389 = v387 == v23.ItemType.Bundle;
    return v387 == v23.ItemType.Asset and v23.LayeredAssetTypes[v388] ~= nil or v389;
end;
v80.isBoundingBoxVectorSane = function(v390) --[[ Line: 1575 ]] --[[ Name: isBoundingBoxVectorSane ]]
    local v391 = false;
    if v390.X <= 50000 then
        v391 = false;
        if v390.X >= -50000 then
            v391 = false;
            if v390.Y <= 50000 then
                v391 = false;
                if v390.Y >= -50000 then
                    v391 = false;
                    if v390.Z <= 50000 then
                        v391 = v390.Z >= -50000;
                    end;
                end;
            end;
        end;
    end;
    return v391;
end;
v80.isBoundingBoxCFrameSane = function(v392) --[[ Line: 1589 ]] --[[ Name: isBoundingBoxCFrameSane ]]
    -- upvalues: v80 (copy)
    return v80.isBoundingBoxVectorSane(v392.Position) and v80.isBoundingBoxVectorSane(v392.LookVector);
end;
v80.getAssetIdsWithGeometryFromHumanoidDescription = function(v393) --[[ Line: 1599 ]] --[[ Name: getAssetIdsWithGeometryFromHumanoidDescription ]]
    if v393 == nil then
        return {};
    else
        local v394 = {};
        for _, v396 in (v393:GetAccessories(true)) do
            if v396.AssetId then
                table.insert(v394, v396.AssetId);
            end;
        end;
        if v393.Torso then
            table.insert(v394, v393.Torso);
        end;
        if v393.RightLeg then
            table.insert(v394, v393.RightLeg);
        end;
        if v393.RightArm then
            table.insert(v394, v393.RightArm);
        end;
        if v393.LeftLeg then
            table.insert(v394, v393.LeftLeg);
        end;
        if v393.LeftArm then
            table.insert(v394, v393.LeftArm);
        end;
        if v393.Head then
            table.insert(v394, v393.Head);
        end;
        return v394;
    end;
end;
v80.calculateNewAssetIdsWithGeometry = function(v397, v398) --[[ Line: 1637 ]] --[[ Name: calculateNewAssetIdsWithGeometry ]]
    -- upvalues: v80 (copy), v10 (copy)
    if not v397 or not v398 then
        return {};
    else
        local v399 = v80.getAssetIdsWithGeometryFromHumanoidDescription(v397);
        local v400 = v80.getAssetIdsWithGeometryFromHumanoidDescription(v398);
        local v401 = v10.List.toSet(v399);
        return (v10.List.filter(v400, function(v402) --[[ Line: 1648 ]]
            -- upvalues: v401 (copy)
            return v401[v402] == nil;
        end));
    end;
end;
v80.getItemIconTypeFromOutfit = function(v403) --[[ Line: 1654 ]] --[[ Name: getItemIconTypeFromOutfit ]]
    -- upvalues: v23 (copy), l_ItemTileEnums_0 (copy)
    local v404 = v403.outfitType == v23.OutfitTypes.DynamicHead;
    local l_containsDynamicHead_0 = v403.containsDynamicHead;
    if v404 or l_containsDynamicHead_0 then
        return l_ItemTileEnums_0.ItemIconType.DynamicHead;
    else
        return nil;
    end;
end;
v80.getItemStatusStyleFromOutfit = function(v406) --[[ Line: 1665 ]] --[[ Name: getItemStatusStyleFromOutfit ]]
    -- upvalues: l_ItemTileEnums_0 (copy)
    local l_moderationStatus_0 = v406.moderationStatus;
    if l_moderationStatus_0 == Enum.ModerationStatus.ReviewedRejected then
        return l_ItemTileEnums_0.StatusStyle.AlertIcon;
    elseif l_moderationStatus_0 == Enum.ModerationStatus.NotReviewed then
        return l_ItemTileEnums_0.StatusStyle.PendingIcon;
    else
        return nil;
    end;
end;
v80.isModerationPendingOrRejected = function(v408) --[[ Line: 1676 ]] --[[ Name: isModerationPendingOrRejected ]]
    local v409 = true;
    if v408 ~= Enum.ModerationStatus.NotReviewed then
        v409 = v408 == Enum.ModerationStatus.ReviewedRejected;
    end;
    return v409;
end;
v80.getMessageTypeFromModerationStatus = function(v410) --[[ Line: 1681 ]] --[[ Name: getMessageTypeFromModerationStatus ]]
    if not v410 then
        return nil;
    elseif v410 == Enum.ModerationStatus.NotReviewed then
        return "UnavailableItems";
    elseif v410 == Enum.ModerationStatus.ReviewedRejected then
        return "ItemDidNotMeetRobloxCommunityStandards";
    else
        return nil;
    end;
end;
v80.getModerationStatusFromAvailabilityStatus = function(v411) --[[ Line: 1696 ]] --[[ Name: getModerationStatusFromAvailabilityStatus ]]
    -- upvalues: l_InventoryItemAvailability_0 (copy)
    if not v411 then
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
        })[v411];
    end;
end;
v80.assetTypeIdIsAnimationOrEmote = function(v412) --[[ Line: 1715 ]] --[[ Name: assetTypeIdIsAnimationOrEmote ]]
    -- upvalues: v23 (copy)
    if not v412 then
        return false;
    else
        return v23.AssetTypeIdToCategory[v412] == v23.AssetCategories.Animation;
    end;
end;
local v415 = l_memoize_0(function(v413) --[[ Line: 1725 ]]
    -- upvalues: v23 (copy)
    local v414 = v413 and v413[v23.AssetTypeIdStrings.MoodAnimation];
    return v414 and next(v414);
end);
v80.getEquippedMoodAssetId = function(v416) --[[ Line: 1732 ]] --[[ Name: getEquippedMoodAssetId ]]
    -- upvalues: v415 (copy)
    local l_EquippedAssets_0 = v416.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    return v415(l_EquippedAssets_0);
end;
v80.getAssetIdForPPEPose = function(v418) --[[ Line: 1737 ]] --[[ Name: getAssetIdForPPEPose ]]
    -- upvalues: v23 (copy), v80 (copy)
    local l_AvatarExperience_0 = v418.AvatarExperience;
    for _, v421 in v418.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
        if v421.itemType == v23.ItemType.Asset and v80.assetTypeIdIsAnimationOrEmote(v421.itemSubType) then
            return v421.itemId;
        end;
    end;
    if l_AvatarExperience_0.ProfilePictureEditor.ProfilePictureParams.emoteAssetId then
        return l_AvatarExperience_0.ProfilePictureEditor.ProfilePictureParams.emoteAssetId;
    else
        return nil;
    end;
end;
local v423 = l_memoize_0(function(v422) --[[ Line: 1758 ]]
    -- upvalues: v23 (copy)
    return v422 and v422[v23.AssetTypeIdStrings.Gear] and next(v422[v23.AssetTypeIdStrings.Gear]);
end);
v80.getEquippedToolId = function(v424) --[[ Line: 1765 ]] --[[ Name: getEquippedToolId ]]
    -- upvalues: v423 (copy)
    local l_EquippedAssets_1 = v424.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    return v423(l_EquippedAssets_1);
end;
v80.getNextPageCursorKey = function(v426, v427, v428) --[[ Line: 1774 ]] --[[ Name: getNextPageCursorKey ]]
    if v427 then
        return v426 .. (v428 or "");
    else
        return v426;
    end;
end;
v80.getPerformFetchKey = function(v429, v430, v431) --[[ Line: 1790 ]] --[[ Name: getPerformFetchKey ]]
    -- upvalues: v23 (copy)
    if v430 then
        return v23.OutfitsKey .. v429 .. (v431 or "");
    else
        return v23.UserInventoryKey .. v429;
    end;
end;
v80.getCurrentScreenIgnoreItemDetails = function(v432) --[[ Line: 1806 ]] --[[ Name: getCurrentScreenIgnoreItemDetails ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local l_name_2 = v432.current.name;
    local v434 = true;
    if l_name_2 ~= l_AvatarScreen_0.ItemDetails then
        v434 = true;
        if l_name_2 ~= l_AvatarScreen_0.LookDetails then
            v434 = l_name_2 == l_AvatarScreen_0.OutfitDetails;
        end;
    end;
    if v434 then
        l_name_2 = v432.opaque.name;
    end;
    return l_name_2;
end;
v80.getLargestPossibleOneLineTextSize = function(v435, v436, v437, v438) --[[ Line: 1825 ]] --[[ Name: getLargestPossibleOneLineTextSize ]]
    -- upvalues: l_TextService_0 (copy)
    v438 = v438 - 1;
    local v439 = Vector2.new(v438, 100000);
    while true do
        if v436 > 1 then
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v435, v436, v437.Font, v439);
            if l_l_TextService_0_TextSize_0.Y <= v436 + 1 then
                return Vector2.new(math.ceil(l_l_TextService_0_TextSize_0.X), (math.ceil(l_l_TextService_0_TextSize_0.Y))), v436;
            else
                v436 = v436 - 1;
            end;
        else
            return nil, nil;
        end;
    end;
end;
v80.selectSceneSize = function(v441) --[[ Line: 1861 ]] --[[ Name: selectSceneSize ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), l_getSafeAreaSize_0 (copy), v23 (copy)
    local l_GlobalGuiInset_0 = v441.GlobalGuiInset;
    local v443 = v441.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local l_ScreenSize_0 = v441.ScreenSize;
    local l_Offset_0 = l_getSafeAreaSize_0(l_ScreenSize_0, l_GlobalGuiInset_0).Y.Offset;
    local l_bottom_0 = l_GlobalGuiInset_0.bottom;
    local v447 = l_ScreenSize_0.Y - l_bottom_0;
    local v448 = l_Offset_0 * v23.PortraitSceneHeight;
    local v449 = v443 and v448 or v447;
    local v450 = l_ScreenSize_0.X * v23.LandscapeSceneWidth;
    return v449, v443 and l_ScreenSize_0.X or v450;
end;
v80.getColor3Difference = l_memoize_0(function(v451, v452) --[[ Line: 1881 ]]
    return (math.sqrt((v451.R - v452.R) * (v451.R - v452.R) + (v451.G - v452.G) * (v451.G - v452.G) + (v451.B - v452.B) * (v451.B - v452.B)));
end);
v80.bodyColorToBodyColor3 = l_memoize_0(function(v453) --[[ Line: 1885 ]]
    if v453 then
        return BrickColor.new(v453).Color;
    else
        return nil;
    end;
end);
v80.bodyPartForSkinColoringIdToBodyColorId = {
    headColor3 = "headColorId", 
    torsoColor3 = "torsoColorId", 
    rightArmColor3 = "rightArmColorId", 
    rightLegColor3 = "rightLegColorId", 
    leftArmColor3 = "leftArmColorId", 
    leftLegColor3 = "leftLegColorId"
};
v80.bodyColorIdToBodyPartForSkinColoringId = {};
for v454, v455 in pairs(v80.bodyPartForSkinColoringIdToBodyColorId) do
    v80.bodyColorIdToBodyPartForSkinColoringId[v455] = v454;
end;
v80.convertBodyColor3sToHexes = l_memoize_0(function(v456) --[[ Line: 1918 ]]
    local v457 = {};
    for v458, v459 in pairs(v456) do
        v457[v458] = v459:ToHex();
    end;
    return v457;
end);
v80.convertBodyColor3HexesToColor3s = l_memoize_0(function(v460) --[[ Line: 1936 ]]
    local v461 = {};
    for v462, v463 in pairs(v460) do
        v461[v462] = Color3.fromHex(v463);
    end;
    return v461;
end);
v80.isAvatarSceneButtonsVisible = function(v464, v465, v466, v467, v468) --[[ Line: 1945 ]] --[[ Name: isAvatarSceneButtonsVisible ]]
    -- upvalues: l_AvatarScreenProperties_0 (copy)
    local v469 = (l_AvatarScreenProperties_0[v464.opaque.name] or {}).refinementButtonVisible and not v466 and not v467;
    if v468 then
        return v469 and v468.state.key == v464.opaque.key;
    else
        return v469 and v465;
    end;
end;
v80.isUserCameraEligible = function() --[[ Line: 1968 ]] --[[ Name: isUserCameraEligible ]]
    -- upvalues: v10 (copy), l_Players_0 (copy), v55 (copy)
    local l_CameraDevices_0 = game:GetService("VideoCaptureService"):GetCameraDevices();
    local v471 = v10.isEmpty(l_CameraDevices_0);
    assert(l_Players_0 ~= nil, "Players should always be defined");
    return not (v471 or v55);
end;
v80.getUserId = function(v472) --[[ Line: 1977 ]] --[[ Name: getUserId ]]
    if v472.LocalUserId then
        return v472.LocalUserId;
    elseif v472.RobloxUser and v472.RobloxUser.rbxuid then
        return (tostring(v472.RobloxUser.rbxuid));
    else
        return nil;
    end;
end;
v80.isItemSelectable = function(v473) --[[ Line: 1989 ]] --[[ Name: isItemSelectable ]]
    if v473 == nil then
        return false;
    else
        local l_noPriceStatus_0 = v473.noPriceStatus;
        if l_noPriceStatus_0 == nil or l_noPriceStatus_0 == "Free" then
            return true;
        elseif l_noPriceStatus_0 == "Unavailable" then
            return false;
        elseif v473.quantityOwned > 0 then
            return true;
        else
            return false;
        end;
    end;
end;
v80.isTryingOnClassicFace = function(v475) --[[ Line: 2007 ]] --[[ Name: isTryingOnClassicFace ]]
    -- upvalues: v11 (copy), v23 (copy)
    return v11.some(v475, function(v476) --[[ Line: 2008 ]]
        -- upvalues: v23 (ref)
        local v477 = false;
        if v476.itemType == "Asset" then
            v477 = v476.itemSubType == v23.AssetTypeIdStrings.Face;
        end;
        return v477;
    end);
end;
v80.isTryingOnDynamicHead = function(v478) --[[ Line: 2013 ]] --[[ Name: isTryingOnDynamicHead ]]
    -- upvalues: v11 (copy), v23 (copy)
    return v11.some(v478, function(v479) --[[ Line: 2014 ]]
        -- upvalues: v23 (ref)
        local v480 = false;
        if v479.itemType == "Bundle" then
            v480 = v479.itemSubType == v23.BundleTypeIdStrings.DynamicHead;
        end;
        return v480;
    end);
end;
v80.getRecommendedAssetTypeIdStringFromCategoryInfo = l_memoize_0(function(v481) --[[ Line: 2024 ]]
    if v481.RecommendedAssetTypeIdString then
        return v481.RecommendedAssetTypeIdString;
    elseif v481.AssetTypeIdStrings and #v481.AssetTypeIdStrings == 1 then
        return v481.AssetTypeIdStrings[1];
    else
        return nil;
    end;
end);
v80.getRecommendedKey = l_memoize_0(function(v482) --[[ Line: 2038 ]]
    -- upvalues: v24 (copy), v80 (copy), v7 (copy), v23 (copy), v62 (copy)
    if v482.RecommendationsType == v24.RecommendationsType.Asset then
        local v483 = v80.getRecommendedAssetTypeIdStringFromCategoryInfo(v482);
        if not v483 then
            v7("called getRecommendedKey with a category with no assetTypeIdString");
            return v23.AssetTypeIdStrings.Hat;
        else
            return v483;
        end;
    elseif v482.RecommendationsType == v24.RecommendationsType.BodyParts then
        return v24.RecommendationsType.BodyParts;
    elseif v482.RecommendationsType == v24.RecommendationsType.AvatarAnimations then
        return v24.RecommendationsType.AvatarAnimations;
    elseif v482.RecommendationsType == v24.RecommendationsType.Shoes then
        return v24.RecommendationsType.Shoes;
    elseif v482.RecommendationsType == v24.RecommendationsType.DynamicHeads then
        return v24.RecommendationsType.DynamicHeads;
    elseif v62() and v482.RecommendationsType == v24.RecommendationsType.All then
        return v24.RecommendationsType.All;
    else
        return v24.RecommendationsType.None;
    end;
end);
v80.getCategoryInfoByName = l_memoize_0(function(v484, v485, v486) --[[ Line: 2071 ]]
    -- upvalues: v80 (copy)
    local v487 = nil;
    local v488 = nil;
    for v489, v490 in v484 do
        if v490.Name == v485 then
            v487 = v489;
            if v486 and v490.Subcategories then
                for v491, v492 in v490.Subcategories do
                    if v492.Name == v486 then
                        v488 = v491;
                        break;
                    end;
                end;
                assert(v488 ~= nil, "Could not find subcategory with name " .. v486);
                break;
            else
                break;
            end;
        end;
    end;
    assert(v487 ~= nil, "Could not find category with name  " .. v485);
    return (v80.getCategoryInfo(v484, v487, v488));
end);
v80.getAssetIdFromContent = l_memoize_0(function(v493) --[[ Line: 2097 ]]
    if v493 == nil then
        return nil;
    else
        assert(v493, "contentId is not nil: silences type checker");
        local v494 = string.match(v493, ".*?id=([0-9]+)");
        if v494 then
            return v494;
        else
            return string.match(v493, "rbxassetid://([0-9]+)");
        end;
    end;
end);
v80.sortOutfitTryOnItemsByRecency = l_memoize_0(function(v495, v496) --[[ Line: 2112 ]]
    local v497 = {};
    for _, v499 in v495 do
        table.insert(v497, v499);
    end;
    table.sort(v497, function(v500, v501) --[[ Line: 2119 ]]
        -- upvalues: v496 (copy)
        if v500.itemRecency and v501.itemRecency then
            if v496 then
                return v500.itemRecency > v501.itemRecency;
            else
                return v500.itemRecency < v501.itemRecency;
            end;
        else
            return false;
        end;
    end);
    return v497;
end);
v80.fuzzyEq = function(v502, v503, v504) --[[ Line: 2134 ]]
    return (v504 or 0.001) > math.abs(v502 - v503);
end;
v80.getCreatorNameTileFooterEnabled = function(v505) --[[ Line: 2139 ]]
    return v505 and v505.customizedDataMap and v505.customizedDataMap.creatorNameTileFooterEnabled == "true";
end;
v80.translateString = function(v506, v507) --[[ Line: 2153 ]] --[[ Name: translateString ]]
    -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy), v7 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v509 = l_Localization_0.new(l_RobloxLocaleId_0);
    v509:SetLocale(l_RobloxLocaleId_0);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 2158 ]]
        -- upvalues: v509 (copy), v506 (copy), v507 (copy)
        return v509:Format(v506, v507);
    end);
    if l_status_0 then
        return l_result_0;
    else
        v7("Failed to translate string with key: " .. v506);
        return "";
    end;
end;
v80.resolveEditorCategory = function(v512) --[[ Line: 2176 ]] --[[ Name: resolveEditorCategory ]]
    -- upvalues: v22 (copy)
    for _, v514 in (v22()) do
        if v514.Id == v512 then
            return v514.Category, nil;
        elseif v514.Subcategories then
            for _, v516 in v514.Subcategories do
                if v516.Id == v512 then
                    return v514.Category, v516.Subcategory;
                end;
            end;
        end;
    end;
    return nil, nil;
end;
return v80;