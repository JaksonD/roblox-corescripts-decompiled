local v0 = {};
v0.__index = v0;
local function _(v1) --[[ Line: 13 ]] --[[ Name: log ]]
    return v1;
end;
if not v0.ratelimit then
    v0.ratelimit = {};
end;
v0.get = function(v3, v4, v5) --[[ Line: 22 ]] --[[ Name: get ]]
    -- upvalues: v0 (copy)
    local v6 = setmetatable({}, v0);
    if not v0.ratelimit[v3] then
        v0.ratelimit[v3] = {};
        v0.ratelimit[v3].windows = {};
    end;
    v0.ratelimit[v3].window_size = v5;
    v0.ratelimit[v3].rate = v4;
    v6.id = v3;
    v6.window_size = v0.ratelimit[v3].window_size;
    v6.rate = v0.ratelimit[v3].rate;
    local _ = v6.id;
    return v6;
end;
v0.window = function(v8) --[[ Line: 44 ]] --[[ Name: window ]]
    return (math.floor(tick() / v8.window_size));
end;
v0.progress = function(v9) --[[ Line: 48 ]] --[[ Name: progress ]]
    return tick() % v9.window_size / v9.window_size;
end;
v0.increment = function(v10) --[[ Line: 54 ]] --[[ Name: increment ]]
    -- upvalues: v0 (copy)
    local v11 = v10:window();
    if not v0.ratelimit[v10.id].windows[v11] then
        v0.ratelimit[v10.id].windows[v11] = 0;
    end;
    v0.ratelimit[v10.id].windows[v11] = v0.ratelimit[v10.id].windows[v11] + 1;
    return v0.ratelimit[v10.id].windows[v11];
end;
v0.weighted = function(v12, v13) --[[ Line: 70 ]] --[[ Name: weighted ]]
    -- upvalues: v0 (copy)
    v13 = v13 or 0;
    local v14 = v12:progress();
    local v15 = v12:window();
    local v16 = (v0.ratelimit[v12.id].windows[v15] or 0) + v13;
    local v17 = v0.ratelimit[v12.id].windows[v15 - 1] or 0;
    return v16 * v14 + v17 * (1 - v14);
end;
v0.consumption = function(v18) --[[ Line: 84 ]] --[[ Name: consumption ]]
    return v18:weighted() / v18.rate;
end;
v0.request = function(v19) --[[ Line: 90 ]] --[[ Name: request ]]
    if v19:weighted(1) > v19.rate then
        return false;
    else
        v19:increment();
        return true;
    end;
end;
return v0;