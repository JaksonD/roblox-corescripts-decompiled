local l_CorePackages_0 = game:GetService("CorePackages");
local l_ReducerDependencies_0 = require(l_CorePackages_0.Workspace.Packages.NotificationsCommon).ReducerDependencies;
local l_ShareLinksNetworking_0 = l_ReducerDependencies_0.ShareLinksNetworking;
local l_ShareLinksRodux_0 = l_ReducerDependencies_0.ShareLinksRodux;
return function(v4) --[[ Line: 7 ]]
    -- upvalues: l_ShareLinksNetworking_0 (copy), l_ShareLinksRodux_0 (copy)
    return {
        fetchShareInviteLink = function() --[[ Line: 9 ]] --[[ Name: fetchShareInviteLink ]]
            -- upvalues: v4 (copy), l_ShareLinksNetworking_0 (ref), l_ShareLinksRodux_0 (ref)
            v4(l_ShareLinksNetworking_0.GenerateLink.API({
                linkType = l_ShareLinksRodux_0.Enums.LinkType.ExperienceInvite.rawValue()
            }));
        end
    };
end;