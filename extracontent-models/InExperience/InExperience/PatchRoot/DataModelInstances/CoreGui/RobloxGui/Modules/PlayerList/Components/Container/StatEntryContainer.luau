local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.GameTranslator);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.Signals);
local v7 = require(l_CorePackages_0.Packages.SignalsReact);
local v8 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local _ = require(l_CorePackages_0.Workspace.Packages.LeaderboardStore);
local l_useLeaderboardStore_0 = v8.Hooks.useLeaderboardStore;
local l_StatEntryView_0 = v8.Presentation.StatEntryView;
return v4.memo(function(v12) --[[ Line: 43 ]] --[[ Name: StatEntryContainer ]]
    -- upvalues: l_useLeaderboardStore_0 (copy), v4 (copy), v3 (copy), l_CoreGui_0 (copy), v7 (copy), v6 (copy), v5 (copy), l_StatEntryView_0 (copy)
    local v13 = l_useLeaderboardStore_0().getGameStatsList().getData(v12.statName, false);
    local v14 = v4.useMemo(function() --[[ Line: 48 ]]
        -- upvalues: v3 (ref), l_CoreGui_0 (ref), v12 (copy)
        return v3:TranslateGameText(l_CoreGui_0, v12.statName);
    end, {
        v12.statName
    });
    local v16 = v7.useSignalBinding(v6.createComputed(function(v15) --[[ Line: 52 ]]
        -- upvalues: v12 (copy)
        if v12.stat then
            return (v12.stat(v15));
        else
            return "-";
        end;
    end));
    local v18 = v7.useSignalBinding(v6.createComputed(function(v17) --[[ Line: 55 ]]
        -- upvalues: v13 (copy)
        if v13 then
            return (v13.order(v17));
        else
            return 1e999;
        end;
    end));
    local v19 = {
        statName = v14, 
        statValue = v16, 
        layoutOrder = v18
    };
    local v20 = v5.Dictionary.join(v19, v12);
    return v4.createElement(l_StatEntryView_0, v20);
end);