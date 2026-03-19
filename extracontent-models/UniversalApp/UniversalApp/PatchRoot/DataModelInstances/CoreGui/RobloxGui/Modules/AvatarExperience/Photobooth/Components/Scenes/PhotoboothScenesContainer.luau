local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Photobooth.Components.Scenes.usePhotoboothScenesProps);
local v4 = require(l_Modules_0.AvatarExperience.Photobooth.Components.Scenes.PhotoboothScenes);
return function(v5) --[[ Line: 13 ]] --[[ Name: PhotoboothScenesContainer ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy)
    local v6 = v3(v5.Position, v5.onTileClicked);
    return v2.createElement(v4, v6);
end;