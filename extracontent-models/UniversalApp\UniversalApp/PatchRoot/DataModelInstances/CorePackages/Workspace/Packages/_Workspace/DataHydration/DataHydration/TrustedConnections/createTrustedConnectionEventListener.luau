local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.RealtimeDelivery).RobloxEventReceiver.new(l_NotificationService_0);
local l_getLocalPlayerUserId_0 = require(l_script_FirstAncestor_0.DataHydrationUtils).getLocalPlayerUserId;
local v6 = require(l_script_FirstAncestor_0.TrustedConnections.Enums.TrustedConnectionStatus);
local v7 = {
    Namespace = "TrustedConnectionNotifications", 
    EventTypes = {
        TrustedConnectionCreated = 1, 
        TrustedConnectionDeleted = 2, 
        TrustedConnectionRequestSent = 3, 
        TrustedConnectionRequestAccepted = 4, 
        TrustedConnectionRequestIgnored = 5
    }
};
return function(v8) --[[ Line: 37 ]] --[[ Name: createTrustedConnectionEventListener ]]
    -- upvalues: l_getLocalPlayerUserId_0 (copy), l_Players_0 (copy), v4 (copy), v7 (copy), v6 (copy)
    local v9 = l_getLocalPlayerUserId_0();
    local v11 = l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 45 ]]
        -- upvalues: l_getLocalPlayerUserId_0 (ref), v9 (ref)
        local v10 = l_getLocalPlayerUserId_0();
        if v10 ~= v9 then
            v9 = v10;
        end;
    end);
    local v17 = v4:observeEvent(v7.Namespace, function(v12) --[[ Line: 54 ]]
        -- upvalues: v9 (ref), v7 (ref), v8 (copy), v6 (ref)
        if not v12.Actor or not v12.Target or not v9 then
            return;
        else
            local v13 = tostring(v12.Actor);
            local v14 = tostring(v12.Target);
            local v15 = tostring(v9);
            if v12.EventType == v7.EventTypes.TrustedConnectionCreated then
                local v16 = if v13 == v15 then v14 else v13;
                v8(v16, v6.TrustedFriends);
            end;
            if v12.EventType == v7.EventTypes.TrustedConnectionDeleted then
                if v15 == v13 then
                    v8(v14, v6.RequestReceived);
                else
                    v8(v13, v6.RequestSent);
                end;
            end;
            if v12.EventType == v7.EventTypes.TrustedConnectionRequestSent then
                if v15 == v13 then
                    v8(v14, v6.RequestSent);
                    return;
                else
                    v8(v13, v6.RequestReceived);
                end;
            end;
            return;
        end;
    end);
    return function() --[[ Line: 86 ]]
        -- upvalues: v11 (ref), v17 (copy)
        if v11 then
            v11:Disconnect();
            v11 = nil;
        end;
        if v17 then
            v17:disconnect();
            v11 = nil;
        end;
    end;
end;