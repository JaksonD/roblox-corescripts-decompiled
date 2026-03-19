local l_script_FirstAncestor_0 = script:FindFirstAncestor("SceneUnderstanding");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v2 = require(l_script_FirstAncestor_0.safelyAccessProperty);
local v3 = require(l_script_FirstAncestor_0.wiring.getOutputWires);
local _ = require(l_script_FirstAncestor_0.wiring.types);
local v5 = require(l_script_FirstAncestor_0.wiring.toWirableInstance);
local function _(v6) --[[ Line: 13 ]] --[[ Name: calculateSoundPotentialAudibility ]]
    -- upvalues: v2 (copy)
    if not v6.IsPlaying then
        return 0;
    else
        local v7 = v2(v6, "RollOffGain", 0);
        local v8 = if v6.SoundGroup then v6.SoundGroup.Volume else 1;
        if v7 < 1 then
            v7 = v7 / 10;
        end;
        return v8 * v6.Volume * v7;
    end;
end;
local function v15(v10) --[[ Line: 41 ]] --[[ Name: getOutputsOf ]]
    -- upvalues: v3 (copy), v5 (copy)
    if typeof(v10) == "Instance" and v10:IsA("AudioEmitter") then
        return (v10:GetInteractingListeners());
    else
        local v11 = {};
        for _, v13 in v3(v10) do
            local v14 = v5(v13.TargetInstance);
            if v14 then
                table.insert(v11, v14);
            end;
        end;
        return v11;
    end;
end;
local _ = function(v16) --[[ Line: 60 ]] --[[ Name: getAudibilityMultiplierFor ]]
    local v17 = 0;
    for _, v19 in v16:GetInteractingListeners() do
        v17 = v17 + v19:GetAudibilityFor(v16);
    end;
    return v17;
end;
local function v21(v22, v23) --[[ Line: 68 ]] --[[ Name: getAudibilityOf ]]
    -- upvalues: v15 (copy), v21 (copy)
    local v24 = v23 or {};
    if v24[v22] then
        return 0;
    else
        v24[v22] = true;
        local v25 = 1;
        if typeof(v22) == "Instance" then
            if v22:IsA("AudioPlayer") or v22:IsA("AudioFader") then
                v25 = v22.Volume;
            elseif v22:IsA("AudioEmitter") then
                local v26 = 0;
                for _, v28 in v22:GetInteractingListeners() do
                    v26 = v26 + v28:GetAudibilityFor(v22);
                end;
                v25 = v26;
            elseif v22:IsA("AudioDeviceOutput") then
                return 1;
            end;
        end;
        local v29 = 0;
        for _, v31 in v15(v22) do
            v29 = v29 + v25 * v21(v31, v24);
        end;
        return v29;
    end;
end;
return function(v32) --[[ Line: 105 ]] --[[ Name: calculatePotentialAudibility ]]
    -- upvalues: v2 (copy), l_UserGameSettings_0 (copy), v21 (copy)
    local v33 = v2(l_UserGameSettings_0, "MasterVolume", 0);
    local v34 = 0;
    if v32:IsA("Sound") then
        if not v32.IsPlaying then
            v34 = 0;
        else
            local v35 = v2(v32, "RollOffGain", 0);
            local v36 = if v32.SoundGroup then v32.SoundGroup.Volume else 1;
            if v35 < 1 then
                v35 = v35 / 10;
            end;
            v34 = v36 * v32.Volume * v35;
        end;
    else
        v34 = v21(v32);
    end;
    return v33 * v34;
end;