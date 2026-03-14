local function v10(v0, v1) --[[ Line: 2 ]] --[[ Name: strict ]]
    local v2 = v1 or tostring(v0);
    return (setmetatable(v0, {
        __index = function(_, v4) --[[ Line: 6 ]] --[[ Name: __index ]]
            -- upvalues: v2 (copy)
            local v5 = ("%q (%s) is not a valid member of %s"):format(tostring(v4), typeof(v4), v2);
            error(v5, 2);
        end, 
        __newindex = function(_, v7, _) --[[ Line: 12 ]] --[[ Name: __newindex ]]
            -- upvalues: v2 (copy)
            local v9 = ("%q (%s) is not a valid member of %s"):format(tostring(v7), typeof(v7), v2);
            error(v9, 2);
        end
    }));
end;
local function v19(v11, v12, v13, v14, v15) --[[ Line: 20 ]] --[[ Name: addEnumValue ]]
    -- upvalues: v10 (copy)
    local v16 = typeof(v14) == "string";
    assert(v16, "Only string names are supported for enums!");
    if v16 then
        assert(v14 ~= "fromRawValue", "fromRawValue is reserved");
        assert(v14 ~= "isEnumValue", "isEnumValue is reserved");
        assert(v14 ~= "allValues", "allValues is reserved");
    end;
    assert(v11[v14] == nil, "Enum value names can only be used once!");
    assert(v12[v14] == nil, "Enum values can only be used once!");
    local v17 = newproxy(true);
    local v18 = getmetatable(v17);
    v18.__tostring = function() --[[ Line: 34 ]]
        -- upvalues: v13 (copy), v14 (copy)
        return ("%s.%s"):format(v13, v14);
    end;
    v18.__index = v10({
        rawValue = function() --[[ Line: 39 ]] --[[ Name: rawValue ]]
            -- upvalues: v15 (copy)
            return v15;
        end
    });
    v11[v14] = v17;
    v12[v15] = v17;
end;
return function(v20, v21) --[[ Line: 51 ]] --[[ Name: enumerate ]]
    -- upvalues: v19 (copy), v10 (copy)
    assert(typeof(v20) == "string", "Bad argument #1 - enums must be created using a string name!");
    assert(typeof(v21) == "table", "Bad argument #2 - enums must be created using a table!");
    local v22 = {};
    local v23 = {};
    if v21[1] ~= nil then
        for _, v25 in ipairs(v21) do
            v19(v22, v23, v20, v25, v25);
        end;
    else
        for v26, v27 in pairs(v21) do
            v19(v22, v23, v20, v26, v27);
        end;
    end;
    v22.fromRawValue = function(v28) --[[ Line: 69 ]] --[[ Name: fromRawValue ]]
        -- upvalues: v23 (copy)
        return v23[v28];
    end;
    v22.isEnumValue = function(v29) --[[ Line: 73 ]] --[[ Name: isEnumValue ]]
        -- upvalues: v22 (copy)
        if typeof(v29) ~= "userdata" then
            return false;
        else
            for _, v31 in pairs(v22) do
                if v31 == v29 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    v22.allValues = function() --[[ Line: 87 ]] --[[ Name: allValues ]]
        -- upvalues: v23 (copy)
        local v32 = {};
        for _, v34 in pairs(v23) do
            table.insert(v32, v34);
        end;
        return v32;
    end;
    local v35 = newproxy(true);
    local v36 = getmetatable(v35);
    v36.__index = v10(v22, v20);
    v36.__tostring = function() --[[ Line: 100 ]]
        -- upvalues: v20 (copy)
        return v20;
    end;
    return v35;
end;