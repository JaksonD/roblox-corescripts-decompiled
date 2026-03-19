local l_Parent_0 = script.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local l_language_0 = l_Parent_0.language;
local _ = require(l_language_0.ast);
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
local v6 = require(l_Parent_0.type.definition);
local l_GraphQLList_0 = v6.GraphQLList;
local l_GraphQLNonNull_0 = v6.GraphQLNonNull;
local l_type_0 = l_Parent_0.type;
local _ = require(l_type_0.schema);
local function v11(v12, v13) --[[ Line: 33 ]] --[[ Name: typeFromAST ]]
    -- upvalues: l_Kind_0 (copy), v11 (copy), l_GraphQLList_0 (copy), l_GraphQLNonNull_0 (copy), l_invariant_0 (copy), l_inspect_0 (copy)
    local v14 = nil;
    if v13.kind == l_Kind_0.LIST_TYPE then
        v14 = v11(v12, v13.type);
        return v14 and l_GraphQLList_0.new(v14);
    elseif v13.kind == l_Kind_0.NON_NULL_TYPE then
        v14 = v11(v12, v13.type);
        return v14 and l_GraphQLNonNull_0.new(v14);
    elseif v13.kind == l_Kind_0.NAMED_TYPE then
        return v12:getType(v13.name.value);
    else
        l_invariant_0(false, "Unexpected type node: " .. l_inspect_0(v13));
        return nil;
    end;
end;
return {
    typeFromAST = v11
};