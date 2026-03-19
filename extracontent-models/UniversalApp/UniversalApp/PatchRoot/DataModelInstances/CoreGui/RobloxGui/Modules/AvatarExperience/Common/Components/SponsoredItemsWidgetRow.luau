local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_OpenInfoPeekView_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryRouting).OpenInfoPeekView;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local l_getFooterVisibilityFromItemFooters_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Utils.getFooterVisibilityFromItemFooters;
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useCatalogCategoryImpressionsInfo);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.SponsoredItems);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCardContainer);
local v19 = require(l_Modules_0.LuaApp.Constants);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectSponsoredItems);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v23 = game:DefineFastFlag("AXFixSponsoredItemsWidgetRowFooters", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
return (v2.forwardRef(function(v25, v26) --[[ Line: 45 ]]
    -- upvalues: v23 (copy), l_getFooterVisibilityFromItemFooters_0 (copy), l_useTokens_0 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), l_useNavigation_0 (copy), v19 (copy), v20 (copy), v21 (copy), v2 (copy), v4 (copy), v5 (copy), l_useDispatch_0 (copy), l_AvatarScreen_0 (copy), l_IsVRAppBuild_0 (copy), l_OpenInfoPeekView_0 (copy), v16 (copy), v12 (copy), v17 (copy), v18 (copy)
    local v27 = if v23 then l_getFooterVisibilityFromItemFooters_0(if v25.widgetConfiguration and v25.widgetConfiguration.defaultItemGroupTemplate then v25.widgetConfiguration.defaultItemGroupTemplate.itemFooters else nil) else nil;
    local v28 = l_useTokens_0();
    local v29 = v3.useRefCache();
    local v30 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.useFocusController();
    local v32 = l_useSelector_0(function(v31) --[[ Line: 56 ]]
        -- upvalues: v25 (copy)
        return v31.Search.SearchesInCatalog[v25.searchUuid];
    end, l_getUseSelectorDeepEquals_0());
    local v33 = l_useNavigation_0();
    local l_itemsPerRow_0 = v25.itemsPerRow;
    local l_key_0 = v33.state.key;
    local v36 = v19.ImpressionsEvents.AvatarItems .. if l_key_0 then string.gsub(l_key_0, "[-{}]", "") else "";
    local v37 = v32 and v32.keyword;
    local l_Catalog_0 = v20.AnalyticsContext.Catalog;
    if v25.fromSearch then
        l_Catalog_0 = v20.AnalyticsContext.CatalogSearch;
    end;
    local v39 = l_useSelector_0(v21, l_getUseSelectorDeepEquals_0());
    local v40 = v2.useMemo(function() --[[ Line: 76 ]]
        -- upvalues: v39 (copy), l_itemsPerRow_0 (copy), v4 (ref)
        if v39 and l_itemsPerRow_0 > 0 then
            return v4.List.getRange(v39, 1, l_itemsPerRow_0);
        else
            return nil;
        end;
    end, {
        v39, 
        l_itemsPerRow_0
    });
    local v41 = v5({
        sponsored = "Feature.GamePage.Label.Sponsored", 
        sponsoredDisclosure = "Feature.GamePage.Label.SponsoredDisclosure", 
        gotIt = "Feature.Avatar.Action.GotIt"
    });
    local v42 = l_useDispatch_0();
    local function v45(v43, v44) --[[ Line: 91 ]]
        -- upvalues: v33 (copy), l_AvatarScreen_0 (ref), v41 (copy)
        v33.navigate(l_AvatarScreen_0.GenericPrompt, {
            titleText = v43, 
            bodyText = v44, 
            buttonText = v41.gotIt
        });
    end;
    local v48 = v2.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v42 (copy), v41 (copy), l_IsVRAppBuild_0 (ref), v45 (copy), v33 (copy), l_AvatarScreen_0 (ref), l_OpenInfoPeekView_0 (ref)
        if v42 and v41.sponsoredDisclosure then
            if l_IsVRAppBuild_0() and v45 then
                local l_sponsored_0 = v41.sponsored;
                local l_sponsoredDisclosure_0 = v41.sponsoredDisclosure;
                v33.navigate(l_AvatarScreen_0.GenericPrompt, {
                    titleText = l_sponsored_0, 
                    bodyText = l_sponsoredDisclosure_0, 
                    buttonText = v41.gotIt
                });
                return;
            else
                v42(l_OpenInfoPeekView_0(v41.sponsored, v41.sponsoredDisclosure));
            end;
        end;
    end, {
        v42, 
        v41.sponsored, 
        v41.sponsoredDisclosure
    });
    local v49 = nil;
    local v50 = nil;
    local v51 = nil;
    local v52 = v16(v25.fromSearch);
    v49 = v52.impressionsCategory;
    v50 = v52.impressionsSubcategory;
    v51 = v52.impressionsTaxonomyId;
    local v53 = v12.getCreatorNameTileFooterEnabled(v25.widgetConfiguration);
    return v2.createElement(v2.Fragment, nil, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        SponsoredItems = v2.createElement(v17, {
            LayoutOrder = 1, 
            numItemsPerRow = l_itemsPerRow_0, 
            renderItem = function(v54) --[[ Line: 129 ]] --[[ Name: renderItem ]]
                -- upvalues: v2 (ref), v3 (ref), v29 (copy), l_itemsPerRow_0 (copy), v25 (copy), v18 (ref), l_Catalog_0 (ref), v20 (ref), v36 (copy), v37 (copy), v49 (ref), v50 (ref), v51 (ref), v53 (copy), v23 (ref), v27 (copy)
                local l_index_0 = v54.index;
                local l_item_0 = v54.item;
                return v2.createElement(v3.Focusable.Frame, {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    ref = v29[l_index_0], 
                    NextSelectionRight = if l_index_0 < l_itemsPerRow_0 then v29[l_index_0 + 1] else nil, 
                    NextSelectionLeft = if l_index_0 > 1 then v29[l_index_0 - 1] else nil, 
                    onFocusGained = function() --[[ Line: 139 ]] --[[ Name: onFocusGained ]]
                        -- upvalues: v25 (ref), l_index_0 (copy)
                        if v25.gamepadNavigationFocusPos:getValue().Y ~= v25.rowIndex then
                            return;
                        else
                            v25.setGamepadNavigationFocusPos(Vector2.new(l_index_0, v25.rowIndex));
                            return;
                        end;
                    end
                }, {
                    CatalogItemCard = v2.createElement(v18, {
                        analyticsContext = l_Catalog_0, 
                        analyticsItemCountPerPage = v20.PageFetchLimit, 
                        index = l_index_0, 
                        itemType = l_item_0.type, 
                        itemId = l_item_0.id, 
                        adTrackingData = l_item_0.encryptedAdTrackingData, 
                        isSponsoredItem = true, 
                        itemDetailsPeekViewRefs = v25.itemDetailsPeekViewRefs, 
                        resultsListRef = v25.gridRef, 
                        impressionsTag = v36, 
                        impressionsSchema = "defaultItem", 
                        impressionsGroup = nil, 
                        impressionsSearch = v37, 
                        impressionsId = l_item_0.id, 
                        impressionsCategory = v49, 
                        impressionsSubcategory = v50, 
                        impressionsTaxonomyId = v51, 
                        creatorNameTileFooterEnabled = v53, 
                        isCreatorNameVisible = if v23 then v27.isCreatorNameVisible else nil, 
                        isTitleVisible = if v23 then v27.isTitleVisible else nil, 
                        isPriceVisible = if v23 then v27.isPriceVisible else nil, 
                        gridInformation = {
                            gridPositionRow = v25.rowIndex, 
                            gridPositionColumn = l_index_0
                        }, 
                        isOrganic = true
                    })
                });
            end, 
            sponsoredGridRef = v26, 
            scrollingFrameRef = v25.scrollingFrameRef, 
            requestImpressionsSignal = v25.requestImpressionsSignal, 
            NextSelectionUp = v25.NextSelectionUp, 
            NextSelectionDown = v25.NextSelectionDown, 
            NextSelectionRight = v25.NextSelectionRight, 
            onFocusGained = v25.onFocusGained, 
            moveFocusToColumn = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else function() --[[ Line: 196 ]]
                -- upvalues: v25 (copy), v29 (copy), v40 (copy), v30 (copy)
                v25.setGamepadNavigationFocusPos(Vector2.new(v25.gamepadNavigationFocusPos:getValue().X, v25.rowIndex));
                local l_X_0 = v25.gamepadNavigationFocusPos:getValue().X;
                local v58 = nil;
                v58 = if l_X_0 then v29[math.min(l_X_0, #v40)] else v29[1];
                v30.moveFocusTo(v58);
            end, 
            onActivateTooltipCallback = v48
        }), 
        ManualPaddingFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v28.Gap.Large), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        })
    });
end));