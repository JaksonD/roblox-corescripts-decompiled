local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v13 = {
    getGamepadConnected = function(v4) --[[ Line: 13 ]] --[[ Name: getGamepadConnected ]]
        -- upvalues: l_UserInputService_0 (copy)
        return l_UserInputService_0:GetGamepadConnected(v4);
    end, 
    getGamepadState = function(v5) --[[ Line: 17 ]] --[[ Name: getGamepadState ]]
        -- upvalues: l_UserInputService_0 (copy)
        return l_UserInputService_0:GetGamepadState(v5);
    end, 
    getNavigationGamepads = function() --[[ Line: 21 ]] --[[ Name: getNavigationGamepads ]]
        -- upvalues: l_UserInputService_0 (copy)
        return l_UserInputService_0:GetNavigationGamepads();
    end, 
    getSelection = function() --[[ Line: 25 ]] --[[ Name: getSelection ]]
        -- upvalues: l_GuiService_0 (copy)
        return l_GuiService_0.SelectedCoreObject;
    end, 
    setSelection = function(v6) --[[ Line: 29 ]] --[[ Name: setSelection ]]
        -- upvalues: l_GuiService_0 (copy)
        l_GuiService_0.SelectedCoreObject = v6;
    end, 
    subscribeToSelectionChanged = function(v7) --[[ Line: 33 ]] --[[ Name: subscribeToSelectionChanged ]]
        -- upvalues: l_GuiService_0 (copy)
        return l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(v7);
    end, 
    subscribeToRenderStepped = function(v8) --[[ Line: 37 ]] --[[ Name: subscribeToRenderStepped ]]
        -- upvalues: l_RunService_0 (copy)
        return l_RunService_0.RenderStepped:Connect(v8);
    end, 
    subscribeToGamepadConnected = function(v9) --[[ Line: 41 ]] --[[ Name: subscribeToGamepadConnected ]]
        -- upvalues: l_UserInputService_0 (copy)
        return l_UserInputService_0.GamepadConnected:Connect(v9);
    end, 
    subscribeToGamepadDisconnected = function(v10) --[[ Line: 45 ]] --[[ Name: subscribeToGamepadDisconnected ]]
        -- upvalues: l_UserInputService_0 (copy)
        return l_UserInputService_0.GamepadDisconnected:Connect(v10);
    end, 
    subscribeToInputBegan = function(v11) --[[ Line: 49 ]] --[[ Name: subscribeToInputBegan ]]
        -- upvalues: l_UserInputService_0 (copy)
        return l_UserInputService_0.InputBegan:Connect(v11);
    end, 
    subscribeToInputEnded = function(v12) --[[ Line: 53 ]] --[[ Name: subscribeToInputEnded ]]
        -- upvalues: l_UserInputService_0 (copy)
        return l_UserInputService_0.InputEnded:Connect(v12);
    end
};
local v16 = {
    getSelection = function() --[[ Line: 63 ]] --[[ Name: getSelection ]]
        -- upvalues: l_GuiService_0 (copy)
        return l_GuiService_0.SelectedObject;
    end, 
    setSelection = function(v14) --[[ Line: 67 ]] --[[ Name: setSelection ]]
        -- upvalues: l_GuiService_0 (copy)
        l_GuiService_0.SelectedObject = v14;
    end, 
    subscribeToSelectionChanged = function(v15) --[[ Line: 71 ]] --[[ Name: subscribeToSelectionChanged ]]
        -- upvalues: l_GuiService_0 (copy)
        return l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(v15);
    end, 
    getGamepadConnected = v13.getGamepadConnected, 
    getGamepadState = v13.getGamepadState, 
    getNavigationGamepads = v13.getNavigationGamepads, 
    subscribeToRenderStepped = v13.subscribeToRenderStepped, 
    subscribeToGamepadConnected = v13.subscribeToGamepadConnected, 
    subscribeToGamepadDisconnected = v13.subscribeToGamepadDisconnected, 
    subscribeToInputBegan = v13.subscribeToInputBegan, 
    subscribeToInputEnded = v13.subscribeToInputEnded
};
return function(v17) --[[ Line: 87 ]]
    -- upvalues: l_CoreGui_0 (copy), v13 (copy), v16 (copy)
    if v17:IsDescendantOf(l_CoreGui_0) then
        return v13;
    else
        if v17:FindFirstAncestorWhichIsA("PlayerGui") == nil then
            error("Gamepad navigation not supported. Must be a child of CoreGui or a PlayerGui");
        end;
        return v16;
    end;
end;