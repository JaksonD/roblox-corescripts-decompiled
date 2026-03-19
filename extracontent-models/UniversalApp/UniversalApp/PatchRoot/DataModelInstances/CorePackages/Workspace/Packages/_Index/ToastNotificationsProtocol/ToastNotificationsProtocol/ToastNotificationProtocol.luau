local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_0.ToastNotificationProtocolTypes);
local v5 = require(l_Parent_0.ToastNotificationProtocolConstants);
local l_getPlatformTarget_0 = require(l_Parent_1.Analytics).getPlatformTarget;
local v7 = {};
v7.__index = v7;
game:DefineFastFlag("LuaAppInitializeToastNotificationEventParams2", false);
v7.new = function() --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({}, v7));
end;
v7.setupNotifications = function(_, v9) --[[ Line: 23 ]] --[[ Name: setupNotifications ]]
    -- upvalues: l_getPlatformTarget_0 (copy), l_Players_0 (copy), l_MessageBusService_0 (copy), v5 (copy)
    if #v9 > 0 then
        local v10 = nil;
        local v11 = nil;
        if game:GetFastFlag("LuaAppInitializeToastNotificationEventParams2") then
            v11 = l_getPlatformTarget_0();
            v10 = if l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else "";
        end;
        l_MessageBusService_0:Publish(v5.MESSAGE_INIT_TOAST_NOTIF, {
            channels = v9, 
            userId = v10, 
            platform = v11
        });
    end;
end;
v7.updateNotification = function(_, v13, v14) --[[ Line: 39 ]] --[[ Name: updateNotification ]]
    -- upvalues: l_MessageBusService_0 (copy), v5 (copy)
    if v13 and v14 then
        l_MessageBusService_0:Publish(v5.MESSAGE_UPDATE_TOAST_NOTIF, {
            notificationId = v13, 
            stateName = v14
        });
    end;
end;
v7.voltronBroadcast = function(_, v16, v17) --[[ Line: 48 ]] --[[ Name: voltronBroadcast ]]
    -- upvalues: l_MessageBusService_0 (copy)
    if v16 then
        l_MessageBusService_0:Publish(v16, v17);
    end;
end;
v7.dismissNotification = function(_, v19) --[[ Line: 54 ]] --[[ Name: dismissNotification ]]
    -- upvalues: l_MessageBusService_0 (copy), v5 (copy)
    if v19 then
        l_MessageBusService_0:Publish(v5.MESSAGE_DISMISS_TOAST_NOTIF, {
            notificationId = v19
        });
    end;
end;
v7.listenToDisplayNotification = function(_, v21) --[[ Line: 62 ]] --[[ Name: listenToDisplayNotification ]]
    -- upvalues: l_MessageBusService_0 (copy), v5 (copy)
    return l_MessageBusService_0:Subscribe(v5.MESSAGE_DISPLAY_TOAST_NOTIF, v21, false, true);
end;
v7.listenToDismissNotification = function(_, v23) --[[ Line: 66 ]] --[[ Name: listenToDismissNotification ]]
    -- upvalues: l_MessageBusService_0 (copy), v5 (copy)
    return l_MessageBusService_0:Subscribe(v5.MESSAGE_DISMISS_TOAST_NOTIF, v23, false, true);
end;
v7.default = v7.new();
return v7;