local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Object_0 = v3.Object;
local l_InvariantError_0 = require(l_Parent_0.jsutils.invariant).InvariantError;
local _ = require(script.Parent.Parent.core.types);
v0.validateOperation = function(v8) --[[ Line: 19 ]] --[[ Name: validateOperation ]]
    -- upvalues: l_Object_0 (copy), l_Array_0 (copy), l_InvariantError_0 (copy)
    local v9 = {
        "query", 
        "operationName", 
        "variables", 
        "extensions", 
        "context"
    };
    for _, v11 in ipairs(l_Object_0.keys(v8)) do
        if l_Array_0.indexOf(v9, v11) < 0 then
            error(l_InvariantError_0.new(("illegal argument: %s"):format(v11)));
        end;
    end;
    return v8;
end;
return v0;