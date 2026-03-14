local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
return function() --[[ Line: 16 ]] --[[ Name: useSearchParameters ]]
    -- upvalues: l_useNavigation_0 (copy), l_AvatarScreen_0 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy)
    local v7 = l_useNavigation_0();
    local v8 = if v7.state.routeName == l_AvatarScreen_0.CatalogSearch then v7.getParam("detail") else nil;
    return (l_useSelector_0(function(v9) --[[ Line: 21 ]]
        -- upvalues: v8 (copy)
        if v8 then
            return v9.SearchesParameters[v8];
        else
            return nil;
        end;
    end, l_getUseSelectorDeepEquals_0()));
end;