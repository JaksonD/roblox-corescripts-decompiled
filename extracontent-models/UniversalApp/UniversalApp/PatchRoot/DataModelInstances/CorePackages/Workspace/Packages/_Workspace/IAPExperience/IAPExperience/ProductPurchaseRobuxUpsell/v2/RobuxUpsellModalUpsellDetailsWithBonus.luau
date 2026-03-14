local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_useLocalization_0 = require(l_Parent_1.Localization).Hooks.useLocalization;
local v8 = require(l_Parent_0.Utility.formatNumber);
local _ = require(l_Parent_0.Api.PaymentsGateway.GetUpsellSuggestionsTypes);
local _ = require(l_Parent_0.Enums.BadgeType);
local _ = require(l_Parent_0.Enums.VirtualItemBadgeType);
return function(v12) --[[ Line: 33 ]] --[[ Name: RobuxUpsellModalUpsellDetailsWithBonus ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), v8 (copy), l_LocalizationService_0 (copy)
    local v13 = l_useLocalization_0({
        MoreRobux = "IAPExperience.RobuxUpsell.Text.MoreRobux", 
        Bonus = "IAPExperience.RobuxUpsell.Text.Bonus"
    });
    return v2.createElement(l_View_0, {
        LayoutOrder = v12.layoutOrder, 
        tag = "flex-x-between\tflex-y-fill size-full-1700 radius-medium padding-x-large padding-y-medium row bg-surface-300 stroke-emphasis stroke-standard"
    }, {
        LeftSide = v2.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = "auto-xy col align-y-top align-x-left gap-small"
        }, {
            BonusLabel = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = v13.MoreRobux, 
                tag = "auto-xy text-label-small content-default"
            }), 
            RobuxAmount = v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = utf8.char(57346) .. " " .. v8(l_LocalizationService_0.RobloxLocaleId, v12.robuxAmount) .. " + " .. v8(l_LocalizationService_0.RobloxLocaleId, v12.bonusAmount) .. " " .. v13.Bonus, 
                tag = "auto-xy text-title-large content-emphasis text-align-x-left"
            })
        }), 
        RightSide = v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "auto-xy row align-y-center align-x-right"
        }, {
            RobuxPrice = v2.createElement(l_Text_0, {
                Text = v12.priceString or "", 
                tag = "auto-xy text-title-large content-emphasis text-align-x-right"
            })
        })
    });
end;