local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v3 = require(l_script_FirstAncestor_0.SceneAnalysisContext);
local v4 = require(l_script_FirstAncestor_0.enums);
local v5 = require(l_script_FirstAncestor_0.useCameraState);
local v6 = require(l_script_FirstAncestor_0.audio.sortByAudibleVolume);
local v7 = require(l_script_FirstAncestor_0.audio.useAudioSources);
local v8 = require(l_script_FirstAncestor_0.useTimedLoop);
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_usePrevious_0 = v2.usePrevious;
return function() --[[ Line: 31 ]] --[[ Name: useAudibleSounds ]]
    -- upvalues: v3 (copy), v7 (copy), v5 (copy), l_usePrevious_0 (copy), l_useCallback_0 (copy), v6 (copy), v8 (copy), l_useEffect_0 (copy), v4 (copy)
    local v12 = v3.use();
    local v13 = v7();
    local v14 = v5();
    local v15 = l_usePrevious_0(v14);
    local v16 = l_useCallback_0(function() --[[ Line: 37 ]]
        -- upvalues: v12 (copy), v6 (ref), v13 (copy)
        v12.setAudibleSounds(v6(v13));
    end, {
        v13, 
        v12.setAudibleSounds
    });
    v8(1, function() --[[ Line: 56 ]]
        -- upvalues: v16 (copy)
        v16();
    end);
    l_useEffect_0(function() --[[ Line: 60 ]]
        -- upvalues: v12 (copy), v13 (copy), v16 (copy)
        if #v12.audibleSounds == 0 and #v13 > 0 then
            v16();
        end;
    end, {
        #v12.audibleSounds, 
        #v13, 
        v16
    });
    l_useEffect_0(function() --[[ Line: 66 ]]
        -- upvalues: v14 (copy), v15 (copy), v4 (ref), v16 (copy)
        if v14 ~= v15 and v14 == v4.CameraState.Idle then
            v16();
        end;
    end, {
        v14, 
        v15, 
        v16
    });
    return v12.audibleSounds;
end;