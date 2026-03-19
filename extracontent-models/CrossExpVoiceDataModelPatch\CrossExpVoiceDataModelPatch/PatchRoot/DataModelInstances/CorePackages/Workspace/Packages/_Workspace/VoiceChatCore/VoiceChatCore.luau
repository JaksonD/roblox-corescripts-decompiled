local v0 = require(script.CoreVoiceManager);
local v1 = require(script.Analytics);
local v2 = require(script.Constants);
local l_Requests_0 = script.Requests;
local l_Flags_0 = script.Flags;
return {
    CoreVoiceManager = v0, 
    Constants = v2, 
    Analytics = v1, 
    Flags = {
        GetFFlagHideUIWhenVoiceDefaultDisabled = require(l_Flags_0.GetFFlagHideUIWhenVoiceDefaultDisabled), 
        GetFFlagOverwriteIsMutedLocally = require(l_Flags_0.GetFFlagOverwriteIsMutedLocally), 
        GetFFlagReceiveLikelySpeakingUsers = require(l_Flags_0.GetFFlagReceiveLikelySpeakingUsers), 
        GetFFlagSetActiveWhenConnecting = require(l_Flags_0.GetFFlagSetActiveWhenConnecting), 
        GetFFlagUpdateDeviceInputPlayerChanged = require(l_Flags_0.GetFFlagUpdateDeviceInputPlayerChanged), 
        GetFFlagUseAudioInstanceAdded = require(l_Flags_0.GetFFlagUseAudioInstanceAdded), 
        GetFFlagEnableLuaVoiceChatAnalytics = require(l_Flags_0.GetFFlagEnableLuaVoiceChatAnalytics), 
        GetFFlagUseLuaSignalrConsumer = require(l_Flags_0.GetFFlagUseLuaSignalrConsumer), 
        GetFFlagVoiceChatServiceManagerUseAvatarChat = require(l_Flags_0.GetFFlagVoiceChatServiceManagerUseAvatarChat), 
        GetFFlagBatchVoiceParticipantsUpdates = require(l_Flags_0.GetFFlagBatchVoiceParticipantsUpdates), 
        GetFIntThrottleParticipantsUpdateMs = require(l_Flags_0.GetFIntThrottleParticipantsUpdateMs), 
        GetFFlagEnableVoiceNudge = require(l_Flags_0.GetFFlagEnableVoiceNudge), 
        GetFFlagEnableFtuxExitOnMuteToggle = require(l_Flags_0.GetFFlagEnableFtuxExitOnMuteToggle), 
        GetFFlagEnableExpJoinMicPermAnalytics = require(l_Flags_0.GetFFlagEnableExpJoinMicPermAnalytics), 
        GetFFlagEnableSeamlessVoiceFeature = require(l_Flags_0.GetFFlagEnableSeamlessVoiceFeature)
    }, 
    Requests = {
        GetShowAgeVerificationOverlay = require(l_Requests_0.GetShowAgeVerificationOverlay)
    }, 
    ["jest.config"] = script["jest.config"]
};