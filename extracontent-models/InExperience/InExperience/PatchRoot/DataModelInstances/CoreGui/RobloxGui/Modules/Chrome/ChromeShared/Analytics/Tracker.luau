local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        trackers = {}
    }, v0));
end;
v0.toggle = function(v1, v2) --[[ Line: 24 ]] --[[ Name: toggle ]]
    v1[v2] = not v1[v2];
    return v1[v2];
end;
v0.set = function(v3, v4, v5) --[[ Line: 29 ]] --[[ Name: set ]]
    v3.trackers[v4] = v5;
end;
v0.get = function(v6, v7) --[[ Line: 33 ]] --[[ Name: get ]]
    return v6.trackers[v7];
end;
v0.reset = function(v8, v9) --[[ Line: 37 ]] --[[ Name: reset ]]
    v8.trackers[v9] = nil;
end;
v0.startTime = function(v10, v11) --[[ Line: 41 ]] --[[ Name: startTime ]]
    v10.trackers[v11] = DateTime.now().UnixTimestampMillis;
end;
v0.finishTime = function(v12, v13) --[[ Line: 45 ]] --[[ Name: finishTime ]]
    if v12.trackers[v13] then
        local v14 = DateTime.now().UnixTimestampMillis - v12.trackers[v13];
        v12.trackers[v13] = 0;
        return v14;
    else
        return 0;
    end;
end;
return v0;