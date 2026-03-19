local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_0.dependencies);
local v5 = require(l_Parent_0.ToastNotificationWrapper);
local l_React_0 = v4.React;
local l_ReactRoblox_0 = v4.ReactRoblox;
local _ = require(l_Parent_0.type);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_1.Style).StyleProviderWithDefaultTheme;
local v10 = require(l_Parent_1.Foundation);
local l_FoundationProvider_0 = v10.FoundationProvider;
local l_Localization_0 = require(l_Parent_1.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_1.Localization).LocalizationProvider;
local v14 = require(l_Parent_1.ReactFocusNavigation);
local v15 = v14.FocusNavigationService.new(v14.EngineInterface.CoreGui);
local l_Provider_0 = require(l_Parent_1.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider;
local v17 = require(script.Parent.InGameToastNotificationActionEventReceiver);
local v18 = require(script.Parent.receivers.SecurityAlertEventReceiver);
local l_game_EngineFeature_0 = game:GetEngineFeature("ClientToastNotificationsEnabled");
local l_GetFFlagEnableSecurityAlertToastCallback_0 = require(l_Parent_1.SharedFlags).GetFFlagEnableSecurityAlertToastCallback;
return function(v21) --[[ Line: 34 ]]
    -- upvalues: l_CoreGui_0 (copy), l_game_EngineFeature_0 (copy), l_React_0 (copy), l_FoundationProvider_0 (copy), v10 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v14 (copy), v15 (copy), l_Provider_0 (copy), v17 (copy), l_GetFFlagEnableSecurityAlertToastCallback_0 (copy), v18 (copy), v5 (copy), l_ReactRoblox_0 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "ToastNotification";
    l_Folder_0.Parent = l_CoreGui_0;
    local v23 = if l_game_EngineFeature_0 then l_React_0.createElement(l_FoundationProvider_0, {
        theme = v10.Enums.Theme.Dark
    }, {
        StyleProvider = l_React_0.createElement(l_StyleProviderWithDefaultTheme_0, {
            withUiModeSupport = false, 
            withDarkTheme = true
        }, {
            LocalizationProvider = l_React_0.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                FocusNavigationProvider = l_React_0.createElement(v14.FocusNavigationContext.Provider, {
                    value = v15
                }, {
                    FocusNavigationRegistryProvider = l_React_0.createElement(l_Provider_0, nil, {
                        l_React_0.createElement(v17); 
                        SecurityAlertEventReceiver = if l_GetFFlagEnableSecurityAlertToastCallback_0() then l_React_0.createElement(v18) else nil, 
                        ToastNotificationWrapper = l_React_0.createElement(v5, {
                            displayOrder = 13, 
                            renderLocation = v21.renderLocation
                        })
                    })
                })
            })
        })
    }) else l_React_0.createElement(l_StyleProviderWithDefaultTheme_0, {
        withUiModeSupport = false, 
        withDarkTheme = true
    }, {
        LocalizationProvider = l_React_0.createElement(l_LocalizationProvider_0, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            ToastNotificationWrapper = l_React_0.createElement(v5, {
                displayOrder = 13, 
                renderLocation = v21.renderLocation
            }), 
            InGameToastNotificationActionEventReceiver = l_React_0.createElement(v17)
        })
    });
    l_ReactRoblox_0.createRoot(l_Folder_0):render(v23);
end;