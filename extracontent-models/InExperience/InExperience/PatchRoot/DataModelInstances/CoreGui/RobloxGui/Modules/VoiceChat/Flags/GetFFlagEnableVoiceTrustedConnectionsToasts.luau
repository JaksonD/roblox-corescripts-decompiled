local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore);
local v2 = require(script.Parent.GetFFlagUpdateVoiceConnectionToasts);
game:DefineFastFlag("EnableVoiceTrustedConnectionsToasts", false);
return function() --[[ Line: 7 ]]
    -- upvalues: v2 (copy)
    return v2() and game:GetFastFlag("EnableVoiceTrustedConnectionsToasts");
end;