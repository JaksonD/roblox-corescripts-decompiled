local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Components.ChatModalSelector);
local v4 = require(l_script_FirstAncestor_0.Components.MenuItems.ReportMenuItem);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v6) --[[ Line: 22 ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    return v2.createElement(v4, {
        label = v6.label, 
        layoutOrder = v6.layoutOrder, 
        rightComponent = v2.createElement(v3, v6), 
        menuContainerWidth = v6.menuContainerWidth, 
        isSmallPortraitViewport = v6.isSmallPortraitViewport, 
        placeholderText = v6.placeholderText
    });
end;