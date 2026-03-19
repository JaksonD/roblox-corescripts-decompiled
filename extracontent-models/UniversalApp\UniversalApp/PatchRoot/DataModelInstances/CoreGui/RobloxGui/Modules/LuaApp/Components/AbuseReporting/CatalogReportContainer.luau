local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportComingSoonPrompt);
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v6 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportDialogController);
local v7 = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local v9 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportAnalytics);
local l_GetFFlagLuafiedReportFullFlow_0 = v5.GetFFlagLuafiedReportFullFlow;
local l_GetFFlagVRAbuseReportLocales_0 = v5.GetFFlagVRAbuseReportLocales;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
return (v13(function() --[[ Line: 20 ]]
    -- upvalues: l_useNavigation_0 (copy), v3 (copy), v9 (copy), v14 (copy), v7 (copy), l_GetFFlagLuafiedReportFullFlow_0 (copy), v6 (copy), l_GetFFlagVRAbuseReportLocales_0 (copy), l_LocalizationService_0 (copy), v4 (copy)
    local v15 = l_useNavigation_0();
    local v16, v17 = v3.useReducer(v9.reportAnalyticsReducer, v9.EMPTY_LOGGING_STATE);
    local function v18() --[[ Line: 25 ]]
        -- upvalues: v14 (ref), v15 (copy)
        v14.closeOverlay(v15);
    end;
    local v19 = v3.useCallback(function() --[[ Line: 29 ]]
        -- upvalues: v9 (ref), v16 (copy), v7 (ref)
        v9.sendEventData(v16, v7.ANALYTICS_EVENT_NAMES.ABANDONED);
    end, {
        v17, 
        v16
    });
    local v20 = v3.useCallback(function() --[[ Line: 33 ]]
        -- upvalues: v17 (copy), v9 (ref)
        v17({
            type = v9.ActionTypes.SET_IS_SEEN_SUMMARY_PAGE
        });
    end, {
        v17, 
        v16
    });
    local v21 = v15.getParam("assetTypeName");
    local v22 = v15.getParam("itemId");
    local v23 = v15.getParam("itemCreatorName");
    local v24 = v15.getParam("itemName");
    local v25 = {
        reportEntryPoint = v7.REPORT_ENTRYPOINT.Item, 
        assetTypeName = v21, 
        itemId = v22, 
        itemName = v24, 
        itemCreatorName = v23
    };
    if l_GetFFlagLuafiedReportFullFlow_0() then
        return (v3.createElement(v6, {
            reportData = v25, 
            reportSurface = v7.BEDUI_SURFACES.VR, 
            locale = if l_GetFFlagVRAbuseReportLocales_0() then l_LocalizationService_0.RobloxLocaleId else "en_us", 
            submissionEntryPoint = v7.SAFETY_EVENT_SUBMISSION_ENTRY_POINT.VR, 
            analyticsState = v16, 
            analyticsDispatch = v17, 
            onClose = v18, 
            onSummaryPageMounted = v20, 
            onLogAbandon = v19
        }));
    else
        return (v3.createElement(v4, {
            onClose = v18
        }));
    end;
end));