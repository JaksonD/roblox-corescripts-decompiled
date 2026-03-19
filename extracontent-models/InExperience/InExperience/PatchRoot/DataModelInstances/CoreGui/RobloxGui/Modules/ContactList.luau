local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(script.Parent.Common.renderWithCoreScriptsStyleProvider);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.Rodux);
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(l_CorePackages_0.Workspace.Packages.CallProtocol);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_ApolloProvider_0 = require(l_CorePackages_0.Packages.ApolloClient).ApolloProvider;
local v13 = require(l_RobloxGui_0.Modules.ApolloClient);
local v14 = require(script.initCall);
local v15 = require(script.Reducer);
local v16 = require(script.Components.ContactListApp);
local v17 = require(script.Context);
local v18 = require(script.Analytics);
local v19 = {};
v19.__index = v19;
v19.new = function() --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: v19 (copy), v18 (copy), v14 (copy), v9 (copy), v5 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v6 (copy), v15 (copy), v8 (copy), v4 (copy), l_ApolloProvider_0 (copy), v13 (copy), v7 (copy), v17 (copy), v16 (copy), l_CoreGui_0 (copy)
    local v20 = setmetatable({}, v19);
    local v21 = {
        fireAnalyticsEvent = v18.Analytics().fireAnalyticsEvent
    };
    v14(v9.CallProtocol.default);
    local function v23(v22) --[[ Line: 46 ]]
        -- upvalues: v5 (ref), l_LocalizationProvider_0 (ref), l_Localization_0 (ref), l_LocalizationService_0 (ref)
        return v5.createElement(l_LocalizationProvider_0, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            App = v22
        });
    end;
    v20.store = v6.Store.new(v15, nil, {
        v6.thunkMiddleware
    });
    v20.root = v5.createElement("ScreenGui", {
        AutoLocalize = false, 
        DisplayOrder = -1, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        Content = v5.createElement(v8.StoreProvider, {
            store = v20.store
        }, {
            ThemeProvider = v4({
                ApolloProvider = v5.createElement(l_ApolloProvider_0, {
                    client = v13
                }, {
                    ContextProvider = v7.createElement(v17.Provider, {
                        value = v21
                    }, {
                        ContactListApp = v23(v5.createElement(v16))
                    })
                })
            })
        })
    });
    v20.element = v7.mount(v20.root, l_CoreGui_0, "ContactList");
    return v20;
end;
return v19.new();