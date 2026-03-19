local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Locales_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell").Locales;
local v3 = require(l_Locales_0:FindFirstChild("en-us"));
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 15 ]]
    return game:GetService("LocalizationService").RobloxLocaleId;
end);
v6 = l_status_0;
v7 = l_result_0;
l_status_0 = {
    GetLocale = function(_) --[[ Line: 19 ]] --[[ Name: GetLocale ]]
        -- upvalues: l_Locales_0 (copy), v7 (ref), v6 (ref), v5 (ref), v3 (copy)
        local l_l_Locales_0_FirstChild_0 = l_Locales_0:FindFirstChild(v7);
        if v6 and l_l_Locales_0_FirstChild_0 then
            v5 = require(l_l_Locales_0_FirstChild_0);
        end;
        if v5 == nil then
            v5 = v3;
        end;
        return v5;
    end, 
    LocString = function(v13, v14) --[[ Line: 32 ]] --[[ Name: LocString ]]
        -- upvalues: v5 (ref), v3 (copy)
        local v15 = v5 and v5 or v13:GetLocale();
        return v15 and v15[v14] or v3[v14] or v14;
    end
};
l_status_0.LocalizedString = function(_, v17) --[[ Line: 44 ]] --[[ Name: LocalizedString ]]
    -- upvalues: l_status_0 (copy)
    v17 = "Xbox.Old." .. v17;
    return l_status_0:LocString(v17);
end;
l_status_0.LocStringUA = function(_, v19) --[[ Line: 50 ]] --[[ Name: LocStringUA ]]
    -- upvalues: v6 (ref), v8 (ref), l_Localization_0 (copy), v7 (ref)
    if v6 and not v8 then
        v8 = l_Localization_0.new(v7);
    else
        v8 = l_Localization_0.new("en-us");
    end;
    return v8.localizationContext:getString(v7, v19) or v19;
end;
return l_status_0;