local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v4 = {};
local l_Kind_0 = require(l_Parent_0.GraphQL).Kind;
local l_mergeDirectives_0 = require(script.Parent.directives).mergeDirectives;
local l_mergeNamedTypeArray_0 = require(script.Parent["merge-named-type-array"]).mergeNamedTypeArray;
local _ = require(script.Parent["merge-typedefs_types"]);
v4.mergeUnion = function(v9, v10, v11) --[[ Line: 26 ]] --[[ Name: mergeUnion ]]
    -- upvalues: l_Boolean_0 (copy), l_mergeDirectives_0 (copy), l_Kind_0 (copy), l_mergeNamedTypeArray_0 (copy), l_Object_0 (copy)
    if v10 then
        return {
            name = v9.name, 
            description = if l_Boolean_0.toJSBoolean(v9.description) then v9.description else v10.description, 
            directives = l_mergeDirectives_0(v9.directives, v10.directives, v11), 
            kind = if not (not (v11 and l_Boolean_0.toJSBoolean(v11.convertExtensions)) and v9.kind ~= "UnionTypeDefinition") or v10.kind == "UnionTypeDefinition" then l_Kind_0.UNION_TYPE_DEFINITION else l_Kind_0.UNION_TYPE_EXTENSION, 
            loc = v9.loc, 
            types = l_mergeNamedTypeArray_0(v9.types, v10.types, v11)
        };
    elseif v11 and l_Boolean_0.toJSBoolean(v11.convertExtensions) then
        return (l_Object_0.assign({}, v9, {
            kind = l_Kind_0.UNION_TYPE_DEFINITION
        }));
    else
        return v9;
    end;
end;
return v4;