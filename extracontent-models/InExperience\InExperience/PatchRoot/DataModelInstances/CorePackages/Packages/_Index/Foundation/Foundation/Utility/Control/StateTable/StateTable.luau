local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local _ = require(l_script_FirstAncestor_0.Enums.ControlStateEvent);
local v3 = require(l_script_FirstAncestor_0.Utility.Logger);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6, v7) --[[ Line: 53 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    assert(#v5 > 0, "name must not be an empty string");
    assert(v7[v6] ~= nil, "initialState must be present in transitionTable");
    local v8 = {};
    setmetatable(v8, v4);
    v8.name = v5;
    v8.currentState = v6;
    v8.transitionTable = {};
    v8.events = {};
    for v9, v10 in v7 do
        local v11 = {};
        for v12, v13 in v10 do
            local l_nextState_0 = v13.nextState;
            if l_nextState_0 ~= nil then
                assert(v7[l_nextState_0] ~= nil, "nextState does not exist in transitionTable");
            end;
            v11[v12] = v13;
            if v8.events[v12] == nil then
                v8.events[v12] = function() --[[ Line: 79 ]]
                    -- upvalues: v8 (copy), v12 (copy)
                    return v8:handleEvent(v12);
                end;
            end;
        end;
        v8.transitionTable[v9] = v11;
    end;
    setmetatable(v8.events, {
        __index = function(_, v16) --[[ Line: 90 ]] --[[ Name: __index ]]
            -- upvalues: v8 (copy)
            error(string.format("'%s' is not a valid event in StateTable '%s'", tostring(v16), v8.name), 2);
        end
    });
    return v8;
end;
v4.handleEvent = function(v17, v18) --[[ Line: 109 ]] --[[ Name: handleEvent ]]
    -- upvalues: v3 (copy)
    local l_currentState_0 = v17.currentState;
    local v20 = v17.transitionTable[l_currentState_0][v18];
    if v20 == nil then
        v3:debug("No transition found for event " .. v18 .. " in state " .. l_currentState_0);
        return;
    else
        local l_nextState_1 = v20.nextState;
        v17.currentState = l_nextState_1;
        if v17.stateChangeHandler ~= nil then
            v17.stateChangeHandler(l_nextState_1);
        end;
        return;
    end;
end;
v4.onStateChange = function(v22, v23) --[[ Line: 137 ]] --[[ Name: onStateChange ]]
    v22.stateChangeHandler = v23;
end;
return v4;