local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.RealtimeDelivery);
local _ = require(script.Parent.CommunicationChannelsTypes);
return function(v3, v4) --[[ Line: 8 ]] --[[ Name: useRealtimePlatformChat ]]
    -- upvalues: v1 (copy)
    v1.useRealtimeNamespace("CommunicationChannels", function(v5) --[[ Line: 9 ]]
        -- upvalues: v3 (copy)
        if v5.ChannelVertical == "PlatformChat" then
            v3(v5);
        end;
    end, v4);
end;