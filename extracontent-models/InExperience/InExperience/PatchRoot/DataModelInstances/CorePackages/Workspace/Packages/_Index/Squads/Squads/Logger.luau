local l_Parent_0 = script:FindFirstAncestor("Squads").Parent;
local l_FFlagDebugSquadLogsEnabled_0 = require(l_Parent_0.SharedFlags).FFlagDebugSquadLogsEnabled;
local v2 = require(l_Parent_0.Lumberyak).Logger.new(nil, "Squads");
v2:setContext({
    prefix = "[Squads] - "
});
v2:addSink({
    maxLevel = if l_FFlagDebugSquadLogsEnabled_0 then v2.Levels.Debug else v2.Levels.Warning, 
    log = function(_, v4, _) --[[ Line: 11 ]] --[[ Name: log ]]
        print(v4);
    end
});
return v2;