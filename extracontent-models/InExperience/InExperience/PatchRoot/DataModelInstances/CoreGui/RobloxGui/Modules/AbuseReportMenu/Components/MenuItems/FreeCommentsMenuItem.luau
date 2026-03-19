local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Components.ReportTextEntry);
local v4 = require(l_script_FirstAncestor_0.Components.MenuItems.ReportMenuItem);
local v5 = require(l_script_FirstAncestor_0.Components.Constants);
return function(v6) --[[ Line: 18 ]] --[[ Name: FreeCommentsMenuItem ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), v5 (copy)
    return v2.createElement(v4, {
        label = "Abuse Description", 
        isRightComponentFullWidth = true, 
        layoutOrder = v6.layoutOrder, 
        rightComponent = v2.createElement(v3, {
            layoutOrder = v6.layoutOrder, 
            text = v6.comment, 
            placeholderText = v6.placeholderText, 
            onUpdate = v6.onUpdate
        }), 
        heightOverride = v5.FreeCommentsMenuItemHeight, 
        menuContainerWidth = v6.menuContainerWidth, 
        isSmallPortraitViewport = v6.isSmallPortraitViewport
    });
end;