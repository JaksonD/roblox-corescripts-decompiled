local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: l_default_0 (copy)
    return l_default_0:GetIcon(v2, v3);
end;