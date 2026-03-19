local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualCursorModular");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local v7 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableSnapInVirtualCursor_0 = v7.FFlagEnableSnapInVirtualCursor;
local l_FFlagVCWasDisabledFromMenuOpen_0 = v7.FFlagVCWasDisabledFromMenuOpen;
local l_FFlagEnableVirtualCursorDebugging_0 = v7.FFlagEnableVirtualCursorDebugging;
local v11 = require(l_script_FirstAncestor_0.Controllers.InputController);
local v12 = require(l_script_FirstAncestor_0.Controllers.CursorController);
local v13 = require(l_script_FirstAncestor_0.Controllers.SelectionController);
local v14 = require(l_script_FirstAncestor_0.Controllers.SnapController);
local v15 = require(l_script_FirstAncestor_0.Enums);
local v16 = require(l_script_FirstAncestor_0.Properties);
local v17 = {};
v17.__index = v17;
v17.new = function() --[[ Line: 59 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy), v11 (copy), l_FFlagEnableSnapInVirtualCursor_0 (copy), v14 (copy), v13 (copy), v15 (copy), v16 (copy), v17 (copy)
    local v18 = v12.new();
    local v19 = v11.new(v18);
    local v20 = if l_FFlagEnableSnapInVirtualCursor_0 then v14.new() else nil;
    local v21 = v13.new(v19, v18, v20);
    if l_FFlagEnableSnapInVirtualCursor_0 and v20 then
        v20:setMethodStrength(v15.SnapAssistMethod.Friction, v16.SnapFrictionStrength);
        v20:setMethodStrength(v15.SnapAssistMethod.Tracking, v16.SnapTrackingStrength);
        v20:setMethodStrength(v15.SnapAssistMethod.Centering, v16.SnapCenteringStrength);
    end;
    local v22 = setmetatable({
        _cursorPosition = Vector2.new(), 
        _selectedObject = nil, 
        _previouslySelectedObject = nil, 
        _wasDisabledFromOtherInput = false, 
        _lastInputTypeChangedEventConnection = nil, 
        _gamepadCursorEnabledConnection = nil, 
        _menuOpenedEventConnection = nil, 
        _cursorController = v18, 
        _inputController = v19, 
        _selectionController = v21, 
        _snapController = v20, 
        _boundToRenderStep = false, 
        _wasDisabledFromMenuOpen = false
    }, v17);
    v22:initialize();
    return v22;
end;
v17.Destroy = function(v23) --[[ Line: 92 ]] --[[ Name: Destroy ]]
    -- upvalues: l_RunService_0 (copy)
    local l__lastInputTypeChangedEventConnection_0 = v23._lastInputTypeChangedEventConnection;
    if l__lastInputTypeChangedEventConnection_0 then
        l__lastInputTypeChangedEventConnection_0:Disconnect();
        v23._lastInputTypeChangedEventConnection = nil;
    end;
    local l__gamepadCursorEnabledConnection_0 = v23._gamepadCursorEnabledConnection;
    if l__gamepadCursorEnabledConnection_0 then
        l__gamepadCursorEnabledConnection_0:Disconnect();
        v23._gamepadCursorEnabledConnection = nil;
    end;
    local l__menuOpenedEventConnection_0 = v23._menuOpenedEventConnection;
    if l__menuOpenedEventConnection_0 then
        l__menuOpenedEventConnection_0:Disconnect();
        v23._menuOpenedEventConnection = nil;
    end;
    if v23._boundToRenderStep then
        l_RunService_0:UnbindFromRenderStep("VirtualCursorStepped");
        v23._boundToRenderStep = false;
    end;
    if v23._inputController then
        v23._inputController:Destroy();
    end;
    if v23._cursorController then
        v23._cursorController:Destroy();
    end;
end;
v17.UpdateGamepadCursor = function(v27) --[[ Line: 125 ]] --[[ Name: UpdateGamepadCursor ]]
    -- upvalues: l_GamepadService_0 (copy), l_UserInputService_0 (copy)
    if l_GamepadService_0.GamepadCursorEnabled then
        v27:EnableVirtualCursor((l_UserInputService_0:GetMouseLocation()));
        return;
    else
        v27:EnableSelectionPreview();
        return;
    end;
end;
v17.initialize = function(v28) --[[ Line: 135 ]] --[[ Name: initialize ]]
    -- upvalues: l_UserInputService_0 (copy), l_GamepadService_0 (copy), l_FFlagEnableVirtualCursorDebugging_0 (copy)
    v28._lastInputTypeChangedEventConnection = l_UserInputService_0.LastInputTypeChanged:Connect(function(v29) --[[ Line: 137 ]]
        -- upvalues: l_GamepadService_0 (ref), v28 (copy), l_FFlagEnableVirtualCursorDebugging_0 (ref)
        if v29 ~= Enum.UserInputType.Gamepad1 and v29 ~= Enum.UserInputType.Focus and l_GamepadService_0.GamepadCursorEnabled then
            l_GamepadService_0.GamepadCursorEnabled = false;
            v28._wasDisabledFromOtherInput = true;
        elseif v29 == Enum.UserInputType.Gamepad1 and v28._wasDisabledFromOtherInput then
            l_GamepadService_0.GamepadCursorEnabled = true;
            v28._wasDisabledFromOtherInput = false;
        end;
        if l_FFlagEnableVirtualCursorDebugging_0 then
            print("LastInputTypeChanged", v29, l_GamepadService_0.GamepadCursorEnabled, v28._wasDisabledFromOtherInput);
        end;
    end);
    v28._gamepadCursorEnabledConnection = l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function() --[[ Line: 161 ]]
        -- upvalues: v28 (copy)
        v28:UpdateGamepadCursor();
    end);
    v28:UpdateGamepadCursor();
end;
v17.onRenderStep = function(v30, v31) --[[ Line: 168 ]] --[[ Name: onRenderStep ]]
    v30._selectionController:onRenderStep(v31);
end;
v17.EnableVirtualCursor = function(v32, v33) --[[ Line: 172 ]] --[[ Name: EnableVirtualCursor ]]
    -- upvalues: l_GamepadService_0 (copy), v15 (copy), l_RunService_0 (copy), l_GuiService_0 (copy), l_FFlagVCWasDisabledFromMenuOpen_0 (copy)
    v32._cursorController:Enable(v33);
    l_GamepadService_0:SetGamepadCursorPosition(v33);
    v32._inputController:SetBehavior(v15.Behavior.VirtualCursor);
    if not v32._boundToRenderStep then
        l_RunService_0:BindToRenderStep("VirtualCursorStepped", Enum.RenderPriority.Input.Value + 1, function(v34) --[[ Line: 178 ]]
            -- upvalues: v32 (copy)
            v32:onRenderStep(v34);
        end);
        v32._boundToRenderStep = true;
    end;
    v32._menuOpenedEventConnection = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 184 ]]
        -- upvalues: l_GamepadService_0 (ref), l_FFlagVCWasDisabledFromMenuOpen_0 (ref), v32 (copy)
        l_GamepadService_0.GamepadCursorEnabled = false;
        if l_FFlagVCWasDisabledFromMenuOpen_0 then
            v32._wasDisabledFromMenuOpen = true;
        end;
    end);
end;
v17.EnableSelectionPreview = function(v35) --[[ Line: 192 ]] --[[ Name: EnableSelectionPreview ]]
    -- upvalues: v15 (copy), l_RunService_0 (copy), l_GuiService_0 (copy), l_FFlagVCWasDisabledFromMenuOpen_0 (copy)
    local l__menuOpenedEventConnection_1 = v35._menuOpenedEventConnection;
    if l__menuOpenedEventConnection_1 then
        l__menuOpenedEventConnection_1:Disconnect();
        v35._menuOpenedEventConnection = nil;
    end;
    v35._cursorController:Disable();
    v35._inputController:SetBehavior(v15.Behavior.SelectionPreview);
    if v35._boundToRenderStep then
        l_RunService_0:UnbindFromRenderStep("VirtualCursorStepped");
        v35._boundToRenderStep = false;
    end;
    l_GuiService_0.SelectedObject = nil;
    if not l_FFlagVCWasDisabledFromMenuOpen_0 or not v35._wasDisabledFromMenuOpen then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
    if l_FFlagVCWasDisabledFromMenuOpen_0 then
        v35._wasDisabledFromMenuOpen = false;
    end;
end;
return v17.new();