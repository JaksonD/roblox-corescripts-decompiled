local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Utility.formatNumber);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Foundation);
local l_useTokens_0 = v4.Hooks.useTokens;
local l_Text_0 = v4.Text;
local l_Image_0 = v4.Image;
local l_View_0 = v4.View;
local l_Skeleton_0 = v4.Skeleton;
local l_Radius_0 = v4.Enums.Radius;
local v11 = require(l_Parent_0.Enums.VirtualItemBadgeType);
local v12 = require(l_Parent_0.Generic.ModelViewport);
local v13 = require(l_Parent_0.Generic.YellowBadge);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_useLocalization_0 = require(l_Parent_1.Localization).Hooks.useLocalization;
local v16 = require(l_Parent_0.Generic.Hooks.useRobuxText);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local v18 = require(l_Parent_0.Flags.FFlagAddCompactUnifiedUpsellModalMode);
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal;
local l_default_0 = require(l_Parent_1.LoggingProtocol).default;
local l_VirtualItemBadgeShownCounter_0 = require(l_Parent_0.Generic.Events.VirtualItemBadgeCounter).VirtualItemBadgeShownCounter;
local v24 = 80;
if v18 then
    v24 = 72;
end;
local function _(v25) --[[ Line: 54 ]] --[[ Name: withMaxLength ]]
    if #v25 > 50 then
        return v25:sub(1, 50) .. "...";
    else
        return v25;
    end;
end;
local _ = require(l_Parent_0.ProductPurchase.PricingTypes);
return function(v28) --[[ Line: 79 ]]
    -- upvalues: l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), l_useLocalization_0 (copy), l_useTokens_0 (copy), v24 (ref), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v16 (copy), v18 (copy), v3 (copy), v12 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Image_0 (copy), v11 (copy), v13 (copy), l_default_0 (copy), l_VirtualItemBadgeShownCounter_0 (copy), l_View_0 (copy), l_Text_0 (copy), v2 (copy), l_LocalizationService_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy)
    local v29 = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v28.itemPrice else nil;
    local v30 = if v29 then v29.priceInRobux else v28.itemRobuxCost;
    local v31 = l_useLocalization_0({
        Popular = "IAPExperience.RobuxUpsell.Text.PopularItem"
    });
    local l_priceSuffix_0 = v28.priceSuffix;
    local v33 = l_useTokens_0();
    local v34 = v28.isPortrait and 128 or v24;
    local v35 = nil;
    if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
        v35 = v16(v30);
    end;
    local v36 = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v16(if v29 then v29.basePriceInRobux else v28.itemRobuxCost) else nil;
    local v37 = v29 and v29.basePriceInRobux > v29.priceInRobux;
    if v18 and v28.isCompact then
        v34 = v34 * 0.7;
    end;
    local v38 = if v28.model ~= nil then v3.createElement(v12, {
        model = v28.model, 
        Position = UDim2.fromOffset(5, 5), 
        Size = UDim2.fromOffset(v34, v34)
    }) else if l_FFlagUnifiedPurchaseAddSkeleton_0 and v28.itemIcon == nil and v28.isLoading then v3.createElement(l_Skeleton_0, {
        LayoutOrder = 1, 
        Size = UDim2.fromOffset(v34, v34), 
        radius = l_Radius_0.Circle
    }) else v3.createElement(l_Image_0, {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 5, 0, 5), 
        Size = UDim2.new(0, v34, 0, v34), 
        ScaleType = Enum.ScaleType.Stretch, 
        Image = if v28.itemIcon then v28.itemIcon else "icons/status/imageunavailable", 
        imageStyle = {
            Transparency = if v28.itemIcon then nil else v33.Color.Content.Default.Transparency
        }
    });
    local v39 = if v28.badgeType and v28.badgeType == v11.Popular then v3.createElement(v13, {
        LayoutOrder = 3, 
        Text = v31.Popular, 
        Icon = "icons/menu/fire_fill"
    }) else nil;
    v3.useEffect(function() --[[ Line: 141 ]]
        -- upvalues: v39 (copy), l_default_0 (ref), l_VirtualItemBadgeShownCounter_0 (ref), v28 (copy)
        if not v39 then
            return;
        else
            l_default_0:logRobloxTelemetryCounter(l_VirtualItemBadgeShownCounter_0, 1, {
                badgeType = v28.badgeType
            });
            return;
        end;
    end, {});
    local v40 = v18 and v28.isCompact and "auto-xy text-align-x-left text-wrap text-title-small content-emphasis" or "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis";
    local v41 = v18 and v28.isCompact and "auto-xy text-align-x-left text-wrap text-title-small content-emphasis" or "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis";
    local l_createElement_0 = v3.createElement;
    local l_l_View_0_0 = l_View_0;
    local v44 = {
        LayoutOrder = v28.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        tag = "auto-y row gap-small align-y-center align-x-left"
    };
    local v45 = {
        ItemIcon = v38
    };
    local l_createElement_1 = v3.createElement;
    local l_l_View_0_1 = l_View_0;
    local v48 = {
        LayoutOrder = 2, 
        Size = UDim2.new(1, -v34 - 6, 0, 0), 
        tag = "col auto-y gap-small"
    };
    local v49 = {};
    local v50;
    if l_FFlagUnifiedPurchaseAddSkeleton_0 and v28.isLoading and v28.itemName == nil then
        v50 = v3.createElement(l_Skeleton_0, {
            LayoutOrder = 1, 
            Size = UDim2.fromScale(1, 0.3), 
            radius = l_Radius_0.Circle, 
            tag = "position-bottom-center"
        });
    else
        v50 = v3.createElement;
        local l_l_Text_0_0 = l_Text_0;
        local v52 = {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 0)
        };
        local l_itemName_0 = v28.itemName;
        v52.Text = if #l_itemName_0 > 50 then l_itemName_0:sub(1, 50) .. "..." else l_itemName_0;
        v52.tag = if v18 then v40 else "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis";
        v50 = v50(l_l_Text_0_0, v52);
    end;
    v49.ItemName = v50;
    v49.ItemSubtitle = v28.subtitleView;
    v49.ItemDetails = if l_FFlagUnifiedPurchaseAddSkeleton_0 and v28.isLoading and v30 == nil then v3.createElement(l_Skeleton_0, {
        LayoutOrder = v28.subtitleView and 3 or 2, 
        Size = UDim2.fromScale(0.4, 0.3), 
        radius = l_Radius_0.Circle
    }) else v3.createElement(l_View_0, {
        LayoutOrder = v28.subtitleView and 3 or 2, 
        tag = v28.isPortrait and "auto-xy col gap-small align-y-center" or "auto-xy row gap-small align-y-center"
    }, {
        ItemCost = if v30 then if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v3.createElement(l_Text_0, {
            LayoutOrder = 1, 
            Text = v35 .. if l_priceSuffix_0 and l_priceSuffix_0 ~= "" then "" .. l_priceSuffix_0 else "", 
            tag = if v18 then v41 else "auto-xy text-align-x-left text-wrap text-body-small content-emphasis", 
            RichText = true
        }) else v3.createElement(l_Text_0, {
            LayoutOrder = 1, 
            Text = utf8.char(57346) .. " " .. v2(l_LocalizationService_0.RobloxLocaleId, v30) .. if l_priceSuffix_0 and l_priceSuffix_0 ~= "" then "" .. l_priceSuffix_0 else "", 
            tag = "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis"
        }) else if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v28.itemDisplayPrice then v3.createElement(l_Text_0, {
            LayoutOrder = 1, 
            Text = v28.itemDisplayPrice .. if l_priceSuffix_0 and l_priceSuffix_0 ~= "" then "" .. l_priceSuffix_0 else "", 
            tag = if v18 then v41 else "auto-xy text-align-x-left text-wrap text-body-small content-emphasis"
        }) else nil, 
        OriginalPrice = if v37 and v36 then v3.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = "<s>" .. v36 .. "</s>", 
            tag = "auto-xy text-align-x-left text-wrap text-body-small content-default", 
            RichText = true
        }) else nil, 
        ItemBadge = v39
    });
    v45.ItemDetailsFrame = l_createElement_1(l_l_View_0_1, v48, v49);
    return l_createElement_0(l_l_View_0_0, v44, v45);
end;