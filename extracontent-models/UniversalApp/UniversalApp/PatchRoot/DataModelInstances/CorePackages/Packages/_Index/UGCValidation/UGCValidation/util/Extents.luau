local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = setmetatable({}, v0);
    v1.min = Vector3.new(1e999, 1e999, 1e999, 0);
    v1.max = Vector3.new(-1e999, -1e999, -1e999, 0);
    return v1;
end;
v0.fromMinMax = function(v2, v3) --[[ Line: 22 ]] --[[ Name: fromMinMax ]]
    -- upvalues: v0 (copy)
    local v4 = v0.new();
    local v5 = {
        X = v2.X, 
        Y = v2.Y, 
        Z = v2.Z
    };
    local v6 = {
        X = v3.X, 
        Y = v3.Y, 
        Z = v3.Z
    };
    for _, v8 in {
        "X", 
        "Y", 
        "Z"
    } do
        if v6[v8] ~= -1e999 and v5[v8] ~= 1e999 and v5[v8] > v6[v8] then
            local v9 = v5[v8];
            v5[v8] = v6[v8];
            v6[v8] = v9;
        end;
    end;
    v4.min = Vector3.new(v5.X, v5.Y, v5.Z);
    v4.max = Vector3.new(v6.X, v6.Y, v6.Z);
    return v4;
end;
v0.unionExtents = function(v10, v11) --[[ Line: 42 ]] --[[ Name: unionExtents ]]
    -- upvalues: v0 (copy)
    local v12 = v0.new();
    v12.min = v10.min:Min(v11.min);
    v12.max = v10.max:Max(v11.max);
    return v12;
end;
v0.intersectExtents = function(v13, v14) --[[ Line: 49 ]] --[[ Name: intersectExtents ]]
    -- upvalues: v0 (copy)
    local v15 = {
        X = 1e999, 
        Y = 1e999, 
        Z = 1e999
    };
    local v16 = {
        X = -1e999, 
        Y = -1e999, 
        Z = -1e999
    };
    for _, v18 in {
        "X", 
        "Y", 
        "Z"
    } do
        if v13.max[v18] >= v13.min[v18] and v14.max[v18] >= v14.min[v18] then
            local v19 = math.max(v13.min[v18], v14.min[v18]);
            local v20 = math.min(v13.max[v18], v14.max[v18]);
            if v19 <= v20 then
                v15[v18] = v19;
                v16[v18] = v20;
            end;
        end;
    end;
    local v21 = v0.new();
    v21.min = Vector3.new(v15.X, v15.Y, v15.Z);
    v21.max = Vector3.new(v16.X, v16.Y, v16.Z);
    return v21;
end;
v0.expandToInclude = function(v22, v23) --[[ Line: 72 ]] --[[ Name: expandToInclude ]]
    -- upvalues: v0 (copy)
    local v24 = v0.new();
    v24.min = v22.min:Min(v23);
    v24.max = v22.max:Max(v23);
    return v24;
end;
v0.isValid = function(v25) --[[ Line: 79 ]] --[[ Name: isValid ]]
    for _, v27 in {
        "X", 
        "Y", 
        "Z"
    } do
        if v25.max[v27] < v25.min[v27] then
            return false;
        end;
    end;
    return true;
end;
v0.size = function(v28) --[[ Line: 88 ]] --[[ Name: size ]]
    if v28:isValid() then
        return v28.max - v28.min;
    else
        return nil;
    end;
end;
v0.center = function(v29) --[[ Line: 95 ]] --[[ Name: center ]]
    if v29:isValid() then
        return (v29.max + v29.min) / 2;
    else
        return nil;
    end;
end;
return v0;