local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Signals);
local l_NetworkProfiler_0 = require(l_Parent_1.Http).NetworkProfiler;
local _ = require(l_Parent_0.HttpStoreTypes);
return function(v5) --[[ Line: 13 ]] --[[ Name: createNetworkStatsHandler ]]
    -- upvalues: v2 (copy), l_NetworkProfiler_0 (copy)
    return v2.createEffect(function(v6) --[[ Line: 14 ]]
        -- upvalues: v5 (copy), l_NetworkProfiler_0 (ref)
        local v7 = v5(v6);
        if v7.status == "Success" then
            local l_response_0 = v7.response;
            if l_response_0.Stats then
                local l_Stats_0 = l_response_0.Stats;
                l_NetworkProfiler_0:track({
                    queued = l_Stats_0.DurationInQueue or 0, 
                    nameLookup = l_Stats_0.DurationNameLookup or -1, 
                    connect = l_Stats_0.DurationConnect or -1, 
                    sslHandshake = l_Stats_0.DurationSSLHandshake or -1, 
                    makeRequest = l_Stats_0.DurationMakeRequest or -1, 
                    receiveResponse = l_Stats_0.DurationReceiveResponse or -1
                });
            end;
        end;
    end);
end;