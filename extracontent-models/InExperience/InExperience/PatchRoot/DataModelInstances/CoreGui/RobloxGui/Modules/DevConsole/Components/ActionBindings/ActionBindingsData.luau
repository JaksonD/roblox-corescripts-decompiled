local l_ContextActionService_0 = game:GetService("ContextActionService");
local v1 = require(script.Parent.Parent.Parent.Signal);
local l_ChartHeaderNames_0 = require(script.Parent.Parent.Parent.Constants).ActionBindingsFormatting.ChartHeaderNames;
local v13 = {
    [l_ChartHeaderNames_0[1]] = function(v3, v4) --[[ Line: 9 ]]
        return v3.counter < v4.counter;
    end, 
    [l_ChartHeaderNames_0[2]] = function(v5, v6) --[[ Line: 12 ]]
        if v5.actionInfo.priorityLevel == v6.actionInfo.priorityLevel then
            return v5.counter < v6.counter;
        else
            return v5.actionInfo.priorityLevel < v6.actionInfo.priorityLevel;
        end;
    end, 
    [l_ChartHeaderNames_0[3]] = function(v7, v8) --[[ Line: 18 ]]
        if v7.actionInfo.isCore == v8.actionInfo.isCore then
            return v7.counter < v8.counter;
        else
            return v7.actionInfo.isCore;
        end;
    end, 
    [l_ChartHeaderNames_0[4]] = function(v9, v10) --[[ Line: 25 ]]
        return v9.name:lower() < v10.name:lower();
    end, 
    [l_ChartHeaderNames_0[5]] = function(v11, v12) --[[ Line: 28 ]]
        return tostring(v11.actionInfo.inputTypes[1]) < tostring(v12.actionInfo.inputTypes[1]);
    end
};
local v14 = {};
v14.__index = v14;
v14.new = function() --[[ Line: 36 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy), v1 (copy), l_ChartHeaderNames_0 (copy)
    local v15 = {};
    setmetatable(v15, v14);
    v15._bindingsUpdated = v1.new();
    v15._bindingsData = {};
    v15._bindingCounter = 0;
    v15._sortedBindingData = {};
    v15._sortType = l_ChartHeaderNames_0[1];
    v15._isRunning = false;
    return v15;
end;
v14.setSortType = function(v16, v17) --[[ Line: 49 ]] --[[ Name: setSortType ]]
    -- upvalues: v13 (copy)
    if v13[v17] then
        v16._sortType = v17;
        table.sort(v16._sortedBindingData, v13[v16._sortType]);
        v16._bindingsUpdated:Fire(v16._sortedBindingData);
        return;
    else
        error(string.format("attempted to pass invalid sortType: %s", (tostring(v17))), 2);
        return;
    end;
end;
v14.getSortType = function(v18) --[[ Line: 59 ]] --[[ Name: getSortType ]]
    return v18._sortType;
end;
v14.Signal = function(v19) --[[ Line: 63 ]] --[[ Name: Signal ]]
    return v19._bindingsUpdated;
end;
v14.getCurrentData = function(v20) --[[ Line: 67 ]] --[[ Name: getCurrentData ]]
    return v20._sortedBindingData;
end;
v14.updateBindingDataEntry = function(v21, v22, v23) --[[ Line: 73 ]] --[[ Name: updateBindingDataEntry ]]
    if v23 == nil then
        v21._bindingsData[v22] = nil;
        for v24, v25 in pairs(v21._sortedBindingData) do
            if v25.name == v22 then
                table.remove(v21._sortedBindingData, v24);
                return;
            end;
        end;
        return;
    elseif not v21._bindingsData[v22] then
        v21._bindingCounter = v21._bindingCounter + 1;
        v21._bindingsData[v22] = v23;
        local v26 = {
            name = v22, 
            actionInfo = v21._bindingsData[v22], 
            counter = v21._bindingCounter
        };
        table.insert(v21._sortedBindingData, v26);
        return;
    else
        v21._bindingsData[v22] = v23;
        return;
    end;
end;
v14.isRunning = function(v27) --[[ Line: 98 ]] --[[ Name: isRunning ]]
    return v27._isRunning;
end;
v14.start = function(v28) --[[ Line: 102 ]] --[[ Name: start ]]
    -- upvalues: l_ContextActionService_0 (copy)
    local l_l_ContextActionService_0_AllBoundActionInfo_0 = l_ContextActionService_0:GetAllBoundActionInfo();
    for v30, v31 in pairs(l_l_ContextActionService_0_AllBoundActionInfo_0) do
        v31.isCore = false;
        v28:updateBindingDataEntry(v30, v31);
    end;
    local l_l_ContextActionService_0_AllBoundCoreActionInfo_0 = l_ContextActionService_0:GetAllBoundCoreActionInfo();
    for v33, v34 in pairs(l_l_ContextActionService_0_AllBoundCoreActionInfo_0) do
        v34.isCore = true;
        v28:updateBindingDataEntry(v33, v34);
    end;
    if not v28._actionChangedConnection then
        v28._actionChangedConnection = l_ContextActionService_0.BoundActionChanged:connect(function(v35, v36, v37) --[[ Line: 117 ]]
            -- upvalues: v28 (copy)
            v28:updateBindingDataEntry(v35, nil);
            v28:updateBindingDataEntry(v36, v37);
            v28._bindingsUpdated:Fire(v28._sortedBindingData);
        end);
    end;
    if not v28._actionAddedConnection then
        v28._actionAddedConnection = l_ContextActionService_0.BoundActionAdded:connect(function(v38, _, v40, v41) --[[ Line: 126 ]]
            -- upvalues: v28 (copy)
            v40.isCore = v41;
            v28:updateBindingDataEntry(v38, v40);
            v28._bindingsUpdated:Fire(v28._sortedBindingData);
        end);
    end;
    if not v28._actionRemovedConnection then
        v28._actionRemovedConnection = l_ContextActionService_0.BoundActionRemoved:connect(function(v42, _, _) --[[ Line: 135 ]]
            -- upvalues: v28 (copy)
            v28:updateBindingDataEntry(v42, nil);
            v28._bindingsUpdated:Fire(v28._sortedBindingData);
        end);
    end;
    v28._isRunning = true;
end;
v14.stop = function(v45) --[[ Line: 143 ]] --[[ Name: stop ]]
    if v45.actionChangedConnector then
        v45.actionChangedConnector:Disconnect();
        v45.actionChangedConnector = nil;
    end;
    if v45.actionAddedConnector then
        v45.actionAddedConnector:Disconnect();
        v45.actionAddedConnector = nil;
    end;
    if v45.actionRemovedConnector then
        v45.actionRemovedConnector:Disconnect();
        v45.actionRemovedConnector = nil;
    end;
    v45._isRunning = false;
end;
return v14;