local l_CorePackages_0 = game:GetService("CorePackages");
local l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints;
game:DefineFastFlag("EnableLeaveGameUpsellEntrypoint", false);
return function() --[[ Line: 6 ]]
    -- upvalues: l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0 (copy)
    return l_GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints_0() and game:GetFastFlag("EnableLeaveGameUpsellEntrypoint");
end;