local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.AbuseReporting);
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v5 = require(l_script_FirstAncestor_0.dependencies);
local v6 = require(l_script_FirstAncestor_0.Logger);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v5.SharedFlags.FFlagRemoveDependencyArrayAntipattern;
local l_React_0 = v5.React;
local l_DefaultTwoStepReportFlow_0 = v3.UXFlows.DefaultTwoStepReportFlow;
local l_NetworkingSquads_0 = v5.NetworkingSquads;
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_useDispatch_0 = v5.Hooks.useDispatch;
local v13 = {
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryInappropriate", 
        value = "Swearing"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryBullyingV2", 
        value = "Bullying"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryTheft", 
        value = "Scamming"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryDating", 
        value = "Dating"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryScamming", 
        value = "Cheating/Exploiting"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryPrivateInfo", 
        value = "Personal Question"
    }
};
return function(v14) --[[ Line: 36 ]] --[[ Name: SquadVoiceAbuseReport ]]
    -- upvalues: l_useDispatch_0 (copy), l_React_0 (copy), v6 (copy), l_HttpService_0 (copy), l_NetworkingSquads_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_DefaultTwoStepReportFlow_0 (copy), v13 (copy)
    local v15 = l_useDispatch_0();
    local v20 = l_React_0.useCallback(function(v16, v17) --[[ Line: 39 ]]
        -- upvalues: v6 (ref), l_HttpService_0 (ref), v14 (copy), v15 (copy), l_NetworkingSquads_0 (ref)
        v6:info("Submitting abuse report. Reason: {}, Comment: {}, Data: {}", v16, v17, l_HttpService_0:JSONEncode(v14.reportData));
        local v18, v19 = v15(l_NetworkingSquads_0.SendSquadVoiceAbuseReport.API({
            submitterUserId = v14.reportData.submitterUserId, 
            abuserUserId = v14.reportData.abuserUserId, 
            reportBeginTimestampMs = v14.reportData.reportBeginTimestampMs, 
            voiceChannelId = v14.reportData.voiceChannelId, 
            voiceUserIds = v14.reportData.voiceUserIds, 
            voiceUserCount = v14.reportData.voiceUserCount, 
            abuseReason = v16, 
            abuseComment = v17
        })):await();
        if v18 then
            v6:info("Abuse report submitted successfully. Response: {}", l_HttpService_0:JSONEncode(v19));
            return v18;
        else
            v6:error("Failed to submit abuse report. Response: {}", l_HttpService_0:JSONEncode(v19));
            return v18;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v14.reportData, 
        v15
    } else l_dependencyArray_0(v14.reportData, v15));
    return l_React_0.createElement(l_DefaultTwoStepReportFlow_0, {
        analyticsContext = "Squad", 
        onSubmitProps = {
            hasNextSteps = false, 
            onSubmit = v20
        }, 
        onCloseProps = {
            hasPreviousSteps = false, 
            onAbandon = v14.onAbandon
        }, 
        onComplete = v14.onComplete, 
        reportCategories = v13
    });
end;