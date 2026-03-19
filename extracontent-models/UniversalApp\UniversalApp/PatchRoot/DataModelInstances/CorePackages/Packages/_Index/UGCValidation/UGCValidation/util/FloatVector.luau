local v0 = {};
v0.new = function(...) --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = setmetatable({}, v0);
    v1.data = {};
    local v2 = {
        ...
    };
    if #v2 == 1 and typeof(v2[1]) == "table" then
        v2 = if getmetatable(v2[1]) == v0 then v2[1].data else v2[1];
    end;
    for _, v4 in v2 do
        if typeof(v4) ~= "number" then
            error("arg to FloatVector.new() not a number");
        else
            table.insert(v1.data, v4);
        end;
    end;
    return v1;
end;
v0.getSize = function(v5) --[[ Line: 37 ]] --[[ Name: getSize ]]
    return #v5.data;
end;
v0.checkCompatible = function(v6, v7) --[[ Line: 41 ]] --[[ Name: checkCompatible ]]
    -- upvalues: v0 (copy)
    if typeof(v6) ~= typeof(v0) or typeof(v7) ~= typeof(v0) then
        error("vector operation on non-vector type");
        return false;
    elseif #v6.data ~= #v7.data then
        error("operating on vectors of different dimension");
        return false;
    else
        return true;
    end;
end;
v0.__index = function(v8, v9) --[[ Line: 54 ]] --[[ Name: __index ]]
    -- upvalues: v0 (copy)
    if typeof(v9) == "number" then
        return v8.data[v9];
    else
        return v0[v9];
    end;
end;
v0.__newindex = function(v10, v11, v12) --[[ Line: 62 ]] --[[ Name: __newindex ]]
    if typeof(v11) == "number" then
        v10.data[v11] = v12;
        return;
    else
        rawset(v10, v11, v12);
        return;
    end;
end;
v0.__add = function(v13, v14) --[[ Line: 71 ]] --[[ Name: __add ]]
    -- upvalues: v0 (copy)
    v0.checkCompatible(v13, v14);
    local v15 = {};
    for v16 = 1, #v13.data do
        table.insert(v15, v13.data[v16] + v14.data[v16]);
    end;
    return v0.new(v15);
end;
v0.__sub = function(v17, v18) --[[ Line: 80 ]] --[[ Name: __sub ]]
    -- upvalues: v0 (copy)
    v0.checkCompatible(v17, v18);
    local v19 = {};
    for v20 = 1, #v17.data do
        table.insert(v19, v17.data[v20] - v18.data[v20]);
    end;
    return v0.new(v19);
end;
v0.__mul = function(v21, v22) --[[ Line: 89 ]] --[[ Name: __mul ]]
    -- upvalues: v0 (copy)
    if typeof(v21) == typeof(v0) and typeof(v22) == "number" then
        local v23 = {};
        for _, v25 in v21.data do
            table.insert(v23, v25 * v22);
        end;
        return v0.new(v23);
    else
        v0.checkCompatible(v21, v22);
        local v26 = {};
        for v27 = 1, #v21.data do
            table.insert(v26, v21.data[v27] * v22.data[v27]);
        end;
        return v0.new(v26);
    end;
end;
v0.__div = function(v28, v29) --[[ Line: 106 ]] --[[ Name: __div ]]
    -- upvalues: v0 (copy)
    if typeof(v28) == typeof(v0) and typeof(v29) == "number" then
        local v30 = {};
        for _, v32 in v28.data do
            table.insert(v30, v32 / v29);
        end;
        return v0.new(v30);
    else
        v0.checkCompatible(v28, v29);
        local v33 = {};
        for v34 = 1, #v28.data do
            table.insert(v33, v28.data[v34] / v29.data[v34]);
        end;
        return v0.new(v33);
    end;
end;
v0.dot = function(v35, v36) --[[ Line: 123 ]] --[[ Name: dot ]]
    -- upvalues: v0 (copy)
    v0.checkCompatible(v35, v36);
    local v37 = 0;
    for v38 = 1, #v35.data do
        v37 = v37 + v35.data[v38] * v36.data[v38];
    end;
    return v37;
end;
v0.cross = function(v39, v40) --[[ Line: 133 ]] --[[ Name: cross ]]
    -- upvalues: v0 (copy)
    v0.checkCompatible(v39, v40);
    if #v39.data ~= 3 or #v40.data ~= 3 then
        error("cross product is only defined for two 3 dimensional vectors");
        return nil;
    else
        return v0.new(v39.data[2] * v40.data[3] - v39.data[3] * v40.data[2], v39.data[3] * v40.data[1] - v39.data[1] * v40.data[3], v39.data[1] * v40.data[2] - v39.data[2] * v40.data[1]);
    end;
end;
v0.magnitude = function(v41) --[[ Line: 146 ]] --[[ Name: magnitude ]]
    local v42 = 0;
    for _, v44 in v41.data do
        v42 = v42 + v44 ^ 2;
    end;
    return (math.sqrt(v42));
end;
v0.fuzzyEq = function(v45, v46, v47) --[[ Line: 154 ]] --[[ Name: fuzzyEq ]]
    -- upvalues: v0 (copy)
    if not v0.checkCompatible(v45, v46) then
        return false;
    else
        v47 = v47 or 1.0E-5;
        for v48 = 1, #v45.data do
            if v47 < math.abs(v45.data[v48] - v46.data[v48]) then
                return false;
            end;
        end;
        return true;
    end;
end;
return v0;