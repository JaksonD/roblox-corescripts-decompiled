local l_script_FirstAncestor_0 = script:FindFirstAncestor("IAPExperience");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v4 = require(l_script_FirstAncestor_0.Generic.UnifiedProductDetails);
local v5 = require(l_script_FirstAncestor_0.Generic.PriceSummaryV2);
local v6 = require(l_script_FirstAncestor_0.Generic.DiscountSummary);
local v7 = require(l_script_FirstAncestor_0.Enums.UnifiedPurchaseModalTypeEnum);
local _ = require(l_script_FirstAncestor_0.ProductPurchase.PricingTypes);
local _ = require(l_script_FirstAncestor_0.Enums.VirtualItemBadgeType);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAddCompactUnifiedUpsellModalMode);
local function _(v11) --[[ Line: 50 ]] --[[ Name: itemPriceHasDiscountBreakdown ]]
    if not v11 then
        return false;
    else
        local l_basePriceInRobux_0 = v11.basePriceInRobux;
        local l_priceInRobux_0 = v11.priceInRobux;
        local v14 = false;
        if typeof(l_basePriceInRobux_0) == "number" then
            v14 = false;
            if typeof(l_priceInRobux_0) == "number" then
                v14 = l_priceInRobux_0 < l_basePriceInRobux_0;
            end;
        end;
        return v14;
    end;
end;
return function(v16) --[[ Line: 61 ]] --[[ Name: ProductDetailsContainer ]]
    -- upvalues: v7 (copy), v2 (copy), l_View_0 (copy), v5 (copy), v6 (copy), v4 (copy), v10 (copy)
    local v17 = v16.product and v16.product.itemPrice;
    local v18;
    if not v17 then
        v18 = false;
    else
        local l_basePriceInRobux_1 = v17.basePriceInRobux;
        local l_priceInRobux_1 = v17.priceInRobux;
        v18 = false;
        if typeof(l_basePriceInRobux_1) == "number" then
            v18 = false;
            if typeof(l_priceInRobux_1) == "number" then
                v18 = l_priceInRobux_1 < l_basePriceInRobux_1;
            end;
        end;
    end;
    local v21 = UDim2.new(1, 0, 0, 100);
    if v16.purchaseModalType == v7.MultiItem then
        if v18 then
            return v2.createElement(l_View_0, {
                tag = "col shrink-0 size-full-0 align-x-center align-y-start", 
                Size = v21
            }, {
                Summary = v2.createElement(v5, {
                    amount = v16.product.itemRobuxCost, 
                    itemPrice = v17
                })
            });
        else
            return (v2.createElement(v5, {
                amount = v16.product.itemRobuxCost, 
                itemPrice = v17
            }));
        end;
    else
        local v22 = if v17 then v2.createElement(l_View_0, {
            tag = "auto-y size-full-0 padding-xxsmall", 
            LayoutOrder = 2
        }, {
            Discount = v2.createElement(v6, {
                itemPrice = v17
            })
        }) else nil;
        return v2.createElement(l_View_0, {
            tag = v18 and "col gap-medium shrink-0 auto-y size-full-0 align-x-center align-y-start" or "col gap-medium auto-y size-full-0 align-x-center align-y-start", 
            Size = if v18 then v21 else nil
        }, {
            Details = v2.createElement(v4, {
                layoutOrder = 1, 
                isPortrait = false, 
                isCompact = if v10 then v16.isCompact else nil, 
                itemIcon = v16.product.itemIcon, 
                itemName = v16.product.itemName, 
                itemRobuxCost = v16.product.itemRobuxCost, 
                itemPrice = v17, 
                model = v16.product.model, 
                subtitleView = v16.subtitleView, 
                itemDisplayPrice = v16.product.itemDisplayPrice, 
                isLoading = v16.isLoading, 
                priceSuffix = v16.priceSuffix
            }), 
            DiscountSummary = v22
        });
    end;
end;