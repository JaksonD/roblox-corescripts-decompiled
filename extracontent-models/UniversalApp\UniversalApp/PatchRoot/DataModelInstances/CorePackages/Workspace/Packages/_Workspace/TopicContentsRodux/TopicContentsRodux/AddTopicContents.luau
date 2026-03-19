local l_Parent_0 = script:FindFirstAncestor("TopicContentsRodux").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local _ = require(l_Parent_0.DiscoveryTypes);
return l_makeActionCreator_0(script.Name, function(v3, v4, v5) --[[ Line: 8 ]]
    return {
        topicKey = v3, 
        topicContents = v4, 
        isAppend = v5
    };
end);