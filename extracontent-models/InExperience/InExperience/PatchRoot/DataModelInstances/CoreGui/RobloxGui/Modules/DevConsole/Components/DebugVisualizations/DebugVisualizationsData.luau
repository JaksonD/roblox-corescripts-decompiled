local v0 = require(script.Parent.Parent.Parent.Signal);
local l_ChartHeaderNames_0 = require(script.Parent.Parent.Parent.Constants).DebugVisualizationsFormatting.ChartHeaderNames;
local v2 = require(script.Parent.DebugVisualizationsStaticContent);
local v11 = {
    [l_ChartHeaderNames_0[1]] = function(v3, v4) --[[ Line: 10 ]]
        return v3.name < v4.name;
    end, 
    [l_ChartHeaderNames_0[2]] = function(v5, v6) --[[ Line: 13 ]]
        if v5.settingInfo.Value ~= v6.settingInfo.Value then
            return v5.settingInfo.Value;
        else
            return v5.name < v6.name;
        end;
    end, 
    [l_ChartHeaderNames_0[3]] = function(v7, v8) --[[ Line: 17 ]]
        if v7.settingInfo.Type ~= v8.settingInfo.Type then
            return v7.settingInfo.Type < v8.settingInfo.Type;
        else
            return v7.name < v8.name;
        end;
    end, 
    [l_ChartHeaderNames_0[4]] = function(v9, v10) --[[ Line: 21 ]]
        return v9.name < v10.name;
    end
};
local v12 = {};
v12.__index = v12;
v12.new = function() --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy), v0 (copy), l_ChartHeaderNames_0 (copy)
    local v13 = {};
    setmetatable(v13, v12);
    v13._visualizationsUpdated = v0.new();
    v13._visualizationsData = {};
    v13._visualizationCounter = 0;
    v13._sortedVisualizationData = {};
    v13._sortType = l_ChartHeaderNames_0[3];
    v13._isRunning = false;
    return v13;
end;
v12.setSortType = function(v14, v15) --[[ Line: 42 ]] --[[ Name: setSortType ]]
    -- upvalues: v11 (copy)
    if v11[v15] then
        v14._sortType = v15;
        table.sort(v14._sortedVisualizationData, v11[v14._sortType]);
        v14._visualizationsUpdated:Fire(v14._sortedVisualizationData);
        return;
    else
        error(string.format("attempted to pass invalid sortType: %s", (tostring(v15))), 2);
        return;
    end;
end;
v12.getSortType = function(v16) --[[ Line: 52 ]] --[[ Name: getSortType ]]
    return v16._sortType;
end;
v12.Signal = function(v17) --[[ Line: 56 ]] --[[ Name: Signal ]]
    return v17._visualizationsUpdated;
end;
v12.getCurrentData = function(v18) --[[ Line: 60 ]] --[[ Name: getCurrentData ]]
    return v18._sortedVisualizationData;
end;
v12.updateDebugVisualizationDataEntry = function(v19, v20, v21) --[[ Line: 66 ]] --[[ Name: updateDebugVisualizationDataEntry ]]
    if v21 == nil then
        v19._visualizationsData[v20] = nil;
        for v22, v23 in pairs(v19._sortedVisualizationData) do
            if v23.name == v20 then
                table.remove(v19._sortedVisualizationData, v22);
                return;
            end;
        end;
        return;
    elseif not v19._visualizationsData[v20] then
        v19._visualizationCounter = v19._visualizationCounter + 1;
        v19._visualizationsData[v20] = v21;
        local v26 = {
            name = v20, 
            settingInfo = v19._visualizationsData[v20], 
            valueChangeCallback = function(v24, v25) --[[ Line: 83 ]] --[[ Name: valueChangeCallback ]]
                -- upvalues: v19 (copy)
                v19:_toggleValue(v24, v25);
            end, 
            counter = v19._visualizationCounter
        };
        table.insert(v19._sortedVisualizationData, v26);
        return;
    else
        v19._visualizationsData[v20] = v21;
        return;
    end;
end;
v12.isRunning = function(v27) --[[ Line: 94 ]] --[[ Name: isRunning ]]
    return v27._isRunning;
end;
v12._toggleValue = function(v28, v29, v30) --[[ Line: 98 ]] --[[ Name: _toggleValue ]]
    -- upvalues: v11 (copy)
    local l_Physics_0 = settings().Physics;
    if l_Physics_0[v29] ~= nil then
        if v30 and v28._visualizationsData[v29].Type == "Box" then
            for _, v33 in pairs(v28._visualizationsData) do
                if v33.Type == "Box" and l_Physics_0[v33.Name] ~= nil then
                    l_Physics_0[v33.Name] = false;
                    v28._visualizationsData[v33.Name].Value = false;
                end;
            end;
        end;
        l_Physics_0[v29] = v30;
        v28._visualizationsData[v29].Value = v30;
        table.sort(v28._sortedVisualizationData, v11[v28._sortType]);
        v28._visualizationsUpdated:Fire(v28._sortedVisualizationData);
    end;
end;
_constructInfo = function(v34, v35) --[[ Line: 119 ]] --[[ Name: _constructInfo ]]
    local l_Physics_1 = settings().Physics;
    local v37 = false;
    if l_Physics_1[v34] ~= nil then
        v37 = l_Physics_1[v34];
    end;
    local v38 = "";
    for v39, v40 in ipairs(v35.tags) do
        v38 = (v38 .. v40) .. (v39 ~= #v35.tags and ", " or "");
    end;
    return {
        Name = v35.name, 
        Value = v37, 
        Type = v35.type, 
        Tags = v35.tags, 
        Tagstring = v38, 
        Description = v35.description
    };
end;
v12.start = function(v41) --[[ Line: 140 ]] --[[ Name: start ]]
    -- upvalues: v2 (copy), v11 (copy)
    for v42, v43 in pairs(v2) do
        v41:updateDebugVisualizationDataEntry(v42, _constructInfo(v42, v43));
    end;
    table.sort(v41._sortedVisualizationData, v11[v41._sortType]);
    v41._isRunning = true;
end;
v12.stop = function(v44) --[[ Line: 148 ]] --[[ Name: stop ]]
    v44._isRunning = false;
end;
return v12;