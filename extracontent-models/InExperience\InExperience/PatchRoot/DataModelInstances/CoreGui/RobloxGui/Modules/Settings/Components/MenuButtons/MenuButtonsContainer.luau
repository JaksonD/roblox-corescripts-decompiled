local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Packages.Signals);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v6 = require(l_CorePackages_0.Packages.Foundation);
local l_FoundationProvider_0 = v6.FoundationProvider;
local v8 = require(script.Parent.MenuButtons);
return function(v9) --[[ Line: 26 ]] --[[ Name: Container ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), v2 (copy), l_LocalizationProvider_0 (copy), l_FoundationProvider_0 (copy), v6 (copy), v8 (copy)
    local v10 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    return v2.createElement(l_LocalizationProvider_0, {
        localization = v10
    }, {
        FoundationProvider = v2.createElement(l_FoundationProvider_0, {
            theme = v6.Enums.Theme.Dark
        }, {
            MenuButtons = v2.createElement(v8, v9)
        })
    });
end;