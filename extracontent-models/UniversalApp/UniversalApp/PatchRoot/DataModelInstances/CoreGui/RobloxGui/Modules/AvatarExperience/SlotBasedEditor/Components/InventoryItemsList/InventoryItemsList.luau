local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Foundation);
local v3 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v4 = require(l_CorePackages_0.Packages.React);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_GridMetrics_0 = v9.App.Grid.GridMetrics;
local l_EmptyState_0 = v9.App.Indicator.EmptyState;
local l_Grid_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).GridComponents.Grid;
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.AXRefreshScrollingFrameWithLoadMore);
local _ = require(l_Modules_0.AvatarExperience.Common.Context.AdaptiveScrollingContext);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EmptyPage);
local v16 = require(l_Modules_0.AvatarExperience.Flags.FStringAXImpressionsEventName);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RecommendedItems);
local v20 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v21 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.InventoryItemsList.LoadMoreButton);
local v22 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.SubcategoryFilters.SubcategoryFiltersPill);
local v23 = require(l_Modules_0.LuaApp.Components.LoadingBarWithTheme);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getItemCountForRow);
local l_TagBasedImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector;
local l_useUnifiedEventImpressionsReporter_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventImpressionsReporter;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local v30 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXGeneralizeInventoryItemsList_0 = v30.FFlagAXGeneralizeInventoryItemsList;
local l_FFlagAXSlotsInventoryLoadableGridView_0 = v30.FFlagAXSlotsInventoryLoadableGridView;
local l_FFlagAXSlotsScrollAway_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsScrollAway;
local l_useStyle_0 = v9.Core.Style.useStyle;
local v35 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v36 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v37 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v39 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 = v30.FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark;
local l_FFlagAXBodyPartsPillLabel_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXBodyPartsPillLabel;
local l_AvatarEditorSubcategories_0 = v6.Enums.AvatarEditorSubcategories;
local l_FFlagAXItemDetailsIxpExposure_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXItemDetailsIxpExposure;
local l_FFlagAXInventoryItemsListImpressionLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXInventoryItemsListImpressionLogging;
local l_FFlagAXInventoryDurablesExpiredFilter_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXInventoryDurablesExpiredFilter;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local function v48(v47) --[[ Line: 109 ]]
    return v47.ScreenSize;
end;
return function(v49) --[[ Line: 115 ]] --[[ Name: InventoryItemsList ]]
    -- upvalues: v4 (copy), v2 (copy), l_GridMetrics_0 (copy), v3 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), v25 (copy), l_FFlagAXSlotsInventoryLoadableGridView_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_FFlagAXBodyPartsPillLabel_0 (copy), l_useSelector_0 (copy), v48 (copy), l_FFlagAXInventoryItemsListImpressionLogging_0 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_useUnifiedEventImpressionsReporter_0 (copy), v20 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (copy), v37 (copy), v36 (copy), l_EmptyState_0 (copy), l_FFlagAXGeneralizeInventoryItemsList_0 (copy), l_FFlagAXSlotsScrollAway_0 (copy), l_AvatarEditorSubcategories_0 (copy), v22 (copy), v13 (copy), l_AvatarScreen_0 (copy), l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 (copy), v15 (copy), v35 (copy), v39 (copy), l_Grid_0 (copy), v19 (copy), v21 (copy), v23 (copy), v18 (copy), v16 (copy), l_ImpressionEnums_0 (copy), l_TagBasedImpressionsDetector_0 (copy)
    local v50 = v4.useRef(nil);
    local l_items_0 = v49.items;
    local v52 = l_items_0 and #l_items_0 == 0;
    local l_categoryInfo_0 = v49.categoryInfo;
    local l_fetchStatus_0 = v49.fetchStatus;
    local l_fetchUserInventory_0 = v49.fetchUserInventory;
    local v56 = v49.subcategoryFilter ~= nil;
    local v57 = v4.useRef(nil);
    local v58 = v4.useRef(nil);
    local v59 = v2.Hooks.useTokens();
    local v60, v61 = v4.useState(0);
    local v62 = math.max(0, v60 - v59.Gap.Medium * 2);
    local l_Medium_0 = v59.Gap.Medium;
    local v64 = l_GridMetrics_0.getMetricsForFixedColumns(math.max(v62, 0), l_Medium_0, 4);
    local v65 = l_GridMetrics_0.getSmallMetrics(math.max(v62, 0), l_Medium_0);
    local v66 = v3.useOrientation() == v3.BreakpointConfig.Enum.Portrait;
    if l_FFlagAXRootSlotBasedEditorFlag_0 and v66 and v64.itemsPerRow > v65.itemsPerRow then
        v65 = v64;
    end;
    local v67 = v25(v62 + l_Medium_0, v65.itemWidth + l_Medium_0);
    local v68 = if l_FFlagAXSlotsInventoryLoadableGridView_0 then l_useStyle_0() else nil;
    v67 = math.max(v67, 1);
    local v69 = l_useLocalization_0({
        noItemsFound = "Feature.Catalog.Response.NoItemsFound", 
        bodyParts = l_FFlagAXBodyPartsPillLabel_0 and "Feature.Avatar.Heading.BodyParts" or nil
    });
    local v70 = if l_FFlagAXSlotsInventoryLoadableGridView_0 then l_useSelector_0(v48) else nil;
    local v71 = nil;
    if l_FFlagAXInventoryItemsListImpressionLogging_0 and l_FFlagAXItemDetailsIxpExposure_0 then
        local v72 = l_useUnifiedEventImpressionsReporter_0();
        local l_v72_0 = v72 --[[ copy: 24 -> 27 ]];
        v71 = v4.useMemo(function() --[[ Line: 161 ]]
            -- upvalues: l_v72_0 (copy)
            return {
                l_v72_0
            };
        end, {
            v72
        });
    end;
    v4.useEffect(function() --[[ Line: 168 ]]
        -- upvalues: v49 (copy)
        v49.requestImpressionsSignal:fire();
    end, {
        v49.requestImpressionsSignal
    });
    v4.useEffect(function() --[[ Line: 173 ]]
        -- upvalues: l_fetchStatus_0 (copy), v20 (ref), l_fetchUserInventory_0 (copy)
        if l_fetchStatus_0 == v20.NotStarted then
            l_fetchUserInventory_0();
        end;
    end, {
        l_fetchStatus_0, 
        l_fetchUserInventory_0
    });
    v4.useEffect(function() --[[ Line: 180 ]]
        -- upvalues: v58 (copy)
        if v58.current then
            v58.current.CanvasPosition = Vector2.new();
        end;
    end, {
        l_categoryInfo_0, 
        v49.subcategoryFilter
    });
    local v78 = if l_FFlagAXSlotsInventoryLoadableGridView_0 then v4.useCallback(function(v74, v75, v76) --[[ Line: 187 ]]
        -- upvalues: v49 (copy)
        local v77 = {
            item = v74, 
            index = v75, 
            gridInformation = v76
        };
        return v49.renderItem(v77);
    end, {
        v49.renderItem
    }) else nil;
    local v79 = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v49.itemTileType or v37.ItemTileType.AvatarEditorTile else v37.ItemTileType.AvatarEditorTile;
    local v83 = if l_FFlagAXSlotsInventoryLoadableGridView_0 then v4.useMemo(function() --[[ Line: 201 ]]
        -- upvalues: v68 (copy), v65 (ref), v37 (ref), l_FFlagAXInventoryDurablesExpiredFilter_0 (ref), v79 (copy), l_categoryInfo_0 (copy), v36 (ref)
        local l_Font_0 = v68.Font;
        local v81 = l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize;
        if v65.itemWidth / v81 < v37.MinTileWidthToFontHeightRatio then
            v81 = l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize;
        end;
        if l_FFlagAXInventoryDurablesExpiredFilter_0 then
            local v82 = nil;
            if v79 == v37.ItemTileType.AvatarEditorTile then
                v82 = if l_categoryInfo_0.ShowName then v81 else nil;
            elseif v79 == v37.ItemTileType.CatalogItemTile then
                v82 = v81;
            end;
            return v36.GridItemHeightGetter(v79, v82);
        else
            return v36.GridItemHeightGetter(v37.ItemTileType.AvatarEditorTile, if l_categoryInfo_0.ShowName then v81 else nil);
        end;
    end, {
        v68, 
        v65.itemWidth, 
        l_categoryInfo_0.ShowName, 
        if l_FFlagAXInventoryDurablesExpiredFilter_0 then v79 else nil
    }) else nil;
    if l_fetchStatus_0 == v20.Failed then
        return v4.createElement(l_EmptyState_0, {
            onActivated = l_fetchUserInventory_0, 
            text = v69.noItemsFound
        });
    else
        return v4.createElement(v2.View, {
            tag = l_FFlagAXGeneralizeInventoryItemsList_0 and "size-full" or "size-full bg-surface-0 padding-x-medium", 
            ref = v50, 
            onAbsoluteSizeChanged = function(v84) --[[ Line: 243 ]] --[[ Name: onAbsoluteSizeChanged ]]
                -- upvalues: v61 (copy)
                v61(v84.AbsoluteSize.X);
            end
        }, {
            PillsContainer = v56 and v4.createElement(v2.View, {
                tag = l_FFlagAXSlotsScrollAway_0 and "size-full-1200 auto-y row align-y-center" or "size-full-1700 auto-y row align-y-center"
            }, {
                FiltersPillLabel = if l_FFlagAXBodyPartsPillLabel_0 and l_categoryInfo_0.Id == l_AvatarEditorSubcategories_0.PurchasedCharacters then v4.createElement(v2.Text, {
                    fontStyle = v59.Typography.BodyMedium, 
                    Text = v69.bodyParts, 
                    LayoutOrder = 1, 
                    tag = "padding-small size-30 auto-x"
                }) else nil, 
                FiltersPill = v4.createElement(v22, {
                    categoryInfo = v49.categoryInfo, 
                    LayoutOrder = l_FFlagAXBodyPartsPillLabel_0 and 2 or nil
                })
            }), 
            ScrollingFrameContainer = v4.createElement(v2.View, {
                Size = UDim2.new(1, 0, 1, if v56 then -v59.Size.Size_1200 else 0), 
                Position = UDim2.fromOffset(0, if v56 then v59.Size.Size_1200 else 0)
            }, {
                ItemsScrollingFrame = v4.createElement(v13, {
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.fromScale(0, 0), 
                    parentAppPage = l_AvatarScreen_0.AvatarEditor, 
                    ScrollingEnabled = v49.scrollingEnabled, 
                    onCanvasPositionChanged = v49.onCanvasPositionChanged, 
                    onThresholdReached = v49.onListEndReached, 
                    BackgroundTransparency = l_FFlagAXGeneralizeInventoryItemsList_0 and 1 or nil, 
                    ref = v58
                }, {
                    ListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, v59.Gap.Medium)
                    }), 
                    Padding = v4.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v59.Padding.Medium), 
                        PaddingBottom = UDim.new(0, v59.Size.Size_2500), 
                        PaddingLeft = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then UDim.new(0, v59.Size.Size_100) else nil, 
                        PaddingRight = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then UDim.new(0, v59.Size.Size_50) else nil
                    }), 
                    EmptyPage = v52 and v4.createElement(v15, {
                        page = l_categoryInfo_0
                    }), 
                    ItemsGridContainer = not v52 and v4.createElement(v2.View, {
                        tag = "auto-y size-full-0", 
                        LayoutOrder = 1
                    }, {
                        ItemsGrid = if l_FFlagAXSlotsInventoryLoadableGridView_0 then v4.createElement(v35, {
                            getItemMetrics = if l_FFlagAXSlotsScrollAway_0 then l_GridMetrics_0.makeCustomMetricsGetter(v39.ItemsGridMetrics) else l_GridMetrics_0.getSmallMetrics, 
                            items = l_items_0, 
                            getItemHeight = v83, 
                            totalNumItems = l_items_0 and #l_items_0 or v37.ShimmerCardsToDisplay, 
                            renderItem = v78, 
                            windowHeight = v70.Y, 
                            ref = v57
                        }) else v4.createElement(l_Grid_0, {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            itemsPerRow = v67, 
                            renderItem = v49.renderItem, 
                            items = l_items_0, 
                            gapVertical = l_Medium_0, 
                            gapHorizontal = l_Medium_0, 
                            getItemId = function(v85) --[[ Line: 327 ]] --[[ Name: getItemId ]]
                                -- upvalues: v67 (ref)
                                return (("%*%*"):format(v85.itemId, v67));
                            end, 
                            ref = v57
                        })
                    }), 
                    RecommendedItems = v49.showRecommendedItems and v4.createElement(v19, {
                        LayoutOrder = 2, 
                        categoryInfo = l_categoryInfo_0, 
                        sendShopForMoreAnalytics = v49.sendShopForMoreAnalytics, 
                        itemDetailsPeekViewRefs = v49.itemDetailsPeekViewRefs, 
                        listFrameRef = v50
                    }), 
                    LoadMoreButton = if v49.showLoadMoreButton then v4.createElement(v21, {
                        onActivated = v49.fetchUserInventory, 
                        LayoutOrder = 3
                    }) else nil, 
                    LoadingBar = if v49.fetchStatus == v20.Fetching then v4.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, v59.Size.Size_700), 
                        LayoutOrder = 4
                    }, {
                        LoadingBar = v4.createElement(v23)
                    }) else nil, 
                    ImpressionsReporter = v4.createElement(v18, {
                        parentRef = v57, 
                        pageFilter = v49.impressionsPageFilter, 
                        onRequestImpressionsSignal = v49.requestImpressionsSignal, 
                        eventContext = v16(), 
                        eventName = "marketplaceOrganicFELog", 
                        impressionsTag = v49.impressionsTag, 
                        impressionsSchema = "defaultItem", 
                        requestId = "", 
                        surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
                        analyticsMetadata = v49.analyticsMetadata, 
                        searchUuid = v49.searchUuid
                    }), 
                    UnifiedImpressionsReporter = if l_FFlagAXInventoryItemsListImpressionLogging_0 then v4.createElement(l_TagBasedImpressionsDetector_0, {
                        parentRef = v57, 
                        pageFilter = v49.impressionsPageFilter, 
                        requestImpressionsSignal = v49.requestImpressionsSignal, 
                        extensions = v71
                    }) else nil
                })
            })
        });
    end;
end;