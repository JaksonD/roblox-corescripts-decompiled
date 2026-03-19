local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GetFFlagEnableAppChatInExperience_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience;
local v3 = require(l_script_FirstAncestor_0.Flags.GetShouldShowPlatformChatBasedOnPolicy);
return function() --[[ Line: 9 ]]
    -- upvalues: l_GetFFlagEnableAppChatInExperience_0 (copy), v3 (copy)
    return l_GetFFlagEnableAppChatInExperience_0() and v3();
end;