local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v4 = {};
local l_buildASTSchema_0 = require(l_Parent_0.GraphQL).buildASTSchema;
local _ = require(script.Parent.types);
local l_getDocumentNodeFromSchema_0 = require(script.Parent["print-schema-with-directives"]).getDocumentNodeFromSchema;
local function v11(v8, v9) --[[ Line: 24 ]] --[[ Name: buildFixedSchema ]]
    -- upvalues: l_getDocumentNodeFromSchema_0 (copy), l_buildASTSchema_0 (copy), l_Object_0 (copy), l_Boolean_0 (copy)
    local v10 = l_getDocumentNodeFromSchema_0(v8);
    return l_buildASTSchema_0(v10, l_Object_0.assign({}, l_Boolean_0.toJSBoolean(v9) and v9 or {}));
end;
v4.fixSchemaAst = function(v12, v13) --[[ Line: 28 ]] --[[ Name: fixSchemaAst ]]
    -- upvalues: l_Boolean_0 (copy), v11 (copy)
    local v14 = nil;
    if not l_Boolean_0.toJSBoolean(v12.astNode) or not l_Boolean_0.toJSBoolean(v12.extensionASTNodes) then
        v14 = v11(v12, v13);
    end;
    if not l_Boolean_0.toJSBoolean(v12.astNode) and v14 and l_Boolean_0.toJSBoolean(v14.astNode) then
        v12.astNode = v14.astNode;
    end;
    if not l_Boolean_0.toJSBoolean(v12.extensionASTNodes) and v14 and l_Boolean_0.toJSBoolean(v14.astNode) then
        v12.extensionASTNodes = v14.extensionASTNodes;
    end;
    return v12;
end;
return v4;