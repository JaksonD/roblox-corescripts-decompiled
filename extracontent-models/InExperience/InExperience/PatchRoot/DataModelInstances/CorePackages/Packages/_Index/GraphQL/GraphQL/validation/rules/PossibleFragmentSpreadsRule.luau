local l_Parent_0 = script.Parent.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_isCompositeType_0 = require(l_Parent_0.type.definition).isCompositeType;
local l_utilities_0 = l_Parent_0.utilities;
local l_typeFromAST_0 = require(l_utilities_0.typeFromAST).typeFromAST;
local l_doTypesOverlap_0 = require(l_utilities_0.typeComparators).doTypesOverlap;
local v7 = {};
local v8 = nil;
v7.PossibleFragmentSpreadsRule = function(v9) --[[ Line: 31 ]]
    -- upvalues: l_isCompositeType_0 (copy), l_doTypesOverlap_0 (copy), l_inspect_0 (copy), l_GraphQLError_0 (copy), v8 (ref)
    return {
        InlineFragment = function(_, v11) --[[ Line: 33 ]] --[[ Name: InlineFragment ]]
            -- upvalues: v9 (copy), l_isCompositeType_0 (ref), l_doTypesOverlap_0 (ref), l_inspect_0 (ref), l_GraphQLError_0 (ref)
            local v12 = v9:getType();
            local v13 = v9:getParentType();
            if l_isCompositeType_0(v12) and l_isCompositeType_0(v13) and not l_doTypesOverlap_0(v9:getSchema(), v12, v13) then
                local v14 = l_inspect_0(v13);
                local v15 = l_inspect_0(v12);
                v9:reportError(l_GraphQLError_0.new(("Fragment cannot be spread here as objects of type \"%s\" can never be of type \"%s\"."):format(v14, v15), v11));
            end;
        end, 
        FragmentSpread = function(_, v17) --[[ Line: 54 ]] --[[ Name: FragmentSpread ]]
            -- upvalues: v8 (ref), v9 (copy), l_doTypesOverlap_0 (ref), l_inspect_0 (ref), l_GraphQLError_0 (ref)
            local l_value_0 = v17.name.value;
            local v19 = v8(v9, l_value_0);
            local v20 = v9:getParentType();
            if v19 and v20 and not l_doTypesOverlap_0(v9:getSchema(), v19, v20) then
                local v21 = l_inspect_0(v20);
                local v22 = l_inspect_0(v19);
                v9:reportError(l_GraphQLError_0.new(("Fragment \"%s\" cannot be spread here as objects of type \"%s\" can never be of type \"%s\"."):format(l_value_0, v21, v22), v17));
            end;
        end
    };
end;
v8 = function(v23, v24) --[[ Line: 78 ]] --[[ Name: getFragmentType ]]
    -- upvalues: l_typeFromAST_0 (copy), l_isCompositeType_0 (copy)
    local v25 = v23:getFragment(v24);
    if v25 then
        local v26 = l_typeFromAST_0(v23:getSchema(), v25.typeCondition);
        if l_isCompositeType_0(v26) then
            return v26;
        end;
    end;
    return nil;
end;
return v7;