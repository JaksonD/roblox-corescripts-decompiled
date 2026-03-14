local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
return function() --[[ Line: 7 ]]
    -- upvalues: l_GetFFlagIsSquadEnabled_0 (copy)
    local v2 = UDim2.new(0, 0, 0, 0);
    local v3 = l_GetFFlagIsSquadEnabled_0() and "Feature.Squads.Label.Party" or "CommonUI.Features.Label.Chat";
    local v4 = {
        on = "icons/menu/2-person-with-bubble-on", 
        off = "icons/menu/2-person-with-bubble"
    };
    return {
        label = v3, 
        icon = v4, 
        badgeOffset = v2
    };
end;