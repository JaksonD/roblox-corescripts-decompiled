local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local _ = require(l_Parent_0.DiscoveryTypes);
return l_makeActionCreator_0(script.Name, function(v3, v4, v5, v6) --[[ Line: 8 ]]
    return {
        appPage = v3, 
        secondaryKey = v4, 
        feedItemPosition = v5, 
        feedItem = v6
    };
end);