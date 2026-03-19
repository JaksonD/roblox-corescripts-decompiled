local l_script_FirstAncestor_0 = script:FindFirstAncestor("MediaPlayback");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.Signals);
local v3 = require(l_script_FirstAncestor_0.Parent.SignalsExperimental);
local v4 = require(l_script_FirstAncestor_0.Stores.getAudioPlaybackStore.createConsumerCounterStore);
local v5 = require(l_script_FirstAncestor_0.Stores.getAudioPlaybackStore.createAudioStore);
local v6 = require(l_script_FirstAncestor_0.Stores.getAudioPlaybackStore.createPlaylistStore);
local v7 = require(l_script_FirstAncestor_0.Stores.getAudioPlaybackStore.createVolumeStore);
local _ = require(l_script_FirstAncestor_0.Stores.getAudioPlaybackStore.types);
local l_createSignal_0 = v2.createSignal;
local l_createComputed_0 = v2.createComputed;
local function _(v11, v12) --[[ Line: 16 ]] --[[ Name: createEffect ]]
    -- upvalues: v3 (copy), v2 (copy)
    v3.onDisposed(v11, v2.createEffect(v12));
end;
return function(v14) --[[ Line: 20 ]] --[[ Name: createAudioPlaybackStore ]]
    -- upvalues: l_createSignal_0 (copy), v4 (copy), v7 (copy), v6 (copy), v5 (copy), v1 (copy), l_createComputed_0 (copy), v3 (copy), v2 (copy)
    local v15, v16 = l_createSignal_0({});
    local v17 = v4();
    local v18 = v7();
    local v19 = v6();
    local function v23(v20) --[[ Line: 28 ]] --[[ Name: getOrCreateAudioStore ]]
        -- upvalues: v15 (copy), v5 (ref), v16 (copy), v1 (ref), v17 (copy)
        local v21 = v15(false)[tostring(v20)];
        if not v21 then
            v21 = v5(v20);
            v16(function(v22) --[[ Line: 34 ]]
                -- upvalues: v1 (ref), v20 (copy), v21 (ref)
                return v1.Dictionary.join(v22, {
                    [tostring(v20)] = v21
                });
            end);
        end;
        v17.subscribe((tostring(v20)));
        return v21;
    end;
    local v24, v25 = l_createSignal_0({});
    local v26 = nil;
    local v30 = l_createComputed_0(function(v27) --[[ Line: 49 ]]
        -- upvalues: v24 (copy), v26 (ref)
        local v28 = v24(v27);
        local v29 = v28[#v28];
        if v29 then
            v26 = v29;
        end;
        return v26;
    end);
    local function _() --[[ Line: 60 ]] --[[ Name: getNextSong ]]
        -- upvalues: v30 (copy), v19 (copy), v23 (copy)
        local v31 = v30(false);
        if v31 then
            local v32 = v19.getNext(v31.assetId);
            if v32 then
                return (v23(v32));
            end;
        end;
        return nil;
    end;
    local v36 = l_createComputed_0(function(v34) --[[ Line: 72 ]]
        -- upvalues: v30 (copy), v19 (copy)
        local v35 = v30(v34);
        if v35 then
            return v19.getNext(v35.assetId) ~= nil;
        else
            return false;
        end;
    end);
    local v39 = l_createComputed_0(function(v37) --[[ Line: 80 ]]
        -- upvalues: v30 (copy), v19 (copy)
        local v38 = v30(v37);
        if v38 then
            return v19.getPrev(v38.assetId) ~= nil;
        else
            return false;
        end;
    end);
    local function v42() --[[ Line: 88 ]] --[[ Name: stopAll ]]
        -- upvalues: v15 (copy)
        for _, v41 in v15(false) do
            v41.stop();
        end;
    end;
    local function v45() --[[ Line: 94 ]] --[[ Name: pauseAll ]]
        -- upvalues: v15 (copy)
        for _, v44 in v15(false) do
            v44.pause();
        end;
    end;
    local function v49() --[[ Line: 100 ]] --[[ Name: playNextSong ]]
        -- upvalues: v30 (copy), v19 (copy), v23 (copy)
        local v46 = v30(false);
        if v46 then
            local v47 = v19.getNext(v46.assetId);
            if v47 then
                local v48 = v23(v47);
                v46.stop();
                v48.play();
            end;
        end;
    end;
    local function v53() --[[ Line: 114 ]] --[[ Name: playPrevSong ]]
        -- upvalues: v30 (copy), v19 (copy), v23 (copy)
        local v50 = v30(false);
        if v50 then
            local v51 = v19.getPrev(v50.assetId);
            if v51 then
                local v52 = v23(v51);
                v50.stop();
                v52.play();
            end;
        end;
    end;
    local function v58(v54) --[[ Line: 128 ]] --[[ Name: destroyAudioStore ]]
        -- upvalues: v15 (copy), v17 (copy), v16 (copy), v1 (ref)
        local v55 = tostring(v54);
        local v56 = v15(false)[v55];
        if v56 then
            if v17.unsubscribe(v55) > 0 then
                return;
            else
                v56.destroy();
                v16(function(v57) --[[ Line: 142 ]]
                    -- upvalues: v1 (ref), v54 (copy)
                    return v1.Dictionary.join(v57, {
                        [tostring(v54)] = v1.None
                    });
                end);
            end;
        end;
    end;
    local function v61() --[[ Line: 150 ]] --[[ Name: destroy ]]
        -- upvalues: v15 (copy), v16 (copy), v25 (copy)
        for _, v60 in v15(false) do
            v60.destroy();
        end;
        v16({});
        v25({});
    end;
    v3.onDisposed(v14, v2.createEffect(function(v62) --[[ Line: 158 ]]
        -- upvalues: v17 (copy), v58 (copy)
        for v63, v64 in v17.getConsumerCounts(v62) do
            if v64 <= 0 then
                v58(v63);
            end;
        end;
    end));
    v3.onDisposed(v14, v2.createEffect(function(v65) --[[ Line: 166 ]]
        -- upvalues: v15 (copy), v58 (copy)
        for _, v67 in v15(v65) do
            if v67.getIsDestroyed(v65) then
                v58(v67.assetId);
            end;
        end;
    end));
    local function v76(v68) --[[ Line: 174 ]]
        -- upvalues: v15 (copy), v1 (ref), v24 (copy), v25 (copy)
        for _, v70 in v15(v68) do
            local v71 = v70.getIsPlaying(v68);
            local v72 = v1.List.find(v24(v68), v70);
            local v73 = v72 ~= nil;
            if v73 and not v71 then
                v25(function(v74) --[[ Line: 182 ]]
                    -- upvalues: v1 (ref), v72 (copy)
                    return v1.List.removeIndex(v74, v72);
                end);
            elseif v71 and not v73 then
                v25(function(v75) --[[ Line: 186 ]]
                    -- upvalues: v1 (ref), v70 (copy)
                    return v1.List.join(v75, {
                        v70
                    });
                end);
            end;
        end;
    end;
    v3.onDisposed(v14, v2.createEffect(v76));
    v3.onDisposed(v14, v2.createEffect(function(v77) --[[ Line: 193 ]]
        -- upvalues: v18 (copy), v15 (copy)
        local v78 = v18.getVolume(v77);
        for _, v80 in v15(v77) do
            v80.setVolume(v78);
        end;
    end));
    v3.onDisposed(v14, v2.createEffect(function(v81) --[[ Line: 200 ]]
        -- upvalues: v30 (copy), v36 (copy), v19 (copy), v23 (copy)
        local v82 = false;
        local v83 = v30(v81);
        if v83 and v83.getIsElapsed(v81) and v36(v81) then
            local v84 = v30(false);
            local v85;
            if v84 then
                local v86 = v19.getNext(v84.assetId);
                if v86 then
                    v85 = v23(v86);
                    v82 = true;
                end;
            end;
            if not v82 then
                v85 = nil;
            end;
            v82 = false;
            if v85 then
                v85.play();
            end;
        end;
    end));
    return {
        getAudioStores = v15, 
        stopAll = v42, 
        pauseAll = v45, 
        getLastPlayedAudioStore = v30, 
        getOrCreateAudioStore = v23, 
        getPlayingAudioStores = v24, 
        destroyAudioStore = v58, 
        destroy = v61, 
        getGlobalVolume = v18.getVolume, 
        setGlobalVolume = v18.setVolume, 
        mute = v18.mute, 
        unmute = v18.unmute, 
        getIsMuted = v18.getIsMuted, 
        hasNextSong = v36, 
        hasPrevSong = v39, 
        playNextSong = v49, 
        playPrevSong = v53, 
        setPlaylist = v19.set
    };
end;