local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_FFlagVCWasDisabledFromMenuOpen_0 = require(l_Parent_1.SharedFlags).FFlagVCWasDisabledFromMenuOpen;
local l_Input_0 = require(l_Parent_0:WaitForChild("Input"));
local l_Interface_0 = require(l_Parent_0:WaitForChild("Interface"));
local l_OnRenderStep_0 = require(l_Parent_0:WaitForChild("OnRenderStep"));
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = false;
local v15 = false;
local function v17(v16) --[[ Line: 39 ]] --[[ Name: enableVirtualCursor ]]
    -- upvalues: v11 (ref), l_Interface_0 (copy), l_GamepadService_0 (copy), l_Input_0 (copy), l_RunService_0 (copy), v13 (ref), l_GuiService_0 (copy), l_FFlagVCWasDisabledFromMenuOpen_0 (copy), v15 (ref)
    if not v11 then
        return;
    else
        v16 = v16 or v11.CursorPosition;
        v11.Enabled = true;
        v11.CursorPosition = v16;
        l_Interface_0:EnableUI(v16);
        l_GamepadService_0:SetGamepadCursorPosition(v16);
        l_Input_0:EnableInput();
        l_Input_0:DisablePreview();
        l_RunService_0:BindToRenderStep("VirtualCursorStepped", Enum.RenderPriority.Input.Value + 1, v11.OnRenderStep);
        v13 = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 59 ]]
            -- upvalues: l_FFlagVCWasDisabledFromMenuOpen_0 (ref), v15 (ref), l_GamepadService_0 (ref)
            if l_FFlagVCWasDisabledFromMenuOpen_0 then
                v15 = true;
            end;
            l_GamepadService_0.GamepadCursorEnabled = false;
        end);
        return;
    end;
end;
local function v18() --[[ Line: 67 ]] --[[ Name: disableVirtualCursor ]]
    -- upvalues: v11 (ref), v13 (ref), l_Interface_0 (copy), l_Input_0 (copy), l_RunService_0 (copy), l_FFlagVCWasDisabledFromMenuOpen_0 (copy), v15 (ref), l_GuiService_0 (copy)
    if not v11.Enabled then
        return;
    else
        v13:Disconnect();
        v13 = nil;
        v11.PreviouslySelectedObject = nil;
        l_Interface_0:DisableUI();
        l_Input_0:DisableInput();
        l_Input_0:EnablePreview();
        l_RunService_0:UnbindFromRenderStep("VirtualCursorStepped");
        if v11.SelectedObject then
            if l_FFlagVCWasDisabledFromMenuOpen_0 and not v15 then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
            l_GuiService_0.SelectedObject = nil;
            if not l_FFlagVCWasDisabledFromMenuOpen_0 then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
            v11.SelectedObject = nil;
        end;
        if l_FFlagVCWasDisabledFromMenuOpen_0 then
            v15 = false;
        end;
        v11.Enabled = false;
        return;
    end;
end;
local v19 = {};
v19.__index = v19;
v19.GetEnabled = function(v20) --[[ Line: 104 ]] --[[ Name: GetEnabled ]]
    return v20.Enabled;
end;
v19.new = function() --[[ Line: 108 ]] --[[ Name: new ]]
    -- upvalues: l_OnRenderStep_0 (copy), v12 (ref), l_UserInputService_0 (copy), l_GamepadService_0 (copy), v14 (ref), l_Input_0 (copy), v19 (copy), v11 (ref)
    local v21 = {
        Enabled = false, 
        CursorPosition = Vector2.new(), 
        SelectedObject = nil, 
        PreviouslySelectedObject = nil
    };
    v21.OnRenderStep = function(v22) --[[ Line: 116 ]]
        -- upvalues: l_OnRenderStep_0 (ref), v21 (copy)
        l_OnRenderStep_0(v21, v22);
    end;
    v12 = l_UserInputService_0.LastInputTypeChanged:Connect(function(v23) --[[ Line: 120 ]]
        -- upvalues: l_GamepadService_0 (ref), v14 (ref)
        if v23 ~= Enum.UserInputType.Gamepad1 and v23 ~= Enum.UserInputType.Focus and l_GamepadService_0.GamepadCursorEnabled then
            l_GamepadService_0.GamepadCursorEnabled = false;
            v14 = true;
            return;
        else
            if v23 == Enum.UserInputType.Gamepad1 and v14 then
                l_GamepadService_0.GamepadCursorEnabled = true;
                v14 = false;
            end;
            return;
        end;
    end);
    l_Input_0:EnablePreview();
    setmetatable(v21, v19);
    v11 = v21;
    return v21;
end;
l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function() --[[ Line: 143 ]]
    -- upvalues: l_GamepadService_0 (copy), v11 (ref), l_UserInputService_0 (copy), v17 (copy), v18 (copy)
    local l_GamepadCursorEnabled_0 = l_GamepadService_0.GamepadCursorEnabled;
    if v11 then
        if l_GamepadCursorEnabled_0 then
            local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
            v17(l_l_UserInputService_0_MouseLocation_0);
            return;
        else
            v18();
        end;
    end;
end);
return v19.new();