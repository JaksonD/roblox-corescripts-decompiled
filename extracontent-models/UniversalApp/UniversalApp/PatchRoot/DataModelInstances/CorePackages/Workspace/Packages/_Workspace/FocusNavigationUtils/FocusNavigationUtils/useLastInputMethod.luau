local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.React);
local v3 = {
    [Enum.UserInputType.MouseButton1] = "Mouse", 
    [Enum.UserInputType.MouseButton2] = "Mouse", 
    [Enum.UserInputType.MouseButton3] = "Mouse", 
    [Enum.UserInputType.MouseWheel] = "Mouse", 
    [Enum.UserInputType.MouseMovement] = "Mouse", 
    [Enum.UserInputType.Touch] = "Touch", 
    [Enum.UserInputType.Keyboard] = "Keyboard", 
    [Enum.UserInputType.Focus] = nil, 
    [Enum.UserInputType.Accelerometer] = nil, 
    [Enum.UserInputType.Gyro] = nil, 
    [Enum.UserInputType.Gamepad1] = "Gamepad", 
    [Enum.UserInputType.Gamepad2] = "Gamepad", 
    [Enum.UserInputType.Gamepad3] = "Gamepad", 
    [Enum.UserInputType.Gamepad4] = "Gamepad", 
    [Enum.UserInputType.Gamepad5] = "Gamepad", 
    [Enum.UserInputType.Gamepad6] = "Gamepad", 
    [Enum.UserInputType.Gamepad7] = "Gamepad", 
    [Enum.UserInputType.Gamepad8] = "Gamepad", 
    [Enum.UserInputType.TextInput] = nil, 
    [Enum.UserInputType.InputMethod] = nil, 
    [Enum.UserInputType.None] = nil
};
return function() --[[ Line: 43 ]] --[[ Name: useLastInputMethod ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy), v2 (copy)
    local v4 = v3[l_UserInputService_0:GetLastInputType()] or "None";
    local v5, v6 = v2.useState(v4);
    v2.useEffect(function() --[[ Line: 46 ]]
        -- upvalues: l_UserInputService_0 (ref), v3 (ref), v6 (copy)
        local v9 = l_UserInputService_0.LastInputTypeChanged:Connect(function(v7) --[[ Line: 47 ]]
            -- upvalues: v3 (ref), v6 (ref)
            local v8 = v3[v7];
            if v8 then
                v6(v8);
            end;
        end);
        return function() --[[ Line: 54 ]]
            -- upvalues: v9 (copy)
            v9:Disconnect();
        end;
    end, {});
    return v5;
end;