local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_Error_0 = v1.Error;
local v5 = {};
local _ = nil;
local v7 = nil;
v7 = setmetatable({}, {
    __index = l_Error_0
});
v7.__index = v7;
v7.new = function(v8, v9) --[[ Line: 47 ]] --[[ Name: new ]]
    -- upvalues: l_Error_0 (copy), v7 (ref)
    local v10 = if v9 ~= nil then v9 else "";
    local v11 = setmetatable(l_Error_0.new(v10), v7);
    v11.errors = v8;
    v11.name = "AggregateError";
    l_Error_0.captureStackTrace(v11, v7.new);
    return v11;
end;
local v15 = {
    __call = function(_, v13, v14) --[[ Line: 68 ]]
        -- upvalues: v7 (ref)
        return v7.new(v13, v14);
    end
};
v5.AggregateError = setmetatable(v7, v15);
v5.isAggregateError = function(v16) --[[ Line: 86 ]] --[[ Name: isAggregateError ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
    local v17 = false;
    if l_Array_0.indexOf(l_Object_0.keys(v16), "errors") ~= -1 then
        v17 = l_Array_0.isArray(v16.errors);
    end;
    return v17;
end;
return v5;