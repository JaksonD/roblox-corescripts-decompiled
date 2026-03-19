local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
return function() --[[ Line: 6 ]] --[[ Name: getHasBackgroundMusic ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), l_GuiService_0 (copy)
    return l_IsVRAppBuild_0() or l_GuiService_0:IsTenFootInterface();
end;