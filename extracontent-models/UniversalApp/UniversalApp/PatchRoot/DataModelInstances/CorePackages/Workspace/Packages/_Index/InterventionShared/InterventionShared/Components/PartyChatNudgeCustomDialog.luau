local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.Constants);
local v3 = require(l_script_FirstAncestor_0.InterventionAnalytics);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Foundation);
local l_IconSize_0 = v5.Enums.IconSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useTokens_0 = v5.Hooks.useTokens;
local v9 = require(l_script_FirstAncestor_0.Signals.interventionTreatmentShownSignal);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatInterventionFocusFix);
local v11 = require(l_script_FirstAncestor_0.Components.InterventionDialog);
return v4.memo(function(v12) --[[ Line: 23 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v2 (copy), v10 (copy), v4 (copy), v9 (copy), v11 (copy), l_IconSize_0 (copy), v3 (copy)
    local v13 = l_useTokens_0();
    local v14 = l_useLocalization_0(v2.localizationKeys);
    if v10 then
        v4.useEffect(function() --[[ Line: 27 ]]
            -- upvalues: v9 (ref), v2 (ref)
            v9:fire(v2.TreatmentType.PartyChatNudgeDialog);
        end, {});
    end;
    return v4.createElement(v11, {
        titleText = v14.DontSharePersonalInformationText, 
        bodyText = v14.PartyChatMayBeSuspendedText, 
        onDismiss = v12.onDismiss, 
        iconName = "icons/status/error_large", 
        iconSize = l_IconSize_0.Large, 
        iconStyle = v13.Color.System.Warning, 
        eventId = v12.eventId, 
        namespaceForAnalytics = v3.Constants.CounterNamespaceTypes.PartyChat, 
        interventionTypeForAnalytics = v3.Constants.InterventionTypes.PartyChatNudge
    });
end);