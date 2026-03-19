--!native
local v0 = {};
local v1 = {};
for v2 = 1, 64 do
    local v3 = v2 - 1;
    local v4 = string.byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v2);
    v0[v3] = v4;
    v1[v4] = v3;
end;
v1[61] = 0;
local function v8(v5) --[[ Line: 46 ]] --[[ Name: buildStringFromCodes ]]
    local v6 = {};
    for v7 = 1, #v5, 4096 do
        table.insert(v6, (string.char(unpack(v5, v7, (math.min(v7 + 4096 - 1, #v5))))));
    end;
    return table.concat(v6, "");
end;
return {
    encode = function(v9) --[[ Line: 56 ]] --[[ Name: encode ]]
        -- upvalues: v0 (copy), v8 (copy)
        local v10 = #v9;
        local v11 = math.ceil(v10 / 3) * 4;
        local v12 = v10 % 3;
        if v12 == 0 then
            v9 = v9 .. string.char(0);
        end;
        local v13 = table.create(v11, 0);
        local v14 = 0;
        local v15 = v11 / 4;
        local v16 = v12 == 0 and 1 or 2;
        for v17 = v14, v15 - v16 do
            v15 = v17 * 3 + 1;
            v16 = v17 * 4 + 1;
            local v18 = bit32.rshift(string.unpack(">J", v9, v15), 8);
            v13[v16] = v0[bit32.rshift(v18, 18)];
            v13[v16 + 1] = v0[bit32.band(bit32.rshift(v18, 12), 63)];
            v13[v16 + 2] = v0[bit32.band(bit32.rshift(v18, 6), 63)];
            v13[v16 + 3] = v0[bit32.band(v18, 63)];
        end;
        if v12 == 1 then
            local v19 = string.byte(v9, v10);
            v13[v11 - 3] = v0[bit32.rshift(v19, 2)];
            v13[v11 - 2] = v0[bit32.band(bit32.lshift(v19, 4), 63)];
            v13[v11 - 1] = 61;
            v13[v11] = 61;
        elseif v12 == 2 then
            local v20 = string.unpack(">H", v9, v10 - 1);
            v13[v11 - 3] = v0[bit32.rshift(v20, 10)];
            v13[v11 - 2] = v0[bit32.band(bit32.rshift(v20, 4), 63)];
            v13[v11 - 1] = v0[bit32.band(bit32.lshift(v20, 2), 63)];
            v13[v11] = 61;
        end;
        return v8(v13);
    end, 
    decode = function(v21) --[[ Line: 102 ]] --[[ Name: decode ]]
        -- upvalues: v1 (copy), v8 (copy)
        local v22 = #v21;
        local v23 = math.ceil(v22 / 4) * 3;
        local v24 = 0;
        if string.byte(v21, v22 - 1) == 61 then
            v24 = 2;
        elseif string.byte(v21, v22) == 61 then
            v24 = 1;
        end;
        local v25 = table.create(v23 - v24, 0);
        for v26 = 0, v23 / 3 - 1 do
            local v27 = v26 * 4 + 1;
            local v28 = v26 * 3 + 1;
            local v29, v30, v31, v32 = string.byte(v21, v27, v27 + 3);
            local v33 = bit32.bor(bit32.lshift(v1[v29], 18), bit32.lshift(v1[v30], 12), bit32.lshift(v1[v31], 6), v1[v32]);
            v25[v28] = bit32.rshift(v33, 16);
            v25[v28 + 1] = bit32.band(bit32.rshift(v33, 8), 255);
            v25[v28 + 2] = bit32.band(v33, 255);
        end;
        if v24 >= 1 then
            v25[v23] = nil;
            if v24 >= 2 then
                v25[v23 - 1] = nil;
            end;
        end;
        return v8(v25);
    end
};