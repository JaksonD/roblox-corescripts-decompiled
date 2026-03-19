local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportComingSoonPrompt);
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v6 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportDialogController);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local v8 = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
local v9 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportAnalytics);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_GetFFlagLuafiedReportFullFlow_0 = v5.GetFFlagLuafiedReportFullFlow;
local l_GetFFlagVRAbuseReportLocales_0 = v5.GetFFlagVRAbuseReportLocales;
local v13 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
return function() --[[ Line: 21 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), v3 (copy), v9 (copy), v13 (copy), v8 (copy), l_GetFFlagLuafiedReportFullFlow_0 (copy), v6 (copy), l_GetFFlagVRAbuseReportLocales_0 (copy), l_LocalizationService_0 (copy), v4 (copy)
    local v15 = l_useDispatch_0();
    local v16 = l_useNavigation_0();
    local v17, v18 = v3.useReducer(v9.reportAnalyticsReducer, v9.EMPTY_LOGGING_STATE);
    local v19 = v16.getParam("reportData");
    local function v20() --[[ Line: 29 ]]
        -- upvalues: v19 (copy), v15 (copy), v13 (ref)
        if v19 and v19.onCloseCallback then
            v19.onCloseCallback();
        end;
        v15(v13());
    end;
    local v21 = v3.useCallback(function() --[[ Line: 37 ]]
        -- upvalues: v9 (ref), v17 (copy), v8 (ref)
        v9.sendEventData(v17, v8.ANALYTICS_EVENT_NAMES.ABANDONED);
    end, {
        v18, 
        v17
    });
    local v22 = v3.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v18 (copy), v9 (ref)
        v18({
            type = v9.ActionTypes.SET_IS_SEEN_SUMMARY_PAGE
        });
    end, {
        v18, 
        v17
    });
    if l_GetFFlagLuafiedReportFullFlow_0() or v19 and v19.reportEntryPoint == "Notification" then
        return (v3.createElement(v6, {
            reportSurface = if v19 and v19.reportSurface then v19.reportSurface else v8.BEDUI_SURFACES.VR, 
            locale = if l_GetFFlagVRAbuseReportLocales_0() then l_LocalizationService_0.RobloxLocaleId else "en_us", 
            reportData = v19, 
            submissionEntryPoint = if v19 and v19.submissionEntryPoint then v19.submissionEntryPoint else v8.SAFETY_EVENT_SUBMISSION_ENTRY_POINT.VR, 
            analyticsState = v17, 
            analyticsDispatch = v18, 
            onClose = v20, 
            onSummaryPageMounted = v22, 
            onLogAbandon = v21
        }));
    else
        return (v3.createElement(v4, {
            onClose = v20
        }));
    end;
end;