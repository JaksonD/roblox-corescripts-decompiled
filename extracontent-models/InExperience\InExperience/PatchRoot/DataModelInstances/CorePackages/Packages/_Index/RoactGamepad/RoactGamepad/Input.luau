local v0 = require(script.Parent.debugPrint);
local v1 = require(script.Parent.InputBindingKind);
local v2 = require(script.Parent.Config);
local v3 = {
    [Enum.UserInputType.Keyboard] = true, 
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local v4 = {};
local function _() --[[ Line: 26 ]] --[[ Name: initializeEngineGamepadState ]]
    return {
        gamepadConnectedConnection = nil, 
        gamepadDisconnectedConnection = nil, 
        onStepConnections = 0, 
        primaryGamepadState = {}
    };
end;
local function _(v6) --[[ Line: 35 ]] --[[ Name: getEngineState ]]
    -- upvalues: v4 (copy)
    if v4[v6] == nil then
        v4[v6] = {
            gamepadConnectedConnection = nil, 
            gamepadDisconnectedConnection = nil, 
            onStepConnections = 0, 
            primaryGamepadState = {}
        };
    end;
    return v4[v6];
end;
local function v16(v8) --[[ Line: 43 ]] --[[ Name: updatePrimaryGamepad ]]
    -- upvalues: v4 (copy)
    if v4[v8] == nil then
        v4[v8] = {
            gamepadConnectedConnection = nil, 
            gamepadDisconnectedConnection = nil, 
            onStepConnections = 0, 
            primaryGamepadState = {}
        };
    end;
    local v9 = v4[v8];
    local l_Gamepad1_0 = Enum.UserInputType.Gamepad1;
    for _, v12 in ipairs(v8.getNavigationGamepads()) do
        if v8.getGamepadConnected(v12) then
            l_Gamepad1_0 = v12;
            break;
        end;
    end;
    local v13 = v8.getGamepadState(l_Gamepad1_0);
    v9.primaryGamepadState = {};
    for _, v15 in ipairs(v13) do
        v9.primaryGamepadState[v15.KeyCode] = v15;
    end;
end;
local function _(v17, v18) --[[ Line: 64 ]] --[[ Name: getInputEvent ]]
    -- upvalues: v0 (copy)
    return function(v19) --[[ Line: 65 ]]
        -- upvalues: v18 (copy), v0 (ref), v17 (copy)
        if v18(v19) then
            v0("[EVENT] Process input: ", v19.KeyCode, "-", v19.UserInputState);
            v17(v19);
        end;
    end;
end;
local function v24(v21, v22) --[[ Line: 73 ]] --[[ Name: wrapWithGamepadStateListener ]]
    -- upvalues: v4 (copy), v16 (copy)
    if v4[v21] == nil then
        v4[v21] = {
            gamepadConnectedConnection = nil, 
            gamepadDisconnectedConnection = nil, 
            onStepConnections = 0, 
            primaryGamepadState = {}
        };
    end;
    local v23 = v4[v21];
    if v23.onStepConnections == 0 then
        v16(v21);
        v23.gamepadConnectedConnection = v21.subscribeToGamepadConnected(function() --[[ Line: 78 ]]
            -- upvalues: v16 (ref), v21 (copy)
            v16(v21);
        end);
        v23.gamepadDisconnectedConnection = v21.subscribeToGamepadDisconnected(function() --[[ Line: 81 ]]
            -- upvalues: v16 (ref), v21 (copy)
            v16(v21);
        end);
    end;
    v23.onStepConnections = v23.onStepConnections + 1;
    return function() --[[ Line: 87 ]]
        -- upvalues: v22 (copy), v23 (copy)
        v22:Disconnect();
        v23.onStepConnections = v23.onStepConnections - 1;
        if v23.onStepConnections == 0 then
            v23.gamepadConnectedConnection:Disconnect();
            v23.gamepadConnectedConnection = nil;
            v23.gamepadDisconnectedConnection:Disconnect();
            v23.gamepadDisconnectedConnection = nil;
        end;
    end;
end;
local function v51(v25, v26) --[[ Line: 101 ]] --[[ Name: connectToEvent ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), v0 (copy), v4 (copy), v24 (copy)
    local function _(v27) --[[ Line: 102 ]] --[[ Name: matchesBindingKeyCode ]]
        -- upvalues: v2 (ref), v25 (copy)
        if v2.DebugKeyboardBindings then
            local v28 = v2.DebugKeyboardBindings[v25.keyCode] or {};
            if table.find(v28, v27.KeyCode) then
                return true;
            end;
        end;
        return v27.KeyCode == v25.keyCode;
    end;
    if v25.kind == v1.Begin then
        local function v33(v30) --[[ Line: 114 ]] --[[ Name: matchInput ]]
            -- upvalues: v3 (ref), v2 (ref), v25 (copy)
            local v31 = v3[v30.UserInputType];
            if v31 then
                v31 = false;
                if v30.UserInputState == Enum.UserInputState.Begin then
                    if v2.DebugKeyboardBindings then
                        local v32 = v2.DebugKeyboardBindings[v25.keyCode] or {};
                        if table.find(v32, v30.KeyCode) then
                            return true;
                        end;
                    end;
                    v31 = v30.KeyCode == v25.keyCode;
                end;
            end;
            return v31;
        end;
        local l_subscribeToInputBegan_0 = v26.subscribeToInputBegan;
        local l_action_0 = v25.action;
        l_subscribeToInputBegan_0 = l_subscribeToInputBegan_0(function(v36) --[[ Line: 65 ]]
            -- upvalues: v33 (copy), v0 (ref), l_action_0 (copy)
            if v33(v36) then
                v0("[EVENT] Process input: ", v36.KeyCode, "-", v36.UserInputState);
                l_action_0(v36);
            end;
        end);
        return function() --[[ Line: 122 ]]
            -- upvalues: l_subscribeToInputBegan_0 (copy)
            l_subscribeToInputBegan_0:Disconnect();
        end;
    elseif v25.kind == v1.End then
        local function v40(v37) --[[ Line: 126 ]] --[[ Name: matchInput ]]
            -- upvalues: v3 (ref), v2 (ref), v25 (copy)
            local v38 = v3[v37.UserInputType];
            if v38 then
                v38 = false;
                if v37.UserInputState == Enum.UserInputState.End then
                    if v2.DebugKeyboardBindings then
                        local v39 = v2.DebugKeyboardBindings[v25.keyCode] or {};
                        if table.find(v39, v37.KeyCode) then
                            return true;
                        end;
                    end;
                    v38 = v37.KeyCode == v25.keyCode;
                end;
            end;
            return v38;
        end;
        local l_subscribeToInputEnded_0 = v26.subscribeToInputEnded;
        local l_action_1 = v25.action;
        l_subscribeToInputEnded_0 = l_subscribeToInputEnded_0(function(v43) --[[ Line: 65 ]]
            -- upvalues: v40 (copy), v0 (ref), l_action_1 (copy)
            if v40(v43) then
                v0("[EVENT] Process input: ", v43.KeyCode, "-", v43.UserInputState);
                l_action_1(v43);
            end;
        end);
        return function() --[[ Line: 134 ]]
            -- upvalues: l_subscribeToInputEnded_0 (copy)
            l_subscribeToInputEnded_0:Disconnect();
        end;
    elseif v25.kind == v1.Step then
        if v4[v26] == nil then
            v4[v26] = {
                gamepadConnectedConnection = nil, 
                gamepadDisconnectedConnection = nil, 
                onStepConnections = 0, 
                primaryGamepadState = {}
            };
        end;
        local v44 = v4[v26];
        local v46 = v26.subscribeToRenderStepped(function(v45) --[[ Line: 140 ]]
            -- upvalues: v25 (copy), v44 (copy)
            v25.action(v44.primaryGamepadState[v25.keyCode], v45);
        end);
        return (v24(v26, v46));
    elseif v25.kind == v1.MoveStep then
        if v4[v26] == nil then
            v4[v26] = {
                gamepadConnectedConnection = nil, 
                gamepadDisconnectedConnection = nil, 
                onStepConnections = 0, 
                primaryGamepadState = {}
            };
        end;
        local v47 = v4[v26];
        local v50 = v26.subscribeToRenderStepped(function(v48) --[[ Line: 149 ]]
            -- upvalues: v47 (copy), v25 (copy)
            local v49 = {
                [Enum.KeyCode.Thumbstick1] = v47.primaryGamepadState[Enum.KeyCode.Thumbstick1], 
                [Enum.KeyCode.DPadUp] = v47.primaryGamepadState[Enum.KeyCode.DPadUp], 
                [Enum.KeyCode.DPadDown] = v47.primaryGamepadState[Enum.KeyCode.DPadDown], 
                [Enum.KeyCode.DPadLeft] = v47.primaryGamepadState[Enum.KeyCode.DPadLeft], 
                [Enum.KeyCode.DPadRight] = v47.primaryGamepadState[Enum.KeyCode.DPadRight]
            };
            v25.action(v49, v48);
        end);
        return (v24(v26, v50));
    else
        return nil;
    end;
end;
local function _(v52) --[[ Line: 167 ]] --[[ Name: makeInputBinding ]]
    return function(v53, v54, v55) --[[ Line: 168 ]]
        -- upvalues: v52 (copy)
        local v56 = false;
        if typeof(v53) == "EnumItem" then
            v56 = v53.EnumType == Enum.KeyCode;
        end;
        assert(v56, "Invalid argument #1: expected a member of Enum.KeyCode");
        assert(typeof(v54) == "function", "Invalid argument #2: expected a function");
        return {
            kind = v52, 
            keyCode = v53, 
            action = v54, 
            meta = v55
        };
    end;
end;
local function v59(v58) --[[ Line: 184 ]] --[[ Name: onMoveStepInputBinding ]]
    -- upvalues: v1 (copy)
    return {
        kind = v1.MoveStep, 
        action = v58
    };
end;
local v61 = {
    getUniqueKey = function(v60) --[[ Line: 191 ]] --[[ Name: getUniqueKey ]]
        if v60.keyCode then
            return tostring(v60.kind) .. "-" .. tostring(v60.keyCode);
        else
            return (tostring(v60.kind));
        end;
    end, 
    connectToEvent = v51
};
local v62 = {};
local l_Begin_0 = v1.Begin;
local l_l_Begin_0_0 = l_Begin_0 --[[ copy: 17 -> 18 ]];
v62.onBegin = function(v65, v66, v67) --[[ Line: 168 ]]
    -- upvalues: l_l_Begin_0_0 (copy)
    local v68 = false;
    if typeof(v65) == "EnumItem" then
        v68 = v65.EnumType == Enum.KeyCode;
    end;
    assert(v68, "Invalid argument #1: expected a member of Enum.KeyCode");
    assert(typeof(v66) == "function", "Invalid argument #2: expected a function");
    return {
        kind = l_l_Begin_0_0, 
        keyCode = v65, 
        action = v66, 
        meta = v67
    };
end;
l_Begin_0 = v1.End;
local l_l_Begin_0_1 = l_Begin_0 --[[ copy: 17 -> 19 ]];
v62.onEnd = function(v70, v71, v72) --[[ Line: 168 ]]
    -- upvalues: l_l_Begin_0_1 (copy)
    local v73 = false;
    if typeof(v70) == "EnumItem" then
        v73 = v70.EnumType == Enum.KeyCode;
    end;
    assert(v73, "Invalid argument #1: expected a member of Enum.KeyCode");
    assert(typeof(v71) == "function", "Invalid argument #2: expected a function");
    return {
        kind = l_l_Begin_0_1, 
        keyCode = v70, 
        action = v71, 
        meta = v72
    };
end;
l_Begin_0 = v1.Step;
v62.onStep = function(v74, v75, v76) --[[ Line: 168 ]]
    -- upvalues: l_Begin_0 (copy)
    local v77 = false;
    if typeof(v74) == "EnumItem" then
        v77 = v74.EnumType == Enum.KeyCode;
    end;
    assert(v77, "Invalid argument #1: expected a member of Enum.KeyCode");
    assert(typeof(v75) == "function", "Invalid argument #2: expected a function");
    return {
        kind = l_Begin_0, 
        keyCode = v74, 
        action = v75, 
        meta = v76
    };
end;
v62.onMoveStep = v59;
v61.PublicInterface = v62;
return v61;