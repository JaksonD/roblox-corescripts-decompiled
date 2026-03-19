local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Components.MenuItems.ReportMenuItem);
return function(v4) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement(v3, {
        label = v4.label, 
        layoutOrder = v4.layoutOrder, 
        rightComponent = v4.button, 
        menuContainerWidth = v4.menuContainerWidth, 
        isSmallPortraitViewport = v4.isSmallPortraitViewport
    });
end;