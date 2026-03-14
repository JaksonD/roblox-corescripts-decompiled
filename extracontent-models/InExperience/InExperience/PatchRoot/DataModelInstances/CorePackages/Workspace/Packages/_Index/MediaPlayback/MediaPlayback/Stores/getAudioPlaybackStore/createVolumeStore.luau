local l_script_FirstAncestor_0 = script:FindFirstAncestor("MediaPlayback");
local v1 = require(l_script_FirstAncestor_0.Parent.Signals);
local l_createSignal_0 = v1.createSignal;
local l_createComputed_0 = v1.createComputed;
return function() --[[ Line: 16 ]] --[[ Name: createVolumeStore ]]
    -- upvalues: l_createSignal_0 (copy), l_createComputed_0 (copy)
    local v4, v5 = l_createSignal_0(1);
    local v6, v7 = l_createSignal_0(v4(false));
    local v9 = l_createComputed_0(function(v8) --[[ Line: 20 ]]
        -- upvalues: v4 (copy)
        return v4(v8) <= 0;
    end);
    return {
        getVolume = v4, 
        setVolume = function(v10) --[[ Line: 24 ]] --[[ Name: setClampedVolume ]]
            -- upvalues: v5 (copy)
            v5((math.clamp(v10, 0, 1)));
        end, 
        getIsMuted = v9, 
        mute = function() --[[ Line: 28 ]] --[[ Name: mute ]]
            -- upvalues: v9 (copy), v7 (copy), v4 (copy), v5 (copy)
            if not v9(false) then
                v7(v4(false));
                v5(0);
            end;
        end, 
        unmute = function() --[[ Line: 35 ]] --[[ Name: unmute ]]
            -- upvalues: v9 (copy), v5 (copy), v6 (copy)
            if v9(false) then
                v5(v6(false));
            end;
        end
    };
end;