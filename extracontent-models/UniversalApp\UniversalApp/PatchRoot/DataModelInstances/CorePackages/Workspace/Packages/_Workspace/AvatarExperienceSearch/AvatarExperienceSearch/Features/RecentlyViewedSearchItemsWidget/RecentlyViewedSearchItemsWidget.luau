local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AXCommon);
local v4 = require(l_Parent_0.IxpUtils);
local v5 = require(l_Parent_0.RoactGamepad);
local l_AvatarScreen_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_CatalogItemCard_0 = v3.Components.CatalogItemCard.CatalogItemCard;
local v11 = require(l_Parent_0.AvatarExperienceUIKit);
local l_ItemCardThumbnail_0 = v11.ItemCardComponents.ItemCardThumbnail;
local l_WidgetHeader_0 = v11.WidgetComponents.WidgetHeader;
local l_WidgetLayout_0 = v11.WidgetComponents.WidgetLayout;
local v15 = require(l_script_FirstAncestor_0.Components.Carousel.Carousel);
local v16 = require(l_script_FirstAncestor_0.Enums.SearchLandingPageWidgetEnum);
local l_getRbxThumbType_0 = v3.Utils.getRbxThumbType;
local _ = require(l_script_FirstAncestor_0.Features.RecentlyViewedSearchItemsWidget.useRecentlyViewedSearchItemsWidgetProps);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v3.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local v20 = {
    widgetTitleSearchItems = "Feature.Avatar.Label.SearchLandingPage.Title.RecentlyViewedSearchItems", 
    widgetTitleAllItems = "Feature.Avatar.Label.SearchLandingPage.Title.RecentlyViewedItems"
};
return function(v21) --[[ Line: 45 ]] --[[ Name: RecentlyViewedSearchItemsWidget ]]
    -- upvalues: l_useNavigation_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v20 (copy), v4 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), v2 (copy), l_getRbxThumbType_0 (copy), l_CatalogItemCard_0 (copy), v5 (copy), l_ItemCardThumbnail_0 (copy), l_WidgetLayout_0 (copy), l_WidgetHeader_0 (copy), l_AvatarScreen_0 (copy), v16 (copy), v15 (copy)
    local v22 = l_useNavigation_0();
    local v23 = l_useTokens_0();
    local v24 = v21.items or {};
    local v25 = l_useLocalization_0(v20);
    local v26 = v4.readTestVariable(l_AXRecentlyViewedSearchItemsIXPTest_0.EnabledSaveInCatalog);
    local l_itemWidth_0 = v21.itemWidth;
    if v21.itemsPerRow > 0 and #v24 > v21.itemsPerRow then
        l_itemWidth_0 = math.floor(l_itemWidth_0 * 0.95);
    end;
    local v34 = v2.useCallback(function() --[[ Line: 62 ]]
        -- upvalues: v24 (copy), l_getRbxThumbType_0 (ref), v2 (ref), l_CatalogItemCard_0 (ref), v5 (ref), v23 (copy), l_ItemCardThumbnail_0 (ref), l_itemWidth_0 (ref), v21 (copy)
        local v28 = {};
        for v29, v30 in v24 do
            local v31 = ("RecentlyViewedSearchItemTile-%*"):format(v30.id);
            local v32 = l_getRbxThumbType_0(v30.itemType);
            local v33 = v30.lowestPrice or v30.priceInRobux or nil;
            if v32 ~= nil then
                v28[v31] = v2.createElement(l_CatalogItemCard_0, {
                    onActivated = v30.onActivated, 
                    presentationSlot = v2.createElement(v5.Focusable.Frame, {
                        Size = UDim2.fromScale(1, 1), 
                        ClipsDescendants = true, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }, {
                        CornerRadius = v2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, v23.Size.Size_600)
                        }), 
                        Thumbnail = v2.createElement(l_ItemCardThumbnail_0, {
                            url = ("rbxthumb://type=%*&id=%*&w=150&h=150"):format(v32, v30.id)
                        })
                    }), 
                    priceLineContent = if v30.priceStatus then {
                        type = "text", 
                        text = v30.priceStatus
                    } else if v33 then {
                        type = "price", 
                        price = v33 or 0
                    } else nil, 
                    title = v30.name, 
                    Size = UDim2.fromOffset(l_itemWidth_0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    ref = if v29 == 1 then v21.firstSuggestedItemRef else nil, 
                    nextSelectionDown = v21.nextSelectionDown, 
                    nextSelectionUp = v21.nextSelectionUp, 
                    LayoutOrder = v29
                });
            end;
        end;
        return v28;
    end, {
        v24, 
        v21.firstSuggestedItemRef, 
        v21.nextSelectionDown, 
        v21.nextSelectionUp, 
        l_itemWidth_0
    });
    return v2.createElement(l_WidgetLayout_0, {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.fromScale(1, 1), 
        LayoutOrder = v21.LayoutOrder, 
        padding = {
            left = UDim.new(0, v23.Size.Size_400), 
            right = UDim.new(0, v23.Size.Size_400)
        }, 
        headerSlot = v2.createElement(l_WidgetHeader_0, {
            titleText = if v26 then v25.widgetTitleAllItems else v25.widgetTitleSearchItems, 
            seeAllCallback = function() --[[ Line: 117 ]] --[[ Name: seeAllCallback ]]
                -- upvalues: v22 (copy), l_AvatarScreen_0 (ref), v16 (ref)
                v22.navigate(l_AvatarScreen_0.SearchLandingFocusedWidgetPage, {
                    widgetType = v16.RecentlyViewedItems
                });
            end, 
            NextSelectionDown = v21.firstSuggestedItemRef, 
            NextSelectionUp = v21.nextSelectionUp
        }), 
        contentSlot = v2.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.fromScale(1, 0)
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, -v23.Size.Size_600), 
                PaddingRight = UDim.new(0, -v23.Size.Size_600)
            }), 
            RecentlyViewedSearchItemsWidgetContent = v2.createElement(v15, {
                itemPadding = v23.Size.Size_250, 
                carouselMargin = v23.Size.Size_600
            }, (v34()))
        })
    });
end;