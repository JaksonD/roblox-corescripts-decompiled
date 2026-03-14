local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local v3 = require(l_script_FirstAncestor_0.IXP.TnSIXPWrapper);
local v4 = require(l_script_FirstAncestor_0.ReportAnything.Components.AnnotationModal);
return {
    componentType = "button", 
    getIsVisible = function(v5) --[[ Line: 11 ]] --[[ Name: getIsVisible ]]
        -- upvalues: v3 (copy), v2 (copy)
        return v3.getReportAnythingAvatarEnabled() and (v5.methodOfAbuse == v2.AbuseMethods.Other or v5.methodOfAbuse == v2.AbuseMethods.Avatar);
    end, 
    getIsDisabled = function(_, v7) --[[ Line: 18 ]] --[[ Name: getIsDisabled ]]
        return v7.reportAnythingState.attachCompleted;
    end, 
    variant = "secondary", 
    getIconSrc = function(v8) --[[ Line: 22 ]] --[[ Name: getIconSrc ]]
        if v8.reportAnythingState.attachCompleted then
            return "icons/actions/accept";
        else
            return "icons/controls/screenshot";
        end;
    end, 
    getButtonLabel = function(v9) --[[ Line: 27 ]] --[[ Name: getButtonLabel ]]
        if v9.reportAnythingState.attachCompleted then
            return "SceneCaptured";
        else
            return "CaptureScene";
        end;
    end, 
    onClick = function(_, _, v12) --[[ Line: 30 ]] --[[ Name: onClick ]]
        -- upvalues: v2 (copy), v4 (copy)
        v12.analyticsDispatch({
            type = v2.AnalyticsActions.IncrementCaptureScene
        });
        v4.mountAnnotationPage(v2.ReportTypes.Person, v12.hideReportTab, v12.reportAnythingAnalytics, v12.reportAnythingState, v12.reportAnythingDispatch);
    end, 
    fieldLabel = "AttachScreenshot", 
    componentName = "OptionalScreenshot"
};