local v0 = require(script.InAppAchievementManager);
local v1 = require(script.InExpAchievementManager);
local v2 = require(script.Reducers.LocalUserGameVoteCounter);
local v3 = require(script.Requests.GetUserRecentExperiences);
local v4 = require(script.Requests.GetUserVoteCount);
local v5 = require(script.Requests.GetXboxLoginConsecutiveDays);
return {
    InAppAchievementManager = v0, 
    InExpAchievementManager = v1, 
    Reducers = {
        LocalUserGameVoteCounter = v2
    }, 
    Requests = {
        GetUserRecentExperiences = v3, 
        GetUserVoteCount = v4, 
        GetXboxLoginConsecutiveDays = v5
    }, 
    ["jest.config"] = script["jest.config"]
};