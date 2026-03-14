local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Components.ModalBasedSelector);
local v4 = require(l_script_FirstAncestor_0.Components.MenuItems.ReportMenuItem);
return function(v5) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    return v2.createElement(v4, {
        label = v5.label, 
        layoutOrder = v5.layoutOrder, 
        rightComponent = v2.createElement(v3, v5), 
        menuContainerWidth = v5.menuContainerWidth, 
        isSmallPortraitViewport = v5.isSmallPortraitViewport, 
        placeholderText = v5.placeholderText
    });
end;