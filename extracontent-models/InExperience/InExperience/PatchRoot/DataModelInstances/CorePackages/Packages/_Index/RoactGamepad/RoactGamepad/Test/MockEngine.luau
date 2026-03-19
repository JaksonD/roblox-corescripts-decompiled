local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(script.Parent.Parent.createSignal);
local v3 = {};
v3.__index = v3;
local v4 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true, 
    [Enum.UserInputType.Keyboard] = true
};
local v5 = {
    Enum.KeyCode.Thumbstick2, 
    Enum.KeyCode.DPadDown, 
    Enum.KeyCode.DPadUp, 
    Enum.KeyCode.ButtonL3, 
    Enum.KeyCode.ButtonL2, 
    Enum.KeyCode.DPadRight, 
    Enum.KeyCode.ButtonR1, 
    Enum.KeyCode.ButtonSelect, 
    Enum.KeyCode.ButtonStart, 
    Enum.KeyCode.ButtonY, 
    Enum.KeyCode.DPadLeft, 
    Enum.KeyCode.ButtonR2, 
    Enum.KeyCode.ButtonR3, 
    Enum.KeyCode.ButtonX, 
    Enum.KeyCode.Thumbstick1, 
    Enum.KeyCode.ButtonB, 
    Enum.KeyCode.ButtonA, 
    Enum.KeyCode.ButtonL1
};
local v6 = {
    [Enum.KeyCode.DPadUp] = "NextSelectionUp", 
    [Enum.KeyCode.Up] = "NextSelectionUp", 
    [Enum.KeyCode.DPadDown] = "NextSelectionDown", 
    [Enum.KeyCode.Down] = "NextSelectionDown", 
    [Enum.KeyCode.DPadLeft] = "NextSelectionLeft", 
    [Enum.KeyCode.Left] = "NextSelectionLeft", 
    [Enum.KeyCode.DPadRight] = "NextSelectionRight", 
    [Enum.KeyCode.Right] = "NextSelectionRight"
};
local function _(v7) --[[ Line: 53 ]] --[[ Name: defaultInputObject ]]
    return {
        KeyCode = v7, 
        Delta = Vector3.new(), 
        Position = Vector3.new(), 
        UserInputType = Enum.UserInputType.Gamepad1, 
        UserInputState = Enum.UserInputState.End
    };
end;
local function _(v9) --[[ Line: 64 ]] --[[ Name: wrapDisconnector ]]
    return {
        Disconnect = v9
    };
end;
v3.new = function() --[[ Line: 70 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    local v11 = setmetatable({
        __mockSelected = nil, 
        __connectedGamepads = {}, 
        __gamepadStates = {}, 
        __selectionChangedSignal = v2(), 
        __inputSignal = v2(), 
        __renderStepped = v2(), 
        __gamepadConnected = v2(), 
        __gamepadDisconnected = v2(), 
        __interface = nil
    }, v3);
    local v23 = {
        getSelection = function() --[[ Line: 88 ]] --[[ Name: getSelection ]]
            -- upvalues: v11 (copy)
            return v11.__mockSelected;
        end, 
        setSelection = function(v12) --[[ Line: 91 ]] --[[ Name: setSelection ]]
            -- upvalues: v11 (copy)
            v11.__mockSelected = v12;
            v11.__selectionChangedSignal:fire();
        end, 
        getGamepadConnected = function(v13) --[[ Line: 97 ]] --[[ Name: getGamepadConnected ]]
            -- upvalues: v11 (copy)
            return v11.__connectedGamepads[v13] or false;
        end, 
        getGamepadState = function(v14) --[[ Line: 100 ]] --[[ Name: getGamepadState ]]
            -- upvalues: v11 (copy)
            if v11.__gamepadStates[v14] == nil then
                v11:__initializeGamepadState(v14);
            end;
            return v11.__gamepadStates[v14];
        end, 
        getNavigationGamepads = function(_) --[[ Line: 109 ]] --[[ Name: getNavigationGamepads ]]
            -- upvalues: v1 (ref), v11 (copy)
            return v1.Dictionary.keys(v11.__connectedGamepads);
        end, 
        subscribeToSelectionChanged = function(v16) --[[ Line: 112 ]] --[[ Name: subscribeToSelectionChanged ]]
            -- upvalues: v11 (copy)
            return {
                Disconnect = v11.__selectionChangedSignal:subscribe(v16)
            };
        end, 
        subscribeToInputBegan = function(v17) --[[ Line: 117 ]] --[[ Name: subscribeToInputBegan ]]
            -- upvalues: v11 (copy)
            return {
                Disconnect = v11.__inputSignal:subscribe(v17)
            };
        end, 
        subscribeToInputChanged = function(v18) --[[ Line: 122 ]] --[[ Name: subscribeToInputChanged ]]
            -- upvalues: v11 (copy)
            return {
                Disconnect = v11.__inputSignal:subscribe(v18)
            };
        end, 
        subscribeToInputEnded = function(v19) --[[ Line: 127 ]] --[[ Name: subscribeToInputEnded ]]
            -- upvalues: v11 (copy)
            return {
                Disconnect = v11.__inputSignal:subscribe(v19)
            };
        end, 
        subscribeToRenderStepped = function(v20) --[[ Line: 132 ]] --[[ Name: subscribeToRenderStepped ]]
            -- upvalues: v11 (copy)
            return {
                Disconnect = v11.__renderStepped:subscribe(v20)
            };
        end, 
        subscribeToGamepadConnected = function(v21) --[[ Line: 137 ]] --[[ Name: subscribeToGamepadConnected ]]
            -- upvalues: v11 (copy)
            return {
                Disconnect = v11.__gamepadConnected:subscribe(v21)
            };
        end, 
        subscribeToGamepadDisconnected = function(v22) --[[ Line: 142 ]] --[[ Name: subscribeToGamepadDisconnected ]]
            -- upvalues: v11 (copy)
            return {
                Disconnect = v11.__gamepadDisconnected:subscribe(v22)
            };
        end
    };
    v11.__interface = v23;
    return v11, v23;
end;
v3.__initializeGamepadState = function(v24, v25) --[[ Line: 154 ]] --[[ Name: __initializeGamepadState ]]
    -- upvalues: v1 (copy), v5 (copy)
    v24.__gamepadStates[v25] = v1.List.map(v5, function(v26) --[[ Line: 155 ]]
        return {
            KeyCode = v26, 
            Delta = Vector3.new(), 
            Position = Vector3.new(), 
            UserInputType = Enum.UserInputType.Gamepad1, 
            UserInputState = Enum.UserInputState.End
        };
    end);
end;
v3.simulateSelectionChanged = function(v27, v28) --[[ Line: 160 ]] --[[ Name: simulateSelectionChanged ]]
    v27.__mockSelected = v28;
    v27.__selectionChangedSignal:fire();
end;
v3.simulateInput = function(v29, v30) --[[ Line: 165 ]] --[[ Name: simulateInput ]]
    -- upvalues: v1 (copy), v4 (copy), v6 (copy)
    v30 = v1.Dictionary.join({
        Delta = Vector3.new(), 
        Position = Vector3.new(), 
        UserInputType = Enum.UserInputType.Gamepad1
    }, v30);
    local v31 = false;
    if typeof(v30.KeyCode) == "EnumItem" then
        v31 = v30.KeyCode.EnumType == Enum.KeyCode;
    end;
    assert(v31, "Invalid inputObject.KeyCode: expected a member of Enum.KeyCode");
    assert(v4[v30.UserInputType], "Invalid inputObject.UserInputType");
    local l_KeyCode_0 = v30.KeyCode;
    v31 = v6[l_KeyCode_0];
    if v31 ~= nil and v29.__interface.getSelection() ~= nil then
        v29.__interface.setSelection(v29.__interface.getSelection()[v31]);
    end;
    if v30.UserInputType ~= Enum.UserInputType.Keyboard then
        local l_UserInputType_0 = v30.UserInputType;
        if not v29.__connectedGamepads[l_UserInputType_0] then
            v29:connectGamepad(l_UserInputType_0);
        end;
        local v34 = v29.__gamepadStates[l_UserInputType_0];
        local v36 = v1.List.findWhere(v34, function(v35) --[[ Line: 201 ]]
            -- upvalues: l_KeyCode_0 (copy)
            return v35.KeyCode == l_KeyCode_0;
        end);
        if v36 == nil then
            error(("Invalid InputObject: KeyCode %s is not possible on %s"):format(tostring(l_KeyCode_0), (tostring(l_UserInputType_0))), 2);
        end;
        for v37, v38 in pairs(v30) do
            v34[v36][v37] = v38;
        end;
    end;
    v29.__inputSignal:fire(v30);
end;
v3.renderStep = function(v39, v40) --[[ Line: 222 ]] --[[ Name: renderStep ]]
    if v40 == nil then
        v40 = 0.03333333333333333;
    end;
    v39.__renderStepped:fire(v40);
end;
v3.connectGamepad = function(v41, v42) --[[ Line: 230 ]] --[[ Name: connectGamepad ]]
    local v43 = false;
    if typeof(v42) == "EnumItem" then
        v43 = v42.EnumType == Enum.UserInputType;
    end;
    assert(v43, "Invalid argument #1: expected a member of Enum.UserInputType");
    v41.__connectedGamepads[v42] = true;
    v41:__initializeGamepadState(v42);
    v41.__gamepadConnected:fire(v42);
end;
v3.disconnectGamepad = function(v44, v45) --[[ Line: 242 ]] --[[ Name: disconnectGamepad ]]
    local v46 = false;
    if typeof(v45) == "EnumItem" then
        v46 = v45.EnumType == Enum.UserInputType;
    end;
    assert(v46, "Invalid argument #1: expected a member of Enum.UserInputType");
    v44.__connectedGamepads[v45] = nil;
    v44.__gamepadDisconnected:fire(v45);
end;
return v3;