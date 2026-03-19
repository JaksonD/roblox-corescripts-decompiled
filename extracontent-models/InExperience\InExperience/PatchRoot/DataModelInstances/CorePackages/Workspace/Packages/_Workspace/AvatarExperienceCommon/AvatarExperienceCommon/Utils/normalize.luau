local function v2(v0, v1) --[[ Line: 3 ]] --[[ Name: normalizeType ]]
    if type(v0) == v1 then
        return v0;
    else
        return nil, (("Type %* required, got %*."):format(v1, (type(v0))));
    end;
end;
local function v7(v3) --[[ Line: 10 ]] --[[ Name: prepareValuesForError ]]
    local v4 = {};
    for _, v6 in v3 do
        table.insert(v4, (tostring(v6)));
    end;
    return table.concat(v4, ", ");
end;
local function v10(v8, v9) --[[ Line: 18 ]] --[[ Name: normalizeValue ]]
    -- upvalues: v7 (copy)
    if table.find(v9, v8) then
        return v8;
    else
        return nil, (("Expected value to be one of %*, got %*."):format(v7(v9), v8));
    end;
end;
local function v12(v11) --[[ Line: 25 ]] --[[ Name: normalizeBoolean ]]
    -- upvalues: v2 (copy)
    return v2(v11, "boolean");
end;
local function v14(v13) --[[ Line: 29 ]] --[[ Name: normalizeString ]]
    -- upvalues: v2 (copy)
    return v2(v13, "string");
end;
local function v16(v15) --[[ Line: 33 ]] --[[ Name: normalizeNumber ]]
    -- upvalues: v2 (copy)
    return v2(v15, "number");
end;
local function v29(v17, v18) --[[ Line: 37 ]] --[[ Name: normalizeTable ]]
    local v19 = {};
    if type(v17) == "table" then
        local v20 = {};
        for v21, v22 in v18 do
            local v23 = type(v22) == "table" and v22.required;
            local v24 = if type(v22) == "table" then v22.fn else v22;
            local v25 = v17[v21];
            if type(v25) ~= "nil" or v23 then
                local v26, v27 = v24(v25);
                if v27 then
                    table.insert(v19, (("%* normalization failed with: %*"):format(v21, v27)));
                end;
                if v27 and v23 then
                    return nil, table.concat(v19, " ");
                else
                    v20[v21] = v26;
                end;
            end;
        end;
        local v28 = nil;
        if next(v19) then
            v28 = table.concat(v19, " ");
        end;
        return v20, v28;
    else
        return nil, (("Type table required, got %*."):format((type(v17))));
    end;
end;
local function v39(v30, v31) --[[ Line: 85 ]] --[[ Name: normalizeList ]]
    if type(v30) == "table" then
        local v32 = {};
        local v33 = {};
        for v34, v35 in v30 do
            local v36, v37 = v31(v35);
            if v37 then
                table.insert(v32, (("%* normalization failed with: %*"):format(v34, v37)));
            end;
            if v36 then
                table.insert(v33, v36);
            end;
        end;
        local v38 = nil;
        if next(v32) then
            v38 = table.concat(v32, " ");
        end;
        return v33, v38;
    else
        return nil, (("Type table required, got %*."):format((type(v30))));
    end;
end;
local function v46(v40, v41) --[[ Line: 107 ]] --[[ Name: normalizeUnion ]]
    for _, v43 in v41 do
        local v44, _ = v43(v40);
        if v44 then
            return v44;
        end;
    end;
    return nil, "Value did not match any union.";
end;
return {
    normalizeType = v2, 
    normalizeValue = v10, 
    normalizeBoolean = v12, 
    normalizeString = v14, 
    normalizeNumber = v16, 
    normalizeTable = v29, 
    normalizeList = v39, 
    normalizeUnion = v46, 
    normalizeStringToBoolean = function(v47) --[[ Line: 118 ]] --[[ Name: normalizeStringToBoolean ]]
        if v47 then
            return v47 == "true";
        else
            return nil, "value is nil";
        end;
    end, 
    makeNormalizeTableFn = function(v48) --[[ Line: 125 ]] --[[ Name: makeNormalizeTableFn ]]
        -- upvalues: v29 (copy)
        return function(v49) --[[ Line: 128 ]]
            -- upvalues: v29 (ref), v48 (copy)
            return v29(v49, v48);
        end;
    end, 
    makeNormalizeListFn = function(v50) --[[ Line: 133 ]] --[[ Name: makeNormalizeListFn ]]
        -- upvalues: v39 (copy)
        return function(v51) --[[ Line: 134 ]]
            -- upvalues: v39 (ref), v50 (copy)
            return v39(v51, v50);
        end;
    end, 
    makeNormalizeUnionFn = function(v52) --[[ Line: 139 ]] --[[ Name: makeNormalizeUnionFn ]]
        -- upvalues: v46 (copy)
        return function(v53) --[[ Line: 140 ]]
            -- upvalues: v46 (ref), v52 (copy)
            return v46(v53, v52);
        end;
    end, 
    makeNormalizeValueFn = function(v54) --[[ Line: 145 ]] --[[ Name: makeNormalizeValueFn ]]
        -- upvalues: v10 (copy)
        return function(v55) --[[ Line: 146 ]]
            -- upvalues: v10 (ref), v54 (copy)
            return v10(v55, v54);
        end;
    end, 
    makeRequired = function(v56) --[[ Line: 151 ]] --[[ Name: makeRequired ]]
        return {
            fn = v56, 
            required = true
        };
    end, 
    normalizeNotEmptyString = function(v57) --[[ Line: 156 ]] --[[ Name: normalizeNotEmptyString ]]
        -- upvalues: v14 (copy)
        if v57 == nil or v57 == "" then
            return nil, nil;
        else
            return v14(v57);
        end;
    end
};