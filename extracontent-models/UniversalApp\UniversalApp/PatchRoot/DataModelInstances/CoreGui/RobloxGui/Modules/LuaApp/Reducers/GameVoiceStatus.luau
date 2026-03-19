local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.SetGameVoiceStatus);
return function(v4, v5) --[[ Line: 6 ]]
    -- upvalues: v3 (copy), v2 (copy)
    v4 = v4 or {};
    if v5.type == v3.name then
        v4 = v2.Dictionary.join(v4, {
            [v5.universeId] = v5.isUniverseEnabledForVoice
        });
    end;
    return v4;
end;