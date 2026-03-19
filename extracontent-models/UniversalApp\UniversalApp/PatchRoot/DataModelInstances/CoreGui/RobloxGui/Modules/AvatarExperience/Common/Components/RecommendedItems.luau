local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.t);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local v9 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactFitComponents_0 = v9.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_Button_0 = v8.App.Button.Button;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local l_withStyle_0 = v8.Style.withStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v18 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v19 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v21 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit);
local l_WidgetHeader_0 = v21.WidgetComponents.WidgetHeader;
local l_WidgetLayout_0 = v21.WidgetComponents.WidgetLayout;
local v24 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v24.Enums.AvatarScreen;
local l_AvatarRoute_0 = v24.AvatarRoute.AvatarRoute;
local v27 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetRecommendedItems);
local v30 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v32 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v33 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local l_ScrollingAppCarousel_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).ScrollingAppCarousel;
local v35 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.RecommendedItemCard);
local v36 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v37 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SetCategoryAndSubcategory);
local v38 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v39 = require(l_Modules_0.AvatarExperience.Common.ReducerUtils);
local v40 = require(l_Modules_0.AvatarExperience.Experiments.AXEditorRecommendationCarousel);
local v41 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v43 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXRemoveCatalogCategoryNavKey_0 = v43.FFlagAXRemoveCatalogCategoryNavKey;
local v45 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXCatalogCategoriesSDUI_0 = v43.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXLogNilCategoryAndSubcategorySelection_0 = v43.FFlagAXLogNilCategoryAndSubcategorySelection;
local v48 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v49 = require(l_Modules_0.LuaApp.mutedError);
local v50 = game:DefineFastFlag("AXYouMayAlsoLikeExposureLogging", false);
local v51 = game:DefineFastFlag("AXHideEmptyRecommendations", false);
local l_FFlagAXRootSlotBasedEditorFlag_0 = v43.FFlagAXRootSlotBasedEditorFlag;
local v53 = {
    TILE_WIDTH = 100, 
    TILE_HEIGHT = 180, 
    CAROUSEL_POSITION = {
        leftPosition = 28, 
        rightPosition = 15
    }, 
    CAROUSEL_HEIGHT = 240, 
    CAROUSEL_ITEM_PADDING = 10, 
    WIDGET_LAYOUT_PADDING = 20
};
local v54 = v2.PureComponent:extend("RecommendedItems");
v54.validateProps = v4.strictInterface({
    categoryInfo = v4.table, 
    LayoutOrder = v4.optional(v4.number), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    baseRef = v4.optional(v4.table), 
    listFrameRef = v4.optional(v4.table), 
    itemDetailsPeekViewRefs = v4.table, 
    sendShopForMoreAnalytics = v4.callback, 
    screenSize = v4.Vector2, 
    itemType = v4.string, 
    dataStatus = v4.string, 
    items = v4.table, 
    setCatalogIndicies = v4.callback, 
    getRecommendedItems = v4.callback, 
    navigateWithLock = v4.callback, 
    navigation = v4.table, 
    avatarRoute = l_AvatarRoute_0.Interface, 
    catalogAnalytics = v4.table, 
    networking = v4.callback, 
    doesMatchingCatalogCategoryExist = if l_FFlagAXCatalogCategoriesSDUI_0 then v4.optional(v4.boolean) else nil
});
v54.init = function(v55) --[[ Line: 131 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_AvatarScreen_0 (copy), v45 (copy), v20 (copy), v19 (copy)
    v55.loadableGridViewRef = v2.createRef();
    v55.shopMoreRef = v2.createRef();
    v55.onActivated = function() --[[ Line: 134 ]]
        -- upvalues: v55 (copy), l_AvatarScreen_0 (ref)
        local l_catalogAnalytics_0 = v55.props.catalogAnalytics;
        local l_categoryInfo_0 = v55.props.categoryInfo;
        v55.props.setCatalogIndicies(l_categoryInfo_0, l_catalogAnalytics_0);
        local function v58() --[[ Line: 140 ]]
            -- upvalues: v55 (ref), l_AvatarScreen_0 (ref)
            v55.props.navigation.navigate(l_AvatarScreen_0.Catalog);
            v55.props.sendShopForMoreAnalytics();
        end;
        v55.props.navigateWithLock(v58);
    end;
    v55.getRecommendedItems = function() --[[ Line: 147 ]]
        -- upvalues: v45 (ref), v55 (copy), v20 (ref), v19 (ref)
        if v45() and not v55.props.categoryInfo.RecommendationsType or v55.props.categoryInfo.RecommendationsType == v20.RecommendationsType.None then
            return;
        else
            local l_networking_0 = v55.props.networking;
            local v60 = v19.getRecommendedAssetTypeIdStringFromCategoryInfo(v55.props.categoryInfo);
            v55.props.getRecommendedItems(l_networking_0, v60, v55.props.categoryInfo.RecommendationsType, true);
            return;
        end;
    end;
end;
v54.maybeFetchRecommendedItems = function(v61) --[[ Line: 163 ]] --[[ Name: maybeFetchRecommendedItems ]]
    -- upvalues: v32 (copy)
    if v61.props.dataStatus ~= v32.Fetching then
        v61.getRecommendedItems();
    end;
end;
v54.didMount = function(v62) --[[ Line: 170 ]] --[[ Name: didMount ]]
    -- upvalues: v50 (copy), v38 (copy), v40 (copy)
    v62:maybeFetchRecommendedItems();
    if v50 then
        v38.logExperimentExposure(v40);
    end;
end;
v54.didUpdate = function(v63, v64) --[[ Line: 178 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy), v19 (copy)
    if v63.props.avatarRoute.current.name == l_AvatarScreen_0.AvatarEditor and v19.getRecommendedKey(v64.categoryInfo) ~= v19.getRecommendedKey(v63.props.categoryInfo) then
        v63:maybeFetchRecommendedItems();
    end;
end;
v54.renderWithProviders = function(v65, v66, v67) --[[ Line: 189 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy), v36 (copy), v19 (copy), v2 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Button_0 (copy), l_Focusable_0 (copy), l_ButtonType_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v41 (copy), v35 (copy), l_FitFrameVertical_0 (copy), l_RoactFitComponents_0 (copy), v51 (copy), v33 (copy)
    local l_items_0 = v65.props.items;
    local l_itemType_0 = v65.props.itemType;
    local l_key_0 = v65.props.avatarRoute.current.key;
    local v71 = #l_items_0 == 0;
    local l_LayoutOrder_0 = v65.props.LayoutOrder;
    local l_screenSize_0 = v65.props.screenSize;
    local l_Font_0 = v66.Font;
    local l_Theme_0 = v66.Theme;
    local v76 = if l_FFlagAXRootSlotBasedEditorFlag_0 then l_Font_0.HeadingSmall.Font else l_Font_0.Header2.Font;
    local v77 = l_Font_0.BaseSize * if l_FFlagAXRootSlotBasedEditorFlag_0 then l_Font_0.HeadingSmall.RelativeSize else l_Font_0.Header2.RelativeSize;
    local v78 = if l_FFlagAXRootSlotBasedEditorFlag_0 then v36.ItemTileType.AvatarEditorTile else v36.ItemTileType.CatalogItemTile;
    local v79 = v19.GridItemHeightGetter(v78, if l_FFlagAXRootSlotBasedEditorFlag_0 then v77 + v66.Tokens.Global.Space_150 else v77);
    local v80 = v2.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_Button_0 else l_Focusable_0[l_Button_0], {
        buttonType = l_ButtonType_0.Secondary, 
        layoutOrder = 3, 
        size = UDim2.new(1, 0, 0, 48), 
        text = v67.shopForMore, 
        onActivated = v65.onActivated, 
        [v2.Ref] = v65.shopMoreRef, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v71 and v65.props.NextSelectionUp or v65.loadableGridViewRef
    });
    local v81 = if l_FFlagAXCatalogCategoriesSDUI_0 then v65.props.doesMatchingCatalogCategoryExist else nil;
    local v88 = v41() and function(v82, v83, v84) --[[ Line: 231 ]]
        -- upvalues: v2 (ref), v35 (ref), v65 (copy)
        return v2.createElement(v35, {
            itemId = v82.itemId, 
            index = v83, 
            itemType = v82.itemType, 
            getRecommendedItems = v65.getRecommendedItems, 
            itemDetailsPeekViewRefs = v65.props.itemDetailsPeekViewRefs, 
            resultsListRef = v65.props.listFrameRef, 
            gridInformation = if v84 then {
                gridPositionRow = v84.row, 
                gridPositionColumn = v84.column
            } else nil
        });
    end or function(v85, v86, v87) --[[ Line: 247 ]]
        -- upvalues: v2 (ref), v35 (ref), l_itemType_0 (copy), v65 (copy)
        return v2.createElement(v35, {
            itemId = v85, 
            index = v86, 
            itemType = l_itemType_0, 
            getRecommendedItems = v65.getRecommendedItems, 
            itemDetailsPeekViewRefs = v65.props.itemDetailsPeekViewRefs, 
            resultsListRef = v65.props.listFrameRef, 
            gridInformation = if v87 then {
                gridPositionRow = v87.row, 
                gridPositionColumn = v87.column
            } else nil
        });
    end;
    local l_NumRecommendedItems_0 = v36.NumRecommendedItems;
    return v2.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_FitFrameVertical_0 else l_Focusable_0[l_FitFrameVertical_0], {
        width = UDim.new(1, 0), 
        contentPadding = UDim.new(0, 10), 
        margin = if l_FFlagAXRootSlotBasedEditorFlag_0 then l_RoactFitComponents_0.Rect.quad(24, 0, 15, 0) else l_RoactFitComponents_0.Rect.quad(24, 15, 15, 15), 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        BackgroundTransparency = l_Theme_0.BackgroundUIContrast.Transparency, 
        BackgroundColor3 = l_Theme_0.BackgroundUIContrast.Color, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0, 
        restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v71 and v65.shopMoreRef or v65.loadableGridViewRef, 
        [v2.Ref] = v65.props.baseRef
    }, {
        YouMayAlsoLikeTextLabel = if v51 and v71 then nil else v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            Font = v76, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            Text = v67.youMayAlsoLike, 
            TextSize = v77, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            LayoutOrder = 1
        }), 
        GridView = if v51 and v71 then nil else v2.createElement(v33, {
            LayoutOrder = 2, 
            items = l_items_0, 
            totalNumItems = l_NumRecommendedItems_0, 
            getItemHeight = v79, 
            windowHeight = l_screenSize_0.Y, 
            renderItem = v88, 
            [v2.Ref] = v65.loadableGridViewRef, 
            NextSelectionUp = v65.props.NextSelectionUp, 
            NextSelectionDown = v65.shopMoreRef, 
            NextSelectionRight = l_key_0 and v65.props.itemDetailsPeekViewRefs[l_key_0]
        }), 
        ShopForMoreButton = if not l_FFlagAXCatalogCategoriesSDUI_0 or v81 then v80 else nil
    });
end;
v54.renderCarouselWithProviders = function(v90, _, v92) --[[ Line: 325 ]] --[[ Name: renderCarouselWithProviders ]]
    -- upvalues: v41 (copy), v2 (copy), v35 (copy), v53 (copy), v51 (copy), l_WidgetHeader_0 (copy), l_ScrollingAppCarousel_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_WidgetLayout_0 (copy)
    local l_items_1 = v90.props.items;
    local l_itemType_1 = v90.props.itemType;
    local v95 = #l_items_1 == 0;
    local v100 = v41() and function(v96, v97) --[[ Line: 331 ]]
        -- upvalues: v2 (ref), v35 (ref), v90 (copy)
        return v2.createElement(v35, {
            itemId = v96.itemId, 
            index = v97, 
            itemType = v96.itemType, 
            getRecommendedItems = v90.getRecommendedItems, 
            itemDetailsPeekViewRefs = v90.props.itemDetailsPeekViewRefs, 
            resultsListRef = v90.props.listFrameRef
        });
    end or function(v98, v99) --[[ Line: 341 ]]
        -- upvalues: v2 (ref), v35 (ref), l_itemType_1 (copy), v90 (copy)
        return v2.createElement(v35, {
            itemId = v98, 
            index = v99, 
            itemType = l_itemType_1, 
            getRecommendedItems = v90.getRecommendedItems, 
            itemDetailsPeekViewRefs = v90.props.itemDetailsPeekViewRefs, 
            resultsListRef = v90.props.listFrameRef
        });
    end;
    local v101 = {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v53.CAROUSEL_ITEM_PADDING), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    for v102 = 1, #l_items_1 do
        local v103 = l_items_1[v102];
        table.insert(v101, v2.createElement("Frame", {
            LayoutOrder = v102, 
            Size = UDim2.new(0, v53.TILE_WIDTH, 0, v53.TILE_HEIGHT), 
            BackgroundTransparency = 1
        }, v100(v103, v102)));
    end;
    local v104 = if v51 and v95 then nil else v2.createElement(l_WidgetHeader_0, {
        LayoutOrder = 1, 
        titleText = v92.youMayAlsoLike
    });
    local v105 = {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        })
    };
    if not v51 or not v95 then
        v105.carousel = v2.createElement(l_ScrollingAppCarousel_0, {
            items = v101, 
            index = 1, 
            styleProps = v53.CAROUSEL_POSITION, 
            itemCount = #v101, 
            itemWidth = v53.TILE_WIDTH, 
            itemPadding = v53.CAROUSEL_ITEM_PADDING, 
            carouselMargin = 0, 
            carouselHeight = v53.CAROUSEL_HEIGHT, 
            canvasWidth = (v53.TILE_WIDTH + v53.CAROUSEL_ITEM_PADDING) * #v101 - v53.CAROUSEL_ITEM_PADDING, 
            onChangeCanvasPosition = function() --[[ Line: 399 ]] --[[ Name: onChangeCanvasPosition ]]

            end
        });
    end;
    v105.shopMore = v2.createElement(l_Button_0, {
        layoutOrder = 3, 
        buttonType = l_ButtonType_0.Secondary, 
        size = UDim2.new(1, 0, 0, 48), 
        text = v92.shopForMore, 
        onActivated = v90.onActivated, 
        [v2.Ref] = v90.shopMoreRef, 
        NextSelectionUp = v95 and v90.props.NextSelectionUp or v90.loadableGridViewRef
    });
    return v2.createElement(l_WidgetLayout_0, {
        LayoutOrder = v90.props.LayoutOrder, 
        padding = {
            left = UDim.new(0, v53.WIDGET_LAYOUT_PADDING), 
            right = UDim.new(0, v53.WIDGET_LAYOUT_PADDING)
        }, 
        headerSlot = v104, 
        contentSlot = v105
    });
end;
v54.render = function(v106) --[[ Line: 424 ]] --[[ Name: render ]]
    -- upvalues: v40 (copy), v38 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy)
    local v107 = if v40.isEnabled() then v38.readTestVariable(v40.EnableAvatarEditorRecommendationCarousel) else nil;
    return l_withStyle_0(function(v108) --[[ Line: 429 ]]
        -- upvalues: l_withLocalization_0 (ref), v107 (copy), v106 (copy)
        return l_withLocalization_0({
            shopForMore = "Feature.Avatar.Action.ShopForMore", 
            youMayAlsoLike = "Feature.Catalog.Label.Recommendations"
        })(function(v109) --[[ Line: 433 ]]
            -- upvalues: v107 (ref), v106 (ref), v108 (copy)
            if v107 then
                return v106:renderCarouselWithProviders(v108, v109);
            else
                return v106:renderWithProviders(v108, v109);
            end;
        end);
    end);
end;
v54 = l_RoactServices_0.connect({
    catalogAnalytics = v27, 
    networking = v18
})(v54);
local function v115(v110, v111) --[[ Line: 448 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v19 (copy), v20 (copy), v36 (copy), v41 (copy), v39 (copy), l_PerformFetch_0 (copy)
    local v112 = v19.getRecommendedKey(v111.categoryInfo);
    local v113 = if not (v112 ~= v20.RecommendationsType.BodyParts and v112 ~= v20.RecommendationsType.AvatarAnimations and v112 ~= v20.RecommendationsType.Shoes) or v112 == v20.RecommendationsType.DynamicHeads then v36.ItemType.Bundle else v36.ItemType.Asset;
    if v41() then
        v112 = v39.generateRecommendedItemsKey(v112, v111.categoryInfo.RecommendationsType);
    end;
    local v114 = v110.AvatarExperience.AvatarEditor.RecommendedItems[v112] or {};
    return {
        dataStatus = l_PerformFetch_0.GetStatus(v110, v36.RecommendedItemsKey .. tostring(v112)), 
        screenSize = v110.ScreenSize, 
        itemType = v113, 
        items = v114
    };
end;
local function v131(v116) --[[ Line: 472 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v29 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXLogNilCategoryAndSubcategorySelection_0 (copy), v49 (copy), v37 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), v19 (copy), v30 (copy)
    return {
        getRecommendedItems = function(v117, v118, v119) --[[ Line: 474 ]] --[[ Name: getRecommendedItems ]]
            -- upvalues: v116 (copy), v29 (ref)
            v116(v29(v117, v118, v119));
        end, 
        setCatalogIndicies = function(v120, v121) --[[ Line: 477 ]] --[[ Name: setCatalogIndicies ]]
            -- upvalues: l_FFlagAXCatalogCategoriesSDUI_0 (ref), l_FFlagAXLogNilCategoryAndSubcategorySelection_0 (ref), v49 (ref), v116 (copy), v37 (ref), l_FFlagAXRemoveCatalogCategoryNavKey_0 (ref), v19 (ref)
            if l_FFlagAXCatalogCategoriesSDUI_0 then
                local l_CategoryId_0 = v120.MatchingCatalogPageIds.CategoryId;
                local l_SubcategoryId_0 = v120.MatchingCatalogPageIds.SubcategoryId;
                if l_FFlagAXLogNilCategoryAndSubcategorySelection_0 then
                    v49("Navigating to missing catalog category for", v120.Name);
                end;
                v116(v37(l_CategoryId_0, l_SubcategoryId_0, v121));
                return;
            else
                local l_CategoryKey_0 = v120.MatchingCatalogPage.CategoryKey;
                local l_SubcategoryKey_0 = v120.MatchingCatalogPage.SubcategoryKey;
                if l_FFlagAXRemoveCatalogCategoryNavKey_0 then
                    local v126 = l_CategoryKey_0:rawValue();
                    local v127 = if l_SubcategoryKey_0 then l_SubcategoryKey_0:rawValue() else nil;
                    if l_FFlagAXLogNilCategoryAndSubcategorySelection_0 then
                        v49("Navigating to missing catalog category for", v120.Name);
                    end;
                    v116(v37(v126, v127, v121));
                    return;
                else
                    local v128, v129 = v19.GetCategoryIdsFromNavKey(l_CategoryKey_0, l_SubcategoryKey_0);
                    if l_FFlagAXLogNilCategoryAndSubcategorySelection_0 then
                        v49("Navigating to missing catalog category for", v120.Name);
                    end;
                    v116(v37(v128, v129, v121));
                    return;
                end;
            end;
        end, 
        navigateWithLock = function(v130) --[[ Line: 505 ]] --[[ Name: navigateWithLock ]]
            -- upvalues: v116 (copy), v30 (ref)
            v116(v30(v130));
        end
    };
end;
v54 = v28((l_withNavigation_0(v54)));
if l_FFlagAXCatalogCategoriesSDUI_0 then
    v54 = v6.connect(v115, v131)(v54);
    return function(v132) --[[ Line: 517 ]] --[[ Name: RecommendedItemsWrapper ]]
        -- upvalues: v48 (copy), v3 (copy), v54 (ref)
        local v133 = v48.getCatalogCategoriesStore();
        local v134 = v132.categoryInfo and v132.categoryInfo.MatchingCatalogPageIds;
        local v135 = v134 and v134.CategoryId;
        local v136 = v134 and v134.SubcategoryId;
        local l_useDoesCatalogCategoryExist_0 = v48.useDoesCatalogCategoryExist;
        assert(l_useDoesCatalogCategoryExist_0, "useDoesCatalogCategoryExist should be defined when FFlagAXCatalogCategoriesSDUI is enabled");
        local v138 = l_useDoesCatalogCategoryExist_0(v133, v135, v136);
        local v139 = table.clone(v132);
        v139.doesMatchingCatalogCategoryExist = v138;
        return v3.createElement(v54, v139);
    end;
else
    return v6.connect(v115, v131)(v54);
end;