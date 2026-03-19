local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Signal_0 = require(l_Parent_1.AppCommonLib).Signal;
local _ = require(l_Parent_0.Types);
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v4 (copy)
    return (setmetatable({
        _value = v5, 
        _changeSignal = l_Signal_0.new()
    }, v4));
end;
v4.get = function(v6) --[[ Line: 36 ]] --[[ Name: get ]]
    return v6._value;
end;
v4.set = function(v7, v8) --[[ Line: 40 ]] --[[ Name: set ]]
    if v7._value ~= v8 then
        v7._value = v8;
        v7._changeSignal:fire(v8);
    end;
end;
v4.signal = function(v9) --[[ Line: 47 ]] --[[ Name: signal ]]
    return v9._changeSignal;
end;
v4.connect = function(v10, v11, v12) --[[ Line: 51 ]] --[[ Name: connect ]]
    local v13 = v10._changeSignal:connect(v11);
    if v12 == true then
        v11(v10._value);
    end;
    return v13;
end;
return v4;