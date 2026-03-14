local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local _ = require(l_Parent_0.GraphQL);
local _ = require(script.Parent["merge-typedefs_types"]);
local l_compareNodes_0 = require(l_Parent_0.Utils).compareNodes;
local function _(v8, v9) --[[ Line: 25 ]] --[[ Name: alreadyExists ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy)
    return not not l_Boolean_0.toJSBoolean(l_Array_0.find(v8, function(v10) --[[ Line: 26 ]]
        -- upvalues: v9 (copy)
        return v10.name.value == v9.name.value;
    end));
end;
v4.mergeNamedTypeArray = function(v12, v13, v14) --[[ Line: 30 ]] --[[ Name: mergeNamedTypeArray ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy), l_compareNodes_0 (copy)
    local v15 = if v12 ~= nil then v12 else {};
    local v16 = if v13 ~= nil then v13 else {};
    local v17 = if v14 ~= nil then v14 else {};
    local v22 = l_Array_0.concat({}, v16, l_Array_0.filter(v15, function(v18) --[[ Line: 44 ]]
        -- upvalues: l_Boolean_0 (ref), v16 (copy), l_Array_0 (ref)
        local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
        local l_v16_0 = v16;
        return not l_toJSBoolean_0(not not l_Boolean_0.toJSBoolean(l_Array_0.find(l_v16_0, function(v21) --[[ Line: 26 ]]
            -- upvalues: v18 (copy)
            return v21.name.value == v18.name.value;
        end)));
    end));
    if v17 and l_Boolean_0.toJSBoolean(v17.sort) then
        l_Array_0.sort(v22, l_compareNodes_0);
    end;
    return v22;
end;
return v4;