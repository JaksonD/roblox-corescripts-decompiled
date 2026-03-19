local l_script_FirstAncestor_0 = script:FindFirstAncestor("MediaPlayback");
local v1 = require(l_script_FirstAncestor_0.Parent.SignalsReact);
local _ = require(l_script_FirstAncestor_0.Stores.getAudioPlaybackStore.types);
local v3 = require(l_script_FirstAncestor_0.Stores.getAudioPlaybackStore);
local v4 = require(l_script_FirstAncestor_0.Hooks.useAudioStore);
local l_useSignalState_0 = v1.useSignalState;
return function() --[[ Line: 11 ]] --[[ Name: useLastPlayedAudioStore ]]
    -- upvalues: l_useSignalState_0 (copy), v3 (copy), v4 (copy)
    local v6 = l_useSignalState_0(v3);
    local v7 = l_useSignalState_0(v6.getLastPlayedAudioStore);
    return v4(if v7 then v7.assetId else nil);
end;