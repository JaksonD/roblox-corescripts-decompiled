local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
return function(v6, v7) --[[ Line: 17 ]]
    -- upvalues: v5 (copy), l_AvatarScreen_0 (copy), l_NavigateWithLock_0 (copy)
    return function(v8) --[[ Line: 18 ]]
        -- upvalues: v5 (ref), v6 (copy), l_AvatarScreen_0 (ref), v7 (copy), l_NavigateWithLock_0 (ref)
        v8:dispatch(l_NavigateWithLock_0(function() --[[ Line: 21 ]]
            -- upvalues: v5 (ref), v6 (ref), l_AvatarScreen_0 (ref), v7 (ref)
            v5.closeFiltersAndItemDetails(v6);
            v5.closeTryOnManager(v6);
            v6.navigate(l_AvatarScreen_0.ItemDetails, v7);
        end));
    end;
end;