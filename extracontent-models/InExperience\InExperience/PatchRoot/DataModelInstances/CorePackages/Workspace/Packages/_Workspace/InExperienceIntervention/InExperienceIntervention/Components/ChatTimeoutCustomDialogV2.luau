local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_GenericInterventionDialog_0 = require(l_Parent_0.InterventionShared).Components.GenericInterventionDialog;
local l_useTimeoutInfoBinding_0 = require(l_Parent_0.InterventionShared).Hooks.useTimeoutInfoBinding;
local l_InterventionAnalytics_0 = require(l_Parent_0.InterventionShared).InterventionAnalytics;
local l_useParsedBadUtterances_0 = require(l_Parent_0.InterventionShared).Hooks.useParsedBadUtterances;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v8 = require(l_Parent_0.RobloxAppLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
local _ = require(l_script_FirstAncestor_0.Utils.Types);
return v2.memo(function(v10) --[[ Line: 30 ]] --[[ Name: ChatTimeoutCustomDialogV2 ]]
    -- upvalues: l_useTimeoutInfoBinding_0 (copy), l_useParsedBadUtterances_0 (copy), v8 (copy), v2 (copy), l_GenericInterventionDialog_0 (copy), l_InterventionAnalytics_0 (copy)
    local l_moderationDetail_0 = v10.moderationDetail;
    local v12 = l_useTimeoutInfoBinding_0(l_moderationDetail_0.endDate, l_moderationDetail_0.duration);
    local l_heading_0 = v12.heading;
    local l_description_0 = v12.description;
    local l_consequenceTransparencyMessage_0 = l_moderationDetail_0.consequenceTransparencyMessage;
    local l_interventionId_0 = l_moderationDetail_0.interventionId;
    local l_acknowledgeable_0 = l_moderationDetail_0.acknowledgeable;
    local l_badUtterances_0 = l_moderationDetail_0.badUtterances;
    local v19 = l_useParsedBadUtterances_0(l_badUtterances_0 or {});
    local v20 = table.concat(v19.textItems, "\n");
    local v21 = table.concat(v19.abuseTypes, ", ");
    if v21 == "" then
        v21 = v8:Format("Feature.NotApproved.Label.AbuseType.Other");
    end;
    return v2.createElement(l_GenericInterventionDialog_0, {
        titleText = l_heading_0:map(function(v22) --[[ Line: 52 ]]
            return v22;
        end), 
        isAppealable = true, 
        bodyText = l_description_0:map(function(v23) --[[ Line: 56 ]]
            return v23;
        end), 
        evidence = v20, 
        violationReason = v21, 
        onDismiss = v10.onDismiss, 
        dsaMessage = l_consequenceTransparencyMessage_0, 
        interventionId = l_interventionId_0, 
        acknowledgeable = l_acknowledgeable_0, 
        eventId = l_interventionId_0, 
        durationForAnalytics = l_moderationDetail_0.duration / 1000000000, 
        interventionTypeForAnalytics = l_InterventionAnalytics_0.Constants.InterventionTypes.Timeout
    });
end);