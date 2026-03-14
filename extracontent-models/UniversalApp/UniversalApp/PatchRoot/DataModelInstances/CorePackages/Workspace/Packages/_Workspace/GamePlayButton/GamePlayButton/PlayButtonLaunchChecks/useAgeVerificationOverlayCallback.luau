local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local l_IXPService_0 = game:GetService("IXPService");
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v7 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local v10 = require(l_Parent_0.VoiceChat);
local l_OpenCentralOverlayForVerifiedEnableVoice_0 = v10.AgeVerificationOverlay.OpenCentralOverlayForVerifiedEnableVoice;
local l_ApiPostRecordUserSeenModal_0 = v10.AgeVerificationOverlay.ApiPostRecordUserSeenModal;
local l_SetShowAgeVerificationOverlay_0 = v10.AgeVerificationOverlay.SetShowAgeVerificationOverlay;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_GetFStringVoiceUpsellLayer_0 = require(l_Parent_0.SharedFlags).GetFStringVoiceUpsellLayer;
local l_GetFFlagLogExposureForExperienceUpsell_0 = v10.Flags.GetFFlagLogExposureForExperienceUpsell;
return function(v17, v18, v19) --[[ Line: 23 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useDispatch_0 (copy), l_useAppPolicy_0 (copy), l_useSelector_0 (copy), v4 (copy), l_GetFFlagLogExposureForExperienceUpsell_0 (copy), l_GetFStringVoiceUpsellLayer_0 (copy), l_IXPService_0 (copy), l_OpenCentralOverlayForVerifiedEnableVoice_0 (copy), l_ApiPostRecordUserSeenModal_0 (copy), l_SetShowAgeVerificationOverlay_0 (copy)
    local v20 = l_useRoactService_0(l_RoactNetworking_0);
    local v21 = l_useDispatch_0();
    local v23 = l_useAppPolicy_0(function(v22) --[[ Line: 30 ]]
        return {
            RequireExplicitVoiceConsent = v22.RequireExplicitVoiceConsent(), 
            showVoiceOptInOverlayEnabled = v22.getShowVoiceUpsellV2()
        };
    end);
    local v25 = l_useSelector_0(function(v24) --[[ Line: 37 ]]
        -- upvalues: v17 (copy)
        if v24.ShowAgeVerificationOverlay[v17] ~= nil then
            return v24.ShowAgeVerificationOverlay[v17];
        else
            return {};
        end;
    end);
    local l_isPlaceEnabledForVoice_0 = v25.isPlaceEnabledForVoice;
    local l_isUniverseEnabledForVoice_0 = v25.isUniverseEnabledForVoice;
    local l_showVoiceOptInOverlay_0 = v25.showVoiceOptInOverlay;
    local l_elegibleToSeeVoiceUpsell_0 = v25.elegibleToSeeVoiceUpsell;
    local l_isVoiceEnabled_0 = v25.isVoiceEnabled;
    return (v4.useCallback(function(v31) --[[ Line: 50 ]]
        -- upvalues: l_GetFFlagLogExposureForExperienceUpsell_0 (ref), l_isUniverseEnabledForVoice_0 (copy), l_elegibleToSeeVoiceUpsell_0 (copy), l_GetFStringVoiceUpsellLayer_0 (ref), l_IXPService_0 (ref), l_showVoiceOptInOverlay_0 (copy), v23 (copy), v21 (copy), l_OpenCentralOverlayForVerifiedEnableVoice_0 (ref), v18 (copy), l_ApiPostRecordUserSeenModal_0 (ref), v20 (copy), l_SetShowAgeVerificationOverlay_0 (ref), v17 (copy), l_isPlaceEnabledForVoice_0 (copy), v19 (copy)
        if l_GetFFlagLogExposureForExperienceUpsell_0() and l_isUniverseEnabledForVoice_0 and l_elegibleToSeeVoiceUpsell_0 then
            local v32 = l_GetFStringVoiceUpsellLayer_0();
            if v32 ~= "" then
                l_IXPService_0:LogUserLayerExposure(v32);
            end;
        end;
        if l_showVoiceOptInOverlay_0 and v23.showVoiceOptInOverlayEnabled then
            v21(l_OpenCentralOverlayForVerifiedEnableVoice_0({
                launchGame = function() --[[ Line: 59 ]] --[[ Name: launchGame ]]
                    -- upvalues: v18 (ref), v31 (copy)
                    v18(v31);
                end, 
                RequireExplicitVoiceConsent = v23.RequireExplicitVoiceConsent, 
                postUserSeenModal = function() --[[ Line: 63 ]] --[[ Name: postUserSeenModal ]]
                    -- upvalues: v21 (ref), l_ApiPostRecordUserSeenModal_0 (ref), v20 (ref)
                    return v21(l_ApiPostRecordUserSeenModal_0.Fetch(v20));
                end, 
                setShowVoiceOptIn = function(v33) --[[ Line: 66 ]] --[[ Name: setShowVoiceOptIn ]]
                    -- upvalues: v21 (ref), l_SetShowAgeVerificationOverlay_0 (ref), v17 (ref), l_isPlaceEnabledForVoice_0 (ref), l_isUniverseEnabledForVoice_0 (ref)
                    v21(l_SetShowAgeVerificationOverlay_0(v17, l_isPlaceEnabledForVoice_0, l_isUniverseEnabledForVoice_0, v33.voiceEnabled, v33.showVoiceOptInOverlay));
                end
            }));
            return;
        else
            v19(v31);
            return;
        end;
    end, {
        v20, 
        v17, 
        l_isPlaceEnabledForVoice_0, 
        l_isUniverseEnabledForVoice_0, 
        l_showVoiceOptInOverlay_0, 
        v23.showVoiceOptInOverlayEnabled, 
        v23.RequireExplicitVoiceConsent, 
        l_isVoiceEnabled_0, 
        v18, 
        v19, 
        l_elegibleToSeeVoiceUpsell_0
    }));
end;