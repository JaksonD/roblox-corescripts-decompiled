local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
return require(l_Parent_0.Rodux).makeActionCreator("UpdateGameMedia", function(v1, v2) --[[ Line: 5 ]]
    return {
        universeId = v1, 
        entries = v2
    };
end);