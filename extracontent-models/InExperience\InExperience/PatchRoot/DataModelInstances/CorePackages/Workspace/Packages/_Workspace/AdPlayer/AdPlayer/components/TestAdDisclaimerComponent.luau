local l_Parent_0 = script:FindFirstAncestor("AdPlayer").Parent;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_Text_0 = v3.Text;
local v6 = {
    eligibleDisclaimer = "CoreScripts.Ads.Label.RewardedVideoEligibleDisclaimer", 
    ineligibleDisclaimer = "CoreScripts.Ads.Label.RewardedVideoIneligibleDisclaimer"
};
return function(v7) --[[ Line: 18 ]] --[[ Name: TestAdDisclaimerComponent ]]
    -- upvalues: l_useLocalization_0 (copy), v6 (copy), l_useTokens_0 (copy), v2 (copy), l_Text_0 (copy)
    local v8 = l_useLocalization_0(v6);
    local v9 = l_useTokens_0();
    return v2.createElement(l_Text_0, {
        tag = "bg-over-media-0 padding-medium radius-medium auto-xy text-body-large anchor-top-center", 
        Position = UDim2.new(0.5, 0, 0, v9.Gap.XLarge), 
        Text = if v7.isEligible then v8.eligibleDisclaimer else v8.ineligibleDisclaimer
    });
end;