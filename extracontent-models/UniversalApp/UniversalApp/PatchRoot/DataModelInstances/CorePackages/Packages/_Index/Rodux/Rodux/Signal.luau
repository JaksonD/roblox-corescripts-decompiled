local l___DEV___0 = _G.__DEV__;
local _, v2 = xpcall(function() --[[ Line: 9 ]]
    return game:DefineFastFlag("RoduxRemoveConnectTraceback", false);
end, function() --[[ Line: 11 ]]
    return true;
end);
local function v8(v3, ...) --[[ Line: 15 ]] --[[ Name: immutableAppend ]]
    local v4 = {};
    local v5 = #v3;
    for v6 = 1, v5 do
        v4[v6] = v3[v6];
    end;
    for v7 = 1, select("#", ...) do
        v4[v5 + v7] = select(v7, ...);
    end;
    return v4;
end;
local function v13(v9, v10) --[[ Line: 30 ]] --[[ Name: immutableRemoveValue ]]
    local v11 = {};
    for v12 = 1, #v9 do
        if v9[v12] ~= v10 then
            table.insert(v11, v9[v12]);
        end;
    end;
    return v11;
end;
local v14 = {};
v14.__index = v14;
v14.new = function(v15) --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy)
    local v16 = {
        _listeners = {}, 
        _store = v15
    };
    setmetatable(v16, v14);
    return v16;
end;
v14.connect = function(v17, v18) --[[ Line: 57 ]] --[[ Name: connect ]]
    -- upvalues: v2 (copy), l___DEV___0 (copy), v8 (copy), v13 (copy)
    if typeof(v18) ~= "function" then
        error("Expected the listener to be a function.");
    end;
    if v17._store and v17._store._isDispatching then
        error("You may not call store.changed:connect() while the reducer is executing. If you would like to be notified after the store has been updated, subscribe from a component and invoke store:getState() in the callback to access the latest state. ");
    end;
    local v19 = {
        callback = v18, 
        disconnected = false, 
        connectTraceback = nil, 
        disconnectTraceback = nil
    };
    if not v2 or l___DEV___0 then
        v19.connectTraceback = debug.traceback();
    end;
    v17._listeners = v8(v17._listeners, v19);
    return {
        disconnect = function() --[[ Line: 83 ]] --[[ Name: disconnect ]]
            -- upvalues: v19 (copy), v17 (copy), v2 (ref), l___DEV___0 (ref), v13 (ref)
            if v19.disconnected then
                error(("Listener connected at: \n%s\nwas already disconnected at: \n%s\n"):format(tostring(v19.connectTraceback), (tostring(v19.disconnectTraceback))));
            end;
            if v17._store and v17._store._isDispatching then
                error("You may not unsubscribe from a store listener while the reducer is executing.");
            end;
            if not v2 or l___DEV___0 then
                v19.disconnectTraceback = debug.traceback();
            end;
            v19.disconnected = true;
            v17._listeners = v13(v17._listeners, v19);
        end
    };
end;
v14.fire = function(v20, ...) --[[ Line: 109 ]] --[[ Name: fire ]]
    for _, v22 in ipairs(v20._listeners) do
        if not v22.disconnected then
            v22.callback(...);
        end;
    end;
end;
return v14;