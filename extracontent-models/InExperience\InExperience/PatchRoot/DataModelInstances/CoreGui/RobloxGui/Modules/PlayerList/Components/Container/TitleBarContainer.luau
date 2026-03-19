local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.SignalsReact);
local v4 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local _ = require(l_CorePackages_0.Workspace.Packages.LeaderboardStore);
local l_useLeaderboardStore_0 = v4.Hooks.useLeaderboardStore;
local v7 = require(l_Parent_0.Components.PresentationCommon.TitleBarView);
local l_FFlagPlayerListFixLeaderstatsStacking_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking;
return v2.memo(function(v9) --[[ Line: 41 ]] --[[ Name: TitleBarContainer ]]
    -- upvalues: l_useLeaderboardStore_0 (copy), l_FFlagPlayerListFixLeaderstatsStacking_0 (copy), v3 (copy), v2 (copy), v7 (copy)
    local v10 = l_useLeaderboardStore_0().getGameStatsList();
    local v11 = if l_FFlagPlayerListFixLeaderstatsStacking_0 then nil else v3.useSignalState(v10.getCount);
    return v2.createElement(v7, {
        gameStats = v10, 
        gameStatsCount = if l_FFlagPlayerListFixLeaderstatsStacking_0 then nil else v11, 
        size = v9.size, 
        entrySizeX = v9.entrySizeX, 
        layoutOrder = v9.layoutOrder, 
        contentsVisible = v9.contentsVisible, 
        isSmallTouchDevice = v9.isSmallTouchDevice, 
        showDivider = v9.showDivider, 
        showBackground = v9.showBackground, 
        backgroundTransparency = v9.backgroundTransparency, 
        useCustomTextColor = v9.useCustomTextColor, 
        customTextColor = v9.customTextColor, 
        headerPaddingLeft = v9.headerPaddingLeft
    });
end);