local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.RoactRodux);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v6 = require(l_Modules_0.LuaApp.Thunks.ApiFetchUnreadNotificationCount);
local v7 = require(l_Modules_0.LuaApp.Actions.SetNotificationCount);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUpdateNotificationBadgeCountEnabled);
local v9 = v1.Component:extend("BadgeEventReceiver");
v9.init = function(v10) --[[ Line: 16 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy)
    local l_setNotificationCount_0 = v10.props.setNotificationCount;
    local l_getNotificationCount_0 = v10.props.getNotificationCount;
    local l_RobloxEventReceiver_0 = v10.props.RobloxEventReceiver;
    local l_networking_0 = v10.props.networking;
    if v8() then
        v10.lastSeqNumOfNotificationStream = nil;
    end;
    v10.tokens = {
        l_RobloxEventReceiver_0:observeEvent("UpdateNotificationBadge", function(v15, v16) --[[ Line: 26 ]]
            -- upvalues: l_setNotificationCount_0 (copy)
            if v16 == "NotificationIcon" then
                l_setNotificationCount_0((tonumber(v15.badgeString)));
            end;
        end), 
        l_RobloxEventReceiver_0:observeEvent("NotificationStream", function(v17, v18) --[[ Line: 32 ]]
            -- upvalues: l_setNotificationCount_0 (copy), l_getNotificationCount_0 (copy), l_networking_0 (copy), v8 (ref), v10 (copy)
            if v18 == "NotificationsRead" then
                l_setNotificationCount_0(0);
            else
                l_getNotificationCount_0(l_networking_0);
            end;
            if v8() and v17 and v17.SequenceNumber then
                v10.lastSeqNumOfNotificationStream = v17.SequenceNumber;
            end;
        end)
    };
    if v8() then
        table.insert(v10.tokens, l_RobloxEventReceiver_0:observeEvent("signalR", function(v19, _, v21) --[[ Line: 53 ]]
            -- upvalues: v10 (copy), l_getNotificationCount_0 (copy), l_networking_0 (copy)
            if v19 == Enum.ConnectionState.Connected and v21 and v21.NotificationStream then
                if v10.lastSeqNumOfNotificationStream ~= v21.NotificationStream then
                    l_getNotificationCount_0(l_networking_0);
                end;
                v10.lastSeqNumOfNotificationStream = v21.NotificationStream;
            end;
        end));
    end;
end;
v9.render = function(_) --[[ Line: 67 ]] --[[ Name: render ]]

end;
v9.willUnmount = function(v23) --[[ Line: 69 ]] --[[ Name: willUnmount ]]
    for _, v25 in pairs(v23.tokens) do
        v25:disconnect();
    end;
end;
v9 = v2.connect(nil, function(v26) --[[ Line: 75 ]]
    -- upvalues: v6 (copy), v7 (copy)
    return {
        getNotificationCount = function(v27) --[[ Line: 77 ]] --[[ Name: getNotificationCount ]]
            -- upvalues: v26 (copy), v6 (ref)
            return v26(v6(v27));
        end, 
        setNotificationCount = function(...) --[[ Line: 80 ]] --[[ Name: setNotificationCount ]]
            -- upvalues: v26 (copy), v7 (ref)
            return v26(v7(...));
        end
    };
end)(v9);
return (l_RoactServices_0.connect({
    networking = v5
})(v9));