local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local v3 = require(l_script_FirstAncestor_0.Utility.isInSelectInSceneReportMenuOverrideList);
local v4 = false;
task.defer(function() --[[ Line: 8 ]]
    -- upvalues: v4 (ref), v3 (copy)
    v4 = v3();
end);
return function(v5) --[[ Line: 12 ]]
    -- upvalues: l_ExperienceStateCaptureService_0 (copy), v2 (copy), v4 (ref)
    if not game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
        return false;
    elseif not game:GetEngineFeature("CaptureModeEnabled") then
        return false;
    else
        if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") then
            if not l_ExperienceStateCaptureService_0:CanEnterCaptureMode() then
                v5({
                    type = v2.AnalyticsActions.SetMemoryRequirementMet, 
                    memoryRequirementMet = 0
                });
                return false;
            else
                v5({
                    type = v2.AnalyticsActions.SetMemoryRequirementMet, 
                    memoryRequirementMet = 1
                });
            end;
        end;
        if not game:GetEngineFeature("ExperienceStateCaptureHiddenSelection") then
            return false;
        elseif v4 then
            return true;
        else
            return true;
        end;
    end;
end;