local l_Stats_0 = game:GetService("Stats");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Stats.BaseMemoryAnalyzer);
local v3 = require(l_CoreGui_0.RobloxGui.Modules.Common.CommonUtil);
local v4 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v5 = require(l_CoreGui_0.RobloxGui.Modules.Stats.TreeViewItem);
local function _() --[[ Line: 19 ]] --[[ Name: __GetMemoryPerformanceStatsItem ]]
    -- upvalues: l_Stats_0 (copy), v4 (copy)
    local v6 = l_Stats_0 and l_Stats_0:FindFirstChild("PerformanceStats");
    if v6 == nil then
        return nil;
    else
        return (v6:FindFirstChild(v4.StatNames[v4.StatType_Memory]));
    end;
end;
local function v8(v9, v10) --[[ Line: 30 ]] --[[ Name: __FillInMemoryUsageTreeRecursive ]]
    -- upvalues: v4 (copy), v3 (copy), v8 (copy)
    local l_Name_0 = v10.Name;
    v9:setLabelAndValue(v4.GetMemoryAnalyzerStatName(l_Name_0), (v10:GetValue()));
    local l_v10_Children_0 = v10:GetChildren();
    local v13 = v3.SortByName(l_v10_Children_0);
    for _, v15 in ipairs(v13) do
        local v16 = v9:getOrMakeChildById(v15.Name);
        v8(v16, v15);
    end;
end;
local v17 = {};
setmetatable(v17, v2);
v17.__index = v17;
v17.new = function(v18) --[[ Line: 61 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v17 (copy)
    local v19 = v2.new(v18);
    setmetatable(v19, v17);
    v19._rootTreeViewItem = nil;
    v19._shouldListenForUpdates = false;
    v19._spawnedLoopScheduled = false;
    return v19;
end;
v17.startListeningForUpdates = function(v20) --[[ Line: 86 ]] --[[ Name: startListeningForUpdates ]]
    v20._shouldListenForUpdates = true;
    if v20._spawnedLoopScheduled then
        return;
    else
        v20._spawnedLoopScheduled = true;
        spawn(function() --[[ Line: 95 ]]
            -- upvalues: v20 (copy)
            while v20._shouldListenForUpdates do
                v20:refreshMemoryUsageTree();
                v20:renderUpdates();
                wait(1);
            end;
            v20._spawnedLoopScheduled = false;
        end);
        return;
    end;
end;
v17.stopListeningForUpdates = function(v21) --[[ Line: 107 ]] --[[ Name: stopListeningForUpdates ]]
    v21._shouldListenForUpdates = false;
end;
v17.refreshMemoryUsageTree = function(v22) --[[ Line: 112 ]] --[[ Name: refreshMemoryUsageTree ]]
    -- upvalues: v5 (copy), l_Stats_0 (copy), v4 (copy), v8 (copy)
    if v22._rootTreeViewItem == nil then
        v22._rootTreeViewItem = v5.new("root", nil);
    end;
    local v23 = l_Stats_0 and l_Stats_0:FindFirstChild("PerformanceStats");
    local v24 = if v23 == nil then nil else v23:FindFirstChild(v4.StatNames[v4.StatType_Memory]);
    if v24 == nil then
        return nil;
    else
        v8(v22._rootTreeViewItem, v24);
        return;
    end;
end;
v17.getMemoryUsageTree = function(v25) --[[ Line: 125 ]] --[[ Name: getMemoryUsageTree ]]
    return v25._rootTreeViewItem;
end;
return v17;