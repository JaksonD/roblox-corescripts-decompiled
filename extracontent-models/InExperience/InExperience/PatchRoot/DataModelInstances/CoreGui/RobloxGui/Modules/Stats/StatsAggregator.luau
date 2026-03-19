local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4, v5) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v6 = {};
    setmetatable(v6, v2);
    v6._statType = v3;
    v6._numSamples = v4;
    v6._pauseBetweenSamples = v5;
    v6._statName = v1.StatNames[v6._statType];
    v6._statMaxName = v1.StatMaxNames[v6._statType];
    v6._samples = {};
    for v7 = 0, v4 - 1 do
        v6._samples[v7] = 0;
    end;
    v6._oldestIndex = 0;
    v6._listeners = {};
    v6._nextListenerId = 1001;
    return v6;
end;
v2.AddListener = function(v8, v9) --[[ Line: 45 ]] --[[ Name: AddListener ]]
    local l__nextListenerId_0 = v8._nextListenerId;
    v8._nextListenerId = v8._nextListenerId + 1;
    v8._listeners[l__nextListenerId_0] = v9;
    return l__nextListenerId_0;
end;
v2.RemoveListener = function(v11, v12) --[[ Line: 52 ]] --[[ Name: RemoveListener ]]
    v11._listeners[v12] = nil;
end;
v2._notifyAllListeners = function(v13) --[[ Line: 56 ]] --[[ Name: _notifyAllListeners ]]
    for _, v15 in pairs(v13._listeners) do
        v15();
    end;
end;
v2.StartListening = function(v16) --[[ Line: 62 ]] --[[ Name: StartListening ]]
    if v16._listening == true then
        return;
    else
        spawn(function() --[[ Line: 70 ]]
            -- upvalues: v16 (copy)
            v16._listening = true;
            while v16._listening do
                local v17 = v16:_getStatValue();
                v16:_storeStatValue(v17);
                v16:_notifyAllListeners();
                wait(v16._pauseBetweenSamples);
            end;
        end);
        return;
    end;
end;
v2.StopListening = function(v18) --[[ Line: 81 ]] --[[ Name: StopListening ]]
    v18._listening = false;
end;
v2.GetValues = function(v19) --[[ Line: 85 ]] --[[ Name: GetValues ]]
    local v20 = {};
    local v21 = nil;
    for v22 = 0, v19._numSamples - 1 do
        v21 = (v19._oldestIndex + v22) % v19._numSamples;
        v20[v22 + 1] = v19._samples[v21];
    end;
    return v20;
end;
v2.GetAverage = function(v23) --[[ Line: 96 ]] --[[ Name: GetAverage ]]
    local v24 = 0;
    for v25 = 0, v23._numSamples - 1 do
        v24 = v24 + v23._samples[v25];
    end;
    return v24 / v23._numSamples;
end;
v2.GetLatestValue = function(v26) --[[ Line: 105 ]] --[[ Name: GetLatestValue ]]
    local v27 = (v26._oldestIndex + v26._numSamples - 1) % v26._numSamples;
    return v26._samples[v27];
end;
v2._storeStatValue = function(v28, v29) --[[ Line: 111 ]] --[[ Name: _storeStatValue ]]
    v28._samples[v28._oldestIndex] = v29;
    v28._oldestIndex = (v28._oldestIndex + 1) % v28._numSamples;
end;
v2._getStatValue = function(v30) --[[ Line: 117 ]] --[[ Name: _getStatValue ]]
    local l_Stats_0 = game:GetService("Stats");
    if l_Stats_0 == nil then
        return 0;
    else
        local l_PerformanceStats_0 = l_Stats_0:FindFirstChild("PerformanceStats");
        if l_PerformanceStats_0 == nil then
            return 0;
        else
            local l_l_PerformanceStats_0_FirstChild_0 = l_PerformanceStats_0:FindFirstChild(v30._statName);
            if l_l_PerformanceStats_0_FirstChild_0 == nil then
                return 0;
            else
                return l_l_PerformanceStats_0_FirstChild_0:GetValue();
            end;
        end;
    end;
end;
v2.GetTarget = function(v34) --[[ Line: 137 ]] --[[ Name: GetTarget ]]
    local l_Stats_1 = game:GetService("Stats");
    if l_Stats_1 == nil then
        return 0;
    else
        local l_PerformanceStats_1 = l_Stats_1:FindFirstChild("PerformanceStats");
        if l_PerformanceStats_1 == nil then
            return 0;
        else
            local l_l_PerformanceStats_1_FirstChild_0 = l_PerformanceStats_1:FindFirstChild(v34._statMaxName);
            if l_l_PerformanceStats_1_FirstChild_0 == nil then
                return 0;
            else
                return l_l_PerformanceStats_1_FirstChild_0:GetValue();
            end;
        end;
    end;
end;
return v2;