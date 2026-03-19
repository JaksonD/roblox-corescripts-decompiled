local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
return function(_, v4) --[[ Line: 10 ]] --[[ Name: makeComplianceTokenMapper ]]
    return {
        xButtonSize = v4.Global.Size_450, 
        xLeftPadding = v4.Global.Size_100, 
        paddingTop = v4.Global.Size_700, 
        paddingBottom = v4.Global.Size_600, 
        paddingRight = v4.Global.Size_300, 
        paddingLeft = v4.Global.Size_300, 
        titleSize = v4.Global.FontSize_700, 
        messageSize = v4.Global.FontSize_100, 
        messagePaddingTop = v4.Global.Size_600, 
        messagePaddingTopExtended = v4.Global.Size_900, 
        messagePaddingBottomReduced = v4.Global.Size_300, 
        messagePaddingBottom = v4.Global.Size_600, 
        messagePaddingTopWideView = v4.Global.Size_300, 
        messagePaddingTopWideViewExtended = v4.Global.Size_900, 
        messagePaddingBottomWideView = v4.Global.Size_150, 
        dividerPaddingTop = v4.Global.Size_600, 
        listPaddingBottom = v4.Global.Size_300, 
        checkboxSize = v4.Global.Size_300, 
        checkboxPadding = v4.Global.Size_200, 
        checkboxPaddingBottom = v4.Global.Size_250, 
        agreeButtonHeight = v4.Global.Size_600, 
        agreeButtonPaddingBottom = v4.Global.Size_100
    };
end;