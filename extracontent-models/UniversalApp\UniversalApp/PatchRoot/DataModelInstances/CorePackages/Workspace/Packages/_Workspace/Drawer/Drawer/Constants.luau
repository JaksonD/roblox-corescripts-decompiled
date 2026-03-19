local v0 = game:DefineFastInt("DrawerSwipeVelocityThreshold", 400);
local v1 = game:DefineFastInt("DrawerSwipeThresholdPercent", 30);
return {
    DRAWER_VELOCITY_THRESHOLD = v0, 
    DRAWER_SWIPE_THRESHOLD_PERCENT = v1 / 100, 
    SWIPE_OPEN_EDGE_THRESHOLD = 20, 
    SCRIM_TRANSPARENCY = 0.35, 
    DRAWER_ANIM_SETTINGS = {
        duration = 0.3, 
        easingStyle = {
            0.2, 
            0, 
            0, 
            1
        }, 
        startingValue = nil
    }
};