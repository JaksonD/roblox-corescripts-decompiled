local l_Parent_0 = script.Parent.Parent.Parent;
local l_language_0 = l_Parent_0.language;
local l_jsutils_0 = l_Parent_0.jsutils;
local v3 = require(l_jsutils_0.instanceOf);
local l_keyMap_0 = require(l_jsutils_0.keyMap).keyMap;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_didYouMean_0 = require(l_jsutils_0.didYouMean).didYouMean;
local l_suggestionList_0 = require(l_jsutils_0.suggestionList).suggestionList;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_print_0 = require(l_language_0.printer).print;
local v10 = require(l_Parent_0.type.definition);
local l_isLeafType_0 = v10.isLeafType;
local l_isInputObjectType_0 = v10.isInputObjectType;
local l_isListType_0 = v10.isListType;
local l_isNonNullType_0 = v10.isNonNullType;
local l_isRequiredInputField_0 = v10.isRequiredInputField;
local l_getNullableType_0 = v10.getNullableType;
local l_getNamedType_0 = v10.getNamedType;
local v18 = {};
local v19 = nil;
v18.ValuesOfCorrectTypeRule = function(v20) --[[ Line: 41 ]]
    -- upvalues: l_getNullableType_0 (copy), l_isListType_0 (copy), v19 (ref), l_getNamedType_0 (copy), l_isInputObjectType_0 (copy), l_keyMap_0 (copy), l_isRequiredInputField_0 (copy), l_inspect_0 (copy), l_GraphQLError_0 (copy), l_suggestionList_0 (copy), l_didYouMean_0 (copy), l_isNonNullType_0 (copy), l_print_0 (copy)
    return {
        ListValue = function(_, v22) --[[ Line: 43 ]] --[[ Name: ListValue ]]
            -- upvalues: l_getNullableType_0 (ref), v20 (copy), l_isListType_0 (ref), v19 (ref)
            local v23 = l_getNullableType_0(v20:getParentInputType());
            if not l_isListType_0(v23) then
                v19(v20, v22);
                return false;
            else
                return;
            end;
        end, 
        ObjectValue = function(_, v25) --[[ Line: 53 ]] --[[ Name: ObjectValue ]]
            -- upvalues: l_getNamedType_0 (ref), v20 (copy), l_isInputObjectType_0 (ref), v19 (ref), l_keyMap_0 (ref), l_isRequiredInputField_0 (ref), l_inspect_0 (ref), l_GraphQLError_0 (ref)
            local v26 = l_getNamedType_0(v20:getInputType());
            if not l_isInputObjectType_0(v26) then
                v19(v20, v25);
                return false;
            else
                local v28 = l_keyMap_0(v25.fields, function(v27) --[[ Line: 60 ]]
                    return v27.name.value;
                end);
                for _, v30 in ipairs(v26:getFields():values()) do
                    if not v28[v30.name] and l_isRequiredInputField_0(v30) then
                        local v31 = l_inspect_0(v30.type);
                        v20:reportError(l_GraphQLError_0.new(("Field \"%s.%s\" of required type \"%s\" was not provided."):format(v26.name, v30.name, v31), v25));
                    end;
                end;
                return;
            end;
        end, 
        ObjectField = function(_, v33) --[[ Line: 82 ]] --[[ Name: ObjectField ]]
            -- upvalues: l_getNamedType_0 (ref), v20 (copy), l_isInputObjectType_0 (ref), l_suggestionList_0 (ref), l_GraphQLError_0 (ref), l_didYouMean_0 (ref)
            local v34 = l_getNamedType_0(v20:getParentInputType());
            if not v20:getInputType() and l_isInputObjectType_0(v34) then
                local v35 = l_suggestionList_0(v33.name.value, v34:getFields():keys());
                v20:reportError(l_GraphQLError_0.new(("Field \"%s\" is not defined by type \"%s\"."):format(v33.name.value, v34.name) .. l_didYouMean_0(v35), v33));
            end;
        end, 
        NullValue = function(_, v37) --[[ Line: 102 ]] --[[ Name: NullValue ]]
            -- upvalues: v20 (copy), l_isNonNullType_0 (ref), l_GraphQLError_0 (ref), l_inspect_0 (ref), l_print_0 (ref)
            local v38 = v20:getInputType();
            if l_isNonNullType_0(v38) then
                v20:reportError(l_GraphQLError_0.new(("Expected value of type \"%s\", found %s."):format(l_inspect_0(v38), l_print_0(v37)), v37));
            end;
        end, 
        EnumValue = function(_, v40) --[[ Line: 116 ]] --[[ Name: EnumValue ]]
            -- upvalues: v19 (ref), v20 (copy)
            return v19(v20, v40);
        end, 
        IntValue = function(_, v42) --[[ Line: 119 ]] --[[ Name: IntValue ]]
            -- upvalues: v19 (ref), v20 (copy)
            return v19(v20, v42);
        end, 
        FloatValue = function(_, v44) --[[ Line: 122 ]] --[[ Name: FloatValue ]]
            -- upvalues: v19 (ref), v20 (copy)
            return v19(v20, v44);
        end, 
        StringValue = function(_, v46) --[[ Line: 125 ]] --[[ Name: StringValue ]]
            -- upvalues: v19 (ref), v20 (copy)
            return v19(v20, v46);
        end, 
        BooleanValue = function(_, v48) --[[ Line: 128 ]] --[[ Name: BooleanValue ]]
            -- upvalues: v19 (ref), v20 (copy)
            return v19(v20, v48);
        end
    };
end;
v19 = function(v49, v50) --[[ Line: 138 ]] --[[ Name: isValidValueNode ]]
    -- upvalues: l_getNamedType_0 (copy), l_isLeafType_0 (copy), l_inspect_0 (copy), l_GraphQLError_0 (copy), l_print_0 (copy), v3 (copy)
    local v51 = v49:getInputType();
    if not v51 then
        return;
    else
        local v52 = l_getNamedType_0(v51);
        if not l_isLeafType_0(v52) then
            local v53 = l_inspect_0(v51);
            v49:reportError(l_GraphQLError_0.new(("Expected value of type \"%s\", found %s."):format(v53, l_print_0(v50)), v50));
            return;
        else
            xpcall(function() --[[ Line: 160 ]]
                -- upvalues: v52 (copy), v50 (copy), l_inspect_0 (ref), v51 (copy), v49 (copy), l_GraphQLError_0 (ref), l_print_0 (ref)
                if v52:parseLiteral(v50, nil) == nil then
                    local v54 = l_inspect_0(v51);
                    v49:reportError(l_GraphQLError_0.new(("Expected value of type \"%s\", found %s."):format(v54, l_print_0(v50)), v50));
                end;
            end, function(v55) --[[ Line: 173 ]]
                -- upvalues: l_inspect_0 (ref), v51 (copy), v3 (ref), l_GraphQLError_0 (ref), v49 (copy), l_print_0 (ref), v50 (copy)
                local v56 = l_inspect_0(v51);
                if v3(v55, l_GraphQLError_0) then
                    v49:reportError(v55);
                    return;
                else
                    v49:reportError(l_GraphQLError_0.new(("Expected value of type \"%s\", found %s; "):format(v56, l_print_0(v50)) .. v55.message, v50, nil, nil, nil, v55));
                    return;
                end;
            end);
            return;
        end;
    end;
end;
return v18;