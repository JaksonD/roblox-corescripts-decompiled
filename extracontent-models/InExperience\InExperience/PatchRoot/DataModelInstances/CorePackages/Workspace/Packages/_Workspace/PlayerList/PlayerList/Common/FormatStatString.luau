local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Localization);
local l_NumberLocalization_0 = v2.NumberLocalization;
local l_RoundingBehaviour_0 = v2.RoundingBehaviour;
return function(v5) --[[ Line: 12 ]]
    -- upvalues: l_NumberLocalization_0 (copy), l_LocalizationService_0 (copy), l_RoundingBehaviour_0 (copy)
    if v5 == nil then
        return "-";
    elseif type(v5) == "number" then
        if tostring(v5):len() >= 7 then
            return l_NumberLocalization_0.abbreviate(v5, l_LocalizationService_0.RobloxLocaleId, l_RoundingBehaviour_0.Truncate);
        else
            return l_NumberLocalization_0.localize(v5, l_LocalizationService_0.RobloxLocaleId);
        end;
    else
        return (tostring(v5));
    end;
end;