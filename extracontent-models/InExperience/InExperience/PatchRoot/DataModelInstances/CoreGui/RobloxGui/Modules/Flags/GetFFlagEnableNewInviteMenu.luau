local l_Players_0 = game:GetService("Players");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Settings.Pages.ShareGame.NewInviteMenuExperimentManager);
game:DefineFastInt("EnableNewInviteMenuStyleRollout", 0);
game:DefineFastFlag("EnableNewInviteMenuStyle", false);
return function() --[[ Line: 10 ]]
    -- upvalues: l_Players_0 (copy), v2 (copy)
    if not l_Players_0.LocalPlayer then
        return false;
    elseif game:GetFastFlag("EnableNewInviteMenuStyle") then
        return true;
    else
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if game:GetFastInt("EnableNewInviteMenuStyleRollout") > l_LocalPlayer_0.UserId % 100 then
            return true;
        else
            return v2.default:getStyleEnabled();
        end;
    end;
end;