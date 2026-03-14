local _ = game:GetService("Players");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Settings.Pages.ShareGame.NewInviteMenuExperimentManager);
game:DefineFastFlag("EnableNewInviteSendEndpoint", false);
game:DefineFastFlag("EnableNewInviteSendEndpointIXP", false);
return function() --[[ Line: 10 ]]
    -- upvalues: v2 (copy)
    return game:GetFastFlag("EnableNewInviteSendEndpoint") or game:GetFastFlag("EnableNewInviteSendEndpointIXP") and v2.default:getCustomizationEnabled();
end;