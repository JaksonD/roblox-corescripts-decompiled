local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_0.Parent.Parent;
local v4 = require(l_Parent_2.LuauPolyfill);
local l_Array_0 = v4.Array;
local l_Object_0 = v4.Object;
local v7 = require(l_Parent_1.luaUtils.null);
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local function v14(v13) --[[ Line: 33 ]] --[[ Name: inspect ]]
    -- upvalues: v8 (ref)
    return v8(v13, {});
end;
v8 = function(v15, v16) --[[ Line: 37 ]] --[[ Name: formatValue ]]
    -- upvalues: l_HttpService_0 (copy), v7 (copy), v9 (ref)
    local v17 = typeof(v15);
    if v17 == "string" then
        return l_HttpService_0:JSONEncode(v15);
    elseif v17 == "number" then
        if v15 ~= v15 then
            return "NaN";
        elseif v15 == 1e999 then
            return "Infinity";
        elseif v15 == -1e999 then
            return "-Infinity";
        else
            return (tostring(v15));
        end;
    elseif v17 == "function" then
        return "[function]";
    elseif v17 == "table" then
        if v15 == v7 then
            return "null";
        else
            return v9(v15, v16);
        end;
    else
        return (tostring(v15));
    end;
end;
v9 = function(v18, v19) --[[ Line: 65 ]] --[[ Name: formatObjectValue ]]
    -- upvalues: v8 (ref), l_Array_0 (copy), v10 (ref), v11 (ref)
    if table.find(v19, v18) ~= nil then
        return "[Circular]";
    else
        local v20 = {
            unpack(v19)
        };
        table.insert(v20, v18);
        if typeof(v18.toJSON) == "function" then
            local v21 = v18:toJSON(v18);
            if v21 ~= v18 then
                if typeof(v21) == "string" then
                    return v21;
                else
                    return v8(v21, v20);
                end;
            end;
        elseif l_Array_0.isArray(v18) then
            return v10(v18, v20);
        end;
        return v11(v18, v20);
    end;
end;
v11 = function(v22, v23) --[[ Line: 90 ]] --[[ Name: formatObject ]]
    -- upvalues: l_Object_0 (copy), v12 (ref), v8 (ref)
    local v24 = l_Object_0.keys(v22);
    if #v24 == 0 then
        return "{}";
    elseif #v23 > 2 then
        return "[" .. v12(v22) .. "]";
    else
        local v25 = {};
        for v26 = 1, #v24 do
            local v27 = v24[v26];
            v25[v26] = v27 .. ": " .. v8(v22[v27], v23);
        end;
        return "{ " .. table.concat(v25, ", ") .. " }";
    end;
end;
v10 = function(v28, v29) --[[ Line: 111 ]] --[[ Name: formatArray ]]
    -- upvalues: v8 (ref)
    local v30 = #v28;
    if v30 == 0 then
        return "[]";
    elseif #v29 > 2 then
        return "[Array]";
    else
        local v31 = math.min(10, v30);
        local v32 = v30 - v31;
        local v33 = {};
        for v34 = 1, v31 do
            v33[v34] = v8(v28[v34], v29);
        end;
        if v32 == 1 then
            table.insert(v33, "... 1 more item");
        elseif v32 > 1 then
            table.insert(v33, ("... %d more items"):format(v32));
        end;
        return "[" .. table.concat(v33, ", ") .. "]";
    end;
end;
v12 = function(_) --[[ Line: 137 ]] --[[ Name: getObjectTag ]]
    return "Object";
end;
return {
    inspect = v14
};