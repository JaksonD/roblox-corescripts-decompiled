local l_CorePackages_0 = game:GetService("CorePackages");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v2 = require(l_CorePackages_0.Packages.Foundation);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.SignalsReact);
local l_Analytics_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics;
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v7 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales);
local v8 = require(l_CorePackages_0.Workspace.Packages.Localization);
local l_ServiceProvider_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices.ServiceProvider;
local v10 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_Parent_0 = script.Parent;
local v12 = require(l_Parent_0.Integrations.Utils);
local l_AppEventIngestService_0 = v10.AppEventIngestService;
local l_RoactAnalytics_0 = v10.RoactAnalytics;
local l_LocalizationProvider_0 = v8.LocalizationProvider;
local l_GetLocalizationServiceStore_0 = v8.GetLocalizationServiceStore;
local l_Localization_0 = v7.Localization;
local l_FoundationProvider_0 = v2.FoundationProvider;
local v19 = {
    theme = v2.Enums.Theme.Dark
};
return v3.memo(function(v20) --[[ Line: 38 ]] --[[ Name: InExperienceMenuReact ]]
    -- upvalues: l_GetLocalizationServiceStore_0 (copy), v4 (copy), l_Localization_0 (copy), v3 (copy), l_ServiceProvider_0 (copy), l_AppEventIngestService_0 (copy), l_EventIngest_0 (copy), l_EventIngestService_0 (copy), l_RoactAnalytics_0 (copy), l_Analytics_0 (copy), l_LocalizationProvider_0 (copy), l_FoundationProvider_0 (copy), v19 (copy), v12 (copy)
    local v21 = l_GetLocalizationServiceStore_0(false);
    local v22 = v4.useSignalState(v21.getRobloxLocaleId);
    local v23 = l_Localization_0.new(v22);
    return v3.createElement(l_ServiceProvider_0, {
        services = {
            [l_AppEventIngestService_0] = l_EventIngest_0.new(l_EventIngestService_0), 
            [l_RoactAnalytics_0] = l_Analytics_0.new()
        }
    }, {
        LocalizationProvider = v3.createElement(l_LocalizationProvider_0, {
            localization = v23
        }, {
            FoundationProvider = v3.createElement(l_FoundationProvider_0, {
                theme = v20.theme or v19.theme, 
                device = v12.getDeviceType()
            }, v20.children)
        })
    });
end);