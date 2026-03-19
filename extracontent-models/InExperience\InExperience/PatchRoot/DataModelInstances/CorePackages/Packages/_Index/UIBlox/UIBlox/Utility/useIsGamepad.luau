local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Enums.InputType);
local v3 = require(l_Parent_0.useInputType);
return function() --[[ Line: 11 ]] --[[ Name: useIsGamepad ]]
    -- upvalues: v3 (copy), v2 (copy)
    return v3() == v2.Gamepad;
end;