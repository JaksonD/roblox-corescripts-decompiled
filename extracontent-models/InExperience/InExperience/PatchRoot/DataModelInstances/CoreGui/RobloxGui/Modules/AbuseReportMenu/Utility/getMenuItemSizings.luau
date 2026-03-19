local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
getMenuItemSizings = function() --[[ Line: 9 ]] --[[ Name: getMenuItemSizings ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy)
    local v4 = l_useStyle_0();
    return {
        ItemPadding = v4.Tokens.Global.Space_125, 
        DropdownTextSize = v4.Tokens.Global.FontSize_100, 
        FontStyle = v2.ReportMenuFontStyle, 
        ButtonSize = v2.ReportMenuButtonSizeConsole, 
        ButtonInsideVerticalPadding = v4.Tokens.Global.Space_50
    };
end;
return getMenuItemSizings;