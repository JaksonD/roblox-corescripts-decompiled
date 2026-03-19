local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, _) --[[ Line: 13 ]]
    return {
        universeId = v1, 
        errorType = v2
    };
end);