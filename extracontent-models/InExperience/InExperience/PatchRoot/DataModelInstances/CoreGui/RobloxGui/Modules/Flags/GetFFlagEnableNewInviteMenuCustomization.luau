local _ = game:GetService("Players");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Settings.Pages.ShareGame.NewInviteMenuExperimentManager);
game:DefineFastFlag("EnableNewInviteMenuCustomization2", false);
game:DefineFastFlag("EnableNewInviteMenuCustomizationIXP2", false);
return function() --[[ Line: 10 ]]
    -- upvalues: v2 (copy)
    return game:GetFastFlag("EnableNewInviteMenuCustomization2") or game:GetFastFlag("EnableNewInviteMenuCustomizationIXP2") and v2.default:getCustomizationEnabled();
end;