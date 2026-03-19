local l_Parent_0 = script:FindFirstAncestor("GameVotesRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 11 ]]
    assert(type(v1) == "string", "SetGameVotes: universeId must be a string");
    assert(type(v2) == "number", "SetGameVotes: upVotes must be a number");
    assert(type(v3) == "number", "SetGameVotes: downVotes must be a number");
    return {
        universeId = v1, 
        upVotes = v2, 
        downVotes = v3
    };
end);