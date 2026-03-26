local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useCallback_0 = v2.useCallback;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v5 = require(l_Parent_0.RobloxAppLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v7 = require(script.Parent.genericComponents.GenericInterventionDialog);
local v8 = require(l_script_FirstAncestor_0.InterventionAnalytics);
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local v10 = require(l_script_FirstAncestor_0.Hooks.useParsedBadUtterances);
return v2.memo(function(v11) --[[ Line: 33 ]] --[[ Name: UniversalFeatureRestrictionDialog ]]
    -- upvalues: v10 (copy), v5 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), v2 (copy), v7 (copy), v8 (copy)
    local l_moderationDetail_0 = v11.moderationDetail;
    local l_consequenceTransparencyMessage_0 = l_moderationDetail_0.consequenceTransparencyMessage;
    local l_interventionId_0 = l_moderationDetail_0.interventionId;
    local l_acknowledgeable_0 = l_moderationDetail_0.acknowledgeable;
    local l_badUtterances_0 = l_moderationDetail_0.badUtterances;
    local v17 = v10(l_badUtterances_0 or {});
    local v18 = table.concat(v17.textItems, "\n");
    local v19 = table.concat(v17.abuseTypes, ", ");
    if v19 == "" then
        v19 = v5:Format("Feature.NotApproved.Label.AbuseType.Other");
    end;
    local v20 = l_useCallback_0(function() --[[ Line: 50 ]]
        -- upvalues: v11 (copy)
        v11.onDismiss();
        if v11.onDismissCallback then
            v11.onDismissCallback();
        end;
    end, l_dependencyArray_0(v11.onDismiss, v11.onDismissCallback));
    return v2.createElement(v7, {
        titleText = "Testing title", 
        bodyText = "This is a test body for testing :D", 
        isAppealable = true, 
        evidence = v18, 
        violationReason = v19, 
        onDismiss = v20, 
        dsaMessage = l_consequenceTransparencyMessage_0, 
        interventionId = l_interventionId_0, 
        acknowledgeable = l_acknowledgeable_0, 
        eventId = l_interventionId_0, 
        interventionTypeForAnalytics = v8.Constants.InterventionTypes.Timeout
    });
end);