local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXScrollingListAutomaticCanvasSize_0 = v1.FFlagAXScrollingListAutomaticCanvasSize;
local l_FFlagAXMoveCatalogFilterToL1Navigation_0 = v1.FFlagAXMoveCatalogFilterToL1Navigation;
game:DefineFastFlag("AXEnableCategoryPills9", false);
return function() --[[ Line: 8 ]]
    -- upvalues: l_FFlagAXScrollingListAutomaticCanvasSize_0 (copy), l_FFlagAXMoveCatalogFilterToL1Navigation_0 (copy)
    return l_FFlagAXScrollingListAutomaticCanvasSize_0 and l_FFlagAXMoveCatalogFilterToL1Navigation_0 and game:GetFastFlag("AXEnableCategoryPills9");
end;