local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent;
local l_NumberLocalization_0 = require(l_Parent_0.Localization).NumberLocalization;
local l_LocalizationService_0 = game:GetService("LocalizationService");
return function(v3) --[[ Line: 10 ]] --[[ Name: formatNumber ]]
    -- upvalues: l_NumberLocalization_0 (copy), l_LocalizationService_0 (copy)
    local v4 = string.format("%.0f", v3 or 0);
    return l_NumberLocalization_0.localize(v4, l_LocalizationService_0.RobloxLocaleId);
end;