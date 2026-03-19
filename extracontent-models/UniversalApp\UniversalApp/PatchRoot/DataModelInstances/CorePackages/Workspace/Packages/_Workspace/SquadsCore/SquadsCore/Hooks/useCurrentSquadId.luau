local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
useCurrentSquadId = function() --[[ Line: 7 ]] --[[ Name: useCurrentSquadId ]]
    -- upvalues: v1 (copy), l_useSelector_0 (copy)
    local v4 = v1.useCallback(function(v3) --[[ Line: 8 ]]
        if v3.Squad and v3.Squad.Squad and v3.Squad.Squad.currentSquad and v3.Squad.Squad.currentSquad.squadId ~= "" then
            return v3.Squad.Squad.currentSquad.squadId;
        else
            return nil;
        end;
    end, {});
    return (l_useSelector_0(v4));
end;
return useCurrentSquadId;