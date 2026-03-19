local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetCategoryAndSubcategory);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.NavigatedToDeepLinkAvatarEditor);
local l_FFlagAXEditorSubcategoryFilters_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEditorSubcategoryFilters;
local v8 = {
    category = 1, 
    subcategory = 1, 
    subcategoryFilter = l_FFlagAXEditorSubcategoryFilters_0 and 1 or nil, 
    subButton = 1
};
return v3.createReducer(v8, {
    [v5.name] = function(v9, v10) --[[ Line: 31 ]]
        -- upvalues: v4 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy)
        return v4.Dictionary.join(v9, {
            category = v10.category or v9.category, 
            subcategory = v10.subcategory or 1, 
            subcategoryFilter = if l_FFlagAXEditorSubcategoryFilters_0 then v10.subcategoryFilter or 1 else nil, 
            subButton = 1
        });
    end, 
    [v6.name] = function(v11, v12) --[[ Line: 41 ]]
        -- upvalues: v4 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy)
        return v4.Dictionary.join(v11, {
            category = v12.category or v11.category, 
            subcategory = v12.subcategory or 1, 
            subcategoryFilter = if l_FFlagAXEditorSubcategoryFilters_0 then v12.subcategoryFilter or 1 else nil, 
            subButton = 1
        });
    end
});