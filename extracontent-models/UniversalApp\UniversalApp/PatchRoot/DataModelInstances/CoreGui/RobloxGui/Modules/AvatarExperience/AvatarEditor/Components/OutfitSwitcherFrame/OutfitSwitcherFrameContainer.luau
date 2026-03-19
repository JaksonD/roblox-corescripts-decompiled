local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.OutfitSwitcherFrame.useOutfitSwitcherFrameProps);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.OutfitSwitcherFrame.OutfitSwitcherFrame);
return function(v5) --[[ Line: 12 ]] --[[ Name: OutfitSwitcherFrameContainer ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy)
    local v6 = v3(v5);
    return v2.createElement(v4, v6);
end;