local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.Frame);
local v4 = require(l_script_FirstAncestor_0.Dialogs.DualDropdownSubmitDialog);
local v5 = require(l_script_FirstAncestor_0.LocalizationKeys.DefaultLocalizationKeys);
local v6 = require(l_script_FirstAncestor_0.Analytics.Actions.OnFormLoaded);
local v7 = require(l_script_FirstAncestor_0.Analytics.useAnalyticsSubmitDispatch);
local v8 = require(l_script_FirstAncestor_0.Analytics.useAnalyticsDispatch);
return function(v9) --[[ Line: 30 ]] --[[ Name: DualDropdownReport ]]
    -- upvalues: v7 (copy), v8 (copy), v5 (copy), v2 (copy), v6 (copy), v3 (copy), v4 (copy)
    local v10 = v7();
    local v11 = v8();
    if v9.localizationKeys then
        v9.localizationKeys.formTitle = v9.localizationKeys.formTitle or v5.formTitle;
        v9.localizationKeys.formSubmit = v9.localizationKeys.formSubmit or v5.formSubmit;
    end;
    v2.useEffect(function() --[[ Line: 39 ]]
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
    local v15 = v2.useCallback(function(v12, v13, v14) --[[ Line: 48 ]]
        -- upvalues: v9 (copy), v10 (copy)
        if (if v9.onSubmitProps.hasNextSteps then v9.onSubmitProps.onProceedToNextStep(v12, v13, v14) else v9.onSubmitProps.onSubmit(v12, v13, v14)) and not v9.onSubmitProps.hasNextSteps then
            v10("Submit");
        end;
    end, {
        v10, 
        v9.onSubmitProps
    });
    local v16 = v2.useCallback(function() --[[ Line: 58 ]]
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
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        DualDropdownReport = v2.createElement(v4, {
            localizationKeys = v9.localizationKeys, 
            reportProblems = v9.reportProblems, 
            reportSurfaces = v9.reportSurfaces, 
            onSubmit = v15, 
            onAbandon = v16, 
            footerContent = v9.footerContent
        })
    });
end;