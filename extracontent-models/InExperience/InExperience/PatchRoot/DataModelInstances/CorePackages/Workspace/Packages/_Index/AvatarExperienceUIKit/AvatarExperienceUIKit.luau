local _ = require(script.BackgroundLayers.BackgroundLayers);
local l_ItemCard_0 = script.ItemCard;
local v2 = require(l_ItemCard_0.ItemCard);
local v3 = require(l_ItemCard_0.ItemCardAnimationStateIndicator);
local v4 = require(l_ItemCard_0.ItemCardBadge);
local v5 = require(l_ItemCard_0.ItemCardCreatorName);
local v6 = require(l_ItemCard_0.ItemCardFooter);
local v7 = require(l_ItemCard_0.ItemCardHeader);
local v8 = require(l_ItemCard_0.ItemCardHeaderCornersOverlay);
local v9 = require(l_ItemCard_0.ItemCardIcon);
local v10 = require(l_ItemCard_0.ItemCardPriceLine);
local v11 = require(l_ItemCard_0.ItemCardStatus);
local v12 = require(l_ItemCard_0.ItemCardThumbnail);
local v13 = require(l_ItemCard_0.ItemCardTitle);
local l_Widget_0 = script.Widget;
local v15 = require(l_Widget_0.WidgetHeader);
local v16 = require(l_Widget_0.WidgetLayout);
local v17 = require(l_Widget_0.WidgetListItem);
local v18 = require(script.Grid.Grid);
local v19 = require(script.AXTooltip.AXTooltip);
return {
    ItemCardComponents = {
        ItemCard = v2, 
        ItemCardAnimationStateIndicator = v3, 
        ItemCardBadge = v4, 
        ItemCardCreatorName = v5, 
        ItemCardFooter = v6, 
        ItemCardHeader = v7, 
        ItemCardHeaderCornersOverlay = v8, 
        ItemCardIcon = v9, 
        ItemCardPriceLine = v10, 
        ItemCardStatus = v11, 
        ItemCardThumbnail = v12, 
        ItemCardTitle = v13
    }, 
    WidgetComponents = {
        WidgetHeader = v15, 
        WidgetLayout = v16, 
        WidgetListItem = v17
    }, 
    GridComponents = {
        Grid = v18
    }, 
    AXTooltipComponents = {
        AXTooltip = v19
    }, 
    ["jest.config"] = script["jest.config"]
};