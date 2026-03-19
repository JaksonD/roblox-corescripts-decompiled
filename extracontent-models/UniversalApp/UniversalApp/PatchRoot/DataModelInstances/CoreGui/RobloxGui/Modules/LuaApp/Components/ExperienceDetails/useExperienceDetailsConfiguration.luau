local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
return function() --[[ Line: 8 ]] --[[ Name: useExperienceDetailsConfiguration ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v1 (copy), l_IsVRAppBuild_0 (copy)
    local v5 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    return (v1.useMemo(function() --[[ Line: 12 ]]
        -- upvalues: v5 (copy), l_IsVRAppBuild_0 (ref)
        return {
            showLogoTraySection = not v5, 
            showEventsList = not v5, 
            showCommunityLink = not v5 and not l_IsVRAppBuild_0(), 
            showCornerGradientPropEnabled = v5
        };
    end, {
        v5
    }));
end;