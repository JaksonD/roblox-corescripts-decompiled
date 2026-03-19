local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.types);
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Array.isArray);
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local function v13(v9, v10) --[[ Line: 35 ]] --[[ Name: inspect ]]
    -- upvalues: v4 (ref)
    local v11 = v10 or {
        depth = 2
    };
    local v12 = v11.depth or 2;
    v11.depth = if v12 >= 0 then v12 else 2;
    return v4(v9, {}, v11);
end;
local function _(v14, v15) --[[ Line: 42 ]] --[[ Name: isIndexKey ]]
    local v16 = false;
    if type(v14) == "number" then
        v16 = false;
        if v14 <= v15 then
            v16 = false;
            if v14 >= 1 then
                v16 = math.floor(v14) == v14;
            end;
        end;
    end;
    return v16;
end;
local function _(v18) --[[ Line: 49 ]] --[[ Name: getTableLength ]]
    local v19 = 1;
    local v20 = rawget(v18, v19);
    while v20 ~= nil do
        v19 = v19 + 1;
        v20 = rawget(v18, v19);
    end;
    return v19 - 1;
end;
local function v26(v22, v23) --[[ Line: 59 ]] --[[ Name: sortKeysForPrinting ]]
    local v24 = type(v22);
    local v25 = type(v23);
    if v24 == v25 and (v24 == "number" or v24 == "string") then
        return v22 < v23;
    else
        return v24 < v25;
    end;
end;
local function _(v27) --[[ Line: 72 ]] --[[ Name: rawpairs ]]
    return next, v27, nil;
end;
local function v38(v29) --[[ Line: 76 ]] --[[ Name: getFragmentedKeys ]]
    -- upvalues: v26 (copy)
    local v30 = {};
    local v31 = 0;
    local v32 = 1;
    local v33 = rawget(v29, v32);
    while v33 ~= nil do
        v32 = v32 + 1;
        v33 = rawget(v29, v32);
    end;
    local v34 = v32 - 1;
    for v35, _ in next, v29 do
        local v37 = false;
        if type(v35) == "number" then
            v37 = false;
            if v35 <= v34 then
                v37 = false;
                if v35 >= 1 then
                    v37 = math.floor(v35) == v35;
                end;
            end;
        end;
        if not v37 then
            v31 = v31 + 1;
            v30[v31] = v35;
        end;
    end;
    table.sort(v30, v26);
    return v30, v31, v34;
end;
v4 = function(v39, v40, v41) --[[ Line: 90 ]] --[[ Name: formatValue ]]
    -- upvalues: l_HttpService_0 (copy), v5 (ref)
    local v42 = typeof(v39);
    if v42 == "string" then
        return l_HttpService_0:JSONEncode(v39);
    elseif v42 == "number" then
        if v39 ~= v39 then
            return "NaN";
        elseif v39 == 1e999 then
            return "Infinity";
        elseif v39 == -1e999 then
            return "-Infinity";
        else
            return (tostring(v39));
        end;
    elseif v42 == "function" then
        local v43 = "[function";
        local v44 = debug.info(v39, "n");
        if v44 ~= nil and v44 ~= "" then
            v43 = v43 .. " " .. v44;
        end;
        return v43 .. "]";
    elseif v42 == "table" then
        return v5(v39, v40, v41);
    else
        return (tostring(v39));
    end;
end;
v5 = function(v45, v46, v47) --[[ Line: 123 ]] --[[ Name: formatObjectValue ]]
    -- upvalues: v4 (ref), v3 (copy), v6 (ref), v7 (ref)
    if table.find(v46, v45) ~= nil then
        return "[Circular]";
    else
        local v48 = {
            unpack(v46)
        };
        table.insert(v48, v45);
        if typeof(v45.toJSON) == "function" then
            local v49 = v45:toJSON(v45);
            if v49 ~= v45 then
                if typeof(v49) == "string" then
                    return v49;
                else
                    return v4(v49, v48, v47);
                end;
            end;
        elseif v3(v45) then
            return v6(v45, v48, v47);
        end;
        return v7(v45, v48, v47);
    end;
end;
v7 = function(v50, v51, v52) --[[ Line: 148 ]] --[[ Name: formatObject ]]
    -- upvalues: v38 (copy), v8 (ref), v4 (ref)
    local v53 = "";
    local v54 = getmetatable(v50);
    if v54 and rawget(v54, "__tostring") then
        return (tostring(v50));
    else
        local v55, v56, v57 = v38(v50);
        if v57 == 0 and v56 == 0 then
            return v53 .. "{}";
        elseif #v51 > v52.depth then
            return v53 .. "[" .. v8(v50) .. "]";
        else
            local v58 = {};
            for v59 = 1, v57 do
                table.insert(v58, (v4(v50[v59], v51, v52)));
            end;
            for v60 = 1, v56 do
                local v61 = v55[v60];
                table.insert(v58, v61 .. ": " .. v4(v50[v61], v51, v52));
            end;
            return v53 .. "{ " .. table.concat(v58, ", ") .. " }";
        end;
    end;
end;
v6 = function(v62, v63, v64) --[[ Line: 184 ]] --[[ Name: formatArray ]]
    -- upvalues: v4 (ref)
    local v65 = #v62;
    if v65 == 0 then
        return "[]";
    elseif #v63 > v64.depth then
        return "[Array]";
    else
        local v66 = math.min(10, v65);
        local v67 = v65 - v66;
        local v68 = {};
        for v69 = 1, v66 do
            v68[v69] = v4(v62[v69], v63, v64);
        end;
        if v67 == 1 then
            table.insert(v68, "... 1 more item");
        elseif v67 > 1 then
            table.insert(v68, ("... %s more items"):format((tostring(v67))));
        end;
        return "[" .. table.concat(v68, ", ") .. "]";
    end;
end;
v8 = function(_) --[[ Line: 210 ]] --[[ Name: getObjectTag ]]
    return "Object";
end;
return v13;