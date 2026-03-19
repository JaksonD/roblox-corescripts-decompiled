local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_DefaultTwoStepReportFlow_0 = require(l_Parent_0.AbuseReporting).UXFlows.DefaultTwoStepReportFlow;
local v4 = require(l_Parent_0.AppChatNetworking);
local v5 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useChatPlacementContext_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).useChatPlacementContext;
local v8 = {
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryInappropriate", 
        value = "ABUSE_TYPE_PROFANITY"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryPrivateInfo", 
        value = "ABUSE_TYPE_PRIVACY_ASKING_FOR_PII"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryBullyingV2", 
        value = "ABUSE_TYPE_HARASSMENT"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryDating", 
        value = "ABUSE_TYPE_DATING_AND_ROMANTIC_CONTENT"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryScamming", 
        value = "ABUSE_TYPE_CHEAT_AND_EXPLOITS"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryTheft", 
        value = "ABUSE_TYPE_SCAMMING"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryContent", 
        value = "ABUSE_TYPE_SEXUAL_CONTENT"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryThreats", 
        value = "ABUSE_TYPE_REAL_LIFE_THREATS"
    }, 
    {
        localizationKey = "Feature.ReportAbuse.Label.CategoryOther", 
        value = "ABUSE_TYPE_OTHER"
    }
};
return function(v9) --[[ Line: 46 ]] --[[ Name: ChatAbuseReport ]]
    -- upvalues: l_useDispatch_0 (copy), l_useChatPlacementContext_0 (copy), v2 (copy), v4 (copy), v5 (copy), l_DefaultTwoStepReportFlow_0 (copy), v8 (copy)
    local v10 = l_useDispatch_0();
    local v11 = l_useChatPlacementContext_0();
    local v16 = v2.useCallback(function(v12, v13) --[[ Line: 50 ]]
        -- upvalues: v10 (copy), v4 (ref), v9 (copy), v11 (copy), v5 (ref)
        local v14, v15 = v10(v4.rodux.CreateChatAbuseReport.API({
            comment = v13, 
            reportedUserId = v9.participantId, 
            reportCategory = v12, 
            conversationId = v9.conversationId, 
            entryPoint = v11.chatPlacement
        })):await();
        if v14 then
            v5:info("Abuse report submitted successfully. Response: {}", (tostring(v15)));
            return v14;
        else
            v5:error("Failed to submit abuse report. Response: {}", (tostring(v15)));
            return v14;
        end;
    end, {
        v10, 
        v9.conversationId, 
        v9.participantId
    });
    return v2.createElement(l_DefaultTwoStepReportFlow_0, {
        analyticsContext = "AppChat", 
        onSubmitProps = {
            hasNextSteps = false, 
            onSubmit = v16
        }, 
        onCloseProps = {
            hasPreviousSteps = false, 
            onAbandon = v9.onAbandon
        }, 
        onComplete = v9.onComplete, 
        reportCategories = v8
    });
end;