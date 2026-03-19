local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local _ = require(l_Parent_0.DiscoveryTypes);
return l_makeActionCreator_0(script.Name, function(v3, v4, v5) --[[ Line: 9 ]]
    return {
        groupId = v3, 
        filters = v4, 
        updatedTimestamp = v5
    };
end);