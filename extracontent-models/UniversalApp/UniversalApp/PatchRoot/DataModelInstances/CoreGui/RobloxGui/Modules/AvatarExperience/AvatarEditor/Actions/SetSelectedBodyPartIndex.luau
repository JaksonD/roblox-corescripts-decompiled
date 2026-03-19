local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v4 = require(l_Modules_0.LuaApp.mutedError);
return v2.makeActionCreator(script.Name, function(v5) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), v4 (copy)
    if v5 < 0 or #v3.BodyPartButtonData < v5 then
        v4("selectedBodyPartIndex is out of range");
    end;
    return {
        selectedBodyPartIndex = v5
    };
end);