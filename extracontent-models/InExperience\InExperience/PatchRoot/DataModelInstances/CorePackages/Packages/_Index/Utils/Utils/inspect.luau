local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_instanceof_0 = v1.instanceof;
local l_Error_0 = v1.Error;
local v7 = {};
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local l_GraphQLError_0 = require(l_Parent_0.GraphQL).GraphQLError;
local l_isAggregateError_0 = require(script.Parent.AggregateError).isAggregateError;
v7.inspect = function(v16) --[[ Line: 40 ]] --[[ Name: inspect ]]
    -- upvalues: v8 (ref)
    return v8(v16, {});
end;
v8 = function(v17, v18) --[[ Line: 46 ]] --[[ Name: formatValue ]]
    -- upvalues: l_Boolean_0 (copy), v9 (ref)
    local v19 = typeof(v17);
    if v19 == "string" then
        return "\"" .. v17 .. "\"";
    elseif v19 == "function" then
        local v20 = debug.info(v17, "n");
        if l_Boolean_0.toJSBoolean(v20) then
            return (("[function %s]"):format(v20));
        else
            return "[function]";
        end;
    elseif v19 == "table" then
        return v9(v17, v18);
    else
        return (tostring(v17));
    end;
end;
local function v22(v21) --[[ Line: 75 ]] --[[ Name: formatError ]]
    -- upvalues: l_instanceof_0 (copy), l_GraphQLError_0 (copy)
    if l_instanceof_0(v21, l_GraphQLError_0) then
        return (tostring(v21));
    else
        return ("%s: %s;\n %s"):format(tostring(v21.name), tostring(v21.message), (tostring(v21.stack)));
    end;
end;
v9 = function(v23, v24) --[[ Line: 83 ]] --[[ Name: formatObjectValue ]]
    -- upvalues: l_instanceof_0 (copy), l_Error_0 (copy), l_isAggregateError_0 (copy), l_GraphQLError_0 (copy), v10 (ref), v22 (copy), l_Boolean_0 (copy), l_Array_0 (copy), v11 (ref), v8 (ref), v12 (ref)
    if v23 == nil then
        return "null";
    elseif l_instanceof_0(v23, l_Error_0) then
        if l_isAggregateError_0(v23) then
            return (if l_instanceof_0(v23, l_GraphQLError_0) then tostring(v23) else ("%s: %s;\n %s"):format(tostring(v23.name), tostring(v23.message), (tostring(v23.stack)))) .. "\n" .. v10(v23.errors, v24);
        else
            return v22(v23);
        end;
    elseif l_Boolean_0.toJSBoolean(l_Array_0.includes(v24, v23)) then
        return "[Circular]";
    else
        local v25 = l_Array_0.concat({}, v24, {
            v23
        });
        if l_Boolean_0.toJSBoolean(v11(v23)) then
            local v26 = v23:toJSON();
            if v26 ~= v23 then
                if typeof(v26) == "string" then
                    return v26;
                else
                    return (v8(v26, v25));
                end;
            end;
        elseif l_Boolean_0.toJSBoolean(l_Array_0.isArray(v23)) then
            return v10(v23, v25);
        end;
        return v12(v23, v25);
    end;
end;
v11 = function(v27) --[[ Line: 139 ]] --[[ Name: isJSONable ]]
    return typeof(v27.toJSON) == "function";
end;
v12 = function(v28, v29) --[[ Line: 147 ]] --[[ Name: formatObject ]]
    -- upvalues: l_Object_0 (copy), v13 (ref), l_Array_0 (copy), v8 (ref)
    local v30 = l_Object_0.entries(v28);
    if #v30 == 0 then
        return "{}";
    elseif #v29 > 3 then
        return "[" .. tostring(v13(v28)) .. "]";
    else
        local v34 = l_Array_0.map(v30, function(v31) --[[ Line: 165 ]]
            -- upvalues: v8 (ref), v29 (copy)
            local v32, v33 = table.unpack(v31, 1, 2);
            return tostring(v32) .. ": " .. tostring(v8(v33, v29));
        end);
        return "{ " .. tostring(l_Array_0.join(v34, ", ")) .. " }";
    end;
end;
v10 = function(v35, v36) --[[ Line: 175 ]] --[[ Name: formatArray ]]
    -- upvalues: v8 (ref), l_Array_0 (copy)
    if #v35 == 0 then
        return "[]";
    elseif #v36 > 3 then
        return "[Array]";
    else
        local v37 = #v35;
        local v38 = #v35;
        local v39 = {};
        local v40 = 1;
        while v40 <= v37 do
            table.insert(v39, v8(v35[v40], v36));
            v40 = v40 + 1;
        end;
        if v38 == 1 then
            table.insert(v39, "... 1 more item");
        elseif v38 > 1 then
            table.insert(v39, ("... %s more items"):format((tostring(v38))));
        end;
        return "[" .. tostring(l_Array_0.join(v39, ", ")) .. "]";
    end;
end;
v13 = function(_) --[[ Line: 230 ]] --[[ Name: getObjectTag ]]
    return "Object";
end;
return v7;