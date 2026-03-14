local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsPlayerFeedback).createApp();
v2.instance.Parent = l_RobloxGui_0;
return v2;