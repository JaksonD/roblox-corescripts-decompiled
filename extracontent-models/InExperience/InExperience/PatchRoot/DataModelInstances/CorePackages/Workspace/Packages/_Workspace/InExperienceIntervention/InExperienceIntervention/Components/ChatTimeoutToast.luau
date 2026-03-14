local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Utils.Constants);
local v4 = require(l_script_FirstAncestor_0.InExperienceInterventionAnalytics);
local v5 = require(l_script_FirstAncestor_0.Components.ChatInterventionGenericToast);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_determineToastDuration_0 = require(l_Parent_0.InterventionShared).Utils.determineToastDuration;
ChatTimeoutToast = function(v8) --[[ Line: 21 ]] --[[ Name: ChatTimeoutToast ]]
    -- upvalues: v2 (copy), l_useLocalization_0 (copy), v3 (copy), l_determineToastDuration_0 (copy), v5 (copy), v4 (copy)
    local v9, v10 = v2.useState(0);
    local v11 = l_useLocalization_0({
        cannotSend1MinText = v3.localizationKeys.CannotSend1MinText, 
        beRespectfulText = v3.localizationKeys.BeRespectfulText
    });
    v2.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: v8 (copy), v10 (copy)
        if v8.endTime then
            local l_UnixTimestamp_0 = DateTime.now().UnixTimestamp;
            local v13 = math.ceil((v8.endTime - l_UnixTimestamp_0) / 60);
            v10(v13);
        end;
    end, {
        v8.endTime, 
        v8.dispatchTimestamp
    });
    local v14 = l_determineToastDuration_0(v9);
    return v2.createElement(v5, {
        toastTitle = v14, 
        toastBody = v11.beRespectfulText, 
        interventionType = v4.Constants.InterventionTypes.Timeout, 
        remainingDurationSec = v9, 
        toastAppearEventName = v4.Constants.EventTypes.ChatAttemptToastAppeared, 
        toastDismissEventName = v4.Constants.EventTypes.ChatAttemptToastDismissed
    });
end;
return ChatTimeoutToast;