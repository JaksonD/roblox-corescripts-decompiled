local l_UserInputService_0 = game:GetService("UserInputService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Resources.Constants);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_InputTypeMap_0 = v3.InputTypeMap;
return function(v6, v7, v8, v9, v10) --[[ Line: 11 ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_UserInputService_0 (copy), v3 (copy), l_InputTypeMap_0 (copy), l_game_EngineFeature_0 (copy)
    if v10 == nil then
        v10 = l_RbxAnalyticsService_0;
    end;
    local function v13() --[[ Line: 17 ]] --[[ Name: reportSettingsForAnalytics ]]
        -- upvalues: l_UserInputService_0 (ref)
        local l_GameSettings_0 = UserSettings().GameSettings;
        local v12 = {};
        if l_UserInputService_0.TouchEnabled then
            v12.camera_mode_touch = tostring(l_GameSettings_0.TouchCameraMovementMode);
        else
            v12.camera_mode_desktop = tostring(l_GameSettings_0.ComputerCameraMovementMode);
        end;
        if l_UserInputService_0.TouchEnabled then
            v12.movement_mode_touch = tostring(l_GameSettings_0.TouchMovementMode);
        else
            v12.movement_mode_desktop = tostring(l_GameSettings_0.ComputerMovementMode);
        end;
        if l_UserInputService_0.MouseEnabled then
            v12.shift_lock_enabled = tostring(l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch);
        end;
        if l_UserInputService_0.GamepadEnabled and l_GameSettings_0.IsUsingGamepadCameraSensitivity then
            v12.camera_sensitivity_gamepad = string.format("%.2f", l_GameSettings_0.GamepadCameraSensitivity);
        end;
        if l_UserInputService_0.MouseEnabled then
            v12.camera_sensitivity_mouse = string.format("%.2f", l_GameSettings_0.MouseSensitivityFirstPerson.X);
        end;
        v12.camera_y_inverted = tostring(l_GameSettings_0.CameraYInverted);
        v12.show_performance_stats = tostring(l_GameSettings_0.PerformanceStatsVisible);
        v12.volume = tostring((math.floor(l_GameSettings_0.MasterVolume * 10 + 0.5)));
        v12.gfx_quality_level = tostring(settings().Rendering.QualityLevel);
        v12.fullscreen_enabled = tostring(l_GameSettings_0:InFullScreen());
        v12.microprofiler_enabled = tostring(l_GameSettings_0.OnScreenProfilerEnabled);
        v12.microprofiler_webserver_enabled = tostring(l_GameSettings_0.MicroProfilerWebServerEnabled);
        return v12;
    end;
    if v9 == true then
        v8 = v13();
        v7 = v3.AnalyticsSettingsChangeName;
        v6 = v3.AnalyticsInGameMenuName;
    end;
    if not v8 then
        v8 = {};
    end;
    v8.universeid = tostring(game.GameId);
    v8.inputDevice = tostring(l_InputTypeMap_0[l_UserInputService_0:GetLastInputType()] or l_UserInputService_0:GetLastInputType());
    if v8.playsessionid == nil and l_game_EngineFeature_0 then
        v8.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    v10:SetRBXEventStream(v3.AnalyticsTargetName, v6, v7, v8);
end;