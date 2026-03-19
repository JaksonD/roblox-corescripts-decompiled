local v0 = {
    PlaceNotAvailable = -1, 
    UserNotAvailable = 0, 
    Checking = 1, 
    Available = 2
};
local v1 = {
    Input = "Input", 
    Output = "Output"
};
local v2 = {
    INACTIVE = "Inactive", 
    TALKING = "Talking", 
    CONNECTING = "Connecting", 
    MUTED = "Muted", 
    LOCAL_MUTED = "LOCAL_MUTED", 
    ERROR = "Error", 
    HIDDEN = "Hidden"
};
local v3 = {
    VoiceNotifications = true, 
    VoiceModeration = true
};
local v4 = {
    "ParticipantModeratedFromVoice", 
    "VoiceToxicityModal", 
    "VoiceToxicityToast"
};
local v5 = {
    IDLE = "Idle", 
    VOICE_DISABLED = "Voice Disabled", 
    LISTEN_AND_TALK = "Listen and Talk", 
    LISTEN_ONLY = "Listen Only", 
    PENDING_MIC = "Pending Mic"
};
return {
    VOICE_STATE = v2, 
    USER_INELIGIBLE_WARNING = "Current Player is not eligible to use Spatial Voice", 
    PLACE_INELIGIBLE_WARNING = "Current place is not eligible for Spatial Voice. Spatial Voice is available for places with Max Players <= 30.", 
    MIN_VOICE_CHAT_API_VERSION = 3, 
    MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY = 9, 
    MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED = 10, 
    VOICE_CHAT_AVAILABILITY = v0, 
    VOICE_CHAT_DEVICE_TYPE = v1, 
    WATCHED_NAMESPACES = v3, 
    WATCHED_MESSAGE_TYPES = v4, 
    PERMISSION_STATE = v5
};