local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2, v3, v4, v5, v6) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v7 = {
        cancelled = false, 
        phase = v4, 
        currentInstance = v2, 
        targetInstance = v1, 
        eventName = v3, 
        synthetic = v5 or false, 
        eventData = if not (type(v6) == "table") or table.isfrozen(v6) then v6 else table.freeze(v6)
    };
    setmetatable(v7, v0);
    return v7;
end;
v0.cancel = function(v8) --[[ Line: 41 ]] --[[ Name: cancel ]]
    v8.cancelled = true;
end;
return v0;