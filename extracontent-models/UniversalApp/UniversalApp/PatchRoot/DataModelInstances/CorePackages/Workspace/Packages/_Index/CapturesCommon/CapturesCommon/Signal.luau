local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Immutable);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v3 = {
        _listeners = {}
    };
    setmetatable(v3, v2);
    return v3;
end;
v2.connect = function(v4, v5) --[[ Line: 44 ]] --[[ Name: connect ]]
    -- upvalues: v1 (copy)
    local v6 = {
        callback = v5, 
        isConnected = true
    };
    v4._listeners = v1.Append(v4._listeners, v6);
    local function v7() --[[ Line: 51 ]] --[[ Name: disconnect ]]
        -- upvalues: v6 (copy), v4 (copy), v1 (ref)
        v6.isConnected = false;
        v4._listeners = v1.RemoveValueFromList(v4._listeners, v6);
    end;
    return {
        Disconnect = function() --[[ Line: 57 ]] --[[ Name: Disconnect ]]
            -- upvalues: v6 (copy), v4 (copy), v1 (ref)
            warn(string.format("Connection:Disconnect() has been deprecated, use Connection:disconnect()\n%s]", debug.traceback()));
            v6.isConnected = false;
            v4._listeners = v1.RemoveValueFromList(v4._listeners, v6);
        end, 
        disconnect = v7
    };
end;
v2.fire = function(v8, ...) --[[ Line: 70 ]] --[[ Name: fire ]]
    for _, v10 in ipairs(v8._listeners) do
        if v10.isConnected then
            v10.callback(...);
        end;
    end;
end;
v2.Connect = function(v11, ...) --[[ Line: 78 ]] --[[ Name: Connect ]]
    warn(string.format("Signal:Connect() has been deprecated, use Signal:connect()\n%s]", debug.traceback()));
    return v11:connect(...);
end;
v2.Fire = function(v12, ...) --[[ Line: 83 ]] --[[ Name: Fire ]]
    warn(string.format("Signal:Fire() has been deprecated, use Signal:fire()\n%s]", debug.traceback()));
    v12:fire(...);
end;
return v2;