local v0 = {
    MIC_ANIMATION = {
        FRAME_BUFFER = 3
    }, 
    ICONS = {
        DEFAULT_SPEAKER = "icons/controls/voice/speaker_0_dark", 
        MUTED_SPEAKER = "rbxasset://textures/ui/VoiceChat/SpeakerLight/Muted.png", 
        SPEAKER_OFF = "rbxasset://textures/ui/VoiceChat/SpeakerLight/Muted.png", 
        ANIMATED_SPEAKER_FORMAT = "icons/controls/voice/speaker_%d_dark"
    }
};
local v1 = {};
local v2 = {
    MUTE_PLAYER = "mute", 
    INSPECT = "inspect", 
    REPORT_PLAYER = "report", 
    BLOCK_PLAYER = "block", 
    ADD_FRIEND = "addFriend"
};
local v3 = {
    IN_GAME_MENU_NAME = "ingame_menu", 
    ENTRY_POINT = {
        PEOPLE_LIST = "people_list", 
        PEOPLE_CARD = "people_card", 
        PLAYER_PROFILE = "player_profile"
    }
};
return {
    VOICE_CHAT = v0, 
    ANALYTICS = v3, 
    FRIEND_STATUS = v1, 
    PERSON_BUTTONS = v2
};