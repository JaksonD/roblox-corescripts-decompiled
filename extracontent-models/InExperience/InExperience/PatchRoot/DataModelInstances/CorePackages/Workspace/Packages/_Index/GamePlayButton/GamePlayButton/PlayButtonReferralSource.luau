local l_Parent_0 = script:FindFirstAncestor("GamePlayButton").Parent;
local l_FFlagEnablePlayWithRewardComponent_0 = require(l_Parent_0.SharedFlags).FFlagEnablePlayWithRewardComponent;
return {
    ExperienceDetailsLink = "ExperienceDetailsLink", 
    ExperienceAffiliateLink = "ExperienceAffiliateLink", 
    PlayWithReward = l_FFlagEnablePlayWithRewardComponent_0 and "PlayWithReward" or nil
};