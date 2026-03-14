local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
return function() --[[ Line: 7 ]]
    -- upvalues: l_Enabled_0 (copy), v2 (copy)
    return l_Enabled_0() and not v2();
end;