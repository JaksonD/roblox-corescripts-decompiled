local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("AdPlayer").Parent;
local v2 = require(l_Parent_0.React);
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v6 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
return function(v7) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), v6 (copy), l_FoundationProvider_0 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = v6
    }, {
        foundationProvider = v2.createElement(l_FoundationProvider_0, {}, v7.children)
    });
end;