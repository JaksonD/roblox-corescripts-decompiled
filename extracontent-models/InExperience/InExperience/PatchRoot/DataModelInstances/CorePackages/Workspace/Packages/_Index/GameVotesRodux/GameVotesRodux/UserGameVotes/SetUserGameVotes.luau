local l_Parent_0 = script:FindFirstAncestor("GameVotesRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3, v4) --[[ Line: 12 ]]
    assert(type(v1) == "string", "SetUserGameVotes: universeId must be a string");
    assert(type(v2) == "boolean", "SetUserGameVotes: canVote must be a boolean");
    assert(type(v3) == "string", "SetUserGameVotes: userVote must be a string");
    assert(type(v4) == "string", "SetUserGameVotes: reasonForNotVoteable must be a string");
    return {
        universeId = v1, 
        canVote = v2, 
        userVote = v3, 
        reasonForNotVoteable = v4
    };
end);