local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.useAvatarSwitcherFrameProps);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarSwitcherFrame);
return function() --[[ Line: 11 ]] --[[ Name: AvatarSwitcherFrameContainer ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy)
    local v5 = v3();
    return v2.createElement(v4, v5);
end;