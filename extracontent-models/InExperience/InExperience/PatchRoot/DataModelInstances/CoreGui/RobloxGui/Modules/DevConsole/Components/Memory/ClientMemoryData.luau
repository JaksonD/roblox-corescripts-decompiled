local v0 = require(script.Parent.Parent.Parent.Signal);
local l_SoundService_0 = game:GetService("SoundService");
local l_TextService_0 = game:GetService("TextService");
local l_MeshContentProvider_0 = game:GetService("MeshContentProvider");
local l_KeyframeSequenceProvider_0 = game:GetService("KeyframeSequenceProvider");
local l_Stats_0 = game:GetService("Stats");
local v6 = require(script.Parent.Parent.Parent.Parent.Stats.StatsUtils);
local v7 = require(script.Parent.Parent.Parent.CircularBuffer);
local l_ChartHeaderNames_0 = require(script.Parent.Parent.Parent.Constants).MemoryFormatting.ChartHeaderNames;
local v9 = tonumber(settings():GetFVariable("NewDevConsoleMaxGraphCount"));
local v14 = {
    [l_ChartHeaderNames_0[1]] = function(v10, v11) --[[ Line: 21 ]]
        return v10.name < v11.name;
    end, 
    [l_ChartHeaderNames_0[2]] = function(v12, v13) --[[ Line: 24 ]]
        return v12.dataStats.dataSet:back().data < v13.dataStats.dataSet:back().data;
    end
};
local v15 = {};
v15.__index = v15;
v15.new = function() --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy), v0 (copy), l_ChartHeaderNames_0 (copy)
    local v16 = {};
    setmetatable(v16, v15);
    v16._pollingId = 0;
    v16._totalMemory = 0;
    v16._memoryData = {};
    v16._memoryDataSorted = {};
    v16._treeViewUpdatedSignal = v0.new();
    v16._totalMemoryUpdated = v0.new();
    v16._sortType = l_ChartHeaderNames_0[1];
    v16._isRunning = false;
    v16._doGranularMemUpdate = {};
    v16._granularMemTable = {};
    return v16;
end;
local function _() --[[ Line: 51 ]] --[[ Name: GetMemoryPerformanceStatsItem ]]
    -- upvalues: l_Stats_0 (copy), v6 (copy)
    local v17 = l_Stats_0 and l_Stats_0:FindFirstChild("PerformanceStats");
    if not v17 then
        return nil;
    else
        return (v17:FindFirstChild(v6.StatNames[v6.StatType_Memory]));
    end;
end;
local function v25() --[[ Line: 62 ]] --[[ Name: fetchSoundMemoryData ]]
    -- upvalues: l_SoundService_0 (copy)
    local l_l_SoundService_0_SoundMemoryData_0 = l_SoundService_0:GetSoundMemoryData();
    local v20 = {};
    for v21, v22 in pairs(l_l_SoundService_0_SoundMemoryData_0) do
        table.insert(v20, {
            name = v21, 
            value = v22
        });
    end;
    table.sort(v20, function(v23, v24) --[[ Line: 76 ]]
        return v23.value > v24.value;
    end);
    return v20;
end;
local function v37() --[[ Line: 83 ]] --[[ Name: fetchGraphicsTextureMemoryData ]]
    -- upvalues: l_Stats_0 (copy)
    local l_l_Stats_0_PaginatedMemoryByTexture_0 = l_Stats_0:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoid, 0, 100);
    local l_l_Stats_0_PaginatedMemoryByTexture_1 = l_Stats_0:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoidOrphaned, 0, 100);
    local v28 = {};
    local function v34(v29, v30) --[[ Line: 88 ]] --[[ Name: aggregateData ]]
        for _, v32 in ipairs(v30.Results) do
            local v33 = v32.MemoryInBytes / 1048576;
            table.insert(v29, {
                name = v32.TextureId, 
                value = v33
            });
        end;
    end;
    v34(v28, l_l_Stats_0_PaginatedMemoryByTexture_0);
    v34(v28, l_l_Stats_0_PaginatedMemoryByTexture_1);
    table.sort(v28, function(v35, v36) --[[ Line: 101 ]]
        return v35.value > v36.value;
    end);
    return v28;
end;
local function v62() --[[ Line: 107 ]] --[[ Name: fetchGraphicsTextureCharacterMemoryData ]]
    -- upvalues: l_Stats_0 (copy)
    local l_l_Stats_0_PaginatedMemoryByTexture_2 = l_Stats_0:GetPaginatedMemoryByTexture(Enum.TextureQueryType.Humanoid, 0, 100);
    local l_l_Stats_0_PaginatedMemoryByTexture_3 = l_Stats_0:GetPaginatedMemoryByTexture(Enum.TextureQueryType.HumanoidOrphaned, 0, 100);
    local v40 = {};
    local function v61(v41, v42) --[[ Line: 112 ]] --[[ Name: aggregateData ]]
        for _, v44 in ipairs(v42.Results) do
            local v45 = v44.MemoryInBytes / 1048576;
            local v46 = {};
            local l_TextureId_0 = v44.TextureId;
            local v48 = {};
            for _, v50 in pairs(string.split(l_TextureId_0, " ")) do
                if string.sub(v50, 1, 2) == "T[" then
                    table.insert(v48, v50);
                end;
            end;
            local _ = "";
            local v52 = {};
            for _, v54 in pairs(v48) do
                local v55 = string.split(v54, ".mesh:")[2];
                local v56 = string.find(v55, ":", 12);
                if v56 ~= nil then
                    v56 = v56 - 1;
                end;
                v52[string.sub(v55, 1, v56)] = true;
            end;
            for v57, _ in pairs(v52) do
                table.insert(v46, {
                    name = v57
                });
            end;
            table.sort(v46, function(v59, v60) --[[ Line: 154 ]]
                return v59.name < v60.name;
            end);
            table.insert(v41, {
                name = "Composite Texture", 
                value = v45, 
                moreInfo = v46
            });
        end;
    end;
    v61(v40, l_l_Stats_0_PaginatedMemoryByTexture_2);
    v61(v40, l_l_Stats_0_PaginatedMemoryByTexture_3);
    return v40;
end;
local function v70() --[[ Line: 171 ]] --[[ Name: fetchGraphicsMeshPartsMemoryData ]]
    -- upvalues: l_MeshContentProvider_0 (copy)
    local v63 = l_MeshContentProvider_0:getContentMemoryData();
    local v64 = {};
    for v65, v66 in pairs(v63) do
        local v67 = v66 / 1048576;
        table.insert(v64, {
            name = v65, 
            value = v67
        });
    end;
    table.sort(v64, function(v68, v69) --[[ Line: 183 ]]
        return v68.value > v69.value;
    end);
    return v64;
end;
local function v78() --[[ Line: 190 ]] --[[ Name: fetchFuncAnimation ]]
    -- upvalues: l_KeyframeSequenceProvider_0 (copy)
    local l_l_KeyframeSequenceProvider_0_MemStats_0 = l_KeyframeSequenceProvider_0:GetMemStats();
    local v72 = {};
    for v73, v74 in pairs(l_l_KeyframeSequenceProvider_0_MemStats_0) do
        local v75 = v74 / 1048576;
        table.insert(v72, {
            name = v73, 
            value = v75
        });
    end;
    table.sort(v72, function(v76, v77) --[[ Line: 202 ]]
        return v76.value > v77.value;
    end);
    return v72;
end;
local function v85() --[[ Line: 209 ]] --[[ Name: fetchFontMemoryData ]]
    -- upvalues: l_TextService_0 (copy)
    local l_l_TextService_0_FontMemoryData_0 = l_TextService_0:GetFontMemoryData();
    local v80 = {};
    for v81, v82 in pairs(l_l_TextService_0_FontMemoryData_0) do
        table.insert(v80, {
            name = v81, 
            value = v82 / 1048576
        });
    end;
    table.sort(v80, function(v83, v84) --[[ Line: 220 ]]
        return v83.value > v84.value;
    end);
    return v80;
end;
v15.updateCachedData = function(v86, v87, v88) --[[ Line: 227 ]] --[[ Name: updateCachedData ]]
    if v86._doGranularMemUpdate[v87] then
        v86._doGranularMemUpdate[v87] = false;
        v86._granularMemTable[v87] = v88();
    end;
end;
v15.getAdditionalMemoryFunc = function(v89, v90) --[[ Line: 234 ]] --[[ Name: getAdditionalMemoryFunc ]]
    -- upvalues: v25 (copy), v37 (copy), v62 (copy), v70 (copy), v78 (copy), v85 (copy)
    local v91 = nil;
    if v90 == "Sounds" then
        v91 = v25;
    elseif v90 == "GraphicsTexture" then
        v91 = v37;
    elseif v90 == "GraphicsTextureCharacter" then
        v91 = v62;
    elseif v90 == "GraphicsMeshParts" then
        v91 = v70;
    elseif v90 ~= "csgDictionary" then
        if v90 == "Animation" then
            v91 = v78;
        elseif v90 == "gui/FontData" and game:GetEngineFeature("TextServiceGetFontMemoryData") then
            v91 = v85;
        end;
    end;
    if v91 then
        return function() --[[ Line: 256 ]]
            -- upvalues: v89 (copy), v90 (copy), v91 (ref)
            v89:updateCachedData(v90, v91);
            return v89._granularMemTable[v90];
        end;
    else
        return nil;
    end;
end;
v15.recursiveUpdateEntry = function(v92, v93, v94, v95) --[[ Line: 265 ]] --[[ Name: recursiveUpdateEntry ]]
    -- upvalues: v6 (copy), v7 (copy), v9 (copy)
    local v96 = v6.GetMemoryAnalyzerStatName(v95.DisplayName);
    local l_v95_Value_0 = v95:GetValue();
    local l_v95_Children_0 = v95:GetChildren();
    if not v93[v96] then
        local v99 = v7.new(v9);
        v99:push_back({
            data = l_v95_Value_0, 
            time = v92._lastUpdate
        });
        local v100 = {
            min = l_v95_Value_0, 
            max = l_v95_Value_0, 
            dataSet = v99
        };
        local v101 = false;
        if #l_v95_Children_0 > 0 then
            v101 = {};
        end;
        v100.children = v101;
        v101 = false;
        if #l_v95_Children_0 > 0 then
            v101 = {};
        end;
        v100.sortedChildren = v101;
        v93[v96] = v100;
        v100 = v92:getAdditionalMemoryFunc(v96);
        if v100 then
            v93[v96].additionalInfoFunc = v100;
            v92._doGranularMemUpdate[v96] = true;
        end;
        table.insert(v94, {
            name = v96, 
            dataStats = v93[v96]
        });
    else
        local l_max_0 = v93[v96].max;
        local l_min_0 = v93[v96].min;
        local v104 = {
            data = l_v95_Value_0, 
            time = v92._lastUpdate
        };
        if v93[v96].additionalInfoFunc and v93[v96].dataSet:back().data ~= v104.data then
            v92._doGranularMemUpdate[v96] = true;
        end;
        local v105 = v93[v96].dataSet:push_back(v104);
        if v105 then
            local v106 = v93[v96].dataSet:iterator();
            local v107 = v106:next();
            if l_max_0 == v105.data then
                l_max_0 = l_min_0;
                while v107 do
                    l_max_0 = v107.data < l_max_0 and l_max_0 or v107.data;
                    v107 = v106:next();
                end;
            end;
            if l_min_0 == v105.data then
                l_min_0 = l_max_0;
                while v107 do
                    l_min_0 = l_min_0 < v107.data and l_min_0 or v107.data;
                    v107 = v106:next();
                end;
            end;
        end;
        v93[v96].max = l_max_0 < l_v95_Value_0 and l_v95_Value_0 or l_max_0;
        v93[v96].min = l_min_0 < l_v95_Value_0 and l_min_0 or l_v95_Value_0;
    end;
    local v108 = v93[v96];
    local v109 = {};
    for _, v111 in ipairs(l_v95_Children_0) do
        v109[v111.DisplayName] = true;
        v92:recursiveUpdateEntry(v108.children, v108.sortedChildren, v111);
    end;
    if v108.children then
        for v112, _ in pairs(v108.children) do
            if v109[v112] == nil then
                v108.children[v112] = nil;
                for v114, v115 in ipairs(v108.sortedChildren) do
                    if v112 == v115.name then
                        table.remove(v108.sortedChildren, v114);
                        break;
                    end;
                end;
            end;
        end;
    end;
end;
v15.totalMemSignal = function(v116) --[[ Line: 379 ]] --[[ Name: totalMemSignal ]]
    return v116._totalMemoryUpdated;
end;
v15.treeUpdatedSignal = function(v117) --[[ Line: 383 ]] --[[ Name: treeUpdatedSignal ]]
    return v117._treeViewUpdatedSignal;
end;
v15.getSortType = function(v118) --[[ Line: 387 ]] --[[ Name: getSortType ]]
    return v118._sortType;
end;
local function v119(v120, v121) --[[ Line: 391 ]] --[[ Name: recursiveSort ]]
    -- upvalues: v119 (copy)
    table.sort(v120, v121);
    for _, v123 in pairs(v120) do
        if v123.dataStats.sortedChildren then
            v119(v123.dataStats.sortedChildren, v121);
        end;
    end;
end;
v15.setSortType = function(v124, v125) --[[ Line: 400 ]] --[[ Name: setSortType ]]
    -- upvalues: v14 (copy), v119 (copy)
    if v14[v125] then
        v124._sortType = v125;
        v119(v124._memoryDataSorted, v14[v124._sortType]);
        return;
    else
        error(string.format("attempted to pass invalid sortType: %s", (tostring(v125))), 2);
        return;
    end;
end;
v15.getMemoryData = function(v126) --[[ Line: 410 ]] --[[ Name: getMemoryData ]]
    return v126._memoryDataSorted;
end;
v15.isRunning = function(v127) --[[ Line: 414 ]] --[[ Name: isRunning ]]
    return v127._isRunning;
end;
v15.start = function(v128) --[[ Line: 418 ]] --[[ Name: start ]]
    -- upvalues: l_Stats_0 (copy), v6 (copy)
    spawn(function() --[[ Line: 419 ]]
        -- upvalues: v128 (copy), l_Stats_0 (ref), v6 (ref)
        v128._pollingId = v128._pollingId + 1;
        local l__pollingId_0 = v128._pollingId;
        v128._isRunning = true;
        while true do
            if l__pollingId_0 == v128._pollingId then
                local v130 = l_Stats_0 and l_Stats_0:FindFirstChild("PerformanceStats");
                local v131 = if not v130 then nil else v130:FindFirstChild(v6.StatNames[v6.StatType_Memory]);
                if not v131 then
                    return;
                else
                    v128._lastUpdate = os.time();
                    v128:recursiveUpdateEntry(v128._memoryData, v128._memoryDataSorted, v131);
                    if v128._totalMemory ~= v131:getValue() then
                        v128._totalMemory = v131:getValue();
                        v128._totalMemoryUpdated:Fire(v128._totalMemory);
                    end;
                    v128._treeViewUpdatedSignal:Fire(v128._memoryDataSorted);
                    wait(3);
                end;
            else
                v128._isRunning = false;
                return;
            end;
        end;
    end);
end;
v15.stop = function(v132) --[[ Line: 444 ]] --[[ Name: stop ]]
    v132._pollingId = v132._pollingId + 1;
end;
return v15;