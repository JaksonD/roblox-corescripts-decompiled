local l_Parent_0 = script:FindFirstAncestor("ChallengeDialog").Parent;
local v1 = require(l_Parent_0.enumerate);
local v2 = {
    ChallengeDialogApproval = "CHALLENGE_DIALOG_APPROVAL", 
    ChallengeDialogDenied = "CHALLENGE_DIALOG_DENIED", 
    ChallengeDialogExpired = "CHALLENGE_DIALOG_EXPIRED", 
    ChallengeDialogAlreadyCompleted = "CHALLENGE_DIALOG_ALREADY_COMPLETED"
};
return (v1(script.Name, v2));