local l_Parent_0 = script:FindFirstAncestor("RealtimeDelivery").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.useRobloxEventReceiver);
return function() --[[ Line: 7 ]] --[[ Name: useRealtimeConnectionState ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v3 = v2();
    local v4, v5 = v1.useState(Enum.ConnectionState.Connected);
    v1.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: v3 (copy), v5 (copy)
        local v7 = v3:observeEvent("signalR", function(v6) --[[ Line: 12 ]]
            -- upvalues: v5 (ref)
            v5(v6);
        end);
        return function() --[[ Line: 16 ]]
            -- upvalues: v7 (copy)
            v7:disconnect();
        end;
    end, {
        v3
    });
    return v4;
end;