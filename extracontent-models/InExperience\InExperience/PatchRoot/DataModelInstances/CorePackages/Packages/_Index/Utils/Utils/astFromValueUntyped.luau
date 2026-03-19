local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local l_Kind_0 = require(l_Parent_0.GraphQL).Kind;
local l_Error_0 = v1.Error;
local l_Number_0 = v1.Number;
local l_Object_0 = v1.Object;
local v9 = require(l_Parent_0.LuauRegExp);
local v10 = nil;
local function _(v11) --[[ Line: 31 ]] --[[ Name: isFinite ]]
    -- upvalues: l_Number_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 32 ]]
        -- upvalues: v11 (copy), l_Number_0 (ref)
        local v12 = tonumber(v11);
        if l_Number_0.isNaN(v12) or v12 == 1e999 or v12 == -1e999 then
            return false;
        else
            return true;
        end;
    end);
    if not l_status_0 then
        return false;
    else
        return l_result_0;
    end;
end;
local function v16(v17) --[[ Line: 61 ]] --[[ Name: astFromValueUntyped ]]
    -- upvalues: l_Object_0 (copy), l_Kind_0 (copy), l_Boolean_0 (copy), l_Array_0 (copy), v16 (copy), l_Number_0 (copy), v10 (ref), l_Error_0 (copy)
    if v17 == l_Object_0.None then
        return {
            kind = l_Kind_0.NULL
        };
    elseif v17 == nil then
        return nil;
    elseif l_Boolean_0.toJSBoolean(l_Array_0.isArray(v17)) then
        local v18 = {};
        for _, v20 in v17 do
            local v21 = v16(v20);
            if v21 ~= nil then
                table.insert(v18, v21);
            end;
        end;
        return {
            kind = l_Kind_0.LIST, 
            values = v18
        };
    elseif typeof(v17) == "table" then
        local v22 = {};
        for v23 in v17 do
            local v24 = v17[tostring(v23)];
            local v25 = v16(v24);
            if l_Boolean_0.toJSBoolean(v25) then
                table.insert(v22, {
                    kind = l_Kind_0.OBJECT_FIELD, 
                    name = {
                        kind = l_Kind_0.NAME, 
                        value = v23
                    }, 
                    value = v25
                });
            end;
        end;
        return {
            kind = l_Kind_0.OBJECT, 
            fields = v22
        };
    elseif typeof(v17) == "boolean" then
        return {
            kind = l_Kind_0.BOOLEAN, 
            value = v17
        };
    else
        local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
        local v27 = false;
        if typeof(v17) == "number" then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 32 ]]
                -- upvalues: v17 (copy), l_Number_0 (ref)
                local v28 = tonumber(v17);
                if l_Number_0.isNaN(v28) or v28 == 1e999 or v28 == -1e999 then
                    return false;
                else
                    return true;
                end;
            end);
            v27 = not not l_status_1 and l_result_1;
        end;
        if l_toJSBoolean_0(v27) then
            l_toJSBoolean_0 = tostring(v17);
            if l_Boolean_0.toJSBoolean(v10:test(l_toJSBoolean_0)) then
                return {
                    kind = l_Kind_0.INT, 
                    value = l_toJSBoolean_0
                };
            else
                return {
                    kind = l_Kind_0.FLOAT, 
                    value = l_toJSBoolean_0
                };
            end;
        elseif typeof(v17) == "string" then
            return {
                kind = l_Kind_0.STRING, 
                value = v17
            };
        else
            error(l_Error_0.new(("Cannot convert value to AST: %s."):format((tostring(v17)))));
            return;
        end;
    end;
end;
v4.astFromValueUntyped = v16;
v10 = v9("^-?(?:0|[1-9][0-9]*)$");
return v4;