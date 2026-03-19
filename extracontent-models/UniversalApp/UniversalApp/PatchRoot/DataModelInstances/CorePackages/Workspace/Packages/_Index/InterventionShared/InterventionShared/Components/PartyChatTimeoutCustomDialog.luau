local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local v4 = require(l_script_FirstAncestor_0.Utils.Constants);
local v5 = require(l_script_FirstAncestor_0.InterventionAnalytics);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.Foundation);
local l_IconSize_0 = v7.Enums.IconSize;
local v9 = require(l_script_FirstAncestor_0.Hooks.useCountdownBinding);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useTokens_0 = v7.Hooks.useTokens;
local v12 = require(l_Parent_0.LuauPolyfill);
local l_clearTimeout_0 = v12.clearTimeout;
local l_setTimeout_0 = v12.setTimeout;
local v15 = require(l_script_FirstAncestor_0.Signals.interventionTreatmentShownSignal);
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatInterventionFocusFix);
local v17 = require(l_script_FirstAncestor_0.Components.InterventionDialog);
return v6.memo(function(v18) --[[ Line: 31 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v4 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v16 (copy), v6 (copy), v15 (copy), v9 (copy), l_setTimeout_0 (copy), l_clearTimeout_0 (copy), v17 (copy), l_IconSize_0 (copy), v5 (copy)
    local v19 = l_useTokens_0();
    local v20 = l_useLocalization_0(v4.localizationKeys);
    local v21 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    if v16 then
        v6.useEffect(function() --[[ Line: 36 ]]
            -- upvalues: v15 (ref), v4 (ref)
            v15:fire(v4.TreatmentType.PartyChatTimeoutDialog);
        end, {});
    end;
    local v22 = v9(v18.endTimestamp, "0:00");
    v6.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: v18 (copy), l_setTimeout_0 (ref), l_clearTimeout_0 (ref)
        local v23 = nil;
        if v18.endTimestamp ~= nil then
            v23 = l_setTimeout_0(function() --[[ Line: 45 ]]
                -- upvalues: v18 (ref)
                v18.onDismiss();
            end, math.max(v18.endTimestamp - DateTime.now().UnixTimestamp + 1, 1) * 1000);
        end;
        return function() --[[ Line: 49 ]]
            -- upvalues: v23 (ref), l_clearTimeout_0 (ref)
            if v23 then
                l_clearTimeout_0(v23);
            end;
        end;
    end, {
        v18.endTimestamp, 
        v18.onDismiss
    });
    return v6.createElement(v17, {
        titleText = v22:map(function(v24) --[[ Line: 57 ]]
            -- upvalues: v21 (copy), v4 (ref)
            return v21:Format(v4.localizationKeys.PartyChatSuspendedText, {
                remainingTime = v24
            });
        end), 
        bodyText = v20.CantUsePartyChatText, 
        onDismiss = v18.onDismiss, 
        iconName = "icons/status/error_large", 
        iconSize = l_IconSize_0.Large, 
        iconStyle = v19.Color.System.Alert, 
        eventId = v18.eventId, 
        namespaceForAnalytics = v5.Constants.CounterNamespaceTypes.PartyChat, 
        interventionTypeForAnalytics = v5.Constants.InterventionTypes.PartyChatTimeout, 
        durationForAnalytics = v18.durationForAnalytics
    });
end);