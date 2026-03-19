local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local l_SoundService_0 = game:GetService("SoundService");
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.useTimedLoop);
local l_useState_0 = v3.useState;
local function v9() --[[ Line: 13 ]] --[[ Name: getAllAudioSources ]]
    -- upvalues: l_SoundService_0 (copy), v2 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 20 ]]
        -- upvalues: l_SoundService_0 (ref)
        return l_SoundService_0:GetAudioInstances();
    end);
    if l_status_0 then
        return v2.List.filter(l_result_0, function(v8) --[[ Line: 25 ]]
            return v8:IsA("Sound") or v8:IsA("AudioPlayer");
        end);
    else
        return {};
    end;
end;
return function() --[[ Line: 33 ]] --[[ Name: useAudioSources ]]
    -- upvalues: l_useState_0 (copy), v9 (copy), v4 (copy)
    local v10, v11 = l_useState_0(v9);
    v4(1, function() --[[ Line: 36 ]]
        -- upvalues: v11 (copy), v9 (ref)
        v11(v9());
    end);
    return v10;
end;