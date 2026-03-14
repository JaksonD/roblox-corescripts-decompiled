local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
return function() --[[ Line: 19 ]] --[[ Name: useCategoryInfo ]]
    -- upvalues: l_useAvatarRoute_0 (copy), v2 (copy), v4 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy)
    local v7 = l_useAvatarRoute_0();
    local v9 = v2.useCallback(function(v8) --[[ Line: 21 ]]
        -- upvalues: v4 (ref), v7 (copy)
        return v4.getCategoryInfoFromState(v8, v7);
    end, {
        v7
    });
    return l_useSelector_0(v9, l_getUseSelectorDeepEquals_0());
end;