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
local v14 = game:DefineFastFlag("TCEventReceiverFriendsRename", false);
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("ToastNotifications", "TrustedConnectionRequestReceived");
return function() --[[ Line: 26 ]] --[[ Name: TrustedConnectionEventReceiver ]]
    -- upvalues: l_useTCAnalytics_0 (copy), l_useLocalization_0 (copy), v14 (copy), v13 (copy), v3 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy), v6 (copy), l_FFlagTCNotifFixEventName_0 (copy), l_EventNames_0 (copy), v2 (copy), v8 (copy)
    local l_fireAnalyticsEvent_0 = l_useTCAnalytics_0().fireAnalyticsEvent;
    local v17 = l_useLocalization_0({
        somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        isATrustedFriendNowToast = v14 and "Feature.Friends.TrustedFriend.Toast.IsATrustedFriendNow" or nil, 
        isATrustedConnectionNowToast = if v14 then nil else v13 and "Feature.Friends.TrustedConnection.Toast.IsATrustedConnectionNow" or nil
    });
    v3.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: l_MessageBusService_0 (ref), l_l_MessageBusService_0_MessageId_0 (ref), v6 (ref), l_fireAnalyticsEvent_0 (copy), l_FFlagTCNotifFixEventName_0 (ref), l_EventNames_0 (ref), v2 (ref), v13 (ref), v14 (ref), v17 (copy), v8 (ref)
        local v20 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function(v18) --[[ Line: 43 ]]
            -- upvalues: v6 (ref), l_fireAnalyticsEvent_0 (ref), l_FFlagTCNotifFixEventName_0 (ref), l_EventNames_0 (ref), v2 (ref), v13 (ref), v14 (ref), v17 (ref), v8 (ref)
            v6.acceptTrustedConnectionRequest(v18.senderUserId):andThen(function() --[[ Line: 45 ]]
                -- upvalues: l_fireAnalyticsEvent_0 (ref), l_FFlagTCNotifFixEventName_0 (ref), l_EventNames_0 (ref), v18 (copy), v2 (ref), v13 (ref), v14 (ref), v17 (ref), v8 (ref)
                l_fireAnalyticsEvent_0(if l_FFlagTCNotifFixEventName_0 then l_EventNames_0.TCToastNotificationAcceptClicked else l_EventNames_0.TCStreamNotificationAcceptClicked, {
                    friendId = v18.senderUserId
                });
                v2.SetUIBloxToast({
                    sequenceNumber = DateTime.now().UnixTimestamp, 
                    toastTitle = if v13 then string.gsub(if v14 then v17.isATrustedFriendNowToast else v17.isATrustedConnectionNowToast, "{name}", v18.senderName) else v8:Format("Feature.Friends.TrustedConnection.Toast.IsATrustedConnectionNow", {
                        name = v18.senderName
                    })
                });
            end):catch(function(_) --[[ Line: 70 ]]
                -- upvalues: v2 (ref), v17 (ref)
                v2.SetUIBloxToast({
                    sequenceNumber = DateTime.now().UnixTimestamp, 
                    toastTitle = v17.somethingIsWrongToast
                });
            end);
        end, false, true);
        return function() --[[ Line: 81 ]]
            -- upvalues: v20 (copy)
            if v20 then
                v20:Disconnect();
            end;
        end;
    end, {
        v17.somethingIsWrongToast, 
        l_fireAnalyticsEvent_0
    });
end;