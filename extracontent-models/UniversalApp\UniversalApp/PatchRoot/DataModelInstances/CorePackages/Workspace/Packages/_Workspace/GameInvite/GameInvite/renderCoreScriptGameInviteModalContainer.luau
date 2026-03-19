local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent;
local l_Components_0 = l_Parent_0.Components;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactRodux);
local v6 = require(l_Parent_1.ReactRoblox);
local v7 = require(l_Parent_1.Style);
local v8 = require(l_Parent_1.UniversalAppPolicy);
local l_ApolloProvider_0 = require(l_Parent_1.ApolloClient).ApolloProvider;
local v10 = require(l_Parent_0.GameInviteConstants);
local v11 = require(l_Components_0.GameInviteModal);
local _ = require(l_Parent_0.gameInviteModalType);
local l_AppFeaturePolicies_0 = v8.AppFeaturePolicies;
local l_RoactAppPolicy_0 = v8.RoactAppPolicy;
local l_StyleProviderWithDefaultTheme_0 = v7.StyleProviderWithDefaultTheme;
local l_Localization_0 = require(l_Parent_1.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_1.Localization).LocalizationProvider;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_FoundationProvider_0 = require(l_Parent_1.Foundation).FoundationProvider;
game:DefineFastFlag("FixGameInviteModalLoadTimeIncrease", false);
local v20 = nil;
if not game:GetFastFlag("FixGameInviteModalLoadTimeIncrease") then
    v20 = require(l_Parent_1.RobloxApolloClient).initializeApolloClient({});
end;
return function(v21) --[[ Line: 34 ]]
    -- upvalues: l_Parent_0 (copy), l_CoreGui_0 (copy), v4 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v5 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_ApolloProvider_0 (copy), v20 (ref), v11 (copy), v10 (copy), v6 (copy), l_FoundationProvider_0 (copy)
    local v22 = require(l_Parent_0.State.GameInviteStore);
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "GameInvite";
    l_Folder_0.Parent = l_CoreGui_0;
    local v24 = v4.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        v4.createElement(v5.StoreProvider, {
            store = v22
        }, {
            PolicyProvider = v4.createElement(l_RoactAppPolicy_0.Provider, {
                policy = {
                    l_AppFeaturePolicies_0
                }
            }, {
                StyleProvider = v4.createElement(l_StyleProviderWithDefaultTheme_0, {}, {
                    ApolloClientProvider = v4.createElement(l_ApolloProvider_0, {
                        client = if game:GetFastFlag("FixGameInviteModalLoadTimeIncrease") then v21 else v20
                    }, {
                        GameInviteModalWrapper = v4.createElement(v11, {
                            displayOrder = -1, 
                            renderLocation = v10.RenderLocation.CoreScripts
                        })
                    })
                })
            })
        })
    });
    local v25 = v6.createRoot(l_Folder_0);
    v25:render(v4.createElement(l_FoundationProvider_0, nil, {
        v24
    }));
    return v25;
end;