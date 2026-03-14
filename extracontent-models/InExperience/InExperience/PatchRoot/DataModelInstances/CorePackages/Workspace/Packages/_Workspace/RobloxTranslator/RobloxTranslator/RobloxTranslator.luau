local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent.Parent;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local v3 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
return {
    FormatByKey = function(_, v5, v6) --[[ Line: 14 ]] --[[ Name: FormatByKey ]]
        -- upvalues: v3 (copy)
        return v3:Format(v5, v6);
    end, 
    FormatByKeyForLocale = function(_, v8, v9, v10) --[[ Line: 18 ]] --[[ Name: FormatByKeyForLocale ]]
        -- upvalues: l_Localization_0 (copy)
        return l_Localization_0.new(v9):Format(v8, v10);
    end
};