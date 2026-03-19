local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetCategoryAndSubcategory);
local l_FFlagAXEditorSubcategoryFilters_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEditorSubcategoryFilters;
return function(v4, v5, v6, v7) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy)
    return function(v8) --[[ Line: 11 ]]
        -- upvalues: v2 (ref), v4 (copy), v5 (copy), l_FFlagAXEditorSubcategoryFilters_0 (ref), v7 (copy), v6 (copy)
        v8:dispatch(v2(v4, v5, if l_FFlagAXEditorSubcategoryFilters_0 then v7 else nil));
        local l_category_0 = v8:getState().AvatarExperience.AvatarEditor.Categories.category;
        local l_subcategory_0 = v8:getState().AvatarExperience.AvatarEditor.Categories.subcategory;
        local l_subcategoryFilter_0 = v8:getState().AvatarExperience.AvatarEditor.Categories.subcategoryFilter;
        v6.clickNavigationTab(l_category_0, l_subcategory_0, l_subcategoryFilter_0);
    end;
end;