local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Utils.Constants);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.InExperienceInterventionAnalytics);
local v6 = require(l_script_FirstAncestor_0.Components.ChatInterventionGenericToast);
ChatNudgeToast = function(v7) --[[ Line: 14 ]] --[[ Name: ChatNudgeToast ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy), v2 (copy), v6 (copy), v5 (copy)
    local v8 = l_useLocalization_0(v3.localizationKeys);
    return v2.createElement(v6, {
        eventId = v7.eventId, 
        violatingChatLine = v7.violatingChatLine, 
        toastTitle = v8.ChatBreaksRulesText, 
        toastBody = v8.TextChatMayBeSuspendedText, 
        interventionType = v5.Constants.InterventionTypes.Nudge, 
        toastAppearEventName = v5.Constants.EventTypes.NudgeToastAppeared, 
        toastDismissEventName = v5.Constants.EventTypes.NudgeToastDismissed
    });
end;
return ChatNudgeToast;