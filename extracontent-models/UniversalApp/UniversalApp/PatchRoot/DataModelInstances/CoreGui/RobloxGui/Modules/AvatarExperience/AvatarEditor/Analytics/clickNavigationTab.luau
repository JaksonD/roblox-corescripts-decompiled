local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_IntervalPerformanceTracker_0 = require(l_CorePackages_0.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_FFlagAXEditorSubcategoryFilters_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEditorSubcategoryFilters;
local v6 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFPSForCatSubCat);
local v7 = require(l_Modules_0.AvatarExperience.Flags.FIntAXFPSDurationForCatSubCat);
local l_TopLevelFPSForCatSubCat_0 = v4.Counter.TopLevelFPSForCatSubCat;
return function(v9, v10, v11, v12, v13) --[[ Line: 18 ]] --[[ Name: analyticsImpl ]]
    -- upvalues: v2 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy), v4 (copy), v6 (copy), l_IntervalPerformanceTracker_0 (copy), l_TopLevelFPSForCatSubCat_0 (copy), v7 (copy)
    v2.isType(v10, "string", "clickNavigationTab event expects eventContext to be a string");
    v2.isType(v11, "string", "clickNavigationTab event expects categoryName to be a string");
    v2.isType(v12, "string", "clickNavigationTab event expects subCategoryName to be a string");
    if l_FFlagAXEditorSubcategoryFilters_0 then
        v2.isType(v13, "string", "clickNavigationTab event expects subcategoryFilterName to be a string");
    end;
    local v14 = {
        feature = v4.AnalyticsTag, 
        nav = v11, 
        subNav = v12, 
        subNavFilter = if l_FFlagAXEditorSubcategoryFilters_0 then v13 else nil
    };
    if v6 then
        l_IntervalPerformanceTracker_0:startTracking(l_TopLevelFPSForCatSubCat_0.Editor, v7, nil, true, true);
    end;
    v9:sendTelemetryEvent(v10, "avatarEditorNavButtonClick", v14);
end;