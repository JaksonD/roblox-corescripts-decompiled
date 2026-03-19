local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local l_print_0 = require(l_Parent_0.GraphQL).print;
local _ = require(script.Parent.Parent.core.types);
local v8 = nil;
local v9 = {
    includeQuery = true, 
    includeExtensions = false
};
local v10 = {
    accept = "*/*", 
    ["content-type"] = "application/json"
};
local v11 = {
    method = "POST"
};
v5.fallbackHttpConfig = {
    http = v9, 
    headers = v10, 
    options = v11
};
v5.selectHttpOptionsAndBody = function(v12, v13, ...) --[[ Line: 112 ]] --[[ Name: selectHttpOptionsAndBody ]]
    -- upvalues: l_Object_0 (copy), l_Array_0 (copy), v8 (ref), l_Boolean_0 (copy), l_print_0 (copy)
    local v14 = {
        ...
    };
    local v15 = l_Object_0.assign({}, v13.options, {
        headers = v13.headers, 
        credentials = v13.credentials
    });
    local v16 = nil;
    v16 = if v13.http ~= nil then v13.http else {};
    l_Array_0.forEach(v14, function(v17) --[[ Line: 131 ]]
        -- upvalues: v15 (ref), l_Object_0 (ref), v8 (ref), l_Boolean_0 (ref), v16 (ref)
        v15 = l_Object_0.assign({}, v15, v17.options, {
            headers = l_Object_0.assign({}, v15.headers, v8(v17.headers))
        });
        if l_Boolean_0.toJSBoolean(v17.credentials) then
            v15.credentials = v17.credentials;
        end;
        v16 = l_Object_0.assign({}, v16, v17.http);
    end);
    local l_operationName_0 = v12.operationName;
    local l_extensions_0 = v12.extensions;
    local l_variables_0 = v12.variables;
    local l_query_0 = v12.query;
    local v22 = {
        operationName = l_operationName_0, 
        variables = l_variables_0
    };
    if v16.includeExtensions then
        v22.extensions = l_extensions_0;
    end;
    if v16.includeQuery then
        v22.query = l_print_0(l_query_0);
    end;
    return {
        options = v15, 
        body = v22
    };
end;
v8 = function(v23) --[[ Line: 163 ]] --[[ Name: headersToLowerCase ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
    if v23 ~= nil then
        local v24 = {};
        l_Array_0.forEach(l_Object_0.keys(v23), function(v25) --[[ Line: 166 ]]
            -- upvalues: v24 (copy), v23 (copy)
            v24[string.lower(v25)] = v23[v25];
        end);
        return v24;
    else
        return v23;
    end;
end;
return v5;