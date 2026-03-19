local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_CorePackages_0.Workspace.Packages.TnSAvatarIdentification);
local v5 = require(l_CorePackages_0.Workspace.Packages.TnSAdIdentification);
local l_ScreenshotManager_0 = require(l_CorePackages_0.Workspace.Packages.TnSScreenshot).ScreenshotManager;
local l_AvatarIdentification_0 = v4.AvatarIdentification;
local l_AdIdentification_0 = v5.AdIdentification;
return function(v9, v10, v11) --[[ Line: 18 ]]
    -- upvalues: v2 (copy), l_ScreenshotManager_0 (copy), l_AvatarIdentification_0 (copy), l_AdIdentification_0 (copy)
    return v2.useCallback(function() --[[ Line: 23 ]]
        -- upvalues: l_ScreenshotManager_0 (ref), v10 (copy), v9 (copy), l_AvatarIdentification_0 (ref), l_AdIdentification_0 (ref), v11 (copy)
        l_ScreenshotManager_0:TakeScreenshotWithCallback(v10, v9);
        local v12, v13 = l_AvatarIdentification_0.getVisibleAvatars();
        local v14, v15 = l_AdIdentification_0.getVisibleAds();
        v11({
            identifiedAvatars = v12, 
            identifiedAds = v14, 
            avatarIDStats = v13, 
            adIDStats = v15
        });
    end, {
        v10, 
        v9, 
        v11
    });
end;