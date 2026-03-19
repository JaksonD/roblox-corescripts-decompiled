local l_CorePackages_0 = game:GetService("CorePackages");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_SoundService_0 = game:GetService("SoundService");
local l_Modules_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules");
local v5 = require(l_Modules_0.Flags.GetFFlagEnableSoundSessionTelemetry);
local v6 = require(l_Modules_0.Flags.GetFIntSoundSessionTelemetryThrottle);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v8 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local l_default_0 = v8.default;
local v10 = require(l_Modules_0.AggregatedData);
local v11 = require(l_Modules_0.PlayingSounds);
local v12 = {
    eventName = "SoundSessionPlayback", 
    backends = {
        v8.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v6(), 
    lastUpdated = {
        23, 
        13, 
        6
    }, 
    description = " Aggregated session-end event of all music playback data ", 
    links = "https://roblox.atlassian.net/wiki/spaces/MUS/pages/2065826132/Scaled+Analytics+Tech+Spec"
};
local v13 = {};
local v14 = v10.new();
local v15 = v11.new(v14);
local function v22() --[[ Line: 39 ]] --[[ Name: logSessionEvent ]]
    -- upvalues: v14 (copy), l_RbxAnalyticsService_0 (copy), l_game_EngineFeature_0 (copy), l_default_0 (copy), v12 (copy)
    local v16 = {};
    local v17 = {};
    local v18 = {};
    for v19, v20 in pairs(v14) do
        table.insert(v16, v19);
        table.insert(v17, v20.loopcount);
        table.insert(v18, v20.playtime);
    end;
    local v21 = {
        asset_ids = table.concat(v16, ","), 
        loop_counts = table.concat(v17, ","), 
        playback_seconds = table.concat(v18, ","), 
        placeid = tostring(game.PlaceId), 
        sessionid = l_RbxAnalyticsService_0:GetSessionId(), 
        universeid = tostring(game.GameId)
    };
    if l_game_EngineFeature_0 then
        v21.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    l_default_0:logRobloxTelemetryEvent(v12, nil, v21);
end;
local function v27() --[[ Line: 67 ]] --[[ Name: aggregateEndSessionData ]]
    -- upvalues: v15 (copy), v22 (copy)
    for v23, v24 in pairs(v15.sounds) do
        for v25, _ in pairs(v24.instances) do
            v15:removeSound(v23, v25);
        end;
    end;
    v22();
end;
local function _(v28) --[[ Line: 79 ]] --[[ Name: isAudible ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    local l_MasterVolume_0 = l_UserGameSettings_0.MasterVolume;
    local v30 = if v28.SoundGroup then v28.SoundGroup.Volume else 1;
    local l_Volume_0 = v28.Volume;
    local l_RollOffGain_0 = v28.RollOffGain;
    return l_MasterVolume_0 * v30 * l_Volume_0 * l_RollOffGain_0 > 0.01;
end;
local function _(v34) --[[ Line: 91 ]] --[[ Name: onPlayed ]]
    -- upvalues: v5 (copy), l_UserGameSettings_0 (copy), v15 (copy)
    if v5() then
        local l_MasterVolume_1 = l_UserGameSettings_0.MasterVolume;
        local v36 = if v34.SoundGroup then v34.SoundGroup.Volume else 1;
        local l_Volume_1 = v34.Volume;
        local l_RollOffGain_1 = v34.RollOffGain;
        if l_MasterVolume_1 * v36 * l_Volume_1 * l_RollOffGain_1 > 0.01 then
            v15:addSound(v34.SoundId, v34:GetDebugId(10));
        end;
    end;
end;
local function _(v40) --[[ Line: 97 ]] --[[ Name: onPaused ]]
    -- upvalues: v5 (copy), v15 (copy)
    if v5() then
        v15:removeSound(v40.SoundId, v40:GetDebugId(10));
    end;
end;
local function _(v42) --[[ Line: 103 ]] --[[ Name: onStopped ]]
    -- upvalues: v5 (copy), v15 (copy)
    if v5() then
        v15:removeSound(v42.SoundId, v42:GetDebugId(10));
    end;
end;
local function _(v44) --[[ Line: 109 ]] --[[ Name: onEnded ]]
    -- upvalues: v5 (copy), v15 (copy)
    if v5() then
        v15:removeSound(v44.SoundId, v44:GetDebugId(10));
    end;
end;
local function _(v46) --[[ Line: 115 ]] --[[ Name: onResumed ]]
    -- upvalues: v5 (copy), l_UserGameSettings_0 (copy), v15 (copy)
    if v5() then
        local l_MasterVolume_2 = l_UserGameSettings_0.MasterVolume;
        local v48 = if v46.SoundGroup then v46.SoundGroup.Volume else 1;
        local l_Volume_2 = v46.Volume;
        local l_RollOffGain_2 = v46.RollOffGain;
        if l_MasterVolume_2 * v48 * l_Volume_2 * l_RollOffGain_2 > 0.01 then
            v15:addSound(v46.SoundId, v46:GetDebugId(10));
        end;
    end;
end;
local _ = function(v52, _) --[[ Line: 121 ]] --[[ Name: onLooped ]]
    -- upvalues: v5 (copy), v15 (copy)
    if v5() then
        v15:loopSound(v52.SoundId, v52:GetDebugId(10));
    end;
end;
local function v59(v55) --[[ Line: 127 ]] --[[ Name: unhookSoundEvents ]]
    -- upvalues: v13 (copy), v5 (copy), v15 (copy)
    local v56 = v13[v55];
    if v56 ~= nil then
        for _, v58 in v56 do
            v58:Disconnect();
        end;
    end;
    if v5() then
        v15:removeSound(v55.SoundId, v55:GetDebugId(10));
    end;
    v13[v55] = nil;
end;
local function v89(v60) --[[ Line: 140 ]] --[[ Name: hookupSoundEvents ]]
    -- upvalues: v5 (copy), l_UserGameSettings_0 (copy), v15 (copy), v59 (copy), v13 (copy)
    if v60.Playing and v5() then
        local l_MasterVolume_3 = l_UserGameSettings_0.MasterVolume;
        local v62 = if v60.SoundGroup then v60.SoundGroup.Volume else 1;
        local l_Volume_3 = v60.Volume;
        local l_RollOffGain_3 = v60.RollOffGain;
        if l_MasterVolume_3 * v62 * l_Volume_3 * l_RollOffGain_3 > 0.01 then
            v15:addSound(v60.SoundId, v60:GetDebugId(10));
        end;
    end;
    v13[v60] = {
        v60.Played:Connect(function() --[[ Line: 146 ]]
            -- upvalues: v60 (copy), v5 (ref), l_UserGameSettings_0 (ref), v15 (ref)
            if v60.TimeLength == 0 or not v60.IsLoaded then
                local v65 = nil;
                v65 = v60.Loaded:Connect(function() --[[ Line: 150 ]]
                    -- upvalues: v60 (ref), v5 (ref), l_UserGameSettings_0 (ref), v15 (ref), v65 (ref)
                    local l_v60_0 = v60;
                    if v5() then
                        local l_MasterVolume_4 = l_UserGameSettings_0.MasterVolume;
                        local v68 = if l_v60_0.SoundGroup then l_v60_0.SoundGroup.Volume else 1;
                        local l_Volume_4 = l_v60_0.Volume;
                        local l_RollOffGain_4 = l_v60_0.RollOffGain;
                        if l_MasterVolume_4 * v68 * l_Volume_4 * l_RollOffGain_4 > 0.01 then
                            v15:addSound(l_v60_0.SoundId, l_v60_0:GetDebugId(10));
                        end;
                    end;
                    v65:Disconnect();
                end);
                return;
            else
                local l_v60_1 = v60;
                if v5() then
                    local l_MasterVolume_5 = l_UserGameSettings_0.MasterVolume;
                    local v73 = if l_v60_1.SoundGroup then l_v60_1.SoundGroup.Volume else 1;
                    local l_Volume_5 = l_v60_1.Volume;
                    local l_RollOffGain_5 = l_v60_1.RollOffGain;
                    if l_MasterVolume_5 * v73 * l_Volume_5 * l_RollOffGain_5 > 0.01 then
                        v15:addSound(l_v60_1.SoundId, l_v60_1:GetDebugId(10));
                    end;
                end;
                return;
            end;
        end), 
        v60.Paused:Connect(function() --[[ Line: 159 ]]
            -- upvalues: v60 (copy), v5 (ref), v15 (ref)
            local l_v60_2 = v60;
            if v5() then
                v15:removeSound(l_v60_2.SoundId, l_v60_2:GetDebugId(10));
            end;
        end), 
        v60.Stopped:Connect(function() --[[ Line: 163 ]]
            -- upvalues: v60 (copy), v5 (ref), v15 (ref)
            local l_v60_3 = v60;
            if v5() then
                v15:removeSound(l_v60_3.SoundId, l_v60_3:GetDebugId(10));
            end;
        end), 
        v60.Ended:Connect(function() --[[ Line: 167 ]]
            -- upvalues: v60 (copy), v5 (ref), v15 (ref)
            local l_v60_4 = v60;
            if v5() then
                v15:removeSound(l_v60_4.SoundId, l_v60_4:GetDebugId(10));
            end;
        end), 
        v60.Resumed:Connect(function() --[[ Line: 171 ]]
            -- upvalues: v60 (copy), v5 (ref), l_UserGameSettings_0 (ref), v15 (ref)
            local l_v60_5 = v60;
            if v5() then
                local l_MasterVolume_6 = l_UserGameSettings_0.MasterVolume;
                local v81 = if l_v60_5.SoundGroup then l_v60_5.SoundGroup.Volume else 1;
                local l_Volume_6 = l_v60_5.Volume;
                local l_RollOffGain_6 = l_v60_5.RollOffGain;
                if l_MasterVolume_6 * v81 * l_Volume_6 * l_RollOffGain_6 > 0.01 then
                    v15:addSound(l_v60_5.SoundId, l_v60_5:GetDebugId(10));
                end;
            end;
        end), 
        v60.DidLoop:Connect(function(_, _) --[[ Line: 175 ]]
            -- upvalues: v60 (copy), v5 (ref), v15 (ref)
            local l_v60_6 = v60;
            if v5() then
                v15:loopSound(l_v60_6.SoundId, l_v60_6:GetDebugId(10));
            end;
        end), 
        (v60.AncestryChanged:Connect(function(v87, _) --[[ Line: 179 ]]
            -- upvalues: v59 (ref), v60 (copy)
            if v87:FindFirstAncestorOfClass("DataModel") == nil then
                v59(v60);
            end;
        end))
    };
end;
if v5() then
    if game:GetEngineFeature("AudioInstanceAddedApiEnabled") then
        l_SoundService_0.AudioInstanceAdded:Connect(function(v90) --[[ Line: 192 ]]
            -- upvalues: v13 (copy), v89 (copy)
            if v90:IsA("Sound") and not v13[v90] then
                v89(v90);
            end;
        end);
    end;
    game.Close:Connect(function() --[[ Line: 201 ]]
        -- upvalues: v27 (copy)
        v27();
    end);
end;