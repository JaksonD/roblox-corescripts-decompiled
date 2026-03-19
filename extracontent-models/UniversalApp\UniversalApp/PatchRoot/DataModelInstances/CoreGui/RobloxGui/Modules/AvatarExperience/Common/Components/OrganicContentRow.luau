local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit);
local l_WidgetHeader_0 = v8.WidgetComponents.WidgetHeader;
local l_WidgetLayout_0 = v8.WidgetComponents.WidgetLayout;
local l_WidgetListItem_0 = v8.WidgetComponents.WidgetListItem;
local l_Grid_0 = v8.GridComponents.Grid;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local v14 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogItemCardFooterBackendDriven_0 = v14.FFlagAXCatalogItemCardFooterBackendDriven;
local l_FFlagAXCatalogCategoriesStoreImprovePerf_0 = v14.FFlagAXCatalogCategoriesStoreImprovePerf;
local v17 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v18 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v19 = require(l_Modules_0.LuaApp.Constants);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCardContainer);
local l_getFooterVisibilityFromItemFooters_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Utils.getFooterVisibilityFromItemFooters;
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useCatalogCategoryImpressionsInfo);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local v25 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency);
local v26 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
return (v2.forwardRef(function(v28, v29) --[[ Line: 106 ]]
    -- upvalues: v3 (copy), l_useNavigation_0 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), l_useDispatch_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v19 (copy), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy), v23 (copy), v20 (copy), v26 (copy), v17 (copy), v25 (copy), v2 (copy), v24 (copy), v18 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (copy), l_getFooterVisibilityFromItemFooters_0 (copy), l_useTokens_0 (copy), v21 (copy), l_Grid_0 (copy), l_WidgetListItem_0 (copy), l_WidgetLayout_0 (copy), l_WidgetHeader_0 (copy)
    local v30 = v3.useRefCache();
    local v31 = l_useNavigation_0();
    local v33 = l_useSelector_0(function(v32) --[[ Line: 109 ]]
        -- upvalues: v28 (copy)
        return v32.Search.SearchesInCatalog[v28.searchUuid];
    end, l_getUseSelectorDeepEquals_0());
    local v34 = l_useDispatch_0();
    local v35 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.useFocusController();
    local l_entryRowIndex_0 = v28.entryRowIndex;
    local v38 = l_useSelector_0(function(v37) --[[ Line: 117 ]]
        return v37.AvatarExperience.Common.Widgets.HydratedWidgetData.Look;
    end, l_getUseSelectorDeepEquals_0());
    local l_row_0 = v28.row;
    local l_itemsPerRow_0 = v28.itemsPerRow;
    local l_key_0 = v31.state.key;
    local v42 = v19.ImpressionsEvents.AvatarItems .. if l_key_0 then string.gsub(l_key_0, "[-{}]", "") else "";
    local v43 = v33 and v33.keyword;
    local v44 = nil;
    local v45 = nil;
    local v46 = nil;
    local v47 = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v23(v28.fromSearch, v28.selectedCategory, v28.selectedSubcategory, v28.selectedCategoryInfo) else v23(v28.fromSearch);
    v44 = v47.impressionsCategory;
    v45 = v47.impressionsSubcategory;
    v46 = v47.impressionsTaxonomyId;
    local l_Catalog_0 = v20.AnalyticsContext.Catalog;
    if v28.fromSearch then
        l_Catalog_0 = v20.AnalyticsContext.CatalogSearch;
    end;
    local v49 = if v26.isEnabled() then v17.readTestVariable(v26.EnabledForUser) else nil;
    local v51 = if v25() then v2.useCallback(function(v50) --[[ Line: 153 ]]
        -- upvalues: v49 (copy), v28 (copy), v34 (copy), v24 (ref)
        if v50 then
            if v49 and v28.onThumbnailLoaded then
                v28.onThumbnailLoaded(v28.searchUuid, v50);
                return;
            else
                v34(v24.AppendThumbnail(v28.searchUuid, v50));
            end;
        end;
    end, {
        v28.searchUuid, 
        if v49 then v28.onThumbnailLoaded else nil
    }) else nil;
    local v52 = v18.getCreatorNameTileFooterEnabled(v28.widgetConfiguration);
    local v53 = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then l_getFooterVisibilityFromItemFooters_0(if v28.template then v28.template.itemFooters else nil) else nil;
    local v54 = nil;
    local v55 = l_useTokens_0();
    local v57 = v2.useCallback(function(v56) --[[ Line: 177 ]]
        -- upvalues: v28 (copy)
        if v28.gamepadNavigationFocusPos:getValue().Y ~= v28.entryRowIndex then
            return;
        else
            v28.setGamepadNavigationFocusPos(Vector2.new(v56, v28.entryRowIndex));
            if v28.onFocusGained then
                v28.onFocusGained();
            end;
            return;
        end;
    end, {
        v28.gamepadNavigationFocusPos, 
        v28.setGamepadNavigationFocusPos, 
        v28.entryRowIndex, 
        v28.onFocusGained
    });
    local v61 = v2.useCallback(function(v58) --[[ Line: 194 ]]
        -- upvalues: v2 (ref), v3 (ref), v30 (copy), l_itemsPerRow_0 (copy), v57 (copy), v21 (ref), l_Catalog_0 (ref), v20 (ref), l_entryRowIndex_0 (copy), v28 (copy), v42 (copy), v43 (copy), v44 (ref), v45 (ref), v46 (ref), v52 (copy), v51 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v53 (copy), v38 (copy)
        local l_index_0 = v58.index;
        local l_item_0 = v58.item;
        return v2.createElement(v3.Focusable.Frame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            ref = v30[l_index_0], 
            NextSelectionRight = if l_index_0 < l_itemsPerRow_0 then v30[l_index_0 + 1] else nil, 
            NextSelectionLeft = if l_index_0 > 1 then v30[l_index_0 - 1] else nil, 
            onFocusGained = function() --[[ Line: 205 ]] --[[ Name: onFocusGained ]]
                -- upvalues: v57 (ref), l_index_0 (copy)
                v57(l_index_0);
            end
        }, {
            CatalogItemCard = v2.createElement(v21, {
                analyticsContext = l_Catalog_0, 
                analyticsItemCountPerPage = v20.PageFetchLimit, 
                index = (l_entryRowIndex_0 - 1) * l_itemsPerRow_0 + l_index_0, 
                itemType = l_item_0.type, 
                itemId = l_item_0.id, 
                adTrackingData = l_item_0.encryptedAdTrackingData, 
                isSponsoredItem = false, 
                cardStyle = v28.cardStyle, 
                itemDetailsPeekViewRefs = v28.itemDetailsPeekViewRefs, 
                resultsListRef = v28.gridRef, 
                impressionsTag = v42, 
                impressionsSchema = "defaultItem", 
                impressionsGroup = nil, 
                impressionsSearch = v43, 
                impressionsCategory = v44, 
                impressionsSubcategory = v45, 
                impressionsTaxonomyId = v46, 
                impressionsId = l_item_0.id, 
                gridInformation = {
                    gridPositionRow = v28.catalogRowIndex, 
                    gridPositionColumn = l_index_0
                }, 
                thumbailAspectRatio = v28.thumbnailAspectRatio, 
                thumbnailScaleType = v28.thumbnailScaleType, 
                thumbnailSize = l_item_0.type == "Look" and "w=300&h=450" or v28.thumbnailSize, 
                creatorNameTileFooterEnabled = v52, 
                onThumbnailLoaded = v51, 
                isCreatorNameVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v53.isCreatorNameVisible else nil, 
                isTitleVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v53.isTitleVisible else nil, 
                isPriceVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v53.isPriceVisible else nil, 
                lookData = if l_item_0.type == "Look" then v38[tostring(l_item_0.id)] else nil, 
                isOrganic = true
            })
        });
    end, {
        l_itemsPerRow_0, 
        v57, 
        l_Catalog_0, 
        l_entryRowIndex_0, 
        v28.cardStyle, 
        v28.itemDetailsPeekViewRefs, 
        v28.gridRef, 
        v42, 
        v43, 
        v44, 
        v45, 
        "defaultItem", 
        nil, 
        v28.thumbnailAspectRatio, 
        v28.thumbnailScaleType, 
        v28.thumbnailSize, 
        v52, 
        v51, 
        v38
    });
    v54 = v2.createElement(l_Grid_0, {
        itemsPerRow = l_itemsPerRow_0, 
        getItemId = function(v62) --[[ Line: 277 ]] --[[ Name: getItemId ]]
            return v62.id;
        end, 
        gapHorizontal = v55.Gap.Medium, 
        gapVertical = v55.Gap.Large, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        items = l_row_0, 
        renderItem = v61
    });
    return v2.createElement(l_WidgetListItem_0, {
        ref = v29, 
        NextSelectionUp = v28.NextSelectionUp, 
        NextSelectionDown = v28.NextSelectionDown, 
        NextSelectionRight = v28.NextSelectionRight, 
        onFocusGained = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else function() --[[ Line: 294 ]]
            -- upvalues: v28 (copy), v30 (copy), l_row_0 (copy), v35 (copy)
            v28.setGamepadNavigationFocusPos(Vector2.new(v28.gamepadNavigationFocusPos:getValue().X, v28.entryRowIndex));
            local v63 = v30[math.min(v28.gamepadNavigationFocusPos:getValue().X, #l_row_0)];
            v35.moveFocusTo(v63);
        end, 
        padding = v28.padding, 
        horizontalMargin = 0
    }, {
        Widget = v2.createElement(l_WidgetLayout_0, {
            headerSlot = if not not v28.descriptionKey or v28.titleKey then v2.createElement(l_WidgetHeader_0, {
                descriptionText = v28.descriptionText, 
                descriptionKey = v28.descriptionKey, 
                titleKey = v28.titleKey, 
                titleText = v28.titleText, 
                LayoutOrder = 1
            }) else nil, 
            contentSlot = v54
        })
    });
end));