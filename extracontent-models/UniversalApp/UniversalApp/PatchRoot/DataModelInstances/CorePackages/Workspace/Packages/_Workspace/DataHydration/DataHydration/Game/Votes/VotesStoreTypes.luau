local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v3 = require(l_Parent_0.t);
local _ = require(l_Parent_0.Signals);
local v5 = {
    PlayGame = "PlayGame", 
    FloodCheckThresholdMet = "FloodCheckThresholdMet", 
    AssetNotVoteable = "AssetNotVoteable"
};
local v6 = v3.interface({
    id = v3.number, 
    upVotes = v3.number, 
    downVotes = v3.number
});
local v7 = v3.interface({
    data = v3.array(v6)
});
local v8 = v3.interface({
    userVote = v3.optional(v3.boolean), 
    canVote = v3.boolean, 
    reasonForNotVoteable = v3.optional(v3.string)
});
return {
    votesResponseValidator = v7, 
    userVoteResponseValidator = v8, 
    ReasonNotVoteable = v5, 
    PLAY_GAME_ERROR_CODE = 6
};