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
local v38 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 = v30.FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark;
local l_FFlagAXBodyPartsPillLabel_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXBodyPartsPillLabel;
local l_AvatarEditorSubcategories_0 = v6.Enums.AvatarEditorSubcategories;
local l_FFlagAXItemDetailsIxpExposure_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXItemDetailsIxpExposure;
local l_FFlagAXInventoryItemsListImpressionLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXInventoryItemsListImpressionLogging;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local function v46(v45) --[[ Line: 105 ]]
    return v45.ScreenSize;
end;
return function(v47) --[[ Line: 111 ]] --[[ Name: InventoryItemsList ]]
    -- upvalues: v4 (copy), v2 (copy), l_GridMetrics_0 (copy), v3 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), v25 (copy), l_FFlagAXSlotsInventoryLoadableGridView_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_FFlagAXBodyPartsPillLabel_0 (copy), l_useSelector_0 (copy), v46 (copy), l_FFlagAXInventoryItemsListImpressionLogging_0 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_useUnifiedEventImpressionsReporter_0 (copy), v20 (copy), v37 (copy), v36 (copy), l_EmptyState_0 (copy), l_FFlagAXGeneralizeInventoryItemsList_0 (copy), l_FFlagAXSlotsScrollAway_0 (copy), l_AvatarEditorSubcategories_0 (copy), v22 (copy), v13 (copy), l_AvatarScreen_0 (copy), l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 (copy), v15 (copy), v35 (copy), v38 (copy), l_Grid_0 (copy), v19 (copy), v21 (copy), v23 (copy), v18 (copy), v16 (copy), l_ImpressionEnums_0 (copy), l_TagBasedImpressionsDetector_0 (copy)
    local v48 = v4.useRef(nil);
    local l_items_0 = v47.items;
    local v50 = l_items_0 and #l_items_0 == 0;
    local l_categoryInfo_0 = v47.categoryInfo;
    local l_fetchStatus_0 = v47.fetchStatus;
    local l_fetchUserInventory_0 = v47.fetchUserInventory;
    local v54 = v47.subcategoryFilter ~= nil;
    local v55 = v4.useRef(nil);
    local v56 = v4.useRef(nil);
    local v57 = v2.Hooks.useTokens();
    local v58, v59 = v4.useState(0);
    local v60 = math.max(0, v58 - v57.Gap.Medium * 2);
    local l_Medium_0 = v57.Gap.Medium;
    local v62 = l_GridMetrics_0.getMetricsForFixedColumns(math.max(v60, 0), l_Medium_0, 4);
    local v63 = l_GridMetrics_0.getSmallMetrics(math.max(v60, 0), l_Medium_0);
    local v64 = v3.useOrientation() == v3.BreakpointConfig.Enum.Portrait;
    if l_FFlagAXRootSlotBasedEditorFlag_0 and v64 and v62.itemsPerRow > v63.itemsPerRow then
        v63 = v62;
    end;
    local v65 = v25(v60 + l_Medium_0, v63.itemWidth + l_Medium_0);
    local v66 = if l_FFlagAXSlotsInventoryLoadableGridView_0 then l_useStyle_0() else nil;
    v65 = math.max(v65, 1);
    local v67 = l_useLocalization_0({
        noItemsFound = "Feature.Catalog.Response.NoItemsFound", 
        bodyParts = l_FFlagAXBodyPartsPillLabel_0 and "Feature.Avatar.Heading.BodyParts" or nil
    });
    local v68 = if l_FFlagAXSlotsInventoryLoadableGridView_0 then l_useSelector_0(v46) else nil;
    local v69 = nil;
    if l_FFlagAXInventoryItemsListImpressionLogging_0 and l_FFlagAXItemDetailsIxpExposure_0 then
        local v70 = l_useUnifiedEventImpressionsReporter_0();
        local l_v70_0 = v70 --[[ copy: 24 -> 26 ]];
        v69 = v4.useMemo(function() --[[ Line: 157 ]]
            -- upvalues: l_v70_0 (copy)
            return {
                l_v70_0
            };
        end, {
            v70
        });
    end;
    v4.useEffect(function() --[[ Line: 164 ]]
        -- upvalues: v47 (copy)
        v47.requestImpressionsSignal:fire();
    end, {
        v47.requestImpressionsSignal
    });
    v4.useEffect(function() --[[ Line: 169 ]]
        -- upvalues: l_fetchStatus_0 (copy), v20 (ref), l_fetchUserInventory_0 (copy)
        if l_fetchStatus_0 == v20.NotStarted then
            l_fetchUserInventory_0();
        end;
    end, {
        l_fetchStatus_0, 
        l_fetchUserInventory_0
    });
    v4.useEffect(function() --[[ Line: 176 ]]
        -- upvalues: v56 (copy)
        if v56.current then
            v56.current.CanvasPosition = Vector2.new();
        end;
    end, {
        l_categoryInfo_0, 
        v47.subcategoryFilter
    });
    local v76 = if l_FFlagAXSlotsInventoryLoadableGridView_0 then v4.useCallback(function(v72, v73, v74) --[[ Line: 183 ]]
        -- upvalues: v47 (copy)
        local v75 = {
            item = v72, 
            index = v73, 
            gridInformation = v74
        };
        return v47.renderItem(v75);
    end, {
        v47.renderItem
    }) else nil;
    local v79 = if l_FFlagAXSlotsInventoryLoadableGridView_0 then v4.useMemo(function() --[[ Line: 194 ]]
        -- upvalues: v66 (copy), v63 (ref), v37 (ref), v36 (ref), l_categoryInfo_0 (copy)
        local l_Font_0 = v66.Font;
        local v78 = l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize;
        if v63.itemWidth / v78 < v37.MinTileWidthToFontHeightRatio then
            v78 = l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize;
        end;
        return v36.GridItemHeightGetter(v37.ItemTileType.AvatarEditorTile, if l_categoryInfo_0.ShowName then v78 else nil);
    end, {
        v66, 
        v63.itemWidth, 
        l_categoryInfo_0.ShowName
    }) else nil;
    if l_fetchStatus_0 == v20.Failed then
        return v4.createElement(l_EmptyState_0, {
            onActivated = l_fetchUserInventory_0, 
            text = v67.noItemsFound
        });
    else
        return v4.createElement(v2.View, {
            tag = l_FFlagAXGeneralizeInventoryItemsList_0 and "size-full" or "size-full bg-surface-0 padding-x-medium", 
            ref = v48, 
            onAbsoluteSizeChanged = function(v80) --[[ Line: 220 ]] --[[ Name: onAbsoluteSizeChanged ]]
                -- upvalues: v59 (copy)
                v59(v80.AbsoluteSize.X);
            end
        }, {
            PillsContainer = v54 and v4.createElement(v2.View, {
                tag = l_FFlagAXSlotsScrollAway_0 and "size-full-1200 auto-y row align-y-center" or "size-full-1700 auto-y row align-y-center"
            }, {
                FiltersPillLabel = if l_FFlagAXBodyPartsPillLabel_0 and l_categoryInfo_0.Id == l_AvatarEditorSubcategories_0.PurchasedCharacters then v4.createElement(v2.Text, {
                    fontStyle = v57.Typography.BodyMedium, 
                    Text = v67.bodyParts, 
                    LayoutOrder = 1, 
                    tag = "padding-small size-30 auto-x"
                }) else nil, 
                FiltersPill = v4.createElement(v22, {
                    categoryInfo = v47.categoryInfo, 
                    LayoutOrder = l_FFlagAXBodyPartsPillLabel_0 and 2 or nil
                })
            }), 
            ScrollingFrameContainer = v4.createElement(v2.View, {
                Size = UDim2.new(1, 0, 1, if v54 then -v57.Size.Size_1200 else 0), 
                Position = UDim2.fromOffset(0, if v54 then v57.Size.Size_1200 else 0)
            }, {
                ItemsScrollingFrame = v4.createElement(v13, {
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.fromScale(0, 0), 
                    parentAppPage = l_AvatarScreen_0.AvatarEditor, 
                    ScrollingEnabled = v47.scrollingEnabled, 
                    onCanvasPositionChanged = v47.onCanvasPositionChanged, 
                    onThresholdReached = v47.onListEndReached, 
                    BackgroundTransparency = l_FFlagAXGeneralizeInventoryItemsList_0 and 1 or nil, 
                    ref = v56
                }, {
                    ListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, v57.Gap.Medium)
                    }), 
                    Padding = v4.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v57.Padding.Medium), 
                        PaddingBottom = UDim.new(0, v57.Size.Size_2500), 
                        PaddingLeft = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then UDim.new(0, v57.Size.Size_100) else nil, 
                        PaddingRight = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then UDim.new(0, v57.Size.Size_50) else nil
                    }), 
                    EmptyPage = v50 and v4.createElement(v15, {
                        page = l_categoryInfo_0
                    }), 
                    ItemsGridContainer = not v50 and v4.createElement(v2.View, {
                        tag = "auto-y size-full-0", 
                        LayoutOrder = 1
                    }, {
                        ItemsGrid = if l_FFlagAXSlotsInventoryLoadableGridView_0 then v4.createElement(v35, {
                            getItemMetrics = if l_FFlagAXSlotsScrollAway_0 then l_GridMetrics_0.makeCustomMetricsGetter(v38.ItemsGridMetrics) else l_GridMetrics_0.getSmallMetrics, 
                            items = l_items_0, 
                            getItemHeight = v79, 
                            totalNumItems = l_items_0 and #l_items_0 or v37.ShimmerCardsToDisplay, 
                            renderItem = v76, 
                            windowHeight = v68.Y, 
                            ref = v55
                        }) else v4.createElement(l_Grid_0, {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            itemsPerRow = v65, 
                            renderItem = v47.renderItem, 
                            items = l_items_0, 
                            gapVertical = l_Medium_0, 
                            gapHorizontal = l_Medium_0, 
                            getItemId = function(v81) --[[ Line: 304 ]] --[[ Name: getItemId ]]
                                -- upvalues: v65 (ref)
                                return (("%*%*"):format(v81.itemId, v65));
                            end, 
                            ref = v55
                        })
                    }), 
                    RecommendedItems = v47.showRecommendedItems and v4.createElement(v19, {
                        LayoutOrder = 2, 
                        categoryInfo = l_categoryInfo_0, 
                        sendShopForMoreAnalytics = v47.sendShopForMoreAnalytics, 
                        itemDetailsPeekViewRefs = v47.itemDetailsPeekViewRefs, 
                        listFrameRef = v48
                    }), 
                    LoadMoreButton = if v47.showLoadMoreButton then v4.createElement(v21, {
                        onActivated = v47.fetchUserInventory, 
                        LayoutOrder = 3
                    }) else nil, 
                    LoadingBar = if v47.fetchStatus == v20.Fetching then v4.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, v57.Size.Size_700), 
                        LayoutOrder = 4
                    }, {
                        LoadingBar = v4.createElement(v23)
                    }) else nil, 
                    ImpressionsReporter = v4.createElement(v18, {
                        parentRef = v55, 
                        pageFilter = v47.impressionsPageFilter, 
                        onRequestImpressionsSignal = v47.requestImpressionsSignal, 
                        eventContext = v16(), 
                        eventName = "marketplaceOrganicFELog", 
                        impressionsTag = v47.impressionsTag, 
                        impressionsSchema = "defaultItem", 
                        requestId = "", 
                        surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
                        analyticsMetadata = v47.analyticsMetadata, 
                        searchUuid = v47.searchUuid
                    }), 
                    UnifiedImpressionsReporter = if l_FFlagAXInventoryItemsListImpressionLogging_0 then v4.createElement(l_TagBasedImpressionsDetector_0, {
                        parentRef = v55, 
                        pageFilter = v47.impressionsPageFilter, 
                        requestImpressionsSignal = v47.requestImpressionsSignal, 
                        extensions = v69
                    }) else nil
                })
            })
        });
    end;
end;