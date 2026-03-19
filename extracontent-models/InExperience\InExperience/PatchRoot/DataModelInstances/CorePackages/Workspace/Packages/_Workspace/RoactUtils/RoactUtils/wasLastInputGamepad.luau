local l_UserInputService_0 = game:GetService("UserInputService");
local v1 = require(script.Parent.isGamepadInput);
return function() --[[ Line: 5 ]] --[[ Name: wasLastInputGamepad ]]
    -- upvalues: l_UserInputService_0 (copy), v1 (copy)
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    return v1(l_l_UserInputService_0_LastInputType_0);
end;