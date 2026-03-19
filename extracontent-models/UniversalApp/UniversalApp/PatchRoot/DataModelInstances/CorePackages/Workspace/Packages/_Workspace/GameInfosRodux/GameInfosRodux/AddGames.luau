local l_Parent_0 = script:FindFirstAncestor("GameInfosRodux").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local _ = require(l_Parent_0.DiscoveryTypes);
return l_makeActionCreator_0(script.Name, function(v3) --[[ Line: 9 ]]
    assert(type(v3) == "table", string.format("AddGames action expects games to be a table, was %s", (type(v3))));
    return {
        games = v3
    };
end);