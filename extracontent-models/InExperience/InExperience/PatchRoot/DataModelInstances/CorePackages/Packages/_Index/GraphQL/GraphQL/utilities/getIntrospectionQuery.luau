local l_Parent_0 = script.Parent.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local _ = require(script.Parent.Parent.language.directiveLocation);
getIntrospectionQuery = function(v3) --[[ Line: 39 ]] --[[ Name: getIntrospectionQuery ]]
    -- upvalues: l_Object_0 (copy)
    local v4 = l_Object_0.assign({
        descriptions = true, 
        specifiedByUrl = false, 
        directiveIsRepeatable = false, 
        schemaDescription = false, 
        inputValueDeprecation = false
    }, v3);
    local v5 = v4.descriptions and "description" or "";
    local v6 = v4.specifiedByUrl and "specifiedByUrl" or "";
    local v7 = v4.directiveIsRepeatable and "isRepeatable" or "";
    local v8 = if v4.schemaDescription then v5 else "";
    local function _(v9) --[[ Line: 55 ]] --[[ Name: inputDeprecation ]]
        -- upvalues: v4 (copy)
        if v4.inputValueDeprecation then
            return v9;
        else
            return "";
        end;
    end;
    return ("\n    query IntrospectionQuery {\n      __schema {\n        %s\n        queryType { name }\n        mutationType { name }\n        subscriptionType { name }\n        types {\n          ...FullType\n        }\n        directives {\n          name\n          %s\n          %s\n          locations\n          args%s {\n            ...InputValue\n          }\n        }\n      }\n    }\n\n    fragment FullType on __Type {\n      kind\n      name\n      %s\n      %s\n      fields(includeDeprecated: true) {\n        name\n        %s\n        args%s {\n          ...InputValue\n        }\n        type {\n          ...TypeRef\n        }\n        isDeprecated\n        deprecationReason\n      }\n      inputFields%s {\n        ...InputValue\n      }\n      interfaces {\n        ...TypeRef\n      }\n      enumValues(includeDeprecated: true) {\n        name\n        %s\n        isDeprecated\n        deprecationReason\n      }\n      possibleTypes {\n        ...TypeRef\n      }\n    }\n\n    fragment InputValue on __InputValue {\n      name\n      %s\n      type { ...TypeRef }\n      defaultValue\n      %s\n      %s\n    }\n\n    fragment TypeRef on __Type {\n      kind\n      name\n      ofType {\n        kind\n        name\n        ofType {\n          kind\n          name\n          ofType {\n            kind\n            name\n            ofType {\n              kind\n              name\n              ofType {\n                kind\n                name\n                ofType {\n                  kind\n                  name\n                  ofType {\n                    kind\n                    name\n                  }\n                }\n              }\n            }\n          }\n        }\n      }\n    }\n  "):format(v8, v5, v7, v4.inputValueDeprecation and "(includeDeprecated: true)" or "", v5, v6, v5, v4.inputValueDeprecation and "(includeDeprecated: true)" or "", v4.inputValueDeprecation and "(includeDeprecated: true)" or "", v5, v5, v4.inputValueDeprecation and "isDeprecated" or "", v4.inputValueDeprecation and "deprecationReason" or "");
end;
return {
    getIntrospectionQuery = getIntrospectionQuery
};