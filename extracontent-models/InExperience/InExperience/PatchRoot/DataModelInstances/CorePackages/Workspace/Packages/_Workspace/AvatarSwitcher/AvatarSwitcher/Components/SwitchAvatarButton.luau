local l_SessionService_0 = game:GetService("SessionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_ButtonSize_0 = v3.Enums.ButtonSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_Parent_0.SignalsReact);
local v10 = require(l_Parent_0.AvatarExperienceAnalytics);
local l_addUnifiedEventLogging_0 = v10.addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = v10.UnifiedEventLogEnums;
local l_UnifiedLoggingSurface_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface;
local v14 = require(l_script_FirstAncestor_0.Stores.getAvatarSwitcherStore);
local v15 = require(l_Parent_0.AvatarExperienceFlags);
local v16 = require(l_Parent_0.AvatarExperienceCommon);
local l_FFlagAXAvatarTimeoutFlowIE_0 = v15.FFlagAXAvatarTimeoutFlowIE;
local l_getTimeoutStatusStore_0 = v16.Stores.getTimeoutStatusStore;
return function(v19) --[[ Line: 31 ]] --[[ Name: SwitchAvatarButton ]]
    -- upvalues: v9 (copy), v14 (copy), l_FFlagAXAvatarTimeoutFlowIE_0 (copy), l_getTimeoutStatusStore_0 (copy), l_useLocalization_0 (copy), v4 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedLoggingSurface_0 (copy), l_SessionService_0 (copy), v3 (copy), l_ButtonSize_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v20 = v9.useSignalState(v14);
    local v21 = v9.useSignalState(v20.getIsSwitching);
    local v22 = v9.useSignalState(v20.getSelectedOutfitId);
    local v23 = v9.useSignalState(v20.getSelectedOutfitDetails);
    local v24 = nil;
    local v25 = nil;
    if l_FFlagAXAvatarTimeoutFlowIE_0 then
        v24 = l_getTimeoutStatusStore_0();
        v25 = v9.useSignalState(v24.getIsTimedOut);
    end;
    local v26 = l_useLocalization_0({
        buttonText = "Feature.AvatarSwitcher.Action.Continue"
    });
    local v27 = false;
    if v22 ~= nil then
        v27 = v23 == nil;
    end;
    local v28 = v21 or v27;
    local v29 = v28 or v22 == nil or l_FFlagAXAvatarTimeoutFlowIE_0 and v25;
    local v30 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: l_addUnifiedEventLogging_0 (ref), v30 (copy), l_UnifiedEventLogEnums_0 (ref), l_UnifiedLoggingSurface_0 (ref), l_SessionService_0 (ref)
        task.delay(0, function() --[[ Line: 56 ]]
            -- upvalues: l_addUnifiedEventLogging_0 (ref), v30 (ref), l_UnifiedEventLogEnums_0 (ref), l_UnifiedLoggingSurface_0 (ref), l_SessionService_0 (ref)
            l_addUnifiedEventLogging_0(v30, {
                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                surface = l_UnifiedLoggingSurface_0.IN_EXPERIENCE_AVATAR_SWITCHER, 
                elementName = "SWITCH_AVATAR_BUTTON"
            }, {
                sessionTagName = l_SessionService_0:GetSessionTag("level2a")
            });
        end);
    end, {});
    return (v4.createElement(v3.Button, {
        text = v26.buttonText, 
        size = l_ButtonSize_0.Small, 
        variant = if v29 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Emphasis, 
        fillBehavior = l_FillBehavior_0.Fill, 
        onActivated = v19.onActivated, 
        isLoading = v28, 
        isDisabled = v29, 
        ref = v30
    }));
end;