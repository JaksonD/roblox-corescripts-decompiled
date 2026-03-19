local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local l_React_0 = require(l_script_FirstAncestor_0.dependencies).React;
local l_default_0 = require(l_script_FirstAncestor_0.CrossExperienceVoiceManager).default;
local v3 = l_default_0:getAudioFocusService();
return function() --[[ Line: 8 ]]
    -- upvalues: l_React_0 (copy), v3 (copy), l_default_0 (copy)
    local v4, v5 = l_React_0.useState(-1);
    if v3 then
        l_React_0.useEffect(function() --[[ Line: 12 ]]
            -- upvalues: v5 (copy), l_default_0 (ref), v3 (ref)
            v5(l_default_0:getCurrentAudioContext());
            v3.OnContextRegistered:Connect(function() --[[ Line: 15 ]]
                -- upvalues: v5 (ref), l_default_0 (ref)
                v5(l_default_0:getCurrentAudioContext());
            end);
            v3.OnContextUnregistered:Connect(function() --[[ Line: 19 ]]
                -- upvalues: v5 (ref), l_default_0 (ref)
                v5(l_default_0:getCurrentAudioContext());
            end);
            v3.OnDeafenVoiceAudio:Connect(function(_) --[[ Line: 23 ]]
                -- upvalues: v5 (ref), l_default_0 (ref)
                v5(l_default_0:getCurrentAudioContext());
            end);
            v3.OnUndeafenVoiceAudio:Connect(function(_) --[[ Line: 27 ]]
                -- upvalues: v5 (ref), l_default_0 (ref)
                v5(l_default_0:getCurrentAudioContext());
            end);
        end, {});
    end;
    return v4;
end;