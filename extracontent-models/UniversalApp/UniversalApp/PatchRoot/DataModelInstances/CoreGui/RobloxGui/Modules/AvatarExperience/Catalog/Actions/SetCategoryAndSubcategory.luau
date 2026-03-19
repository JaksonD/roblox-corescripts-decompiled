local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v1.makeActionCreator("Catalog-" .. script.Name, function(v3, v4) --[[ Line: 5 ]]
    -- upvalues: v2 (copy)
    v2.isTypeOrNil(v3, "string", "SetCategoryAndSubcategory thunk expects category");
    v2.isTypeOrNil(v4, "string", "SetCategoryAndSubcategory thunk expects subcategory");
    return {
        category = v3, 
        subcategory = v4
    };
end);