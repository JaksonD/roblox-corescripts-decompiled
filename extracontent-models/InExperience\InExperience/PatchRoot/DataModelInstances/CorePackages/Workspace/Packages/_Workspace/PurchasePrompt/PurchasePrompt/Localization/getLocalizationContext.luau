local l_Locales_0 = game:GetService("CoreGui").RobloxGui.Modules.Common:FindFirstChild("Locales");
return function(v1) --[[ Line: 8 ]] --[[ Name: getLocalizationContext ]]
    -- upvalues: l_Locales_0 (copy)
    local l_l_Locales_0_FirstChild_0 = l_Locales_0:FindFirstChild(v1);
    if l_l_Locales_0_FirstChild_0 ~= nil then
        return {
            locale = v1, 
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