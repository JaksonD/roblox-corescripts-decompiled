local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.Collections).Object;
local l_createSignal_0 = require(l_Parent_0.Signal).createSignal;
local v3 = require(script.Parent.AnimationStepSignal);
local _ = require(script.Parent.types);
local v5 = {};
v5.__index = v5;
local function v15(v6) --[[ Line: 53 ]] --[[ Name: createGroupMotor ]]
    -- upvalues: l_createSignal_0 (copy), v5 (copy)
    local v7 = {};
    for v8, v9 in pairs(v6) do
        v7[v8] = {
            value = v9, 
            complete = true
        };
    end;
    local v10, v11 = l_createSignal_0();
    local v12, v13 = l_createSignal_0();
    local v14 = {
        __goals = {}, 
        __states = v7, 
        __allComplete = true, 
        __onComplete = v10, 
        __fireOnComplete = v11, 
        __onStep = v12, 
        __fireOnStep = v13, 
        __running = false
    };
    setmetatable(v14, v5);
    return v14;
end;
v5.start = function(v16, v17) --[[ Line: 82 ]] --[[ Name: start ]]
    -- upvalues: v3 (copy)
    if v16.__running then
        return;
    else
        v16.__connection = v3:Connect(function(v18) --[[ Line: 87 ]]
            -- upvalues: v16 (copy)
            v16:step(v18);
        end);
        v16.__running = true;
        if v17 then
            v16:step(0);
        end;
        return;
    end;
end;
v5.stop = function(v19) --[[ Line: 98 ]] --[[ Name: stop ]]
    if v19.__connection ~= nil then
        v19.__connection:Disconnect();
        v19.__running = false;
    end;
end;
v5.step = function(v20, v21) --[[ Line: 105 ]] --[[ Name: step ]]
    if v20.__allComplete then
        return;
    else
        local v22 = true;
        local v23 = {};
        for v24, v25 in pairs(v20.__states) do
            if not v25.complete then
                local v26 = v20.__goals[v24];
                if v26 ~= nil then
                    local v27 = v26.step(v25, v21);
                    if v27 ~= nil then
                        v25 = v27;
                        v20.__states[v24] = v27;
                    end;
                else
                    v25.complete = true;
                end;
                if not v25.complete then
                    v22 = false;
                end;
            end;
            v23[v24] = v25.value;
        end;
        local l___allComplete_0 = v20.__allComplete;
        v20.__allComplete = v22;
        v20.__fireOnStep(v23);
        if v20.__allComplete and not l___allComplete_0 and v20.__running then
            v20:stop();
            v20.__fireOnComplete(v23);
        end;
        return;
    end;
end;
v5.setGoal = function(v29, v30) --[[ Line: 150 ]] --[[ Name: setGoal ]]
    -- upvalues: l_Object_0 (copy)
    v29.__goals = l_Object_0.assign({}, v29.__goals, v30);
    local v31 = false;
    local v32 = {};
    for v33, v34 in pairs(v30) do
        local v35 = v29.__states[v33];
        if v34.startingValue then
            v31 = true;
            v35.value = v34.startingValue;
            if v35.initialValue then
                v35.initialValue = v34.startingValue;
            end;
        end;
        v32[v33] = v35.value;
        if v35 == nil then
            error(("Cannot set goal for the value %s because it doesn't exist"):format((tostring(v33))), 2);
        end;
        v35.complete = false;
    end;
    v29.__allComplete = false;
    v29:start(v31);
end;
v5.onStep = function(v36, v37) --[[ Line: 177 ]] --[[ Name: onStep ]]
    local v38 = v36.__onStep:subscribe(v37);
    return function() --[[ Line: 180 ]]
        -- upvalues: v38 (copy)
        v38:unsubscribe();
    end;
end;
v5.onComplete = function(v39, v40) --[[ Line: 185 ]] --[[ Name: onComplete ]]
    local v41 = v39.__onComplete:subscribe(v40);
    return function() --[[ Line: 188 ]]
        -- upvalues: v41 (copy)
        v41:unsubscribe();
    end;
end;
v5.destroy = function(v42) --[[ Line: 193 ]] --[[ Name: destroy ]]
    v42:stop();
end;
return v15;