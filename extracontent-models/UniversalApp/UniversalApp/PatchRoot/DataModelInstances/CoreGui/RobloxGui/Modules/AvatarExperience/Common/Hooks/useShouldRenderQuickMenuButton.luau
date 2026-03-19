local l_CorePackages_0 = game:GetService("CorePackages");
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_useLastInputMethod_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).useLastInputMethod;
return function() --[[ Line: 6 ]] --[[ Name: useShouldRenderQuickMenuButton ]]
    -- upvalues: l_useLastInputMethod_0 (copy), l_IsVRAppBuild_0 (copy)
    local v3 = l_useLastInputMethod_0() == "Gamepad";
    if l_IsVRAppBuild_0() or not v3 then
        return false;
    else
        return true;
    end;
end;