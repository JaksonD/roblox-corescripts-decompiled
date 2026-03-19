local v6 = {
    MakeEncoder = function(v0, v1, v2) --[[ Line: 8 ]] --[[ Name: MakeEncoder ]]
        local v3 = {};
        for v4, v5 in pairs({
            [0] = "A"; 
            "B", 
            "C", 
            "D", 
            "E", 
            "F", 
            "G", 
            "H", 
            "I", 
            "J", 
            "K", 
            "L", 
            "M", 
            "N", 
            "O", 
            "P", 
            "Q", 
            "R", 
            "S", 
            "T", 
            "U", 
            "V", 
            "W", 
            "X", 
            "Y", 
            "Z", 
            "a", 
            "b", 
            "c", 
            "d", 
            "e", 
            "f", 
            "g", 
            "h", 
            "i", 
            "j", 
            "k", 
            "l", 
            "m", 
            "n", 
            "o", 
            "p", 
            "q", 
            "r", 
            "s", 
            "t", 
            "u", 
            "v", 
            "w", 
            "x", 
            "y", 
            "z", 
            "0", 
            "1", 
            "2", 
            "3", 
            "4", 
            "5", 
            "6", 
            "7", 
            "8", 
            "9", 
            v0 or "+", 
            v1 or "/", 
            v2 or "="
        }) do
            v3[v4] = v5:byte();
        end;
        return v3;
    end
};
v6.MakeDecoder = function(v7, v8, v9) --[[ Line: 82 ]] --[[ Name: MakeDecoder ]]
    -- upvalues: v6 (copy)
    local v10 = {};
    for v11, v12 in pairs(v6.MakeEncoder(v7, v8, v9)) do
        v10[v12] = v11;
    end;
    return v10;
end;
local v13 = v6.MakeEncoder();
local v14 = v6.MakeDecoder();
local l_char_0 = string.char;
local l_concat_0 = table.concat;
local l_extract_0 = bit32.extract;
v6.Encode = function(v18, v19, v20) --[[ Line: 97 ]] --[[ Name: Encode ]]
    -- upvalues: v13 (copy), l_extract_0 (copy), l_char_0 (copy), l_concat_0 (copy)
    local v21 = v19 or v13;
    local v22 = {};
    local v23 = 1;
    local v24 = #v18;
    local v25 = v24 % 3;
    local v26 = {};
    for v27 = 1, v24 - v25, 3 do
        local v28, v29, v30 = v18:byte(v27, v27 + 2);
        local v31 = v28 * 65536 + v29 * 256 + v30;
        local v32 = nil;
        if v20 then
            v32 = v26[v31];
            if not v32 then
                v32 = l_char_0(v21[l_extract_0(v31, 18, 6)], v21[l_extract_0(v31, 12, 6)], v21[l_extract_0(v31, 6, 6)], v21[l_extract_0(v31, 0, 6)]);
                v26[v31] = v32;
            end;
        else
            v32 = l_char_0(v21[l_extract_0(v31, 18, 6)], v21[l_extract_0(v31, 12, 6)], v21[l_extract_0(v31, 6, 6)], v21[l_extract_0(v31, 0, 6)]);
        end;
        v22[v23] = v32;
        v23 = v23 + 1;
    end;
    if v25 == 2 then
        local v33, v34 = v18:byte(v24 - 1, v24);
        local v35 = v33 * 65536 + v34 * 256;
        v22[v23] = l_char_0(v21[l_extract_0(v35, 18, 6)], v21[l_extract_0(v35, 12, 6)], v21[l_extract_0(v35, 6, 6)], v21[64]);
    elseif v25 == 1 then
        local v36 = v18:byte(v24) * 65536;
        v22[v23] = l_char_0(v21[l_extract_0(v36, 18, 6)], v21[l_extract_0(v36, 12, 6)], v21[64], v21[64]);
    end;
    return l_concat_0(v22);
end;
v6.EncodeUrl = function(v37, v38) --[[ Line: 152 ]] --[[ Name: EncodeUrl ]]
    -- upvalues: v6 (copy)
    local v39 = v6.Encode(v37, nil, v38);
    return v6.ToUrlSafeBase64(v39);
end;
v6.Decode = function(v40, v41, v42) --[[ Line: 158 ]] --[[ Name: Decode ]]
    -- upvalues: v14 (copy), l_char_0 (copy), l_extract_0 (copy), l_concat_0 (copy)
    local v43 = v41 or v14;
    local v44 = nil;
    local v45 = nil;
    for v46, v47 in pairs(v43) do
        if v47 == 62 then
            v44 = v46;
        elseif v47 == 63 then
            v45 = v46;
        end;
    end;
    v40 = v40:gsub(("[^%%w%%%s%%%s%%=]"):format(l_char_0(v44), (l_char_0(v45))), "");
    local v48 = {};
    local v49 = {};
    local v50 = 1;
    local v51 = #v40;
    local v52 = v40:sub(-2) == "==" and 2 or v40:sub(-1) == "=" and 1 or 0;
    local v53 = 1;
    local v54 = if v52 > 0 then v51 - 4 else v51;
    for v55 = v53, v54, 4 do
        local v56, v57, v58, v59 = v40:byte(v55, v55 + 3);
        local v60 = nil;
        if v42 then
            local v61 = v56 * 16777216 + v57 * 65536 + v58 * 256 + v59;
            v60 = v48[v61];
            if not v60 then
                local v62 = v43[v56] * 262144 + v43[v57] * 4096 + v43[v58] * 64 + v43[v59];
                v60 = l_char_0(l_extract_0(v62, 16, 8), l_extract_0(v62, 8, 8), (l_extract_0(v62, 0, 8)));
                v48[v61] = v60;
            end;
        else
            local v63 = v43[v56] * 262144 + v43[v57] * 4096 + v43[v58] * 64 + v43[v59];
            v60 = l_char_0(l_extract_0(v63, 16, 8), l_extract_0(v63, 8, 8), (l_extract_0(v63, 0, 8)));
        end;
        v49[v50] = v60;
        v50 = v50 + 1;
    end;
    if v52 == 1 then
        local v64;
        v54, v64, v53 = v40:byte(v51 - 3, v51 - 1);
        local v65 = v43[v54] * 262144 + v43[v64] * 4096 + v43[v53] * 64;
        v49[v50] = l_char_0(l_extract_0(v65, 16, 8), (l_extract_0(v65, 8, 8)));
    elseif v52 == 2 then
        local v66;
        v54, v66 = v40:byte(v51 - 3, v51 - 2);
        v49[v50] = l_char_0((l_extract_0(v43[v54] * 262144 + v43[v66] * 4096, 16, 8)));
    end;
    return l_concat_0(v49);
end;
v6.DecodeUrl = function(v67, v68) --[[ Line: 213 ]] --[[ Name: DecodeUrl ]]
    -- upvalues: v6 (copy)
    local v69 = v6.FromUrlSafeBase64(v67);
    return v6.Decode(v69, nil, v68);
end;
v6.ToUrlSafeBase64 = function(v70) --[[ Line: 218 ]] --[[ Name: ToUrlSafeBase64 ]]
    v70 = string.gsub(v70, "+", "-");
    v70 = string.gsub(v70, "/", "_");
    return (string.gsub(v70, "=", ""));
end;
v6.FromUrlSafeBase64 = function(v71) --[[ Line: 225 ]] --[[ Name: FromUrlSafeBase64 ]]
    v71 = v71:gsub("[^%w%-_]", "");
    local v72 = (4 - #v71 % 4) % 4;
    v71 = v71 .. string.rep("=", v72);
    v71 = string.gsub(v71, "_", "/");
    return (string.gsub(v71, "-", "+"));
end;
return v6;