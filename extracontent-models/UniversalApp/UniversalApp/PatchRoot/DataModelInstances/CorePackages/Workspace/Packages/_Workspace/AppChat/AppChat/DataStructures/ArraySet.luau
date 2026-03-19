local v0 = {};
v0.__index = function(v1, v2) --[[ Line: 47 ]] --[[ Name: __index ]]
    -- upvalues: v0 (copy)
    if type(v2) == "number" then
        return v1:at(v2);
    else
        return v0[v2];
    end;
end;
v0.__len = function(v3) --[[ Line: 55 ]] --[[ Name: __len ]]
    return v3:size();
end;
v0.__newindex = function(v4, v5, v6) --[[ Line: 59 ]] --[[ Name: __newindex ]]
    v4._indexToValue[v5] = v6;
end;
v0.__iter = function(v7) --[[ Line: 63 ]] --[[ Name: __iter ]]
    local v8 = 0;
    return function() --[[ Line: 65 ]]
        -- upvalues: v8 (ref), v7 (copy)
        v8 = v8 + 1;
        if v8 <= v7._size then
            return v7._indexToValue[v8];
        else
            return nil;
        end;
    end;
end;
v0.add = function(v9, v10) --[[ Line: 75 ]] --[[ Name: add ]]
    if v9._valueToIndex[v10] then
        return false;
    else
        local v11 = v9._size + 1;
        v9._valueToIndex[v10] = v11;
        v9._indexToValue[v11] = v10;
        v9._size = v11;
        return true;
    end;
end;
v0.remove = function(v12, v13) --[[ Line: 91 ]] --[[ Name: remove ]]
    if not v12._valueToIndex[v13] then
        return false;
    else
        local v14 = v12._valueToIndex[v13];
        v12._valueToIndex[v13] = nil;
        for v15 = v14 + 1, v12._size do
            local v16 = v12._indexToValue[v15];
            v12._indexToValue[v15 - 1] = v16;
            v12._valueToIndex[v16] = v15 - 1;
        end;
        v12._indexToValue[v12._size] = nil;
        v12._size = v12._size - 1;
        return true;
    end;
end;
v0.has = function(v17, v18) --[[ Line: 114 ]] --[[ Name: has ]]
    return v17._valueToIndex[v18] ~= nil;
end;
v0.clear = function(v19) --[[ Line: 118 ]] --[[ Name: clear ]]
    v19._valueToIndex = {};
    v19._indexToValue = {};
    v19._size = 0;
end;
v0.size = function(v20) --[[ Line: 124 ]] --[[ Name: size ]]
    return v20._size;
end;
v0.at = function(v21, v22) --[[ Line: 129 ]] --[[ Name: at ]]
    if v22 < 1 or v21._size < v22 then
        return nil;
    else
        return v21._indexToValue[v22];
    end;
end;
v0.toArray = function(v23) --[[ Line: 139 ]] --[[ Name: toArray ]]
    return table.clone(v23._indexToValue);
end;
v0.clone = function(v24) --[[ Line: 144 ]] --[[ Name: clone ]]
    -- upvalues: v0 (copy)
    return v0.new(v24._indexToValue);
end;
v0.new = function(v25) --[[ Line: 148 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v26 = setmetatable({
        _valueToIndex = {}, 
        _indexToValue = {}, 
        _size = 0
    }, v0);
    if v25 then
        for _, v28 in v25 do
            v26:add(v28);
        end;
    end;
    return v26;
end;
return v0;