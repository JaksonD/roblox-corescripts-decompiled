local l_Parent_0 = script.Parent.Parent.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Object_0 = v3.Object;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_invariant_0 = require(l_jsutils_0.invariant).invariant;
local l_didYouMean_0 = require(l_jsutils_0.didYouMean).didYouMean;
local l_suggestionList_0 = require(l_jsutils_0.suggestionList).suggestionList;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_isTypeDefinitionNode_0 = require(l_language_0.predicates).isTypeDefinitionNode;
local v14 = require(l_Parent_0.type.definition);
local l_isScalarType_0 = v14.isScalarType;
local l_isObjectType_0 = v14.isObjectType;
local l_isInterfaceType_0 = v14.isInterfaceType;
local l_isUnionType_0 = v14.isUnionType;
local l_isEnumType_0 = v14.isEnumType;
local l_isInputObjectType_0 = v14.isInputObjectType;
local v21 = {};
local v22 = nil;
local v23 = nil;
local v24 = nil;
v21.PossibleTypeExtensionsRule = function(v25) --[[ Line: 45 ]]
    -- upvalues: l_isTypeDefinitionNode_0 (copy), v22 (ref), v23 (ref), v24 (ref), l_GraphQLError_0 (copy), l_Object_0 (copy), l_Array_0 (copy), l_suggestionList_0 (copy), l_didYouMean_0 (copy)
    local v26 = v25:getSchema();
    local v27 = {};
    for _, v29 in ipairs(v25:getDocument().definitions) do
        if l_isTypeDefinitionNode_0(v29) then
            v27[v29.name.value] = v29;
        end;
    end;
    local function v38(v30) --[[ Line: 55 ]] --[[ Name: checkExtension ]]
        -- upvalues: v27 (copy), v26 (copy), v22 (ref), v23 (ref), v24 (ref), v25 (copy), l_GraphQLError_0 (ref), l_Object_0 (ref), l_Array_0 (ref), l_suggestionList_0 (ref), l_didYouMean_0 (ref)
        local l_value_0 = v30.name.value;
        local v32 = v27[l_value_0];
        local v33 = nil;
        if v26 then
            v33 = v26:getType(l_value_0);
        end;
        local v34 = nil;
        if v32 then
            v34 = v22[v32.kind];
        elseif v33 then
            v34 = v23(v33);
        end;
        if v34 then
            if v34 ~= v30.kind then
                local v35 = v24(v30.kind);
                v25:reportError(l_GraphQLError_0.new(("Cannot extend non-%s type \"%s\"."):format(v35, l_value_0), v32 and {
                    v32, 
                    v30
                } or v30));
                return;
            end;
        else
            local v36 = l_Object_0.keys(v27);
            if v26 then
                v36 = l_Array_0.concat(v36, v26:getTypeMap():keys());
            end;
            local v37 = l_suggestionList_0(l_value_0, v36);
            v25:reportError(l_GraphQLError_0.new(("Cannot extend type \"%s\" because it is not defined."):format(l_value_0) .. l_didYouMean_0(v37), v30.name));
        end;
    end;
    local function v40(_, ...) --[[ Line: 100 ]]
        -- upvalues: v38 (copy)
        return v38(...);
    end;
    return {
        ScalarTypeExtension = v40, 
        ObjectTypeExtension = v40, 
        InterfaceTypeExtension = v40, 
        UnionTypeExtension = v40, 
        EnumTypeExtension = v40, 
        InputObjectTypeExtension = v40
    };
end;
v22 = {
    [l_Kind_0.SCALAR_TYPE_DEFINITION] = l_Kind_0.SCALAR_TYPE_EXTENSION, 
    [l_Kind_0.OBJECT_TYPE_DEFINITION] = l_Kind_0.OBJECT_TYPE_EXTENSION, 
    [l_Kind_0.INTERFACE_TYPE_DEFINITION] = l_Kind_0.INTERFACE_TYPE_EXTENSION, 
    [l_Kind_0.UNION_TYPE_DEFINITION] = l_Kind_0.UNION_TYPE_EXTENSION, 
    [l_Kind_0.ENUM_TYPE_DEFINITION] = l_Kind_0.ENUM_TYPE_EXTENSION, 
    [l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION] = l_Kind_0.INPUT_OBJECT_TYPE_EXTENSION
};
v23 = function(v41) --[[ Line: 122 ]] --[[ Name: typeToExtKind ]]
    -- upvalues: l_isScalarType_0 (copy), l_Kind_0 (copy), l_isObjectType_0 (copy), l_isInterfaceType_0 (copy), l_isUnionType_0 (copy), l_isEnumType_0 (copy), l_isInputObjectType_0 (copy), l_invariant_0 (copy), l_inspect_0 (copy)
    if l_isScalarType_0(v41) then
        return l_Kind_0.SCALAR_TYPE_EXTENSION;
    elseif l_isObjectType_0(v41) then
        return l_Kind_0.OBJECT_TYPE_EXTENSION;
    elseif l_isInterfaceType_0(v41) then
        return l_Kind_0.INTERFACE_TYPE_EXTENSION;
    elseif l_isUnionType_0(v41) then
        return l_Kind_0.UNION_TYPE_EXTENSION;
    elseif l_isEnumType_0(v41) then
        return l_Kind_0.ENUM_TYPE_EXTENSION;
    elseif l_isInputObjectType_0(v41) then
        return l_Kind_0.INPUT_OBJECT_TYPE_EXTENSION;
    else
        l_invariant_0(false, "Unexpected type: " .. l_inspect_0(v41));
        return nil;
    end;
end;
v24 = function(v42) --[[ Line: 150 ]] --[[ Name: extensionKindToTypeName ]]
    -- upvalues: l_Kind_0 (copy), l_invariant_0 (copy), l_inspect_0 (copy)
    if v42 == l_Kind_0.SCALAR_TYPE_EXTENSION then
        return "scalar";
    elseif v42 == l_Kind_0.OBJECT_TYPE_EXTENSION then
        return "object";
    elseif v42 == l_Kind_0.INTERFACE_TYPE_EXTENSION then
        return "interface";
    elseif v42 == l_Kind_0.UNION_TYPE_EXTENSION then
        return "union";
    elseif v42 == l_Kind_0.ENUM_TYPE_EXTENSION then
        return "enum";
    elseif v42 == l_Kind_0.INPUT_OBJECT_TYPE_EXTENSION then
        return "input object";
    else
        l_invariant_0(false, "Unexpected kind: " .. l_inspect_0(v42));
        return "";
    end;
end;
return v21;