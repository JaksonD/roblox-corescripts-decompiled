local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("Payments", "processPendingPurchase");
local l_l_MessageBusService_0_MessageId_1 = l_MessageBusService_0:GetMessageId("Payments", "sendIAPEvent");
local l_l_MessageBusService_0_MessageId_2 = l_MessageBusService_0:GetMessageId("Payments", "onPurchaseProcessed");
return {
    NAME = "Payments", 
    MESSAGE_PROCESS_PENDING_PURCHASE = l_l_MessageBusService_0_MessageId_0, 
    MESSAGE_SEND_IAP_EVENT = l_l_MessageBusService_0_MessageId_1, 
    MESSAGE_ON_PURCHASE_PROCESSED_EVENT = l_l_MessageBusService_0_MessageId_2, 
    METHOD_LIST_NATIVE_PRODUCTS = "listNativeProducts", 
    METHOD_IS_AVAILABLE = "isAvailable"
};