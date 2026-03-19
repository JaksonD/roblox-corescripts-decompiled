local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_Analytics_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics;
local v5 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.Foundation);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_ServiceProvider_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices.ServiceProvider;
local v12 = require(l_CorePackages_0.Workspace.Packages.Style);
local v13 = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry);
local l_FoundationProvider_0 = v8.FoundationProvider;
local l_AppEventIngestService_0 = v5.AppEventIngestService;
local l_RoactAnalytics_0 = v5.RoactAnalytics;
local l_StyleProviderWithDefaultTheme_0 = v12.StyleProviderWithDefaultTheme;
local v18 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
local v19 = v3.FocusNavigationService.new(v3.EngineInterface.CoreGui);
return function(v20) --[[ Line: 29 ]]
    -- upvalues: v7 (copy), l_ServiceProvider_0 (copy), l_AppEventIngestService_0 (copy), l_EventIngest_0 (copy), l_EventIngestService_0 (copy), l_RoactAnalytics_0 (copy), l_Analytics_0 (copy), l_LocalizationProvider_0 (copy), v18 (copy), l_FoundationProvider_0 (copy), v3 (copy), v19 (copy), v13 (copy), l_StyleProviderWithDefaultTheme_0 (copy)
    return v7.createElement(l_ServiceProvider_0, {
        services = {
            [l_AppEventIngestService_0] = l_EventIngest_0.new(l_EventIngestService_0), 
            [l_RoactAnalytics_0] = l_Analytics_0.new()
        }
    }, {
        localizationProvider = v7.createElement(l_LocalizationProvider_0, {
            localization = v18
        }, {
            foundationProvider = v7.createElement(l_FoundationProvider_0, nil, {
                FocusNavigationProvider = v7.createElement(v3.FocusNavigationContext.Provider, {
                    value = v19
                }, if v13 then v20.children else {
                    uiBloxStyleProvider = v7.createElement(l_StyleProviderWithDefaultTheme_0, nil, v20.children)
                })
            })
        })
    });
end;