local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local _ = require(l_Parent_0.GraphQL);
local l_mergeDeep_0 = require(l_Parent_0.Utils).mergeDeep;
v5.extractExtensionsFromSchema = require(l_Parent_0.Utils).extractExtensionsFromSchema;
v5.mergeExtensions = function(v8) --[[ Line: 44 ]] --[[ Name: mergeExtensions ]]
    -- upvalues: l_mergeDeep_0 (copy)
    return l_mergeDeep_0(v8);
end;
local function v11(v9, v10) --[[ Line: 48 ]] --[[ Name: applyExtensionObject ]]
    -- upvalues: l_mergeDeep_0 (copy), l_Boolean_0 (copy)
    if not v9 then
        return;
    else
        v9.extensions = l_mergeDeep_0({
            l_Boolean_0.toJSBoolean(v9.extensions) and v9.extensions or {}, 
            l_Boolean_0.toJSBoolean(v10) and v10 or {}
        });
        return;
    end;
end;
v5.applyExtensions = function(v12, v13) --[[ Line: 69 ]] --[[ Name: applyExtensions ]]
    -- upvalues: v11 (copy), l_Object_0 (copy), l_Boolean_0 (copy), l_Array_0 (copy)
    v11(v12, v13.schemaExtensions);
    local l_entries_0 = l_Object_0.entries;
    local v15 = l_Boolean_0.toJSBoolean(v13.types) and v13.types or {};
    for _, v17 in l_entries_0(v15) do
        local v18 = v17[1];
        local v19 = v17[2];
        local v20 = v12:getType(v18);
        if l_Boolean_0.toJSBoolean(v20) then
            v11(v20, v19.extensions);
            if v19.type == "object" or v19.type == "interface" then
                for _, v22 in l_Object_0.entries(v19.fields) do
                    local v23 = v22[1];
                    local v24 = v22[2];
                    local v25 = v20:getFields():get(v23);
                    if l_Boolean_0.toJSBoolean(v25) then
                        v11(v25, v24.extensions);
                        for _, v27 in l_Object_0.entries(v24.arguments) do
                            local v28, v29 = table.unpack(v27, 1, 2);
                            v11(l_Array_0.find(v25.args, function(v30) --[[ Line: 107 ]]
                                -- upvalues: v28 (copy)
                                return v30.name == v28;
                            end), v29);
                        end;
                    end;
                end;
            elseif v19.type == "input" then
                for _, v32 in l_Object_0.entries(v19.fields) do
                    local v33, v34 = table.unpack(v32, 1, 2);
                    local v35 = v20:getFields():get(v33);
                    v11(v35, v34.extensions);
                end;
            elseif v19.type == "enum" then
                for _, v37 in l_Object_0.entries(v19.values) do
                    local v38, v39 = table.unpack(v37, 1, 2);
                    local v40 = v20:getValue(v38);
                    v11(v40, v39);
                end;
            end;
        end;
    end;
    return v12;
end;
return v5;