local v0 = require(script.Parent.Parent.Parent.CircularBuffer);
local v1 = require(script.Parent.Parent.Parent.Signal);
local l_ChartHeaderNames_0 = require(script.Parent.Parent.Parent.Constants).ServerJobsFormatting.ChartHeaderNames;
local v3 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"));
local v12 = {
    [l_ChartHeaderNames_0[1]] = function(v4, v5) --[[ Line: 11 ]]
        return v4.name < v5.name;
    end, 
    [l_ChartHeaderNames_0[2]] = function(v6, v7) --[[ Line: 14 ]]
        return v6.dataStats.dataSet:back().data[1] < v7.dataStats.dataSet:back().data[1];
    end, 
    [l_ChartHeaderNames_0[3]] = function(v8, v9) --[[ Line: 17 ]]
        return v8.dataStats.dataSet:back().data[2] < v9.dataStats.dataSet:back().data[2];
    end, 
    [l_ChartHeaderNames_0[4]] = function(v10, v11) --[[ Line: 20 ]]
        return v10.dataStats.dataSet:back().data[3] < v11.dataStats.dataSet:back().data[3];
    end
};
local v13 = require(script.Parent.Parent.Parent.Util.minOfTable);
local v14 = require(script.Parent.Parent.Parent.Util.maxOfTable);
local v15 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v16 = {};
v16.__index = v16;
v16.new = function() --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v16 (copy), v1 (copy), l_ChartHeaderNames_0 (copy)
    local v17 = {};
    setmetatable(v17, v16);
    v17._serverJobsUpdated = v1.new();
    v17._serverJobsData = {};
    v17._sortedJobsData = {};
    v17._sortType = l_ChartHeaderNames_0[1];
    v17._lastUpdate = 0;
    v17._isRunning = false;
    return v17;
end;
v16.setSortType = function(v18, v19) --[[ Line: 46 ]] --[[ Name: setSortType ]]
    -- upvalues: v12 (copy)
    if v12[v19] then
        v18._sortType = v19;
        table.sort(v18._sortedJobsData, v12[v18._sortType]);
        return;
    else
        error(string.format("attempted to pass invalid sortType: %s", (tostring(v19))), 2);
        return;
    end;
end;
v16.getSortType = function(v20) --[[ Line: 56 ]] --[[ Name: getSortType ]]
    return v20._sortType;
end;
v16.Signal = function(v21) --[[ Line: 60 ]] --[[ Name: Signal ]]
    return v21._serverJobsUpdated;
end;
v16.getCurrentData = function(v22) --[[ Line: 64 ]] --[[ Name: getCurrentData ]]
    return v22._sortedJobsData;
end;
v16.updateServerJobsData = function(v23, v24) --[[ Line: 68 ]] --[[ Name: updateServerJobsData ]]
    -- upvalues: v0 (copy), v3 (copy), v14 (copy), v13 (copy)
    v23._lastUpdate = os.time();
    for v25, v26 in pairs(v24) do
        if not v23._serverJobsData[v25] then
            local v27 = v0.new(v3);
            v27:push_back({
                data = v26, 
                time = v23._lastUpdate
            });
            v23._serverJobsData[v25] = {
                max = v26, 
                min = v26, 
                dataSet = v27
            };
            local v28 = {
                name = v25, 
                dataStats = v23._serverJobsData[v25]
            };
            table.insert(v23._sortedJobsData, v28);
        else
            local v29 = {};
            for v30, v31 in pairs(v23._serverJobsData[v25].max) do
                v29[v30] = v31;
            end;
            local v32 = {};
            for v33, v34 in pairs(v23._serverJobsData[v25].min) do
                v32[v33] = v34;
            end;
            local v35 = {
                data = v26, 
                time = v23._lastUpdate
            };
            local v36 = v23._serverJobsData[v25].dataSet:push_back(v35);
            if v36 then
                for v37, v38 in pairs(v36.data) do
                    if v29[v37] == v38 then
                        local v39 = v23._serverJobsData[v25].dataSet:iterator();
                        local v40 = v39:next();
                        v29[v37] = v32[v37];
                        while v40 do
                            v29[v37] = v40.data[v37] < v29[v37] and v29[v37] or v40.data[v37];
                            v40 = v39:next();
                        end;
                    end;
                end;
                for v41, v42 in pairs(v36.data) do
                    if v32[v41] == v42 then
                        local v43 = v23._serverJobsData[v25].dataSet:iterator();
                        local v44 = v43:next();
                        v32[v41] = v29[v41];
                        while v44 do
                            v32[v41] = v32[v41] < v44.data[v41] and v32[v41] or v44.data[v41];
                            v44 = v43:next();
                        end;
                    end;
                end;
            end;
            v23._serverJobsData[v25].max = v14(v29, v26);
            v23._serverJobsData[v25].min = v13(v32, v26);
        end;
    end;
end;
v16.isRunning = function(v45) --[[ Line: 141 ]] --[[ Name: isRunning ]]
    return v45._isRunning;
end;
v16.start = function(v46) --[[ Line: 145 ]] --[[ Name: start ]]
    -- upvalues: v15 (copy)
    local v47 = v15();
    if v47 and not v46._statsListenerConnection then
        v46._statsListenerConnection = v47.StatsReceived:connect(function(v48) --[[ Line: 148 ]]
            -- upvalues: v46 (copy)
            local l_Jobs_0 = v48.Jobs;
            if l_Jobs_0 then
                v46:updateServerJobsData(l_Jobs_0);
                v46._serverJobsUpdated:Fire(v46._sortedJobsData);
            end;
        end);
        v47:RequestServerStats(true);
        v46._isRunning = true;
    end;
end;
v16.stop = function(v50) --[[ Line: 161 ]] --[[ Name: stop ]]
    if v50._statsListenerConnection then
        v50._statsListenerConnection:Disconnect();
        v50._statsListenerConnection = nil;
        v50._isRunning = false;
    end;
end;
return v16;