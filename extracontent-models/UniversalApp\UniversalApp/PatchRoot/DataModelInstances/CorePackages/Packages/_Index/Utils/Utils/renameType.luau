local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local v6 = {};
local v7 = require(l_Parent_0.GraphQL);
local l_GraphQLEnumType_0 = v7.GraphQLEnumType;
local l_GraphQLInputObjectType_0 = v7.GraphQLInputObjectType;
local l_GraphQLInterfaceType_0 = v7.GraphQLInterfaceType;
local l_GraphQLObjectType_0 = v7.GraphQLObjectType;
local l_GraphQLScalarType_0 = v7.GraphQLScalarType;
local l_GraphQLUnionType_0 = v7.GraphQLUnionType;
local l_isEnumType_0 = v7.isEnumType;
local l_isInterfaceType_0 = v7.isInterfaceType;
local l_isInputObjectType_0 = v7.isInputObjectType;
local l_isObjectType_0 = v7.isObjectType;
local l_isScalarType_0 = v7.isScalarType;
local l_isUnionType_0 = v7.isUnionType;
v6.renameType = function(v20, v21) --[[ Line: 52 ]] --[[ Name: renameType ]]
    -- upvalues: l_Boolean_0 (copy), l_isObjectType_0 (copy), l_GraphQLObjectType_0 (copy), l_Object_0 (copy), l_Array_0 (copy), l_isInterfaceType_0 (copy), l_GraphQLInterfaceType_0 (copy), l_isUnionType_0 (copy), l_GraphQLUnionType_0 (copy), l_isInputObjectType_0 (copy), l_GraphQLInputObjectType_0 (copy), l_isEnumType_0 (copy), l_GraphQLEnumType_0 (copy), l_isScalarType_0 (copy), l_GraphQLScalarType_0 (copy), l_Error_0 (copy)
    if l_Boolean_0.toJSBoolean(l_isObjectType_0(v20)) then
        return l_GraphQLObjectType_0.new(l_Object_0.assign({}, v20:toConfig(), {
            name = v21, 
            astNode = if v20.astNode == nil then v20.astNode else l_Object_0.assign({}, v20.astNode, {
                name = l_Object_0.assign({}, v20.astNode.name, {
                    value = v21
                })
            }), 
            extensionASTNodes = if v20.extensionASTNodes == nil then v20.extensionASTNodes else l_Array_0.map(v20.extensionASTNodes, function(v22) --[[ Line: 68 ]]
                -- upvalues: l_Object_0 (ref), v21 (copy)
                return l_Object_0.assign({}, v22, {
                    name = l_Object_0.assign({}, v22.name, {
                        value = v21
                    })
                });
            end)
        }));
    elseif l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v20)) then
        return l_GraphQLInterfaceType_0.new(l_Object_0.assign({}, v20:toConfig(), {
            name = v21, 
            astNode = if v20.astNode == nil then v20.astNode else l_Object_0.assign({}, v20.astNode, {
                name = l_Object_0.assign({}, v20.astNode.name, {
                    value = v21
                })
            }), 
            extensionASTNodes = if v20.extensionASTNodes == nil then v20.extensionASTNodes else l_Array_0.map(v20.extensionASTNodes, function(v23) --[[ Line: 88 ]]
                -- upvalues: l_Object_0 (ref), v21 (copy)
                return l_Object_0.assign({}, v23, {
                    name = l_Object_0.assign({}, v23.name, {
                        value = v21
                    })
                });
            end)
        }));
    elseif l_Boolean_0.toJSBoolean(l_isUnionType_0(v20)) then
        return l_GraphQLUnionType_0.new(l_Object_0.assign({}, v20:toConfig(), {
            name = v21, 
            astNode = if v20.astNode == nil then v20.astNode else l_Object_0.assign({}, v20.astNode, {
                name = l_Object_0.assign({}, v20.astNode.name, {
                    value = v21
                })
            }), 
            extensionASTNodes = if v20.extensionASTNodes == nil then v20.extensionASTNodes else l_Array_0.map(v20.extensionASTNodes, function(v24) --[[ Line: 108 ]]
                -- upvalues: l_Object_0 (ref), v21 (copy)
                return l_Object_0.assign({}, v24, {
                    name = l_Object_0.assign({}, v24.name, {
                        value = v21
                    })
                });
            end)
        }));
    elseif l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v20)) then
        return l_GraphQLInputObjectType_0.new(l_Object_0.assign({}, v20:toConfig(), {
            name = v21, 
            astNode = if v20.astNode == nil then v20.astNode else l_Object_0.assign({}, v20.astNode, {
                name = l_Object_0.assign({}, v20.astNode.name, {
                    value = v21
                })
            }), 
            extensionASTNodes = if v20.extensionASTNodes == nil then v20.extensionASTNodes else l_Array_0.map(v20.extensionASTNodes, function(v25) --[[ Line: 128 ]]
                -- upvalues: l_Object_0 (ref), v21 (copy)
                return l_Object_0.assign({}, v25, {
                    name = l_Object_0.assign({}, v25.name, {
                        value = v21
                    })
                });
            end)
        }));
    elseif l_Boolean_0.toJSBoolean(l_isEnumType_0(v20)) then
        return l_GraphQLEnumType_0.new(l_Object_0.assign({}, v20:toConfig(), {
            name = v21, 
            astNode = if v20.astNode == nil then v20.astNode else l_Object_0.assign({}, v20.astNode, {
                name = l_Object_0.assign({}, v20.astNode.name, {
                    value = v21
                })
            }), 
            extensionASTNodes = if v20.extensionASTNodes == nil then v20.extensionASTNodes else l_Array_0.map(v20.extensionASTNodes, function(v26) --[[ Line: 148 ]]
                -- upvalues: l_Object_0 (ref), v21 (copy)
                return l_Object_0.assign({}, v26, {
                    name = l_Object_0.assign({}, v26.name, {
                        value = v21
                    })
                });
            end)
        }));
    elseif l_Boolean_0.toJSBoolean(l_isScalarType_0(v20)) then
        return l_GraphQLScalarType_0.new(l_Object_0.assign({}, v20:toConfig(), {
            name = v21, 
            astNode = if v20.astNode == nil then v20.astNode else l_Object_0.assign({}, v20.astNode, {
                name = l_Object_0.assign({}, v20.astNode.name, {
                    value = v21
                })
            }), 
            extensionASTNodes = if v20.extensionASTNodes == nil then v20.extensionASTNodes else l_Array_0.map(v20.extensionASTNodes, function(v27) --[[ Line: 168 ]]
                -- upvalues: l_Object_0 (ref), v21 (copy)
                return l_Object_0.assign({}, v27, {
                    name = l_Object_0.assign({}, v27.name, {
                        value = v21
                    })
                });
            end)
        }));
    else
        error(l_Error_0.new(("Unknown type %s."):format((tostring(v20)))));
        return;
    end;
end;
return v6;