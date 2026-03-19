local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = v2.strictInterface({
    period = v2.number, 
    threshold = v2.number, 
    processInterval = v2.number
});
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v4 (copy)
    assert(v3(v5));
    return (setmetatable({
        _period = v5.period, 
        _threshold = v5.threshold, 
        _processInterval = v5.processInterval, 
        _lastProcessed = 0, 
        _counts = {}, 
        _lastOccurrences = {}
    }, v4));
end;
v4.increment = function(v6, v7, v8) --[[ Line: 29 ]] --[[ Name: increment ]]
    local v9 = v8 or os.clock();
    v6._lastOccurrences[v7] = v9;
    if v6._counts[v7] == nil then
        v6._counts[v7] = 1;
        return;
    else
        v9 = v6._counts;
        v9[v7] = v9[v7] + 1;
        return;
    end;
end;
v4.isRateLimited = function(v10, v11) --[[ Line: 40 ]] --[[ Name: isRateLimited ]]
    local v12 = v10._counts[v11];
    local v13 = false;
    if v12 ~= nil then
        v13 = v10._threshold < v12;
    end;
    return v13;
end;
v4.startDecrementClock = function(v14) --[[ Line: 45 ]] --[[ Name: startDecrementClock ]]
    -- upvalues: l_RunService_0 (copy)
    v14._decrementConnection = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 46 ]]
        -- upvalues: v14 (copy)
        v14:stepDecrementClock(os.clock());
    end);
end;
v4.stepDecrementClock = function(v15, v16) --[[ Line: 51 ]] --[[ Name: stepDecrementClock ]]
    if v16 - v15._lastProcessed > v15._processInterval then
        for v17, v18 in pairs(v15._lastOccurrences) do
            if v16 - v18 > v15._period then
                local l__counts_0 = v15._counts;
                l__counts_0[v17] = l__counts_0[v17] - 1;
                if v15._counts[v17] <= 0 then
                    v15._counts[v17] = nil;
                    v15._lastOccurrences[v17] = nil;
                end;
            end;
        end;
        v15._lastProcessed = v16;
    end;
end;
return v4;