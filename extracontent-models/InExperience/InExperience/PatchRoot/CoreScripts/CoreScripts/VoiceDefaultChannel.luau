local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).CallProtocol.default;
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).Enums;
local v8 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore);
local v9 = game:DefineFastFlag("DebugDefaultChannelStartMuted", true);
local v10 = game:DefineFastFlag("UseNotificationServiceIsConnected", false);
local v11 = game:DefineFastFlag("DefaultChannelEnableDefaultVoice", true);
local v12 = game:DefineFastFlag("AlwaysJoinWhenUsingAudioAPI", false);
local l_GetFFlagEnableLuaVoiceChatAnalytics_0 = v8.Flags.GetFFlagEnableLuaVoiceChatAnalytics;
local l_GetFFlagSeamlessVoiceFTUX_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSeamlessVoiceFTUX;
local _ = game:GetEngineFeature("VoiceServiceGenerateDefaultChannelAvailable");
local l_game_EngineFeature_1 = game:GetEngineFeature("VoiceServiceEnableDefaultVoiceAvailable");
local l_game_EngineFeature_2 = game:GetEngineFeature("NotificationServiceIsConnectedAvailable");
local v18 = require(l_RobloxGui_0.Modules.VoiceChat.Logger)(script.Name);
local v19 = require(l_RobloxGui_0.Modules.VoiceChat.Analytics).new();
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local function v24(v21) --[[ Line: 31 ]] --[[ Name: initializeDefaultChannel ]]
    -- upvalues: l_default_0 (copy), v18 (copy), l_GetFFlagEnableLuaVoiceChatAnalytics_0 (copy), v19 (copy)
    local v22 = l_default_0:getService();
    if not v22 then
        return nil;
    else
        v18:info("Joining default channel");
        local v23 = v22:JoinByGroupIdToken("default", v21);
        if l_GetFFlagEnableLuaVoiceChatAnalytics_0() then
            if v23 then
                v19:reportVoiceChatJoinResult(true, "defaultJoinSuccess");
                return v23;
            else
                v19:reportVoiceChatJoinResult(false, "defaultJoinFailed", "error");
            end;
        end;
        return v23;
    end;
end;
if l_game_EngineFeature_2 and v10 then
    if not l_NotificationService_0.IsConnected then
        v18:debug("NotificationService is not yet connected");
        l_NotificationService_0:GetPropertyChangedSignal("IsConnected"):Wait();
    end;
    v18:debug("NotificationService connected");
end;
if not l_VoiceChatService_0.UseNewAudioApi then
    if not l_Players_0.LocalPlayer.Character then
        l_Players_0.LocalPlayer.CharacterAdded:Wait();
        v18:debug("Player character loaded");
    else
        v18:debug("Player character already loaded");
    end;
end;
if l_game_EngineFeature_1 and v11 then
    local l_game_Service_0 = game:FindService("VoiceChatService");
    if v12 then
        if not l_game_Service_0 then
            v18:info("VoiceChatService not found. Assuming default values.");
        elseif not l_game_Service_0.EnableDefaultVoice and not l_game_Service_0.UseNewAudioApi then
            v18:debug("Default channel is disabled.");
            if l_GetFFlagEnableLuaVoiceChatAnalytics_0() then
                v19:reportVoiceChatJoinResult(false, "defaultDisabled");
            end;
            return;
        end;
    elseif not l_game_Service_0 then
        v18:info("VoiceChatService not found. Assuming default values.");
    elseif not l_game_Service_0.EnableDefaultVoice then
        v18:debug("Default channel is disabled.");
        if l_GetFFlagEnableLuaVoiceChatAnalytics_0() then
            v19:reportVoiceChatJoinResult(false, "defaultDisabled");
        end;
        return;
    end;
end;
l_default_1:getCallState():andThen(function(v26) --[[ Line: 96 ]]
    -- upvalues: l_Enums_0 (copy), v9 (copy), l_default_0 (copy), v24 (copy), v18 (copy)
    local v27 = if v26.status ~= l_Enums_0.CallStatus.Idle.rawValue() and v26.status ~= l_Enums_0.CallStatus.Ringing.rawValue() then v26.muted else v9;
    l_default_0:asyncInit():andThen(function() --[[ Line: 103 ]]
        -- upvalues: v24 (ref), v27 (copy), l_default_0 (ref)
        if v24(v27) == false then
            l_default_0:InitialJoinFailedPrompt();
        end;
    end):catch(function() --[[ Line: 109 ]]
        -- upvalues: v18 (ref)
        v18:info("VoiceChatServiceManager did not initialize");
    end);
end);
if l_GetFFlagSeamlessVoiceFTUX_0() then
    task.spawn(function() --[[ Line: 118 ]]
        -- upvalues: l_default_0 (copy)
        l_default_0:VoiceChatFirstTimeUX(game:GetService("AppStorageService"));
    end);
end;