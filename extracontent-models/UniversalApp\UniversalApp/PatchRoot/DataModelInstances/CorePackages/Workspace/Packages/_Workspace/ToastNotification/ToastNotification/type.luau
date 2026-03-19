local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.ToastNotificationsProtocol);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local v3 = {
    Button = "button", 
    TextBody = "textBody", 
    Thumbnail = "thumbnail", 
    MetaAction = "metaAction"
};
local v4 = {
    UniversalApp = "universalApp", 
    CoreScript = "coreScript"
};
local v5 = {
    Mute = "Mute", 
    Unmute = "Unmute"
};
local v6 = {
    Portrait = "Portrait", 
    Landscape = "Landscape", 
    Unknown = "Unknown"
};
local v7 = {
    Report = "reportNotification", 
    Deeplink = "deeplink", 
    NotificationApi = "notificationAPI", 
    Dismiss = "dismiss", 
    Reload = "reload", 
    None = "none", 
    VoltronBroadcast = "voltronBroadcast", 
    UpdateState = "updateState", 
    WebView = "webview"
};
local v8 = {
    Primary = "Primary", 
    Secondary = "Secondary", 
    Alert = "Alert", 
    Growth = "Growth"
};
local v9 = {
    User = "userThumbnail", 
    Game = "gameThumbnail", 
    Group = "groupThumbnail", 
    Asset = "assetThumbnail", 
    Bundle = "bundleThumbnail", 
    Icon = "icon", 
    AvatarImageUrl = "avatarImageUrlThumbnail"
};
local v10 = {
    CallReceived = "CallReceived", 
    ChatNewMessage = "ChatNewMessage", 
    ScheduledSquadReminder = "ScheduledSquadReminder", 
    ScheduledSquadHappeningNow = "ScheduledSquadHappeningNow", 
    SquadInvitation = "SquadInvitation", 
    SquadExperienceInvitation = "SquadExperienceInvitation", 
    SquadJoinRequestPrompt = "SquadJoinRequestPrompt", 
    SquadAcceptJoinRequest = "SquadAcceptJoinRequest", 
    SquadStartPartyPrompt = "SquadStartPartyPrompt", 
    SquadNudgeInvite = "SquadNudgeInvite", 
    NudgeForInviterSquad = "NudgeForInviterSquad", 
    PromptUserToRequest = "PromptUserToRequest", 
    RequestToJoinParty = "RequestToJoinParty", 
    ClientNotification = "ClientNotification", 
    FriendRequestReceived = "FriendRequestReceived", 
    SecurityAlert = "SecurityAlert"
};
local v11 = {
    App = "toast-in-app-notifications", 
    Experience = "toast-in-experience-notifications", 
    Dual = "toast-in-app-and-experience-notifications", 
    Desktop = "toast-in-app-and-experience-desktop-notifications"
};
local v12 = {
    ModalCancel = "modalCancel", 
    ModalConfirm = "modalConfirm", 
    Dismissed = "dismissed", 
    Display = "displayed", 
    Hover = "hoverOver", 
    Ignored = "ignored", 
    Update = "update", 
    DeeplinkFailed = "deeplinkFailed"
};
local v13 = {
    snooze = l_Images_0["icons/common/snoozeNotificationsOff"]
};
return {
    ChannelListEnum = v11, 
    ActionTypeEnum = v7, 
    SENDERButtonStyleEnum = v8, 
    SENDERThumbnailTypeEnum = v9, 
    ToastNotificationActionsEnum = v12, 
    RenderLocationEnum = v4, 
    DeviceOrientationEnum = v6, 
    VisualItemTypeEnum = v3, 
    MetaActionIcons = v13, 
    NotificationTypeEnum = v10, 
    SnoozeActionEnum = v5
};