local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local l_FFlagDebugSquadLogsEnabled_0 = require(l_Parent_0.SharedFlags).FFlagDebugSquadLogsEnabled;
local v2 = require(l_Parent_0.Lumberyak).Logger.new(nil, "SquadsCore");
v2:setContext({
    prefix = "[SquadsCore] - "
});
v2:addSink({
    maxLevel = if l_FFlagDebugSquadLogsEnabled_0 then v2.Levels.Debug else v2.Levels.Warning, 
    log = function(_, v4, _) --[[ Line: 12 ]] --[[ Name: log ]]
        print(v4);
    end
});
return v2;