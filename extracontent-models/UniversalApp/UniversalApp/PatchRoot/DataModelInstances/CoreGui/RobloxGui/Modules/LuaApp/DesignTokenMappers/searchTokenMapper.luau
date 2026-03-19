local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
return function(_, v3) --[[ Line: 6 ]] --[[ Name: makeSearchTokenMapper ]]
    local l_Size_250_0 = v3.Global.Size_250;
    local v5 = v3.Global.Space_200 + l_Size_250_0;
    local v6 = l_Size_250_0 + v3.Global.Space_100;
    local l_Size_600_0 = v3.Global.Size_600;
    local l_Size_600_1 = v3.Global.Size_600;
    local l_Space_150_0 = v3.Global.Space_150;
    local v10 = l_Size_600_0 + 85 + l_Size_600_1 + l_Space_150_0 * 2;
    return {
        SearchHeadingScale = 0.8, 
        SearchPaddingHorizontal = v3.Global.Space_300, 
        SearchPaddingVertical = 85, 
        SearchBoxHeight = l_Size_600_0, 
        SearchBoxTextSize = v3.Global.FontSize_200, 
        SearchBoxIconSize = l_Size_250_0, 
        SearchBoxIconPosition = v6, 
        SearchBoxIconPaddingLeft = v5, 
        SearchBoxIconPaddingRight = v3.Global.Space_200, 
        SearchBoxIconPaddingVertical = v3.Global.Space_100, 
        SearchTypePaddingVertical = l_Space_150_0, 
        SearchTypeHeight = l_Size_600_1, 
        SearchBoxAndTypeOffset = v10
    };
end;