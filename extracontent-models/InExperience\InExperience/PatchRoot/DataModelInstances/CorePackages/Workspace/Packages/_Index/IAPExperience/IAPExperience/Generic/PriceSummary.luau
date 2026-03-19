local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local v6 = require(l_Parent_0.Utility.formatNumber);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_useLocalization_0 = require(l_Parent_1.Localization).Hooks.useLocalization;
local v9 = require(l_Parent_0.Generic.Hooks.useRobuxText);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local v11 = require(l_Parent_0.Flags.FFlagUnifiedPurchaseFlowLowercaseTotalPrice);
local _ = require(l_Parent_0.ProductPurchase.PricingTypes);
return function(v13) --[[ Line: 31 ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v11 (copy), v2 (copy), v6 (copy), l_LocalizationService_0 (copy), v9 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v14 = if v13.itemPrice then v13.itemPrice.priceInRobux else v13.amount;
    local v15 = l_useLocalization_0({
        Total = "Feature.Catalog.Label.TotalUnformatted", 
        TotalPrice = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v11 and "IAPExperience.PurchasePrompt.Label.TotalPriceV2" or "IAPExperience.PurchasePrompt.Label.TotalPrice" else nil
    });
    local v16 = v2.useMemo(function() --[[ Line: 42 ]]
        -- upvalues: v6 (ref), l_LocalizationService_0 (ref), v14 (copy)
        return utf8.char(57346) .. " " .. v6(l_LocalizationService_0.RobloxLocaleId, v14 or 0);
    end, {
        v14, 
        l_LocalizationService_0.RobloxLocaleId
    });
    if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
        v16 = v9(v14);
    end;
    return v2.createElement(l_View_0, {
        tag = "size-full-1300 padding-left-xxsmall padding-right-xxsmall padding-top-small padding-bottom-large"
    }, {
        BorderContainer = v2.createElement(l_View_0, {
            tag = "auto-xy align-y-center align-x-center radius-medium padding-x-large row stroke-default padding-y-xsmall"
        }, {
            LeftSide = v2.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = "row gap-small align-y-center align-x-start padding-y-xsmall", 
                Size = UDim2.new(0.5, 0, 1, 0)
            }, {
                RobuxAmount = v2.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    Text = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v15.TotalPrice else v15.Total, 
                    tag = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "auto-xy text-title-medium content-default text-align-x-left padding-y-xsmall" or "auto-xy text-label-medium content-default text-align-x-left padding-y-xsmall"
                })
            }), 
            RightSide = v2.createElement(l_View_0, {
                LayoutOrder = 2, 
                tag = "row align-y-center align-x-right gap-large padding-y-xsmall", 
                Size = UDim2.new(0.5, 0, 1, 0)
            }, {
                RobuxPrice = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v2.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    Text = v16, 
                    tag = "auto-xy text-title-medium content-emphasis text-align-x-right padding-y-xsmall", 
                    RichText = true
                }) else v2.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    Text = v16, 
                    tag = "auto-xy text-label-medium content-emphasis text-align-x-right padding-y-xsmall"
                })
            })
        })
    });
end;