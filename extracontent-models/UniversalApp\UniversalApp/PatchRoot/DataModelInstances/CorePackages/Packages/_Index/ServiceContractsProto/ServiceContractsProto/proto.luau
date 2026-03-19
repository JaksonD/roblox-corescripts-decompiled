local v0 = require(script.base64);
local _ = require(script.message);
local _ = require(script.typeRegistry);
local v3 = {};
local function v11(v4, v5) --[[ Line: 21 ]] --[[ Name: readVarIntBytes ]]
    local v6 = 0;
    local v7 = 0;
    local v8 = 0;
    repeat
        local v9 = buffer.readu8(v4, v5);
        local v10 = bit32.band(v9, 127);
        v6 = bit32.bor(v6, (bit32.lshift(v10, v8)));
        v7 = bit32.bor(v7, (bit32.lshift(v10, v8 - 32)));
        v8 = v8 + 7;
        v5 = v5 + 1;
    until not bit32.btest(v9, 128);
    return v6, v7, v5;
end;
v3.readVarIntU64 = function(v12, v13) --[[ Line: 38 ]] --[[ Name: readVarIntU64 ]]
    -- upvalues: v11 (copy)
    local _ = nil;
    local _ = nil;
    local v16, v17, v18 = v11(v12, v13);
    return v17 * 4294967296 + v16, v18;
end;
v3.readVarIntU32 = function(v19, v20) --[[ Line: 45 ]] --[[ Name: readVarIntU32 ]]
    -- upvalues: v11 (copy)
    local v21 = nil;
    local v22 = nil;
    local v23, v24, v25 = v11(v19, v20);
    v21 = v23;
    v22 = v24;
    return v21, v25;
end;
v3.readVarIntI64 = function(v26, v27) --[[ Line: 52 ]] --[[ Name: readVarIntI64 ]]
    -- upvalues: v11 (copy)
    local v28 = nil;
    local v29 = nil;
    local v30, v31, v32 = v11(v26, v27);
    v28 = v30;
    v29 = v31;
    v27 = v32;
    if v29 < 2147483648 then
        return v29 * 4294967296 + v28, v27;
    else
        v28 = bit32.bnot(v28) + 1;
        v29 = bit32.bnot(v29);
        if v28 > 4294967295 then
            v28 = 0;
            v29 = v29 + 1;
        end;
        return -(v29 * 4294967296 + v28), v27;
    end;
end;
v3.readVarIntI32 = function(v33, v34) --[[ Line: 71 ]] --[[ Name: readVarIntI32 ]]
    -- upvalues: v11 (copy)
    local v35 = nil;
    local v36 = nil;
    local v37, v38, v39 = v11(v33, v34);
    v35 = v37;
    v36 = v38;
    v34 = v39;
    if v35 < 2147483648 then
        return v35, v34;
    else
        return v35 - 4294967296, v34;
    end;
end;
v3.readVarIntS64 = function(v40, v41) --[[ Line: 82 ]] --[[ Name: readVarIntS64 ]]
    -- upvalues: v11 (copy)
    local v42 = nil;
    local v43 = nil;
    local v44, v45, v46 = v11(v40, v41);
    v42 = v44;
    v43 = v45;
    v41 = v46;
    v44 = bit32.btest(v42, 1);
    if v44 then
        v42 = v42 + 1;
        if v42 > 4294967295 then
            v42 = 0;
            v43 = v43 + 1;
        end;
    end;
    if v43 > 4294967295 then
        return -9.223372036854776E18, v41;
    else
        v42 = bit32.bor(bit32.rshift(v42, 1), (bit32.lshift(bit32.band(v43, 1), 31)));
        v43 = bit32.rshift(v43, 1);
        if v44 then
            return -(v43 * 4294967296 + v42), v41;
        else
            return v43 * 4294967296 + v42, v41;
        end;
    end;
end;
v3.readVarIntS32 = function(v47, v48) --[[ Line: 113 ]] --[[ Name: readVarIntS32 ]]
    -- upvalues: v11 (copy)
    local v49 = nil;
    local v50 = nil;
    local v51, v52, v53 = v11(v47, v48);
    v49 = v51;
    v50 = v52;
    v48 = v53;
    if bit32.btest(v49, 1) then
        return -(v49 + 1) / 2, v48;
    else
        return v49 / 2, v48;
    end;
end;
v3.readVarInt = v3.readVarIntI64;
v3.readFloat = function(v54, v55) --[[ Line: 126 ]] --[[ Name: readFloat ]]
    return buffer.readf32(v54, v55), v55 + 4;
end;
v3.readDouble = function(v56, v57) --[[ Line: 130 ]] --[[ Name: readDouble ]]
    return buffer.readf64(v56, v57), v57 + 8;
end;
v3.readFixed32 = function(v58, v59) --[[ Line: 134 ]] --[[ Name: readFixed32 ]]
    return buffer.readu32(v58, v59), v59 + 4;
end;
v3.readSignedFixed32 = function(v60, v61) --[[ Line: 138 ]] --[[ Name: readSignedFixed32 ]]
    return buffer.readi32(v60, v61), v61 + 4;
end;
v3.readFixed64 = function(v62, v63) --[[ Line: 143 ]] --[[ Name: readFixed64 ]]
    return assert(tonumber(string.format("%08x", (buffer.readu32(v62, v63 + 4))) .. string.format("%08x", (buffer.readu32(v62, v63))), 16), "Couldn't parse created hex"), v63 + 8;
end;
v3.readSignedFixed64 = function(_, _) --[[ Line: 151 ]] --[[ Name: readSignedFixed64 ]]
    error("TODO: Read sfixed64");
end;
v3.readTag = function(v66, v67) --[[ Line: 155 ]] --[[ Name: readTag ]]
    -- upvalues: v3 (copy)
    local v68, v69 = v3.readVarInt(v66, v67);
    return bit32.rshift(v68, 3), bit32.band(v68, 7), v69;
end;
v3.readBuffer = function(v70, v71) --[[ Line: 160 ]] --[[ Name: readBuffer ]]
    -- upvalues: v3 (copy)
    local v72, v73 = v3.readVarInt(v70, v71);
    local v74 = buffer.create(v72);
    buffer.copy(v74, 0, v70, v73, v72);
    return v74, v73 + v72;
end;
local function v79(v75, v76, v77) --[[ Line: 167 ]] --[[ Name: reserveBuffer ]]
    if buffer.len(v75) - v76 < v77 then
        local v78 = buffer.create(3 ^ math.ceil((math.log(buffer.len(v75) + v77, 3))));
        buffer.copy(v78, 0, v75, 0, v76);
        return v78;
    else
        return v75;
    end;
end;
v3.wireTypes = {
    varint = 0, 
    i64 = 1, 
    lengthDelimited = 2, 
    sgroup = 3, 
    egroup = 4, 
    i32 = 5
};
v3.writeVarInt = function(v80, v81, v82) --[[ Line: 186 ]] --[[ Name: writeVarInt ]]
    -- upvalues: v79 (copy)
    if v82 >= 0 then
        repeat
            v80 = v79(v80, v81, 1);
            local v83 = v82 % 128;
            v82 = v82 // 128;
            buffer.writeu8(v80, v81, if v82 == 0 then v83 else v83 + 128);
            v81 = v81 + 1;
        until v82 == 0;
    else
        local v84 = -v82;
        local v85 = bit32.bnot(v84 // 4294967296);
        local v86 = bit32.bnot(v84 % 4294967296) + 1;
        if v86 == 4294967296 then
            v86 = 0;
            v85 = v85 + 1;
        end;
        v80 = v79(v80, v81, 10);
        buffer.writeu8(v80, v81, (bit32.bor(128, (bit32.band(v86, 127)))));
        buffer.writeu8(v80, v81 + 1, (bit32.bor(128, (bit32.band(bit32.rshift(v86, 7), 127)))));
        buffer.writeu8(v80, v81 + 2, (bit32.bor(128, (bit32.band(bit32.rshift(v86, 14), 127)))));
        buffer.writeu8(v80, v81 + 3, (bit32.bor(128, (bit32.band(bit32.rshift(v86, 21), 127)))));
        buffer.writeu8(v80, v81 + 4, (bit32.bor(128, bit32.lshift(bit32.band(v85, 7), 4), (bit32.rshift(v86, 28)))));
        buffer.writeu8(v80, v81 + 5, (bit32.bor(128, (bit32.band(bit32.rshift(v85, 3), 127)))));
        buffer.writeu8(v80, v81 + 6, (bit32.bor(128, (bit32.band(bit32.rshift(v85, 10), 127)))));
        buffer.writeu8(v80, v81 + 7, (bit32.bor(128, (bit32.band(bit32.rshift(v85, 17), 127)))));
        buffer.writeu8(v80, v81 + 8, (bit32.bor(128, (bit32.band(bit32.rshift(v85, 24), 127)))));
        buffer.writeu8(v80, v81 + 9, (bit32.rshift(v85, 31)));
        v81 = v81 + 10;
    end;
    return v80, v81;
end;
v3.writeVarIntZigZag = function(v87, v88, v89) --[[ Line: 225 ]] --[[ Name: writeVarIntZigZag ]]
    -- upvalues: v79 (copy)
    local v90 = v89 < 0;
    v89 = math.abs(v89);
    local v91 = v89 // 4294967296;
    local v92 = v89 % 4294967296;
    local v93 = bit32.extract(v92, 31);
    v92 = bit32.lshift(v92, 1);
    v91 = bit32.bor(bit32.lshift(v91, 1), v93);
    if v90 then
        v92 = v92 - 1;
        if v92 < 0 then
            v92 = 4294967295;
            v91 = v91 - 1;
        end;
    end;
    repeat
        v87 = v79(v87, v88, 1);
        local v94 = v92 % 128;
        v92 = bit32.bor(bit32.rshift(v92, 7), (bit32.lshift(bit32.band(v91, 127), 25)));
        v91 = bit32.rshift(v91, 7);
        local v95 = false;
        if v92 == 0 then
            v95 = v91 == 0;
        end;
        buffer.writeu8(v87, v88, if v95 then v94 else v94 + 128);
        v88 = v88 + 1;
    until v95;
    return v87, v88;
end;
v3.writeFloat = function(v96, v97, v98) --[[ Line: 259 ]] --[[ Name: writeFloat ]]
    -- upvalues: v79 (copy)
    v96 = v79(v96, v97, 4);
    buffer.writef32(v96, v97, v98);
    return v96, v97 + 4;
end;
v3.writeDouble = function(v99, v100, v101) --[[ Line: 265 ]] --[[ Name: writeDouble ]]
    -- upvalues: v79 (copy)
    v99 = v79(v99, v100, 8);
    buffer.writef64(v99, v100, v101);
    return v99, v100 + 8;
end;
v3.writeFixed32 = function(v102, v103, v104) --[[ Line: 271 ]] --[[ Name: writeFixed32 ]]
    -- upvalues: v79 (copy)
    v102 = v79(v102, v103, 4);
    buffer.writeu32(v102, v103, v104);
    return v102, v103 + 4;
end;
v3.writeSignedFixed32 = function(v105, v106, v107) --[[ Line: 277 ]] --[[ Name: writeSignedFixed32 ]]
    -- upvalues: v79 (copy)
    v105 = v79(v105, v106, 4);
    buffer.writei32(v105, v106, v107);
    return v105, v106 + 4;
end;
v3.writeFixed64 = function(v108, v109, v110) --[[ Line: 283 ]] --[[ Name: writeFixed64 ]]
    -- upvalues: v79 (copy)
    v108 = v79(v108, v109, 8);
    local v111 = string.format("%016x", v110);
    buffer.writeu32(v108, v109, (assert(tonumber(v111:sub(9, 16), 16), "Couldn't parse created hex")));
    buffer.writeu32(v108, v109 + 4, (assert(tonumber(v111:sub(1, 8), 16), "Couldn't parse created hex")));
    return v108, v109 + 8;
end;
v3.writeSignedFixed64 = function(_, _, _) --[[ Line: 294 ]] --[[ Name: writeSignedFixed64 ]]
    error("TODO: Write sfixed64");
end;
v3.writeTag = function(v115, v116, v117, v118) --[[ Line: 298 ]] --[[ Name: writeTag ]]
    -- upvalues: v3 (copy)
    return v3.writeVarInt(v115, v116, bit32.lshift(v117, 3) + v118);
end;
v3.writeBuffer = function(v119, v120, v121, v122) --[[ Line: 302 ]] --[[ Name: writeBuffer ]]
    -- upvalues: v3 (copy), v79 (copy)
    local v123, v124 = v3.writeVarInt(v119, v120, v122);
    v119 = v123;
    v120 = v124;
    v119 = v79(v119, v120, v122);
    buffer.copy(v119, v120, v121, 0, v122);
    return v119, v120 + v122;
end;
v3.writeString = function(v125, v126, v127) --[[ Line: 311 ]] --[[ Name: writeString ]]
    -- upvalues: v3 (copy)
    return v3.writeBuffer(v125, v126, buffer.fromstring(v127), #v127);
end;
v3.json = {};
v3.json.serializeNumber = function(v128) --[[ Line: 317 ]] --[[ Name: serializeNumber ]]
    if v128 == 1e999 then
        return "Infinity";
    elseif v128 == -1e999 then
        return "-Infinity";
    elseif v128 ~= v128 then
        return "NaN";
    else
        return v128;
    end;
end;
v3.json.deserializeNumber = function(v129) --[[ Line: 325 ]] --[[ Name: deserializeNumber ]]
    if v129 == "Infinity" then
        return 1e999;
    elseif v129 == "-Infinity" then
        return -1e999;
    elseif v129 == "NaN" then
        return (0/0);
    elseif typeof(v129) == "string" then
        local v130 = tonumber(v129);
        assert(v130 ~= nil, "Number given that could not be parsed");
        return v130;
    else
        return v129;
    end;
end;
v3.json.serializeBuffer = function(v131) --[[ Line: 341 ]] --[[ Name: serializeBuffer ]]
    -- upvalues: v0 (copy)
    return v0.encode(buffer.tostring(v131));
end;
v3.json.deserializeBuffer = function(v132) --[[ Line: 345 ]] --[[ Name: deserializeBuffer ]]
    -- upvalues: v0 (copy)
    return buffer.fromstring(v0.decode(v132));
end;
return v3;