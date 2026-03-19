local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3, v4, v5) --[[ Line: 7 ]]
    return {
        searchUuid = v1, 
        topicId = v2, 
        treatmentType = v3, 
        sortIndex = v4, 
        topicLayoutData = v5
    };
end);