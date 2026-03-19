local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v4 = {};
local v5 = require(l_Parent_0.GraphQL);
local l_GraphQLSchema_0 = v5.GraphQLSchema;
local l_isNamedType_0 = v5.isNamedType;
local l_isDirective_0 = v5.isDirective;
local l_getObjectTypeFromTypeMap_0 = require(script.Parent.getObjectTypeFromTypeMap).getObjectTypeFromTypeMap;
local l_rewireTypes_0 = require(script.Parent.rewire).rewireTypes;
local l_Map_0 = v1.Map;
v4.addTypes = function(v12, v13) --[[ Line: 61 ]] --[[ Name: addTypes ]]
    -- upvalues: l_Map_0 (copy), l_Boolean_0 (copy), l_isNamedType_0 (copy), l_isDirective_0 (copy), l_rewireTypes_0 (copy), l_Object_0 (copy), l_GraphQLSchema_0 (copy), l_getObjectTypeFromTypeMap_0 (copy)
    local v14 = v12:toConfig();
    local v15 = l_Map_0.new();
    for _, v17 in v14.types do
        v15:set(v17.name, v17);
    end;
    local v18 = {};
    for _, v20 in v14.directives do
        v18[tostring(v20.name)] = v20;
    end;
    for _, v22 in v13 do
        if l_Boolean_0.toJSBoolean(l_isNamedType_0(v22)) then
            v15:set(v22.name, v22);
        elseif l_Boolean_0.toJSBoolean(l_isDirective_0(v22)) then
            v18[v22.name] = v22;
        end;
    end;
    local v23 = l_rewireTypes_0(v15, (l_Object_0.values(v18)));
    local l_typeMap_0 = v23.typeMap;
    local l_directives_0 = v23.directives;
    return l_GraphQLSchema_0.new(l_Object_0.assign({}, v14, {
        query = l_getObjectTypeFromTypeMap_0(l_typeMap_0, v12:getQueryType()), 
        mutation = l_getObjectTypeFromTypeMap_0(l_typeMap_0, v12:getMutationType()), 
        subscription = l_getObjectTypeFromTypeMap_0(l_typeMap_0, v12:getSubscriptionType()), 
        types = l_typeMap_0:values(), 
        directives = l_directives_0
    }));
end;
return v4;