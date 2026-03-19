local v0 = require(script.Parent.Parent.Parent.CircularBuffer);
local v1 = require(script.Parent.Parent.Parent.Signal);
local v2 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"));
local v3 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v4 = {};
v4.__index = v4;
v4.new = function() --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v1 (copy)
    local v5 = {};
    setmetatable(v5, v4);
    v5._serverStatsUpdated = v1.new();
    v5._serverStatsPing = v1.new();
    v5._serverStatsData = {};
    v5._serverStatsDataCount = 0;
    v5._lastUpdateTime = 0;
    v5._isRunning = false;
    return v5;
end;
v4.avgPing = function(v6) --[[ Line: 27 ]] --[[ Name: avgPing ]]
    return v6._serverStatsPing;
end;
v4.Signal = function(v7) --[[ Line: 31 ]] --[[ Name: Signal ]]
    return v7._serverStatsUpdated;
end;
v4.getCurrentData = function(v8) --[[ Line: 35 ]] --[[ Name: getCurrentData ]]
    return v8._serverStatsData;
end;
v4.updateValue = function(v9, v10, v11) --[[ Line: 39 ]] --[[ Name: updateValue ]]
    -- upvalues: v0 (copy), v2 (copy)
    if not v9._serverStatsData[v10] then
        local v12 = v0.new(v2);
        v12:push_back({
            value = v11, 
            time = v9._lastUpdateTime
        });
        v9._serverStatsData[v10] = {
            max = v11, 
            min = v11, 
            dataSet = v12
        };
        return;
    else
        local v13 = v9._serverStatsData[v10];
        local l_max_0 = v13.max;
        local l_min_0 = v13.min;
        local v16 = {
            value = v11, 
            time = v9._lastUpdateTime
        };
        local v17 = v9._serverStatsData[v10].dataSet:push_back(v16);
        if v17 then
            local v18 = v9._serverStatsData[v10].dataSet:iterator();
            local v19 = v18:next();
            if l_max_0 == v17.value then
                l_max_0 = l_min_0;
                while v19 do
                    l_max_0 = v19.value < l_max_0 and l_max_0 or v19.value;
                    v19 = v18:next();
                end;
            end;
            if l_min_0 == v17.value then
                l_min_0 = l_max_0;
                while v19 do
                    l_min_0 = l_min_0 < v19.value and l_min_0 or v19.value;
                    v19 = v18:next();
                end;
            end;
        end;
        v9._serverStatsData[v10].max = l_max_0 < v11 and v11 or l_max_0;
        v9._serverStatsData[v10].min = l_min_0 < v11 and l_min_0 or v11;
        return;
    end;
end;
v4.isRunning = function(v20) --[[ Line: 87 ]] --[[ Name: isRunning ]]
    return v20._isRunning;
end;
v4.start = function(v21) --[[ Line: 91 ]] --[[ Name: start ]]
    -- upvalues: v3 (copy)
    local v22 = v3();
    if v22 and not v21._statsListenerConnection then
        v21._statsListenerConnection = v22.StatsReceived:connect(function(v23) --[[ Line: 94 ]]
            -- upvalues: v21 (copy)
            if v23 then
                v21._lastUpdateTime = os.time();
                local v24 = 0;
                for v25, v26 in pairs(v23) do
                    if type(v26) == "number" then
                        v21:updateValue(v25, v26);
                        v24 = v24 + 1;
                    end;
                end;
                v21._serverStatsDataCount = v24;
                v21._serverStatsUpdated:Fire(v21._serverStatsData);
                if v21._serverStatsData["Avg Data Ping ms"] then
                    v21._serverStatsPing:Fire(v21._serverStatsData["Avg Data Ping ms"].dataSet:back().value);
                end;
            end;
        end);
        v22:RequestServerStats(true);
        v21._isRunning = true;
    end;
end;
v4.stop = function(v27) --[[ Line: 117 ]] --[[ Name: stop ]]
    if v27._statsListenerConnection then
        v27._statsListenerConnection:Disconnect();
        v27._statsListenerConnection = nil;
    end;
    v27._isRunning = false;
end;
return v4;