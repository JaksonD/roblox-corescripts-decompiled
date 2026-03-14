local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_GenericInterventionDialog_0 = require(l_Parent_0.InterventionShared).Components.GenericInterventionDialog;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_InterventionAnalytics_0 = require(l_Parent_0.InterventionShared).InterventionAnalytics;
local l_useParsedBadUtterances_0 = require(l_Parent_0.InterventionShared).Hooks.useParsedBadUtterances;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v8 = require(l_Parent_0.RobloxAppLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
local v9 = require(l_script_FirstAncestor_0.Utils.Constants);
local _ = require(l_script_FirstAncestor_0.Utils.Types);
return v2.memo(function(v11) --[[ Line: 27 ]] --[[ Name: ChatNudgeCustomDialogV2 ]]
    -- upvalues: l_useLocalization_0 (copy), v9 (copy), l_useParsedBadUtterances_0 (copy), v8 (copy), v2 (copy), l_GenericInterventionDialog_0 (copy), l_InterventionAnalytics_0 (copy)
    local v12 = l_useLocalization_0(v9.localizationKeys);
    local l_moderationDetail_0 = v11.moderationDetail;
    local l_consequenceTransparencyMessage_0 = l_moderationDetail_0.consequenceTransparencyMessage;
    local l_interventionId_0 = l_moderationDetail_0.interventionId;
    local l_acknowledgeable_0 = l_moderationDetail_0.acknowledgeable;
    local l_badUtterances_0 = l_moderationDetail_0.badUtterances;
    local v18 = l_useParsedBadUtterances_0(l_badUtterances_0 or {});
    local v19 = table.concat(v18.textItems, "\n");
    local v20 = table.concat(v18.abuseTypes, ", ");
    if v20 == "" then
        v20 = v8:Format("Feature.NotApproved.Label.AbuseType.Other");
    end;
    return v2.createElement(l_GenericInterventionDialog_0, {
        titleText = v12.ChatBreaksRulesText, 
        isAppealable = true, 
        bodyText = v12.TextChatMayBeSuspendedText, 
        evidence = v19, 
        violationReason = v20, 
        onDismiss = v11.onDismiss, 
        dsaMessage = l_consequenceTransparencyMessage_0, 
        interventionId = l_interventionId_0, 
        acknowledgeable = l_acknowledgeable_0, 
        eventId = l_interventionId_0, 
        interventionTypeForAnalytics = l_InterventionAnalytics_0.Constants.InterventionTypes.Nudge
    });
end);