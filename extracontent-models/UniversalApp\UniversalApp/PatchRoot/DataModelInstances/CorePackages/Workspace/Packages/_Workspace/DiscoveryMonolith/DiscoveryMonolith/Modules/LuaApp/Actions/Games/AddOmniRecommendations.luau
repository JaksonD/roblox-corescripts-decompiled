local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local _ = require(l_Parent_0.DiscoveryTypes);
return l_makeActionCreator_0(script.Name, function(v3, v4) --[[ Line: 9 ]]
    return {
        recommendations = {
            [v3.pageType] = v3
        }, 
        isAppend = v4
    };
end);