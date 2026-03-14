local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_FIntScaleBrazilContentRatingBadge_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntScaleBrazilContentRatingBadge;
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: makeLandingViewTokenMapper ]]
    -- upvalues: l_FIntScaleBrazilContentRatingBadge_0 (copy), l_UiMode_0 (copy)
    local v7 = {
        buttonTextSize = v6.Global.FontSize_200, 
        buttonWidth = 360, 
        buttonHeight = 48, 
        contentPadding = 20, 
        brazilBadgeHeight = 1.3 * l_FIntScaleBrazilContentRatingBadge_0
    };
    if v5.uiMode == l_UiMode_0.TenFoot then
        v7.buttonWidth = 846;
        v7.buttonHeight = v6.Global.Size_600;
        v7.contentPadding = v6.Global.Size_400;
    end;
    return v7;
end;