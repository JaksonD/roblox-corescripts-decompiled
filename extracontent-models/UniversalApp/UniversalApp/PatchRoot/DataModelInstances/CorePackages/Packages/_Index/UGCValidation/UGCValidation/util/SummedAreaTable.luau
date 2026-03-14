local v0 = {};
v0.__index = v0;
v0.ReadPixel = function(v1, v2, v3) --[[ Line: 21 ]] --[[ Name: ReadPixel ]]
    if v1.size.X <= v2 or v1.size.Y <= v3 or v2 < 0 or v3 < 0 then
        return Color3.fromRGB(0, 0, 0);
    else
        local v4 = (v2 + v3 * v1.size.X) * 4;
        return Color3.fromRGB(buffer.readu8(v1.buffer, v4), buffer.readu8(v1.buffer, v4 + 1), (buffer.readu8(v1.buffer, v4 + 2)));
    end;
end;
v0.new = function(v5) --[[ Line: 35 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v6 = setmetatable({}, v0);
    v6.buffer = v5:ReadPixelsBuffer(Vector2.new(0, 0), v5.Size);
    v6.size = v5.Size;
    return v6;
end;
local v7 = {};
v7.__index = v7;
v7.new = function(v8, v9) --[[ Line: 51 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    local v10 = setmetatable({}, v7);
    v10.size = v8;
    v10.calculateWeightFromColor3 = v9;
    v10.buffer = buffer.create(v8.X * v8.Y * 4);
    return v10;
end;
v7.ReadValue = function(v11, v12, v13) --[[ Line: 60 ]] --[[ Name: ReadValue ]]
    if v12 < 0 or v13 < 0 then
        return 0;
    else
        local v14 = math.min(v12, v11.size.X - 1) + math.min(v13, v11.size.Y - 1) * v11.size.X;
        return (buffer.readu32(v11.buffer, v14 * 4));
    end;
end;
v7.WriteValue = function(v15, v16, v17, v18) --[[ Line: 71 ]] --[[ Name: WriteValue ]]
    local v19 = false;
    if v16 < v15.size.X then
        v19 = false;
        if v17 < v15.size.Y then
            v19 = false;
            if v16 >= 0 then
                v19 = v17 >= 0;
            end;
        end;
    end;
    assert(v19);
    local v20 = v16 + v17 * v15.size.X;
    buffer.writeu32(v15.buffer, v20 * 4, v18);
end;
v7.BuildSummedAreaTable = function(v21, v22) --[[ Line: 78 ]] --[[ Name: BuildSummedAreaTable ]]
    -- upvalues: v0 (copy)
    local v23 = v0.new(v22);
    assert(v23.size == v21.size);
    for v24 = 0, v21.size.Y - 1 do
        for v25 = 0, v21.size.X - 1 do
            local v26 = v21.calculateWeightFromColor3(v23:ReadPixel(v25, v24));
            local v27 = v21:ReadValue(v25 - 1, v24);
            local v28 = v21:ReadValue(v25, v24 - 1);
            local v29 = v21:ReadValue(v25 - 1, v24 - 1);
            v21:WriteValue(v25, v24, v26 + v27 + v28 - v29);
        end;
    end;
end;
v7.GetAreaDensity = function(v30, v31, v32) --[[ Line: 96 ]] --[[ Name: GetAreaDensity ]]
    local v33 = v31 - Vector2.one;
    local v34 = v31 + v32 - Vector2.one;
    local v35 = Vector2.new(v34.X, v33.Y);
    local v36 = Vector2.new(v33.X, v34.Y);
    return v30:ReadValue(v34.X, v34.Y) - v30:ReadValue(v35.X, v35.Y) - v30:ReadValue(v36.X, v36.Y) + v30:ReadValue(v33.X, v33.Y);
end;
v7.GetAreaDensityContinuous = function(v37, v38, v39) --[[ Line: 115 ]] --[[ Name: GetAreaDensityContinuous ]]
    local v40 = 0;
    local v41 = v38 + v39;
    local v42 = v38:Ceil();
    local v43 = v41:Floor();
    local v44 = v43 - v42;
    if v44.X > 0 and v44.Y > 0 then
        v40 = v40 + v37:GetAreaDensity(v42, v44);
    end;
    local v45 = v42 - v38;
    local v46 = v41 - v43;
    if v44.Y > 0 then
        local v47 = Vector2.new(1, v44.Y);
        if math.floor(v38.X) < math.floor(v41.X) then
            local v48 = v42 + Vector2.new(-1, 0);
            local l_X_0 = v45.X;
            v40 = v40 + v37:GetAreaDensity(v48, v47) * l_X_0;
            v48 = v42 + Vector2.new(v44.X, 0);
            l_X_0 = v46.X;
            v40 = v40 + v37:GetAreaDensity(v48, v47) * l_X_0;
        else
            local v50 = v41.X - v38.X;
            v40 = v40 + v37:GetAreaDensity(v42 + Vector2.new(-1, 0), v47) * v50;
        end;
    end;
    if v44.X > 0 then
        local v51 = Vector2.new(v44.X, 1);
        if math.floor(v38.Y) < math.floor(v41.Y) then
            local v52 = v42 + Vector2.new(0, -1);
            local l_Y_0 = v45.Y;
            v40 = v40 + v37:GetAreaDensity(v52, v51) * l_Y_0;
            v52 = v42 + Vector2.new(0, v44.Y);
            l_Y_0 = v46.Y;
            v40 = v40 + v37:GetAreaDensity(v52, v51) * l_Y_0;
        else
            local v54 = v41.Y - v38.Y;
            v40 = v40 + v37:GetAreaDensity(v42 + Vector2.new(0, -1), v51) * v54;
        end;
    end;
    local v55 = math.min(v42.X, v41.X) - v38.X;
    local v56 = math.min(v42.Y, v41.Y) - v38.Y;
    v40 = v40 + v37:GetAreaDensity(v38:Floor(), Vector2.new(1, 1)) * v55 * v56;
    if math.floor(v38.X) < math.floor(v41.X) then
        local l_X_1 = v46.X;
        v40 = v40 + v37:GetAreaDensity(Vector2.new(v41.X, v38.Y):Floor(), Vector2.new(1, 1)) * l_X_1 * v56;
        if math.floor(v38.Y) < math.floor(v41.Y) then
            v40 = v40 + v37:GetAreaDensity(v41:Floor(), Vector2.new(1, 1)) * v46.X * v46.Y;
        end;
    end;
    if math.floor(v38.Y) < math.floor(v41.Y) then
        local l_Y_1 = v46.Y;
        v40 = v40 + v37:GetAreaDensity(Vector2.new(v38.X, v41.Y):Floor(), Vector2.new(1, 1)) * v55 * l_Y_1;
    end;
    return v40;
end;
return v7;