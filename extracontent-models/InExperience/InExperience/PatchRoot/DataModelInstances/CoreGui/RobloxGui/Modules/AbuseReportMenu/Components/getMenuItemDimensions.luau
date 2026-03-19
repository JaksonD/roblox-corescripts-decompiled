local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
getMenuItemDimensions = function(v4) --[[ Line: 8 ]] --[[ Name: getMenuItemDimensions ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy)
    local v5 = l_useStyle_0();
    if v4 < v2.SmallLayoutThreshold then
        return {
            LeftWidth = v2.LeftContainerWidthSmall, 
            RightWidth = v2.RightContainerWidthSmall, 
            TextSize = v2.FieldLabelSizeSmall
        };
    else
        return {
            LeftWidth = v5.Tokens.Global.Space_1000 * 3, 
            RightWidth = v5.Tokens.Global.Space_1000 * 4, 
            TextSize = v5.Tokens.Global.FontSize_100
        };
    end;
end;
return getMenuItemDimensions;