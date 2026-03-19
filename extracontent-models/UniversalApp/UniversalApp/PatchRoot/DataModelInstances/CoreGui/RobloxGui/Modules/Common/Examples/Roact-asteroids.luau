local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils();
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_Parent_0.RoactUtilities.ExternalEventConnection);
local v9 = require(l_CorePackages_0.Packages.Rodux);
local v10 = require(l_CorePackages_0.Packages.RoactRodux);
local v11 = require(l_CorePackages_0.Packages.Cryo);
local function v15(v12, v13) --[[ Line: 27 ]] --[[ Name: playerInputReducer ]]
    -- upvalues: v11 (copy)
    v12 = v12 or {
        left = 0, 
        right = 0, 
        up = 0, 
        pause = 0
    };
    if v13.type == "SetPlayerInput" then
        local v14 = {
            [v13.playerInput] = v13.value
        };
        return v11.Dictionary.join(v12, v14);
    else
        return v12;
    end;
end;
local function v23(v16, v17) --[[ Line: 45 ]] --[[ Name: playerReducer ]]
    -- upvalues: v11 (copy)
    v16 = v16 or {
        position = Vector2.new(0, 0), 
        velocity = Vector2.new(0, 0), 
        angle = 0, 
        turnRate = 1.5707963267948966, 
        throttleRate = 10
    };
    if v17.type == "GameStep" then
        local l_inputs_0 = v17.inputs;
        local l_delta_0 = v17.delta;
        local v20 = Vector2.new(math.sin(v16.angle), -math.cos(v16.angle));
        local v21 = l_inputs_0.right - l_inputs_0.left;
        local l_up_0 = l_inputs_0.up;
        return v11.Dictionary.join(v16, {
            position = v16.position + v16.velocity * l_delta_0, 
            velocity = v16.velocity + l_up_0 * v16.throttleRate * l_delta_0 * v20, 
            angle = v16.angle + v21 * v16.turnRate * l_delta_0
        });
    elseif v17.type == "SetPlayerRotation" then
        return v11.Dictionary.join(v16, {
            angle = v17.value
        });
    else
        return v16;
    end;
end;
local function _(v24, v25) --[[ Line: 74 ]] --[[ Name: timeReducer ]]
    v24 = v24 or 0;
    if v25.type == "GameStep" then
        return v24 + v25.delta;
    else
        return v24;
    end;
end;
local function v38(v27, v28) --[[ Line: 84 ]] --[[ Name: asteroidsReducer ]]
    local function v29() --[[ Line: 85 ]] --[[ Name: initAsteroids ]]
        return {
            {
                position = Vector2.new(-5, -5), 
                velocity = Vector2.new(1, 0), 
                size = 5
            }, 
            {
                position = Vector2.new(-5, 5), 
                velocity = Vector2.new(1, 0), 
                size = 3
            }, 
            {
                position = Vector2.new(5, 5), 
                velocity = Vector2.new(0, -1), 
                size = 5
            }, 
            {
                position = Vector2.new(5, -5), 
                velocity = Vector2.new(0, 1), 
                size = 3
            }
        };
    end;
    v27 = v27 or v29();
    if v28.type == "GameStep" then
        local l_delta_1 = v28.delta;
        local v31 = {};
        for v32, v33 in pairs(v27) do
            local l_X_0 = v33.position.X;
            local l_Y_0 = v33.position.Y;
            local l_X_1 = v33.velocity.X;
            local l_Y_1 = v33.velocity.Y;
            v31[v32] = {
                position = Vector2.new(l_X_0 + l_X_1 * l_delta_1, l_Y_0 + l_Y_1 * l_delta_1), 
                velocity = Vector2.new(l_X_1, l_Y_1), 
                size = v33.size
            };
        end;
        return v31;
    else
        return v27;
    end;
end;
local function _(v39) --[[ Line: 135 ]] --[[ Name: pausePressed ]]
    local v40 = false;
    if v39.playerInput == "pause" then
        v40 = v39.value == 1;
    end;
    return v40;
end;
local function _(v42, v43) --[[ Line: 139 ]] --[[ Name: pauseReducer ]]
    v42 = v42 or false;
    if v43.type == "SetPlayerInput" then
        local v44 = false;
        if v43.playerInput == "pause" then
            v44 = v43.value == 1;
        end;
        if v44 then
            return not v42;
        end;
    end;
    return v42;
end;
local function v53(v46, v47) --[[ Line: 149 ]] --[[ Name: reducer ]]
    -- upvalues: v15 (copy), v23 (copy), v38 (copy)
    local v48 = false;
    v46 = v46 or {};
    local v49 = {
        playerInputs = v15(v46.playerInputs, v47)
    };
    local v50 = v46.paused or false;
    local v51;
    if v47.type == "SetPlayerInput" then
        local v52 = false;
        if v47.playerInput == "pause" then
            v52 = v47.value == 1;
        end;
        if v52 then
            v51 = not v50;
            v48 = true;
        end;
    end;
    if not v48 then
        v51 = v50;
    end;
    v48 = false;
    v49.paused = v51;
    v49.player = v23(v46.player, v47);
    v50 = v46.time or 0;
    v49.time = if v47.type == "GameStep" then v50 + v47.delta else v50;
    v49.asteroids = v38(v46.asteroids, v47);
    return v49;
end;
local v54 = v7.Component:extend("Camera");
v54.init = function(v55) --[[ Line: 164 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy)
    v55.cameraRef = v7.createRef();
end;
v54.render = function(v56) --[[ Line: 168 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy)
    local l_focus_0 = v56.props.focus;
    return v7.createElement("Camera", {
        CameraType = Enum.CameraType.Scriptable, 
        CFrame = CFrame.new((Vector3.new(l_focus_0.x, 20, l_focus_0.y))) * CFrame.fromEulerAnglesXYZ(-1.5707963267948966, 0, 0), 
        FieldOfView = 90, 
        [v7.Ref] = v56.cameraRef
    });
end;
v54.didMount = function(v58) --[[ Line: 180 ]] --[[ Name: didMount ]]
    -- upvalues: l_Workspace_0 (copy)
    l_Workspace_0.CurrentCamera = v58.cameraRef.current;
end;
local v61 = v10.connect(function(v59, _) --[[ Line: 185 ]]
    return {
        focus = v59.player.position
    };
end, nil)(v54);
local v62 = v7.Component:extend("Asteroid");
v62.render = function(v63) --[[ Line: 194 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy)
    local l_position_0 = v63.props.position;
    local l_size_0 = v63.props.size;
    return v7.createElement("Part", {
        Anchored = true, 
        Shape = Enum.PartType.Ball, 
        Size = Vector3.new(l_size_0, l_size_0, l_size_0), 
        Color = Color3.fromRGB(170, 170, 170), 
        CFrame = CFrame.new((Vector3.new(l_position_0.x, 0, l_position_0.y))), 
        TopSurface = Enum.SurfaceType.Smooth
    });
end;
local v66 = v7.Component:extend("Asteroids");
v66.render = function(v67) --[[ Line: 211 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v62 (copy)
    local l_props_0 = v67.props;
    local v69 = {};
    for v70, v71 in pairs(l_props_0) do
        v69[v70] = v7.createElement(v62, {
            position = v71.position, 
            size = v71.size
        });
    end;
    return v7.createElement("Folder", {
        Name = "Asteroids"
    }, v69);
end;
v66 = v10.connect(function(v72, _) --[[ Line: 228 ]]
    return v72.asteroids;
end, nil)(v66);
local v74 = v7.Component:extend("Ship");
v74.render = function(v75) --[[ Line: 235 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy)
    local l_position_1 = v75.props.position;
    local l_angle_0 = v75.props.angle;
    local l_time_0 = v75.props.time;
    local v79 = Color3.fromHSV(l_time_0 % 5 / 5, 1, 1);
    return v7.createElement("Part", {
        Anchored = true, 
        Size = Vector3.new(2, 2, 6, 0), 
        Color = v79, 
        CFrame = CFrame.new((Vector3.new(l_position_1.x, 0, l_position_1.y))) * CFrame.fromEulerAnglesXYZ(0, -l_angle_0, 0), 
        FrontSurface = Enum.SurfaceType.Hinge
    });
end;
local v82 = v10.connect(function(v80, _) --[[ Line: 252 ]]
    return {
        position = v80.player.position, 
        angle = v80.player.angle, 
        time = v80.time
    };
end, nil)(v74);
local v83 = v7.Component:extend("GameBackground");
v83.render = function(_) --[[ Line: 263 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy)
    return v7.createElement("Part", {
        Anchored = true, 
        Size = Vector3.new(512, 10, 512, 0), 
        CFrame = CFrame.new((Vector3.new(0, -5, 0, 0))), 
        Color = Color3.new(0, 0, 0)
    });
end;
local v85 = v7.Component:extend("PauseText");
v85.render = function(_) --[[ Line: 275 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy)
    return v7.createElement("TextLabel", {
        Text = "Paused", 
        TextColor3 = Color3.fromRGB(255, 255, 255), 
        Font = Enum.Font.Arcade, 
        TextSize = 70, 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    });
end;
local v87 = v7.Component:extend("InputConnector");
v87.render = function(v88) --[[ Line: 288 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v7 (copy), v8 (copy), l_UserInputService_0 (copy)
    local function v90(v89) --[[ Line: 289 ]] --[[ Name: inputBeganCallback ]]
        -- upvalues: v88 (copy)
        if v88.props.onInputBegan then
            v88.props.onInputBegan(v89);
        end;
    end;
    local function v92(v91) --[[ Line: 295 ]] --[[ Name: inputChangedCallback ]]
        -- upvalues: v88 (copy)
        if v88.props.onInputChanged then
            v88.props.onInputChanged(v91);
        end;
    end;
    local function v94(v93) --[[ Line: 301 ]] --[[ Name: inputEndedCallback ]]
        -- upvalues: v88 (copy)
        if v88.props.onInputEnded then
            v88.props.onInputEnded(v93);
        end;
    end;
    if v5 then
        return v7.createFragment({
            InputBeganConnection = v7.createElement(v8, {
                event = l_UserInputService_0.InputBegan, 
                callback = v90
            }), 
            InputChangedConnection = v7.createElement(v8, {
                event = l_UserInputService_0.InputChanged, 
                callback = v92
            }), 
            InputEndedConnection = v7.createElement(v8, {
                event = l_UserInputService_0.InputEnded, 
                callback = v94
            })
        });
    else
        return v7.createElement(v8, {
            event = l_UserInputService_0.InputBegan, 
            callback = v90
        }, {
            v7.createElement(v8, {
                event = l_UserInputService_0.InputChanged, 
                callback = v92
            }, {
                v7.createElement(v8, {
                    event = l_UserInputService_0.InputEnded, 
                    callback = v94
                })
            })
        });
    end;
end;
local v95 = {
    [Enum.KeyCode.Left] = "left", 
    [Enum.KeyCode.A] = "left", 
    [Enum.KeyCode.Right] = "right", 
    [Enum.KeyCode.D] = "right", 
    [Enum.KeyCode.Up] = "up", 
    [Enum.KeyCode.W] = "up", 
    [Enum.KeyCode.P] = "pause"
};
local function _(v96) --[[ Line: 352 ]] --[[ Name: getPlayerInput ]]
    -- upvalues: v95 (copy)
    if v96.UserInputType ~= Enum.UserInputType.Keyboard then
        return nil;
    else
        return v95[v96.KeyCode];
    end;
end;
local v103 = v10.connect(nil, function(v98) --[[ Line: 360 ]]
    -- upvalues: v95 (copy)
    return {
        onInputBegan = function(v99) --[[ Line: 362 ]] --[[ Name: onInputBegan ]]
            -- upvalues: v95 (ref), v98 (copy)
            local v100 = if v99.UserInputType ~= Enum.UserInputType.Keyboard then nil else v95[v99.KeyCode];
            if v100 then
                v98({
                    type = "SetPlayerInput", 
                    playerInput = v100, 
                    value = 1
                });
            end;
        end, 
        onInputEnded = function(v101) --[[ Line: 373 ]] --[[ Name: onInputEnded ]]
            -- upvalues: v95 (ref), v98 (copy)
            local v102 = if v101.UserInputType ~= Enum.UserInputType.Keyboard then nil else v95[v101.KeyCode];
            if v102 then
                v98({
                    type = "SetPlayerInput", 
                    playerInput = v102, 
                    value = 0
                });
            end;
        end
    };
end)(v87);
local v104 = v7.Component:extend("RenderSteppedConnector");
v104.render = function(v105) --[[ Line: 388 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v8 (copy), l_RunService_0 (copy)
    local l_playerInputs_0 = v105.props.playerInputs;
    return v7.createElement(v8, {
        event = l_RunService_0.RenderStepped, 
        callback = function(v107) --[[ Line: 391 ]] --[[ Name: onStepped ]]
            -- upvalues: v105 (copy), l_playerInputs_0 (copy)
            v105.props.onStepped(v107, l_playerInputs_0);
        end
    });
end;
v104 = v10.connect(function(v108, _) --[[ Line: 402 ]]
    return {
        playerInputs = v108.playerInputs
    };
end, function(v110) --[[ Line: 406 ]]
    return {
        onStepped = function(v111, v112) --[[ Line: 408 ]] --[[ Name: onStepped ]]
            -- upvalues: v110 (copy)
            v110({
                type = "GameStep", 
                delta = v111, 
                inputs = v112
            });
        end
    };
end)(v104);
local v119 = v10.connect(function(v113, _) --[[ Line: 438 ]]
    return {
        paused = v113.paused
    };
end, nil)(function(v115) --[[ Line: 424 ]] --[[ Name: PauseRoute ]]
    -- upvalues: v7 (copy)
    local l_paused_0 = v115.paused;
    local l_match_0 = v115.match;
    local l_component_0 = v115.component;
    if l_paused_0 == l_match_0 then
        return v7.createElement(l_component_0);
    else
        return nil;
    end;
end);
local v120 = v7.Component:extend("App");
v120.render = function(_) --[[ Line: 447 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v82 (copy), v61 (copy), v83 (copy), v66 (ref), v103 (copy), v119 (ref), v104 (ref)
    return v7.createElement("Folder", {}, {
        Player = v7.createElement(v82), 
        PlayerCamera = v7.createElement(v61), 
        GameBackground = v7.createElement(v83), 
        Asteroids = v7.createElement(v66), 
        KeyboardInputConnector = v7.createElement(v103), 
        RenderSteppedConnector = v7.createElement(v119, {
            match = false, 
            component = v104
        })
    });
end;
local v122 = v7.Component:extend("Ui");
v122.render = function(_) --[[ Line: 464 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v119 (ref), v85 (copy)
    return v7.createElement("ScreenGui", nil, {
        PauseText = v7.createElement(v119, {
            match = true, 
            component = v85
        })
    });
end;
return function() --[[ Line: 473 ]] --[[ Name: main ]]
    -- upvalues: l_RunService_0 (copy), v9 (copy), v53 (copy), v7 (copy), v10 (copy), v120 (copy), v122 (copy), l_Workspace_0 (copy), l_CoreGui_0 (copy)
    l_RunService_0.Stepped:Wait();
    local v124 = v9.Store.new(v53);
    local v125 = v7.createElement(v10.StoreProvider, {
        store = v124
    }, {
        App = v7.createElement(v120)
    });
    local v126 = v7.createElement(v10.StoreProvider, {
        store = v124
    }, {
        Ui = v7.createElement(v122)
    });
    v7.mount(v125, l_Workspace_0, "Roact-asteroids");
    v7.mount(v126, l_CoreGui_0, "Roact-asteroids-ui");
end;