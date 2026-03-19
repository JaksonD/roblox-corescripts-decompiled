local v0 = require(script.Parent.Parent.Parent.CircularBuffer);
local v1 = require(script.Parent.Parent.Parent.Signal);
local v2 = require(script.Parent.Parent.Parent.Constants);
local v3 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"));
local l_ChartHeaderNames_0 = v2.ServerScriptsFormatting.ChartHeaderNames;
local v11 = {
    [l_ChartHeaderNames_0[1]] = function(v5, v6) --[[ Line: 11 ]]
        return v5.dataStats.dataSet:back().name < v6.dataStats.dataSet:back().name;
    end, 
    [l_ChartHeaderNames_0[2]] = function(v7, v8) --[[ Line: 14 ]]
        return v7.dataStats.dataSet:back().data[1] < v8.dataStats.dataSet:back().data[1];
    end, 
    [l_ChartHeaderNames_0[3]] = function(v9, v10) --[[ Line: 17 ]]
        return v9.dataStats.dataSet:back().data[2] < v10.dataStats.dataSet:back().data[2];
    end
};
local v12 = require(script.Parent.Parent.Parent.Util.minOfTable);
local v13 = require(script.Parent.Parent.Parent.Util.maxOfTable);
local v14 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v15 = {};
v15.__index = v15;
v15.new = function() --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy), v1 (copy), l_ChartHeaderNames_0 (copy)
    local v16 = {};
    setmetatable(v16, v15);
    v16._serverScriptsUpdated = v1.new();
    v16._serverScriptsData = {};
    v16._lastUpdate = 0;
    v16._sortedScriptsData = {};
    v16._sortType = l_ChartHeaderNames_0[1];
    v16._isRunning = false;
    return v16;
end;
v15.setSortType = function(v17, v18) --[[ Line: 43 ]] --[[ Name: setSortType ]]
    -- upvalues: v11 (copy)
    if v11[v18] then
        v17._sortType = v18;
        table.sort(v17._sortedScriptsData, v11[v17._sortType]);
        return;
    else
        error(string.format("attempted to pass invalid sortType: %s", (tostring(v18))), 2);
        return;
    end;
end;
v15.getSortType = function(v19) --[[ Line: 53 ]] --[[ Name: getSortType ]]
    return v19._sortType;
end;
v15.Signal = function(v20) --[[ Line: 57 ]] --[[ Name: Signal ]]
    return v20._serverScriptsUpdated;
end;
v15.getCurrentData = function(v21) --[[ Line: 61 ]] --[[ Name: getCurrentData ]]
    return v21._sortedScriptsData;
end;
v15.updateScriptsData = function(v22, v23) --[[ Line: 66 ]] --[[ Name: updateScriptsData ]]
    -- upvalues: v0 (copy), v3 (copy), v13 (copy), v12 (copy)
    v22._lastUpdate = os.time();
    for v24, v25 in pairs(v23) do
        if not v22._serverScriptsData[v24] then
            local v26 = v0.new(v3);
            v26:push_back({
                data = v25, 
                time = v22._lastUpdate
            });
            v22._serverScriptsData[v24] = {
                max = v25, 
                min = v25, 
                dataSet = v26
            };
            local v27 = {
                name = v24, 
                dataStats = v22._serverScriptsData[v24]
            };
            table.insert(v22._sortedScriptsData, v27);
        else
            local v28 = {};
            for v29, v30 in pairs(v22._serverScriptsData[v24].max) do
                v28[v29] = v30;
            end;
            local v31 = {};
            for v32, v33 in pairs(v22._serverScriptsData[v24].min) do
                v31[v32] = v33;
            end;
            local v34 = {
                data = v25, 
                time = v22._lastUpdate
            };
            local v35 = v22._serverScriptsData[v24].dataSet:push_back(v34);
            if v35 then
                for v36, v37 in pairs(v35.data) do
                    if v28[v36] == v37 then
                        local v38 = v22._serverScriptsData[v24].dataSet:iterator();
                        local v39 = v38:next();
                        v28[v36] = v31[v36];
                        while v39 do
                            v28[v36] = v39.data[v36] < v28[v36] and v28[v36] or v39.data[v36];
                            v39 = v38:next();
                        end;
                    end;
                end;
                for v40, v41 in pairs(v35.data) do
                    if v31[v40] == v41 then
                        local v42 = v22._serverScriptsData[v24].dataSet:iterator();
                        local v43 = v42:next();
                        v31[v40] = v28[v40];
                        while v43 do
                            v31[v40] = v31[v40] < v43.data[v40] and v31[v40] or v43.data[v40];
                            v43 = v42:next();
                        end;
                    end;
                end;
            end;
            v22._serverScriptsData[v24].max = v13(v28, v25);
            v22._serverScriptsData[v24].min = v12(v31, v25);
        end;
    end;
end;
v15.isRunning = function(v44) --[[ Line: 139 ]] --[[ Name: isRunning ]]
    return v44._isRunning;
end;
v15.start = function(v45) --[[ Line: 143 ]] --[[ Name: start ]]
    -- upvalues: v14 (copy)
    local v46 = v14();
    if v46 and not v45._statsListenerConnection then
        v45._statsListenerConnection = v46.StatsReceived:connect(function(v47) --[[ Line: 146 ]]
            -- upvalues: v45 (copy)
            if v47 then
                v45._lastUpdate = os.time();
                local l_Scripts_0 = v47.Scripts;
                if l_Scripts_0 then
                    v45:updateScriptsData(l_Scripts_0);
                end;
                v45._serverScriptsUpdated:Fire(v45._sortedScriptsData);
            end;
        end);
        v46:RequestServerStats(true);
        v45._isRunning = true;
    end;
end;
v15.stop = function(v49) --[[ Line: 163 ]] --[[ Name: stop ]]
    if v49._statsListenerConnection then
        v49._statsListenerConnection:Disconnect();
        v49._statsListenerConnection = nil;
    end;
    v49._isRunning = false;
end;
return v15;