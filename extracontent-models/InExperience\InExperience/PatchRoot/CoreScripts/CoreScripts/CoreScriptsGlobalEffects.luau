local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v5 = require(l_RobloxGui_0.Modules.Common.Hooks.usePlayerCurrentScreenOrientation);
local v6 = require(l_RobloxGui_0.Modules.GamepadDisconnect.CoreScriptsGamepadDisconnectListener);
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.Roact);
local l_DeviceType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceType;
local l_useLogInputTypeChanged_0 = require(l_CorePackages_0.Workspace.Packages.UiShellEvents).useLogInputTypeChanged;
local l_useLogOrientationChanged_0 = require(l_CorePackages_0.Workspace.Packages.UiShellEvents).useLogOrientationChanged;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v13 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_getInputGroup_0 = require(l_CorePackages_0.Workspace.Packages.InputType).getInputGroup;
local l_useExternalEvent_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useExternalEvent;
local v18 = game:DefineFastFlag("RemoveLoggingHookForCorescriptGlobalEffects2", false);
local v19 = nil;
local function v23(v20) --[[ Line: 28 ]] --[[ Name: sendInputTypeLogging ]]
    -- upvalues: v19 (ref), l_UserInputService_0 (copy), l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), v13 (copy)
    if v19 == v20 then
        return;
    else
        v19 = v20;
        local l_l_UserInputService_0_GamepadConnected_0 = l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1);
        local v22 = if l_game_EngineFeature_0 then l_RbxAnalyticsService_0:GetPlaySessionId() else nil;
        if v20 ~= nil then
            v13:sendEventDeferred("inputTypeChanged", "inputTypeChanged", {
                inputType = v20, 
                gamepadConnected = l_l_UserInputService_0_GamepadConnected_0, 
                playSessionId = v22
            });
        end;
        return;
    end;
end;
v8.mount(v7.createElement(function(_) --[[ Line: 47 ]] --[[ Name: CoreScriptsGlobalEffects ]]
    -- upvalues: v18 (copy), v7 (copy), v23 (copy), l_getInputGroup_0 (copy), l_useExternalEvent_0 (copy), l_UserInputService_0 (copy), l_game_EngineFeature_0 (copy), l_useLogInputTypeChanged_0 (copy), v13 (copy), l_RbxAnalyticsService_0 (copy), v5 (copy), l_useLogOrientationChanged_0 (copy), l_DeviceType_0 (copy), l_CoreScriptsRootProvider_0 (copy), v6 (copy)
    if v18 then
        local v26 = v7.useCallback(function(v25) --[[ Line: 49 ]]
            -- upvalues: v23 (ref), l_getInputGroup_0 (ref)
            v23(l_getInputGroup_0(v25));
        end, {});
        l_useExternalEvent_0(l_UserInputService_0.LastInputTypeChanged, v26);
    elseif l_game_EngineFeature_0 then
        l_useLogInputTypeChanged_0(v13, l_RbxAnalyticsService_0:GetPlaySessionId());
    else
        l_useLogInputTypeChanged_0(v13);
    end;
    local v27 = v5();
    l_useLogOrientationChanged_0(v13, v27);
    local v28 = {
        deviceType = l_DeviceType_0.Console
    };
    return v7.createElement(l_CoreScriptsRootProvider_0, {
        styleOverride = v28
    }, {
        CoreScriptsGamepadDisconnectListener = v7.createElement(v6)
    });
end), l_CoreGui_0, "CoreScriptsGlobalEffects");