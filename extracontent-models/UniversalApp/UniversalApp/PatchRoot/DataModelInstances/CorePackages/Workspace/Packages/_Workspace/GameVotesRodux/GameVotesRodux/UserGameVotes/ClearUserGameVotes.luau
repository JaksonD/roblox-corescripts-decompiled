local l_Parent_0 = script:FindFirstAncestor("GameVotesRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "string", "ClearUserGameVotes: universeId must be a string");
    return {
        universeId = v1
    };
end);