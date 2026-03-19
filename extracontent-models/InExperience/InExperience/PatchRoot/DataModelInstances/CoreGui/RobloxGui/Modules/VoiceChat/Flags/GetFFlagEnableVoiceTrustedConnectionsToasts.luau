local l_CorePackages_0 = game:GetService("CorePackages");
local l_GetFFlagEmitVoiceRejoinStatus_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore).Flags.GetFFlagEmitVoiceRejoinStatus;
local v2 = require(script.Parent.GetFFlagUpdateVoiceConnectionToasts);
game:DefineFastFlag("EnableVoiceTrustedConnectionsToasts", false);
return function() --[[ Line: 9 ]]
    -- upvalues: v2 (copy), l_GetFFlagEmitVoiceRejoinStatus_0 (copy)
    return v2() and l_GetFFlagEmitVoiceRejoinStatus_0() and game:GetFastFlag("EnableVoiceTrustedConnectionsToasts");
end;