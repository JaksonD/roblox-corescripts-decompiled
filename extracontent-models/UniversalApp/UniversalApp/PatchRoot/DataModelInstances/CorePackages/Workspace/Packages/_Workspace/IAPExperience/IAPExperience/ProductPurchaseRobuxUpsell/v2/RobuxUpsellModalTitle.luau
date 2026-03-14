local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_Text_0 = v3.Text;
local l_IconButton_0 = v3.IconButton;
local l_IconSize_0 = v3.Enums.IconSize;
local l_View_0 = v3.View;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_useLocalization_0 = require(l_Parent_1.Localization).Hooks.useLocalization;
local v10 = require(l_Parent_0.Utility.formatNumber);
return function(v11) --[[ Line: 25 ]] --[[ Name: RobuxUpsellModalTitle ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), v10 (copy), l_LocalizationService_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy)
    local v12 = l_useLocalization_0({
        NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux", 
        CurrentBalance = "IAPExperience.InsufficientRobux.Text.CurrentBalance"
    });
    return v2.createElement(l_View_0, {
        padding = {
            right = UDim.new(0, -12), 
            left = UDim.new(0, -12)
        }, 
        tag = "size-full-300"
    }, {
        TitleArea = v2.createElement(l_View_0, {
            tag = "col gap-xsmall size-full align-x-center"
        }, {
            Title = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v12.NeedMoreRobux, 
                tag = "auto-xy text-heading-small content-emphasis"
            }), 
            SubTitle = v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v12.CurrentBalance .. " " .. utf8.char(57346) .. v10(l_LocalizationService_0.RobloxLocaleId, v11.balanceAmount), 
                tag = "auto-xy text-body-medium content-default"
            })
        }), 
        CloseButton = v2.createElement(l_IconButton_0, {
            size = l_IconSize_0.Medium, 
            icon = "icons/navigation/close", 
            onActivated = v11.cancelPurchaseActivated
        })
    });
end;