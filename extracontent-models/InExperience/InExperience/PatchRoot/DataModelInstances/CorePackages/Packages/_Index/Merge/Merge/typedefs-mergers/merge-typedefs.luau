local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local v7 = {};
local _ = require(script.Parent["merge-typedefs_types"]);
local v9 = nil;
local v10 = require(l_Parent_0.GraphQL);
local l_parse_0 = v10.parse;
local l_Kind_0 = v10.Kind;
local l_isSchema_0 = v10.isSchema;
local l_isDefinitionNode_0 = v10.isDefinitionNode;
local v15 = require(script.Parent.utils);
local l_defaultStringComparator_0 = v15.defaultStringComparator;
local l_isSourceTypes_0 = v15.isSourceTypes;
local l_isStringTypes_0 = v15.isStringTypes;
local v19 = require(script.Parent["merge-nodes"]);
local l_mergeGraphQLNodes_0 = v19.mergeGraphQLNodes;
local l_schemaDefSymbol_0 = v19.schemaDefSymbol;
local v22 = require(l_Parent_0.Utils);
local l_getDocumentNodeFromSchema_0 = v22.getDocumentNodeFromSchema;
local l_isDocumentNode_0 = v22.isDocumentNode;
local l_resetComments_0 = v22.resetComments;
local l_printWithComments_0 = v22.printWithComments;
local l_DEFAULT_OPERATION_TYPE_NAME_MAP_0 = require(script.Parent["schema-def"]).DEFAULT_OPERATION_TYPE_NAME_MAP;
v7.mergeTypeDefs = function(v28, v29) --[[ Line: 159 ]] --[[ Name: mergeTypeDefs ]]
    -- upvalues: l_resetComments_0 (copy), l_Kind_0 (copy), v9 (ref), l_Object_0 (copy), l_printWithComments_0 (copy)
    l_resetComments_0();
    local v30 = {
        kind = l_Kind_0.DOCUMENT, 
        definitions = v9(v28, l_Object_0.assign({}, {
            useSchemaDefinition = true, 
            forceSchemaDefinition = false, 
            throwOnConflict = false, 
            commentDescriptions = false
        }, v29))
    };
    local v31 = nil;
    v31 = if v29 and v29.commentDescriptions then l_printWithComments_0(v30) else v30;
    l_resetComments_0();
    return v31;
end;
local function v32(v33, v34, v35, v36) --[[ Line: 188 ]] --[[ Name: visitTypeSources ]]
    -- upvalues: l_Set_0 (copy), l_Boolean_0 (copy), v32 (copy), l_Array_0 (copy), l_isSchema_0 (copy), l_getDocumentNodeFromSchema_0 (copy), l_isStringTypes_0 (copy), l_isSourceTypes_0 (copy), l_parse_0 (copy), l_isDefinitionNode_0 (copy), l_isDocumentNode_0 (copy), l_Error_0 (copy)
    local v37 = if v35 ~= nil then v35 else {};
    local v38 = if v36 ~= nil then v36 else l_Set_0.new();
    if l_Boolean_0.toJSBoolean(if l_Boolean_0.toJSBoolean(v33) then not l_Boolean_0.toJSBoolean(v38:has(v33)) else v33) then
        v38:add(v33);
        if typeof(v33) == "function" then
            v32(v33(), v34, v37, v38);
            return v37;
        elseif l_Boolean_0.toJSBoolean(l_Array_0.isArray(v33)) then
            for _, v40 in v33 do
                v32(v40, v34, v37, v38);
            end;
            return v37;
        elseif l_Boolean_0.toJSBoolean(l_isSchema_0(v33)) then
            local v41 = l_getDocumentNodeFromSchema_0(v33, v34);
            v32(v41.definitions, v34, v37, v38);
            return v37;
        else
            local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
            local v43 = l_isStringTypes_0(v33);
            if l_toJSBoolean_0(l_Boolean_0.toJSBoolean(v43) and v43 or l_isSourceTypes_0(v33)) then
                l_toJSBoolean_0 = l_parse_0(v33, v34);
                v32(l_toJSBoolean_0.definitions, v34, v37, v38);
                return v37;
            else
                l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
                local v44 = false;
                if typeof(v33) == "table" then
                    v44 = l_isDefinitionNode_0(v33);
                end;
                if l_toJSBoolean_0(v44) then
                    table.insert(v37, v33);
                    return v37;
                elseif l_isDocumentNode_0(v33) then
                    v32(v33.definitions, v34, v37, v38);
                    return v37;
                else
                    error(l_Error_0.new(("typeDefs must contain only strings, documents, schemas, or functions, got %s"):format((tostring((typeof(v33)))))));
                end;
            end;
        end;
    end;
    return v37;
end;
v9 = function(v45, v46) --[[ Line: 262 ]] --[[ Name: mergeGraphQLTypes ]]
    -- upvalues: l_resetComments_0 (copy), v32 (copy), l_mergeGraphQLNodes_0 (copy), l_Boolean_0 (copy), l_schemaDefSymbol_0 (copy), l_Kind_0 (copy), l_DEFAULT_OPERATION_TYPE_NAME_MAP_0 (copy), l_Array_0 (copy), l_defaultStringComparator_0 (copy)
    l_resetComments_0();
    local v47 = v32(v45, v46);
    local v48 = l_mergeGraphQLNodes_0(v47, v46);
    if v46 and l_Boolean_0.toJSBoolean(v46.useSchemaDefinition) then
        local v49 = l_Boolean_0.toJSBoolean(v48:get(l_schemaDefSymbol_0)) and v48:get(l_schemaDefSymbol_0) or {
            kind = l_Kind_0.SCHEMA_DEFINITION, 
            operationTypes = {}
        };
        local l_operationTypes_0 = v49.operationTypes;
        for v51 in l_DEFAULT_OPERATION_TYPE_NAME_MAP_0 do
            local v53 = l_Array_0.find(l_operationTypes_0, function(v52) --[[ Line: 288 ]]
                -- upvalues: v51 (copy)
                return v52.operation == v51;
            end);
            if not l_Boolean_0.toJSBoolean(v53) then
                local v54 = v48:get(l_DEFAULT_OPERATION_TYPE_NAME_MAP_0[tostring(v51)]);
                if v54 ~= nil and v54.name ~= nil then
                    table.insert(l_operationTypes_0, {
                        kind = l_Kind_0.OPERATION_TYPE_DEFINITION, 
                        type = {
                            kind = l_Kind_0.NAMED_TYPE, 
                            name = v54.name
                        }, 
                        operation = v51
                    });
                end;
            end;
        end;
        if typeof(v49) == "table" and typeof(v49.operationTypes) == "table" and #v49.operationTypes > 0 then
            v48:set(l_schemaDefSymbol_0, v49);
        end;
    end;
    if v46 and l_Boolean_0.toJSBoolean(v46.forceSchemaDefinition) and (typeof(v48:get(l_schemaDefSymbol_0)) ~= "table" or typeof(v48:get(l_schemaDefSymbol_0).operationTypes) ~= "table" or #v48:get(l_schemaDefSymbol_0).operationTypes <= 0) then
        v48:set(l_schemaDefSymbol_0, {
            kind = l_Kind_0.SCHEMA_DEFINITION, 
            operationTypes = {
                {
                    kind = l_Kind_0.OPERATION_TYPE_DEFINITION, 
                    operation = "query", 
                    type = {
                        kind = l_Kind_0.NAMED_TYPE, 
                        name = {
                            kind = l_Kind_0.NAME, 
                            value = "Query"
                        }
                    }
                }
            }
        });
    end;
    local v55 = v48:values();
    if v46 and l_Boolean_0.toJSBoolean(v46.sort) then
        local v56 = if typeof(v46.sort) == "function" then v46.sort else l_defaultStringComparator_0;
        l_Array_0.sort(v55, function(v57, v58) --[[ Line: 392 ]]
            -- upvalues: v56 (copy)
            return v56(if typeof(v57.name) == "table" then v57.name.value else nil, if typeof(v58.name) == "table" then v58.name.value else nil);
        end);
    end;
    return v55;
end;
v7.mergeGraphQLTypes = v9;
return v7;