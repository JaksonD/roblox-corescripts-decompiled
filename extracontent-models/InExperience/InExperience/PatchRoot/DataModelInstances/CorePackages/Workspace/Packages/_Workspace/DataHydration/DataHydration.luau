local v0 = require(script.DataHydrationTypes);
local v1 = require(script.Badges);
local v2 = require(script.Game);
local v3 = require(script.TrustedConnections);
local v4 = require(script.Profile);
local v5 = require(script.Creator);
local v6 = require(script.SocialLink);
local v7 = require(script.ExperienceEvents);
local v8 = require(script.MediaAsset);
local v9 = require(script.DataHydrationUtils);
return {
    ["jest.config"] = script["jest.config"], 
    createDataResolver = require(script.createDataResolver), 
    createDataCache = require(script.createDataCache), 
    DataHydrationTypes = v0, 
    DataHydrationUtils = v9, 
    Badges = v1, 
    Game = v2, 
    Creator = v5, 
    MediaAsset = v8, 
    SocialLink = v6, 
    ExperienceEvents = v7, 
    TrustedConnections = v3, 
    Profile = v4, 
    DataStatus = v0.DataStatus
};