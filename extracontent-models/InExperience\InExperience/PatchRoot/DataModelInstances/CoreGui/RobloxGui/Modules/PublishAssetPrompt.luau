local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(script.Parent.Common.renderWithCoreScriptsStyleProvider);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.Rodux);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(script.Components.PublishAssetPromptApp);
local v10 = require(script.Reducer);
local v11 = require(script.ConnectAssetServiceEvents);
local v12 = {};
v12.__index = v12;
v12.new = function() --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy), v6 (copy), v9 (copy), v7 (copy), v10 (copy), v8 (copy), v3 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_CoreGui_0 (copy), v11 (copy)
    local v13 = setmetatable({}, v12);
    local v14 = v6.createElement(v9);
    v13.store = v7.Store.new(v10, nil, {
        v7.thunkMiddleware
    });
    local v15 = v6.createElement(v8.StoreProvider, {
        store = v13.store
    }, {
        ThemeProvider = v3({
            LocalizationProvider = v6.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                PublishAssetPromptApp = v14
            })
        })
    });
    v13.root = v6.createElement("Folder", {
        Name = "PublishAssetPrompt"
    }, v15);
    v13.element = v6.mount(v13.root, l_CoreGui_0, "PublishAssetPrompt");
    v13.serviceConnections = v11(v13.store);
    return v13;
end;
return v12.new();