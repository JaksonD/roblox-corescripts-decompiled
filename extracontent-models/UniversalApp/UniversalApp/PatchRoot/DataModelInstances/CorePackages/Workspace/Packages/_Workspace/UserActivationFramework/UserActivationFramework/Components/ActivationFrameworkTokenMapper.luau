local l_Parent_0 = script:FindFirstAncestor("UserActivationFramework").Parent;
local _ = require(l_Parent_0.RobloxAppHooks);
local _ = require(l_Parent_0.Style);
return function(_, v4) --[[ Line: 21 ]]
    return {
        horizontalPaddingPx = v4.Global.Space_250, 
        verticalPaddingPx = v4.Global.Space_50, 
        headerTopPadding = v4.Global.Space_400, 
        headerIconSize = v4.Semantic.Icon.Size.Medium, 
        footerButtonMarginBetweenPx = v4.Global.Space_100, 
        footerButtonHeightPx = v4.Global.Space_600, 
        footerTopPaddingPx = v4.Global.Space_200, 
        subfooterTopPaddingPx = v4.Global.Space_200, 
        subfooterBottomPaddingPx = v4.Global.Space_125
    };
end;