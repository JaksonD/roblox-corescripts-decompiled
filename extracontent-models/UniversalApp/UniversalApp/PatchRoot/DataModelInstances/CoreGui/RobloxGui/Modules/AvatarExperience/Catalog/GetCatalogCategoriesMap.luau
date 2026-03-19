local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_FFlagAXCatalogCategoriesStore_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesStore;
local function v13() --[[ Line: 15 ]] --[[ Name: buildCategoriesMap ]]
    -- upvalues: v3 (copy)
    local v6 = v3();
    local v7 = {};
    for _, v9 in v6 do
        if v9.Id then
            if v9.Subcategories then
                local v10 = {};
                for _, v12 in v9.Subcategories do
                    if v12.Id then
                        v10[v12.Id] = v12;
                    end;
                end;
                v9.SubcategoriesMap = v10;
            end;
            v7[v9.Id] = v9;
        end;
    end;
    return v7;
end;
local v14 = nil;
if l_FFlagAXCatalogCategoriesStore_0 then
    return function() --[[ Line: 42 ]]
        -- upvalues: v4 (copy)
        return v4.getCatalogCategoriesStore().getCategoriesMap(false) or {};
    end;
else
    return function() --[[ Line: 48 ]]
        -- upvalues: v14 (ref), v13 (copy)
        if not v14 then
            v14 = v13();
        end;
        return v14;
    end;
end;