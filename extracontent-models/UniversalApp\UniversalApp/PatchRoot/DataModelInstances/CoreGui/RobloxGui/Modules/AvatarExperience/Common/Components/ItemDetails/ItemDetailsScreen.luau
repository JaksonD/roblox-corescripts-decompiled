local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation;
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemDetails);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.ItemDetails_DEPRECATED);
return require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(if l_FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation_0 then v4 else v5);