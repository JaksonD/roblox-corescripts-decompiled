local l_Parent_0 = script.Parent;
local l_NotificationTypeEnum_0 = require(l_Parent_0.type).NotificationTypeEnum;
return {
    ChatMessageGroup = {
        l_NotificationTypeEnum_0.ChatNewMessage, 
        l_NotificationTypeEnum_0.SquadInvitation
    }, 
    ChatLandingNotificationsGroup = {
        l_NotificationTypeEnum_0.ChatNewMessage, 
        l_NotificationTypeEnum_0.SquadInvitation, 
        l_NotificationTypeEnum_0.SquadStartPartyPrompt, 
        l_NotificationTypeEnum_0.SquadNudgeInvite
    }, 
    SquadNudgeInviteGroup = {
        l_NotificationTypeEnum_0.SquadNudgeInvite
    }, 
    SquadStartPartyPromptGroup = {
        l_NotificationTypeEnum_0.SquadStartPartyPrompt
    }
};