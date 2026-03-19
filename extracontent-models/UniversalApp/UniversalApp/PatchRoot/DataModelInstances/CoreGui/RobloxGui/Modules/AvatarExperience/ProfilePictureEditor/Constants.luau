local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
return {
    CameraFieldOfViewDeg = 70, 
    ViewportHalfWidthUnits = 1.25, 
    PeekabooBorderWidthPix = 6, 
    AnalyticsTag = "LuaProfilePictureEditor", 
    SliderMax = 20, 
    YRotMaxDeg = 60, 
    ZoomMinScale = 0.5, 
    PPEConfigFetchStatusKey = "avatar.ppe.fetchStatus", 
    PPEConfigWriteStatusKeys = {
        [v1.Closeup] = "avatar.ppe.closeup.writeStatus", 
        [v1.FullBody] = "avatar.ppe.fullBody.writeStatus"
    }, 
    FullscreenTweenTimeSeconds = 0.25, 
    CircleCutoutAsset = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png"
};