local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Components.Constants);
local _ = require(l_script_FirstAncestor_0.ReportAnything.Utility.ReportAnythingAnalytics);
local v6 = require(l_script_FirstAncestor_0.ReportAnything.Utility.AbuseReportBuilder);
local l_FFlagAddPreselectedAbuseTypeAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddPreselectedAbuseTypeAnalytics;
local function v16(v8, v9, v10) --[[ Line: 15 ]]
    -- upvalues: v6 (copy), l_FFlagAddPreselectedAbuseTypeAnalytics_0 (copy), v3 (copy)
    local v11 = math.floor(workspace:GetServerTimeNow() * 1000);
    local v12 = 0;
    if v8.menuOpenedUnixTimestampMilliseconds > 0 then
        v12 = math.floor(v11 - v8.menuOpenedUnixTimestampMilliseconds);
    end;
    local v13, _ = v6.interpretAnnotations(v9);
    local v15 = {
        placeId = game.PlaceId, 
        isPortraitMode = v8.isPortraitMode, 
        viewportSizeX = v8.viewportSizeX, 
        viewportSizeY = v8.viewportSizeY, 
        timeSpentMs = v12, 
        experiencePersonChangeCount = v8.experiencePersonChangeCount, 
        typeofabuseChangeCount = v8.typeofabuseChangeCount, 
        personChangeCount = v8.personChangeCount, 
        reasonChangeCount = v8.reasonChangeCount, 
        captureSceneCount = v8.captureSceneCount, 
        chatLineChangeCount = v8.chatLineChangeCount, 
        reasonSelection = v8.reasonSelection, 
        commentAdded = v8.commentAdded, 
        experiencePersonSelection = v8.experiencePersonSelection, 
        annotationFinalCount = #v9.annotationPoints, 
        avatarFinalCount = #v13, 
        interactionType = v8.isSubmissionCompleted and 1 or 2, 
        typeofabuseSelection = v8.typeofabuseSelection, 
        memoryRequirementMet = v8.memoryRequirementMet, 
        preselectedAbuseSelection = if l_FFlagAddPreselectedAbuseTypeAnalytics_0 then v8.preselectedAbuseSelection else nil
    };
    return (v3.Dictionary.join(v15, v10));
end;
return {
    forPersonReport = function(v17, v18, v19) --[[ Line: 65 ]]
        -- upvalues: v16 (copy), v4 (copy)
        local v20 = v16(v17, v18, v19);
        local v21 = nil;
        local l_Chat_0 = v4.AnalyticsAbuseMethods.Chat;
        for v23, v24 in pairs(v4.AbuseMethodToAnalyticsMapping) do
            if v23 == v17.typeofabuseSelection then
                v21 = v24;
                l_Chat_0 = v24;
            end;
        end;
        v20.typeofabuseSelection = v21;
        v20.inferredTypeofabuseSelection = l_Chat_0;
        return v20;
    end, 
    forExperienceReport = function(v25, v26, v27) --[[ Line: 87 ]]
        -- upvalues: v16 (copy), v4 (copy)
        local v28 = v16(v25, v26, v27);
        v28.typeofabuseSelection = v4.AnalyticsAbuseMethods.Game;
        v28.inferredTypeofabuseSelection = v4.AnalyticsAbuseMethods.Game;
        return v28;
    end
};