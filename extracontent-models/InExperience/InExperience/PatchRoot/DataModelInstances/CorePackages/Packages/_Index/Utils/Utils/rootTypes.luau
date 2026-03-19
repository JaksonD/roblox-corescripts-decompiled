local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Set_0 = v1.Set;
local v7 = {};
local _ = require(l_Parent_0.GraphQL);
local l_memoize1_0 = require(script.Parent.memoize).memoize1;
local v10 = nil;
local v11 = nil;
v7.getDefinedRootType = function(v12, v13) --[[ Line: 32 ]] --[[ Name: getDefinedRootType ]]
    -- upvalues: v10 (ref), l_Error_0 (copy)
    local v14 = v10(v12):get(v13);
    if v14 == nil then
        error(l_Error_0.new(("Root type for operation \"%s\" not defined by the given schema."):format((tostring(v13)))));
    end;
    return v14;
end;
local function _(v15) --[[ Line: 47 ]] --[[ Name: setToArray ]]
    local v16 = {};
    v15:forEach(function(v17) --[[ Line: 49 ]]
        -- upvalues: v16 (copy)
        table.insert(v16, v17);
    end);
    return v16;
end;
v7.getRootTypeNames = l_memoize1_0(function(v19) --[[ Line: 55 ]]
    -- upvalues: v11 (ref), l_Set_0 (copy), l_Array_0 (copy)
    local v20 = v11(v19);
    local l_new_0 = l_Set_0.new;
    local l_map_0 = l_Array_0.map;
    local l_concat_0 = l_Array_0.concat;
    local v24 = {};
    local v25 = {};
    v20:forEach(function(v26) --[[ Line: 49 ]]
        -- upvalues: v25 (copy)
        table.insert(v25, v26);
    end);
    return l_new_0(l_map_0(l_concat_0(v24, v25), function(v27) --[[ Line: 59 ]]
        return v27.name;
    end));
end);
v11 = l_memoize1_0(function(v28) --[[ Line: 67 ]]
    -- upvalues: v10 (ref), l_Set_0 (copy)
    local v29 = v10(v28);
    return l_Set_0.new(v29:values());
end);
v7.getRootTypes = v11;
v10 = l_memoize1_0(function(v30) --[[ Line: 75 ]]
    -- upvalues: l_Map_0 (copy), l_Boolean_0 (copy)
    local v31 = l_Map_0.new();
    local v32 = v30:getQueryType();
    if l_Boolean_0.toJSBoolean(v32) then
        v31:set("query", v32);
    end;
    local v33 = v30:getMutationType();
    if l_Boolean_0.toJSBoolean(v33) then
        v31:set("mutation", v33);
    end;
    local v34 = v30:getSubscriptionType();
    if l_Boolean_0.toJSBoolean(v34) then
        v31:set("subscription", v34);
    end;
    return v31;
end);
v7.getRootTypeMap = v10;
return v7;