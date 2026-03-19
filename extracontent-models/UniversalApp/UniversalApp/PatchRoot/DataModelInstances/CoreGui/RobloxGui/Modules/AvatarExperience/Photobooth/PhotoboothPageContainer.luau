local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Photobooth.PhotoboothPage);
local v4 = require(l_Modules_0.AvatarExperience.Photobooth.usePhotoboothPageProps);
return (require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function() --[[ Line: 11 ]] --[[ Name: PhotoboothPageContainer ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local v5 = v4();
    return v2.createElement(v3, v5);
end));