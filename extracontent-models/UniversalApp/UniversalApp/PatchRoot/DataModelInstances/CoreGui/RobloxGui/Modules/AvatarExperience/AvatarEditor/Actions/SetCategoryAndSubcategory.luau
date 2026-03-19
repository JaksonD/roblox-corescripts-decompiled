local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_FFlagAXEditorSubcategoryFilters_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEditorSubcategoryFilters;
return v1.makeActionCreator("Avatar-" .. script.Name, function(v4, v5, v6) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy)
    v2.isTypeOrNil(v4, "number", "SetCategoryAndSubCategory expects category");
    v2.isTypeOrNil(v5, "number", "SetCategoryAndSubCategory expects subcategory");
    if l_FFlagAXEditorSubcategoryFilters_0 then
        v2.isTypeOrNil(v6, "number", "SetCategoryAndSubCategory expects subcategoryFilter");
    end;
    return {
        category = v4, 
        subcategory = v5, 
        subcategoryFilter = if l_FFlagAXEditorSubcategoryFilters_0 then v6 else nil
    };
end);