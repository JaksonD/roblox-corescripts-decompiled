local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Map_0 = require(l_Parent_1.LuauPolyfill).Map;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_isEnumType_0 = require(l_Parent_0.type.definition).isEnumType;
return {
    UniqueEnumValueNamesRule = function(v5) --[[ Line: 25 ]]
        -- upvalues: l_Map_0 (copy), l_isEnumType_0 (copy), l_GraphQLError_0 (copy)
        local v6 = v5:getSchema();
        local v7 = v6 and v6:getTypeMap() or l_Map_0.new();
        local v8 = {};
        local function v18(_, v10) --[[ Line: 33 ]] --[[ Name: checkValueUniqueness ]]
            -- upvalues: v8 (copy), v7 (copy), l_isEnumType_0 (ref), v5 (copy), l_GraphQLError_0 (ref)
            local l_value_0 = v10.name.value;
            if not v8[l_value_0] then
                v8[l_value_0] = {};
            end;
            local v12 = v10.values or {};
            local v13 = v8[l_value_0];
            for _, v15 in ipairs(v12) do
                local l_value_1 = v15.name.value;
                local v17 = v7:get(l_value_0);
                if l_isEnumType_0(v17) and v17:getValue(l_value_1) then
                    v5:reportError(l_GraphQLError_0.new(("Enum value \"%s.%s\" already exists in the schema. It cannot also be defined in this type extension."):format(l_value_0, l_value_1), v15.name));
                elseif v13[l_value_1] then
                    v5:reportError(l_GraphQLError_0.new(("Enum value \"%s.%s\" can only be defined once."):format(l_value_0, l_value_1), {
                        v13[l_value_1], 
                        v15.name
                    }));
                else
                    v13[l_value_1] = v15.name;
                end;
            end;
            return false;
        end;
        return {
            EnumTypeDefinition = v18, 
            EnumTypeExtension = v18
        };
    end
};