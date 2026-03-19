local v0 = {};
local v1 = {};
local function _(v2) --[[ Line: 8 ]] --[[ Name: makeKeyString ]]
    if type(v2) == "string" then
        return string.format("%s", v2);
    else
        return string.format("[%s]", (tostring(v2)));
    end;
end;
local function v6(v4) --[[ Line: 16 ]] --[[ Name: makeValueString ]]
    local v5 = type(v4);
    if v5 == "string" then
        return string.format("%q", v4);
    elseif v5 == "function" or v5 == "table" then
        return string.format("<%s>", (tostring(v4)));
    else
        return string.format("%s", (tostring(v4)));
    end;
end;
local function v14(v7, v8, v9, v10) --[[ Line: 27 ]] --[[ Name: printKeypair ]]
    -- upvalues: v6 (copy)
    local v11 = if type(v7) == "string" then string.format("%s", v7) else string.format("[%s]", (tostring(v7)));
    local v12 = v6(v8);
    local v13 = if v10 then string.format(" -- %s", v10) else "";
    print(string.format("%s%s = %s,%s", v9, v11, v12, v13));
end;
v0.ShallowEqual = function(v15, v16, v17) --[[ Line: 39 ]] --[[ Name: ShallowEqual ]]
    -- upvalues: v1 (copy)
    if not v15 or not v16 then
        return false;
    elseif v15 == v16 then
        return true;
    else
        if not v17 then
            v17 = v1;
        end;
        for v18, v19 in v15 do
            if v16[v18] ~= v19 and not v17[v18] then
                return false;
            end;
        end;
        for v20, v21 in v16 do
            if v15[v20] ~= v21 and not v17[v20] then
                return false;
            end;
        end;
        return true;
    end;
end;
local function v24(v22, v23) --[[ Line: 64 ]] --[[ Name: formatDeepEqualMessage ]]
    if v23 ~= 0 then
        return v22;
    else
        return v22:gsub("{1}", "first"):gsub("{2}", "second");
    end;
end;
v0.DeepEqual = function(v25, v26, v27) --[[ Line: 75 ]] --[[ Name: DeepEqual ]]
    -- upvalues: v24 (copy), v0 (copy)
    v27 = v27 or 0;
    if v25 == v26 then
        return true;
    elseif typeof(v25) ~= typeof(v26) then
        local v28 = ("{1} is of type %s, but {2} is of type %s"):format(typeof(v25), (typeof(v26)));
        return false, v24(v28, v27);
    elseif typeof(v25) == "table" then
        local v29 = {};
        for v30, v31 in v25 do
            v29[v30] = true;
            local v32, v33 = v0.DeepEqual(v31, v26[v30], v27 + 1);
            if not v32 then
                local v34 = v33:gsub("{1}", ("{1}[%s]"):format((tostring(v30)))):gsub("{2}", ("{2}[%s]"):format((tostring(v30))));
                return false, v24(v34, v27);
            end;
        end;
        for v35, v36 in v26 do
            if not v29[v35] then
                local v37, v38 = v0.DeepEqual(v25[v35], v36, v27 + 1);
                if not v37 then
                    local v39 = v38:gsub("{1}", ("{1}[%s]"):format((tostring(v35)))):gsub("{2}", ("{2}[%s]"):format((tostring(v35))));
                    return false, v24(v39, v27);
                end;
            end;
        end;
        return true;
    else
        return false, v24("{1} ~= {2}", v27);
    end;
end;
v0.EqualKey = function(v40, v41, v42) --[[ Line: 127 ]] --[[ Name: EqualKey ]]
    if v40 and v41 and v42 and v42 ~= "" and v40[v42] and v41[v42] and v40[v42] == v41[v42] then
        return true;
    else
        return false;
    end;
end;
v0.TableDifference = function(v43, v44) --[[ Line: 138 ]] --[[ Name: TableDifference ]]
    local v45 = {};
    for v46, v47 in v43 do
        if v44[v46] ~= v43[v46] then
            v45[v46] = v47;
        end;
    end;
    return v45;
end;
local function _(v48) --[[ Line: 155 ]] --[[ Name: membershipTable ]]
    local v49 = {};
    for v50 = 1, #v48 do
        v49[v48[v50]] = true;
    end;
    return v49;
end;
local _ = function(v52) --[[ Line: 166 ]] --[[ Name: listOfKeys ]]
    local v53 = {};
    for v54, _ in v52 do
        table.insert(v53, v54);
    end;
    return v53;
end;
v0.ListDifference = function(v57, v58) --[[ Line: 178 ]] --[[ Name: ListDifference ]]
    -- upvalues: v0 (copy)
    local l_TableDifference_0 = v0.TableDifference;
    local v60 = {};
    for v61 = 1, #v57 do
        v60[v57[v61]] = true;
    end;
    local l_v60_0 = v60;
    local v63 = {};
    for v64 = 1, #v58 do
        v63[v58[v64]] = true;
    end;
    l_TableDifference_0 = l_TableDifference_0(l_v60_0, v63);
    l_v60_0 = {};
    for v65, _ in l_TableDifference_0 do
        table.insert(l_v60_0, v65);
    end;
    return l_v60_0;
end;
v0.CheckListConsistency = function(v67) --[[ Line: 188 ]] --[[ Name: CheckListConsistency ]]
    local v68 = false;
    local v69 = false;
    local v70 = true;
    local v71 = 1;
    for v72, _ in v67 do
        if type(v72) == "string" then
            v69 = true;
        elseif type(v72) == "number" then
            if v71 ~= v72 then
                v70 = false;
            end;
            v68 = true;
        else
            return false;
        end;
        if v69 and v68 then
            return false;
        else
            v71 = v71 + 1;
        end;
    end;
    if v68 then
        return v70;
    else
        return true;
    end;
end;
v0.RecursiveToString = function(v74, v75) --[[ Line: 223 ]] --[[ Name: RecursiveToString ]]
    -- upvalues: v0 (copy)
    v75 = v75 or "";
    if type(v74) == "table" then
        local v76 = "";
        if not v0.CheckListConsistency(v74) then
            v76 = v76 .. "-- WARNING: this table fails the list consistency test\n";
        end;
        v76 = v76 .. "{\n";
        for v77, v78 in v74 do
            if type(v77) == "string" then
                v76 = v76 .. "  " .. v75 .. tostring(v77) .. " = " .. v0.RecursiveToString(v78, "  " .. v75) .. ";\n";
            end;
            if type(v77) == "number" then
                v76 = v76 .. "  " .. v75 .. v0.RecursiveToString(v78, "  " .. v75) .. ",\n";
            end;
        end;
        return v76 .. v75 .. "}";
    else
        return (tostring(v74));
    end;
end;
v0.Print = function(v79, v80) --[[ Line: 257 ]] --[[ Name: Print ]]
    -- upvalues: v6 (copy), v14 (copy)
    v80 = v80 or "  ";
    if type(v79) ~= "table" then
        error("TableUtilities.Print must be passed a table", 2);
    end;
    local v81 = {};
    local function v82(v83, v84, v85) --[[ Line: 267 ]] --[[ Name: recurse ]]
        -- upvalues: v81 (copy), v80 (ref), v6 (ref), v14 (ref), v82 (copy)
        v81[v83] = true;
        local v86 = string.rep(v80, v85);
        local v87 = string.rep(v80, v85 + 1);
        if v84 then
            print(string.format("%s%s = %s {", v86, if type(v84) == "string" then string.format("%s", v84) else string.format("[%s]", (tostring(v84))), v6(v83)));
        else
            print(string.format("%s%s {", v86, v6(v83)));
        end;
        for v88, v89 in v83 do
            if type(v89) == "table" then
                if v81[v89] then
                    v14(v88, v89, v87, "Possible cycle");
                else
                    v82(v89, v88, v85 + 1);
                end;
            else
                v14(v88, v89, v87);
            end;
        end;
        print(string.format("%s}%s", v86, v85 > 0 and "," or ""));
    end;
    v82(v79, nil, 0);
end;
v0.FieldCount = function(v90) --[[ Line: 301 ]] --[[ Name: FieldCount ]]
    local v91 = 0;
    for _ in v90 do
        v91 = v91 + 1;
    end;
    return v91;
end;
return v0;