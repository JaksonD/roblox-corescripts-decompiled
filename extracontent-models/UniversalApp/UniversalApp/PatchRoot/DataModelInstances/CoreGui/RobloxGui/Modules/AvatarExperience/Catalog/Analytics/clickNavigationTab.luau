local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_IntervalPerformanceTracker_0 = require(l_CorePackages_0.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker;
local v5 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFPSForCatSubCat);
local v6 = require(l_Modules_0.AvatarExperience.Flags.FIntAXFPSDurationForCatSubCat);
local l_TopLevelFPSForCatSubCat_0 = v3.Counter.TopLevelFPSForCatSubCat;
return function(v8, v9, v10, v11) --[[ Line: 18 ]] --[[ Name: analyticsImpl ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), l_IntervalPerformanceTracker_0 (copy), l_TopLevelFPSForCatSubCat_0 (copy), v6 (copy)
    v2.isType(v9, "string", "clickNavigationTab event expects eventContext");
    v2.isType(v10, "string", "clickNavigationTab event expects categoryName");
    v2.isType(v11, "string", "clickNavigationTab event expects subCategoryName");
    local v12 = {
        feature = v3.AnalyticsTag, 
        nav = v10, 
        subNav = v11
    };
    if v5 then
        l_IntervalPerformanceTracker_0:startTracking(l_TopLevelFPSForCatSubCat_0.Catalog, v6, nil, true, true);
    end;
    v8:sendTelemetryEvent(v9, "catalogNavButtonClick", v12);
end;