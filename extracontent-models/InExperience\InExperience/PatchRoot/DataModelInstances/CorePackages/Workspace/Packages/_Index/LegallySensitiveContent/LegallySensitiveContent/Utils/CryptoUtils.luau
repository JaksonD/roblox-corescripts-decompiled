local function v3(v0) --[[ Line: 10 ]] --[[ Name: textEncode ]]
    local v1 = {};
    for v2 = 1, #v0 do
        table.insert(v1, (string.byte(v0, v2)));
    end;
    return v1;
end;
local function _(v4, v5) --[[ Line: 29 ]] --[[ Name: imul32 ]]
    local v6 = bit32.rshift(v4, 16);
    local v7 = bit32.band(v4, 65535);
    local v8 = bit32.rshift(v5, 16);
    local v9 = bit32.band(v5, 65535);
    local v10 = v7 * v9;
    local v11 = v6 * v9 + v7 * v8;
    local v12 = v6 * v8;
    v10 = v10 + bit32.lshift(bit32.band(v11, 65535), 16);
    v12 = v12 + bit32.rshift(v11, 16);
    return (bit32.band(v10, 4294967295));
end;
return {
    textEncode = v3, 
    hashStringWithFnv1a32 = function(v14) --[[ Line: 50 ]] --[[ Name: hashStringWithFnv1a32 ]]
        local v15 = {};
        for v16 = 1, #v14 do
            table.insert(v15, (string.byte(v14, v16)));
        end;
        local l_v15_0 = v15;
        v15 = 2166136261;
        for _, v19 in ipairs(l_v15_0) do
            local v20 = bit32.bxor(v15, v19);
            local v21 = bit32.rshift(v20, 16);
            local v22 = bit32.band(v20, 65535);
            local v23 = v22 * 403;
            local v24 = v21 * 403 + v22 * 256;
            local v25 = v21 * 256;
            v23 = v23 + bit32.lshift(bit32.band(v24, 65535), 16);
            v25 = v25 + bit32.rshift(v24, 16);
            v15 = bit32.band(v23, 4294967295);
        end;
        return (string.format("%08x", v15));
    end
};