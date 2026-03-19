local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    return (v1.getCatalogCategoriesStore().getCategories(false));
end;