local l_Parent_0 = script:FindFirstAncestor("RoduxSquads").Parent;
local v1 = require(l_Parent_0.Lumberyak);
local l_FFlagDebugSquadLogsEnabled_0 = require(l_Parent_0.SharedFlags).FFlagDebugSquadLogsEnabled;
local v3 = v1.Logger.new(nil, "RoduxSquads");
v3:setContext({
    prefix = "[RoduxSquads] - "
});
v3:addSink({
    maxLevel = if l_FFlagDebugSquadLogsEnabled_0 then v3.Levels.Debug else v3.Levels.Warning, 
    log = function(_, v5, _) --[[ Line: 13 ]] --[[ Name: log ]]
        print(v5);
    end
});
return v3;