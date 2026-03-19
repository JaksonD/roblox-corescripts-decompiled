local l_CorePackages_0 = game:GetService("CorePackages");
local l_ReducerDependencies_0 = require(l_CorePackages_0.Workspace.Packages.NotificationsCommon).ReducerDependencies;
local l_ShareLinksNetworking_0 = l_ReducerDependencies_0.ShareLinksNetworking;
local l_ShareLinksRodux_0 = l_ReducerDependencies_0.ShareLinksRodux;
return function(v4) --[[ Line: 8 ]]
    -- upvalues: l_ShareLinksNetworking_0 (copy), l_ShareLinksRodux_0 (copy)
    return {
        shareInviteLink = v4.ShareLinks.Invites.ShareInviteLink, 
        fetchShareInviteLinkNetworkStatus = l_ShareLinksNetworking_0.GenerateLink.getStatus(v4, {
            linkType = l_ShareLinksRodux_0.Enums.LinkType.ExperienceInvite.rawValue()
        })
    };
end;