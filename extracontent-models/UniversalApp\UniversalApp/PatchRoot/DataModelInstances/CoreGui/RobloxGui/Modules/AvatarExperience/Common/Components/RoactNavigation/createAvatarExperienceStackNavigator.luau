local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_createNavigator_0 = v2.createNavigator;
local l_RobloxStackView_0 = v2.RobloxStackView;
local v5 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigationCore);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceStackRouter);
return function(v8, v9) --[[ Line: 19 ]]
    -- upvalues: v7 (copy), l_createNavigator_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v5 (copy), l_RobloxStackView_0 (copy)
    local v10 = v7(v8, v9);
    return l_createNavigator_0(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v5.AppStackView else l_RobloxStackView_0, v10, v9 or {});
end;