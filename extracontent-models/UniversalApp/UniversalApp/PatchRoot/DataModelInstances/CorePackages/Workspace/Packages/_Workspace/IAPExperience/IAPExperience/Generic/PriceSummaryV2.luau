local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local l_Divider_0 = v3.Divider;
local l_useLocalization_0 = require(l_Parent_1.Localization).Hooks.useLocalization;
local v8 = require(l_Parent_0.Generic.Hooks.useRobuxText);
local v9 = require(l_Parent_0.Generic.Hooks.usePlaceholderLocalization);
local v10 = require(l_Parent_0.Generic.PriceLineItem);
local v11 = require(l_Parent_0.Generic.DiscountRow);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local v13 = require(l_Parent_0.Flags.FFlagUnifiedPurchaseFlowLowercaseTotalPrice);
local _ = require(l_Parent_0.ProductPurchase.PricingTypes);
local function _(v15) --[[ Line: 44 ]] --[[ Name: shouldShowPriceBreakdown ]]
    if not v15 then
        return false;
    else
        local l_basePriceInRobux_0 = v15.basePriceInRobux;
        local l_priceInRobux_0 = v15.priceInRobux;
        local v18 = false;
        if typeof(l_basePriceInRobux_0) == "number" then
            v18 = false;
            if typeof(l_priceInRobux_0) == "number" then
                v18 = l_priceInRobux_0 < l_basePriceInRobux_0;
            end;
        end;
        return v18;
    end;
end;
return function(v20) --[[ Line: 55 ]] --[[ Name: PriceSummaryV2 ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v13 (copy), v9 (copy), v8 (copy), v2 (copy), v10 (copy), v11 (copy), l_View_0 (copy), l_Divider_0 (copy), l_Text_0 (copy)
    local l_itemPrice_0 = v20.itemPrice;
    local v22 = if l_itemPrice_0 then l_itemPrice_0.priceInRobux else v20.amount;
    local v23;
    if not l_itemPrice_0 then
        v23 = false;
    else
        local l_basePriceInRobux_1 = l_itemPrice_0.basePriceInRobux;
        local l_priceInRobux_1 = l_itemPrice_0.priceInRobux;
        v23 = false;
        if typeof(l_basePriceInRobux_1) == "number" then
            v23 = false;
            if typeof(l_priceInRobux_1) == "number" then
                v23 = l_priceInRobux_1 < l_basePriceInRobux_1;
            end;
        end;
    end;
    local v26 = l_useLocalization_0({
        Total = "Feature.Catalog.Label.TotalUnformatted", 
        TotalPrice = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v13 and "IAPExperience.PurchasePrompt.Label.TotalPriceV2" or "IAPExperience.PurchasePrompt.Label.TotalPrice" else nil
    });
    local v27 = v9({
        SubtotalLabel = if v20.subtotalItemCount then {
            "IAPExperience.PurchasePrompt.Label.SubtotalWithItemCount"; 
            itemCount = v20.subtotalItemCount
        } else "IAPExperience.PurchasePrompt.Label.Subtotal", 
        TotalLabel = "IAPExperience.PurchasePrompt.Label.Total"
    });
    local v28 = if v23 and l_itemPrice_0 then l_itemPrice_0.basePriceInRobux else v22 or 0;
    local v29 = v8(v28);
    local v30 = v8(v22 or 0);
    if v23 and l_itemPrice_0 then
        local v31 = {};
        local v32 = 1;
        v31.SubtotalRow = v2.createElement(v10, {
            label = v27.SubtotalLabel, 
            amount = v30, 
            LayoutOrder = v32
        });
        v32 = v32 + 1;
        for v33, v34 in ipairs(l_itemPrice_0.discounts) do
            if v34.amountInRobux > 0 then
                v31["DiscountRow_" .. tostring(v33)] = v2.createElement(v11, {
                    discount = v34, 
                    LayoutOrder = v32
                });
                v32 = v32 + 1;
            end;
        end;
        v31.BreakdownDivider = v2.createElement(l_View_0, {
            LayoutOrder = v32, 
            tag = "col size-full-0 auto-y shrink-0 self-stretch padding-top-small"
        }, {
            Line = v2.createElement(l_Divider_0, {
                tag = "size-full-0 auto-y"
            })
        });
        v32 = v32 + 1;
        v31.TotalRow = v2.createElement(v10, {
            label = v27.TotalLabel, 
            amount = v29, 
            textStyle = "text-title-medium", 
            tag = "row size-full-0 auto-y align-y-center padding-x-xsmall padding-y-xsmall", 
            LayoutOrder = v32
        });
        return v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y padding-left-xxsmall padding-right-xxsmall padding-top-small padding-bottom-xsmall"
        }, {
            BorderContainer = v2.createElement(l_View_0, {
                tag = "col size-full-0 auto-y shrink-0 radius-medium padding-x-large padding-y-small stroke-default gap-xsmall"
            }, v31)
        });
    else
        return v2.createElement(l_View_0, {
            tag = "size-full-1300 padding-left-xxsmall padding-right-xxsmall padding-top-small padding-bottom-large"
        }, {
            BorderContainer = v2.createElement(l_View_0, {
                tag = "auto-xy align-y-center align-x-center radius-medium padding-x-large row stroke-default padding-y-xsmall"
            }, {
                LeftSide = v2.createElement(l_View_0, {
                    LayoutOrder = 1, 
                    tag = "row gap-small align-y-center align-x-start padding-y-xsmall", 
                    Size = UDim2.new(0.5, 0, 0, 0)
                }, {
                    RobuxAmount = v2.createElement(l_Text_0, {
                        LayoutOrder = 1, 
                        Text = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v26.TotalPrice else v26.Total, 
                        tag = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "auto-xy text-title-medium content-default text-align-x-left padding-y-xsmall" or "auto-xy text-label-medium content-default text-align-x-left padding-y-xsmall"
                    })
                }), 
                RightSide = v2.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "row align-y-center align-x-right gap-large padding-y-xsmall", 
                    Size = UDim2.new(0.5, 0, 0, 0)
                }, {
                    RobuxPrice = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v2.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        Text = v29, 
                        tag = "auto-xy text-title-medium content-emphasis text-align-x-right padding-y-xsmall", 
                        RichText = true
                    }) else v2.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        Text = v29, 
                        tag = "auto-xy text-label-medium content-emphasis text-align-x-right padding-y-xsmall"
                    })
                })
            })
        });
    end;
end;