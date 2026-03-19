local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(script.Parent.VolumeSettings);
return function(v4) --[[ Line: 15 ]] --[[ Name: PartyVoiceVolumeSettings ]]
    -- upvalues: v2 (copy), l_UserGameSettings_0 (copy), v3 (copy)
    local v5, v6 = v2.useState(l_UserGameSettings_0.PartyVoiceVolume);
    local v8 = v2.useCallback(function(v7) --[[ Line: 18 ]]
        -- upvalues: l_UserGameSettings_0 (ref)
        l_UserGameSettings_0.PartyVoiceVolume = v7 / 10;
    end, {});
    v2.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v6 (copy)
        local v9 = l_UserGameSettings_0:GetPropertyChangedSignal("PartyVoiceVolume"):Connect(function() --[[ Line: 25 ]]
            -- upvalues: v6 (ref), l_UserGameSettings_0 (ref)
            v6(l_UserGameSettings_0.PartyVoiceVolume);
        end);
        return function() --[[ Line: 28 ]]
            -- upvalues: v9 (copy)
            if v9 then
                v9:Disconnect();
            end;
        end;
    end);
    return v2.createElement(v3, {
        formFactor = v4.formFactor, 
        layoutOrder = v4.layoutOrder, 
        sliderGuiObjectRef = v4.sliderGuiObjectRef, 
        value = v5, 
        onValueChanged = v8, 
        volumeHeaderKey = "CoreScripts.InGameMenu.GameSettings.PartyVoiceVolume", 
        volumeSliderDescriptionKey = "Application.Settings.PartyVoiceVolumeSliderDescription"
    });
end;