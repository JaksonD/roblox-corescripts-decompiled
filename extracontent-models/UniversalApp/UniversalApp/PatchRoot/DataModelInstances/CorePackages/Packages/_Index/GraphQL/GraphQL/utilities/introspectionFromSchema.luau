local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.Parent.LuauPolyfill).Object;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local _ = require(l_Parent_0.type.schema);
local l_parse_0 = require(l_Parent_0.language.parser).parse;
local l_executeSync_0 = require(l_Parent_0.execution.execute).executeSync;
local l_getIntrospectionQuery_0 = require(script.Parent.getIntrospectionQuery).getIntrospectionQuery;
return {
    introspectionFromSchema = function(v7, v8) --[[ Line: 37 ]] --[[ Name: introspectionFromSchema ]]
        -- upvalues: l_Object_0 (copy), l_parse_0 (copy), l_getIntrospectionQuery_0 (copy), l_executeSync_0 (copy), l_invariant_0 (copy)
        local v9 = l_Object_0.assign({
            specifiedByUrl = true, 
            directiveIsRepeatable = true, 
            schemaDescription = true, 
            inputValueDeprecation = true
        }, v8);
        local v10 = l_parse_0(l_getIntrospectionQuery_0(v9));
        local v11 = l_executeSync_0({
            schema = v7, 
            document = v10
        });
        l_invariant_0(not v11.errors and v11.data);
        return v11.data;
    end
};