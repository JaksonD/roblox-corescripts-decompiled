local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.createSignal);
local v2 = {
    prototype = {}
};
v2.__index = v2.prototype;
local function v5(v3) --[[ Line: 9 ]] --[[ Name: createSingleMotor ]]
    -- upvalues: v1 (copy), v2 (copy)
    assert(typeof(v3) == "number");
    local v4 = {
        __goal = nil, 
        __state = {
            value = v3, 
            complete = true
        }, 
        __onComplete = v1(), 
        __onStep = v1(), 
        __running = false
    };
    setmetatable(v4, v2);
    return v4;
end;
v2.prototype.start = function(v6) --[[ Line: 28 ]] --[[ Name: start ]]
    -- upvalues: l_RunService_0 (copy)
    if v6.__running then
        return;
    else
        v6.__connection = l_RunService_0.Heartbeat:Connect(function(v7) --[[ Line: 33 ]]
            -- upvalues: v6 (copy)
            v6:step(v7);
        end);
        v6.__running = true;
        return;
    end;
end;
v2.prototype.stop = function(v8) --[[ Line: 40 ]] --[[ Name: stop ]]
    if v8.__connection ~= nil then
        v8.__connection:Disconnect();
    end;
    v8.__running = false;
end;
v2.prototype.step = function(v9, v10) --[[ Line: 48 ]] --[[ Name: step ]]
    assert(typeof(v10) == "number");
    if v9.__state.complete then
        return;
    elseif v9.__goal == nil then
        return;
    else
        local v11 = v9.__goal:step(v9.__state, v10);
        if v11 ~= nil then
            v9.__state = v11;
        end;
        v9.__onStep:fire(v9.__state.value);
        if v9.__state.complete and v9.__running then
            v9:stop();
            v9.__onComplete:fire(v9.__state.value);
        end;
        return;
    end;
end;
v2.prototype.setGoal = function(v12, v13) --[[ Line: 73 ]] --[[ Name: setGoal ]]
    v12.__goal = v13;
    v12.__state.complete = false;
    v12:start();
end;
v2.prototype.onStep = function(v14, v15) --[[ Line: 79 ]] --[[ Name: onStep ]]
    assert(typeof(v15) == "function");
    return v14.__onStep:subscribe(v15);
end;
v2.prototype.onComplete = function(v16, v17) --[[ Line: 85 ]] --[[ Name: onComplete ]]
    assert(typeof(v17) == "function");
    return v16.__onComplete:subscribe(v17);
end;
v2.prototype.destroy = function(v18) --[[ Line: 91 ]] --[[ Name: destroy ]]
    v18:stop();
end;
return v5;