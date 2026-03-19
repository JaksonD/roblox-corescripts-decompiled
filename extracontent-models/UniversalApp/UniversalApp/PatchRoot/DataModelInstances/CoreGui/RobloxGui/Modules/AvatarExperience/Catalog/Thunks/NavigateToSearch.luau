local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v4 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local v7 = require(l_Modules_0.LuaApp.SearchUuid);
local v8 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v9 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
return function(v11, v12) --[[ Line: 24 ]] --[[ Name: NavigateToSearch ]]
    -- upvalues: v7 (copy), v8 (copy), v4 (copy), v5 (copy), v2 (copy), v9 (copy), v10 (copy)
    return function(v13) --[[ Line: 25 ]]
        -- upvalues: v7 (ref), v8 (ref), v4 (ref), v12 (copy), v5 (ref), v2 (ref), v9 (ref), v10 (ref), v11 (copy)
        local v14 = v7();
        v13:dispatch(v8(v14, v4.SearchTypes.Catalog));
        local v15 = v12 or {};
        local v16 = v5.selectSortAndFilters(v13:getState());
        v15 = v2.join(v15, {
            sortAndFilters = v16
        });
        v13:dispatch(v9(v14, v15));
        v10.navigateToSearch(v11, v14, v15);
    end;
end;