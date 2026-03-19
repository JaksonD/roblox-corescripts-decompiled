local l_Parent_0 = script:FindFirstAncestor("RoduxSquads").Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function() --[[ Line: 5 ]] --[[ Name: useCurrentSquadSelector ]]
    -- upvalues: l_useSelector_0 (copy)
    return (l_useSelector_0(function(v2) --[[ Line: 6 ]]
        return v2.Squad and v2.Squad.Squad and v2.Squad.Squad.currentSquad;
    end));
end;