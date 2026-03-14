local l_Parent_0 = script.Parent.Parent;
local l_createSignal_0 = require(l_Parent_0.Signal).createSignal;
local v2 = require(script.Parent.AnimationStepSignal);
local _ = require(script.Parent.types);
local v4 = {};
v4.__index = v4;
local function v11(v5) --[[ Line: 41 ]] --[[ Name: createSingleMotor ]]
    -- upvalues: l_createSignal_0 (copy), v4 (copy)
    local v6, v7 = l_createSignal_0();
    local v8, v9 = l_createSignal_0();
    local v10 = {
        __goal = nil, 
        __state = {
            value = v5, 
            complete = true
        }, 
        __onComplete = v6, 
        __fireOnComplete = v7, 
        __onStep = v8, 
        __fireOnStep = v9, 
        __running = false
    };
    setmetatable(v10, v4);
    return v10;
end;
v4.start = function(v12) --[[ Line: 63 ]] --[[ Name: start ]]
    -- upvalues: v2 (copy)
    if v12.__running then
        return;
    else
        v12.__connection = v2:Connect(function(v13) --[[ Line: 68 ]]
            -- upvalues: v12 (copy)
            v12:step(v13);
        end);
        v12.__running = true;
        if v12.__goal and v12.__goal.startingValue then
            v12.__state.value = v12.__goal.startingValue;
            if v12.__state.initialValue then
                v12.__state.initialValue = v12.__goal.startingValue;
            end;
            v12:step(0);
        end;
        return;
    end;
end;
v4.stop = function(v14) --[[ Line: 83 ]] --[[ Name: stop ]]
    if v14.__connection ~= nil then
        v14.__connection:Disconnect();
    end;
    v14.__running = false;
end;
v4.step = function(v15, v16) --[[ Line: 91 ]] --[[ Name: step ]]
    if v15.__state.complete then
        return;
    elseif v15.__goal == nil then
        return;
    else
        local v17 = v15.__goal.step(v15.__state, v16);
        if v17 ~= nil then
            v15.__state = v17;
        end;
        v15.__fireOnStep(v15.__state.value);
        if v15.__state.complete and v15.__running then
            v15:stop();
            v15.__fireOnComplete(v15.__state.value);
        end;
        return;
    end;
end;
v4.setGoal = function(v18, v19) --[[ Line: 114 ]] --[[ Name: setGoal ]]
    v18.__goal = v19;
    v18.__state.complete = false;
    v18:start();
end;
v4.onStep = function(v20, v21) --[[ Line: 120 ]] --[[ Name: onStep ]]
    local v22 = v20.__onStep:subscribe(v21);
    return function() --[[ Line: 123 ]]
        -- upvalues: v22 (copy)
        v22:unsubscribe();
    end;
end;
v4.onComplete = function(v23, v24) --[[ Line: 128 ]] --[[ Name: onComplete ]]
    local v25 = v23.__onComplete:subscribe(v24);
    return function() --[[ Line: 131 ]]
        -- upvalues: v25 (copy)
        v25:unsubscribe();
    end;
end;
v4.destroy = function(v26) --[[ Line: 136 ]] --[[ Name: destroy ]]
    v26:stop();
end;
return v11;