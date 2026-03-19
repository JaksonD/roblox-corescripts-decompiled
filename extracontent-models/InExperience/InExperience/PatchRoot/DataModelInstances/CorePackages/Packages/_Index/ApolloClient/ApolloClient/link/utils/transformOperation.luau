local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local _ = require(script.Parent.Parent.core.types);
local l_getOperationName_0 = require(script.Parent.Parent.Parent.utilities).getOperationName;
v0.transformOperation = function(v5) --[[ Line: 20 ]] --[[ Name: transformOperation ]]
    -- upvalues: l_Boolean_0 (copy), l_getOperationName_0 (copy)
    local v6 = {
        variables = l_Boolean_0.toJSBoolean(v5.variables) and v5.variables or {}, 
        extensions = l_Boolean_0.toJSBoolean(v5.extensions) and v5.extensions or {}, 
        operationName = v5.operationName, 
        query = v5.query
    };
    if not l_Boolean_0.toJSBoolean(v6.operationName) then
        if typeof(v6.query) ~= "string" then
            v6.operationName = l_Boolean_0.toJSBoolean(l_getOperationName_0(v6.query)) and l_getOperationName_0(v6.query) or nil;
            return v6;
        else
            v6.operationName = "";
        end;
    end;
    return v6;
end;
return v0;