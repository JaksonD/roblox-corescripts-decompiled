local v0 = {
    "-inf", 
    "-inf", 
    "inf", 
    "inf"
};
local v1 = {
    0, 
    0
};
local v2 = {
    0, 
    0, 
    0, 
    0
};
local function _(v3) --[[ Line: 20 ]] --[[ Name: roundToDecimalPrecision ]]
    if v3 >= 0 then
        return math.floor(v3 * 100000 + 0.5) / 100000;
    else
        return math.ceil(v3 * 100000 - 0.5) / 100000;
    end;
end;
local function v5(v6) --[[ Line: 28 ]] --[[ Name: applyNumericPrecision ]]
    -- upvalues: v5 (copy)
    if typeof(v6) == "number" then
        if v6 >= 0 then
            return math.floor(v6 * 100000 + 0.5) / 100000;
        else
            return math.ceil(v6 * 100000 - 0.5) / 100000;
        end;
    elseif typeof(v6) == "table" then
        local v7 = {};
        for v8, v9 in v6 do
            v7[v8] = v5(v9);
        end;
        return v7;
    else
        return v6;
    end;
end;
local function v14(v10) --[[ Line: 42 ]] --[[ Name: toVectorCode ]]
    local v11 = #v10;
    if v11 ~= 2 and v11 ~= 4 then
        return nil;
    elseif v11 == 4 and v10[1] == "-inf" and v10[2] == "-inf" and v10[3] == "inf" and v10[4] == "inf" then
        return 0;
    else
        for _, v13 in v10 do
            if typeof(v13) ~= "number" or v13 ~= 0 then
                return nil;
            end;
        end;
        if v11 == 2 then
            return 1;
        else
            return 2;
        end;
    end;
end;
local function _(v15, v16) --[[ Line: 62 ]] --[[ Name: getSchemaName ]]
    local v17 = "s_";
    local v18 = typeof(v16);
    if v18 == "boolean" then
        v17 = "b_";
    end;
    if v18 == "number" then
        v17 = v16 % 1 == 0 and "i_" or "n_";
    end;
    if v18 == "table" then
        v17 = "v_";
    end;
    return v17 .. v15;
end;
local function v29(v20) --[[ Line: 83 ]] --[[ Name: compressPackedProperties ]]
    local v21 = 0;
    for v22, v23 in v20 do
        if v23 ~= "" then
            v21 = v22;
        end;
    end;
    if v21 == 0 then
        return "";
    else
        local v24 = {};
        local v25 = 1;
        while v25 <= v21 do
            if v20[v25] ~= "" then
                table.insert(v24, v20[v25]);
                v25 = v25 + 1;
            else
                local l_v25_0 = v25;
                while l_v25_0 <= v21 and v20[l_v25_0] == "" do
                    l_v25_0 = l_v25_0 + 1;
                end;
                local v27 = l_v25_0 - v25;
                if v27 > 2 then
                    table.insert(v24, "-" .. tostring(v27));
                else
                    for _ = 1, v27 do
                        table.insert(v24, "");
                    end;
                end;
                v25 = l_v25_0;
            end;
        end;
        return table.concat(v24, ",");
    end;
end;
local function v47(v30) --[[ Line: 120 ]] --[[ Name: collectSchema ]]
    local v31 = {};
    local function v32(v33) --[[ Line: 123 ]] --[[ Name: collectProperties ]]
        -- upvalues: v31 (copy), v32 (copy)
        for v34, v35 in v33.Properties do
            if v35 ~= nil then
                local l_v31_0 = v31;
                local v37 = "s_";
                local v38 = typeof(v35);
                if v38 == "boolean" then
                    v37 = "b_";
                end;
                if v38 == "number" then
                    v37 = v35 % 1 == 0 and "i_" or "n_";
                end;
                if v38 == "table" then
                    v37 = "v_";
                end;
                l_v31_0[v37 .. v34] = true;
            end;
        end;
        for _, v40 in v33.Children do
            v32(v40);
        end;
    end;
    v32(v30);
    local v41 = {};
    for v42, _ in v31 do
        table.insert(v41, v42);
    end;
    table.sort(v41);
    local v44 = {};
    for v45, v46 in v41 do
        v44[v46] = v45;
    end;
    return v41, v44;
end;
return function(v48) --[[ Line: 151 ]] --[[ Name: compactDataModelPayload ]]
    -- upvalues: v47 (copy), v0 (copy), v1 (copy), v2 (copy), v14 (copy), v5 (copy), v29 (copy)
    local v49, v50 = v47(v48);
    local v51 = {};
    local v52 = {
        [0] = v0, 
        [1] = v1, 
        [2] = v2
    };
    local v53 = 3;
    local function v54(v55) --[[ Line: 162 ]] --[[ Name: serializeMappingValue ]]
        -- upvalues: v54 (copy)
        local v56 = typeof(v55);
        if v56 == "nil" then
            return "nil";
        elseif v56 == "boolean" then
            if v55 then
                return "b:1";
            else
                return "b:0";
            end;
        elseif v56 == "number" then
            return "n:" .. tostring(v55);
        elseif v56 == "string" then
            return "s:" .. v55;
        elseif v56 == "table" then
            local v57 = #v55;
            local v58 = table.create(v57);
            for v59 = 1, v57 do
                v58[v59] = v54(v55[v59]);
            end;
            local v60 = {};
            for v61, v62 in v55 do
                if typeof(v61) ~= "number" or v61 < 1 or v57 < v61 or v61 % 1 ~= 0 then
                    table.insert(v60, v54(v61) .. "=" .. v54(v62));
                end;
            end;
            table.sort(v60);
            return "t:[" .. table.concat(v58, ",") .. "]{" .. table.concat(v60, ",") .. "}";
        else
            return v56 .. ":" .. tostring(v55);
        end;
    end;
    local function v68(v63) --[[ Line: 191 ]] --[[ Name: mapValue ]]
        -- upvalues: v14 (ref), v54 (copy), v51 (copy), v52 (copy), v53 (ref)
        if typeof(v63) == "table" then
            local v64 = v14(v63);
            if v64 ~= nil then
                return v64;
            end;
        end;
        local v65 = v54(v63);
        local v66 = v51[v65];
        if v66 ~= nil then
            return v66;
        else
            while v52[v53] ~= nil do
                v53 = v53 + 1;
            end;
            local l_v53_0 = v53;
            v53 = v53 + 1;
            v51[v65] = l_v53_0;
            v52[l_v53_0] = v63;
            return l_v53_0;
        end;
    end;
    local function v76(v69) --[[ Line: 216 ]] --[[ Name: encodeProperties ]]
        -- upvalues: v49 (copy), v50 (copy), v68 (copy), v5 (ref), v29 (ref)
        local v70 = {};
        for v71 = 1, #v49 do
            v70[v71] = "";
        end;
        for v72, v73 in v69 do
            if v73 ~= nil then
                local v74 = "s_";
                local v75 = typeof(v73);
                if v75 == "boolean" then
                    v74 = "b_";
                end;
                if v75 == "number" then
                    v74 = v73 % 1 == 0 and "i_" or "n_";
                end;
                if v75 == "table" then
                    v74 = "v_";
                end;
                v74 = v50[v74 .. v72];
                if v74 ~= nil then
                    v70[v74] = tostring((v68((v5(v73)))));
                end;
            end;
        end;
        return v29(v70);
    end;
    local v77 = {};
    local v78 = 1;
    local function v79(v80, v81) --[[ Line: 236 ]] --[[ Name: appendNode ]]
        -- upvalues: v78 (ref), v76 (copy), v77 (copy), v79 (copy)
        local l_v78_0 = v78;
        v78 = v78 + 1;
        local v83 = {
            id = l_v78_0, 
            parentId = v81, 
            p = v76(v80.Properties)
        };
        local v84 = ("%*,%*"):format(v83.id, v83.parentId);
        if v83.p ~= "" then
            v84 = v84 .. (",%*"):format(v83.p);
        end;
        table.insert(v77, v84);
        for _, v86 in v80.Children do
            v79(v86, l_v78_0);
        end;
    end;
    local v87 = v76(v48.Properties);
    local v88 = "0,-1";
    if v87 ~= "" then
        v88 = v88 .. (",%*"):format(v87);
    end;
    table.insert(v77, v88);
    for _, v90 in v48.Children do
        v79(v90, 0);
    end;
    return {
        mappings = v52, 
        root = table.concat(v77, "\n"), 
        schema = v49
    };
end;