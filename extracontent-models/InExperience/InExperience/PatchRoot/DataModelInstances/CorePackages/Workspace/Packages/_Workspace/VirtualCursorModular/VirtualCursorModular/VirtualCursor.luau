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
local v10 = require(l_script_FirstAncestor_0.Controllers.InputController);
local v11 = require(l_script_FirstAncestor_0.Controllers.CursorController);
local v12 = require(l_script_FirstAncestor_0.Controllers.SelectionController);
local v13 = require(l_script_FirstAncestor_0.Controllers.SnapController);
local v14 = require(l_script_FirstAncestor_0.Enums);
local v15 = require(l_script_FirstAncestor_0.Properties);
local v16 = {};
v16.__index = v16;
v16.new = function() --[[ Line: 58 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), v10 (copy), l_FFlagEnableSnapInVirtualCursor_0 (copy), v13 (copy), v12 (copy), v14 (copy), v15 (copy), v16 (copy)
    local v17 = v11.new();
    local v18 = v10.new(v17);
    local v19 = if l_FFlagEnableSnapInVirtualCursor_0 then v13.new() else nil;
    local v20 = v12.new(v18, v17, v19);
    if l_FFlagEnableSnapInVirtualCursor_0 and v19 then
        v19:setMethodStrength(v14.SnapAssistMethod.Friction, v15.SnapFrictionStrength);
        v19:setMethodStrength(v14.SnapAssistMethod.Tracking, v15.SnapTrackingStrength);
        v19:setMethodStrength(v14.SnapAssistMethod.Centering, v15.SnapCenteringStrength);
    end;
    local v21 = setmetatable({
        _cursorPosition = Vector2.new(), 
        _selectedObject = nil, 
        _previouslySelectedObject = nil, 
        _wasDisabledFromOtherInput = false, 
        _lastInputTypeChangedEventConnection = nil, 
        _gamepadCursorEnabledConnection = nil, 
        _menuOpenedEventConnection = nil, 
        _cursorController = v17, 
        _inputController = v18, 
        _selectionController = v20, 
        _snapController = v19, 
        _boundToRenderStep = false, 
        _wasDisabledFromMenuOpen = false
    }, v16);
    v21:initialize();
    return v21;
end;
v16.Destroy = function(v22) --[[ Line: 91 ]] --[[ Name: Destroy ]]
    -- upvalues: l_RunService_0 (copy)
    local l__lastInputTypeChangedEventConnection_0 = v22._lastInputTypeChangedEventConnection;
    if l__lastInputTypeChangedEventConnection_0 then
        l__lastInputTypeChangedEventConnection_0:Disconnect();
        v22._lastInputTypeChangedEventConnection = nil;
    end;
    local l__gamepadCursorEnabledConnection_0 = v22._gamepadCursorEnabledConnection;
    if l__gamepadCursorEnabledConnection_0 then
        l__gamepadCursorEnabledConnection_0:Disconnect();
        v22._gamepadCursorEnabledConnection = nil;
    end;
    local l__menuOpenedEventConnection_0 = v22._menuOpenedEventConnection;
    if l__menuOpenedEventConnection_0 then
        l__menuOpenedEventConnection_0:Disconnect();
        v22._menuOpenedEventConnection = nil;
    end;
    if v22._boundToRenderStep then
        l_RunService_0:UnbindFromRenderStep("VirtualCursorStepped");
        v22._boundToRenderStep = false;
    end;
    if v22._inputController then
        v22._inputController:Destroy();
    end;
    if v22._cursorController then
        v22._cursorController:Destroy();
    end;
end;
v16.UpdateGamepadCursor = function(v26) --[[ Line: 124 ]] --[[ Name: UpdateGamepadCursor ]]
    -- upvalues: l_GamepadService_0 (copy), l_UserInputService_0 (copy)
    if l_GamepadService_0.GamepadCursorEnabled then
        v26:EnableVirtualCursor((l_UserInputService_0:GetMouseLocation()));
        return;
    else
        v26:EnableSelectionPreview();
        return;
    end;
end;
v16.initialize = function(v27) --[[ Line: 134 ]] --[[ Name: initialize ]]
    -- upvalues: l_UserInputService_0 (copy), l_GamepadService_0 (copy)
    v27._lastInputTypeChangedEventConnection = l_UserInputService_0.LastInputTypeChanged:Connect(function(v28) --[[ Line: 136 ]]
        -- upvalues: l_GamepadService_0 (ref), v27 (copy)
        if v28 ~= Enum.UserInputType.Gamepad1 and v28 ~= Enum.UserInputType.Focus and l_GamepadService_0.GamepadCursorEnabled then
            l_GamepadService_0.GamepadCursorEnabled = false;
            v27._wasDisabledFromOtherInput = true;
            return;
        else
            if v28 == Enum.UserInputType.Gamepad1 and v27._wasDisabledFromOtherInput then
                l_GamepadService_0.GamepadCursorEnabled = true;
                v27._wasDisabledFromOtherInput = false;
            end;
            return;
        end;
    end);
    v27._gamepadCursorEnabledConnection = l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"):Connect(function() --[[ Line: 152 ]]
        -- upvalues: v27 (copy)
        v27:UpdateGamepadCursor();
    end);
    v27:UpdateGamepadCursor();
end;
v16.onRenderStep = function(v29, v30) --[[ Line: 159 ]] --[[ Name: onRenderStep ]]
    v29._selectionController:onRenderStep(v30);
end;
v16.EnableVirtualCursor = function(v31, v32) --[[ Line: 163 ]] --[[ Name: EnableVirtualCursor ]]
    -- upvalues: l_GamepadService_0 (copy), v14 (copy), l_RunService_0 (copy), l_GuiService_0 (copy), l_FFlagVCWasDisabledFromMenuOpen_0 (copy)
    v31._cursorController:Enable(v32);
    l_GamepadService_0:SetGamepadCursorPosition(v32);
    v31._inputController:SetBehavior(v14.Behavior.VirtualCursor);
    if not v31._boundToRenderStep then
        l_RunService_0:BindToRenderStep("VirtualCursorStepped", Enum.RenderPriority.Input.Value + 1, function(v33) --[[ Line: 169 ]]
            -- upvalues: v31 (copy)
            v31:onRenderStep(v33);
        end);
        v31._boundToRenderStep = true;
    end;
    v31._menuOpenedEventConnection = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 175 ]]
        -- upvalues: l_GamepadService_0 (ref), l_FFlagVCWasDisabledFromMenuOpen_0 (ref), v31 (copy)
        l_GamepadService_0.GamepadCursorEnabled = false;
        if l_FFlagVCWasDisabledFromMenuOpen_0 then
            v31._wasDisabledFromMenuOpen = true;
        end;
    end);
end;
v16.EnableSelectionPreview = function(v34) --[[ Line: 183 ]] --[[ Name: EnableSelectionPreview ]]
    -- upvalues: v14 (copy), l_RunService_0 (copy), l_GuiService_0 (copy), l_FFlagVCWasDisabledFromMenuOpen_0 (copy)
    local l__menuOpenedEventConnection_1 = v34._menuOpenedEventConnection;
    if l__menuOpenedEventConnection_1 then
        l__menuOpenedEventConnection_1:Disconnect();
        v34._menuOpenedEventConnection = nil;
    end;
    v34._cursorController:Disable();
    v34._inputController:SetBehavior(v14.Behavior.SelectionPreview);
    if v34._boundToRenderStep then
        l_RunService_0:UnbindFromRenderStep("VirtualCursorStepped");
        v34._boundToRenderStep = false;
    end;
    l_GuiService_0.SelectedObject = nil;
    if not l_FFlagVCWasDisabledFromMenuOpen_0 or not v34._wasDisabledFromMenuOpen then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
    if l_FFlagVCWasDisabledFromMenuOpen_0 then
        v34._wasDisabledFromMenuOpen = false;
    end;
end;
return v16.new();