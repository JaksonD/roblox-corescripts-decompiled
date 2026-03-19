local l_Parent_0 = script.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_Error_0 (copy)
    local v3 = {};
    setmetatable(v3, v2);
    v3.aborted = false;
    v3.reason = l_Error_0.new("Undefined Error");
    v3._signal = Instance.new("BindableEvent");
    return v3;
end;
v2.abort = function(v4) --[[ Line: 32 ]] --[[ Name: abort ]]
    -- upvalues: v2 (copy), l_Error_0 (copy)
    local v5 = v2.new();
    v5.reason = v4 or l_Error_0.new("Signal Aborted");
    return v5;
end;
v2.timeout = function(v6) --[[ Line: 38 ]] --[[ Name: timeout ]]
    -- upvalues: v2 (copy), l_Error_0 (copy)
    local v7 = v2.new();
    v7.reason = l_Error_0.new("TimeoutError");
    task.delay(v6 / 1000, function() --[[ Line: 41 ]]
        -- upvalues: v7 (copy)
        v7:fire();
    end);
    return v7;
end;
v2.throwIfAborted = function(v8) --[[ Line: 47 ]] --[[ Name: throwIfAborted ]]
    if v8.aborted then
        error(v8.reason);
    end;
end;
v2.connect = function(v9, v10) --[[ Line: 55 ]] --[[ Name: connect ]]
    return v9._signal.Event:Connect(v10);
end;
v2.fire = function(v11) --[[ Line: 60 ]] --[[ Name: fire ]]
    v11.aborted = true;
    v11._signal:Fire();
end;
return {
    AbortSignal = v2
};