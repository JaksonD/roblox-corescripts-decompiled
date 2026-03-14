local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v3 = require(l_script_FirstAncestor_0.Components.Constants);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_AnalyticsActions_0 = v3.AnalyticsActions;
local l_FFlagInGameMenuAddChatLineReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagInGameMenuAddChatLineReporting;
local l_FFlagAddPreselectedAbuseTypeAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddPreselectedAbuseTypeAnalytics;
local v8 = {
    typeofabuseSelection = v4.None, 
    reasonSelection = v4.None
};
return function(v9, v10) --[[ Line: 20 ]] --[[ Name: analyticsReducer ]]
    -- upvalues: l_AnalyticsActions_0 (copy), v3 (copy), l_FFlagInGameMenuAddChatLineReporting_0 (copy), l_FFlagAddPreselectedAbuseTypeAnalytics_0 (copy), v4 (copy), v8 (copy)
    local v11 = table.clone(v9);
    local l_type_0 = v10.type;
    if l_type_0 == l_AnalyticsActions_0.Reset then
        local l_menuEverShown_0 = v11.menuEverShown;
        v11 = v3.AnalyticsInitialState;
        v11.menuEverShown = l_menuEverShown_0;
        return v11;
    elseif l_type_0 == l_AnalyticsActions_0.SetMenuOpenedTimestamp then
        v11.menuEverShown = true;
        v11.menuOpenedUnixTimestampMilliseconds = v10.timestamp;
        return v11;
    elseif l_type_0 == l_AnalyticsActions_0.IncrementExperiencePersonChanged then
        v11.experiencePersonChangeCount = v11.experiencePersonChangeCount + 1;
        return v11;
    elseif l_type_0 == l_AnalyticsActions_0.IncrementTypeofabuseChanged then
        v11.typeofabuseChangeCount = v11.typeofabuseChangeCount + 1;
        return v11;
    elseif l_type_0 == l_AnalyticsActions_0.IncrementPersonChanged then
        v11.personChangeCount = v11.personChangeCount + 1;
        return v11;
    elseif l_type_0 == l_AnalyticsActions_0.IncrementReasonChanged then
        v11.reasonChangeCount = v11.reasonChangeCount + 1;
        return v11;
    elseif l_type_0 == l_AnalyticsActions_0.IncrementCaptureScene then
        v11.captureSceneCount = v11.captureSceneCount + 1;
        return v11;
    elseif l_FFlagInGameMenuAddChatLineReporting_0 and l_type_0 == l_AnalyticsActions_0.IncrementChatLineChanged then
        v11.chatLineChangeCount = v11.chatLineChangeCount + 1;
        return v11;
    elseif l_type_0 == l_AnalyticsActions_0.SetViewportInformation then
        v11.viewportSizeX = v10.viewportSizeX;
        v11.viewportSizeY = v10.viewportSizeY;
        v11.isPortraitMode = v10.viewportSizeX < v10.viewportSizeY;
        return v11;
    elseif l_type_0 == l_AnalyticsActions_0.SetMemoryRequirementMet then
        v11.memoryRequirementMet = v10.memoryRequirementMet;
        return v11;
    elseif l_type_0 == l_AnalyticsActions_0.SetSubmissionCompleted then
        v11.isSubmissionCompleted = true;
        return v11;
    elseif l_type_0 == l_AnalyticsActions_0.SetTypeOfAbuseSelection then
        v11.typeofabuseSelection = v10.selection;
        return v11;
    elseif l_FFlagAddPreselectedAbuseTypeAnalytics_0 and l_type_0 == l_AnalyticsActions_0.SetPreselectedAbuseSelection then
        v11.preselectedAbuseSelection = v10.selection;
        return v11;
    elseif l_type_0 == l_AnalyticsActions_0.SetReasonSelection then
        v11.reasonSelection = v10.selection;
        return v11;
    elseif l_type_0 == l_AnalyticsActions_0.SetCommentAdded then
        v11.commentAdded = v10.commentAdded;
        return v11;
    elseif l_type_0 == l_AnalyticsActions_0.SwitchToExperienceInitialSelections then
        return (v4.Dictionary.join(v11, v8, v3.AnalyticsExpeirenceInitialSelections));
    else
        if l_type_0 == l_AnalyticsActions_0.SwitchToPersonInitialSelections then
            v11 = v4.Dictionary.join(v11, v8, v3.AnalyticsPersonInitialSelections);
        end;
        return v11;
    end;
end;