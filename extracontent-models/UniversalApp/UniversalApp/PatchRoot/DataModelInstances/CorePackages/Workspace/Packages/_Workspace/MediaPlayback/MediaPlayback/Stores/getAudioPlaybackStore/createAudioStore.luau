local l_script_FirstAncestor_0 = script:FindFirstAncestor("MediaPlayback");
local v1 = require(l_script_FirstAncestor_0.Parent.Signals);
local v2 = require(l_script_FirstAncestor_0.Parent.SignalsExperimental);
local v3 = require(l_script_FirstAncestor_0.Common.enableAudioPlaybackInApp);
local v4 = require(l_script_FirstAncestor_0.Stores.getAudioPlaybackStore.createAudioSystem);
local v5 = require(l_script_FirstAncestor_0.Stores.getAudioPlaybackStore.createVolumeStore);
local _ = require(l_script_FirstAncestor_0.Stores.getAudioPlaybackStore.types);
local l_createSignal_0 = v1.createSignal;
local l_createEffect_0 = v1.createEffect;
local l_onDisposed_0 = v2.onDisposed;
return function(v10) --[[ Line: 17 ]] --[[ Name: createAudioStore ]]
    -- upvalues: l_createSignal_0 (copy), v5 (copy), v3 (copy), v4 (copy), l_createEffect_0 (copy), l_onDisposed_0 (copy)
    local v11, v12 = l_createSignal_0(0);
    local v13, v14 = l_createSignal_0(0);
    local v15, v16 = l_createSignal_0(false);
    local v17, v18 = l_createSignal_0(false);
    local v19, v20 = l_createSignal_0(false);
    local v21, v22 = l_createSignal_0(false);
    local v23 = {};
    local v24 = v5();
    v3();
    local v25 = v4(v10);
    local l_audioPlayer_0 = v25.audioPlayer;
    local function v27() --[[ Line: 34 ]] --[[ Name: play ]]
        -- upvalues: v16 (copy), v18 (copy), l_audioPlayer_0 (copy)
        v16(true);
        v18(false);
        l_audioPlayer_0.PlaybackSpeed = 1;
    end;
    local function v28() --[[ Line: 40 ]] --[[ Name: pause ]]
        -- upvalues: v16 (copy), l_audioPlayer_0 (copy)
        v16(false);
        l_audioPlayer_0.PlaybackSpeed = 0;
    end;
    local function v29() --[[ Line: 45 ]] --[[ Name: stop ]]
        -- upvalues: v16 (copy), l_audioPlayer_0 (copy), v14 (copy)
        v16(false);
        l_audioPlayer_0.PlaybackSpeed = 0;
        l_audioPlayer_0.TimePosition = 0;
        v14(0);
    end;
    local function v32(v30) --[[ Line: 51 ]] --[[ Name: seek ]]
        -- upvalues: l_audioPlayer_0 (copy), v14 (copy)
        local v31 = math.clamp(v30, 0, l_audioPlayer_0.TimeLength);
        l_audioPlayer_0.TimePosition = v31;
        v14(v31);
    end;
    l_audioPlayer_0:GetPropertyChangedSignal("TimeLength"):Connect(function() --[[ Line: 57 ]]
        -- upvalues: v12 (copy), l_audioPlayer_0 (copy)
        v12(l_audioPlayer_0.TimeLength);
    end);
    v12(l_audioPlayer_0.TimeLength);
    l_audioPlayer_0:GetPropertyChangedSignal("IsReady"):Connect(function() --[[ Line: 62 ]]
        -- upvalues: v22 (copy), l_audioPlayer_0 (copy)
        v22(l_audioPlayer_0.IsReady);
    end);
    v22(l_audioPlayer_0.IsReady);
    table.insert(v23, l_createEffect_0(function(v33) --[[ Line: 69 ]]
        -- upvalues: v15 (copy), l_audioPlayer_0 (copy), v18 (copy), v16 (copy), v14 (copy), l_onDisposed_0 (ref)
        if v15(v33) then
            if not l_audioPlayer_0.IsPlaying then
                l_audioPlayer_0:Play();
            end;
            local v34 = true;
            do
                local l_v34_0 = v34;
                task.spawn(function() --[[ Line: 79 ]]
                    -- upvalues: l_v34_0 (ref), l_audioPlayer_0 (ref), v18 (ref), v16 (ref), v14 (ref)
                    while true do
                        if l_v34_0 then
                            if not l_audioPlayer_0.IsPlaying then
                                v18(true);
                                v16(false);
                                l_audioPlayer_0.PlaybackSpeed = 0;
                                l_audioPlayer_0.TimePosition = 0;
                                v14(0);
                                return;
                            else
                                v14(l_audioPlayer_0.TimePosition);
                                task.wait(0.0625);
                            end;
                        else
                            return;
                        end;
                    end;
                end);
                l_onDisposed_0(v33, function() --[[ Line: 92 ]]
                    -- upvalues: l_v34_0 (ref)
                    l_v34_0 = false;
                end);
            end;
        end;
    end));
    table.insert(v23, l_createEffect_0(function(v36) --[[ Line: 101 ]]
        -- upvalues: l_audioPlayer_0 (copy), v24 (copy)
        l_audioPlayer_0.Volume = v24.getVolume(v36);
    end));
    return {
        assetId = v10, 
        getDuration = v11, 
        getElapsed = v13, 
        getIsPlaying = v15, 
        getIsElapsed = v17, 
        getIsDestroyed = v19, 
        getIsLoaded = v21, 
        destroy = function() --[[ Line: 106 ]] --[[ Name: destroy ]]
            -- upvalues: v25 (copy), v23 (copy), v20 (copy)
            v25.destroy();
            for _, v38 in v23 do
                v38();
            end;
            v20(true);
        end, 
        play = v27, 
        pause = v28, 
        stop = v29, 
        seek = v32, 
        getIsMuted = v24.getIsMuted, 
        getVolume = v24.getVolume, 
        mute = v24.mute, 
        setVolume = v24.setVolume, 
        unmute = v24.unmute
    };
end;