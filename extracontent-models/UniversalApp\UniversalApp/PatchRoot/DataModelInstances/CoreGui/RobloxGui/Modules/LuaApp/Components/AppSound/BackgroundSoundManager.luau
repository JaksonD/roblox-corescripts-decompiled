local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.ExperienceEventReceiver);
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local v6 = v3.new();
local v7 = game:DefineFastInt("AppMusicVolumePercentage", 25) / 100;
return function() --[[ Line: 13 ]]
    -- upvalues: v1 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), v7 (copy), v6 (copy)
    v1.useEffect(function() --[[ Line: 14 ]]
        -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref), v7 (ref), v6 (ref)
        l_SoundManager_0:PlaySound(l_Sounds_0.VRAppLobbySound.Name, {
            Volume = v7, 
            Looped = true, 
            FadeInTime = 3
        });
        local v8 = v6:onLaunched(function() --[[ Line: 21 ]]
            -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref)
            l_SoundManager_0:StopSound(l_Sounds_0.VRAppLobbySound.Name);
        end);
        local v9 = v6:onLeft(function() --[[ Line: 25 ]]
            -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref), v7 (ref)
            l_SoundManager_0:PlaySound(l_Sounds_0.VRAppLobbySound.Name, {
                Volume = v7, 
                Looped = true, 
                FadeInTime = 3
            });
        end);
        return function() --[[ Line: 33 ]]
            -- upvalues: v8 (copy), v9 (copy)
            v8:disconnect();
            v9:disconnect();
        end;
    end, {});
end;