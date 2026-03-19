local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.Frame);
local v4 = require(l_script_FirstAncestor_0.Dialogs.SimpleSubmitDialog);
local v5 = require(l_script_FirstAncestor_0.LocalizationKeys.DefaultLocalizationKeys);
local v6 = require(l_script_FirstAncestor_0.Analytics.Actions.OnFormLoaded);
local v7 = require(l_script_FirstAncestor_0.Analytics.useAnalyticsSubmitDispatch);
local v8 = require(l_script_FirstAncestor_0.Analytics.useAnalyticsDispatch);
return function(v9) --[[ Line: 34 ]] --[[ Name: ReportWithReasonAndComment ]]
    -- upvalues: v7 (copy), v8 (copy), v5 (copy), v2 (copy), v6 (copy), v3 (copy), v4 (copy)
    local v10 = v7();
    local v11 = v8();
    local v12 = v9.onCloseProps and v9.onCloseProps.hasPreviousSteps;
    if v9.localizationKeys then
        v9.localizationKeys.formTitle = v9.localizationKeys.formTitle or v5.formTitle;
        v9.localizationKeys.formSubmit = v9.localizationKeys.formSubmit or v5.formSubmit;
    end;
    v2.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v11 (copy), v6 (ref), v9 (copy)
        v11(v6({
            context = v9.analyticsContext, 
            place_id = game.PlaceId, 
            accumulated_time_ms = workspace:GetServerTimeNow() * 1000
        }));
    end, {
        v11, 
        v9.analyticsContext
    });
    local v15 = v2.useCallback(function(v13, v14) --[[ Line: 53 ]]
        -- upvalues: v9 (copy), v10 (copy)
        if (if v9.onSubmitProps.hasNextSteps then v9.onSubmitProps.onProceedToNextStep(v13, v14) else v9.onSubmitProps.onSubmit(v13, v14)) and not v9.onSubmitProps.hasNextSteps then
            v10("Submit");
        end;
    end, {
        v10, 
        v9.onSubmitProps
    });
    local v16 = v2.useCallback(function() --[[ Line: 63 ]]
        -- upvalues: v9 (copy), v10 (copy)
        if v9.onCloseProps then
            if v9.onCloseProps.hasPreviousSteps then
                v9.onCloseProps.onBackToPreviousStep();
                return;
            else
                v9.onCloseProps.onAbandon();
                v10("Abandon");
                return;
            end;
        else
            v10("Abandon");
            return;
        end;
    end, {
        v10, 
        v9.onCloseProps
    });
    return v2.createElement(v3, {
        Size = UDim2.fromScale(1, 1)
    }, {
        submitDialog = v2.createElement(v4, {
            topCustomComponent = v9.topCustomComponent, 
            footerContent = v9.footerContent, 
            localizationKeys = v9.localizationKeys, 
            reportCategories = v9.reportCategories, 
            reportCategoryDefaultKey = v9.reportCategoryDefaultKey, 
            onSubmit = v15, 
            onAbandon = v16, 
            isDisabled = v9.isDisabled, 
            isReportCategoryReadonly = v9.isReportCategoryReadonly, 
            useBackButton = v12, 
            scaleDialog = v9.scaleDialog
        })
    });
end;