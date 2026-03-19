local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.NotificationModalsManager);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.DataHydration);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v6 = v4.TrustedConnections.TrustedConnectionsStore.get();
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v8 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
local l_Analytics_0 = require(l_CorePackages_0.Workspace.Packages.TrustedContacts).Analytics;
local l_useTCAnalytics_0 = l_Analytics_0.useTCAnalytics;
local l_EventNames_0 = l_Analytics_0.EventNames;
local l_FFlagTCNotifFixEventName_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagTCNotifFixEventName;
local v13 = game:DefineFastFlag("TCNotifFixLocalization", false);
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("ToastNotifications", "TrustedConnectionRequestReceived");
return function() --[[ Line: 25 ]] --[[ Name: TrustedConnectionEventReceiver ]]
    -- upvalues: l_useTCAnalytics_0 (copy), l_useLocalization_0 (copy), v13 (copy), v3 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy), v6 (copy), l_FFlagTCNotifFixEventName_0 (copy), l_EventNames_0 (copy), v2 (copy), v8 (copy)
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0().fireAnalyticsEvent;
    local v16 = l_useLocalization_0({
        somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        isATrustedConnectionNowToast = v13 and "Feature.Friends.TrustedConnection.Toast.IsATrustedConnectionNow" or nil
    });
    v3.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: l_MessageBusService_0 (ref), l_l_MessageBusService_0_MessageId_0 (ref), v6 (ref), l_fireAnalyticsEvent_0 (copy), l_FFlagTCNotifFixEventName_0 (ref), l_EventNames_0 (ref), v2 (ref), v13 (ref), v16 (copy), v8 (ref)
        local v19 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function(v17) --[[ Line: 38 ]]
            -- upvalues: v6 (ref), l_fireAnalyticsEvent_0 (ref), l_FFlagTCNotifFixEventName_0 (ref), l_EventNames_0 (ref), v2 (ref), v13 (ref), v16 (ref), v8 (ref)
            v6.acceptTrustedConnectionRequest(v17.senderUserId):andThen(function() --[[ Line: 40 ]]
                -- upvalues: l_fireAnalyticsEvent_0 (ref), l_FFlagTCNotifFixEventName_0 (ref), l_EventNames_0 (ref), v17 (copy), v2 (ref), v13 (ref), v16 (ref), v8 (ref)
                l_fireAnalyticsEvent_0(if l_FFlagTCNotifFixEventName_0 then l_EventNames_0.TCToastNotificationAcceptClicked else l_EventNames_0.TCStreamNotificationAcceptClicked, {
                    friendId = v17.senderUserId
                });
                v2.SetUIBloxToast({
                    sequenceNumber = DateTime.now().UnixTimestamp, 
                    toastTitle = if v13 then string.gsub(v16.isATrustedConnectionNowToast, "{name}", v17.senderName) else v8:Format("Feature.Friends.TrustedConnection.Toast.IsATrustedConnectionNow", {
                        name = v17.senderName
                    })
                });
            end):catch(function(_) --[[ Line: 59 ]]
                -- upvalues: v2 (ref), v16 (ref)
                v2.SetUIBloxToast({
                    sequenceNumber = DateTime.now().UnixTimestamp, 
                    toastTitle = v16.somethingIsWrongToast
                });
            end);
        end, false, true);
        return function() --[[ Line: 70 ]]
            -- upvalues: v19 (copy)
            if v19 then
                v19:Disconnect();
            end;
        end;
    end, {
        v16.somethingIsWrongToast, 
        l_fireAnalyticsEvent_0
    });
end;