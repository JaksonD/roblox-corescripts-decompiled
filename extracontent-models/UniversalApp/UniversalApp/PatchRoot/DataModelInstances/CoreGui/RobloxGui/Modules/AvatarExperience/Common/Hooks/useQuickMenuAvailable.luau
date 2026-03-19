local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local l_useLastInputMethod_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).useLastInputMethod;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
return function() --[[ Line: 16 ]] --[[ Name: useQuickMenuAvailable ]]
    -- upvalues: l_useAvatarRoute_0 (copy), v3 (copy), v4 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), l_useLastInputMethod_0 (copy), l_IsVRAppBuild_0 (copy)
    local l_name_0 = l_useAvatarRoute_0().opaque.name;
    local v12 = v3.useCallback(function(v11) --[[ Line: 18 ]]
        -- upvalues: l_name_0 (copy), v4 (ref)
        return v11.AvatarExperience.Common.FullView[l_name_0] == v4.SceneFullView;
    end, {
        l_name_0
    });
    local v13 = l_useSelector_0(v12, l_getUseSelectorDeepEquals_0());
    local v14 = l_useLastInputMethod_0() == "Gamepad";
    if v13 or l_IsVRAppBuild_0() or not v14 then
        return false;
    else
        return true;
    end;
end;