local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v2.Object;
local l_Set_0 = v2.Set;
local l_Array_0 = v2.Array;
require(script.Parent.Parent.globals);
local l_isNonNullObject_0 = require(script.Parent.objects).isNonNullObject;
local function v12(v7) --[[ Line: 22 ]] --[[ Name: deepFreeze ]]
    -- upvalues: l_Set_0 (copy), l_isNonNullObject_0 (copy), l_Object_0 (copy), l_Array_0 (copy)
    local v8 = l_Set_0.new({
        v7
    });
    for _, v10 in v8 do
        if l_isNonNullObject_0(v10) then
            if not table.isfrozen(v10) then
                l_Object_0.freeze(v10);
            end;
            l_Array_0.forEach(l_Object_0.keys(v10), function(v11) --[[ Line: 30 ]]
                -- upvalues: l_isNonNullObject_0 (ref), v10 (copy), v8 (copy)
                if l_isNonNullObject_0(v10[v11]) then
                    v8:add(v10[v11]);
                end;
            end);
        end;
    end;
    return v7;
end;
v0.maybeDeepFreeze = function(v13) --[[ Line: 41 ]] --[[ Name: maybeDeepFreeze ]]
    -- upvalues: v12 (copy)
    if _G.__DEV__ then
        v12(v13);
    end;
    return v13;
end;
return v0;