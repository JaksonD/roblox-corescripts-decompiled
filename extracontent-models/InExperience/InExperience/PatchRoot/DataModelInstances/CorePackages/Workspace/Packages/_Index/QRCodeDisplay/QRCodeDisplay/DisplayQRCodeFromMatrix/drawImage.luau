return function(v0, v1, v2, v3, v4) --[[ Line: 1 ]]
    local l_R_0 = v3.R;
    local l_G_0 = v3.G;
    local l_B_0 = v3.B;
    local v8 = 1 - v4;
    local v9 = buffer.create(v1 * v1 * 4);
    local v10 = 0;
    for v11 = 1, v1 do
        for v12 = 1, v1 do
            local v13 = math.floor((v12 - 1) / v1 * #v2) + 1;
            if v2[math.floor((v11 - 1) / v1 * #v2) + 1][v13] > 0 then
                buffer.writeu8(v9, v10, l_R_0 * 255);
                buffer.writeu8(v9, v10 + 1, l_G_0 * 255);
                buffer.writeu8(v9, v10 + 2, l_B_0 * 255);
                buffer.writeu8(v9, v10 + 3, v8 * 255);
            else
                buffer.writeu8(v9, v10, 255);
                buffer.writeu8(v9, v10 + 1, 255);
                buffer.writeu8(v9, v10 + 2, 255);
                buffer.writeu8(v9, v10 + 3, 0);
            end;
            v10 = v10 + 4;
        end;
    end;
    v0:WritePixelsBuffer(Vector2.new(0, 0), Vector2.new(v1, v1), v9);
    return v9;
end;