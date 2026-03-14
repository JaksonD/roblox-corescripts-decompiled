local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.Input.InputMode);
local v2 = {
    [Enum.UserInputType.MouseButton1] = v1.Pointer, 
    [Enum.UserInputType.MouseButton2] = v1.Pointer, 
    [Enum.UserInputType.MouseButton3] = v1.Pointer, 
    [Enum.UserInputType.MouseMovement] = v1.Pointer, 
    [Enum.UserInputType.MouseWheel] = v1.Pointer, 
    [Enum.UserInputType.None] = v1.Pointer, 
    [Enum.UserInputType.TextInput] = v1.Pointer, 
    [Enum.UserInputType.Gamepad1] = v1.Directional, 
    [Enum.UserInputType.Gamepad2] = v1.Directional, 
    [Enum.UserInputType.Gamepad3] = v1.Directional, 
    [Enum.UserInputType.Gamepad4] = v1.Directional, 
    [Enum.UserInputType.Gamepad5] = v1.Directional, 
    [Enum.UserInputType.Gamepad6] = v1.Directional, 
    [Enum.UserInputType.Gamepad7] = v1.Directional, 
    [Enum.UserInputType.Gamepad8] = v1.Directional, 
    [Enum.UserInputType.Keyboard] = v1.Directional, 
    [Enum.UserInputType.Touch] = v1.Touch
};
return function(v3) --[[ Line: 28 ]] --[[ Name: getInputMode ]]
    -- upvalues: v2 (copy)
    return v2[v3];
end;