local l_Parent_0 = script:FindFirstAncestor("StreamNotifications").Parent;
local v1 = require(l_Parent_0.React);
local l_useTCStreamNotificationEventHandler_0 = require(l_Parent_0.TrustedContacts).EventHandlers.useTCStreamNotificationEventHandler;
return function() --[[ Line: 7 ]] --[[ Name: useClientTriggerEventHandler ]]
    -- upvalues: l_useTCStreamNotificationEventHandler_0 (copy), v1 (copy)
    local v3 = l_useTCStreamNotificationEventHandler_0();
    return (v1.useCallback(function(v4, v5) --[[ Line: 10 ]]
        -- upvalues: v3 (copy)
        if v4 == "TrustedContactsDoubleOptInModal" then
            v3({
                clientEventsPayload = v5.clientEventsPayload, 
                callback = v5.callback
            });
        end;
    end, {
        v3
    }));
end;