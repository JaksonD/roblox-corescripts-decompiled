local v0 = require(script.Parent.Immutable);
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v2 = {
        _listeners = {}
    };
    setmetatable(v2, v1);
    return v2;
end;
v1.Connect = function(v3, v4) --[[ Line: 26 ]] --[[ Name: Connect ]]
    -- upvalues: v0 (copy)
    local v5 = {
        callback = v4, 
        isConnected = true
    };
    v3._listeners = v0.Append(v3._listeners, v5);
    return {
        Disconnect = function() --[[ Line: 33 ]] --[[ Name: disconnect ]]
            -- upvalues: v5 (copy), v3 (copy), v0 (ref)
            v5.isConnected = false;
            v3._listeners = v0.RemoveValueFromList(v3._listeners, v5);
        end
    };
end;
v1.Fire = function(v6, ...) --[[ Line: 43 ]] --[[ Name: Fire ]]
    for _, v8 in ipairs(v6._listeners) do
        if v8.isConnected then
            v8.callback(...);
        end;
    end;
end;
return v1;