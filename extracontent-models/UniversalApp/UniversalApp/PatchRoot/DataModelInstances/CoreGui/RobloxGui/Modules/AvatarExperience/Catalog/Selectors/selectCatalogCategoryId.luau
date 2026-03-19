local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
return function(v2) --[[ Line: 6 ]] --[[ Name: selectCatalogCategoryId ]]
    return v2.AvatarExperience.Catalog.Categories.categoryId;
end;