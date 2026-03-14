local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v4 = require(l_Modules_0.LuaApp.mutedError);
local v5 = require(l_CorePackages_0.Packages.tutils);
local v6 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting);
local v7 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportDialogBody);
local v8 = require(l_Modules_0.LuaApp.Components.AbuseReporting.submitAbuseReport);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local v10 = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
local v11 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportAnalytics);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_UIConfiguration_0 = require(l_CorePackages_0.Workspace.Packages.ServerUI).UIConfiguration;
local v14 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_isShowEUDSAIllegalContentReportingLink_0 = v6.isShowEUDSAIllegalContentReportingLink;
local l_isInDSAFeaturesOverrideList_0 = v6.isInDSAFeaturesOverrideList;
local l_GetFFlagLuafiedReportErrorStates_0 = v3.GetFFlagLuafiedReportErrorStates;
local l_GetFFlagDSALuaGeoGateBEDUIDevMode_0 = v3.GetFFlagDSALuaGeoGateBEDUIDevMode;
local l_ActionTypes_0 = v11.ActionTypes;
local v20 = {
    BEDUI_LOADING = "BEDUI_LOADING", 
    BEDUI_ERROR = "BEDUI_ERROR", 
    SUBMIT_LOADING = "SUBMIT_LOADING", 
    SUBMIT_ERROR = "SUBMIT_ERROR", 
    SUCCESS = "SUCCESS"
};
local function v22(v21) --[[ Line: 50 ]]
    -- upvalues: v10 (copy)
    if v21 == v10.REPORT_ENTRYPOINT.Profile or v21 == v10.REPORT_ENTRYPOINT.Chat then
        return v10.BEDUI_FETCH_CONTEXT.Profile;
    elseif v21 == v10.REPORT_ENTRYPOINT.ExperienceDetails then
        return v10.BEDUI_FETCH_CONTEXT.Experience;
    elseif v21 == v10.REPORT_ENTRYPOINT.Item then
        return v10.BEDUI_FETCH_CONTEXT.Item;
    elseif v21 == v10.REPORT_ENTRYPOINT.Notification then
        return v10.BEDUI_FETCH_CONTEXT.Notification;
    else
        return "";
    end;
end;
local v23 = l_UIConfiguration_0.new({
    enableLogging = false, 
    maxRetryCount = 2, 
    roduxKeyPath = "AbuseReporting"
});
local v24 = {
    BEDUILoading = false, 
    BEDUIError = false, 
    submitLoading = false, 
    submitError = false, 
    statusPrimaryText = "", 
    statusSecondaryText = ""
};
local function v28(v25, v26) --[[ Line: 81 ]]
    -- upvalues: l_GetFFlagLuafiedReportErrorStates_0 (copy), v24 (copy), v20 (copy), v10 (copy)
    if not l_GetFFlagLuafiedReportErrorStates_0() then
        return v25;
    else
        local v27 = table.clone(v24);
        if v26.type == v20.BEDUI_LOADING then
            v27.BEDUILoading = true;
            return v27;
        elseif v26.type == v20.BEDUI_ERROR then
            v27.BEDUIError = true;
            v27.statusPrimaryText = v10.BEDUI_FETCH_FAILURE_PRIMARY;
            v27.statusSecondaryText = v10.BEDUI_FETCH_FAILURE_SECONDARY;
            return v27;
        elseif v26.type == v20.SUBMIT_LOADING then
            v27.submitLoading = true;
            return v27;
        elseif v26.type == v20.SUBMIT_ERROR then
            v27.submitError = true;
            v27.statusPrimaryText = v10.REPORT_SUBMIT_FAILURE;
            return v27;
        elseif v26.type == v20.SUCCESS then
            return v27;
        else
            error("Unknown Action: " .. v26.type);
            return v27;
        end;
    end;
end;
return function(v29) --[[ Line: 108 ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), v28 (copy), v24 (copy), v20 (copy), l_ActionTypes_0 (copy), v22 (copy), v10 (copy), l_GetFFlagDSALuaGeoGateBEDUIDevMode_0 (copy), l_isShowEUDSAIllegalContentReportingLink_0 (copy), l_isInDSAFeaturesOverrideList_0 (copy), v23 (copy), v4 (copy), v5 (copy), v14 (copy), v11 (copy), v8 (copy), l_GetFFlagLuafiedReportErrorStates_0 (copy), v7 (copy)
    local v30 = l_useDispatch_0();
    local v31, v32 = v2.useState(nil);
    local v33, v34 = v2.useState(nil);
    local v35, v36 = v2.useState({});
    local v37, v38 = v2.useState({});
    local v39, v40 = v2.useReducer(v28, (table.clone(v24)));
    local l_reportEntryPoint_0 = v29.reportData.reportEntryPoint;
    v2.useEffect(function() --[[ Line: 120 ]]
        -- upvalues: v40 (copy), v20 (ref), v29 (copy), l_ActionTypes_0 (ref), l_reportEntryPoint_0 (copy), v22 (ref), v10 (ref), l_GetFFlagDSALuaGeoGateBEDUIDevMode_0 (ref), l_isShowEUDSAIllegalContentReportingLink_0 (ref), l_isInDSAFeaturesOverrideList_0 (ref), v30 (copy), v23 (ref), v32 (copy), v34 (copy), v4 (ref), v5 (ref)
        v40({
            type = v20.BEDUI_LOADING
        });
        v29.analyticsDispatch({
            type = l_ActionTypes_0.SET_BASIC_INFO, 
            dialogEntryPoint = l_reportEntryPoint_0, 
            platform = v29.reportSurface
        });
        local v42 = v22(l_reportEntryPoint_0);
        if v42 ~= "" then
            local l_V1_0 = v10.BEDUI_VERSIONS.V1;
            if l_GetFFlagDSALuaGeoGateBEDUIDevMode_0() then
                if l_isShowEUDSAIllegalContentReportingLink_0() then
                    l_V1_0 = v10.BEDUI_VERSIONS.DEV;
                end;
            elseif l_isInDSAFeaturesOverrideList_0() then
                l_V1_0 = v10.BEDUI_VERSIONS.DEV;
            end;
            v30(v23:fetch(v10.BEDUI_BASE_URL, {
                version = l_V1_0, 
                surface = v29.reportSurface, 
                context = v42, 
                locale = v29.locale
            })):andThen(function(v44) --[[ Line: 152 ]]
                -- upvalues: v32 (ref), v34 (ref), v40 (ref), v20 (ref)
                local l_responseBody_0 = v44.responseBody;
                if l_responseBody_0 then
                    v32(l_responseBody_0.components);
                    v34(l_responseBody_0.components.listSelection);
                end;
                v40({
                    type = v20.SUCCESS
                });
            end):catch(function(v46) --[[ Line: 160 ]]
                -- upvalues: v4 (ref), v5 (ref), v40 (ref), v20 (ref)
                v4("(Abuse Reporting [VR]) BEDUI fetch failed: " .. v5.toString(v46));
                v40({
                    type = v20.BEDUI_ERROR
                });
            end);
        end;
    end, {
        l_reportEntryPoint_0, 
        v29.reportSurface, 
        v29.locale, 
        v30
    });
    local function v55(v47, v48, v49, v50) --[[ Line: 174 ]]
        -- upvalues: v38 (copy), v33 (copy), v36 (copy), v34 (copy), v29 (copy), l_ActionTypes_0 (ref)
        v38(function(v51) --[[ Line: 180 ]]
            -- upvalues: v33 (ref)
            local v52 = table.clone(v51);
            table.insert(v52, v33);
            return v52;
        end);
        v36(function(v53) --[[ Line: 185 ]]
            -- upvalues: v47 (copy), v48 (copy), v49 (copy)
            local v54 = table.clone(v53);
            table.insert(v54, {
                tagValues = v47, 
                heading = v48, 
                humanReadableText = v49
            });
            return v54;
        end);
        v34(v50);
        v29.analyticsDispatch({
            type = l_ActionTypes_0.INCREMENT_SELECTION_ITEM
        });
    end;
    local function v58() --[[ Line: 200 ]]
        -- upvalues: v37 (copy), v34 (copy), v38 (copy), v35 (copy), v36 (copy), v29 (copy), l_ActionTypes_0 (ref), v40 (copy), v20 (ref)
        if #v37 > 0 then
            v34(v37[#v37]);
            v38(function(v56) --[[ Line: 204 ]]
                local v57 = table.clone(v56);
                table.remove(v57);
                return v57;
            end);
            table.remove(v35);
            v36(v35);
            v29.analyticsDispatch({
                type = l_ActionTypes_0.INCREMENT_BACK_BUTTON_CLICK
            });
            v40({
                type = v20.SUCCESS
            });
        end;
    end;
    local function v62() --[[ Line: 218 ]]
        -- upvalues: v30 (copy), v14 (ref), v10 (ref), v11 (ref), v29 (copy), v40 (copy), v20 (ref), v31 (copy), v35 (copy), v8 (ref), l_GetFFlagLuafiedReportErrorStates_0 (ref), v4 (ref), v5 (ref)
        local function _() --[[ Line: 219 ]]
            -- upvalues: v30 (ref), v14 (ref), v10 (ref), v11 (ref), v29 (ref)
            v30(v14(v10.SUCCESS_TOAST_DATA));
            v11.sendEventData(v29.analyticsState, v10.ANALYTICS_EVENT_NAMES.SUBMITTED);
            v29.onClose();
        end;
        v40({
            type = v20.SUBMIT_LOADING
        });
        local l_url_0 = v31.submission.url;
        if #v35 > 0 and l_url_0 then
            v30(v8(v35, l_url_0, v29.reportData, v29.submissionEntryPoint)):andThen(function() --[[ Line: 231 ]]
                -- upvalues: l_GetFFlagLuafiedReportErrorStates_0 (ref), v40 (ref), v20 (ref), v30 (ref), v14 (ref), v10 (ref), v11 (ref), v29 (ref)
                if l_GetFFlagLuafiedReportErrorStates_0() then
                    v40({
                        type = v20.SUCCESS
                    });
                    v30(v14(v10.SUCCESS_TOAST_DATA));
                    v11.sendEventData(v29.analyticsState, v10.ANALYTICS_EVENT_NAMES.SUBMITTED);
                    v29.onClose();
                end;
            end):catch(function(v61) --[[ Line: 237 ]]
                -- upvalues: v4 (ref), v5 (ref), v40 (ref), v20 (ref)
                v4("(Abuse Reporting [VR]) Report submission failed" .. v5.toString(v61));
                v40({
                    type = v20.SUBMIT_ERROR
                });
            end):finally(function() --[[ Line: 241 ]]
                -- upvalues: v29 (ref)
                if v29.reportData and v29.reportData.onSubmitReportCallback then
                    v29.reportData.onSubmitReportCallback();
                end;
            end);
            if not l_GetFFlagLuafiedReportErrorStates_0() then
                v30(v14(v10.SUCCESS_TOAST_DATA));
                v11.sendEventData(v29.analyticsState, v10.ANALYTICS_EVENT_NAMES.SUBMITTED);
                v29.onClose();
            end;
        end;
    end;
    return v2.createElement(v7, {
        currentList = v33, 
        selectionData = v35, 
        BEDUIComponents = v31, 
        reportData = v29.reportData, 
        reportSurface = v29.reportSurface, 
        prevListNodes = v37, 
        analyticsDispatch = v29.analyticsDispatch, 
        onSelect = v55, 
        onSubmitReport = v62, 
        onSummaryPageMounted = v29.onSummaryPageMounted, 
        onLogAbandon = v29.onLogAbandon, 
        onBack = v58, 
        onClose = v29.onClose, 
        loadingState = v39
    });
end;