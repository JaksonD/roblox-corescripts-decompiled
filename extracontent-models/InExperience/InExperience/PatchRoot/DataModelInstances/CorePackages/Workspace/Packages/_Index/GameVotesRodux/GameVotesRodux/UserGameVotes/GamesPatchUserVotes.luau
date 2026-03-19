local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameVotesRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v4 = require(l_script_FirstAncestor_0.Enums.VoteStatus);
local v5 = {
    [v4.VotedUp] = true, 
    [v4.VotedDown] = false, 
    [v4.NotVoted] = "null"
};
return function(v6, v7, v8) --[[ Line: 22 ]]
    -- upvalues: v5 (copy), l_Url_0 (copy), l_HttpService_0 (copy)
    assert(type(v7) == "string", "GamesPatchUserVotes request expects universeId to be a string");
    local v9 = v5[v8];
    assert(v9 ~= nil, "GamesPatchUserVotes request expects a valid vote");
    return v6(string.format("%sv1/games/%s/user-votes", l_Url_0.GAME_URL, v7), "PATCH", {
        postBody = l_HttpService_0:JSONEncode({
            vote = v9
        })
    });
end;