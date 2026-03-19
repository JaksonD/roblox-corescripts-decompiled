local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Dev.ReactRoblox);
local v5 = require(l_Parent_0.views.NavigationEvents);
local v6 = require(l_Parent_0.Events);
local v7 = require(script.Parent.invariant);
local v8 = require(script.Parent.PageNavigationEvent);
local v9 = {};
v9.__index = v9;
v9.new = function() --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy)
    local v10 = {
        navigationEvents = {}
    };
    setmetatable(v10, v9);
    return v10;
end;
v9.getNavigationEvents = function(v11) --[[ Line: 26 ]] --[[ Name: getNavigationEvents ]]
    return v11.navigationEvents;
end;
v9.printNavigationEvents = function(v12) --[[ Line: 30 ]] --[[ Name: printNavigationEvents ]]
    print("Total Events: ", #v12.navigationEvents);
    for _, v14 in v12.navigationEvents do
        print(v14);
    end;
end;
v9.waitForNumberEventsMaxWaitTime = function(v15, v16, v17) --[[ Line: 37 ]] --[[ Name: waitForNumberEventsMaxWaitTime ]]
    -- upvalues: v4 (copy)
    local v18 = 0;
    while #v15.navigationEvents < v16 and v18 <= v17 do
        v4.act(function() --[[ Line: 40 ]]
            -- upvalues: v18 (ref)
            v18 = v18 + task.wait();
        end);
    end;
end;
v9.resetNavigationEvents = function(v19) --[[ Line: 46 ]] --[[ Name: resetNavigationEvents ]]
    v19.navigationEvents = {};
end;
local v20 = {
    onWillFocus = v6.WillFocus, 
    onDidFocus = v6.DidFocus, 
    onWillBlur = v6.WillBlur, 
    onDidBlur = v6.DidBlur
};
v9.createNavigationAdapter = function(v21, v22) --[[ Line: 57 ]] --[[ Name: createNavigationAdapter ]]
    -- upvalues: v20 (copy), v8 (copy), v3 (copy), v5 (copy)
    local v23 = {};
    for v24, v25 in v20 do
        v23[v24] = function() --[[ Line: 60 ]]
            -- upvalues: v8 (ref), v22 (copy), v25 (copy), v21 (copy)
            v8.new(v22, v25);
            table.insert(v21.navigationEvents, v8.new(v22, v25));
        end;
    end;
    return v3.createElement(v5, v23);
end;
v9.equalTo = function(v26, v27) --[[ Line: 69 ]] --[[ Name: equalTo ]]
    -- upvalues: v7 (copy)
    v7(type(v27) == "table", "should be a list");
    local v28 = #v26.navigationEvents;
    if v28 ~= #v27 then
        return false, "different amount of events";
    else
        for v29 = 1, v28 do
            if not v26.navigationEvents[v29]:equalTo(v27[v29]) then
                return false, ("events at position %d do not match"):format(v29);
            end;
        end;
        return true;
    end;
end;
v9.expect = function(v30, v31) --[[ Line: 86 ]] --[[ Name: expect ]]
    -- upvalues: l_Array_0 (copy)
    local v32, v33 = v30:equalTo(v31);
    if not v32 then
        local v34 = "{}";
        local v35 = "{}";
        if #v30.navigationEvents > 0 then
            v34 = ("{\n  %s,\n}"):format(table.concat(l_Array_0.map(v30.navigationEvents, tostring), ",\n  "));
        end;
        if #v31 > 0 then
            v35 = ("{\n  %s,\n}"):format(table.concat(l_Array_0.map(v31, tostring), ",\n  "));
        end;
        error(("%s\nGot events: %s\n\nExpected events: %s"):format(v33, v34, v35));
    end;
end;
return v9;