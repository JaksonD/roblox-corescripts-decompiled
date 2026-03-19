local v0 = game:DefineFastFlag("DebugLuaArgCheck", false);
local v1 = game:GetService("RunService"):IsStudio();
local v2 = {
    isEnabled = function() --[[ Line: 7 ]] --[[ Name: isEnabled ]]
        -- upvalues: v0 (copy), v1 (copy)
        return v0 or _G.__TESTEZ_RUNNING_TEST__ or v1;
    end
};
local function _(v3, v4) --[[ Line: 11 ]] --[[ Name: assert_ ]]
    -- upvalues: v2 (copy)
    if v2.isEnabled() then
        assert(v3, v4);
    end;
end;
local function v6() --[[ Line: 17 ]] --[[ Name: stubArgCheckFunction ]]
    return true;
end;
v2.wrap = function(v7) --[[ Line: 43 ]] --[[ Name: wrap ]]
    -- upvalues: v2 (copy), v6 (copy)
    if v2.isEnabled() then
        return v7;
    else
        return v6;
    end;
end;
v2.isNonNegativeNumber = function(v8, v9) --[[ Line: 47 ]] --[[ Name: isNonNegativeNumber ]]
    -- upvalues: v2 (copy)
    local v10 = false;
    if typeof(v8) == "number" then
        v10 = v8 >= 0;
    end;
    local v11 = string.format("expects %s to be a non-negative number!", v9);
    if v2.isEnabled() then
        assert(v10, v11);
    end;
    return v8;
end;
v2.isType = function(v12, v13, v14) --[[ Line: 54 ]] --[[ Name: isType ]]
    -- upvalues: v2 (copy)
    local v15 = typeof(v12) == v13;
    local v16 = string.format("expects %s to be a %s! it was: %s", v14, v13, (typeof(v12)));
    if v2.isEnabled() then
        assert(v15, v16);
    end;
    return v12;
end;
v2.isInTypes = function(v17, v18, v19) --[[ Line: 63 ]] --[[ Name: isInTypes ]]
    -- upvalues: v2 (copy)
    for _, v21 in ipairs(v18) do
        if typeof(v17) == v21 then
            return v17;
        end;
    end;
    local v22 = string.format("expects %s to be one of expectedTypes! it was: %s", v19, (typeof(v17)));
    if v2.isEnabled() then
        assert(false, v22);
    end;
    return v17;
end;
v2.isTypeOrNil = function(v23, v24, v25) --[[ Line: 75 ]] --[[ Name: isTypeOrNil ]]
    -- upvalues: v2 (copy)
    local v26 = true;
    if v23 ~= nil then
        v26 = typeof(v23) == v24;
    end;
    local v27 = string.format("expects %s to be a %s! it was: %s", v25, v24, (typeof(v23)));
    if v2.isEnabled() then
        assert(v26, v27);
    end;
    return v23;
end;
v2.isNotNil = function(v28, v29) --[[ Line: 84 ]] --[[ Name: isNotNil ]]
    -- upvalues: v2 (copy)
    local v30 = v28 ~= nil;
    local v31 = string.format("expects %s to be not nil!", v29);
    if v2.isEnabled() then
        assert(v30, v31);
    end;
    return v28;
end;
v2.isNonEmptyString = function(v32, v33) --[[ Line: 90 ]] --[[ Name: isNonEmptyString ]]
    -- upvalues: v2 (copy)
    local v34 = false;
    if typeof(v32) == "string" then
        v34 = v32 ~= "";
    end;
    local v35 = string.format("expects %s to be a non-empty string!", v33);
    if v2.isEnabled() then
        assert(v34, v35);
    end;
    return v32;
end;
v2.isEqual = function(v36, v37, v38) --[[ Line: 96 ]] --[[ Name: isEqual ]]
    -- upvalues: v2 (copy)
    local v39 = v36 == v37;
    local v40 = string.format("expects %s to equal %s! it was: %s", v38, tostring(v37), (tostring(v36)));
    if v2.isEnabled() then
        assert(v39, v40);
    end;
    return v36;
end;
v2.representsInteger = function(v41, v42) --[[ Line: 106 ]] --[[ Name: representsInteger ]]
    -- upvalues: v2 (copy)
    local v43 = tonumber(v41);
    local v44 = v43 ~= nil;
    local v45 = string.format("expects %s to represent a number!", v42);
    if v2.isEnabled() then
        assert(v44, v45);
    end;
    v44 = v43 % 1 == 0;
    v45 = string.format("expects %s to represent an integer!", v42);
    if v2.isEnabled() then
        assert(v44, v45);
    end;
    return v41;
end;
v2.matchesInterface = function(v46, v47, v48, v49) --[[ Line: 137 ]] --[[ Name: matchesInterface ]]
    -- upvalues: v2 (copy)
    if v2.isEnabled() then
        local v50 = {
            integer = v2.representsInteger, 
            nonEmptyString = v2.isNonEmptyString
        };
        if type(v47) == "string" then
            if v49 and v49[v47] then
                v2.matchesInterface(v46, v49[v47], v48, v49);
                return v46;
            else
                local v51 = v50[v47];
                if type(v51) == "function" then
                    v51(v46, v48);
                    return v46;
                else
                    v2.isType(v46, v47, v48);
                    return v46;
                end;
            end;
        else
            v2.isType(v46, "table", v48);
            if v47[1] ~= nil then
                for v52, v53 in ipairs(v46) do
                    v2.matchesInterface(v53, v47[1], v48 .. "[" .. v52 .. "]", v49);
                end;
                return v46;
            else
                for v54, v55 in pairs(v47) do
                    if string.sub(v54, 1, 1) ~= "_" then
                        local v56 = v48 .. "." .. v54;
                        local v57 = v46[v54];
                        if v47._required and v47._required[v54] or v57 ~= nil then
                            v2.matchesInterface(v57, v55, v56, v49);
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v46;
end;
v2.assert = function(...) --[[ Line: 179 ]] --[[ Name: assert ]]
    -- upvalues: v2 (copy)
    local v58, v59 = ...;
    if v2.isEnabled() then
        assert(v58, v59);
    end;
end;
return v2;