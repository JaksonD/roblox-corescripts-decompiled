local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v8 = require(script.Components.FTUXPanel);
local v9 = require(script.Features.GetFeatures);
local _ = require(script.Enums.PlatformEnum);
return {
    mountFtuxMenu = function(v11) --[[ Line: 22 ]] --[[ Name: mountFtuxMenu ]]
        -- upvalues: v3 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v5 (copy), v8 (copy), v9 (copy), l_CoreGui_0 (copy)
        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
        game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false);
        local v12 = v3.createElement(l_LocalizationProvider_0, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            FTUXMenu = v3.createElement("ScreenGui", {}, {
                ThemeProvider = v5({
                    FtuxPanel = v3.createElement(v8, {
                        platform = v11
                    }, {})
                })
            })
        });
        v9(v11);
        v3.mount(v12, l_CoreGui_0, "FTUXMenu");
    end
};