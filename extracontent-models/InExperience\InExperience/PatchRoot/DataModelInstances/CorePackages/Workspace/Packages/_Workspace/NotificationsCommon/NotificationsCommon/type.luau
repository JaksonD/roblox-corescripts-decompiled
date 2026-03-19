local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.ToastNotificationsProtocol);
local v2 = {
    Button = "button", 
    TextBody = "textBody", 
    Thumbnail = "thumbnail", 
    MetaAction = "metaAction"
};
local v3 = {
    UniversalApp = "universalApp", 
    CoreScript = "coreScript"
};
local v4 = {
    Portrait = "Portrait", 
    Landscape = "Landscape", 
    Unknown = "Unknown"
};
local v5 = {
    Report = "reportNotification", 
    Deeplink = "deeplink", 
    NotificationApi = "notificationAPI", 
    Dismiss = "dismiss", 
    Reload = "reload", 
    None = "none", 
    VoltronBroadcast = "voltronBroadcast", 
    UpdateState = "updateState", 
    ClientTrigger = "clientTrigger"
};
local v6 = {
    Primary = "Primary", 
    Secondary = "Secondary", 
    Alert = "Alert", 
    Growth = "Growth"
};
local v7 = {
    User = "userThumbnail", 
    Game = "gameThumbnail", 
    Group = "groupThumbnail", 
    Asset = "assetThumbnail", 
    Bundle = "bundleThumbnail", 
    Icon = "icon", 
    GamePass = "gamePassThumbnail", 
    AvatarImageUrl = "avatarImageUrlThumbnail"
};
local v8 = {
    CallReceived = "CallReceived"
};
local v9 = {
    App = "toast-in-app-notifications", 
    Experience = "toast-in-experience-notifications", 
    Dual = "toast-in-app-and-experience-notifications", 
    Desktop = "toast-in-app-and-experience-desktop-notifications"
};
local v10 = {
    ModalCancel = "modalCancel", 
    ModalConfirm = "modalConfirm", 
    Dismissed = "dismissed", 
    Display = "displayed", 
    Hover = "hoverOver", 
    Ignored = "ignored", 
    Update = "update", 
    DeeplinkFailed = "deeplinkFailed"
};
return {
    ChannelListEnum = v9, 
    ActionTypeEnum = v5, 
    SENDERButtonStyleEnum = v6, 
    SENDERThumbnailTypeEnum = v7, 
    ToastNotificationActionsEnum = v10, 
    RenderLocationEnum = v3, 
    DeviceOrientationEnum = v4, 
    VisualItemTypeEnum = v2, 
    NotificationTypeEnum = v8
};