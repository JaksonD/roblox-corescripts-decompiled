local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3, v4) --[[ Line: 14 ]]
    return {
        groupId = v1, 
        sorts = v2, 
        pageId = v3, 
        sortsTopicLayoutData = v4
    };
end);