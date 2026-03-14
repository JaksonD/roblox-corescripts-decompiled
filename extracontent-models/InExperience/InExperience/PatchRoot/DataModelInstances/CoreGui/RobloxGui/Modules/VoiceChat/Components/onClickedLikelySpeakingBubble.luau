local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v4 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v5 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints;
local l_GetFFlagSeamlessVoiceFTUX_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSeamlessVoiceFTUX;
local l_GetFFlagEnableSeamlessVoiceV2_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableSeamlessVoiceV2;
return function() --[[ Line: 14 ]]
    -- upvalues: l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy), l_default_0 (copy), v4 (copy), l_GetFFlagEnableSeamlessVoiceV2_0 (copy), v5 (copy), l_GetFFlagSeamlessVoiceFTUX_0 (copy)
    if l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and l_default_0:FetchPhoneVerificationUpsell(v4.IN_EXP_PHONE_UPSELL_IXP_LAYER) == v4.PHONE_UPSELL_VALUE_PROP.VoiceChat then
        l_default_0:ShowInExperiencePhoneVoiceUpsell(v4.IN_EXP_UPSELL_ENTRYPOINTS.LIKELY_SPEAKING, v4.IN_EXP_PHONE_UPSELL_IXP_LAYER);
        return;
    elseif l_GetFFlagEnableSeamlessVoiceV2_0() and l_default_0:IsSeamlessVoice() then
        l_default_0:JoinVoice();
        v5.Events.ShowLikelySpeakingBubblesChanged(false);
        l_default_0:RecordUserSeenModal("m3-likely-speaking-bubble-upsell");
        return;
    elseif l_GetFFlagSeamlessVoiceFTUX_0() and l_default_0.isShowingFTUX then
        l_default_0:HideFTUX(game:GetService("AppStorageService"));
        return;
    else
        l_default_0:ShowInExperienceVoiceUpsell(v4.IN_EXP_UPSELL_ENTRYPOINTS.LIKELY_SPEAKING);
        return;
    end;
end;