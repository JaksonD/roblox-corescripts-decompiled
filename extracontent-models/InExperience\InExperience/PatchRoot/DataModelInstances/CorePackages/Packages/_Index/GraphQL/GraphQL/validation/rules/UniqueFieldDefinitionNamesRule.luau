local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Map_0 = require(l_Parent_1.LuauPolyfill).Map;
local l_isNotNillish_0 = require(l_Parent_0.luaUtils.isNillish).isNotNillish;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local v5 = require(l_Parent_0.type.definition);
local l_isObjectType_0 = v5.isObjectType;
local l_isInterfaceType_0 = v5.isInterfaceType;
local l_isInputObjectType_0 = v5.isInputObjectType;
local v9 = {};
local v10 = nil;
v9.UniqueFieldDefinitionNamesRule = function(v11) --[[ Line: 32 ]]
    -- upvalues: l_Map_0 (copy), v10 (ref), l_GraphQLError_0 (copy)
    local v12 = v11:getSchema();
    local v13 = v12 and v12:getTypeMap() or l_Map_0.new();
    local v14 = {};
    local function v23(_, v16) --[[ Line: 40 ]] --[[ Name: checkFieldUniqueness ]]
        -- upvalues: v14 (copy), v10 (ref), v13 (copy), v11 (copy), l_GraphQLError_0 (ref)
        local l_value_0 = v16.name.value;
        if not v14[l_value_0] then
            v14[l_value_0] = {};
        end;
        local v18 = v16.fields or {};
        local v19 = v14[l_value_0];
        for _, v21 in ipairs(v18) do
            local l_value_1 = v21.name.value;
            if v10(v13:get(l_value_0), l_value_1) then
                v11:reportError(l_GraphQLError_0.new(("Field \"%s.%s\" already exists in the schema. It cannot also be defined in this type extension."):format(l_value_0, l_value_1), v21.name));
            elseif v19[l_value_1] then
                v11:reportError(l_GraphQLError_0.new(("Field \"%s.%s\" can only be defined once."):format(l_value_0, l_value_1), {
                    v19[l_value_1], 
                    v21.name
                }));
            else
                v19[l_value_1] = v21.name;
            end;
        end;
        return false;
    end;
    return {
        InputObjectTypeDefinition = v23, 
        InputObjectTypeExtension = v23, 
        InterfaceTypeDefinition = v23, 
        InterfaceTypeExtension = v23, 
        ObjectTypeDefinition = v23, 
        ObjectTypeExtension = v23
    };
end;
v10 = function(v24, v25) --[[ Line: 88 ]] --[[ Name: hasField ]]
    -- upvalues: l_isObjectType_0 (copy), l_isInterfaceType_0 (copy), l_isInputObjectType_0 (copy), l_isNotNillish_0 (copy)
    if l_isObjectType_0(v24) or l_isInterfaceType_0(v24) or l_isInputObjectType_0(v24) then
        return l_isNotNillish_0(v24:getFields():get(v25));
    else
        return false;
    end;
end;
return v9;