local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsAggregator);
local v3 = require(l_CoreGui_0.RobloxGui.Modules.Flags.GetFFlagLazyPerfStatsInit);
local v4 = {};
v4.__index = v4;
v4.SecondsBetweenUpdate = 1;
v4.NumSamplesToKeep = 20;
local v5 = nil;
v4.getSingleton = function() --[[ Line: 26 ]] --[[ Name: getSingleton ]]
    -- upvalues: v5 (ref), v4 (copy), v3 (copy)
    if v5 == nil then
        v5 = v4.__new();
        if not v3() then
            v5:StartListening();
        end;
    end;
    return v5;
end;
v4.__new = function() --[[ Line: 36 ]] --[[ Name: __new ]]
    -- upvalues: v4 (copy), v1 (copy), v2 (copy)
    local v6 = {};
    setmetatable(v6, v4);
    v6._statsAggregators = {};
    for _, v8 in ipairs(v1.AllStatTypes) do
        local v9 = v2.new(v8, v4.NumSamplesToKeep, v4.SecondsBetweenUpdate);
        v6._statsAggregators[v8] = v9;
    end;
    return v6;
end;
v4.StartListening = function(v10) --[[ Line: 53 ]] --[[ Name: StartListening ]]
    for _, v12 in pairs(v10._statsAggregators) do
        v12:StartListening();
    end;
end;
v4.StopListening = function(v13) --[[ Line: 59 ]] --[[ Name: StopListening ]]
    for _, v15 in pairs(v13._statsAggregators) do
        v15:StopListening();
    end;
end;
v4.GetAggregator = function(v16, v17) --[[ Line: 65 ]] --[[ Name: GetAggregator ]]
    return v16._statsAggregators[v17];
end;
return v4;