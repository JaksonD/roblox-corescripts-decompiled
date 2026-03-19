local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.AbuseReporting);
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v5 = require(l_script_FirstAncestor_0.dependencies);
local v6 = require(l_script_FirstAncestor_0.Logger);
local l_React_0 = v5.React;
local l_DefaultTwoStepReportFlow_0 = v3.UXFlows.DefaultTwoStepReportFlow;
local l_NetworkingSquads_0 = v5.NetworkingSquads;
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_useDispatch_0 = v5.Hooks.useDispatch;
local v12 = {
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
return function(v13) --[[ Line: 34 ]] --[[ Name: SquadVoiceAbuseReport ]]
    -- upvalues: l_useDispatch_0 (copy), l_React_0 (copy), v6 (copy), l_HttpService_0 (copy), l_NetworkingSquads_0 (copy), l_dependencyArray_0 (copy), l_DefaultTwoStepReportFlow_0 (copy), v12 (copy)
    local v14 = l_useDispatch_0();
    local v19 = l_React_0.useCallback(function(v15, v16) --[[ Line: 36 ]]
        -- upvalues: v6 (ref), l_HttpService_0 (ref), v13 (copy), v14 (copy), l_NetworkingSquads_0 (ref)
        v6:info("Submitting abuse report. Reason: {}, Comment: {}, Data: {}", v15, v16, l_HttpService_0:JSONEncode(v13.reportData));
        local v17, v18 = v14(l_NetworkingSquads_0.SendSquadVoiceAbuseReport.API({
            submitterUserId = v13.reportData.submitterUserId, 
            abuserUserId = v13.reportData.abuserUserId, 
            reportBeginTimestampMs = v13.reportData.reportBeginTimestampMs, 
            voiceChannelId = v13.reportData.voiceChannelId, 
            voiceUserIds = v13.reportData.voiceUserIds, 
            voiceUserCount = v13.reportData.voiceUserCount, 
            abuseReason = v15, 
            abuseComment = v16
        })):await();
        if v17 then
            v6:info("Abuse report submitted successfully. Response: {}", l_HttpService_0:JSONEncode(v18));
            return v17;
        else
            v6:error("Failed to submit abuse report. Response: {}", l_HttpService_0:JSONEncode(v18));
            return v17;
        end;
    end, l_dependencyArray_0(v13.reportData, v14));
    return l_React_0.createElement(l_DefaultTwoStepReportFlow_0, {
        analyticsContext = "Squad", 
        onSubmitProps = {
            hasNextSteps = false, 
            onSubmit = v19
        }, 
        onCloseProps = {
            hasPreviousSteps = false, 
            onAbandon = v13.onAbandon
        }, 
        onComplete = v13.onComplete, 
        reportCategories = v12
    });
end;