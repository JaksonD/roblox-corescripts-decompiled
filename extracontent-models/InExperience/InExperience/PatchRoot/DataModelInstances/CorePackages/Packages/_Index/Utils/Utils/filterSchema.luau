local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local v6 = require(l_Parent_0.GraphQL);
local l_GraphQLInputObjectType_0 = v6.GraphQLInputObjectType;
local l_GraphQLInterfaceType_0 = v6.GraphQLInterfaceType;
local l_GraphQLObjectType_0 = v6.GraphQLObjectType;
local l_MapperKind_0 = require(script.Parent.Interfaces).MapperKind;
local l_mapSchema_0 = require(script.Parent.mapSchema).mapSchema;
local _ = require(script.Parent.types);
local v13 = nil;
local v14 = nil;
v5.filterSchema = function(v15) --[[ Line: 64 ]] --[[ Name: filterSchema ]]
    -- upvalues: l_mapSchema_0 (copy), l_MapperKind_0 (copy), v13 (ref), l_Boolean_0 (copy), v14 (ref), l_GraphQLObjectType_0 (copy), l_Object_0 (copy), l_GraphQLInterfaceType_0 (copy), l_GraphQLInputObjectType_0 (copy)
    local l_schema_0 = v15.schema;
    local v17 = v15.typeFilter == nil and function(...) --[[ Line: 82 ]]
        return true;
    end or v15.typeFilter;
    local v18 = if v15.fieldFilter == nil then nil else v15.fieldFilter;
    local v19 = if v15.rootFieldFilter == nil then nil else v15.rootFieldFilter;
    local v20 = if v15.objectFieldFilter == nil then nil else v15.objectFieldFilter;
    local v21 = if v15.interfaceFieldFilter == nil then nil else v15.interfaceFieldFilter;
    local v22 = if v15.inputObjectFieldFilter == nil then nil else v15.inputObjectFieldFilter;
    local v23 = if v15.argumentFilter == nil then nil else v15.argumentFilter;
    return (l_mapSchema_0(l_schema_0, {
        [l_MapperKind_0.QUERY] = function(v24) --[[ Line: 100 ]]
            -- upvalues: v13 (ref), v19 (copy), v23 (copy)
            return v13(v24, "Query", v19, v23);
        end, 
        [l_MapperKind_0.MUTATION] = function(v25) --[[ Line: 106 ]]
            -- upvalues: v13 (ref), v19 (copy), v23 (copy)
            return v13(v25, "Mutation", v19, v23);
        end, 
        [l_MapperKind_0.SUBSCRIPTION] = function(v26) --[[ Line: 112 ]]
            -- upvalues: v13 (ref), v19 (copy), v23 (copy)
            return v13(v26, "Subscription", v19, v23);
        end, 
        [l_MapperKind_0.OBJECT_TYPE] = function(v27) --[[ Line: 118 ]]
            -- upvalues: l_Boolean_0 (ref), v17 (copy), v14 (ref), l_GraphQLObjectType_0 (ref), v20 (copy), v18 (copy), v23 (copy), l_Object_0 (ref)
            if l_Boolean_0.toJSBoolean(v17(v27.name, v27)) then
                return (v14(l_GraphQLObjectType_0, v27, l_Boolean_0.toJSBoolean(v20) and v20 or v18, v23));
            else
                return l_Object_0.None;
            end;
        end, 
        [l_MapperKind_0.INTERFACE_TYPE] = function(v28) --[[ Line: 134 ]]
            -- upvalues: l_Boolean_0 (ref), v17 (copy), v14 (ref), l_GraphQLInterfaceType_0 (ref), v21 (copy), v18 (copy), v23 (copy), l_Object_0 (ref)
            if l_Boolean_0.toJSBoolean(v17(v28.name, v28)) then
                return (v14(l_GraphQLInterfaceType_0, v28, l_Boolean_0.toJSBoolean(v21) and v21 or v18, v23));
            else
                return l_Object_0.None;
            end;
        end, 
        [l_MapperKind_0.INPUT_OBJECT_TYPE] = function(v29) --[[ Line: 150 ]]
            -- upvalues: l_Boolean_0 (ref), v17 (copy), v14 (ref), l_GraphQLInputObjectType_0 (ref), v22 (copy), v18 (copy), l_Object_0 (ref)
            if l_Boolean_0.toJSBoolean(v17(v29.name, v29)) then
                return (v14(l_GraphQLInputObjectType_0, v29, l_Boolean_0.toJSBoolean(v22) and v22 or v18));
            else
                return l_Object_0.None;
            end;
        end, 
        [l_MapperKind_0.UNION_TYPE] = function(v30) --[[ Line: 165 ]]
            -- upvalues: l_Boolean_0 (ref), v17 (copy), l_Object_0 (ref)
            if l_Boolean_0.toJSBoolean(v17(v30.name, v30)) then
                return nil;
            else
                return l_Object_0.None;
            end;
        end, 
        [l_MapperKind_0.ENUM_TYPE] = function(v31) --[[ Line: 174 ]]
            -- upvalues: l_Boolean_0 (ref), v17 (copy), l_Object_0 (ref)
            if l_Boolean_0.toJSBoolean(v17(v31.name, v31)) then
                return nil;
            else
                return l_Object_0.None;
            end;
        end, 
        [l_MapperKind_0.SCALAR_TYPE] = function(v32) --[[ Line: 183 ]]
            -- upvalues: l_Boolean_0 (ref), v17 (copy), l_Object_0 (ref)
            if l_Boolean_0.toJSBoolean(v17(v32.name, v32)) then
                return nil;
            else
                return l_Object_0.None;
            end;
        end
    }));
end;
v13 = function(v33, v34, v35, v36) --[[ Line: 199 ]] --[[ Name: filterRootFields ]]
    -- upvalues: l_Boolean_0 (copy), l_GraphQLObjectType_0 (copy)
    if l_Boolean_0.toJSBoolean(l_Boolean_0.toJSBoolean(v35) and v35 or v36) then
        local v37 = v33:toConfig();
        for _, v39 in v37.fields do
            local v40 = table.unpack(v39);
            local v41 = v37.fields:get(v40);
            if v35 and not v35(v34, v40, (v37.fields:get(v40))) then
                v37.fields:delete(v40);
            elseif l_Boolean_0.toJSBoolean(if l_Boolean_0.toJSBoolean(v36) then v41.args else v36) then
                for _, v43 in v41.args do
                    local v44 = table.unpack(v43);
                    if not v36(v34, v40, v44, v41.args:get(v44)) then
                        v41.args:delete(v44);
                    end;
                end;
            end;
        end;
        return l_GraphQLObjectType_0.new(v37);
    else
        return v33;
    end;
end;
v14 = function(v45, v46, v47, v48) --[[ Line: 273 ]] --[[ Name: filterElementFields ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy), l_Object_0 (copy)
    if l_Boolean_0.toJSBoolean(l_Boolean_0.toJSBoolean(v47) and v47 or v48) then
        local v49 = v46:toConfig();
        for _, v51 in v49.fields do
            local v52 = table.unpack(v51);
            local v53 = v49.fields:get(v52);
            if l_Boolean_0.toJSBoolean(v47 and not v47(v46.name, v52, v49.fields:get(v52))) then
                v49.fields:delete(v52);
            elseif l_Boolean_0.toJSBoolean(if l_Boolean_0.toJSBoolean(v48) then l_Array_0.indexOf(l_Object_0.keys(v53), "args") ~= -1 else v48) then
                for _, v55 in v53.args do
                    local v56 = table.unpack(v55);
                    if not l_Boolean_0.toJSBoolean(v48(v46.name, v52, v56, v53.args:get(v56))) then
                        v53.args:delete(v56);
                    end;
                end;
            end;
        end;
        return v45.new(v49);
    else
        return nil;
    end;
end;
return v5;