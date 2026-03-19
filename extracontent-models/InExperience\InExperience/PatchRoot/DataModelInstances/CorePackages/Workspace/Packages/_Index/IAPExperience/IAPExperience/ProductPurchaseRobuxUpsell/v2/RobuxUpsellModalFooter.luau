local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function() --[[ Line: 16 ]] --[[ Name: RobuxUpsellModalFooter ]]
    -- upvalues: l_useLocalization_0 (copy), l_useTokens_0 (copy), v1 (copy), l_Text_0 (copy)
    local v6 = l_useLocalization_0({
        DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment", 
        DisclosureTerms = "IAPExperience.RobuxUpsell.Text.DisclosureTerms"
    });
    local v7 = l_useTokens_0();
    return v1.createElement(l_Text_0, {
        Text = v6.DisclosurePayment .. " " .. v6.DisclosureTerms, 
        tag = "content-muted text-caption-small size-full align-x-center padding-top-small"
    }, {
        UITextSizeConstraint = v1.createElement("UITextSizeConstraint", {
            MaxTextSize = v7.Typography.CaptionSmall.FontSize
        })
    });
end;