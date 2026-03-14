local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local _ = require(l_CorePackages_0.Workspace.Packages.LeaderboardStore);
local v7 = require(l_CorePackages_0.Packages.SignalsReact);
local v8 = require(l_RobloxGui_0.Modules.GameTranslator);
local l_useLeaderboardStore_0 = v5.Hooks.useLeaderboardStore;
local v10 = require(l_Parent_0.Components.PresentationCommon.TeamEntryView);
local l_FFlagPlayerListFixLeaderstatsStacking_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking;
return v4.memo(function(v12) --[[ Line: 44 ]] --[[ Name: TeamEntryContainer ]]
    -- upvalues: l_useLeaderboardStore_0 (copy), v7 (copy), v8 (copy), l_CoreGui_0 (copy), l_FFlagPlayerListFixLeaderstatsStacking_0 (copy), v4 (copy), v10 (copy)
    local v13 = l_useLeaderboardStore_0().getGameStatsList();
    local l_stats_0 = v12.teamData.stats;
    local v16 = v7.useSignalBinding(function(v15) --[[ Line: 50 ]]
        -- upvalues: v8 (ref), l_CoreGui_0 (ref), v12 (copy)
        return v8:TranslateGameText(l_CoreGui_0, v12.teamData.name(v15));
    end);
    local v17 = v7.useSignalState(v12.teamData.color);
    local v18 = if l_FFlagPlayerListFixLeaderstatsStacking_0 then nil else v7.useSignalState(v13.getCount);
    local v19 = if l_FFlagPlayerListFixLeaderstatsStacking_0 then nil else v7.useSignalState(l_stats_0.getCount);
    return v4.createElement(v10, {
        teamName = v16, 
        teamColor = v17, 
        gameStatsCount = if l_FFlagPlayerListFixLeaderstatsStacking_0 then nil else v18, 
        teamStatsCount = if l_FFlagPlayerListFixLeaderstatsStacking_0 then nil else v19, 
        gameStats = v13, 
        teamStats = l_stats_0, 
        size = v12.size, 
        entrySizeX = v12.entrySizeX, 
        layoutOrder = v12.layoutOrder, 
        isSmallTouchDevice = v12.isSmallTouchDevice, 
        isDirectionalPreferred = v12.isDirectionalPreferred
    });
end);