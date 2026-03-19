local l_Parent_0 = script:FindFirstAncestor("DiscoveryUtils").Parent;
local l_SearchTypes_0 = require(l_Parent_0.RobloxAppEnums).SearchTypes;
return function(v2) --[[ Line: 4 ]] --[[ Name: isSearchTypeInOmniSearch ]]
    -- upvalues: l_SearchTypes_0 (copy)
    if v2 == l_SearchTypes_0.Games or v2 == l_SearchTypes_0.Players or v2 == l_SearchTypes_0.Auto or v2 == l_SearchTypes_0.TopResults then
        return true;
    else
        return false;
    end;
end;