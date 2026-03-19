local l_Parent_0 = script.Parent.Parent.Parent;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v2 (copy)
    return (setmetatable({
        _value = false, 
        _changeSignal = l_Signal_0.new()
    }, v2));
end;
v2.get = function(v3) --[[ Line: 24 ]] --[[ Name: get ]]
    return v3._value;
end;
v2.set = function(v4, v5) --[[ Line: 28 ]] --[[ Name: set ]]
    if v4._value ~= v5 then
        v4._value = v5;
        v4._changeSignal:fire(v5);
    end;
end;
v2.connect = function(v6, v7, v8) --[[ Line: 35 ]] --[[ Name: connect ]]
    local v9 = v6._changeSignal:connect(v7);
    if v8 == true then
        v7(v6._value);
    end;
    return v9;
end;
return v2.new();