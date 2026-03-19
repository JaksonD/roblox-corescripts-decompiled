local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v7 = require(l_Parent_0.Utility.formatNumber);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local v9 = require(l_Parent_0.Generic.Hooks.useRobuxText);
return function(v10) --[[ Line: 28 ]] --[[ Name: UnifiedPurchaseModalHeader ]]
    -- upvalues: v2 (copy), v7 (copy), l_LocalizationService_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v9 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v11 = v2.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: v7 (ref), l_LocalizationService_0 (ref), v10 (copy)
        return utf8.char(57346) .. " " .. v7(l_LocalizationService_0.RobloxLocaleId, v10.robuxBalanceAmount or 0);
    end, {
        v10.robuxBalanceAmount, 
        l_LocalizationService_0.RobloxLocaleId
    });
    if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
        v11 = v9(v10.robuxBalanceAmount or 0);
    end;
    return v2.createElement(l_View_0, {
        tag = "auto-xy align-y-center align-x-start row"
    }, {
        LeftSide = v2.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = "row gap-small align-y-center align-x-start", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            RobuxAmount = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = v10.titleText, 
                tag = "auto-xy text-heading-small content-default text-align-x-left"
            })
        }), 
        RightSide = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and v10.hideUserRobuxBalance then nil else v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "row align-y-center align-x-right gap-large", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            RobuxPrice = v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v11, 
                tag = "auto-xy text-label-medium content-emphasis text-align-x-right", 
                RichText = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and true or nil
            })
        })
    });
end;