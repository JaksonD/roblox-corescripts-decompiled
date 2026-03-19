local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Boolean_0 = require(l_Parent_1.LuauPolyfill).Boolean;
local _ = require(l_Parent_0.core);
local _ = require(script.Parent.types);
local l_useMutation_0 = require(script.Parent.Parent.hooks).useMutation;
v0.Mutation = function(v7) --[[ Line: 31 ]] --[[ Name: Mutation ]]
    -- upvalues: l_useMutation_0 (copy), l_Boolean_0 (copy)
    local v8, v9 = table.unpack(l_useMutation_0(v7.mutation, v7), 1, 2);
    if l_Boolean_0.toJSBoolean(v7.children) then
        return v7.children(v8, v9);
    else
        return nil;
    end;
end;
return v0;