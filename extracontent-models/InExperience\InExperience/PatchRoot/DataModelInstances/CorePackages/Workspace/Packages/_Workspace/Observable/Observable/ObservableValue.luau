local l_Parent_0 = script.Parent.Parent;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local v2 = {};
v2.__index = v2;
local function v5(v3, v4) --[[ Line: 44 ]] --[[ Name: defaultCompareFn ]]
    return v3 == v4;
end;
v2.new = function(v6, v7) --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), l_Signal_0 (copy), v2 (copy)
    return (setmetatable({
        _isEqual = v7 or v5, 
        _value = v6, 
        _changeSignal = l_Signal_0.new()
    }, v2));
end;
v2.get = function(v8) --[[ Line: 57 ]] --[[ Name: get ]]
    return v8._value;
end;
v2.set = function(v9, v10) --[[ Line: 61 ]] --[[ Name: set ]]
    if not v9._isEqual(v9._value, v10) then
        v9._value = v10;
        v9._changeSignal:fire(v10);
    end;
end;
v2.connect = function(v11, v12, v13) --[[ Line: 68 ]] --[[ Name: connect ]]
    local v14 = v11._changeSignal:connect(v12);
    if v13 == true then
        v12(v11._value);
    end;
    return v14;
end;
v2.__tostring = function(v15) --[[ Line: 77 ]] --[[ Name: __tostring ]]
    return "ObservableValue(" .. tostring(v15._value) .. ")";
end;
return v2;