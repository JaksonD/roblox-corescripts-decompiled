local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useCallback_0 = v2.useCallback;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v5 = require(l_Parent_0.RobloxAppLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v7 = require(l_script_FirstAncestor_0.Components.genericComponents.GenericInterventionDialog);
local v8 = require(l_script_FirstAncestor_0.InterventionAnalytics);
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local v10 = require(l_script_FirstAncestor_0.Hooks.useParsedBadUtterances);
local v11 = require(l_script_FirstAncestor_0.Hooks.useRestrictionEndDateInfo);
return v2.memo(function(v12) --[[ Line: 34 ]] --[[ Name: UniversalFeatureRestrictionDialog ]]
    -- upvalues: v10 (copy), v5 (copy), v11 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), v2 (copy), v7 (copy), v8 (copy)
    local l_moderationDetail_0 = v12.moderationDetail;
    local l_consequenceTransparencyMessage_0 = l_moderationDetail_0.consequenceTransparencyMessage;
    local l_interventionId_0 = l_moderationDetail_0.interventionId;
    local l_acknowledgeable_0 = l_moderationDetail_0.acknowledgeable;
    local l_badUtterances_0 = l_moderationDetail_0.badUtterances;
    local v18 = v10(l_badUtterances_0 or {});
    local v19 = table.concat(v18.textItems, "\n");
    local v20 = table.concat(v18.abuseTypes, ", ");
    if not v20 or v20 == "" then
        v20 = v5:Format("Feature.NotApproved.Label.AbuseType.Other");
    end;
    local v21 = v11(l_moderationDetail_0.endDate);
    local v22 = l_useCallback_0(function() --[[ Line: 55 ]]
        -- upvalues: v12 (copy)
        v12.onDismiss();
        if v12.onDismissCallback then
            v12.onDismissCallback();
        end;
    end, l_dependencyArray_0(v12.onDismiss, v12.onDismissCallback));
    return v2.createElement(v7, {
        titleText = "Chat suspended for 2 days", 
        bodyText = "You can't use chat because one or more of your messages broke the rules. If you break the rules again, you could be banned.", 
        isAppealable = true, 
        evidence = v19, 
        violationReason = v20, 
        onDismiss = v22, 
        dsaMessage = l_consequenceTransparencyMessage_0, 
        interventionId = l_interventionId_0, 
        acknowledgeable = l_acknowledgeable_0, 
        eventId = l_interventionId_0, 
        interventionTypeForAnalytics = v8.Constants.InterventionTypes.Timeout, 
        useDetailedLayout = true, 
        formattedEndDate = v21.formattedEndDate, 
        countdownText = v21.countdownText
    });
end);