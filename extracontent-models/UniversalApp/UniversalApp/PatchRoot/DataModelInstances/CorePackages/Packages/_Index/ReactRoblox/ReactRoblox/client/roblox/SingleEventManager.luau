local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local v2 = {
    Disabled = "Disabled", 
    Suspended = "Suspended", 
    Enabled = "Enabled"
};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 49 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy)
    return (setmetatable({
        _suspendedEventQueue = {}, 
        _connections = {}, 
        _listeners = {}, 
        _status = v2.Disabled, 
        _isResuming = false, 
        _instance = v4
    }, v3));
end;
v3.connectEvent = function(v5, v6, v7) --[[ Line: 77 ]] --[[ Name: connectEvent ]]
    v5:_connect(v6, v5._instance[v6], v7);
end;
v3.connectPropertyChange = function(v8, v9, v10) --[[ Line: 81 ]] --[[ Name: connectPropertyChange ]]
    local l_status_0, l_result_0 = pcall(v8._instance.GetPropertyChangedSignal, v8._instance, v9);
    if not l_status_0 then
        error(string.format("Cannot get changed signal on property %q: %s", tostring(v9), l_result_0), 0);
    end;
    v8:_connect("Change." .. v9, l_result_0, v10);
end;
v3._connect = function(v13, v14, v15, v16) --[[ Line: 99 ]] --[[ Name: _connect ]]
    -- upvalues: v2 (copy)
    if v16 == nil then
        if v13._connections[v14] ~= nil then
            v13._connections[v14]:Disconnect();
            v13._connections[v14] = nil;
        end;
        v13._listeners[v14] = nil;
        return;
    else
        if v13._connections[v14] == nil then
            v13._connections[v14] = v15:Connect(function(...) --[[ Line: 110 ]]
                -- upvalues: v13 (copy), v2 (ref), v14 (copy)
                if v13._status == v2.Enabled then
                    v13._listeners[v14](v13._instance, ...);
                    return;
                else
                    if v13._status == v2.Suspended then
                        local v17 = select("#", ...);
                        table.insert(v13._suspendedEventQueue, {
                            v14, 
                            v17, 
                            ...
                        });
                    end;
                    return;
                end;
            end);
        end;
        v13._listeners[v14] = v16;
        return;
    end;
end;
v3.suspend = function(v18) --[[ Line: 130 ]] --[[ Name: suspend ]]
    -- upvalues: v2 (copy)
    v18._status = v2.Suspended;
end;
v3.resume = function(v19) --[[ Line: 134 ]] --[[ Name: resume ]]
    -- upvalues: l_console_0 (copy), v2 (copy)
    if v19._isResuming then
        return;
    else
        v19._isResuming = true;
        for _, v21 in v19._suspendedEventQueue do
            local v22 = v19._listeners[v21[1]];
            local v23 = v21[2];
            if v22 ~= nil then
                local v24 = coroutine.create(v22);
                local v25, v26 = coroutine.resume(v24, v19._instance, unpack(v21, 3, 2 + v23));
                if not v25 then
                    l_console_0.warn("%s", v26);
                end;
            end;
        end;
        v19._isResuming = false;
        v19._status = v2.Enabled;
        table.clear(v19._suspendedEventQueue);
        return;
    end;
end;
return v3;