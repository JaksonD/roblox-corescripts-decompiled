local v0 = require(script.Parent.Immutable);
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v2 = {
        _listeners = {}
    };
    setmetatable(v2, v1);
    return v2;
end;
v1.connect = function(v3, v4) --[[ Line: 42 ]] --[[ Name: connect ]]
    -- upvalues: v0 (copy)
    local v5 = {
        callback = v4, 
        isConnected = true
    };
    v3._listeners = v0.Append(v3._listeners, v5);
    local function v6() --[[ Line: 49 ]] --[[ Name: disconnect ]]
        -- upvalues: v5 (copy), v3 (copy), v0 (ref)
        v5.isConnected = false;
        v3._listeners = v0.RemoveValueFromList(v3._listeners, v5);
    end;
    return {
        Disconnect = function() --[[ Line: 55 ]] --[[ Name: Disconnect ]]
            -- upvalues: v5 (copy), v3 (copy), v0 (ref)
            warn(string.format("Connection:Disconnect() has been deprecated, use Connection:disconnect()\n%s]", debug.traceback()));
            v5.isConnected = false;
            v3._listeners = v0.RemoveValueFromList(v3._listeners, v5);
        end, 
        disconnect = v6
    };
end;
v1.fire = function(v7, ...) --[[ Line: 68 ]] --[[ Name: fire ]]
    for _, v9 in ipairs(v7._listeners) do
        if v9.isConnected then
            v9.callback(...);
        end;
    end;
end;
v1.Connect = function(v10, ...) --[[ Line: 76 ]] --[[ Name: Connect ]]
    warn(string.format("Signal:Connect() has been deprecated, use Signal:connect()\n%s]", debug.traceback()));
    return v10:connect(...);
end;
v1.Fire = function(v11, ...) --[[ Line: 81 ]] --[[ Name: Fire ]]
    warn(string.format("Signal:Fire() has been deprecated, use Signal:fire()\n%s]", debug.traceback()));
    v11:fire(...);
end;
return v1;