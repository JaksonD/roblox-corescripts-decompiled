local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("Responsive").Parent;
local v2 = require(l_Parent_0.AppCommonLib);
local l_Signal_0 = v2.Signal;
local l_FFlagLuaAppResponsiveEnginePreferredInput_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppResponsiveEnginePreferredInput;
local v5 = {
    Pointer = "Pointer", 
    Touch = "Touch", 
    Directional = "Directional"
};
local v6 = {
    [Enum.UserInputType.MouseButton1] = v5.Pointer, 
    [Enum.UserInputType.MouseButton2] = v5.Pointer, 
    [Enum.UserInputType.MouseButton3] = v5.Pointer, 
    [Enum.UserInputType.MouseWheel] = v5.Pointer, 
    [Enum.UserInputType.MouseMovement] = v5.Pointer, 
    [Enum.UserInputType.Keyboard] = v5.Pointer, 
    [Enum.UserInputType.TextInput] = v5.Pointer, 
    [Enum.UserInputType.Gamepad1] = v5.Directional, 
    [Enum.UserInputType.Gamepad2] = v5.Directional, 
    [Enum.UserInputType.Gamepad3] = v5.Directional, 
    [Enum.UserInputType.Gamepad4] = v5.Directional, 
    [Enum.UserInputType.Gamepad5] = v5.Directional, 
    [Enum.UserInputType.Gamepad6] = v5.Directional, 
    [Enum.UserInputType.Gamepad7] = v5.Directional, 
    [Enum.UserInputType.Gamepad8] = v5.Directional, 
    [Enum.UserInputType.Touch] = v5.Touch, 
    [Enum.UserInputType.None] = v5.Pointer
};
local v7 = l_Signal_0.new();
local v8 = {
    preferred = nil, 
    last = nil
};
local v9 = {
    [Enum.Platform.XBoxOne] = true, 
    [Enum.Platform.XBox360] = true, 
    [Enum.Platform.WiiU] = true, 
    [Enum.Platform.PS3] = true, 
    [Enum.Platform.PS4] = true, 
    [Enum.Platform.PS5] = true, 
    [Enum.Platform.Ouya] = true, 
    [Enum.Platform.AndroidTV] = true
};
local v10 = {
    [Enum.Platform.IOS] = true, 
    [Enum.Platform.Android] = true
};
local v11 = if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then {
    [Enum.PreferredInput.Gamepad] = v5.Directional, 
    [Enum.PreferredInput.Touch] = v5.Touch, 
    [Enum.PreferredInput.KeyboardAndMouse] = v5.Pointer
} else nil;
getPreferredInput = function() --[[ Line: 70 ]] --[[ Name: getPreferredInput ]]
    -- upvalues: l_FFlagLuaAppResponsiveEnginePreferredInput_0 (copy), l_UserInputService_0 (copy), v11 (copy), v5 (copy), v2 (copy), v9 (copy), v10 (copy)
    if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then
        return v11[l_UserInputService_0.PreferredInput or Enum.PreferredInput.KeyboardAndMouse] or v5.Pointer;
    else
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v13 = v2.isSpatial();
        local v14 = v9[l_l_UserInputService_0_Platform_0] or false;
        local v15 = v10[l_l_UserInputService_0_Platform_0] or false;
        if v13 then
            return v5.Pointer;
        elseif v14 then
            return v5.Directional;
        elseif v15 then
            return v5.Touch;
        else
            return v5.Pointer;
        end;
    end;
end;
updatePreferredInput = function() --[[ Line: 92 ]] --[[ Name: updatePreferredInput ]]
    -- upvalues: v8 (copy), v7 (copy)
    local v16 = getPreferredInput();
    if v16 ~= v8.preferred then
        v8.preferred = v16;
        if v8.last == nil then
            v8.last = v8.preferred;
        end;
        v7:fire();
    end;
end;
updateLastInput = function() --[[ Line: 103 ]] --[[ Name: updateLastInput ]]
    -- upvalues: v6 (copy), l_UserInputService_0 (copy), v8 (copy), v7 (copy)
    local v17 = v6[l_UserInputService_0:GetLastInputType()];
    if v17 and v17 ~= v8.last then
        v8.last = v17;
        v7:fire();
    end;
end;
init = function() --[[ Line: 111 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagLuaAppResponsiveEnginePreferredInput_0 (copy), l_UserInputService_0 (copy), v2 (copy)
    if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then
        l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(updatePreferredInput);
    end;
    l_UserInputService_0.GamepadConnected:Connect(updatePreferredInput);
    l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(updatePreferredInput);
    l_UserInputService_0:GetPropertyChangedSignal("MouseEnabled"):Connect(updatePreferredInput);
    l_UserInputService_0:GetPropertyChangedSignal("TouchEnabled"):Connect(updatePreferredInput);
    l_UserInputService_0:GetPropertyChangedSignal("GamepadEnabled"):Connect(updatePreferredInput);
    v2.connectToIsSpatialChanged(updatePreferredInput);
    l_UserInputService_0.LastInputTypeChanged:Connect(updateLastInput);
    updateLastInput();
    updatePreferredInput();
end;
init();
local v18 = {
    {
        Key = v5.Directional, 
        preferredInput = v5.Directional
    }, 
    {
        Key = v5.Pointer, 
        preferredInput = v5.Pointer
    }, 
    {
        Key = v5.Touch, 
        preferredInput = v5.Touch
    }
};
local v19 = {
    {
        Key = v5.Directional, 
        lastInput = v5.Directional
    }, 
    {
        Key = v5.Pointer, 
        lastInput = v5.Pointer
    }, 
    {
        Key = v5.Touch, 
        lastInput = v5.Touch
    }
};
return {
    Enum = v5, 
    preferredInputRules = v18, 
    lastInputRules = v19, 
    connect = function(v20) --[[ Line: 144 ]] --[[ Name: connect ]]
        -- upvalues: v7 (copy)
        return v7:connect(v20);
    end, 
    preferred = function() --[[ Line: 147 ]] --[[ Name: preferred ]]
        -- upvalues: v8 (copy)
        return v8.preferred;
    end, 
    last = function() --[[ Line: 150 ]] --[[ Name: last ]]
        -- upvalues: v8 (copy)
        return v8.last;
    end
};