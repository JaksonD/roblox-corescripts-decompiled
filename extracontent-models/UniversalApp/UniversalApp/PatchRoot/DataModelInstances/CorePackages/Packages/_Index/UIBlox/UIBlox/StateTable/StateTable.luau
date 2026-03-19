local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = {};
v2.__index = v2;
local function _(v3, v4) --[[ Line: 9 ]] --[[ Name: validateStateTableItem ]]
    local v5 = typeof(v3);
    local v6 = true;
    if v5 ~= "string" then
        v6 = v5 == "userdata";
    end;
    assert(v6, string.format("%s '%s' must be a string or userdata but is a %s", v4, tostring(v3), v5));
end;
v2.new = function(v8, v9, v10, v11) --[[ Line: 72 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    assert(typeof(v8) == "string", "name must be a string");
    assert(#v8 > 0, "name must not be an empty string");
    local v12 = typeof(v9);
    local v13 = true;
    if v12 ~= "string" then
        v13 = v12 == "userdata";
    end;
    assert(v13, string.format("%s '%s' must be a string or userdata but is a %s", "initialState", tostring(v9), v12));
    v13 = true;
    if v10 ~= nil then
        v13 = typeof(v10) == "table";
    end;
    assert(v13, "initialContext must be a table or nil");
    assert(typeof(v11) == "table", "transitionTable must be a table");
    assert(typeof(v11[v9]) == "table", "initialState must be present in transitionTable");
    v12 = {};
    setmetatable(v12, v2);
    v12.name = v8;
    v12.currentState = v9;
    v12.currentContext = v10 or {};
    v12.transitionTable = {};
    v12.events = {};
    for v14, v15 in pairs(v11) do
        local v16 = typeof(v14);
        local v17 = true;
        if v16 ~= "string" then
            v17 = v16 == "userdata";
        end;
        assert(v17, string.format("%s '%s' must be a string or userdata but is a %s", "state", tostring(v14), v16));
        assert(typeof(v15) == "table", string.format("state '%s' must map to a table", (tostring(v14))));
        v16 = {};
        for v18, v19 in pairs(v15) do
            local v20 = typeof(v18);
            local v21 = true;
            if v20 ~= "string" then
                v21 = v20 == "userdata";
            end;
            assert(v21, string.format("%s '%s' must be a string or userdata but is a %s", "event", tostring(v18), v20));
            assert(typeof(v19) == "table", string.format("event '%s' must map to a table", (tostring(v18))));
            v20 = v19.nextState;
            v21 = v19.action;
            if v20 ~= nil then
                local v22 = typeof(v20);
                local v23 = true;
                if v22 ~= "string" then
                    v23 = v22 == "userdata";
                end;
                assert(v23, string.format("%s '%s' must be a string or userdata but is a %s", "nextState", tostring(v20), v22));
                assert(v11[v20] ~= nil, string.format("nextState '%s' does not exist in transitionTable", (tostring(v20))));
            end;
            local v24 = true;
            if v21 ~= nil then
                v24 = typeof(v21) == "function";
            end;
            assert(v24, "action must be a function");
            v16[v18] = v19;
            if v12.events[v18] == nil then
                v12.events[v18] = function(v25) --[[ Line: 119 ]]
                    -- upvalues: v12 (copy), v18 (copy)
                    return v12:handleEvent(v18, v25);
                end;
            end;
        end;
        v12.transitionTable[v14] = v16;
    end;
    setmetatable(v12.events, {
        __index = function(_, v27) --[[ Line: 130 ]] --[[ Name: __index ]]
            -- upvalues: v12 (copy)
            error(string.format("'%s' is not a valid event in StateTable '%s'", tostring(v27), v12.name), 2);
        end
    });
    return v12;
end;
v2.handleEvent = function(v28, v29, v30) --[[ Line: 150 ]] --[[ Name: handleEvent ]]
    -- upvalues: v1 (copy)
    local v31 = typeof(v29);
    local v32 = true;
    if v31 ~= "string" then
        v32 = v31 == "userdata";
    end;
    assert(v32, string.format("%s '%s' must be a string or userdata but is a %s", "event", tostring(v29), v31));
    v32 = true;
    if v30 ~= nil then
        v32 = typeof(v30) == "table";
    end;
    assert(v32, "args must be nil or valid table");
    v31 = v28.currentState;
    v32 = v28.transitionTable[v31];
    assert(v32 ~= nil, "no transition events for current state");
    if v32[v29] ~= nil then
        local v33 = v32[v29];
        local v34 = v33.nextState or v31;
        local l_action_0 = v33.action;
        local l_currentContext_0 = v28.currentContext;
        if l_action_0 ~= nil then
            local v37 = l_action_0(v31, v34, v30, v28.currentContext) or {};
            l_currentContext_0 = v1.Dictionary.join(v28.currentContext, v37);
            v28.currentContext = l_currentContext_0;
        end;
        v28.currentState = v34;
        if v28.stateChangeHandler ~= nil then
            v28.stateChangeHandler(v31, v34, l_currentContext_0);
        end;
    end;
end;
v2.onStateChange = function(v38, v39) --[[ Line: 191 ]] --[[ Name: onStateChange ]]
    local v40 = true;
    if v39 ~= nil then
        v40 = typeof(v39) == "function";
    end;
    assert(v40, "stateChangeHandler must be nil or a function");
    v38.stateChangeHandler = v39;
end;
return v2;