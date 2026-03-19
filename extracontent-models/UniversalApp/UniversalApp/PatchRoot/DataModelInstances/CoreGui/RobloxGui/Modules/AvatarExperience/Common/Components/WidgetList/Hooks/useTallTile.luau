local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CatalogCategories_0 = v1.Enums.CatalogCategories;
local l_CatalogSubcategories_0 = v1.Enums.CatalogSubcategories;
useTallTile = function(_, v5, v6) --[[ Line: 8 ]] --[[ Name: useTallTile ]]
    -- upvalues: l_CatalogCategories_0 (copy), l_CatalogSubcategories_0 (copy)
    local v7 = true;
    if v5 ~= l_CatalogCategories_0.AllAnimations:rawValue() then
        v7 = true;
        if v5 ~= l_CatalogCategories_0.Characters:rawValue() then
            v7 = true;
            if v5 ~= l_CatalogCategories_0.Avatars:rawValue() then
                v7 = v6 == l_CatalogSubcategories_0.FullBodies:rawValue();
            end;
        end;
    end;
    return v7;
end;
return useTallTile;