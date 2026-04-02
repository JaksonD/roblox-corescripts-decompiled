local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v7 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.OutfitSwitcherFrame.useOutfitSwitcherFrameProps);
local l_Grid_0 = v5.GridComponents.Grid;
local v11 = require(l_Modules_0.AvatarExperience.AvatarSwitcher.AvatarSwitcherScrollingContent);
local v12 = require(l_Modules_0.AvatarExperience.AvatarSwitcher.AvatarTile.AvatarTileContainer);
local v13 = require(l_Modules_0.AvatarExperience.AvatarSwitcher.SettingsTile.SettingsTileContainer);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter);
local v16 = require(l_Modules_0.AvatarExperience.Flags.FStringAXImpressionsEventName);
local v17 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.InventoryItemsList.LoadMoreButton);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RecommendedItems);
local v19 = require(l_Modules_0.AvatarExperience.Common.Hooks.useCategoryInfo);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EmptyPage);
local l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 = v6.FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark;
local l_FFlagAXFixEmptyMakeupLooks_0 = v6.FFlagAXFixEmptyMakeupLooks;
return function(v23) --[[ Line: 41 ]] --[[ Name: OutfitSwitcherFrame ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy), v19 (copy), l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 (copy), v7 (copy), v13 (copy), v12 (copy), l_FFlagAXFixEmptyMakeupLooks_0 (copy), v11 (copy), l_Grid_0 (copy), v20 (copy), v8 (copy), v18 (copy), v15 (copy), v16 (copy), l_ImpressionEnums_0 (copy), v17 (copy)
    local v24 = v4.Hooks.useTokens();
    local v25 = v3.useRefCache();
    local v26 = v2.useRef(nil);
    local v27 = v2.useRef(nil);
    local v28 = v19();
    local v29 = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then v7.useOrientation() else nil;
    local v30 = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then v29 == v7.Keys.Portrait else nil;
    local v33 = v2.useCallback(function(v31) --[[ Line: 56 ]]
        -- upvalues: v23 (copy), v2 (ref), v13 (ref), v25 (copy), v12 (ref)
        local l_item_0 = v31.item;
        if v23.shouldRenderSettingsTile(l_item_0) then
            return (v2.createElement(v13, {
                itemWidth = v23.gridMetrics.itemWidth, 
                index = v31.index, 
                squareAspectRatio = true, 
                ref = v25[v31.index]
            }));
        else
            return v2.createElement(v12, {
                itemWidth = v23.gridMetrics.itemWidth, 
                itemId = l_item_0, 
                index = v31.index, 
                ref = v25[v31.index], 
                isSelected = v23.itemIdsToIsWearing[l_item_0], 
                hasItemFromCurrentPageEquipped = v23.hasItemFromCurrentPageEquipped, 
                impressionsTag = v23.impressionsTag, 
                impressionsSchema = "defaultItem", 
                squareAspectRatio = true, 
                gridInformation = v31.gridInformation
            });
        end;
    end, {
        v25, 
        v23.gridMetrics, 
        v23.itemIdsToIsWearing, 
        v23.shouldRenderSettingsTile, 
        v23.hasItemFromCurrentPageEquipped, 
        v23.impressionsTag
    });
    local v35 = if l_FFlagAXFixEmptyMakeupLooks_0 then v2.useCallback(function(v34) --[[ Line: 91 ]]
        return v34;
    end, {}) else nil;
    return v2.createElement(v11, {
        onThresholdReached = v23.onScrollingFrameThresholdReached, 
        onCanvasPositionChanged = v23.onCanvasPositionChanged, 
        onAbsoluteWindowSizeChanged = v23.onAbsoluteSizeChanged
    }, {
        ListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v24.Gap.Medium)
        }), 
        OutfitSwitcherGridContainer = v2.createElement(v4.View, {
            tag = "auto-xy", 
            padding = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then {
                left = if v30 then UDim.new(0, v24.Size.Size_400) else UDim.new(0, v24.Size.Size_250), 
                right = UDim.new(0, v24.Size.Size_250), 
                bottom = UDim.new(0, v24.Size.Size_250), 
                top = UDim.new(0, v24.Size.Size_250)
            } else {
                left = UDim.new(0, v24.Padding.Small), 
                right = UDim.new(0, v24.Padding.Small), 
                bottom = UDim.new(0, v24.Padding.Medium), 
                top = UDim.new(0, v24.Padding.Medium)
            }, 
            Size = UDim2.fromScale(1, 0), 
            LayoutOrder = 1
        }, {
            OutfitSwitcherGrid = if l_FFlagAXFixEmptyMakeupLooks_0 then if #v23.itemIds > 0 then v2.createElement(l_Grid_0, {
                itemsPerRow = v23.gridMetrics.itemsPerRow, 
                renderItem = v33, 
                items = v23.itemIds, 
                gapVertical = v24.Size.Size_300, 
                gapHorizontal = v24.Size.Size_200, 
                getItemId = v35, 
                ref = v26
            }) else v2.createElement(v20, {
                page = {
                    Title = v23.outfitType == v8.OutfitTypes.Makeup and "Feature.Avatar.Label.MakeupLooks" or "Feature.Avatar.Label.Looks"
                }
            }) else v2.createElement(l_Grid_0, {
                itemsPerRow = v23.gridMetrics.itemsPerRow, 
                renderItem = v33, 
                items = v23.itemIds, 
                gapVertical = v24.Size.Size_300, 
                gapHorizontal = v24.Size.Size_200, 
                getItemId = function(v36) --[[ Line: 150 ]] --[[ Name: getItemId ]]
                    return v36;
                end, 
                ref = v26
            })
        }), 
        RecommendedItemsContainer = v2.createElement(v4.View, {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            padding = {
                left = UDim.new(0, v24.Size.Size_200), 
                right = UDim.new(0, v24.Size.Size_200), 
                bottom = UDim.new(0, v24.Size.Size_200)
            }, 
            LayoutOrder = 2
        }, {
            RecommendedItems = v2.createElement(v18, {
                categoryInfo = v28, 
                itemDetailsPeekViewRefs = v25, 
                baseRef = v27, 
                listFrameRef = v26, 
                sendShopForMoreAnalytics = function() --[[ Line: 172 ]] --[[ Name: sendShopForMoreAnalytics ]]

                end
            })
        }), 
        ImpressionsReporter = v2.createElement(v15, {
            parentRef = v26, 
            pageFilter = v23.impressionsPageFilter, 
            onRequestImpressionsSignal = v23.requestImpressionsSignal, 
            eventContext = v16(), 
            eventName = "marketplaceOrganicFELog", 
            impressionsTag = v23.impressionsTag, 
            impressionsSchema = "defaultItem", 
            requestId = "", 
            surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
            analyticsMetadata = v23.analyticsMetadata, 
            searchUuid = v23.searchUuid
        }), 
        LoadMoreButton = if v23.showLoadMoreButton then v2.createElement(v17, {
            onActivated = v23.fetchMoreOutfits, 
            LayoutOrder = 2
        }) else nil
    });
end;