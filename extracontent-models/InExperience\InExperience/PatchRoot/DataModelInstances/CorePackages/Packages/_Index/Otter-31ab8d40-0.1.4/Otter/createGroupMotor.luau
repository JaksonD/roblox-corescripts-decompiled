local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.assign);
local v2 = require(script.Parent.createSignal);
local v3 = {
    prototype = {}
};
v3.__index = v3.prototype;
local function v9(v4) --[[ Line: 10 ]] --[[ Name: createGroupMotor ]]
    -- upvalues: v2 (copy), v3 (copy)
    assert(typeof(v4) == "table");
    local v5 = {};
    for v6, v7 in pairs(v4) do
        v5[v6] = {
            value = v7, 
            complete = true
        };
    end;
    local v8 = {
        __goals = {}, 
        __states = v5, 
        __allComplete = true, 
        __onComplete = v2(), 
        __onStep = v2(), 
        __running = false
    };
    setmetatable(v8, v3);
    return v8;
end;
v3.prototype.start = function(v10) --[[ Line: 36 ]] --[[ Name: start ]]
    -- upvalues: l_RunService_0 (copy)
    if v10.__running then
        return;
    else
        v10.__connection = l_RunService_0.Heartbeat:Connect(function(v11) --[[ Line: 41 ]]
            -- upvalues: v10 (copy)
            v10:step(v11);
        end);
        v10.__running = true;
        return;
    end;
end;
v3.prototype.stop = function(v12) --[[ Line: 48 ]] --[[ Name: stop ]]
    if v12.__connection ~= nil then
        v12.__connection:Disconnect();
        v12.__running = false;
    end;
end;
v3.prototype.step = function(v13, v14) --[[ Line: 55 ]] --[[ Name: step ]]
    assert(typeof(v14) == "number");
    if v13.__allComplete then
        return;
    else
        local v15 = true;
        local v16 = {};
        for v17, v18 in pairs(v13.__states) do
            if not v18.complete then
                local v19 = v13.__goals[v17];
                if v19 ~= nil then
                    local v20 = v19:step(v18, v14);
                    if v20 ~= nil then
                        v18 = v20;
                        v13.__states[v17] = v20;
                    end;
                else
                    v18.complete = true;
                end;
                if not v18.complete then
                    v15 = false;
                end;
            end;
            v16[v17] = v18.value;
        end;
        local l___allComplete_0 = v13.__allComplete;
        v13.__allComplete = v15;
        v13.__onStep:fire(v16);
        if v13.__allComplete and not l___allComplete_0 and v13.__running then
            v13:stop();
            v13.__onComplete:fire(v16);
        end;
        return;
    end;
end;
v3.prototype.setGoal = function(v22, v23) --[[ Line: 102 ]] --[[ Name: setGoal ]]
    -- upvalues: v1 (copy)
    assert(typeof(v23) == "table");
    v22.__goals = v1({}, v22.__goals, v23);
    for v24 in pairs(v23) do
        local v25 = v22.__states[v24];
        if v25 == nil then
            error(("Cannot set goal for the value %s because it doesn't exist"):format((tostring(v24))), 2);
        end;
        v25.complete = false;
    end;
    v22.__allComplete = false;
    v22:start();
end;
v3.prototype.onStep = function(v26, v27) --[[ Line: 121 ]] --[[ Name: onStep ]]
    assert(typeof(v27) == "function");
    return v26.__onStep:subscribe(v27);
end;
v3.prototype.onComplete = function(v28, v29) --[[ Line: 127 ]] --[[ Name: onComplete ]]
    assert(typeof(v29) == "function");
    return v28.__onComplete:subscribe(v29);
end;
v3.prototype.destroy = function(v30) --[[ Line: 133 ]] --[[ Name: destroy ]]
    v30:stop();
end;
return v9;