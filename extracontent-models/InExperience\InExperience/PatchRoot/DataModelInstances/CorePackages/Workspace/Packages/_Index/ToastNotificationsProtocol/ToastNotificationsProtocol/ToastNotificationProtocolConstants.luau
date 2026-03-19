local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("ToastNotifications", "initializeToastNotifications");
local l_l_MessageBusService_0_MessageId_1 = l_MessageBusService_0:GetMessageId("ToastNotifications", "getToastNotification");
local l_l_MessageBusService_0_MessageId_2 = l_MessageBusService_0:GetMessageId("ToastNotifications", "updateToastNotificationState");
local l_l_MessageBusService_0_MessageId_3 = l_MessageBusService_0:GetMessageId("ToastNotifications", "dismissToastNotification");
local l_l_MessageBusService_0_MessageId_4 = l_MessageBusService_0:GetMessageId("ToastNotifications", "displayToastNotification");
return {
    PROTOCOL_NAME = "ToastNotifications", 
    MESSAGE_INIT_TOAST_NOTIF = l_l_MessageBusService_0_MessageId_0, 
    MESSAGE_GET_TOAST_NOTIF = l_l_MessageBusService_0_MessageId_1, 
    MESSAGE_UPDATE_TOAST_NOTIF = l_l_MessageBusService_0_MessageId_2, 
    MESSAGE_DISMISS_TOAST_NOTIF = l_l_MessageBusService_0_MessageId_3, 
    MESSAGE_DISPLAY_TOAST_NOTIF = l_l_MessageBusService_0_MessageId_4
};