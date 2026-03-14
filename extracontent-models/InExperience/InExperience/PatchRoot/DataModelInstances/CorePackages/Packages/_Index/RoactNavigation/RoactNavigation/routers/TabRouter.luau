local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v4 = require(l_Parent_0.SwitchRouter);
local v5 = require(l_Parent_1.BackBehavior);
return function(v6, v7) --[[ Line: 11 ]]
    -- upvalues: v5 (copy), l_Object_0 (copy), v4 (copy)
    local v8 = {
        resetOnBlur = false, 
        backBehavior = v5.InitialRoute
    };
    if v7 then
        v8 = l_Object_0.assign(v8, v7);
    end;
    return v4(v6, v8);
end;