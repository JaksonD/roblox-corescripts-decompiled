local l_script_FirstAncestor_0 = script:FindFirstAncestor("IAPExperience");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Accordion_0 = v3.Accordion;
local l_View_0 = v3.View;
local l_Divider_0 = v3.Divider;
local l_IconName_0 = v3.Enums.IconName;
local v8 = require(l_script_FirstAncestor_0.Utility.formatNumber);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v10 = require(l_script_FirstAncestor_0.Generic.Hooks.usePlaceholderLocalization);
local v11 = require(l_script_FirstAncestor_0.Generic.Hooks.useRobuxText);
local l_DiscountType_0 = require(l_script_FirstAncestor_0.ProductPurchase.PricingTypes).DiscountType;
local v13 = require(l_script_FirstAncestor_0.Generic.DiscountRow);
local v14 = require(l_script_FirstAncestor_0.Generic.PriceLineItem);
local v15 = utf8.char(57346);
return function(v16) --[[ Line: 33 ]] --[[ Name: DiscountSummary ]]
    -- upvalues: l_LocalizationService_0 (copy), v11 (copy), v2 (copy), v13 (copy), v10 (copy), v15 (copy), v8 (copy), l_DiscountType_0 (copy), v14 (copy), l_View_0 (copy), l_Accordion_0 (copy), l_IconName_0 (copy), l_Divider_0 (copy)
    local l_itemPrice_0 = v16.itemPrice;
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local l_discounts_0 = l_itemPrice_0.discounts;
    local v20 = v11(l_itemPrice_0.basePriceInRobux);
    local v21 = v11(l_itemPrice_0.priceInRobux);
    local v26, v27 = v2.useMemo(function() --[[ Line: 41 ]]
        -- upvalues: l_discounts_0 (copy), v2 (ref), v13 (ref)
        local v22 = 0;
        local v23 = {};
        for v24, v25 in ipairs(l_discounts_0) do
            if v25.amountInRobux > 0 then
                v22 = v22 + v25.amountInRobux;
                v23["DiscountRow_" .. tostring(v24)] = v2.createElement(v13, {
                    discount = v25, 
                    LayoutOrder = v24 + 1
                });
            end;
        end;
        return v22, v23;
    end, {
        l_discounts_0
    });
    local v28 = v10({
        Subtotal = "IAPExperience.PurchasePrompt.Label.Subtotal", 
        Total = "IAPExperience.PurchasePrompt.Label.Total", 
        BlackbirdSummary = {
            "IAPExperience.PurchasePrompt.Label.BlackbirdSummary"; 
            robuxIcon = v15, 
            savingsAmount = v8(l_RobloxLocaleId_0, v26)
        }
    });
    local v31 = v2.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: l_discounts_0 (copy), l_DiscountType_0 (ref)
        for _, v30 in ipairs(l_discounts_0) do
            if v30.type == l_DiscountType_0.BlackbirdSubscription then
                return true;
            end;
        end;
        return false;
    end, {
        l_discounts_0
    });
    local v35 = v2.useMemo(function() --[[ Line: 76 ]]
        -- upvalues: v2 (ref), v14 (ref), v28 (copy), v20 (copy), v27 (copy)
        local v32 = {
            SubtotalRow = v2.createElement(v14, {
                label = v28.Subtotal, 
                amount = v20, 
                LayoutOrder = 1
            })
        };
        for v33, v34 in pairs(v27) do
            v32[v33] = v34;
        end;
        return v32;
    end, {
        v28.Subtotal, 
        v20, 
        v27
    });
    if not v31 or l_itemPrice_0.basePriceInRobux == l_itemPrice_0.priceInRobux then
        return nil;
    else
        return v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y stroke-default radius-medium padding-x-small"
        }, {
            AccordionContent = v2.createElement(l_Accordion_0.Root, {
                width = UDim.new(1, 0), 
                size = "Small"
            }, {
                SavingsItem = v2.createElement(l_Accordion_0.Item, {
                    leadingIcon = l_IconName_0.PaperAirplane, 
                    text = v28.BlackbirdSummary, 
                    id = "discount", 
                    isExpanded = false, 
                    hasDivider = false, 
                    LayoutOrder = 1
                }, v2.createElement(l_View_0, {
                    tag = "col size-full-0 auto-y gap-xsmall"
                }, {
                    BreakdownSection = v2.createElement(l_View_0, {
                        LayoutOrder = 1, 
                        tag = "col size-full-0 auto-y gap-xsmall padding-y-xsmall"
                    }, v35), 
                    BreakdownDivider = v2.createElement(l_Divider_0, {
                        LayoutOrder = 2
                    }), 
                    TotalRow = v2.createElement(v14, {
                        label = v28.Total, 
                        amount = v21, 
                        textStyle = "text-caption-medium", 
                        tag = "row size-full-0 auto-y align-y-center padding-x-xsmall padding-top-small", 
                        LayoutOrder = 3
                    })
                }))
            })
        });
    end;
end;