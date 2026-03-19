local l_ContentProvider_0 = game:GetService("ContentProvider");
local v1 = {
    PlaceNotAvailable = -1, 
    UserNotAvailable = 0, 
    Checking = 1, 
    Available = 2
};
local v2 = {
    VoiceNotifications = true, 
    VoiceModeration = true
};
local v3 = {
    "ParticipantModeratedFromVoice", 
    "VoiceToxicityModal", 
    "VoiceToxicityToast", 
    "VoiceReverseNudgeIconColorChange"
};
local v4 = {
    IDLE = "Idle", 
    VOICE_DISABLED = "Voice Disabled", 
    LISTEN_AND_TALK = "Listen and Talk", 
    LISTEN_ONLY = "Listen Only", 
    PENDING_MIC = "Pending Mic"
};
local v5 = {
    Idle = "Idle", 
    Joining = "Joining", 
    Suspended = "Suspended", 
    Joined = "Joined", 
    Left = "Left"
};
local v6 = {
    ALL = "all", 
    FRIENDS = "friends", 
    NONFRIENDS = "nonfriends"
};
local _, _, v14 = (function() --[[ Line: 54 ]] --[[ Name: parseBaseUrlInformation ]]
    -- upvalues: l_ContentProvider_0 (copy)
    local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
    if l_BaseUrl_0:sub(#l_BaseUrl_0) ~= "/" then
        l_BaseUrl_0 = l_BaseUrl_0 .. "/";
    end;
    local _, v9 = l_BaseUrl_0:find("://");
    local v10, v11 = l_BaseUrl_0:find("%.", v9 + 1);
    return l_BaseUrl_0, l_BaseUrl_0:sub(v9 + 1, v10 - 1), (l_BaseUrl_0:sub(v11 + 1));
end)();
local v15 = string.format("https://voice.%s", v14);
local v16 = string.format("https://apis.%supsellcard", v14);
local v17 = {
    CONTROL = "control", 
    VARIANT1 = "variant1", 
    VARIANT2 = "variant2", 
    VARIANT3 = "variant3"
};
local v18 = {
    None = 0, 
    VoiceChat = 1, 
    AccountSecurity = 2
};
local v19 = {
    Invalid = 0, 
    Disabled = 1, 
    EnabledExistingUser = 2, 
    EnabledNewUser = 3
};
local v20 = {
    Control = "Control", 
    OnlyConnectDisconnect = "V2-Variant-1", 
    HearingWithoutMicPermissions = "V2-Variant-2", 
    LikelySpeakingBubblesRemoved = "V2-Variant-3"
};
local v21 = {
    Control = "Control", 
    ConnectDisconnect = "ConnectDisconnect", 
    HearingWithoutMicPermissions = "HearingWithoutMicPermissions", 
    LikelySpeakingBubblesRemoved = "LikelySpeakingBubblesRemoved", 
    JoinVoiceIsMutedMic = "JoinVoiceIsMutedMic", 
    ReducedCooldownLikelySpeakingBubbles = "ReducedCooldownLikelySpeakingBubbles", 
    JoinVoiceTooltip = "JoinVoiceTooltip", 
    InitialJoinVoice = "InitialJoinVoice", 
    DeferConnection = "DeferConnection", 
    HideJoinToastSubtitle = "HideJoinToastSubtitle"
};
return {
    MIN_VOICE_CHAT_API_VERSION = 3, 
    VOICE_JOIN_PROGRESS = v5, 
    MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY = 9, 
    MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED = 10, 
    VOICE_CHAT_AVAILABILITY = v1, 
    WATCHED_NAMESPACES = v2, 
    VOICE_GROUP_TYPE = v6, 
    WATCHED_MESSAGE_TYPES = v3, 
    PERMISSION_STATE = v4, 
    VOICE_URL = v15, 
    UPSELL_CARD_URL = v16, 
    IN_EXP_UPSELL_VARIANT = v17, 
    IN_EXP_PHONE_UPSELL_IXP_LAYER = "InExperience.UpsellCard", 
    EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER = "ExitConfirmation.UpsellCard", 
    PHONE_UPSELL_VOICE_CHAT_PROP = v18, 
    VOICE_CONNECT_DISCONNECT_KEY = "InExpVoiceUIVisibility", 
    VOICE_CONNECT_DISCONNECT_KEY_V2 = "SeamlessConnectToVoice", 
    VOICE_CONNECT_DISCONNECT_KEY_V3 = "ConnectToVoice", 
    SEAMLESS_VOICE_FTUX_KEY = "SeamlessVoiceFTUX", 
    SeamlessVoiceStatus = v19, 
    SeamlessVoiceVariants = v20, 
    SeamlessVoiceFeatures = v21, 
    REWARDED_VIDEO_AD_STARTED = "RewardedVideoAdStarted", 
    REWARDED_VIDEO_AD_ENDED = "RewardedVideoAdEnded", 
    FAE_ENABLED = "Enabled", 
    FAE_SETTINGS_TOAST = "SettingsToast"
};