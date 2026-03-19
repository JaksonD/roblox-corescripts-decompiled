local l_script_FirstAncestor_0 = script:FindFirstAncestor("MediaPlayback");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.Stores.getAudioPlaybackStore.types);
local v3 = require(l_script_FirstAncestor_0.Stores.getAudioPlaybackStore);
local l_useEffect_0 = v1.useEffect;
local l_useMemo_0 = v1.useMemo;
return function(v6) --[[ Line: 11 ]] --[[ Name: useAudioStore ]]
    -- upvalues: l_useMemo_0 (copy), v3 (copy), l_useEffect_0 (copy)
    local v7 = v6 or "-1";
    local v8 = l_useMemo_0(function() --[[ Line: 14 ]]
        -- upvalues: v3 (ref), v7 (copy)
        return v3(false).getOrCreateAudioStore(v7);
    end, {
        v7
    });
    l_useEffect_0(function() --[[ Line: 19 ]]
        -- upvalues: v3 (ref), v7 (copy)
        return function() --[[ Line: 20 ]]
            -- upvalues: v3 (ref), v7 (ref)
            v3(false).destroyAudioStore(v7);
        end;
    end, {
        v7
    });
    return v8;
end;