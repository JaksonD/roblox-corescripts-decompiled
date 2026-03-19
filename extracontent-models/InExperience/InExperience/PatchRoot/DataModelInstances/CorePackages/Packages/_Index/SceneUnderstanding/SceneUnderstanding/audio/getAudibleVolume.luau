local l_script_FirstAncestor_0 = script:FindFirstAncestor("SceneUnderstanding");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v2 = require(l_script_FirstAncestor_0.safelyAccessProperty);
return function(v3) --[[ Line: 19 ]] --[[ Name: getAudibleVolume ]]
    -- upvalues: v2 (copy), l_UserGameSettings_0 (copy)
    if not v3.IsPlaying then
        return 0;
    else
        local v4 = v2(l_UserGameSettings_0, "MasterVolume", 0);
        local v5 = v2(v3, "RollOffGain", 0);
        return v4 * (if v3.SoundGroup then v3.SoundGroup.Volume else 1) * v3.Volume * v5;
    end;
end;