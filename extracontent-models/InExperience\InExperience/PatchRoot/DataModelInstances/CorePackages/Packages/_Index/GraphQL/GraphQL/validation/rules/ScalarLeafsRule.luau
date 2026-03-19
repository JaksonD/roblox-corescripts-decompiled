local l_Parent_0 = script.Parent.Parent.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local v4 = require(l_Parent_0.type.definition);
local l_getNamedType_0 = v4.getNamedType;
local l_isLeafType_0 = v4.isLeafType;
return {
    ScalarLeafsRule = function(v7) --[[ Line: 25 ]]
        -- upvalues: l_isLeafType_0 (copy), l_getNamedType_0 (copy), l_inspect_0 (copy), l_GraphQLError_0 (copy)
        return {
            Field = function(_, v9) --[[ Line: 27 ]] --[[ Name: Field ]]
                -- upvalues: v7 (copy), l_isLeafType_0 (ref), l_getNamedType_0 (ref), l_inspect_0 (ref), l_GraphQLError_0 (ref)
                local v10 = v7:getType();
                local l_selectionSet_0 = v9.selectionSet;
                if v10 then
                    if l_isLeafType_0(l_getNamedType_0(v10)) then
                        if l_selectionSet_0 then
                            local l_value_0 = v9.name.value;
                            local v13 = l_inspect_0(v10);
                            v7:reportError(l_GraphQLError_0.new(("Field \"%s\" must not have a selection since type \"%s\" has no subfields."):format(l_value_0, v13), l_selectionSet_0));
                            return;
                        end;
                    elseif not l_selectionSet_0 then
                        local l_value_1 = v9.name.value;
                        local v15 = l_inspect_0(v10);
                        v7:reportError(l_GraphQLError_0.new(("Field \"%s\" of type \"%s\" must have a selection of subfields. Did you mean \"%s { ... }\"?"):format(l_value_1, v15, l_value_1), v9));
                    end;
                end;
            end
        };
    end
};