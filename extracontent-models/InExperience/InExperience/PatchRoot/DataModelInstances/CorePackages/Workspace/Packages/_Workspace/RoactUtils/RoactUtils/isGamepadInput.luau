local l_Parent_0 = script.Parent.Parent;
local l_InputTypeConstants_0 = require(l_Parent_0.InputType).InputTypeConstants;
local l_getInputGroup_0 = require(l_Parent_0.InputType).getInputGroup;
return function(v3) --[[ Line: 5 ]] --[[ Name: isGamepadInput ]]
    -- upvalues: l_getInputGroup_0 (copy), l_InputTypeConstants_0 (copy)
    return l_getInputGroup_0(v3) == l_InputTypeConstants_0.Gamepad;
end;