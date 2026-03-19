local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v4 = require(l_Modules_0.AvatarExperience.Common.Context.NamedRefsContext);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
return function() --[[ Line: 20 ]] --[[ Name: useCloseFiltersSignal ]]
    -- upvalues: v2 (copy), v4 (copy), l_AvatarScreen_0 (copy), l_Signal_0 (copy)
    local v6 = v2.useContext(v4)[l_AvatarScreen_0.SortAndFilters .. "-closeSignal"];
    if v6.current == nil then
        v6.current = l_Signal_0.new();
    end;
    return v6.current;
end;