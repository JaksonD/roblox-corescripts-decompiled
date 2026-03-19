local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.TrustAndSafetyIxp).TrustAndSafetyIXPManager.default;
return {
    getReportAnythingAvatarEnabled = function() --[[ Line: 9 ]] --[[ Name: getReportAnythingAvatarEnabled ]]
        -- upvalues: l_default_0 (copy)
        return l_default_0:getReportAnythingAvatarEnabled();
    end, 
    getReportAnythingExperienceEnabled = function() --[[ Line: 12 ]] --[[ Name: getReportAnythingExperienceEnabled ]]
        -- upvalues: l_default_0 (copy)
        return l_default_0:getReportAnythingExperienceEnabled();
    end
};