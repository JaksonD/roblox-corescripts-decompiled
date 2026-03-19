local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.analytics.analyticsService);
local v4 = require(l_Parent_0.dependencies);
local l_NotificationSnoozedSignal_0 = require(l_Parent_0.Signals).NotificationSnoozedSignal;
local v6 = require(l_Parent_0.type);
local l_Cryo_0 = v4.Cryo;
local l_LocalStorage_0 = v4.LocalStorage;
local l_NotificationModalsManager_0 = v4.NotificationModalsManager;
local l_Images_0 = v4.UIBlox.App.ImageSet.Images;
local l_LocalStorageKey_0 = l_LocalStorage_0.Enums.LocalStorageKey;
local l_FFlagUseNotificationGroupsConfig_0 = v4.SharedFlags.FFlagUseNotificationGroupsConfig;
local v13 = {};
v13.__index = v13;
v13._batchNotificationAction = function(v14, v15, v16) --[[ Line: 34 ]] --[[ Name: _batchNotificationAction ]]
    -- upvalues: v6 (copy), l_NotificationSnoozedSignal_0 (copy)
    local v17 = nil;
    v17 = if type(v15.notificationType) == "table" then v15.notificationType else {
        v15.notificationType
    };
    for _, v19 in ipairs(v17) do
        if v16 == v6.SnoozeActionEnum.Mute then
            v14.snoozedNotificationTypes[v19] = {
                durationMinutes = v15.durationMinutes, 
                snoozedTimestampMs = DateTime.now().UnixTimestampMillis
            };
        elseif v16 == v6.SnoozeActionEnum.Unmute and v14.snoozedNotificationTypes[v19] then
            v14.snoozedNotificationTypes[v19] = nil;
        end;
    end;
    v14:_updateAppStorage();
    local v20 = v15.context or "";
    for _, v22 in ipairs(v17) do
        local v23 = {
            action_type = v16, 
            duration_minutes = v15.durationMinutes, 
            notification_type = v22
        };
        v14._eventStream.sendEventDeferred(v20, "notificationSnoozedEvent", v23);
        l_NotificationSnoozedSignal_0:fire({
            actionType = v16, 
            context = v15.context, 
            durationMinutes = v15.durationMinutes, 
            notificationType = v22
        });
    end;
    if v15.modalMessage and v15.modalMessage ~= "" then
        v14:_showNotificationsModal(v15.modalMessage);
    end;
end;
v13._isExpiredSnooze = function(v24) --[[ Line: 93 ]] --[[ Name: _isExpiredSnooze ]]
    if v24.durationMinutes ~= -1 and (DateTime.now().UnixTimestampMillis - v24.snoozedTimestampMs) / 1000 >= v24.durationMinutes * 60 then
        return true;
    else
        return false;
    end;
end;
v13._showNotificationsModal = function(_, v26) --[[ Line: 107 ]] --[[ Name: _showNotificationsModal ]]
    -- upvalues: l_NotificationModalsManager_0 (copy), l_Images_0 (copy)
    l_NotificationModalsManager_0.SetUIBloxToast({
        iconImage = l_Images_0["icons/common/notificationOn"], 
        toastTitle = v26
    });
end;
v13._updateAppStorage = function(v27) --[[ Line: 124 ]] --[[ Name: _updateAppStorage ]]
    -- upvalues: l_LocalStorageKey_0 (copy), l_HttpService_0 (copy)
    v27._appStorageService:SetItem(l_LocalStorageKey_0.SnoozedNotificationTypesLocalStorageKey, l_HttpService_0:JSONEncode(v27.snoozedNotificationTypes));
    v27._appStorageService:Flush();
end;
v13.unmuteNotification = function(v28, v29) --[[ Line: 141 ]] --[[ Name: unmuteNotification ]]
    -- upvalues: l_FFlagUseNotificationGroupsConfig_0 (copy), v6 (copy), l_NotificationSnoozedSignal_0 (copy)
    if l_FFlagUseNotificationGroupsConfig_0 then
        v28:_batchNotificationAction(v29, v6.SnoozeActionEnum.Unmute);
        return;
    else
        if v28.snoozedNotificationTypes[v29.notificationType] then
            v28.snoozedNotificationTypes[v29.notificationType] = nil;
        end;
        v28:_updateAppStorage();
        l_NotificationSnoozedSignal_0:fire({
            actionType = v6.SnoozeActionEnum.Unmute, 
            notificationType = v29.notificationType
        });
        local v30 = v29.context or "";
        local v31 = {
            action_type = v6.SnoozeActionEnum.Unmute, 
            notification_type = v29.notificationType
        };
        v28._eventStream.sendEventDeferred(v30, "notificationSnoozedEvent", v31);
        if v29.modalMessage and v29.modalMessage ~= "" then
            v28:_showNotificationsModal(v29.modalMessage);
        end;
        return;
    end;
end;
v13.snoozeNotification = function(v32, v33) --[[ Line: 183 ]] --[[ Name: snoozeNotification ]]
    -- upvalues: l_FFlagUseNotificationGroupsConfig_0 (copy), v6 (copy), l_Cryo_0 (copy), l_NotificationSnoozedSignal_0 (copy)
    if l_FFlagUseNotificationGroupsConfig_0 then
        v32:_batchNotificationAction(v33, v6.SnoozeActionEnum.Mute);
        return;
    else
        v32.snoozedNotificationTypes = l_Cryo_0.Dictionary.join(v32.snoozedNotificationTypes, {
            [v33.notificationType] = {
                durationMinutes = v33.durationMinutes, 
                snoozedTimestampMs = DateTime.now().UnixTimestampMillis
            }
        });
        v32:_updateAppStorage();
        local v34 = v33.context or "";
        local v35 = {
            action_type = v6.SnoozeActionEnum.Mute, 
            duration_minutes = v33.durationMinutes, 
            notification_type = v33.notificationType
        };
        v32._eventStream.sendEventDeferred(v34, "notificationSnoozedEvent", v35);
        l_NotificationSnoozedSignal_0:fire({
            actionType = v6.SnoozeActionEnum.Mute, 
            context = v33.context, 
            durationMinutes = v33.durationMinutes, 
            notificationType = v33.notificationType
        });
        if v33.modalMessage and v33.modalMessage ~= "" then
            v32:_showNotificationsModal(v33.modalMessage);
        end;
        return;
    end;
end;
v13.isSnoozedNotificationType = function(v36, v37) --[[ Line: 232 ]] --[[ Name: isSnoozedNotificationType ]]
    -- upvalues: l_Cryo_0 (copy)
    if v36.snoozedNotificationTypes[v37] then
        if v36._isExpiredSnooze(v36.snoozedNotificationTypes[v37]) then
            v36.snoozedNotificationTypes = l_Cryo_0.Dictionary.omit(v36.snoozedNotificationTypes, v37);
            v36:_updateAppStorage();
            return false;
        else
            return true;
        end;
    else
        return false;
    end;
end;
v13.new = function(v38) --[[ Line: 250 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v13 (copy), l_LocalStorageKey_0 (copy), l_HttpService_0 (copy)
    local v39 = {
        _appStorageService = v38, 
        _eventStream = v3.EventStream, 
        snoozedNotificationTypes = {}
    };
    setmetatable(v39, v13);
    local v40 = {};
    local v41 = {};
    local v42 = false;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 263 ]]
        -- upvalues: v39 (copy), l_LocalStorageKey_0 (ref)
        return v39._appStorageService:GetItem(l_LocalStorageKey_0.SnoozedNotificationTypesLocalStorageKey);
    end);
    if l_status_0 and l_result_0 ~= "" then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 268 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
            return l_HttpService_0:JSONDecode(l_result_0);
        end);
        if l_status_1 then
            v40 = l_result_1;
        end;
    end;
    for v47, v48 in pairs(v40) do
        if v39._isExpiredSnooze(v48) then
            v42 = true;
        else
            v41[v47] = v48;
        end;
    end;
    v39.snoozedNotificationTypes = v41;
    if v42 then
        v39:_updateAppStorage();
    end;
    return v39;
end;
v13.default = v13.new(l_AppStorageService_0);
return v13;