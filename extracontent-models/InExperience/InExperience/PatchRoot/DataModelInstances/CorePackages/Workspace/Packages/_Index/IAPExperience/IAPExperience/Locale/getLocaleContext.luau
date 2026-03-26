local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Flags.FFlagIAPExperienceUseAppLocales);
local l_Locales_0 = game:GetService("CoreGui").RobloxGui.Modules.Common:FindFirstChild("Locales");
return function(v3) --[[ Line: 13 ]] --[[ Name: getLocaleContent ]]
    -- upvalues: v1 (copy), l_Locales_0 (copy)
    if v1 then
        error("getLocaleContext is deprecated. Use RobloxAppLocales.Localization instead.");
    end;
    local l_l_Locales_0_FirstChild_0 = l_Locales_0:FindFirstChild(v3);
    if l_l_Locales_0_FirstChild_0 ~= nil then
        return {
            locale = v3, 
            translations = require(l_l_Locales_0_FirstChild_0), 
            fallbackTranslations = require(l_Locales_0:FindFirstChild("en-us"))
        };
    else
        local l_l_Locales_0_FirstChild_1 = l_Locales_0:FindFirstChild("en-us");
        return {
            locale = "en-us", 
            translations = require(l_l_Locales_0_FirstChild_1)
        };
    end;
end;