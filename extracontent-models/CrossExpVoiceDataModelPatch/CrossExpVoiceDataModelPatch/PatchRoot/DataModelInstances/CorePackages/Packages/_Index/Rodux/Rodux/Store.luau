local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Signal);
local v2 = require(script.Parent.NoYield);
local v10 = {
    reportReducerError = function(_, _, v5) --[[ Line: 9 ]] --[[ Name: reportReducerError ]]
        error(string.format("Received error: %s\n\n%s", v5.message, v5.thrownValue));
    end, 
    reportUpdateError = function(_, _, _, v9) --[[ Line: 12 ]] --[[ Name: reportUpdateError ]]
        error(string.format("Received error: %s\n\n%s", v9.message, v9.thrownValue));
    end
};
local function v12(v11) --[[ Line: 17 ]] --[[ Name: tracebackReporter ]]
    return debug.traceback((tostring(v11)));
end;
local v13 = {
    _flushEvent = l_RunService_0.Heartbeat
};
v13.__index = v13;
v13.new = function(v14, v15, v16, v17, v18) --[[ Line: 41 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), v1 (copy), v12 (copy), v13 (copy)
    assert(typeof(v14) == "function", "Bad argument #1 to Store.new, expected function.");
    local v19 = true;
    if v16 ~= nil then
        v19 = typeof(v16) == "table";
    end;
    assert(v19, "Bad argument #3 to Store.new, expected nil or table.");
    v19 = true;
    if v18 ~= nil then
        v19 = false;
        if typeof(v18) == "table" then
            v19 = v18.__className == "Devtools";
        end;
    end;
    assert(v19, "Bad argument #5 to Store.new, expected nil or Devtools object.");
    if v16 ~= nil then
        for v20 = 1, #v16 do
            assert(typeof(v16[v20]) == "function", ("Expected the middleware ('%s') at index %d to be a function."):format(tostring(v16[v20]), v20));
        end;
    end;
    local v21 = {
        _source = string.match(debug.traceback(), "^.-\n(.-)\n"), 
        _errorReporter = v17 or v10, 
        _isDispatching = false, 
        _lastState = nil
    };
    v21.changed = v1.new(v21);
    v21._reducer = v14;
    v21._flushHandler = function(v22) --[[ Line: 66 ]]
        -- upvalues: v21 (copy)
        v21.changed:fire(v22, v21._lastState);
    end;
    if v18 then
        v21._devtools = v18;
        v18:_hookIntoStore(v21);
    end;
    v19 = {
        type = "@@INIT"
    };
    v21._actionLog = {
        v19
    };
    local v23, v24 = xpcall(function() --[[ Line: 82 ]]
        -- upvalues: v21 (copy), v15 (copy), v19 (copy)
        v21._state = v21._reducer(v15, v19);
    end, v12);
    if not v23 then
        v21._errorReporter.reportReducerError(v15, v19, {
            message = "Caught error in reducer with init", 
            thrownValue = v24
        });
        v21._state = v15;
    end;
    v21._lastState = v21._state;
    v21._mutatedSinceFlush = false;
    v21._connections = {};
    setmetatable(v21, v13);
    local v25 = v21._flushEvent:Connect(function() --[[ Line: 99 ]]
        -- upvalues: v21 (copy)
        v21:flush();
    end);
    table.insert(v21._connections, v25);
    if v16 then
        local l_dispatch_0 = v21.dispatch;
        local function v27(...) --[[ Line: 106 ]]
            -- upvalues: l_dispatch_0 (copy), v21 (copy)
            return l_dispatch_0(v21, ...);
        end;
        for v28 = #v16, 1, -1 do
            v27 = v16[v28](v27, v21);
        end;
        do
            local l_v27_0 = v27;
            v21.dispatch = function(_, ...) --[[ Line: 115 ]]
                -- upvalues: l_v27_0 (ref)
                return l_v27_0(...);
            end;
        end;
    end;
    return v21;
end;
v13.getState = function(v31) --[[ Line: 126 ]] --[[ Name: getState ]]
    if v31._isDispatching then
        error(("You may not call store:getState() while the reducer is executing. The reducer (%s) has already received the state as an argument. Pass it down from the top reducer instead of reading it from the store."):format((tostring(v31._reducer))));
    end;
    return v31._state;
end;
v13.dispatch = function(v32, v33) --[[ Line: 143 ]] --[[ Name: dispatch ]]
    if typeof(v33) ~= "table" then
        error(("Actions must be tables. Use custom middleware for %q actions."):format((typeof(v33))), 2);
    end;
    if v33.type == nil then
        error("Actions may not have an undefined 'type' property. " .. "Have you misspelled a constant? \n" .. tostring(v33), 2);
    end;
    if v32._isDispatching then
        error("Reducers may not dispatch actions.");
    end;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 161 ]]
        -- upvalues: v32 (copy), v33 (copy)
        v32._isDispatching = true;
        v32._state = v32._reducer(v32._state, v33);
        v32._mutatedSinceFlush = true;
    end);
    v32._isDispatching = false;
    if not l_status_0 then
        v32._errorReporter.reportReducerError(v32._state, v33, {
            message = "Caught error in reducer", 
            thrownValue = l_result_0
        });
    end;
    if #v32._actionLog == 3 then
        table.remove(v32._actionLog, 1);
    end;
    table.insert(v32._actionLog, v33);
end;
v13.destruct = function(v36) --[[ Line: 189 ]] --[[ Name: destruct ]]
    for _, v38 in ipairs(v36._connections) do
        v38:Disconnect();
    end;
    v36._connections = nil;
end;
v13.flush = function(v39) --[[ Line: 200 ]] --[[ Name: flush ]]
    -- upvalues: v2 (copy), v12 (copy)
    if not v39._mutatedSinceFlush then
        return;
    else
        v39._mutatedSinceFlush = false;
        local l__state_0 = v39._state;
        local v41, v42 = xpcall(function() --[[ Line: 212 ]]
            -- upvalues: v2 (ref), v39 (copy), l__state_0 (copy)
            v2(v39._flushHandler, l__state_0);
        end, v12);
        if not v41 then
            v39._errorReporter.reportUpdateError(v39._lastState, l__state_0, v39._actionLog, {
                message = "Caught error flushing store updates", 
                thrownValue = v42
            });
        end;
        v39._lastState = l__state_0;
        return;
    end;
end;
return v13;