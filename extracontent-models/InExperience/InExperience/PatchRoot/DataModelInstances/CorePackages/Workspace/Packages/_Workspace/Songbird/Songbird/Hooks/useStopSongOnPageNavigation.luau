local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.SignalsReact);
local v2 = require(l_script_FirstAncestor_0.Parent.MediaPlayback);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local l_GetFFlagSongDetailsPageRegressionTracking_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagSongDetailsPageRegressionTracking;
local l_getAudioPlaybackStore_0 = v2.getAudioPlaybackStore;
local l_useEffect_0 = v3.useEffect;
local l_useCallback_0 = v3.useCallback;
return function(v8, v9) --[[ Line: 26 ]] --[[ Name: useStopSongOnPageNavigation ]]
    -- upvalues: v1 (copy), l_getAudioPlaybackStore_0 (copy), l_useCallback_0 (copy), l_GetFFlagSongDetailsPageRegressionTracking_0 (copy), l_useEffect_0 (copy)
    local v10 = v1.useSignalState(l_getAudioPlaybackStore_0);
    local v13 = l_useCallback_0(function() --[[ Line: 29 ]]
        -- upvalues: v10 (copy), l_GetFFlagSongDetailsPageRegressionTracking_0 (ref), v9 (copy)
        for _, v12 in v10.getPlayingAudioStores(false) do
            v12.stop();
        end;
        if l_GetFFlagSongDetailsPageRegressionTracking_0() and v9 then
            v9();
        end;
    end, {
        v10, 
        if l_GetFFlagSongDetailsPageRegressionTracking_0() then v9 else nil
    });
    l_useEffect_0(function() --[[ Line: 41 ]]
        -- upvalues: v8 (copy), v13 (copy)
        if not v8 then
            v13();
        end;
    end, {
        v8, 
        v13
    });
    l_useEffect_0(function() --[[ Line: 47 ]]
        -- upvalues: v13 (copy)
        return v13;
    end, {
        v13
    });
end;