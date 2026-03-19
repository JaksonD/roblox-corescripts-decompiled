local v0 = {
    USER_AGENCY = "useragency", 
    BUBBLE_CHAT = "bubblechat", 
    IN_GAME_MENU = "ingamemenu", 
    MUTE_TOGGLES = "mutetoggles", 
    REPORT_MENU = "reportmenu", 
    EASIER_UNMUTING = "easierunmuting", 
    UNKNOWN = "unknown"
};
local v1 = {
    ALL = "all", 
    FRIENDS = "friends", 
    NONFRIENDS = "nonfriends"
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
    NUDGE_V3 = 7
};
local v4 = {
    Idle = "Idle", 
    Joining = "Joining", 
    Suspended = "Suspended", 
    Joined = "Joined", 
    Left = "Left"
};
local v5 = {
    CONTROL = "control", 
    VARIANT1 = "variant1", 
    VARIANT2 = "variant2", 
    VARIANT3 = "variant3"
};
local v6 = {
    IN_EXP_UPSELL = "in-experience-voice-upsell", 
    DATA_CONSENT_TOAST = "data-consent-toast", 
    IN_EXP_JOIN_VOICE_UPSELL = "join-voice-upsell-tooltip"
};
local v7 = {
    JOIN_VOICE = "joinVoiceButton", 
    LIKELY_SPEAKING = "likelySpeakingBubble"
};
local v8 = {
    None = 0, 
    VoiceChat = 1, 
    AccountSecurity = 2
};
return {
    VOICE_CONTEXT_TYPE = v0, 
    VOICE_JOIN_PROGRESS = v4, 
    VOICE_GROUP_TYPE = v1, 
    VOICE_STATE = v2, 
    BAN_REASON = v3, 
    IN_EXP_UPSELL_VARIANT = v5, 
    MODAL_IDS = v6, 
    IN_EXP_UPSELL_ENTRYPOINTS = v7, 
    IN_EXP_PHONE_UPSELL_IXP_LAYER = "InExperience.UpsellCard", 
    EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER = "ExitConfirmation.UpsellCard", 
    PHONE_UPSELL_VALUE_PROP = v8, 
    SEAMLESS_VOICE_FTUX_KEY = "SeamlessVoiceFTUX", 
    SEAMLESS_VOICE_STUX_KEY = "SeamlessVoiceSTUXCount", 
    SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER = 3, 
    VOICE_WITH_TC_TOAST_KEY = "VoiceWithTcToast"
};