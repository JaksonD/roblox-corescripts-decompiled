local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.StateTable);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v3 = {
        transitionTable = {}
    };
    setmetatable(v3, v2);
    return v3;
end;
v2.withName = function(v4, v5) --[[ Line: 29 ]] --[[ Name: withName ]]
    assert(typeof(v5) == "string", "stateTableName must be a string");
    assert(#v5 > 0, "stateTableName must not be empty");
    assert(v4.stateTableName == nil, "Cannot call withName twice");
    v4.stateTableName = v5;
    return v4;
end;
v2.withInitialState = function(v6, v7) --[[ Line: 38 ]] --[[ Name: withInitialState ]]
    assert(typeof(v7) == "string", "initialState must be a string");
    assert(#v7 > 0, "initialState must not be empty");
    assert(v6.initialState == nil, "Cannot call withInitialState twice");
    v6.initialState = v7;
    return v6;
end;
v2.withInitialContext = function(v8, v9) --[[ Line: 47 ]] --[[ Name: withInitialContext ]]
    assert(typeof(v9) == "table", "initialContext must be a table");
    assert(v8.initialContext == nil, "Cannot call withInitialContext twice");
    v8.initialContext = v9;
    return v8;
end;
v2.addState = function(v10, v11) --[[ Line: 55 ]] --[[ Name: addState ]]
    assert(typeof(v11) == "string", "stateName must be a string");
    assert(#v11 > 0, "stateName must not be empty");
    assert(v10.transitionTable[v11] == nil, string.format("Cannot add the same state '%s' twice", v11));
    v10.transitionTable[v11] = {};
    v10.currentStateName = v11;
    v10.currentEventName = nil;
    return v10;
end;
v2.withEvent = function(v12, v13) --[[ Line: 66 ]] --[[ Name: withEvent ]]
    assert(typeof(v13) == "string", "eventName must be a string");
    assert(#v13 > 0, "eventName must not be empty");
    assert(v12.currentStateName ~= nil, "Cannot add an event without first specifying a state via addState()");
    assert(v12.transitionTable[v12.currentStateName][v13] == nil, "Cannot add an event to the same state more than once");
    v12.transitionTable[v12.currentStateName][v13] = {};
    v12.currentEventName = v13;
    return v12;
end;
v2.nextState = function(v14, v15) --[[ Line: 80 ]] --[[ Name: nextState ]]
    assert(typeof(v15) == "string", "stateName must be a string");
    assert(#v15 > 0, "stateName must not be empty");
    assert(v14.currentEventName ~= nil, "Must specify an event before attaching nextState, via withEvent()");
    assert(v14.transitionTable[v14.currentStateName][v14.currentEventName].nextState == nil, "Cannot set nextState twice for the same event transition");
    v14.transitionTable[v14.currentStateName][v14.currentEventName].nextState = v15;
    return v14;
end;
v2.action = function(v16, v17) --[[ Line: 93 ]] --[[ Name: action ]]
    assert(typeof(v17) == "function", "actionFunctor must be a function");
    assert(v16.currentEventName ~= nil, "Must specify an event before attaching action, via withEvent()");
    assert(v16.transitionTable[v16.currentStateName][v16.currentEventName].action == nil, "Cannot set action twice for the same event transition");
    v16.transitionTable[v16.currentStateName][v16.currentEventName].action = v17;
    return v16;
end;
v2.build = function(v18) --[[ Line: 105 ]] --[[ Name: build ]]
    -- upvalues: v1 (copy)
    local v19 = false;
    if v18.stateTableName ~= nil then
        v19 = #v18.stateTableName > 0;
    end;
    assert(v19, "State table name was not set via withName()");
    v19 = false;
    if v18.initialState ~= nil then
        v19 = #v18.initialState > 0;
    end;
    assert(v19, "Initial state was not set via withInitialState()");
    assert(typeof(v18.transitionTable[v18.initialState]) == "table", "Initial state was not added to state table");
    return v1.new(v18.stateTableName, v18.initialState, v18.initialContext, v18.transitionTable);
end;
return v2;