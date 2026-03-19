local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Components.Constants);
local v4 = require(l_script_FirstAncestor_0.Hooks.useHideForScreenshot);
local v5 = require(l_script_FirstAncestor_0.Hooks.useCaptureScreenshot);
local v6 = require(l_script_FirstAncestor_0.Reducers.reportAnythingReducer);
local v7 = require(l_script_FirstAncestor_0.IXP.TnSIXPWrapper);
return function(v8, v9, v10, v11) --[[ Line: 12 ]]
    -- upvalues: v7 (copy), v2 (copy), v6 (copy), v3 (copy), v5 (copy), v4 (copy)
    local v12 = v7.getReportAnythingAvatarEnabled();
    local v13 = v7.getReportAnythingExperienceEnabled();
    local v14, v15 = v2.useReducer(v6, v3.ReportAnythingInitialState);
    local v16 = (not not v12 or v13) and v14.screenshotContentId == "";
    local v20 = v5(v2.useCallback(function(v17) --[[ Line: 25 ]]
        -- upvalues: v15 (copy), v3 (ref)
        v15({
            type = v3.ReportAnythingActions.SetScreenshotContentId, 
            screenshotContentId = v17
        });
    end), v2.useCallback(function(v18) --[[ Line: 31 ]]
        -- upvalues: v15 (copy), v3 (ref)
        v15({
            type = v3.ReportAnythingActions.SetScreenshotId, 
            screenshotId = v18
        });
    end), v2.useCallback(function(v19) --[[ Line: 37 ]]
        -- upvalues: v15 (copy), v3 (ref)
        v15({
            type = v3.ReportAnythingActions.SetIdentificationResults, 
            identificationResults = v19
        });
    end));
    v4(v16, v8, v9, v10, v20, function() --[[ Line: 44 ]]
        -- upvalues: v11 (copy), v14 (copy), v15 (copy)
        v11(v14, v15);
    end);
    return v14, v15;
end;