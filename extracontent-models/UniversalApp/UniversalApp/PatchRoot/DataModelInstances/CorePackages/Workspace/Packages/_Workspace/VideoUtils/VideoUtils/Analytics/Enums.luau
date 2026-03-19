local v0 = {
    AppBackgrounded = "appBackgrounded", 
    ExitViewport = "exitViewport", 
    ExperienceLaunched = "experienceLaunched", 
    PlayabilityCheckFailed = "playabilityCheckFailed", 
    TileClicked = "tileClicked", 
    Unhovered = "unhovered", 
    Unmounted = "unmounted"
};
local v1 = {
    VIDEO_UNKNOWN_EVENT = "VIDEO_UNKNOWN_EVENT", 
    VIDEO_IMPRESSION = "VIDEO_IMPRESSION", 
    VIDEO_ACTION = "VIDEO_ACTION", 
    VIDEO_PROGRESS = "VIDEO_PROGRESS"
};
local v2 = {
    unknown = "unknown", 
    complete = "complete", 
    ended = "end", 
    exit_fullscreen = "exit_fullscreen", 
    fullscreen = "fullscreen", 
    hover = "hover", 
    load = "load", 
    loop = "loop", 
    navigate = "navigate", 
    pause = "pause", 
    play = "play", 
    scrub = "scrub", 
    volume = "volume"
};
local v3 = {
    community = "community", 
    MediaGallery = "MediaGallery"
};
return {
    VideoEndReason = v0, 
    VideoEngagementEvents = v1, 
    VideoActions = v2, 
    VideoSources = v3
};