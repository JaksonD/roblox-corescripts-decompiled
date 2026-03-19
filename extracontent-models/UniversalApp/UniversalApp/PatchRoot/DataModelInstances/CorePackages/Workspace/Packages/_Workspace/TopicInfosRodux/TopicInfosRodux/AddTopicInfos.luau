local l_Parent_0 = script:FindFirstAncestor("TopicInfosRodux").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local _ = require(l_Parent_0.DiscoveryTypes);
return l_makeActionCreator_0(script.Name, function(v3) --[[ Line: 12 ]]
    return {
        topicInfos = v3
    };
end);