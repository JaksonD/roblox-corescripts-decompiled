local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v1 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
game:DefineFastFlag("EnableAlwaysAvailableCamera", false);
return function() --[[ Line: 10 ]]
    -- upvalues: v1 (copy)
    return game:GetFastFlag("EnableAlwaysAvailableCamera") and v1();
end;