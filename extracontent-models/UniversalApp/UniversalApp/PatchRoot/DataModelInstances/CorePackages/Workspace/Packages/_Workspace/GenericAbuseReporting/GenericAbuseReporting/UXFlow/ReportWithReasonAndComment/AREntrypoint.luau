local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Analytics.AnalyticsProvider);
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local v5 = require(l_script_FirstAncestor_0.LocalizationKeys.LocalizationKeysProvider);
local v6 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v6.FoundationProvider;
local v8 = require(script.Parent.ReportWithReasonAndComment);
local v9 = require(l_script_FirstAncestor_0.Dialogs.ReportCompleteDialog);
local v10 = require(l_script_FirstAncestor_0.Dialogs.ReportFailedDialog);
local _ = require(l_script_FirstAncestor_0.Analytics.submitAnalytics);
local v12 = require(script.Parent.useActiveDialog);
local v13 = {
    Form = "Form", 
    Complete = "Complete", 
    Error = "Error"
};
return function(v14) --[[ Line: 58 ]] --[[ Name: AREntrypoint ]]
    -- upvalues: v12 (copy), v2 (copy), v13 (copy), l_LayerCollectorProvider_0 (copy), l_FoundationProvider_0 (copy), v6 (copy), v3 (copy), v5 (copy), v8 (copy), v9 (copy), v10 (copy)
    local v15, v16 = v12();
    local v20 = v2.useCallback(function(v17, v18) --[[ Line: 61 ]]
        -- upvalues: v14 (copy), v16 (copy), v13 (ref)
        local v19 = if v14.onSubmitProps.hasNextSteps then v14.onSubmitProps.onProceedToNextStep(v17, v18) else v14.onSubmitProps.onSubmit(v17, v18);
        if v19 then
            v16(v13.Complete);
            return v19;
        else
            v16(v13.Error);
            return v19;
        end;
    end, {
        v14.onSubmitProps
    });
    local v21 = v2.useCallback(function() --[[ Line: 73 ]]
        -- upvalues: v16 (copy), v13 (ref)
        v16(v13.Form);
    end, {});
    local v22 = v2.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v14 (copy)
        if v14.onComplete then
            v14.onComplete();
        end;
    end, {
        v14.onComplete
    });
    local l_createElement_0 = v2.createElement;
    local l_l_LayerCollectorProvider_0_0 = l_LayerCollectorProvider_0;
    local v25 = {};
    local v26 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_FoundationProvider_0_0 = l_FoundationProvider_0;
    local v29 = {
        theme = v6.Enums.Theme.Dark
    };
    local v30 = {};
    local l_createElement_2 = v2.createElement;
    local l_v3_0 = v3;
    local v33 = {
        onBeforeSubmitAnalytics = v14.onBeforeSubmitAnalytics, 
        onSubmitAnalytics = v14.onSubmitAnalytics
    };
    local v34 = {};
    local l_createElement_3 = v2.createElement;
    local l_v5_0 = v5;
    local v37 = {
        localizationKeys = v14.localizationKeys
    };
    local v38 = {};
    local v39 = false;
    if v15 == v13.Form then
        v39 = v2.createElement(v8, {
            analyticsContext = v14.analyticsContext, 
            topCustomComponent = v14.topCustomComponent, 
            footerContent = v14.footerContent, 
            reportCategories = v14.reportCategories, 
            onCloseProps = v14.onCloseProps, 
            onSubmitProps = if v14.onSubmitProps.hasNextSteps then {
                hasNextSteps = v14.onSubmitProps.hasNextSteps, 
                onProceedToNextStep = v20
            } else {
                hasNextSteps = v14.onSubmitProps.hasNextSteps, 
                onSubmit = v20
            }, 
            reportCategoryDefaultKey = v14.reportCategoryDefaultKey, 
            isDisabled = v14.isDisabled, 
            isReportCategoryReadonly = v14.isReportCategoryReadonly, 
            scaleDialog = v14.scaleDialog
        });
    end;
    v38.submitDialog = v39;
    v39 = false;
    if v15 == v13.Complete then
        v39 = v2.createElement(v9, {
            onDismiss = v22
        });
    end;
    v38.completeDialog = v39;
    v39 = false;
    if v15 == v13.Error then
        v39 = v2.createElement(v10, {
            onDismiss = v21
        });
    end;
    v38.errorDialog = v39;
    v34.localizationKeys = l_createElement_3(l_v5_0, v37, v38);
    v30.analytics = l_createElement_2(l_v3_0, v33, v34);
    v26.FoundationProvider = l_createElement_1(l_l_FoundationProvider_0_0, v29, v30);
    return l_createElement_0(l_l_LayerCollectorProvider_0_0, v25, v26);
end;