local l_script_FirstAncestor_0 = script:FindFirstAncestor("MediaPlayback");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Common.enableAudioPlaybackInApp);
local l_useEffect_0 = v1.useEffect;
local v4 = game:DefineFastInt("InitializeFmodMsDelay", 0);
return function() --[[ Line: 24 ]] --[[ Name: useLazyFmod ]]
    -- upvalues: l_useEffect_0 (copy), v4 (copy), v2 (copy)
    l_useEffect_0(function() --[[ Line: 25 ]]
        -- upvalues: v4 (ref), v2 (ref)
        task.delay(v4 / 1000, function() --[[ Line: 26 ]]
            -- upvalues: v2 (ref)
            v2();
        end);
    end, {});
end;