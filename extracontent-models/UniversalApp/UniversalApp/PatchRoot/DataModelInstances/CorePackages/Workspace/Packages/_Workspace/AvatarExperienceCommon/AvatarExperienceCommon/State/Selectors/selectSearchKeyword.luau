local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AvatarScreen_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.AvatarScreen;
local v3 = require(l_script_FirstAncestor_0.State.Selectors.selectCurrentAvatarRoute);
return function(v4) --[[ Line: 6 ]] --[[ Name: selectSearchKeyword ]]
    -- upvalues: v3 (copy), l_AvatarScreen_0 (copy)
    local v5 = v4.Navigation and v4.Navigation.currentRoute;
    local v6 = v5 and v5.params and v5.params.searchParams and v5.params.searchParams.searchKeyword;
    if v6 then
        return v6;
    else
        local v7 = v3(v4);
        if v7 and v7.name == l_AvatarScreen_0.CatalogSearch then
            local l_key_0 = v7.key;
            return v4.Search and v4.Search.SearchesInCatalog and v4.Search.SearchesInCatalog[l_key_0] and v4.Search.SearchesInCatalog[l_key_0].keyword;
        else
            return nil;
        end;
    end;
end;