local v0 = require(script.Parent.Parent.Parent.CircularBuffer);
local v1 = require(script.Parent.Parent.Parent.Signal);
local v2 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"));
local v3 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v4 = {};
v4.__index = v4;
v4.new = function() --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v1 (copy)
    local v5 = {};
    setmetatable(v5, v4);
    v5._dataStoresUpdated = v1.new();
    v5._dataStoresData = {};
    v5._dataStoresDataCount = 0;
    v5._lastUpdateTime = 0;
    v5._isRunning = false;
    return v5;
end;
v4.Signal = function(v6) --[[ Line: 24 ]] --[[ Name: Signal ]]
    return v6._dataStoresUpdated;
end;
v4.getCurrentData = function(v7) --[[ Line: 28 ]] --[[ Name: getCurrentData ]]
    return v7._dataStoresData, v7._dataStoresDataCount;
end;
v4.updateValue = function(v8, v9, v10) --[[ Line: 32 ]] --[[ Name: updateValue ]]
    -- upvalues: v0 (copy), v2 (copy)
    if not v8._dataStoresData[v9] then
        local v11 = v0.new(v2);
        v11:push_back({
            value = v10, 
            time = v8._lastUpdateTime
        });
        v8._dataStoresData[v9] = {
            max = v10, 
            min = v10, 
            dataSet = v11
        };
        return;
    else
        local v12 = v8._dataStoresData[v9];
        local l_max_0 = v12.max;
        local l_min_0 = v12.min;
        local v15 = {
            value = v10, 
            time = v8._lastUpdateTime
        };
        local v16 = v8._dataStoresData[v9].dataSet:push_back(v15);
        if v16 then
            local v17 = v8._dataStoresData[v9].dataSet:iterator();
            local v18 = v17:next();
            if l_max_0 == v16.value then
                l_max_0 = l_min_0;
                while v18 do
                    l_max_0 = v18.value < l_max_0 and l_max_0 or v18.value;
                    v18 = v17:next();
                end;
            end;
            if l_min_0 == v16.value then
                l_min_0 = l_max_0;
                while v18 do
                    l_min_0 = l_min_0 < v18.value and l_min_0 or v18.value;
                    v18 = v17:next();
                end;
            end;
        end;
        v8._dataStoresData[v9].max = l_max_0 < v10 and v10 or l_max_0;
        v8._dataStoresData[v9].min = l_min_0 < v10 and l_min_0 or v10;
        return;
    end;
end;
v4.isRunning = function(v19) --[[ Line: 80 ]] --[[ Name: isRunning ]]
    return v19._isRunning;
end;
v4.start = function(v20) --[[ Line: 84 ]] --[[ Name: start ]]
    -- upvalues: v3 (copy)
    local v21 = v3();
    if v21 and not v20._statsListenerConnection then
        v20._statsListenerConnection = v21.StatsReceived:connect(function(v22) --[[ Line: 87 ]]
            -- upvalues: v20 (copy)
            local l_DataStoreBudget_0 = v22.DataStoreBudget;
            v20._lastUpdateTime = os.time();
            if l_DataStoreBudget_0 then
                local v24 = 0;
                for v25, v26 in pairs(l_DataStoreBudget_0) do
                    if type(v26) == "number" then
                        v20:updateValue(v25, v26);
                        v24 = v24 + 1;
                    end;
                end;
                v20._dataStoresDataCount = v24;
                v20._dataStoresUpdated:Fire(v20._dataStoresData, v20._dataStoresDataCount);
            end;
        end);
        v21:RequestServerStats(true);
        v20._isRunning = true;
    end;
end;
v4.stop = function(v27) --[[ Line: 107 ]] --[[ Name: stop ]]
    if v27._statsListenerConnection then
        v27._statsListenerConnection:Disconnect();
        v27._statsListenerConnection = nil;
    end;
    v27._isRunning = false;
end;
return v4;