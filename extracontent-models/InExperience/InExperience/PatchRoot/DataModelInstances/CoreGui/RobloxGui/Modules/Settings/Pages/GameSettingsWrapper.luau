local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules;
local v3 = require(l_CorePackages_0.Packages.BuilderIcons);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.ReactRoblox);
local v7 = require(l_Modules_0.Settings.Flags);
local v8 = require(l_Modules_0.Settings.SettingsPageFactory);
local l_FFlagRefactorInExpSettingsInDevelopment_0 = v7.FFlagRefactorInExpSettingsInDevelopment;
local v10 = nil;
local v11 = nil;
local v12 = nil;
if l_FFlagRefactorInExpSettingsInDevelopment_0 then
    v10 = require(l_Modules_0.Settings.Integrations);
    v11 = v10.Utils;
    v12 = v10.Constants;
end;
local l_FoundationProvider_0 = v4.FoundationProvider;
local l_Migration_0 = v3.Migration;
local function v18() --[[ Line: 27 ]] --[[ Name: createGameSettings ]]
    -- upvalues: v8 (copy), v12 (ref), l_Migration_0 (copy), v3 (copy), v5 (copy), l_FoundationProvider_0 (copy), v4 (copy), v11 (ref), v6 (copy)
    local l_v8_NewPage_0 = v8:CreateNewPage();
    l_v8_NewPage_0.TabHeader.Name = v12.GAMESETTINGS.TAB_HEADER.NAME;
    local v16 = l_Migration_0.uiblox["icons/common/settings"];
    l_v8_NewPage_0.TabHeader.TabLabel.Icon.Text = v16.name;
    l_v8_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v3.Font[v16.variant];
    l_v8_NewPage_0.TabHeader.TabLabel.Title.Text = v12.GAMESETTINGS.TAB_HEADER.TEXT;
    l_v8_NewPage_0.Page:ClearAllChildren();
    l_v8_NewPage_0.PageOpen = false;
    l_v8_NewPage_0.OpenSettingsPage = function() --[[ Line: 41 ]]
        -- upvalues: l_v8_NewPage_0 (copy)
        l_v8_NewPage_0.PageOpen = true;
    end;
    l_v8_NewPage_0.CloseSettingsPage = function() --[[ Line: 44 ]]
        -- upvalues: l_v8_NewPage_0 (copy)
        l_v8_NewPage_0.PageOpen = false;
    end;
    local v17 = v5.createElement(l_FoundationProvider_0, {
        theme = v4.Enums.Theme.Dark, 
        device = v11.getDeviceType()
    }, {});
    v6.createRoot(l_v8_NewPage_0.Page):render(v17);
    return l_v8_NewPage_0;
end;
if l_FFlagRefactorInExpSettingsInDevelopment_0 then
    return (v18());
else
    return require(l_Modules_0.Settings.Pages.GameSettings);
end;