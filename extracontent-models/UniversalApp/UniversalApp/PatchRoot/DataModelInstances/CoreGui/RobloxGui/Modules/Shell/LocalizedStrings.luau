local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Locales_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell").Locales;
local v3 = require(l_Locales_0:FindFirstChild("en-us"));
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local l_FFlagAppShellMigrateLocales_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppShellMigrateLocales;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 18 ]]
    return game:GetService("LocalizationService").RobloxLocaleId;
end);
v7 = l_status_0;
v8 = l_result_0;
l_status_0 = {
    GetLocale = function(_) --[[ Line: 22 ]] --[[ Name: GetLocale ]]
        -- upvalues: l_FFlagAppShellMigrateLocales_0 (copy), l_Locales_0 (copy), v8 (ref), v7 (ref), v6 (ref), v3 (copy)
        if l_FFlagAppShellMigrateLocales_0 then
            error("Attempt to use GetLocale with FFlagAppShellMigrateLocales enabled");
        end;
        local l_l_Locales_0_FirstChild_0 = l_Locales_0:FindFirstChild(v8);
        if v7 and l_l_Locales_0_FirstChild_0 then
            v6 = require(l_l_Locales_0_FirstChild_0);
        end;
        if v6 == nil then
            v6 = v3;
        end;
        return v6;
    end, 
    LocString = function(v14, v15) --[[ Line: 40 ]] --[[ Name: LocString ]]
        -- upvalues: l_FFlagAppShellMigrateLocales_0 (copy), v6 (ref), v3 (copy)
        if l_FFlagAppShellMigrateLocales_0 then
            error("Attempt to use LocString with FFlagAppShellMigrateLocales enabled");
        end;
        local v16 = v6 and v6 or v14:GetLocale();
        return v16 and v16[v15] or v3[v15] or v15;
    end
};
l_status_0.LocalizedString = function(_, v18) --[[ Line: 57 ]] --[[ Name: LocalizedString ]]
    -- upvalues: l_FFlagAppShellMigrateLocales_0 (copy), l_status_0 (copy)
    if l_FFlagAppShellMigrateLocales_0 then
        error("Attempt to use LocalizedString with FFlagAppShellMigrateLocales enabled");
    end;
    v18 = "Xbox.Old." .. v18;
    return l_status_0:LocString(v18);
end;
l_status_0.LocStringUA = function(_, v20) --[[ Line: 68 ]] --[[ Name: LocStringUA ]]
    -- upvalues: v7 (ref), v9 (ref), l_Localization_0 (copy), v8 (ref)
    if v7 and not v9 then
        v9 = l_Localization_0.new(v8);
    else
        v9 = l_Localization_0.new("en-us");
    end;
    return v9.localizationContext:getString(v8, v20) or v20;
end;
return l_status_0;