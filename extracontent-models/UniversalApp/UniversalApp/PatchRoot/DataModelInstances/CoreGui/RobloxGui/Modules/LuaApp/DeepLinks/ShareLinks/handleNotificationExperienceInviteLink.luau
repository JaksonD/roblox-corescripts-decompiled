local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).GameProtocol.default;
local v2 = require(script.Parent.ShareLinkTypes);
local _ = require(script.Parent.Types);
local v4 = require(script.Parent.Flags.FFlagShareLinkAddReferredByPlayerIdLaunchParam);
return function(v5, v6) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), v2 (copy), l_default_0 (copy)
    local l_notificationExperienceInviteData_0 = v5.responseBody.notificationExperienceInviteData;
    if not l_notificationExperienceInviteData_0 or not l_notificationExperienceInviteData_0.placeId then
        return;
    else
        local v8 = l_notificationExperienceInviteData_0.launchData and l_notificationExperienceInviteData_0.launchData ~= "";
        local v9 = v4 and l_notificationExperienceInviteData_0.inviterId;
        local v10 = {
            launchData = if v8 then l_notificationExperienceInviteData_0.launchData else nil, 
            userId = l_notificationExperienceInviteData_0.inviterId, 
            referredByPlayerId = if v9 then l_notificationExperienceInviteData_0.inviterId else nil
        };
        v6.launchGame(l_notificationExperienceInviteData_0.placeId, v2.NotificationExperienceInviteLinkType, v10, l_default_0, "NotificationExperienceInviteLink");
        return;
    end;
end;