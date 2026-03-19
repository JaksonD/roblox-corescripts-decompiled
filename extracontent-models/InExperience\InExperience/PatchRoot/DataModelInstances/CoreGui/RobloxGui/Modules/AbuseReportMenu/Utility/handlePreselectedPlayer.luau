local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local v3 = require(l_script_FirstAncestor_0.Components.Constants);
local v4 = require(l_script_FirstAncestor_0.IXP.TnSIXPWrapper);
local l_FFlagAddPreselectedAbuseTypeAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddPreselectedAbuseTypeAnalytics;
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local function _(v7) --[[ Line: 14 ]]
    -- upvalues: l_default_0 (copy)
    return l_default_0:getRecentUsersInteractionData()[tostring(v7.UserId)] ~= nil;
end;
handlePreselectedPlayer = function(v9, v10, v11, v12) --[[ Line: 19 ]] --[[ Name: handlePreselectedPlayer ]]
    -- upvalues: l_default_0 (copy), v3 (copy), l_FFlagAddPreselectedAbuseTypeAnalytics_0 (copy), v4 (copy)
    if v10 and l_default_0:getRecentUsersInteractionData()[tostring(v9.UserId)] ~= nil then
        v11({
            type = v3.PlayerMenuActions.UpdateMethodOfAbuse, 
            methodOfAbuse = v3.AbuseMethods.VoiceChat
        });
        v12({
            type = v3.AnalyticsActions.SetTypeOfAbuseSelection, 
            selection = v3.AbuseMethods.VoiceChat
        });
        if l_FFlagAddPreselectedAbuseTypeAnalytics_0 then
            v12({
                type = v3.AnalyticsActions.SetPreselectedAbuseSelection, 
                selection = v3.AbuseMethods.VoiceChat
            });
        end;
    elseif v4.getReportAnythingAvatarEnabled() then
        v11({
            type = v3.PlayerMenuActions.UpdateMethodOfAbuse, 
            methodOfAbuse = v3.AbuseMethods.TextChat
        });
        v12({
            type = v3.AnalyticsActions.SetTypeOfAbuseSelection, 
            selection = v3.AbuseMethods.TextChat
        });
        if l_FFlagAddPreselectedAbuseTypeAnalytics_0 then
            v12({
                type = v3.AnalyticsActions.SetPreselectedAbuseSelection, 
                selection = v3.AbuseMethods.TextChat
            });
        end;
    elseif l_FFlagAddPreselectedAbuseTypeAnalytics_0 then
        v12({
            type = v3.AnalyticsActions.SetPreselectedAbuseSelection, 
            selection = "None"
        });
    end;
    v11({
        type = v3.PlayerMenuActions.SetPreselectedPlayer, 
        player = v9
    });
end;
return handlePreselectedPlayer;