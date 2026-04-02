local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.DataHydration);
local v2 = require(l_Parent_0.SignalsReact);
return function(v3) --[[ Line: 9 ]] --[[ Name: useExperienceDetails ]]
    -- upvalues: v2 (copy), v1 (copy)
    return (v2.useSignalState(v1.Game.getGameInfoStore(false).getAndFetchGameInfo(v3).data));
end;