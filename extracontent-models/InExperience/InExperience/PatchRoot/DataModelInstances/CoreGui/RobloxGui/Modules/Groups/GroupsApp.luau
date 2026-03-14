local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Workspace.Packages.Groups).GroupsInExperienceApp.createApp();
v3.mountCoreUI(l_RobloxGui_0);
return v3;