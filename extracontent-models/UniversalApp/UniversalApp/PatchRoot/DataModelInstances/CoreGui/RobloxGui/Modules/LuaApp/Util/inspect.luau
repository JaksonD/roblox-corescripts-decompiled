local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.isArray);
local v2 = require(script.Parent.objectKeys);
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local function _(v8, v9) --[[ Line: 17 ]] --[[ Name: find ]]
    for v10 = 1, #v8 do
        if v8[v10] == v9 then
            return v10;
        end;
    end;
    return nil;
end;
local function v13(v12) --[[ Line: 29 ]] --[[ Name: inspect ]]
    -- upvalues: v3 (ref)
    return v3(v12, {});
end;
v3 = function(v14, v15) --[[ Line: 33 ]] --[[ Name: formatValue ]]
    -- upvalues: l_HttpService_0 (copy), v4 (ref)
    local v16 = typeof(v14);
    if v16 == "string" then
        return l_HttpService_0:JSONEncode(v14);
    elseif v16 == "number" then
        if v14 ~= v14 then
            return "NaN";
        elseif v14 == 1e999 then
            return "Infinity";
        elseif v14 == -1e999 then
            return "-Infinity";
        else
            return (tostring(v14));
        end;
    elseif v16 == "function" then
        return "[function]";
    elseif v16 == "table" then
        return v4(v14, v15);
    else
        return (tostring(v14));
    end;
end;
v4 = function(v17, v18) --[[ Line: 56 ]] --[[ Name: formatObjectValue ]]
    -- upvalues: v3 (ref), v1 (copy), v5 (ref), v6 (ref)
    local v19 = false;
    local v20;
    for v21 = 1, #v18 do
        if v18[v21] == v17 then
            v20 = v21;
            v19 = true;
        end;
        if v19 then
            break;
        end;
    end;
    if not v19 then
        v20 = nil;
    end;
    v19 = false;
    if v20 ~= nil then
        return "[Circular]";
    else
        v20 = {
            unpack(v18)
        };
        table.insert(v20, v17);
        if typeof(v17.toJSON) == "function" then
            local v22 = v17:toJSON(v17);
            if v22 ~= v17 then
                if typeof(v22) == "string" then
                    return v22;
                else
                    return v3(v22, v20);
                end;
            end;
        elseif v1(v17) then
            return v5(v17, v20);
        end;
        return v6(v17, v20);
    end;
end;
v6 = function(v23, v24) --[[ Line: 81 ]] --[[ Name: formatObject ]]
    -- upvalues: v2 (copy), v7 (ref), v3 (ref)
    local v25 = v2(v23);
    if #v25 == 0 then
        return "{}";
    elseif #v24 > 3 then
        return "[" .. v7(v23) .. "]";
    else
        local v26 = {};
        for v27 = 1, #v25 do
            local v28 = v25[v27];
            v26[v27] = v28 .. ": " .. v3(v23[v28], v24);
        end;
        return "{ " .. table.concat(v26, ", ") .. " }";
    end;
end;
v5 = function(v29, v30) --[[ Line: 102 ]] --[[ Name: formatArray ]]
    -- upvalues: v3 (ref)
    local v31 = #v29;
    if v31 == 0 then
        return "[]";
    elseif #v30 > 3 then
        return "[Array]";
    else
        local v32 = math.min(3, v31);
        local v33 = v31 - v32;
        local v34 = {};
        for v35 = 1, v32 do
            v34[v35] = v3(v29[v35], v30);
        end;
        if v33 == 1 then
            table.insert(v34, "... 1 more item");
        elseif v33 > 1 then
            table.insert(v34, ("... %s more items"):format(v33));
        end;
        return "[" .. table.concat(v34, ", ") .. "]";
    end;
end;
v7 = function(_) --[[ Line: 128 ]] --[[ Name: getObjectTag ]]
    return "Object";
end;
return {
    inspect = v13
};