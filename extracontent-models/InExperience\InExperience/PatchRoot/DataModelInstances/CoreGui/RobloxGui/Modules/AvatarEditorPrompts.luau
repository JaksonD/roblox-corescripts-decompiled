local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.Rodux);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v10 = require(l_CorePackages_0.Packages.Foundation);
local v11 = require(script.Components.AvatarEditorPromptsApp);
local v12 = require(script.Reducer);
local v13 = require(script.Thunks.GetGameName);
local v14 = require(script.AvatarEditorPromptsPolicy);
local v15 = require(script.RoactGlobalConfig);
local v16 = require(script.ConnectAvatarEditorServiceEvents);
local l_FFlagAXAvatarTimeoutFlowIE_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE;
local v18 = {};
v18.__index = v18;
v18.new = function() --[[ Line: 33 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), v15 (copy), v5 (copy), v6 (copy), v12 (copy), v13 (copy), l_FFlagAXAvatarTimeoutFlowIE_0 (copy), v7 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v10 (copy), v14 (copy), v4 (copy), v11 (copy), l_CoreGui_0 (copy), v16 (copy)
    local v19 = setmetatable({}, v18);
    if v15.propValidation then
        v5.setGlobalConfig({
            propValidation = true
        });
    end;
    if v15.elementTracing then
        v5.setGlobalConfig({
            elementTracing = true
        });
    end;
    v19.store = v6.Store.new(v12, nil, {
        v6.thunkMiddleware
    });
    v19.store:dispatch(v13);
    local v20 = nil;
    v20 = if l_FFlagAXAvatarTimeoutFlowIE_0 then v5.createElement(v7.StoreProvider, {
        store = v19.store
    }, {
        LocalizationProvider = v5.createElement(l_LocalizationProvider_0, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            FoundationProvider = v5.createElement(v10.FoundationProvider, {
                theme = v10.Enums.Theme.Dark
            }, {
                PolicyProvider = v5.createElement(v14.Provider, {
                    policy = {
                        v14.Mapper
                    }
                }, {
                    ThemeProvider = v4({
                        AvatarEditorPromptsApp = v5.createElement(v11)
                    })
                })
            })
        })
    }) else v5.createElement(v7.StoreProvider, {
        store = v19.store
    }, {
        PolicyProvider = v5.createElement(v14.Provider, {
            policy = {
                v14.Mapper
            }
        }, {
            ThemeProvider = v4({
                AvatarEditorPromptsApp = v5.createElement(v11)
            })
        })
    });
    v19.root = v5.createElement("Folder", {
        Name = "AvatarEditorPromptsApp"
    }, v20);
    v19.element = v5.mount(v19.root, l_CoreGui_0, "AvatarEditorPrompts");
    v19.serviceConnections = v16(v19.store);
    return v19;
end;
return v18.new();