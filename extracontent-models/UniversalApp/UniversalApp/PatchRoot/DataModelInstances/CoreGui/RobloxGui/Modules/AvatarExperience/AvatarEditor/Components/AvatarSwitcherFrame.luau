local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v7 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local _ = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.useAvatarSwitcherFrameProps);
local l_Grid_0 = v5.GridComponents.Grid;
local v10 = require(l_Modules_0.AvatarExperience.AvatarSwitcher.AvatarSwitcherScrollingContent);
local v11 = require(l_Modules_0.AvatarExperience.AvatarSwitcher.AvatarTile.AvatarTileContainer);
local v12 = require(l_Modules_0.AvatarExperience.AvatarSwitcher.SettingsTile.SettingsTileContainer);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter);
local v15 = require(l_Modules_0.AvatarExperience.Flags.FStringAXImpressionsEventName);
local v16 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.InventoryItemsList.LoadMoreButton);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RecommendedItems);
local v18 = require(l_Modules_0.AvatarExperience.Common.Hooks.useCategoryInfo);
local l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 = v6.FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark;
return function(v20) --[[ Line: 36 ]] --[[ Name: AvatarSwitcherFrame ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy), v18 (copy), l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 (copy), v7 (copy), v12 (copy), v11 (copy), v10 (copy), l_Grid_0 (copy), v17 (copy), v14 (copy), v15 (copy), l_ImpressionEnums_0 (copy), v16 (copy)
    local v21 = v4.Hooks.useTokens();
    local v22 = v3.useRefCache();
    local v23 = v2.useRef(nil);
    local v24 = v2.useRef(nil);
    local v25 = v18();
    local v26 = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then v7.useOrientation() else nil;
    local v27 = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then v26 == v7.Keys.Portrait else nil;
    local v30 = v2.useCallback(function(v28) --[[ Line: 51 ]]
        -- upvalues: v20 (copy), v2 (ref), v12 (ref), v22 (copy), v11 (ref)
        local l_item_0 = v28.item;
        if v20.shouldRenderSettingsTile(l_item_0) then
            return (v2.createElement(v12, {
                itemWidth = v20.gridMetrics.itemWidth, 
                index = v28.index, 
                squareAspectRatio = true, 
                ref = v22[v28.index]
            }));
        else
            return v2.createElement(v11, {
                itemWidth = v20.gridMetrics.itemWidth, 
                itemId = l_item_0, 
                index = v28.index, 
                ref = v22[v28.index], 
                isSelected = v20.itemIdsToIsWearing[l_item_0], 
                hasItemFromCurrentPageEquipped = v20.hasItemFromCurrentPageEquipped, 
                impressionsTag = v20.impressionsTag, 
                impressionsSchema = "defaultItem", 
                squareAspectRatio = true, 
                gridInformation = v28.gridInformation
            });
        end;
    end, {
        v22, 
        v20.gridMetrics, 
        v20.itemIdsToIsWearing, 
        v20.shouldRenderSettingsTile, 
        v20.hasItemFromCurrentPageEquipped, 
        v20.impressionsTag
    });
    return v2.createElement(v10, {
        onThresholdReached = v20.onScrollingFrameThresholdReached, 
        onCanvasPositionChanged = v20.onCanvasPositionChanged, 
        onAbsoluteWindowSizeChanged = v20.onAbsoluteSizeChanged
    }, {
        ListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v21.Gap.Medium)
        }), 
        AvatarSwitcherGridContainer = v2.createElement(v4.View, {
            tag = "auto-xy", 
            padding = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then {
                left = if v27 then UDim.new(0, v21.Size.Size_400) else UDim.new(0, v21.Size.Size_250), 
                right = UDim.new(0, v21.Size.Size_250), 
                bottom = UDim.new(0, v21.Size.Size_250), 
                top = UDim.new(0, v21.Size.Size_250)
            } else {
                left = UDim.new(0, v21.Padding.Small), 
                right = UDim.new(0, v21.Padding.Small), 
                bottom = UDim.new(0, v21.Padding.Medium), 
                top = UDim.new(0, v21.Padding.Medium)
            }, 
            Size = UDim2.fromScale(1, 0), 
            LayoutOrder = 1
        }, {
            AvatarSwitcherGrid = v2.createElement(l_Grid_0, {
                itemsPerRow = v20.gridMetrics.itemsPerRow, 
                renderItem = v30, 
                items = v20.itemIds, 
                gapVertical = v21.Size.Size_300, 
                gapHorizontal = v21.Size.Size_200, 
                getItemId = function(v31) --[[ Line: 121 ]] --[[ Name: getItemId ]]
                    return v31;
                end, 
                ref = v23
            })
        }), 
        RecommendedItemsContainer = v2.createElement(v4.View, {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            padding = {
                left = UDim.new(0, v21.Size.Size_200), 
                right = UDim.new(0, v21.Size.Size_200), 
                bottom = UDim.new(0, v21.Size.Size_200)
            }, 
            LayoutOrder = 2
        }, {
            RecommendedItems = v2.createElement(v17, {
                categoryInfo = v25, 
                itemDetailsPeekViewRefs = v22, 
                baseRef = v24, 
                listFrameRef = v23, 
                sendShopForMoreAnalytics = function() --[[ Line: 143 ]] --[[ Name: sendShopForMoreAnalytics ]]

                end
            })
        }), 
        ImpressionsReporter = v2.createElement(v14, {
            parentRef = v23, 
            pageFilter = v20.impressionsPageFilter, 
            onRequestImpressionsSignal = v20.requestImpressionsSignal, 
            eventContext = v15(), 
            eventName = "marketplaceOrganicFELog", 
            impressionsTag = v20.impressionsTag, 
            impressionsSchema = "defaultItem", 
            requestId = "", 
            surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
            analyticsMetadata = v20.analyticsMetadata, 
            searchUuid = v20.searchUuid
        }), 
        LoadMoreButton = if v20.showLoadMoreButton then v2.createElement(v16, {
            onActivated = v20.fetchMoreOutfits, 
            LayoutOrder = 2
        }) else nil
    });
end;