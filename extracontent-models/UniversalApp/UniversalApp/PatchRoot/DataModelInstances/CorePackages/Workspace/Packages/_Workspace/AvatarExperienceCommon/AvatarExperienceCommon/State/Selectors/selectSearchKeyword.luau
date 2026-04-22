local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AvatarScreen_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_FFlagUseNavigationSelectors_0 = require(l_Parent_0.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_Parent_0.NavigationRodux).Selectors;
local v5 = require(l_script_FirstAncestor_0.State.Selectors.selectCurrentAvatarRoute);
return function(v6) --[[ Line: 8 ]] --[[ Name: selectSearchKeyword ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v5 (copy), l_AvatarScreen_0 (copy)
    local v7 = if l_FFlagUseNavigationSelectors_0 then v6.Navigation and l_Selectors_0.selectCurrentRoactNavigationRoute(v6) else v6.Navigation and v6.Navigation.currentRoute;
    local v8 = v7 and v7.params and v7.params.searchParams and v7.params.searchParams.searchKeyword;
    if v8 then
        return v8;
    else
        local v9 = v5(v6);
        if v9 and v9.name == l_AvatarScreen_0.CatalogSearch then
            local l_key_0 = v9.key;
            return v6.Search and v6.Search.SearchesInCatalog and v6.Search.SearchesInCatalog[l_key_0] and v6.Search.SearchesInCatalog[l_key_0].keyword;
        else
            return nil;
        end;
    end;
end;