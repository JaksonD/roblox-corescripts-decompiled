local v0 = require(script.GameDetails);
local v1 = require(script.GamesByPlaceId);
local v2 = require(script.GetGameNameAndDescription);
local v3 = require(script.FetchGamePlayabilityAndProductInfo);
local v4 = require(script.FetchUserSettingsAndOptions);
local v5 = require(script.AgeRecommendations);
local v6 = require(script.ExperienceDetails);
return {
    AgeRecommendations = v5, 
    ExperienceDetails = v6, 
    FetchGamePlayabilityAndProductInfo = v3, 
    FetchUserSettingsAndOptions = v4, 
    GameDetails = v0, 
    GamesByPlaceId = v1, 
    GetGameNameAndDescription = v2, 
    ["jest.config"] = script["jest.config"]
};