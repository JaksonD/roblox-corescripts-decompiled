local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Analytics.AnalyticsProvider);
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local v5 = require(l_script_FirstAncestor_0.LocalizationKeys.LocalizationKeysProvider);
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local v7 = require(script.Parent.DualDropdownReport);
local v8 = require(l_script_FirstAncestor_0.Dialogs.ReportCompleteDialog);
local v9 = require(l_script_FirstAncestor_0.Dialogs.ReportFailedDialog);
local _ = require(l_script_FirstAncestor_0.Analytics.submitAnalytics);
local v11 = require(script.Parent.useActiveDialog);
local v12 = {
    Form = "Form", 
    Complete = "Complete", 
    Error = "Error"
};
return function(v13) --[[ Line: 52 ]] --[[ Name: AREntrypoint ]]
    -- upvalues: v11 (copy), v2 (copy), v12 (copy), l_LayerCollectorProvider_0 (copy), l_FoundationProvider_0 (copy), v3 (copy), v5 (copy), v7 (copy), v8 (copy), v9 (copy)
    local v14, v15 = v11();
    local v20 = v2.useCallback(function(v16, v17, v18) --[[ Line: 55 ]]
        -- upvalues: v13 (copy), v15 (copy), v12 (ref)
        local v19 = if v13.onSubmitProps.hasNextSteps then v13.onSubmitProps.onProceedToNextStep(v16, v17, v18) else v13.onSubmitProps.onSubmit(v16, v17, v18);
        if v19 then
            v15(v12.Complete);
            return v19;
        else
            v15(v12.Error);
            return v19;
        end;
    end, {
        v13.onSubmitProps
    });
    local v21 = v2.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: v15 (copy), v12 (ref)
        v15(v12.Form);
    end, {});
    local v22 = v2.useCallback(function() --[[ Line: 71 ]]
        -- upvalues: v13 (copy)
        if v13.onComplete then
            v13.onComplete();
        end;
    end, {
        v13.onComplete
    });
    local l_createElement_0 = v2.createElement;
    local l_l_LayerCollectorProvider_0_0 = l_LayerCollectorProvider_0;
    local v25 = {};
    local v26 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_FoundationProvider_0_0 = l_FoundationProvider_0;
    local v29 = {
        theme = "Dark"
    };
    local v30 = {};
    local l_createElement_2 = v2.createElement;
    local l_v3_0 = v3;
    local v33 = {
        onBeforeSubmitAnalytics = v13.onBeforeSubmitAnalytics, 
        onSubmitAnalytics = v13.onSubmitAnalytics
    };
    local v34 = {};
    local l_createElement_3 = v2.createElement;
    local l_v5_0 = v5;
    local v37 = {
        localizationKeys = v13.localizationKeys
    };
    local v38 = {};
    local v39 = false;
    if v14 == v12.Form then
        v39 = v2.createElement(v7, {
            analyticsContext = v13.analyticsContext, 
            reportProblems = v13.reportProblems, 
            reportSurfaces = v13.reportSurfaces, 
            onSubmitProps = if v13.onSubmitProps.hasNextSteps then {
                hasNextSteps = v13.onSubmitProps.hasNextSteps, 
                onProceedToNextStep = v20
            } else {
                hasNextSteps = v13.onSubmitProps.hasNextSteps, 
                onSubmit = v20
            }, 
            onCloseProps = v13.onCloseProps
        });
    end;
    v38.submitDialog = v39;
    v39 = false;
    if v14 == v12.Complete then
        v39 = v2.createElement(v8, {
            onDismiss = v22
        });
    end;
    v38.completeDialog = v39;
    v39 = false;
    if v14 == v12.Error then
        v39 = v2.createElement(v9, {
            onDismiss = v21
        });
    end;
    v38.errorDialog = v39;
    v34.localizationKeys = l_createElement_3(l_v5_0, v37, v38);
    v30.analytics = l_createElement_2(l_v3_0, v33, v34);
    v26.FoundationProvider = l_createElement_1(l_l_FoundationProvider_0_0, v29, v30);
    return l_createElement_0(l_l_LayerCollectorProvider_0_0, v25, v26);
end;