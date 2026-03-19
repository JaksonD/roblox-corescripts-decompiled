local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2) --[[ Line: 6 ]]
    return {
        universeId = v1, 
        ageRecommendationDetails = v2
    };
end);