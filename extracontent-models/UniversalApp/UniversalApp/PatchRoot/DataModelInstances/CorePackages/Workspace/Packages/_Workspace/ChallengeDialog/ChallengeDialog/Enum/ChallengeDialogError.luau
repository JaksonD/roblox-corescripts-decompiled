local l_Parent_0 = script:FindFirstAncestor("ChallengeDialog").Parent;
local v1 = require(l_Parent_0.enumerate);
local v2 = {
    Unknown = 1, 
    TokenUnavailable = 2, 
    StateNotUpdated = 3, 
    InconsistentStateTransition = 4, 
    BadRequest = 5
};
return (v1(script.Name, v2));