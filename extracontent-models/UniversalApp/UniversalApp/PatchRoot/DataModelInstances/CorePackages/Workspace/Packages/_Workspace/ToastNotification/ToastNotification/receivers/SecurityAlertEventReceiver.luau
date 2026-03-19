local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_GetFFlagGenerateLinkWithChannel_0 = require(l_Parent_1.SharedFlags).GetFFlagGenerateLinkWithChannel;
local v3 = require(l_Parent_0.utils.WebViewServiceWrapper);
local v4 = require(l_Parent_1.React);
local l_UrlBuilder_0 = require(l_Parent_1.UrlBuilder).UrlBuilder;
local v6 = require(l_Parent_0.utils.LifecycleEvents);
local l_NotificationTypeEnum_0 = require(l_Parent_0.type).NotificationTypeEnum;
local l_default_0 = require(l_Parent_1.ToastNotificationsProtocol).ToastNotificationProtocol.default;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.RobloxAppLocales).Localization;
return function() --[[ Line: 19 ]] --[[ Name: SecurityEventReceiver ]]
    -- upvalues: v4 (copy), v6 (copy), l_NotificationTypeEnum_0 (copy), l_GetFFlagGenerateLinkWithChannel_0 (copy), l_UrlBuilder_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v3 (copy), l_default_0 (copy)
    v4.useEffect(function() --[[ Line: 20 ]]
        -- upvalues: v6 (ref), l_NotificationTypeEnum_0 (ref), l_GetFFlagGenerateLinkWithChannel_0 (ref), l_UrlBuilder_0 (ref), l_Localization_0 (ref), l_LocalizationService_0 (ref), v3 (ref), l_default_0 (ref)
        local v16 = v6:RegisterCallback(v6.ToastEvents.UserAction, l_NotificationTypeEnum_0.SecurityAlert, function(v11) --[[ Line: 24 ]]
            -- upvalues: l_GetFFlagGenerateLinkWithChannel_0 (ref), l_UrlBuilder_0 (ref), l_Localization_0 (ref), l_LocalizationService_0 (ref), v3 (ref), l_default_0 (ref)
            if not v11 or not v11.notificationData or not v11.notificationData.notificationType or not v11.notificationData.clientEventsPayload or not v11.notificationData.clientEventsPayload.payload or not v11.notificationData.clientEventsPayload.username then
                return;
            else
                local l_payload_0 = v11.notificationData.clientEventsPayload.payload;
                local l_username_0 = v11.notificationData.clientEventsPayload.username;
                local v14 = nil;
                v14 = if l_GetFFlagGenerateLinkWithChannel_0() then l_UrlBuilder_0.static.securityAlertWithChannel({
                    payload = l_payload_0, 
                    username = l_username_0, 
                    channel = "toast"
                }) else l_UrlBuilder_0.static.securityAlert({
                    payload = l_payload_0, 
                    username = l_username_0
                });
                local v15 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId):Format("Feature.SecurityFeedback.Header.NewLogin");
                v3.new({
                    title = v15, 
                    url = v14
                }):open();
                l_default_0:dismissNotification(v11.notificationData.id);
                return;
            end;
        end);
        return function() --[[ Line: 65 ]]
            -- upvalues: v16 (copy)
            v16();
        end;
    end, {});
end;