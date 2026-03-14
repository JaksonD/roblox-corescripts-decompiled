local l_CorePackages_0 = game:GetService("CorePackages");
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
return function(v2) --[[ Line: 7 ]] --[[ Name: selectTopBarHeight ]]
    -- upvalues: l_IsVRAppBuild_0 (copy)
    if l_IsVRAppBuild_0() then
        return 0;
    else
        return v2.TopBar.topBarHeight;
    end;
end;