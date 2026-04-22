local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local v1 = require(l_Parent_0.SignalsReact);
local v2 = require(l_Parent_0.DataHydration);
return function(v3) --[[ Line: 9 ]] --[[ Name: useGameInfo ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useSignalState(v2.Game.getGameInfoStore(false).getGameInfo(v3).data);
end;