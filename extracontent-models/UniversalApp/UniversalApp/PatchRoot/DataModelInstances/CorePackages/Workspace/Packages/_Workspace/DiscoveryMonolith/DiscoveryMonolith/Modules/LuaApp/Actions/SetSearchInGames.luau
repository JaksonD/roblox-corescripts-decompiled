local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2) --[[ Line: 12 ]]
    return {
        searchUuid = v1, 
        searchInGames = v2
    };
end);