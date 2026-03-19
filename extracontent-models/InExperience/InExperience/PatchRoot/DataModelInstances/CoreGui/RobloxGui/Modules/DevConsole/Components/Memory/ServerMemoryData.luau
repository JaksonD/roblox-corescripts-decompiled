local v0 = require(script.Parent.Parent.Parent.Signal);
local v1 = require(script.Parent.Parent.Parent.CircularBuffer);
local l_ChartHeaderNames_0 = require(script.Parent.Parent.Parent.Constants).MemoryFormatting.ChartHeaderNames;
local v3 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"));
local v8 = {
    [l_ChartHeaderNames_0[1]] = function(v4, v5) --[[ Line: 11 ]]
        return v4.name < v5.name;
    end, 
    [l_ChartHeaderNames_0[2]] = function(v6, v7) --[[ Line: 14 ]]
        return v6.dataStats.dataSet:back().data < v7.dataStats.dataSet:back().data;
    end
};
local v9 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v10 = {};
v10.__index = v10;
v10.new = function() --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), v0 (copy), l_ChartHeaderNames_0 (copy)
    local v11 = {};
    setmetatable(v11, v10);
    v11._init = false;
    v11._isRunning = false;
    v11._totalMemory = 0;
    v11._memoryData = {};
    v11._memoryDataSorted = {};
    v11._coreTreeData = {};
    v11._coreTreeDataSorted = {};
    v11._placeTreeData = {};
    v11._placeTreeDataSorted = {};
    v11._placeScriptTreeData = {};
    v11._placeScriptTreeDataSorted = {};
    v11._coreScriptTreeData = {};
    v11._coreScriptTreeDataSorted = {};
    v11._treeViewUpdated = v0.new();
    v11._sortType = l_ChartHeaderNames_0[1];
    return v11;
end;
v10.updateEntry = function(v12, v13, v14, v15, v16) --[[ Line: 53 ]] --[[ Name: updateEntry ]]
    -- upvalues: v1 (copy), v3 (copy)
    if not v13[v15] then
        local v17 = v1.new(v3);
        v17:push_back({
            data = v16, 
            time = v12._lastUpdate
        });
        v13[v15] = {
            min = v16, 
            max = v16, 
            dataSet = v17
        };
        table.insert(v14, {
            name = v15, 
            dataStats = v13[v15]
        });
        return;
    else
        local l_max_0 = v13[v15].max;
        local l_min_0 = v13[v15].min;
        local v20 = {
            data = v16, 
            time = v12._lastUpdate
        };
        local v21 = v13[v15].dataSet:push_back(v20);
        if v21 then
            local v22 = v13[v15].dataSet:iterator();
            local v23 = v22:next();
            if l_max_0 == v21.data then
                l_max_0 = l_min_0;
                while v23 do
                    l_max_0 = v23.data < l_max_0 and l_max_0 or v23.data;
                    v23 = v22:next();
                end;
            end;
            if l_min_0 == v21.data then
                l_min_0 = l_max_0;
                while v23 do
                    l_min_0 = l_min_0 < v23.data and l_min_0 or v23.data;
                    v23 = v22:next();
                end;
            end;
        end;
        v13[v15].max = l_max_0 < v16 and v16 or l_max_0;
        v13[v15].min = l_min_0 < v16 and l_min_0 or v16;
        return;
    end;
end;
v10.updateEntryList = function(v24, v25, v26, v27) --[[ Line: 109 ]] --[[ Name: updateEntryList ]]
    local v28 = 0;
    for v29, v30 in pairs(v27) do
        local v31 = v30 / 1048576;
        v28 = v28 + v31;
        v24:updateEntry(v25, v26, v29, v31);
    end;
    for v32, _ in pairs(v25) do
        if v27[v32] == nil then
            v25[v32] = nil;
            for v34, v35 in ipairs(v26) do
                if v32 == v35.name then
                    table.remove(v26, v34);
                    break;
                end;
            end;
        end;
    end;
    return v28;
end;
v10.updateWithTreeStats = function(v36, v37) --[[ Line: 138 ]] --[[ Name: updateWithTreeStats ]]
    local v38 = {
        PlaceMemory = 0, 
        CoreMemory = 0, 
        UntrackedMemory = 0, 
        PlaceScriptMemory = 0, 
        CoreScriptMemory = 0
    };
    for v39, v40 in pairs(v37) do
        if v39 == "totalServerMemory" then
            v36._totalMemory = v40 / 1048576;
        elseif v39 == "developerTags" then
            v38.PlaceMemory = v36:updateEntryList(v36._placeTreeData, v36._placeTreeDataSorted, v40);
        elseif v39 == "internalCategories" then
            v38.CoreMemory = v36:updateEntryList(v36._coreTreeData, v36._coreTreeDataSorted, v40);
        elseif v39 == "placeScriptMemoryCategories" then
            v38.PlaceScriptMemory = v36:updateEntryList(v36._placeScriptTreeData, v36._placeScriptTreeDataSorted, v40);
        elseif v39 == "coreScriptMemoryCategories" then
            v38.CoreScriptMemory = v36:updateEntryList(v36._coreScriptTreeData, v36._coreScriptTreeDataSorted, v40);
        end;
    end;
    v38.UntrackedMemory = v36._totalMemory - v38.PlaceMemory - v38.CoreMemory;
    if v36._init then
        for v41, v42 in pairs(v38) do
            v36:updateEntry(v36._memoryData.Memory.children, v36._memoryData.Memory.sortedChildren, v41, v42);
        end;
        v36:updateEntry(v36._memoryData, v36._memoryDataSorted, "Memory", v36._totalMemory);
        return;
    else
        local v43 = {};
        local v44 = {};
        for v45, v46 in pairs(v38) do
            v36:updateEntry(v43, v44, v45, v46);
        end;
        v36:updateEntry(v36._memoryData, v36._memoryDataSorted, "Memory", v36._totalMemory);
        v43.PlaceMemory.children = v36._placeTreeData;
        v43.PlaceMemory.sortedChildren = v36._placeTreeDataSorted;
        v43.CoreMemory.children = v36._coreTreeData;
        v43.CoreMemory.sortedChildren = v36._coreTreeDataSorted;
        v43.PlaceScriptMemory.children = v36._placeScriptTreeData;
        v43.PlaceScriptMemory.sortedChildren = v36._placeScriptTreeDataSorted;
        v43.CoreScriptMemory.children = v36._coreScriptTreeData;
        v43.CoreScriptMemory.sortedChildren = v36._coreScriptTreeDataSorted;
        v36._memoryData.Memory.children = v43;
        v36._memoryData.Memory.sortedChildren = v44;
        v36._init = true;
        return;
    end;
end;
v10.totalMemSignal = function(v47) --[[ Line: 204 ]] --[[ Name: totalMemSignal ]]
    return v47._totalMemoryUpdated;
end;
v10.treeUpdatedSignal = function(v48) --[[ Line: 208 ]] --[[ Name: treeUpdatedSignal ]]
    return v48._treeViewUpdated;
end;
v10.getSortType = function(v49) --[[ Line: 212 ]] --[[ Name: getSortType ]]
    return v49._sortType;
end;
local function v50(v51, v52) --[[ Line: 216 ]] --[[ Name: recursiveSort ]]
    -- upvalues: v50 (copy)
    table.sort(v51, v52);
    for _, v54 in pairs(v51) do
        if v54.dataStats.sortedChildren then
            v50(v54.dataStats.sortedChildren, v52);
        end;
    end;
end;
v10.setSortType = function(v55, v56) --[[ Line: 225 ]] --[[ Name: setSortType ]]
    -- upvalues: v8 (copy), v50 (copy)
    if v8[v56] then
        v55._sortType = v56;
        v50(v55._memoryDataSorted, v8[v55._sortType]);
        return;
    else
        error(string.format("attempted to pass invalid sortType: %s", (tostring(v56))), 2);
        return;
    end;
end;
v10.getMemoryData = function(v57) --[[ Line: 234 ]] --[[ Name: getMemoryData ]]
    return v57._memoryDataSorted;
end;
v10.isRunning = function(v58) --[[ Line: 238 ]] --[[ Name: isRunning ]]
    return v58._isRunning;
end;
v10.start = function(v59) --[[ Line: 242 ]] --[[ Name: start ]]
    -- upvalues: v9 (copy)
    local v60 = v9();
    if v60 and not v59._statsListenerConnection then
        v59._statsListenerConnection = v60.StatsReceived:connect(function(v61) --[[ Line: 245 ]]
            -- upvalues: v59 (copy)
            if not v61.ServerMemoryTree then
                return;
            else
                v59._lastUpdate = os.time();
                local l_ServerMemoryTree_0 = v61.ServerMemoryTree;
                if l_ServerMemoryTree_0 then
                    v59:updateWithTreeStats(l_ServerMemoryTree_0);
                    v59._treeViewUpdated:Fire(v59._memoryDataSorted);
                end;
                return;
            end;
        end);
        v60:RequestServerStats(true);
        v59._isRunning = true;
    end;
end;
v10.stop = function(v63) --[[ Line: 263 ]] --[[ Name: stop ]]
    -- upvalues: v9 (copy)
    local v64 = v9();
    if v64 then
        v64:RequestServerStats(false);
        v63._statsListenerConnection:Disconnect();
        v63._isRunning = false;
    end;
end;
return v10;