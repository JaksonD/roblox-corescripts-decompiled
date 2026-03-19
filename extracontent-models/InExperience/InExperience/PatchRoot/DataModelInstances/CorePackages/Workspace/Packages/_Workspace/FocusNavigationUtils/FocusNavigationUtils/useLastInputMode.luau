local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(script.Parent.useLastInputMethod);
local v5 = require(script.Parent.useFocusedTextBox);
local l_VRService_0 = require(l_Parent_0.MockableProxyServices).VRService;
local l_GamepadService_0 = game:GetService("GamepadService");
local l_GuiService_0 = game:GetService("GuiService");
local l_FFlagFixSelectionWithWebViews_0 = require(l_Parent_0.SharedFlags).FFlagFixSelectionWithWebViews;
local v10 = {
    Keyboard = "Focus", 
    Gamepad = "Focus", 
    Mouse = "Cursor", 
    Touch = "Cursor", 
    None = "None"
};
local v11 = {
    [Enum.KeyCode.Up] = true, 
    [Enum.KeyCode.Down] = true, 
    [Enum.KeyCode.Left] = true, 
    [Enum.KeyCode.Right] = true, 
    [Enum.KeyCode.W] = true, 
    [Enum.KeyCode.A] = true, 
    [Enum.KeyCode.S] = true, 
    [Enum.KeyCode.D] = true, 
    [Enum.KeyCode.Escape] = true
};
return function() --[[ Line: 39 ]]
    -- upvalues: v4 (copy), v10 (copy), v5 (copy), v3 (copy), l_GamepadService_0 (copy), l_UserInputService_0 (copy), l_FFlagFixSelectionWithWebViews_0 (copy), l_GuiService_0 (copy), v11 (copy), l_VRService_0 (copy)
    local v12 = v4();
    local v13 = v10[v12];
    local v14 = v5();
    local v15, v16 = v3.useState(l_GamepadService_0.GamepadCursorEnabled);
    local v17, v18 = v3.useState(false);
    local v19 = v3.useRef(v12 == "Keyboard" and "Cursor" or v13);
    v3.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: l_UserInputService_0 (ref), l_FFlagFixSelectionWithWebViews_0 (ref), l_GuiService_0 (ref), v11 (ref), v14 (copy), v18 (copy)
        local v22 = l_UserInputService_0.InputBegan:Connect(function(v20) --[[ Line: 50 ]]
            -- upvalues: l_FFlagFixSelectionWithWebViews_0 (ref), l_GuiService_0 (ref), v11 (ref), v14 (ref), v18 (ref)
            local v21 = not l_FFlagFixSelectionWithWebViews_0 or l_GuiService_0.CoreGuiNavigationEnabled;
            if v11[v20.KeyCode] and v14 == nil and v21 then
                v18(true);
                return;
            else
                v18(false);
                return;
            end;
        end);
        return function() --[[ Line: 61 ]]
            -- upvalues: v22 (copy)
            v22:Disconnect();
        end;
    end, {
        v14
    });
    v3.useEffect(function() --[[ Line: 65 ]]
        -- upvalues: l_GamepadService_0 (ref), v16 (copy)
        local v23 = l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function() --[[ Line: 66 ]]
            -- upvalues: v16 (ref), l_GamepadService_0 (ref)
            v16(l_GamepadService_0.GamepadCursorEnabled);
        end);
        return function() --[[ Line: 70 ]]
            -- upvalues: v23 (copy)
            v23:Disconnect();
        end;
    end, {});
    if l_VRService_0.VREnabled then
        v13 = "Cursor";
    elseif v12 == "Keyboard" then
        v13 = (not not v17 or v19.current == "Focus") and "Focus" or "Cursor";
    elseif v12 == "Gamepad" then
        v13 = v15 and "Cursor" or "Focus";
    end;
    v19.current = v13;
    return v13;
end;