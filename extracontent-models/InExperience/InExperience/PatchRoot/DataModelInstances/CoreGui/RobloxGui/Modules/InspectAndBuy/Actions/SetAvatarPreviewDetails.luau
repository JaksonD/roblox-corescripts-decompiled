local l_CorePackages_0 = game:GetService("CorePackages");
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceInspectAndBuy);
return l_makeActionCreator_0(script.Name, function(v3) --[[ Line: 10 ]]
    return {
        avatarPreviewDetails = v3 or {}
    };
end);