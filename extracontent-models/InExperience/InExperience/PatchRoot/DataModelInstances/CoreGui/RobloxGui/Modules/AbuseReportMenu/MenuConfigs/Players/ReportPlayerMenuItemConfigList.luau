local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_MenuConfigs_0 = l_script_FirstAncestor_0.MenuConfigs;
local v4 = require(l_MenuConfigs_0.Players.MethodOfAbuseModalMenuConfig);
local v5 = require(l_MenuConfigs_0.Players.OptionalAttachScreenshotMenuConfig);
local v6 = require(l_MenuConfigs_0.Players.PlayerModalSelectorMenuConfig);
local v7 = require(l_MenuConfigs_0.Players.ChatModalSelectorMenuConfig);
local v8 = require(l_MenuConfigs_0.Players.AbuseReasonModalSelectorMenuConfig);
local v9 = require(l_MenuConfigs_0.Players.SubmitReportButtonMenuConfig);
local v10 = require(l_MenuConfigs_0.Players.FreeFormCommentMenuConfig);
if require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagInGameMenuAddChatLineReporting then
    return {
        v4, 
        v6, 
        v7, 
        v8, 
        v5, 
        v10, 
        v9
    };
else
    return {
        v4, 
        v6, 
        v8, 
        v5, 
        v10, 
        v9
    };
end;