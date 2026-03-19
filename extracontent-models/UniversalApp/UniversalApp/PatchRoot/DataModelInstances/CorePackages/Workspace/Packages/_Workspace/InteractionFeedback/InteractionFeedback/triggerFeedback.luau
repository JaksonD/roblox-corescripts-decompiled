local l_Parent_0 = script:FindFirstAncestor("InteractionFeedback").Parent;
local v1 = require(l_Parent_0.SoundManager);
local l_SoundManager_0 = v1.SoundManager;
local l_Sounds_0 = v1.Sounds;
local l_SoundGroups_0 = v1.SoundGroups;
local _ = require(script.Parent.InteractionFeedbackContext);
local v6 = require(script.Parent.triggerHaptic);
l_SoundManager_0.init();
local l_FFlagLuaAppHapticTriggeredTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHapticTriggeredTelemetry;
return function(v8, v9, v10, v11, v12, v13, v14) --[[ Line: 19 ]] --[[ Name: triggerFeedback ]]
    -- upvalues: l_Sounds_0 (copy), l_SoundManager_0 (copy), l_SoundGroups_0 (copy), v6 (copy), l_FFlagLuaAppHapticTriggeredTelemetry_0 (copy)
    if not v10 then
        error("No config table was provided to InteractionFeedbackManager. Something is wrong.");
    end;
    local v15 = v10[v8];
    if not v15 then
        return;
    else
        local v16 = v15[v9];
        if not v16 then
            return;
        else
            local l_Sound_0 = v16.Sound;
            if l_Sound_0 then
                local v18 = l_Sounds_0[l_Sound_0];
                if not v18 then
                    error("Sound " .. l_Sound_0 .. " not found in SoundManager given contextKey: " .. v8 .. " and interactionType: " .. tostring(v9) .. ". Please check the Sounds.lua file.");
                end;
                l_SoundManager_0:PlaySound(v18.Name, {}, l_SoundGroups_0.AppBackground);
            end;
            local l_Haptic_0 = v16.Haptic;
            if l_Haptic_0 then
                v6(l_Haptic_0, v11, v12, if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v8 else nil, if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v9 else nil, if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v13 else nil, if l_FFlagLuaAppHapticTriggeredTelemetry_0 then v14 else nil);
            end;
            return;
        end;
    end;
end;