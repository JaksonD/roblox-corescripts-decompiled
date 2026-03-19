local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 12 ]]
    return {
        gameDetails = v1
    };
end);