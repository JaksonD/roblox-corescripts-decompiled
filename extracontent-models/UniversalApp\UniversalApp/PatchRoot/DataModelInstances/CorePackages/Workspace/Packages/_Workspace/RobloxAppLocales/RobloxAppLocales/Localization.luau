local l_Parent_0 = script:FindFirstAncestor("RobloxAppLocales").Parent;
local l_LocalizationContext_0 = require(l_Parent_0.Localization).LocalizationContext;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local l_Locales_0 = game:GetService("CoreGui").RobloxGui.Modules.Common:FindFirstChild("Locales");
local function v10(v4) --[[ Line: 30 ]] --[[ Name: loadTables ]]
    -- upvalues: l_Locales_0 (copy), l_LocalizationContext_0 (copy)
    if not l_Locales_0 then
        error("ERROR: Locales tables does not exist");
    end;
    local v5 = l_LocalizationContext_0.getRelevantLanguages(v4);
    local v6 = {};
    for _, v8 in ipairs(v5) do
        local l_l_Locales_0_FirstChild_0 = l_Locales_0:FindFirstChild(v8);
        if l_l_Locales_0_FirstChild_0 then
            v6[v8] = require(l_l_Locales_0_FirstChild_0);
        end;
    end;
    return v6;
end;
local v11 = {};
v11.__index = v11;
v11.new = function(v12) --[[ Line: 49 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), l_LocalizationContext_0 (copy), v10 (copy), v11 (copy)
    local v13 = {
        locale = v12, 
        changed = l_Signal_0.new(), 
        localizationContext = l_LocalizationContext_0.new((v10(v12)))
    };
    setmetatable(v13, v11);
    return v13;
end;
v11.SetLocale = function(v14, v15) --[[ Line: 59 ]] --[[ Name: SetLocale ]]
    -- upvalues: v10 (copy)
    v14.locale = v15;
    local v16 = v10(v15);
    v14.localizationContext:addTranslations(v16);
    v14.changed:fire();
end;
v11.GetLocale = function(v17) --[[ Line: 66 ]] --[[ Name: GetLocale ]]
    return v17.locale;
end;
v11.Format = function(v18, v19, v20) --[[ Line: 70 ]] --[[ Name: Format ]]
    if not v19 then
        error("ERROR: NO STRING FOR KEY");
    end;
    return (v18.localizationContext:getString(v18.locale, v19, v20));
end;
return v11;