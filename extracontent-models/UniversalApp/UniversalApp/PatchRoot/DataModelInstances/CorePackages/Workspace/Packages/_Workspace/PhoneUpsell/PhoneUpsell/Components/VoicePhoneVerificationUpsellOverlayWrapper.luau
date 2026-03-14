local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local _ = require(l_Parent_0.LuauPolyfill);
local l_PostUserOptIn_0 = require(l_Parent_0.VoiceChat).PostUserOptIn;
local _ = require(l_script_FirstAncestor_0.Components.PhoneVerificationUpsellOverlay);
local v7 = require(l_script_FirstAncestor_0.Components.UpsellContainer);
local v8 = require(l_script_FirstAncestor_0.Components.PhoneVerificationStatusOverlay);
local v9 = require(l_Parent_0.Cryo);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v13 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local v14 = require(l_Parent_0.UIBlox);
local l_Images_0 = v14.App.ImageSet.Images;
local l_ImageSetLabel_0 = v14.Core.ImageSet.ImageSetLabel;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagFixUpsellVerificationToNavigateToOverlays);
local l_GetFFlagDisablePVUpsellDataConsent_0 = require(l_Parent_0.SharedFlags).GetFFlagDisablePVUpsellDataConsent;
local l_FFlagHomePhoneVerificationUpsellNewCopy_0 = require(l_Parent_0.SharedFlags).FFlagHomePhoneVerificationUpsellNewCopy;
local v21 = {
    onSuccess = function() --[[ Line: 41 ]] --[[ Name: onSuccess ]]

    end, 
    closeUpsell = function() --[[ Line: 42 ]] --[[ Name: closeUpsell ]]

    end, 
    addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhoneVoice", 
    addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.AddPhoneBodyVoice"
};
return function(v22) --[[ Line: 49 ]] --[[ Name: VoicePhoneVerificationUpsellOverlayWrapper ]]
    -- upvalues: v13 (copy), v21 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v2 (copy), l_useAppPolicy_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_PostUserOptIn_0 (copy), v18 (copy), l_Logging_0 (copy), l_useLocalization_0 (copy), v7 (copy), v9 (copy), l_FFlagHomePhoneVerificationUpsellNewCopy_0 (copy), l_GetFFlagDisablePVUpsellDataConsent_0 (copy), v8 (copy)
    local v23 = v13(v21, v22);
    local v24 = l_useRoactService_0(l_RoactNetworking_0);
    local v25, v26 = v2.useState(false);
    local v27, v28 = v2.useState(false);
    local v30 = l_useAppPolicy_0(function(v29) --[[ Line: 56 ]]
        return v29.RequireExplicitVoiceConsent();
    end);
    local v31 = v2.createElement(l_ImageSetLabel_0, {
        Size = UDim2.fromOffset(40, 40), 
        Image = l_Images_0["icons/status/success_large"], 
        BackgroundTransparency = 1
    });
    local function v33() --[[ Line: 66 ]]
        -- upvalues: l_PostUserOptIn_0 (ref), v24 (copy), v26 (copy), v18 (ref), v23 (copy), v28 (copy), l_Logging_0 (ref)
        l_PostUserOptIn_0(v24, true, false):andThen(function(v32) --[[ Line: 68 ]]
            -- upvalues: v26 (ref), v18 (ref), v23 (ref), v28 (ref), l_Logging_0 (ref)
            if v32 then
                v26(true);
                task.delay(3, function() --[[ Line: 71 ]]
                    -- upvalues: v18 (ref), v23 (ref)
                    if v18 then
                        v23.closeUpsell();
                        v23.onSuccess();
                        return;
                    else
                        v23.onSuccess();
                        v23.closeUpsell();
                        return;
                    end;
                end);
                return;
            else
                v28(true);
                task.delay(5, function() --[[ Line: 82 ]]
                    -- upvalues: v18 (ref), v23 (ref)
                    if v18 then
                        v23.closeUpsell();
                        v23.onSuccess();
                        return;
                    else
                        v23.onSuccess();
                        v23.closeUpsell();
                        return;
                    end;
                end);
                l_Logging_0.warn("Error getting UserOptIn. " .. tostring(v32));
                return;
            end;
        end):catch(function() --[[ Line: 94 ]]
            -- upvalues: v28 (ref), v18 (ref), v23 (ref), l_Logging_0 (ref)
            v28(true);
            task.delay(5, function() --[[ Line: 96 ]]
                -- upvalues: v18 (ref), v23 (ref)
                if v18 then
                    v23.closeUpsell();
                    v23.onSuccess();
                    return;
                else
                    v23.onSuccess();
                    v23.closeUpsell();
                    return;
                end;
            end);
            l_Logging_0.warn("Exception posting PostUserOptIn");
        end);
    end;
    local v34 = l_useLocalization_0({
        verifySuccessKey = "Feature.VerificationUpsell.Heading.VoiceChatEnabledMobile", 
        voiceErrorKey = "Feature.VerificationUpsell.Heading.VoiceChatError"
    });
    return v2.createElement(v2.Fragment, nil, {
        PhoneVerificationUpsellOverlay = v2.createElement(v7, v9.Dictionary.join(v23, {
            onSuccess = v33, 
            addPhoneTitleKey = v23.addPhoneTitleKey, 
            addPhoneDescriptionKey = v23.addPhoneDescriptionKey, 
            addPhoneButtonKey = l_FFlagHomePhoneVerificationUpsellNewCopy_0 and "Feature.AccountSettings.Action.Verify" or "Feature.VerificationUpsell.Action.EnableVoice", 
            addPhoneLegalTextKey = v30 and "Feature.VerificationUpsell.Description.VoiceLegalConsent" or l_FFlagHomePhoneVerificationUpsellNewCopy_0 and "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer3" or "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer", 
            alwaysShowAddPhoneLegalText = true, 
            requireAddPhoneLegalTextCheckbox = v30, 
            disableLegalText = l_GetFFlagDisablePVUpsellDataConsent_0(), 
            shouldShowVerificationText = l_FFlagHomePhoneVerificationUpsellNewCopy_0 and true or nil
        })), 
        SuccessOverlay = v25 and v2.createElement(v8, {
            image = v31, 
            text = v34.verifySuccessKey
        }), 
        ErrorOverlay = v27 and v2.createElement(v8, {
            image = v31, 
            text = v34.voiceErrorKey
        })
    });
end;